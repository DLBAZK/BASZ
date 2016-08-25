/// <summary>
/// 病案回收
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
    ReclaimListID:string;//回收单号
    /// <summary>
    /// 保存病案动作信息
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
    0://全部右移
    begin
      ChangeData(TClientDataSet(DLCDS),clientdtRight,otAllRight);
      dbgrdhleft.DataSource := nil;
      if not clientdtRight.IsEmpty then
       clientdtRight.First;
    end;
    1: //右移
    begin
      ChangeData(TClientDataSet(DLCDS),clientdtRight,otRight);
      if dbgrdhright.DataSource = nil then
        dbgrdhright.DataSource := dsRight;
    end;
    2: //左移
    begin
      ChangeData(clientdtRight,TClientDataSet(DLCDS),otLeft);
      if dbgrdhleft.DataSource=nil then
        dbgrdhleft.DataSource := ds1;
    end;
    3://全部左移
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
  //更多条件
  SQLCondition := GetCondition;
  if SQLCondition<> '' then
  begin
    TMidProxy.SqlOpen(Format(sql+' and %s',[SQLCondition]),tclientdataset(dlcds));
    if dlcds.IsEmpty then
    begin
      ShowMsgSure('未查询到符合的数据');
      Exit;
    end;
    SetSbSimpleText(Format('共%d条记录',[dlcds.RecordCount]));
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
  RptReclaim.yymc.Caption :='医院名称：'+ G_MainInfo.MainSysInfo.HospitalName;
  RptReclaim.qrlblzbr.Caption :=RptReclaim.qrlblzbr.Caption + G_MainInfo.MainSysInfo.LogonUserName;
  //frmPrint.qrprvwprint.QRPrinter :=   RptReclaim.Printer;
  RptReclaim.Preview;
  //TQuickRepPreview(frmPrint.qrprvwprint).Preview(RptReclaim.QRPrinter);
  //frmprint.ShowModal;
end;

procedure TfrmReclaim.btnSaveListClick(Sender: TObject);
const
   //保存回收单记录
  SQL1 ='insert into SZReclaim(ListNum,Carrier,Sendee,ReceiveTime) values(^%s^,^%s^,^%s^,^%s^)';
  //保存回收病历信息
  sql2='insert into SZActionListDeatil(ListID,patientID) values(^%s^,^%s^)';

var
  carrier,sendee:string;//运送人、接收人
  clienttmp:TClientDataSet;
  ActionDM,ActionMC:string;  //回收代码、回收名称
  book:Pointer;
  patientid,sql:string;
  ReclaimTime:string;
begin
  inherited;

  if edtcarrier.Text ='' then
  begin
    ShowMsgSure('运送人不能为空!');
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
    StartWaitWindow('正在回收病案...');
     //生成单号
    ReclaimListID:=GenerateActionListNum('HS','1');
    //修改状态为已回收
    clienttmp := TClientDataSet.Create(nil);
    AutoFree(clienttmp);
    //查询回收动作代码
    TMidProxy.SqlOpen('select dm,mc from SZActionCon where prioritynum =1',clienttmp);
    if clienttmp.IsEmpty then
    begin
      ShowMsgSure('接收动作代码为空，需要配置!');
      Exit;
    end;
    ActionDM := clienttmp.FieldByName('dm').AsString;
    ActionMC := clienttmp.FieldByName('mc').AsString;
    ReclaimTime := FormatDateTime('yyyy-mm-dd hh:mm:ss',Now);
    //更新病案库状态
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
        //保存动作信息
        sql := Format('insert into SZActionRecord(patientID,ActionDM,ActionMC,ActionState,ActionTime,ActionPerson) '
            +'values(^%s^,^%s^,^%s^,^3^,^%s^,^%s^)',
         [patientid,actionDM,actionMC,ReclaimTime,G_MainInfo.MainSysInfo.LogonUserName]);
        TMidProxy.SqlExecute(sql);
        //保存回收单记录的病人信息
        TMidProxy.SqlExecute(Format(sql2,[ReclaimListID,FieldByName('patientid').AsString]));
        Next;
      end;
      EnableControls;
    end;
    clientdtRight.GotoBookmark(book);

    //保存回收单信息
    TMidProxy.SqlExecute(Format(SQL1,[ReclaimListID,carrier,sendee,ReclaimTime]));
    EndWaitWindow;
    clientdtRight.EmptyDataSet;
    ShowMsgSure('接收完成!');
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
  StartDate,EndDate:string;//出院日期
  SODM,chiefDoc,zynum,name:string;//科室代码、主管医师、住院号、姓名
  condition :string;//where条件
begin
  inherited;
  if advdtmpckrStart.Date > advdtmpckrEnd.Date then
  begin
    ShowMsgSure('开始日期不能大于结束日期');
    Exit;
  end;
  StartDate := FormatDateTime('yyyy-mm-dd',advdtmpckrStart.Date);
  EndDate := FormatDateTime('yyyy-mm-dd',advdtmpckrEnd.Date);
  condition := Format(' and CYRQ >= ^%s^ AND CYRQ <= ^%s^ ',[StartDate,EndDate]);
  //科别
  if cbbOffice.ItemIndex>-1 then
  begin
    SODM := GetDmOFCombobox(cbbOffice);
    if SODM<>'0000' then
      condition := condition + Format(' and RYKB=^%s^',[SODM]);
  end;
  //主管医师
  if edtChiefDoctor.Text <>'' then
  begin
    chiefDoc := edtChiefDoctor.Text;
    condition := condition +format(' and  chiefDoctor=^%s^',[chiefDoc]);
  end;
  //住院号
  if edtzynumber.Text <> '' then
  begin
    zynum := edtzynumber.Text;
    condition := condition +format(' and zynumber =^%s^',[zynum]);
  end;
  //病人姓名
  if edtName.Text <>'' then
  begin
    name := edtName.Text;
    condition := condition +format(' and name = ^%s^',[name]);
  end;
  //查询
  try
    StartWaitWindow('正在查询数据...');
    DLCDS.Mid_Open(Escape(sql+condition));
    if DLCDS.IsEmpty then
    begin
      EndWaitWindow;
      ShowMsgSure('未查询到符合的数据!');
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
  //接收人
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
      ShowMsgSure('该病案已添加到列表');
      Exit;
    end;
    clienttmp :=TClientDataSet.Create(nil);
    AutoFree(clienttmp);
    TMidProxy.SqlOpen(Format('SELECT * FROM SZBADetail where ISNULL(State,^^)=^^ and barcode=^%s^',
       [barcode]),clienttmp);
    if clienttmp.IsEmpty then
    begin
      ShowMsgSure('病案库中不存在该病案信息!');
      Exit;
    end;
    if clienttmp.FieldByName('IsCancel').AsBoolean then
    begin
      ShowMsgSure('该病案已被注销');
      Exit;
    end;
    ChangeData(clienttmp,clientdtRight,otRight);
    
  end;
end;

procedure TfrmReclaim.SaveActionRecord(actionDM, actionMC: string);
var
  book:Pointer;
  patientid:string;//病人唯一标识
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
