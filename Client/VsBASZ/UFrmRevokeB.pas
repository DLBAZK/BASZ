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
  AdvDateTimePicker,StrUtils;

  const
  //��ѯ���
  sql ='SELECT * FROM SZBADetail where IsCancel=0 and  LEFT(ISNULL(State,^^),%d)=^%s^ %s';
  
type
  TfrmRevokeB = class(TFrmSuiDBForm)
    advpnl1: TAdvPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    advdtmpckrStart: TAdvDateTimePicker;
    advdtmpckrEnd: TAdvDateTimePicker;
    edtChiefDoctor: TsuiEdit;
    cbbOffice: TAdvOfficeComboBox;
    edtzynumber: TsuiEdit;
    edtName: TsuiEdit;
    btnSel: TAdvGlowButton;
    btnMore: TAdvGlowButton;
    advgrpLeft: TAdvGroupBox;
    dbgrdhleft: TDBGridEh;
    lbl1: TLabel;
    lbl8: TLabel;
    cbbReason: TAdvOfficeComboBox;
    edtBarcode: TsuiEdit;
    btnRevoke: TAdvGlowButton;
    btnacClose: TAdvGlowButton;
    procedure btnSelClick(Sender: TObject);
    procedure btnRevokeClick(Sender: TObject);
    procedure edtBarcodeKeyDown(Sender: TObject; var Key: Word;
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
     //��һ������״̬
    priorActionState:string;
     //��һ���������
    PriorityNum:Integer;
    procedure GetPriorActionDM;
  public
    { Public declarations }
    /// <summary>
    /// ��������
    /// </summary>
    property  ActionDicDM:string read FActionDicDM write FActionDicDM;
    constructor Create(Aowner:TComponent);override;
  end;

var
  frmRevokeB: TfrmRevokeB;

implementation
  uses UPublic,UGFun,UCommon,UMidProxy,UGShare,UGVar;
{$R *.dfm}

{ TfrmRevokeB }

procedure TfrmRevokeB.btnRevokeClick(Sender: TObject);
var
  ReasonDM:string;//����ԭ�����
  ActionState:string;//��ǰ��¼�Ķ���״̬
  book:Pointer;
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
      book := GetBookmark;
      DisableControls;
      First;
      while not Eof do
      begin
        ActionState :=FieldByName('state').AsString;
        patientid := FieldByName('state').AsString;
        //����ǩ��
        if RightStr(ActionState,1)='1' then
        begin
           //����
          if PriorActionDM='' then
          begin
            ActionState :='';
          end
          else
          begin
            //��һ������ ��ǩ��
            ActionState := PriorActionDM+'_2';
          end;
        end
        else //����ǩ��
        begin
          //��ǰ������ǩ��
          ActionState := FActionDM+'_1';
        end;
        ReclaimTime := FormatDateTime('yyyy-mm-dd hh:mm:ss',Now);
        //���²�����״̬
        TMidProxy.SqlExecute(Format('update SZBADetail set state =^%s^ where patientid=^%s^ and iscancel=0',[ActionState,patientid]));
        //��ӳ���������¼
        TMidProxy.SqlExecute(Format('insert into SZActionRecord(patientID,ActionDM,ActionMC,ActionState,IsRevoke,ActionTime,ActionPerson) '
                +'values(^%s^,^%s^,^%s^,^%s^,^1^,^%s^,^%s^)',[patientid,FActionDicDM,
                ActionMC,RightStr(ActionState,1),ReclaimTime,G_MainInfo.MainSysInfo.LogonUserName]));
        //��ӳ���ԭ���¼
        TMidProxy.SqlExecute(Format('insert into SZActionRevoke(PatientID,RevokeReason,RevokePerson,RevokeTime) '
               +'values(^%s^,^%s^,^%s^,^%s^)',[patientid,ReasonDM,G_MainInfo.MainSysInfo.LogonUserName,ReclaimTime]));
        Next;
      end;
      EnableControls;
      GotoBookmark(book);
    end;
    ShowMsgSure('�������');
  except
    on ex:Exception do
    begin
      EndWaitWindow;
      WriteErrorLog(ex.Message);
    end;

  end;
  EndWaitWindow;
end;

procedure TfrmRevokeB.btnSelClick(Sender: TObject);
var
  StartDate,EndDate:string;//��Ժ����
  SODM,chiefDoc,zynum,name:string;//���Ҵ��롢����ҽʦ��סԺ�š�����
  condition :string;//where����
  SQLText:string;
begin
  inherited;
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
  try
     //�ɳ����б�
    StartWaitWindow('���ڲ�ѯ����...');
    TMidProxy.SqlOpen(Format(sql,[Length(FActionDM),FActionDM,condition]),TClientDataSet(DLCDS));
   
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
constructor TfrmRevokeB.Create(Aowner: TComponent);
begin
  GetPriorActionDM;
  inherited;
   //���ؿ���
  LoadOffice(cbbOffice);
  //���س���ԭ��
  FillCombobox('SELECT DM,Reason FROM SZRevokeReason ORDER BY DM','DM','Reason',cbbReason);
end;

procedure TfrmRevokeB.edtBarcodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
    barcode:string;
    clienttmp:TClientDataSet;
    SQLText:string;
begin
  inherited;
  barcode := edtBarcode.Text;
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
        if LeftStr(clienttmp.FieldByName('state').AsString,Length(FActionDM))<>FActionDM then
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
      if PriorityNum> 1 then
        priorActionState := PriorActionDM+'_2'
      else
       priorActionState :=PriorActionDM+'_1'; //����״̬
      
    end;
    TMidProxy.SqlOpen(Format('SELECT * FROM SZActionCon WHERE ActionDicDM=^%s^',[FActionDicDM]),clienttmp);
    if not clienttmp.IsEmpty then
    begin
      FActionDM := clienttmp.FieldByName('DM').AsString;
      ActionMC := clienttmp.FieldByName('mc').AsString;
    end;

  end;
end;


end.
