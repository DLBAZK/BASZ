/// <summary>
/// ������ת����ǩ��ǩ�����ര��
/// </summary>
/// <author>jdl</author>
///<date>2016-08-17</date>
unit UFrmAction;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBForm, DB, ActnList, DBClient, UDlClientDataset, DosMove,
  AdvPanel, AdvAppStyler, AdvToolBar, AdvToolBarStylers, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, ExtCtrls, DBGridEhGrouping, AdvSplitter, GridsEh,
  DBGridEh, StdCtrls, AdvGroupBox, AdvGlowButton, AdvFontCombo, SUIEdit,
  ComCtrls, AdvDateTimePicker,StrUtils,USZVar, AdvEdit, AdvPageControl,TypInfo;


  type
    //������������    aoCheckIn ǩ��   aoCheckOut ǩ��    aoRevoke ����
    TActionOperation=(aoCheckIn,aoCheckOut,aoRevoke);

 const
  //���ղ���
  sqlReclaim ='SELECT * FROM SZBADetail where IsCancel=0 and  ISNULL(State,^^)=^^';
  sqlCheck ='SELECT * FROM SZBADetail where IsCancel=0 and  ISNULL(State,^^)=^%0:s^ and ActionDM=^%1:s^ %2:s';
  sqlRevoke ='SELECT (CASE WHEN a.State=^1^ THEN ^��ǩ��^ WHEN a.State='
         +' ^3^ THEN ^��ǩ��^ END) StateDesc,* FROM SZBADetail a LEFT JOIN SZActionCon b'
      +' ON a.ActionDM=b.DM where IsCancel=0 and '
      +' a.ActionDM=^%0:s^ %1:s';
  //��ת����״̬����
  OperationDesc :array [TActionOperation] of string =('ǩ��','ǩ��','����');
type


  TfrmActionCheckB = class(TFrmSuiDBForm)
    lbl2: TLabel;
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
    clientdtright: TClientDataSet;
    dsright: TDataSource;
    lbl1: TLabel;
    edtListNum: TsuiEdit;
    advpnlTop: TAdvPanel;
    advgrp1: TAdvGroupBox;
    lbl3: TLabel;
    advpgcntrl1: TAdvPageControl;
    advtbsht1: TAdvTabSheet;
    advtbsht2: TAdvTabSheet;
    advgrp2: TAdvGroupBox;
    lbl9: TLabel;
    cbbReason: TAdvOfficeComboBox;
    btnRevoke: TAdvGlowButton;
    btnacClose1: TAdvGlowButton;
    pnl1: TPanel;
    lbl8: TLabel;
    advedtBarCode: TAdvEdit;
    advgrpcheck: TAdvGroupBox;
    btnSaveList: TAdvGlowButton;
    btnPrint: TAdvGlowButton;
    btnacClose: TAdvGlowButton;
    advpnlClientRect: TAdvPanel;
    advpgcntrlCheck: TAdvPageControl;
    advtbshtCheckIn: TAdvTabSheet;
    advtbshtCheckOut: TAdvTabSheet;
    advtbshtRevoke: TAdvTabSheet;
    advpnlLeft: TAdvPanel;
    advgrpLeft: TAdvGroupBox;
    dbgrdhleft: TDBGridEh;
    advpnl2: TAdvPanel;
    btnAllRight: TAdvGlowButton;
    btnRight: TAdvGlowButton;
    btnLeft: TAdvGlowButton;
    btnAllLeft: TAdvGlowButton;
    advgrpright: TAdvGroupBox;
    dbgrdhright: TDBGridEh;
    advgrp3: TAdvGroupBox;
    dbgrdh1: TDBGridEh;
    advpnl1: TAdvPanel;
    advgrp4: TAdvGroupBox;
    dbgrdh2: TDBGridEh;
    advpnl3: TAdvPanel;
    btn1: TAdvGlowButton;
    btn2: TAdvGlowButton;
    btn3: TAdvGlowButton;
    btn4: TAdvGlowButton;
    advgrp5: TAdvGroupBox;
    dbgrdh3: TDBGridEh;
    clientdtOutLeft: TClientDataSet;
    dsOutLeft: TDataSource;
    clientdtOutRight: TClientDataSet;
    dsOutRight: TDataSource;
    clientdtRevoke: TClientDataSet;
    dsRevoke: TDataSource;
    pnl2: TPanel;
    lbl11: TLabel;
    advedtcode: TAdvEdit;
    lblCarraier: TLabel;
    edtcarrier: TsuiEdit;
    edtsendee: TsuiEdit;
    lblSendee: TLabel;
    clientdtInLeft: TClientDataSet;
    lblSJNumber: TLabel;
    edtSJNumber: TsuiEdit;
    procedure btnSelClick(Sender: TObject);
    procedure btnAllRightClick(Sender: TObject);
    procedure btnSaveListClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnMoreClick(Sender: TObject);
    procedure edtListNumKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure advpgcntrlCheckChange(Sender: TObject);
    procedure advedtcodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRevokeClick(Sender: TObject);
    procedure btnacCloseClick(Sender: TObject);
    procedure btnacClose1Click(Sender: TObject);
    procedure edtChiefDoctorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    //�ֵ��Ķ�������
    FActionDicDM:string;
     //�ֵ��Ӧ�Ķ�������
    FActionDM:string;
    FActionOperation:TActionOperation;
    //��һ����������
    PriorActionDM:string;
     //��һ������״̬
    priorActionState:string;
    //��������
    ActionMC:string;
    //��һ���������
    PriorityNum:Integer;
    //����ǩ�루ǩ��������
    ActionListNum:string;
    //����ǩ��ǩ������
    CheckDesc:string;
    //��������ǰ׺
    FListPrefix:string;
    procedure SetActionOperation(const value:TActionOperation);
    /// <summary>
    /// ��ȡ��һ����������
    /// </summary>
    procedure GetPriorActionDM;
    /// <summary>
    /// ��ѯ��������
    /// </summary>
    /// <param name="Condition">��ѯ����</param>
    procedure GetBAData(Condition:string;var DataSet:TClientDataSet;const Showmsg:Boolean=True);

    procedure SetDM(const value:string);
    /// <summary>
    /// ������������Ӳ���
    /// </summary>
    /// <param name="barcode"></param>
    /// <param name="dataSet"></param>
    procedure GetBAByBarcode(const barcode:string;var dataSet:TClientDataSet);

    procedure SetGridDataSource;
  public
    { Public declarations }
    property ActionDM:string read FActionDM write SetDM;
    /// <summary>
    /// ָ���Ķ�������
    /// </summary>
    property  ActionDicDM:string read FActionDicDM write FActionDicDM;
  /// <summary>
  /// ������������
  /// </summary>
    property ActionOperation:TActionOperation read FActionOperation write SetActionOperation;
    /// <summary>
    /// ��������ǰ׺
    /// </summary>
    property ListPrefix:string read FListPrefix write FListPrefix;
  /// <summary>
  /// ��ӡ����
  /// </summary>
  procedure PrintActionList;virtual;
  end;

var
  frmActionCheckB: TfrmActionCheckB;

implementation
  uses UGFun,UGVar,UCommon,UGShare,UMidProxy,UPublic,UFrmRptReclaim,UFrmRptCheck;
{$R *.dfm}

{ TFrmSuiDBForm1 }

procedure TfrmActionCheckB.advedtcodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 advBarCode:TAdvEdit;
 barcode:string;
begin
  inherited;
  if Key = VK_RETURN then
  begin
    advBarCode := TAdvEdit(Sender);
    barcode := advBarCode.Text;
    if barcode ='' then Exit;
    if FActionOperation = aoCheckIn then
       GetBAByBarcode(barcode,clientdtright)
    else if FActionOperation =aoCheckOut  then
      GetBAByBarcode(barcode,clientdtOutRight)
    else if FActionOperation =aoRevoke then
      GetBAByBarcode(barcode,clientdtRevoke);
  end;
  SetGridDataSource;
end;

procedure TfrmActionCheckB.advpgcntrlCheckChange(Sender: TObject);
begin
  inherited;
  FActionOperation :=  TActionOperation(advpgcntrlCheck.ActivePageIndex);
  //����
  if advpgcntrlCheck.ActivePageIndex =2 then
  begin
    advpgcntrl1.ActivePageIndex:=1;
    if not clientdtRevoke.Active then
      GetBAData('1<>1',clientdtRevoke,False);
  end
  else //ǩ�롢ǩ��
  begin
    advpgcntrl1.ActivePageIndex:=0;
    if advpgcntrl1.ActivePageIndex = 0 then
    begin
      if (FActionDicDM <>'101') and (FActionDicDM <>'105') then
      begin
        btnSaveList.Caption := Format('%s',[OperationDesc[FActionOperation]]);
      end;
    end;
    if advpgcntrlCheck.ActivePageIndex =0 then
    begin
      if not clientdtright.Active then
        GetBAData('1<>1',clientdtright,False);
    end
    else
    begin
      if not clientdtOutRight.Active then
        GetBAData('1<>1',clientdtOutRight,False);
       //�ϼ�
      if FActionDicDM='105' then
      begin
        lblSJNumber.Visible :=true;
        edtSJNumber.Visible :=true;
        lblSJNumber.Top := lblSendee.Top;
        edtSJNumber.Top := edtsendee.Top;
        btnSaveList.Caption :='�ϼ�';
      end;
    end;

  end;
end;

procedure TfrmActionCheckB.btnacClose1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmActionCheckB.btnacCloseClick(Sender: TObject);
begin
 
  Close;
end;

procedure TfrmActionCheckB.btnAllRightClick(Sender: TObject);
var
  tag:Integer;
  clientleft,clientright:TClientDataSet;
begin
  inherited;
  tag :=(sender as TAdvGlowButton).Tag;
  if FActionOperation =aoCheckIn then
  begin
    clientleft := clientdtInLeft;
    clientright := clientdtright;
  end
  else if FActionOperation = aoCheckOut then
  begin
    clientleft :=clientdtOutLeft;
    clientright := clientdtOutRight;
  end;
  case tag of
    0://ȫ������
    begin
      ChangeData(clientleft,clientright,TOrientation(Tag));
    end;
    1: //����
    begin
      ChangeData(clientleft,clientright,otRight);
    end;
    2: //����
    begin
      ChangeData(clientright,clientleft,otLeft);
    end;
    3://ȫ������
    begin
      ChangeData(clientright,clientleft,otAllLeft);
    end;
  end;
  SetGridDataSource;
end;

procedure TfrmActionCheckB.btnMoreClick(Sender: TObject);
var
  SQLCondition:string;
begin
  inherited;
  SQLCondition := GetCondition;
  if SQLCondition<> '' then
  begin
    //��ѯ����
    GetBAData(SQLCondition,clientdtInLeft);
  end;
end;

procedure TfrmActionCheckB.btnPrintClick(Sender: TObject);
begin
  inherited;
  PrintActionList;
end;

procedure TfrmActionCheckB.btnRevokeClick(Sender: TObject);
var
  ReasonDM:string;//����ԭ�����
  ActionState:string;//��ǰ��¼�Ķ���״̬
  NewActionState:string;
  NewActionDM:string;
  patientid:string;//����Ψһ��ʶ
  ReclaimTime:string;//��������ʱ��
  BANum:string;//������
begin
  inherited;
  if not clientdtRevoke.Active then Exit;
  if clientdtRevoke.IsEmpty then Exit;
  
  if cbbReason.ItemIndex =-1 then
  begin
    ShowMsgSure('��ѡ����ԭ��');
    Exit;
  end;
  ReasonDM := GetDmOFCombobox(cbbReason);
  StartWaitWindow('���ڳ���...');
  try
    with clientdtRevoke do
    begin
      DisableControls;
      First;
      while not Eof do
      begin
        ActionState :=FieldByName('state').AsString;
        patientid := FieldByName('patientid').AsString;
        BANum :=FieldByName('BANumber').AsString;
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
        //�����ѽ��յĲ��� ������״̬�ָ�Ϊ��ֵ
        if FActionDicDM='101' then
        begin
          NewActionState :='';
          NewActionDM := '';
        end;

        ReclaimTime := FormatDateTime('yyyy-mm-dd hh:mm:ss',Now);
           //���²�����״̬
        TMidProxy.SqlExecute(Format('update SZBADetail set ActionDM=^%0:s^ ,'
           + 'state =^%1:s^ where patientid=^%s^ and iscancel=0',
            [NewActionDM,ActionState,patientid]));
        //��ӳ���������¼
        TMidProxy.SqlExecute(Format('insert into SZActionRecord(patientID,ActionDM,ActionMC,ActionState,ActionTime,ActionPerson) '
                +'values(^%s^,^%s^,^%s^,^-%s^,^%s^,^%s^)',[patientid,FActionDM,
                ActionMC,ActionState,ReclaimTime,G_MainInfo.MainSysInfo.LogonUserName]));
        //��ӳ���ԭ���¼
        TMidProxy.SqlExecute(Format('insert into SZActionRevoke(PatientID,RevokeReason,RevokePerson,RevokeTime) '
               +'values(^%s^,^%s^,^%s^,^%s^)',[patientid,ReasonDM,G_MainInfo.MainSysInfo.LogonUserName,ReclaimTime]));
        //ɾ���ϼܼ�¼
        TMidProxy.SqlExecute(Format('DELETE FROM SZBASJ WHERE patientid =^%s^ AND BANumber =^%s^',[patientid,BANum]));
        Next;
      end;
      EnableControls;
    end;
    EndWaitWindow;
    clientdtRevoke.EmptyDataSet;
    ShowMsgSure('�������');
  except
    on ex:Exception do
    begin
      EndWaitWindow;
      WriteErrorLog(ex.Message);
    end;

  end;

end;

procedure TfrmActionCheckB.btnSaveListClick(Sender: TObject);
const
  //������ղ�����Ϣ
  sqlListDeatil='insert into SZActionListDeatil(ListID,patientID) values(^%s^,^%s^)';
    //������յ���¼
  SQL1 ='insert into SZReclaim(ListNum,Carrier,Sendee,ReceiveTime) values(^%s^,^%s^,^%s^,^%s^)';
  sqlSJ='insert into SZBASJ (patientID,BANumber,SJNumber) values (^%s^,^%s^,^%s^)';
var
  patientid:string;
  sql:string;
  ReclaimTime:string;
  procedure SaveBA(var DataSet:TClientDataSet);
  var
    carrier,sendee:string;//�����ˡ�������
    BAstate:string;//����״̬
    SJNum:string;
    BANum:string;//������
  begin
    if FActionOperation = aoCheckIn then
      BAstate := '1'
    else if FActionOperation=aoCheckOut then
      BAstate :='3' ;
    //�������մ���
    if FActionDicDM = '101' then
    begin
      if edtcarrier.Text ='' then
      begin
        ShowMsgSure('�����˲���Ϊ��!');
        Exit;
      end;
      carrier := edtcarrier.Text;
      if edtsendee.Text ='' then
      begin
        sendee:=G_MainInfo.MainSysInfo.LogonUserName;
      end
      else
      begin
        sendee :=  edtsendee.Text ;
      end;

    end
    else  if FActionDicDM = '105' then
    begin
       //ǩ�����ϼ� ����
       if FActionOperation=aoCheckOut then
       begin
          SJNum :=edtSJNumber.Text;
          if SJNum ='' then
          begin
            ShowMessage('�������ϼܺ�');
            Exit;
          end;
       end;
    end;
    StartWaitWindow(Format('����%s����',[CheckDesc]));
    try
      //�����µĵ��� �����浽���ݱ�
      ActionListNum := GenerateActionListNum(FListPrefix,FActionDM);
      ReclaimTime := FormatDateTime('yyyy-mm-dd hh:mm:ss',Now);
      if FActionDicDM ='101' then
      begin
         //���没�����յ���Ϣ
        BAstate :='3';
        TMidProxy.SqlExecute(Format(SQL1,[ActionListNum,carrier,sendee,ReclaimTime]));
      end;
      
      with DataSet do
      begin
        DisableControls;
        First;
        while not EOf do
        begin
          patientid:=FieldByName('patientid').AsString;
          BANum :=FieldByName('BANumber').AsString;
          //���²���״̬
          TMidProxy.SqlExecute(Format('update SZBADetail set ActionDM=^%0:s^ ,'
           +' State=^%1:s^ where patientid=^%s^',[FActionDM,BAstate,patientid]));
          //���涯����Ϣ
          sql := Format('insert into SZActionRecord(patientID,ActionDM,ActionMC,ActionState,ActionTime,ActionPerson) '
              +'values(^%s^,^%s^,^%s^,^%s^,^%s^,^%s^)',[patientid,FActionDM,ActionMC,BAstate,
              ReclaimTime,G_MainInfo.MainSysInfo.LogonUserName]);
          TMidProxy.SqlExecute(sql);
          //������յ���¼�Ĳ�����Ϣ
          TMidProxy.SqlExecute(Format(sqlListDeatil,[ActionListNum,FieldByName('patientid').AsString]));
          //ǩ�� �����ϼܺż�¼
          if (FActionDicDM ='105') and (FActionOperation =aoCheckOut) then
          begin
            TMidProxy.SqlExecute(Format(sqlSJ,[patientid,BANum,SJNum]));
          end;
          Next;
        end;
        EnableControls;
      end;
      EndWaitWindow;
      DataSet.EmptyDataSet;
      ShowMsgSure(CheckDesc+'�ɹ�!');
    except
      on ex:Exception do
      begin
        EndWaitWindow;
        WriteErrorLog(ex.Message);
      end;
    end;
  end;
begin
  inherited;
  CheckDesc := OperationDesc[FActionOperation];
  if FActionOperation = aoCheckIn then
    SaveBA(clientdtright)
  else if FActionOperation= aoCheckOut then
    SaveBA(clientdtOutRight);
end;

procedure TfrmActionCheckB.btnSelClick(Sender: TObject);
var
  StartDate,EndDate:string;//��Ժ����
  SODM,chiefDoc,zynum,name:string;//���Ҵ��롢����ҽʦ��סԺ�š�����
  condition :string;//where����
begin
  inherited;
  if edtListNum.Text<>'' then
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
  FActionOperation := TActionOperation(advpgcntrlCheck.ActivePageIndex);
  if FActionOperation =aoCheckIn then
   //��ѯ
    GetBAData(condition,clientdtInLeft)
  else if FActionOperation = aoCheckOut then
    GetBAData(condition,clientdtOutLeft)
  else if FActionOperation = aoRevoke then
   GetBAData(condition,clientdtRevoke);
  SetGridDataSource;
end;

procedure TfrmActionCheckB.edtChiefDoctorKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key in  ['\','/',':','*','?','"','<','>','|','!','@','#','$','%','^','&','*','(',')'] then
    key :=#0;
end;

procedure TfrmActionCheckB.edtListNumKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  ActionListNum:string; //����

begin
  inherited;
   //�س���ѯ���ŵĲ�������
  if Key=VK_RETURN then
  begin
    ActionListNum :=Trim(edtListNum.Text);
    if ActionListNum='' then Exit;
    //���յ��Ų�ѯ����
    if FActionOperation=aoCheckIn then
      GetBAByListNum(ActionListNum,PriorActionDM,'3',clientdtInLeft)
    else if FActionOperation=aoCheckOut then
      GetBAByListNum(ActionListNum,FActionDM,'1',clientdtOutLeft)
    else if FActionOperation=aoRevoke then
      GetBAByListNum(ActionListNum,FActionDM,clientdtRevoke);
    SetSbSimpleText(Format('��%d������',[clientdtInLeft.RecordCount]));
  end;
end;

procedure TfrmActionCheckB.FormCreate(Sender: TObject);
const
  SQLtext ='select * from SZBADetail WHERE 1<>1';
begin
  inherited;
  edtsendee.Text :=G_MainInfo.MainSysInfo.LogonUserName;
  //������ʾ����
  LoadOffice(cbbOffice);
  advtbsht1.TabVisible :=False;
  advtbsht2.TabVisible :=False;
  advpgcntrlCheck.ActivePageIndex :=0;
  advpgcntrl1.ActivePageIndex := 0;
  
  TMidProxy.SqlOpen(SQLtext,clientdtRight);
  SetGridDataSource;
end;

procedure TfrmActionCheckB.GetBAByBarcode(const barcode: string;
  var dataSet: TClientDataSet);
var
 clienttmp:TClientDataSet;
begin
  dataSet.IndexFieldNames :='BarCode';
  if not dataSet.FindKey([barcode]) then
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
    //��ѯ
    GetBAData(Format(' barcode=^%s^',[barcode]),clienttmp);
    //�ж���һ������״̬
    if clienttmp.IsEmpty then Exit;
    //��Ӳ�����Ϣ
    ChangeData(clienttmp,dataSet,otRight);
  end
  else
  begin
    ShowMsgSure('�Ѿ���ӵ��б�!');
  end;
end;

procedure TfrmActionCheckB.GetBAData(Condition: string;var DataSet:TClientDataSet;const Showmsg:Boolean=True);
var
  SQLText:string;
begin
  //��ѯ
  try
    if UpperCase(LeftStr(Trim(Condition),3)) <> 'AND' then
    begin
      Condition := ' and '+Condition;
    end;
     //���ղ���
    if FActionDicDM ='101' then
    begin
      SQLText :=sqlReclaim+condition;
      if ActionOperation = aoRevoke then   //����
      begin
        SQLText := Format(sqlRevoke,[FActionDM,Condition]);
      end;
    end
    else
    begin
        //ǩ��
      if ActionOperation=aoCheckIn then
      begin
        SQLText :=Format(sqlCheck,['3',PriorActionDM,condition]);
      end
      //ǩ��
      else if ActionOperation=aoCheckOut then
      begin
        SQLText :=Format(sqlCheck,['1',FActionDM,condition]);  //��ǰ������ǩ��״̬
      end
      else if ActionOperation = aoRevoke then   //����
      begin
        SQLText := Format(sqlRevoke,[FActionDM,Condition]);
      end;
    end;

    StartWaitWindow('���ڲ�ѯ����...');
    TMidProxy.SqlOpen(SQLText,DataSet);
    if DataSet.IsEmpty and Showmsg then
    begin
      EndWaitWindow;
      ShowMsgSure('δ��ѯ�����ϵ�����');      
    end;
  finally
    EndWaitWindow;
    SetSbSimpleText(Format('��%d������',[DataSet.RecordCount]));
  end;
end;

procedure TfrmActionCheckB.GetPriorActionDM;
const
  SQLtext='SELECT * FROM SZActionCon WHERE PriorityNum =(SELECT PriorityNum-1'
     +' FROM dbo.SZActionCon WHERE ActionDicDM=^%s^)';
var
 clienttmp:TClientDataSet;
begin
  if FActionDicDM<>'' then
  begin
    clienttmp := TClientDataSet.Create(nil);
    AutoFree(clienttmp);
    TMidProxy.SqlOpen(Format(SQLtext,[FActionDicDM]),clienttmp);
    if not clienttmp.IsEmpty then
    begin
      PriorActionDM := clienttmp.FieldByName('DM').AsString;
      PriorityNum  :=clienttmp.FieldByName('prioritynum').AsInteger;
    end;
  end;
end;

procedure TfrmActionCheckB.PrintActionList;
var
 rptReclaim:TfrmRptReclaim;
 rptCheck:TfrmRptCheck;
 headerCaption:string;
begin
  if FActionDicDM='101' then
    headerCaption := '�� �� �� �� ��'
  else if FActionDicDM='105' then
    headerCaption := '�� �� �� �� ��'
  else
  begin
    if ActionOperation = aoCheckIn then
      headerCaption :='�� �� ǩ �� ��'
    else if actionoperation=aoCheckOut then
      headerCaption :='�� �� ǩ �� ��';
  end;
  if FActionDicDM ='101' then
  begin
    rptReclaim :=TfrmRptReclaim.Create(nil);
    rptReclaim.SetHeaderCaption(headerCaption);
    rptReclaim.ShowRept(ActionListNum);
    rptReclaim.ShowModal;
  end
  else
  begin
    rptCheck :=  TfrmRptCheck.Create(nil);
    rptCheck.SetHeaderCaption(headerCaption);
    rptCheck.ShowRept(ActionListNum);
    rptCheck.ShowModal;
  end;
end;

procedure TfrmActionCheckB.SetActionOperation(const value: TActionOperation);
begin
  FActionOperation := value;
  if FActionOperation= aoCheckIn then
    CheckDesc :='ǩ��'
  else
    CheckDesc := 'ǩ��';
end;

procedure TfrmActionCheckB.SetDM(const value: string);
const
  SQLDicDM ='SELECT * FROM SZActionCon where dm =^%s^';
begin
  if value <>'' then
  begin
    FActionDM := value;
    //��ȡָ���Ķ�������
    FActionDicDM :=GetFieldValue(Format(SQLDicDM,[FActionDM]),'ActionDICDM');
     //����
    if FActionDicDM ='101' then
    begin
      lblCarraier.Visible := True;
      edtcarrier.Visible := true;
      lblSendee.Visible := True;
      edtsendee.Visible :=true;
      btnSaveList.Caption := '����';
      advtbshtCheckOut.Visible :=False;
      advtbshtCheckOut.TabVisible :=False;
    end ;


    //�������õĶ������� ���ɵ���ǰ׺ ����ƴ����
    ActionMC := GetFieldValue(Format(SQLDicDM,[FActionDM]),'MC');
    FListPrefix := GetStringPy(ActionMC,Length(ActionMC) div 2);
    //��ȡ��һ���Ķ�������
    GetPriorActionDM;
  end;
end;

procedure TfrmActionCheckB.SetGridDataSource;
begin
  if clientdtInLeft.IsEmpty then
    dbgrdhleft.DataSource :=nil
  else
    dbgrdhleft.DataSource := ds1;
  if clientdtright.IsEmpty then
    dbgrdhright.DataSource :=nil
  else
    dbgrdhright.DataSource := dsright;
  if clientdtOutLeft.IsEmpty then
    dbgrdh2.DataSource :=nil
  else
    dbgrdh2.DataSource := dsOutLeft;
  if clientdtOutRight.IsEmpty then
    dbgrdh3.DataSource :=nil
  else
    dbgrdh3.DataSource := dsOutRight;
  if clientdtRevoke.IsEmpty then
    dbgrdh1.DataSource :=nil
  else
    dbgrdh1.DataSource := dsRevoke;
end;

end.
