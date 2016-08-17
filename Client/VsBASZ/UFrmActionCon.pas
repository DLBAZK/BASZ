/// <summary>
/// 病案流转动作自定义配置
/// </summary>
/// <author>jdl</author>
///<date>2016-08-15</date>
unit UFrmActionCon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBListForm, DBGridEhGrouping, PrnDbgeh, DB, ActnList,
  DBClient, UDlClientDataset, DosMove, AdvPanel, AdvAppStyler, AdvToolBar,
  AdvToolBarStylers, AdvOfficeStatusBar, AdvOfficeStatusBarStylers, GridsEh,
  DBGridEh, ExtCtrls, AdvGlowButton,UVsMidClassList;

type
  TfrmActionCon = class(TFrmSuiDBListForm)
    btnUp: TAdvGlowButton;
    actUp: TAction;
    actDown: TAction;
    btnDown: TAdvGlowButton;
    procedure DLCDSAfterInsert(DataSet: TDataSet);
    procedure actUpExecute(Sender: TObject);
    procedure actDownExecute(Sender: TObject);
  private
    { Private declarations }
    /// <summary>
    /// 设置动作的执行顺序
    /// </summary>
    /// <param name="Flag">0:上移 1：下移</param>
    procedure ConfigPriority(const Flag:Integer);
  public
    { Public declarations }
    constructor Create(Aowner:TComponent); override;
  end;

var
  frmActionCon: TfrmActionCon;

implementation
  uses UGFun,UMidProxy,UCommon;
{$R *.dfm}

{ TfrmActionCon }


{ TfrmActionCon }

procedure TfrmActionCon.actDownExecute(Sender: TObject);
begin
  inherited;
  ConfigPriority(1);
end;

procedure TfrmActionCon.actUpExecute(Sender: TObject);
begin
  inherited;
  ConfigPriority(0);
end;

procedure TfrmActionCon.ConfigPriority(const Flag: Integer);
var
  book:Pointer;
  CurrentNum,PriorityNum:Integer;  //当前行的顺序号、前一行记录的顺序号、
  DM:string;
begin
  if DLCDS.Active and (not dlcds.IsEmpty) then
  begin
   //获取当前标记
    book := dlcds.GetBookmark;
    
    if dlcds.State in [dsInsert,dsEdit] then
      dlcds.Post;

    with dlcds do
    begin
      DisableControls;
      CurrentNum := FieldByName('prioritynum').AsInteger;
      DM :=  FieldByName('DM').AsString;
      
      case flag of
        0:  //上移
        begin
          if Bof then Exit;

          Locate('prioritynum',CurrentNum-1,[loCaseInsensitive,loPartialKey]) ;
        end;
        1: //下移
        begin
          if Eof then Exit;
          
          Locate('prioritynum',CurrentNum+1,[loCaseInsensitive,loPartialKey]) ;
        end;
      end;
      PriorityNum := FieldByName('prioritynum').AsInteger ;
      Edit;
      FieldByName('prioritynum').AsInteger := CurrentNum;


      Locate('prioritynum;DM',VarArrayOf([CurrentNum,DM]),[loCaseInsensitive,loPartialKey]) ;
      Edit;
      FieldByName('prioritynum').AsInteger := PriorityNum;

      EnableControls;
      SetDBGridEhSort(dbgrdh_DLCDS);
    end;
  end;
end;

constructor TfrmActionCon.Create(Aowner: TComponent);
const
  SQL = 'SELECT  * FROM SZActionCon ORDER BY PriorityNum ';
begin
  inherited Create(Aowner,EuSZActionCon,SQL);
  
  //加载动作默认字典库
  FillDBGridEHCombobox('select * from SZActionDic',dbgrdh_DLCDS,'ActionDicDM','dm','mc');
end;

procedure TfrmActionCon.DLCDSAfterInsert(DataSet: TDataSet);
const
 sql =' SELECT ISNULL(MAX(prioritynum),0) prioritynum   FROM SZActionCon ';
var
  num:Integer;
  clienttmp:TClientDataSet;
begin
  inherited;
  clienttmp := TClientDataSet.Create(nil);
  AutoFree(clienttmp);
  TMidProxy.SqlOpen(sql,clienttmp);
  if clienttmp.Active and (not clienttmp.IsEmpty)then
  begin
    num := clienttmp.FieldByName('prioritynum').AsInteger;
  end
  else
    num := 1;
  dlcds.Edit;
  DLCDS.FieldByName('prioritynum').AsInteger := num+1;
end;

initialization
   classes.RegisterClass(TfrmActionCon);
finalization
  Classes.UnRegisterClass(TfrmActionCon);

end.
