/// <summary>
/// ������ת�����������ര��
/// </summary>
/// <author>jdl</author>
///<date>2016-08-18</date>
unit UFrmRevokeB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBForm, DB, ActnList, DBClient, UDlClientDataset, DosMove,
  AdvPanel, AdvAppStyler, AdvToolBar, AdvToolBarStylers, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, ExtCtrls, DBGridEhGrouping, GridsEh, DBGridEh,
  StdCtrls, AdvGroupBox, AdvGlowButton, AdvFontCombo, SUIEdit, ComCtrls,
  AdvDateTimePicker,StrUtils, AdvEdit;

  const
  //��ѯ���
  sql ='SELECT (CASE WHEN a.State=^1^ THEN ^��ǩ��^ WHEN a.State='
         +' ^3^ THEN ^��ǩ��^ END) StateDesc,* FROM SZBADetail a LEFT JOIN SZActionCon b'
      +' ON a.ActionDM=b.DM where IsCancel=0 and '
      +' a.ActionDM=^%0:s^ %1:s';

type
  TfrmRevokeB = class(TFrmSuiDBForm)
    advpnl1: TAdvPanel;
    advgrpLeft: TAdvGroupBox;
    dbgrdhleft: TDBGridEh;
    advgrp1: TAdvGroupBox;
    lbl2: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl9: TLabel;
    edtListNum: TsuiEdit;
    edtzynumber: TsuiEdit;
    cbbOffice: TAdvOfficeComboBox;
    advdtmpckrStart: TAdvDateTimePicker;
    advdtmpckrEnd: TAdvDateTimePicker;
    lbl4: TLabel;
    lbl7: TLabel;
    edtName: TsuiEdit;
    edtChiefDoctor: TsuiEdit;
    btnSel: TAdvGlowButton;
    btnMore: TAdvGlowButton;
    lbl3: TLabel;
    advgrp2: TAdvGroupBox;
    lbl1: TLabel;
    cbbReason: TAdvOfficeComboBox;
    btnRevoke: TAdvGlowButton;
    btnacClose: TAdvGlowButton;
    pnl1: TPanel;
    lbl8: TLabel;
    advedtBarCode: TAdvEdit;
    procedure btnSelClick(Sender: TObject);
    procedure btnRevokeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure advedtBarCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtListNumKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
      //�ֵ��Ķ�������
    FActionDicDM:string;
     //�ֵ��Ӧ�Ķ�������
    FActionDM:string;
    //��������
    ActionMC:string;
     //��һ����������
    PriorActionDM:string;
    PriorActionMC:string;
     //��һ������״̬
    priorActionState:string;
     //��һ���������
    PriorityNum:Integer;
    procedure GetPriorActionDM;
    procedure GetRevokeBA(condition:string);
  public
    { Public declarations }
    /// <summary>
    /// ��������
    /// </summary>
    property  ActionDicDM:string read FActionDicDM write FActionDicDM;
   // constructor Create(Aowner:TComponent);override;
  end;

var
  frmRevokeB: TfrmRevokeB;

implementation
  uses UPublic,UGFun,UCommon,UMidProxy,UGShare,UGVar;
{$R *.dfm}

{ TfrmRevokeB }

procedure TfrmRevokeB.advedtBarCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
    barcode:string;
    clienttmp:TClientDataSet;
    SQLText:string;
begin
  inherited;
  barcode := advedtBarCode.Text;
  if Key=VK_RETURN then
  begin
    if barcode <>'' then
    begin
      if not DLCDS.Active then
      begin
        TMidProxy.SqlOpen('select * from SZBADetail where 1<>1',TClientDataSet(DLCDS));
      end;
      DLCDS.IndexFieldNames :='BarCode';
      if not DLCDS.FindKey([barcode]) then
      begin
        clienttmp :=TClientDataSet.Create(nil);
        AutoFree(clienttmp);
        //�Ƿ���ڲ�����
        TMidProxy.SqlOpen(Format('SELECT * FROM SZBADetail where barcode=^%s^',[barcode]),clienttmp);
        if clienttmp.IsEmpty then
        begin
          ShowMsgSure('�����ⲻ���ڴ˼�¼');
          Exit;
        end;
        //ע��
        if clienttmp.FieldByName('IsCancel').AsBoolean then
        begin
          ShowMsgSure('�ò����ѱ�ע��!');
          Exit;
        end;

        //�ж���һ������״̬
        if clienttmp.FieldByName('ActionDM').AsString<>FActionDM then
        begin
          ShowMsgSure('�ò��������ڴ���ת��Χ�����ܳ���!');
          Exit;
        end;
        //��Ӳ�����Ϣ
        ChangeData(clienttmp,DLCDS,otRight);
      end
      else
      begin
        ShowMsgSure('�Ѿ���ӵ��б�!');
      end;
      
    end;
  end;


end;

procedure TfrmRevokeB.btnRevokeClick(Sender: TObject);
var
  ReasonDM:string;//����ԭ�����
  ActionState:string;//��ǰ��¼�Ķ���״̬
  NewActionState:string;
  NewActionDM:string;
  patientid:string;//����Ψһ��ʶ
  ReclaimTime:string;//��������ʱ��
begin
  inherited;
  if not dlcds.Active then Exit;
  if DLCDS.IsEmpty then Exit;
  
  if cbbReason.ItemIndex =-1 then
  begin
    ShowMsgSure('��ѡ����ԭ��');
    Exit;
  end;
  ReasonDM := GetDmOFCombobox(cbbReason);
  StartWaitWindow('���ڳ���...');
  try
    with DLCDS do
    begin
      DisableControls;
      First;
      while not Eof do
      begin
        ActionState :=FieldByName('state').AsString;
        patientid := FieldByName('patientid').AsString;
        //����ǩ��
        if ActionState='1' then
        begin
          NewActionState :='3';
          NewActionDM := PriorActionDM;
        end
        else if ActionState='3' then //����ǩ��
        begin
          //��ǰ������ǩ��
          NewActionState := '1';
          NewActionDM := FActionDM;
        end;
        ReclaimTime := FormatDateTime('yyyy-mm-dd hh:mm:ss',Now);
        //���²�����״̬
        TMidProxy.SqlExecute(Format('update SZBADetail set ActionDM=^%0:s^ ,'
           + 'state =^%1:s^ where patientid=^%s^ and iscancel=0',
            [NewActionDM,ActionState,patientid]));
        //��ӳ���������¼
        TMidProxy.SqlExecute(Format('insert into SZActionRecord(patientID,ActionDM,ActionMC,ActionState,ActionTime,ActionPerson) '
                +'values(^%s^,^%s^,^%s^,^-%s^,^%s^,^%s^)',[patientid,FActionDM,
                ActionMC,NewActionState,ReclaimTime,G_MainInfo.MainSysInfo.LogonUserName]));
        //��ӳ���ԭ���¼
        TMidProxy.SqlExecute(Format('insert into SZActionRevoke(PatientID,RevokeReason,RevokePerson,RevokeTime) '
               +'values(^%s^,^%s^,^%s^,^%s^)',[patientid,ReasonDM,G_MainInfo.MainSysInfo.LogonUserName,ReclaimTime]));
        Next;
      end;
      EnableControls;
    end;
    EndWaitWindow;
    DLCDS.EmptyDataSet;
    ShowMsgSure('�������');
  except
    on ex:Exception do
    begin
      EndWaitWindow;
      WriteErrorLog(ex.Message);
    end;

  end;
end;

procedure TfrmRevokeB.btnSelClick(Sender: TObject);
var
  StartDate,EndDate:string;//��Ժ����
  SODM,chiefDoc,zynum,name:string;//���Ҵ��롢����ҽʦ��סԺ�š�����
  condition :string;//where����
  SQLText:string;
begin
  inherited;
  if edtListNum.Text <>'' then
  begin
    SendMessage(edtListNum.Handle,WM_KEYDOWN,VK_RETURN,0);
    Exit;
  end;
  if advdtmpckrStart.Date > advdtmpckrEnd.Date then
  begin
    ShowMsgSure('��ʼ���ڲ��ܴ��ڽ�������');
    Exit;
  end;
  StartDate := FormatDateTime('yyyy-mm-dd',advdtmpckrStart.Date);
  EndDate := FormatDateTime('yyyy-mm-dd',advdtmpckrEnd.Date);
  condition := Format(' and CYRQ >= ^%s^ AND CYRQ <= ^%s^ ',[StartDate,EndDate]);
  //�Ʊ�
  if cbbOffice.ItemIndex>-1 then
  begin
    SODM := GetDmOFCombobox(cbbOffice);
    if SODM<>'0000' then
      condition := condition + Format(' and RYKB=^%s^',[SODM]);
  end;
  //����ҽʦ
  if edtChiefDoctor.Text <>'' then
  begin
    chiefDoc := edtChiefDoctor.Text;
    condition := condition +format(' and  chiefDoctor=^%s^',[chiefDoc]);
  end;
  //סԺ��
  if edtzynumber.Text <> '' then
  begin
    zynum := edtzynumber.Text;
    condition := condition +format(' and zynumber =^%s^',[zynum]);
  end;
  //��������
  if edtName.Text <>'' then
  begin
    name := edtName.Text;
    condition := condition +format(' and name = ^%s^',[name]);
  end;

  //��ѯ
  GetRevokeBA(condition);
end;


procedure TfrmRevokeB.edtListNumKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  listnum:string;
begin
  inherited;
  if Key=VK_RETURN then
  begin
    listnum := edtListNum.Text;
    if listnum='' then Exit;
    GetBAByListNum(listnum,FActionDM,TClientDataSet(DLCDS));
    SetSbSimpleText(Format('��%d������',[dlcds.RecordCount]));
  end;
end;

procedure TfrmRevokeB.FormCreate(Sender: TObject);
begin
   inherited;
  //��ѯ��һ����������
  GetPriorActionDM;
  self.Caption := ActionMC+'����';

   //���ؿ���
  LoadOffice(cbbOffice);
  //���س���ԭ��
  FillCombobox('SELECT DM,Reason FROM SZRevokeReason ORDER BY DM','DM','Reason',cbbReason);
end;

procedure TfrmRevokeB.GetPriorActionDM;
const
  SQLPrior='SELECT * FROM SZActionCon WHERE PriorityNum =(SELECT PriorityNum-1'
     +' FROM dbo.SZActionCon WHERE ActionDicDM=^%s^)';
var
 clienttmp:TClientDataSet;
begin
  if FActionDicDM<>'' then
  begin
    clienttmp := TClientDataSet.Create(nil);
    AutoFree(clienttmp);
    TMidProxy.SqlOpen(Format(SQLPrior,[FActionDicDM]),clienttmp);
    if not clienttmp.IsEmpty then
    begin
      PriorActionDM := clienttmp.FieldByName('DM').AsString;
      PriorityNum  :=clienttmp.FieldByName('prioritynum').AsInteger;
      PriorActionMC := clienttmp.FieldByName('mc').AsString;

    end;
    TMidProxy.SqlOpen(Format('SELECT * FROM SZActionCon WHERE ActionDicDM=^%s^',[FActionDicDM]),clienttmp);
    if not clienttmp.IsEmpty then
    begin
      FActionDM := clienttmp.FieldByName('DM').AsString;
      ActionMC := clienttmp.FieldByName('mc').AsString;
    end;

  end;
end;


procedure TfrmRevokeB.GetRevokeBA(condition: string);
begin
   //��ѯ
  try
    if UpperCase(LeftStr(Trim(Condition),3)) <> 'AND' then
    begin
      Condition := ' and '+Condition;
    end;
     //�ɳ����б�
    StartWaitWindow('���ڲ�ѯ����...');
    TMidProxy.SqlOpen(Format(sql,[FActionDM,condition]),TClientDataSet(DLCDS));

    if DLCDS.IsEmpty then
    begin
      dbgrdhleft.DataSource := nil;
      EndWaitWindow;
      ShowMsgSure('δ��ѯ�����ϵ�����!');
      exit;
    end;
    dbgrdhleft.DataSource := ds1;
  finally
    EndWaitWindow;
  end;
end;

end.
