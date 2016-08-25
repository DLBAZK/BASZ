/// <summary>
/// ��������
/// </summary>
/// <author>jdl</author>
///<date>2016-08-16</date>
unit UFrmReclaim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBForm, DB, ActnList, DBClient, UDlClientDataset, DosMove,
  AdvPanel, AdvAppStyler, AdvToolBar, AdvToolBarStylers, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, ExtCtrls,UVsMidClassList, ComCtrls,
  AdvDateTimePicker, StdCtrls, SUIEdit, AdvFontCombo, AdvGlowButton,
  DBGridEhGrouping, GridsEh, DBGridEh, AdvGroupBox, AdvSplitter, TFlatButtonUnit,DateUtils;

  const
  sql ='SELECT * FROM SZBADetail where IsCancel=0 and  ISNULL(State,^^)=^^';

type
  TfrmReclaim = class(TFrmSuiDBForm)
    advpnlLeft: TAdvPanel;
    advpnl1: TAdvPanel;
    lbl2: TLabel;
    advdtmpckrStart: TAdvDateTimePicker;
    advdtmpckrEnd: TAdvDateTimePicker;
    lbl3: TLabel;
    lbl4: TLabel;
    edtChiefDoctor: TsuiEdit;
    lbl5: TLabel;
    cbbOffice: TAdvOfficeComboBox;
    lbl6: TLabel;
    edtzynumber: TsuiEdit;
    lbl7: TLabel;
    edtName: TsuiEdit;
    btnSel: TAdvGlowButton;
    btnMore: TAdvGlowButton;
    dbgrdhleft: TDBGridEh;
    advgrp1: TAdvGroupBox;
    advpnl2: TAdvPanel;
    clientdtRight: TClientDataSet;
    dsRight: TDataSource;
    advpnl5: TAdvPanel;
    advpnl6: TAdvPanel;
    lbl1: TLabel;
    lbl8: TLabel;
    lbl10: TLabel;
    edtcarrier: TsuiEdit;
    edtsendee: TsuiEdit;
    edtBarcode: TsuiEdit;
    btnSaveList: TAdvGlowButton;
    btnPrint: TAdvGlowButton;
    advgrp3: TAdvGroupBox;
    dbgrdhright: TDBGridEh;
    advspltr1: TAdvSplitter;
    advpnl3: TAdvPanel;
    btnAllRight: TAdvGlowButton;
    btnRight: TAdvGlowButton;
    btnLeft: TAdvGlowButton;
    btnAllLeft: TAdvGlowButton;
    btnacClose: TAdvGlowButton;
    procedure btnSelClick(Sender: TObject);
    procedure btnAllRightClick(Sender: TObject);
    procedure btnSaveListClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure edtBarcodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnMoreClick(Sender: TObject);
  private
    { Private declarations }
    ReclaimListID:string;//���յ���
    /// <summary>
    /// ���没��������Ϣ
    /// </summary>
    /// <param name="actionDM"></param>
    /// <param name="actionMC"></param>
    procedure SaveActionRecord(actionDM,actionMC:string);
  public
    { Public declarations }
    constructor Create(Aowner:TComponent);override;
  end;

var
  frmReclaim: TfrmReclaim;

implementation
   uses UGFun,UGVar,UCommon,UMidProxy,URptReclaim,UFrmPrint,
   UQickRepPreview,UPublic,UFrmMoreTJ;
{$R *.dfm}
{ TfrmReclaim }

procedure TfrmReclaim.btnAllRightClick(Sender: TObject);
var
  tag:Integer;
  mark:Pointer;
begin
  inherited;
  tag := (sender as TAdvGlowButton).Tag;
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

procedure TfrmReclaim.btnMoreClick(Sender: TObject);
var
  SQLCondition:string;
begin
  inherited;
  //��������
  SQLCondition := GetCondition;
  if SQLCondition<> '' then
  begin
    TMidProxy.SqlOpen(Format(sql+' and %s',[SQLCondition]),tclientdataset(dlcds));
    if dlcds.IsEmpty then
    begin
      ShowMsgSure('δ��ѯ�����ϵ�����');
      Exit;
    end;
    SetSbSimpleText(Format('��%d����¼',[dlcds.RecordCount]));
  end;

end;

procedure QuickRepPreview(Sender: TObject);
begin

end;
procedure TfrmReclaim.btnPrintClick(Sender: TObject);
const
  SQLtext='select *,(SELECT xbmc FROM VsZhdm WHERE ISNULL(xbmc,^^)<> ^^ AND dm=b.sex)xbmc '
     +' from SZActionListDeatil a left join SZBADetail b on a.patientid=b.patientid'
     +' where a.listid=^%s^ ';
begin
  inherited;
  
  if ReclaimListID ='' then Exit;
  frmPrint := TfrmPrint.Create(nil);
  AutoFree(frmPrint);
  RptReclaim := TRptYSGZYLB.Create(nil);
  TMidProxy.SqlOpen(Format(SQLtext,[ReclaimListID]),RptReclaim.Cds1);
  RptReclaim.yymc.Caption :='ҽԺ���ƣ�'+ G_MainInfo.MainSysInfo.HospitalName;
  RptReclaim.qrlblzbr.Caption :=RptReclaim.qrlblzbr.Caption + G_MainInfo.MainSysInfo.LogonUserName;
  //frmPrint.qrprvwprint.QRPrinter :=   RptReclaim.Printer;
  RptReclaim.Preview;
  //TQuickRepPreview(frmPrint.qrprvwprint).Preview(RptReclaim.QRPrinter);
  //frmprint.ShowModal;
end;

procedure TfrmReclaim.btnSaveListClick(Sender: TObject);
const
   //������յ���¼
  SQL1 ='insert into SZReclaim(ListNum,Carrier,Sendee,ReceiveTime) values(^%s^,^%s^,^%s^,^%s^)';
  //������ղ�����Ϣ
  sql2='insert into SZActionListDeatil(ListID,patientID) values(^%s^,^%s^)';

var
  carrier,sendee:string;//�����ˡ�������
  clienttmp:TClientDataSet;
  ActionDM,ActionMC:string;  //���մ��롢��������
  book:Pointer;
  patientid,sql:string;
  ReclaimTime:string;
begin
  inherited;

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
  try
    StartWaitWindow('���ڻ��ղ���...');
     //���ɵ���
    ReclaimListID:=GenerateActionListNum('HS','1');
    //�޸�״̬Ϊ�ѻ���
    clienttmp := TClientDataSet.Create(nil);
    AutoFree(clienttmp);
    //��ѯ���ն�������
    TMidProxy.SqlOpen('select dm,mc from SZActionCon where prioritynum =1',clienttmp);
    if clienttmp.IsEmpty then
    begin
      ShowMsgSure('���ն�������Ϊ�գ���Ҫ����!');
      Exit;
    end;
    ActionDM := clienttmp.FieldByName('dm').AsString;
    ActionMC := clienttmp.FieldByName('mc').AsString;
    ReclaimTime := FormatDateTime('yyyy-mm-dd hh:mm:ss',Now);
    //���²�����״̬
    book :=clientdtRight.GetBookmark;
    with clientdtRight do
    begin
      DisableControls;
      First;
      while not EOf do
      begin
        patientid:=FieldByName('patientid').AsString;
        TMidProxy.SqlExecute(Format('update SZBADetail set State=^3^ ,ActionDM=^%s^ where patientid=^%s^',
        [ActionDM,patientid]));
        //���涯����Ϣ
        sql := Format('insert into SZActionRecord(patientID,ActionDM,ActionMC,ActionState,ActionTime,ActionPerson) '
            +'values(^%s^,^%s^,^%s^,^3^,^%s^,^%s^)',
         [patientid,actionDM,actionMC,ReclaimTime,G_MainInfo.MainSysInfo.LogonUserName]);
        TMidProxy.SqlExecute(sql);
        //������յ���¼�Ĳ�����Ϣ
        TMidProxy.SqlExecute(Format(sql2,[ReclaimListID,FieldByName('patientid').AsString]));
        Next;
      end;
      EnableControls;
    end;
    clientdtRight.GotoBookmark(book);

    //������յ���Ϣ
    TMidProxy.SqlExecute(Format(SQL1,[ReclaimListID,carrier,sendee,ReclaimTime]));
    EndWaitWindow;
    clientdtRight.EmptyDataSet;
    ShowMsgSure('�������!');
  except
    on ex:Exception do
    begin
      WriteErrorLog(ex.Message);
      EndWaitWindow;;
    end;
  end;
end;

procedure TfrmReclaim.btnSelClick(Sender: TObject);
var
  StartDate,EndDate:string;//��Ժ����
  SODM,chiefDoc,zynum,name:string;//���Ҵ��롢����ҽʦ��סԺ�š�����
  condition :string;//where����
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
    StartWaitWindow('���ڲ�ѯ����...');
    DLCDS.Mid_Open(Escape(sql+condition));
    if DLCDS.IsEmpty then
    begin
      EndWaitWindow;
      ShowMsgSure('δ��ѯ�����ϵ�����!');
    end;
  finally
    EndWaitWindow;
  end;
end;

constructor TfrmReclaim.Create(Aowner: TComponent);
const
  SQLtext ='select * from SZBADetail WHERE 1<>1';
begin
  inherited Create(Aowner,EuSZReclaim,SQLtext);
  LoadOffice(cbbOffice);
  TMidProxy.SqlOpen(SQLtext,clientdtRight);
  //������
  edtsendee.Text :=G_MainInfo.MainSysInfo.LogonUserName;
end;

procedure TfrmReclaim.edtBarcodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
   barcode:string;
   clienttmp:TClientDataSet;
begin
  inherited;
  barcode := edtBarcode.Text;
  if Key=VK_RETURN then
  begin
    clientdtright.IndexFieldNames :='BarCode';
    if  clientdtright.FindKey([barcode]) then
    begin
      ShowMsgSure('�ò�������ӵ��б�');
      Exit;
    end;
    clienttmp :=TClientDataSet.Create(nil);
    AutoFree(clienttmp);
    TMidProxy.SqlOpen(Format('SELECT * FROM SZBADetail where ISNULL(State,^^)=^^ and barcode=^%s^',
       [barcode]),clienttmp);
    if clienttmp.IsEmpty then
    begin
      ShowMsgSure('�������в����ڸò�����Ϣ!');
      Exit;
    end;
    if clienttmp.FieldByName('IsCancel').AsBoolean then
    begin
      ShowMsgSure('�ò����ѱ�ע��');
      Exit;
    end;
    ChangeData(clienttmp,clientdtRight,otRight);
    
  end;
end;

procedure TfrmReclaim.SaveActionRecord(actionDM, actionMC: string);
var
  book:Pointer;
  patientid:string;//����Ψһ��ʶ
  sql:string;
begin
  book := clientdtRight.GetBookmark;
  with clientdtRight do
  begin
    DisableControls;
    First;
    while not Eof do
    begin
      if FieldByName('state').AsString=actionDM+'_1' then
      begin
        patientid:=FieldByName('patientid').AsString;
        sql := Format('insert into SZActionRecord values(^%s^,^%s^,^%s^,^1^,^0^,getdate(),^%s^)',
         [patientid,actionDM,actionMC,G_MainInfo.MainSysInfo.LogonUserName]);
        TMidProxy.SqlExecute(sql);
      end;
      Next;
    end;
    EnableControls;
  end;
  clientdtRight.GotoBookmark(book);
end;

initialization
  classes.RegisterClass(TfrmReclaim);
finalization
  classes.UnRegisterClass(TfrmReclaim);

end.
