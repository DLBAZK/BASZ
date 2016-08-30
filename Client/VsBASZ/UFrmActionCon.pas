/// <summary>
/// ������ת�����Զ�������
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
    /// ���ö�����ִ��˳��
    /// </summary>
    /// <param name="Flag">0:���� 1������</param>
    procedure ConfigPriority(const Flag:Integer);
  public
    { Public declarations }
    constructor Create(Aowner:TComponent); override;
    /// <summary>
    /// ����У��
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
          SetSbSimpleText('�����Ѿ����ã�����������');
          dlcds.Delete;
          Exit;
        end;
      end;
      dicDM := frmAction.actionDM;

      dlcds.Edit;
      dlcds.FieldByName('ActionDicDM').AsString :=dicDM;
      //���ƽ��պ��ϼܵĴ���
      if dicDM ='101' then
        DLCDS.FieldByName('dm').AsString := '1111'
      else if dicDM ='105' then
        DLCDS.FieldByName('dm').AsString := '9999';
      
    end
    else
    begin
      //δѡ�����������������
      DLCDS.Delete;
    end;
  except
    on ex:Exception do
    begin
      WriteErrorLog('���ָ�����������쳣��'+ex.Message);
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
    raise Exception.Create('�������벻��Ϊ��');
  end;
  if dlcds.FieldByName('mc').AsString ='' then
  begin
    raise Exception.Create('�������Ʋ���Ϊ��');
  end;
  //�������������1��ͷ
  if LeftStr(dlcds.FieldByName('DM').AsString,1)<>'1' then
  begin
    raise Exception.Create('�������������1��ͷ');
  end;

end;

procedure TfrmActionCon.ConfigPriority(const Flag: Integer);
const
  SQL='select * from SZActionRecord WHERE ActionDM= ^%s^';
var
  book:Pointer;
  CurrentNum,PriorityNum:Integer;  //��ǰ�е�˳��š�ǰһ�м�¼��˳��š�
  DM,Dicdm:string;
begin
  if DLCDS.Active and (not dlcds.IsEmpty) then
  begin
   //��ȡ��ǰ���
    book := dlcds.GetBookmark;

    if dlcds.State in [dsInsert,dsEdit] then
      dlcds.Post;

    with dlcds do
    begin
      if FieldByName('bz').AsInteger=1 then
      begin
        ShowMsgSure('�����ѱ�ͣ�ã������ƶ�!');
        Exit;
      end;
      //��ǰ���ȼ�
      CurrentNum := FieldByName('prioritynum').AsInteger;
      //��ǰ��������
      DM :=  FieldByName('DM').AsString;
      Dicdm :=FieldByName('ActionDicdm').AsString;
      if (Dicdm ='101') or (Dicdm ='105')  then
      begin
        ShowMsgSure('��ǰ���������ƶ�');
        Exit;
      end;
      //��ʹ�õĶ��������޸�
      if ExistsRecord(Format(sql,[dm])) then
      begin
        ShowMsgSure('�����ѱ�ʹ�ò����޸�');
        Exit;
      end;    
      DisableControls;
      case flag of
        0:  //����
        begin
          if Bof then Exit;

          Locate('prioritynum',CurrentNum-1,[loCaseInsensitive,loPartialKey]) ;
        end;
        1: //����
        begin
          if Eof then Exit;
          
          Locate('prioritynum',CurrentNum+1,[loCaseInsensitive,loPartialKey]) ;
        end;
      end;
      //��֤��һ�����������һ�����������ǽ��պ��ϼ�
      Dicdm := FieldByName('ActionDicdm').AsString;
      if (Dicdm <>'101') and (Dicdm <>'105') then
      begin
         //��һ������һ�������ȼ�
        PriorityNum := FieldByName('prioritynum').AsInteger ;
        Edit;
        FieldByName('prioritynum').AsInteger := CurrentNum;

        //��λ
        Locate('prioritynum;DM',VarArrayOf([CurrentNum,DM]),[loCaseInsensitive,loPartialKey]) ;
        Edit;
        FieldByName('prioritynum').AsInteger := PriorityNum;
      end
      else
      //��궨λ�����ƶ���������
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

  //���ض���Ĭ���ֵ��
  FillDBGridEHCombobox('select * from SZActionDic',dbgrdh_DLCDS,'ActionDicDM','dm','mc');
end;

procedure TfrmActionCon.dbgrdh_DLCDSColumns4UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  inherited;
  if Value =1  then
  begin
    //���պ��ϼܶ�������ͣ��
    if (dlcds.FieldByName('actiondicdm').AsString='101') or
     (dlcds.FieldByName('actiondicdm').AsString='105') then
    begin
      Value:=0;
      ShowMsgSure('�ö�������ͣ��!');
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
