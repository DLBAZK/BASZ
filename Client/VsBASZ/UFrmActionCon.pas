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
  DBGridEh, ExtCtrls, AdvGlowButton,UVsMidClassList,StrUtils;

type
  TfrmActionCon = class(TFrmSuiDBListForm)
    btnUp: TAdvGlowButton;
    actUp: TAction;
    actDown: TAction;
    btnDown: TAdvGlowButton;
    procedure DLCDSAfterInsert(DataSet: TDataSet);
    procedure actUpExecute(Sender: TObject);
    procedure actDownExecute(Sender: TObject);
    procedure acInsExecute(Sender: TObject);
    procedure dbgrdh_DLCDSColumns4UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
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
    /// <summary>
    /// 数据校验
    /// </summary>
    Procedure CheckData;override;
  end;

var
  frmActionCon: TfrmActionCon;

implementation
  uses UGFun,UMidProxy,UCommon,UFrmActionDic;
{$R *.dfm}

{ TfrmActionCon }


{ TfrmActionCon }

procedure TfrmActionCon.acInsExecute(Sender: TObject);
var
  frmAction:TfrmActionDic;
  clienttmp:TClientDataSet;
  dicDM:string;
begin
  SetSbSimpleText('');
  inherited;
  frmAction := TfrmActionDic.Create(nil);
  AutoFree(frmAction);
  try
    if frmAction.ShowModal=mrOk then
    begin
      if (frmAction.actionDM='101') or (frmAction.actionDM='105' ) then
      begin
        clienttmp :=TClientDataSet.Create(nil);
        AutoFree(clienttmp);
        clienttmp.CloneCursor(TCustomClientDataSet(DLCDS),True);
        clienttmp.IndexFieldNames := 'ActionDicDM';
        if clienttmp.FindKey([frmAction.actionDM]) then
        begin
          SetSbSimpleText('动作已经配置，无需再配置');
          dlcds.Delete;
          Exit;
        end;
      end;
      dicDM := frmAction.actionDM;

      dlcds.Edit;
      dlcds.FieldByName('ActionDicDM').AsString :=dicDM;
      //控制接收和上架的代码
      if dicDM ='101' then
        DLCDS.FieldByName('dm').AsString := '1111'
      else if dicDM ='105' then
        DLCDS.FieldByName('dm').AsString := '9999';
      
    end
    else
    begin
      //未选择动作，不能添加新行
      DLCDS.Delete;
    end;
  except
    on ex:Exception do
    begin
      WriteErrorLog('添加指定动作出现异常；'+ex.Message);
    end;
  end;

end;

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

procedure TfrmActionCon.CheckData;
begin
  if dlcds.FieldByName('DM').AsString ='' then
  begin
    raise Exception.Create('动作代码不能为空');
  end;
  if dlcds.FieldByName('mc').AsString ='' then
  begin
    raise Exception.Create('动作名称不能为空');
  end;
  //动作代码必须以1开头
  if LeftStr(dlcds.FieldByName('DM').AsString,1)<>'1' then
  begin
    raise Exception.Create('动作代码必须以1开头');
  end;

end;

procedure TfrmActionCon.ConfigPriority(const Flag: Integer);
const
  SQL='select * from SZActionRecord WHERE ActionDM= ^%s^';
var
  book:Pointer;
  CurrentNum,PriorityNum:Integer;  //当前行的顺序号、前一行记录的顺序号、
  DM,Dicdm:string;
begin
  if DLCDS.Active and (not dlcds.IsEmpty) then
  begin
   //获取当前标记
    book := dlcds.GetBookmark;

    if dlcds.State in [dsInsert,dsEdit] then
      dlcds.Post;

    with dlcds do
    begin
      if FieldByName('bz').AsInteger=1 then
      begin
        ShowMsgSure('动作已被停用，不能移动!');
        Exit;
      end;
      //当前优先级
      CurrentNum := FieldByName('prioritynum').AsInteger;
      //当前动作代码
      DM :=  FieldByName('DM').AsString;
      Dicdm :=FieldByName('ActionDicdm').AsString;
      if (Dicdm ='101') or (Dicdm ='105')  then
      begin
        ShowMsgSure('当前动作不能移动');
        Exit;
      end;
      //已使用的动作不能修改
      if ExistsRecord(Format(sql,[dm])) then
      begin
        ShowMsgSure('动作已被使用不能修改');
        Exit;
      end;    
      DisableControls;
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
      //保证第一个动作和最后一个动作必须是接收和上架
      Dicdm := FieldByName('ActionDicdm').AsString;
      if (Dicdm <>'101') and (Dicdm <>'105') then
      begin
         //上一步或下一步的优先级
        PriorityNum := FieldByName('prioritynum').AsInteger ;
        Edit;
        FieldByName('prioritynum').AsInteger := CurrentNum;

        //定位
        Locate('prioritynum;DM',VarArrayOf([CurrentNum,DM]),[loCaseInsensitive,loPartialKey]) ;
        Edit;
        FieldByName('prioritynum').AsInteger := PriorityNum;
      end
      else
      //鼠标定位到需移动的数据行
        Locate('prioritynum;DM',VarArrayOf([CurrentNum,DM]),[loCaseInsensitive,loPartialKey]) ;
      
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

procedure TfrmActionCon.dbgrdh_DLCDSColumns4UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  inherited;
  if Value =1  then
  begin
    //接收和上架动作不能停用
    if (dlcds.FieldByName('actiondicdm').AsString='101') or
     (dlcds.FieldByName('actiondicdm').AsString='105') then
    begin
      Value:=0;
      ShowMsgSure('该动作不能停用!');
    end;
  end;
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
  DLCDS.FieldByName('BZ').AsInteger := 0;
end;

initialization
   classes.RegisterClass(TfrmActionCon);
finalization
  Classes.UnRegisterClass(TfrmActionCon);

end.
