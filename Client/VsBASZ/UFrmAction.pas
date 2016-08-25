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
  ComCtrls, AdvDateTimePicker,StrUtils,USZVar;


  const
  sql ='SELECT * FROM SZBADetail where IsCancel=0 and  ISNULL(State,^^)=^%0:s^ and ActionDM=^%1:s^ %2:s';
  
type
   //������������    aoCheckIn ǩ��   aoCheckOut ǩ��    aoRevoke ����
  TActionOperation=(aoCheckIn,aoCheckOpe,aoCheckOut);
  TfrmActionCheckB = class(TFrmSuiDBForm)
    advpnlLeft: TAdvPanel;
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
    advspltr1: TAdvSplitter;
    advpnl2: TAdvPanel;
    advpnl3: TAdvPanel;
    btnAllRight: TAdvGlowButton;
    btnRight: TAdvGlowButton;
    btnLeft: TAdvGlowButton;
    btnAllLeft: TAdvGlowButton;
    advpnl5: TAdvPanel;
    advpnl6: TAdvPanel;
    lbl10: TLabel;
    edtBarcode: TsuiEdit;
    btnSaveList: TAdvGlowButton;
    btnPrint: TAdvGlowButton;
    advgrpright: TAdvGroupBox;
    dbgrdhright: TDBGridEh;
    clientdtright: TClientDataSet;
    dsright: TDataSource;
    btnacClose: TAdvGlowButton;
    lbl1: TLabel;
    edtListNum: TsuiEdit;
    procedure btnSelClick(Sender: TObject);
    procedure btnAllRightClick(Sender: TObject);
    procedure btnSaveListClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure edtBarcodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnMoreClick(Sender: TObject);
    procedure edtListNumKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    procedure GetBAData(Condition:string;var DataSet:TClientDataSet);
  public
    { Public declarations }
//    Constructor Create(Aowner:TComponent);Override;
    /// <summary>
    /// ��������
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
  uses UGFun,UGVar,UCommon,UGShare,UMidProxy,UPublic;
{$R *.dfm}

{ TFrmSuiDBForm1 }

procedure TfrmActionCheckB.btnAllRightClick(Sender: TObject);
var
  tag:Integer;
begin
  inherited;
  tag :=(sender as TAdvGlowButton).Tag;
  case tag of
    0://ȫ������
    begin
      ChangeData(TClientDataSet(DLCDS),clientdtRight,otAllRight);
      dbgrdhleft.DataSource := nil;
      if not clientdtRight.IsEmpty then
       clientdtRight.First;
    end;
    1: //����
    begin
      ChangeData(TClientDataSet(DLCDS),clientdtRight,otRight);
      if dbgrdhright.DataSource = nil then
        dbgrdhright.DataSource := dsRight;
    end;
    2: //����
    begin
      ChangeData(clientdtRight,TClientDataSet(DLCDS),otLeft);
      if dbgrdhleft.DataSource=nil then
        dbgrdhleft.DataSource := ds1;
    end;
    3://ȫ������
    begin
      ChangeData(clientdtRight,TClientDataSet(DLCDS),otAllLeft);
      dbgrdhright.DataSource := nil;
        if not DLCDS.IsEmpty then
         DLCDS.First;
    end;
  end;
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
    GetBAData(SQLCondition,tclientdataset(DLCDS));
  end;
end;

procedure TfrmActionCheckB.btnPrintClick(Sender: TObject);
begin
  inherited;
  PrintActionList;
end;

procedure TfrmActionCheckB.btnSaveListClick(Sender: TObject);
const
  //������ղ�����Ϣ
  sqlListDeatil='insert into SZActionListDeatil(ListID,patientID) values(^%s^,^%s^)';
var
  patientid:string;
  sql:string;
  ReclaimTime:string;
begin
  inherited;
  if clientdtright.IsEmpty then
  begin
    ShowMsgSure('��δǩ�����ݣ�');
    Exit;
  end;

  StartWaitWindow(Format('����%s����',[CheckDesc]));
  try
    try      
      //�����µĵ��� �����浽���ݱ�
      ActionListNum := GenerateActionListNum(FListPrefix,FActionDM);
      ReclaimTime := FormatDateTime('yyyy-mm-dd hh:mm:ss',Now);
      with clientdtRight do
      begin
        DisableControls;
        First;
        while not EOf do
        begin
          patientid:=FieldByName('patientid').AsString;
          //����״̬
          TMidProxy.SqlExecute(Format('update SZBADetail set ActionDM=^%0:s^ , State=^%1:s^ where patientid=^%s^',
          [FActionDM,IntToStr(Ord(ActionOperation)+1),patientid]));
          //���涯����Ϣ
          sql := Format('insert into SZActionRecord(patientID,ActionDM,ActionMC,ActionState,ActionTime,ActionPerson) '
              +'values(^%s^,^%s^,^%s^,^%s^,^%s^,^%s^)',[patientid,FActionDM,ActionMC,
              IntToStr(Ord(ActionOperation)+1),ReclaimTime,G_MainInfo.MainSysInfo.LogonUserName]);
          TMidProxy.SqlExecute(sql);
          //������յ���¼�Ĳ�����Ϣ
          TMidProxy.SqlExecute(Format(sqlListDeatil,[ActionListNum,FieldByName('patientid').AsString]));
          Next;
        end;
        EnableControls;
      end;
      EndWaitWindow;
      clientdtright.EmptyDataSet;
      ShowMsgSure(CheckDesc+'�ɹ�!');
    except
      on ex:Exception do
      begin
        EndWaitWindow;
        WriteErrorLog(ex.Message);
      end;
    end;
  finally
    EndWaitWindow;
  end;
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
   //��ѯ
  GetBAData(condition,tclientdataset(dlcds));
  
end;

procedure TfrmActionCheckB.edtBarcodeKeyDown(Sender: TObject; var Key: Word;
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
      clientdtright.IndexFieldNames :='BarCode';
      if not clientdtright.FindKey([barcode]) then
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
        ChangeData(clienttmp,clientdtright,otRight);
      end
      else
      begin
        ShowMsgSure('�Ѿ���ӵ��б�!');
      end;
      
    end;
  end;
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
      GetBAByListNum(ActionListNum,PriorActionDM,'3',tclientdataset(DLCDS))
    else
      GetBAByListNum(ActionListNum,FActionDM,'1',tclientdataset(DLCDS));
    SetSbSimpleText(Format('��%d������',[dlcds.RecordCount]));
  end;
end;

procedure TfrmActionCheckB.FormCreate(Sender: TObject);
const
  SQLtext ='select * from SZBADetail WHERE 1<>1';
begin
  inherited;
  //������ʾ����
  LoadOffice(cbbOffice);
  //��ѯ��һ����������
  GetPriorActionDM;
  //ǩ��
  if ActionOperation=aoCheckIn then
  begin
    advgrpLeft.Caption := '��ǩ���б�';
    advgrpright.Caption := 'ǩ���б�';
    btnSaveList.Caption := '����ǩ�뵥';
    btnPrint.Caption :='��ӡǩ�뵥';
  end
  else if ActionOperation=aoCheckOut then //ǩ��
  begin
    advgrpLeft.Caption := '��ǩ���б�';
    advgrpright.Caption := 'ǩ���б�';
    btnSaveList.Caption := '����ǩ����';
    btnPrint.Caption :='��ӡǩ����';
  end;
  TMidProxy.SqlOpen(SQLtext,clientdtRight);
  Self.Caption := ActionMC + CheckDesc;
end;

procedure TfrmActionCheckB.GetBAData(Condition: string;var DataSet:TClientDataSet);
var
  SQLText:string;
begin
  //��ѯ
  try
    if UpperCase(LeftStr(Trim(Condition),3)) <> 'AND' then
    begin
      Condition := ' and '+Condition;
    end;
     //ǩ��
    if ActionOperation=aoCheckIn then
    begin
      SQLText :=Format(sql,['3',PriorActionDM,condition]);
    end
    //ǩ��
    else if ActionOperation=aoCheckOut then
    begin
      SQLText :=Format(sql,['1',FActionDM,condition]);  //��ǰ������ǩ��״̬
    end;
    StartWaitWindow('���ڲ�ѯ����...');
    TMidProxy.SqlOpen(SQLText,DataSet);
    if DataSet.IsEmpty then
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
      priorActionState := PriorActionDM+'_3';

    end;
    TMidProxy.SqlOpen(Format('SELECT * FROM SZActionCon WHERE ActionDicDM=^%s^',[FActionDicDM]),clienttmp);
    if not clienttmp.IsEmpty then
    begin
      FActionDM := clienttmp.FieldByName('DM').AsString;
      ActionMC := clienttmp.FieldByName('mc').AsString;
      advtlbrpgr1.Caption.Caption := ActionMC+CheckDesc;
    end;

  end;
end;

procedure TfrmActionCheckB.PrintActionList;
begin

end;

procedure TfrmActionCheckB.SetActionOperation(const value: TActionOperation);
begin
  FActionOperation := value;
  if FActionOperation= aoCheckIn then
    CheckDesc :='ǩ��'
  else
    CheckDesc := 'ǩ��';
end;

end.
