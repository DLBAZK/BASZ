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
    btnAddList: TAdvGlowButton;
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
    procedure btnSelClick(Sender: TObject);
    procedure btnAllRightClick(Sender: TObject);
    procedure btnAddListClick(Sender: TObject);
    procedure btnSaveListClick(Sender: TObject);
  private
    { Private declarations }
    ReclaimListID:string;//回收单号
    /// <summary>
    /// 加载显示科室
    /// </summary>
    procedure LoadOffice;
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
   uses UGFun,UGVar,UCommon,UMidProxy;
{$R *.dfm}
{ TfrmReclaim }

procedure TfrmReclaim.btnAddListClick(Sender: TObject);
const
  sql ='SELECT TOP 1 Right(ListID,3) ListNum FROM SZActionList WHERE listtype=1 ORDER BY listtime DESC';
var
 clientdttmp:TClientDataSet;
 num,i:Integer;
begin
  inherited;
  if ReclaimListID<>'' then
  begin
    ShowMsgSure('上一步操作的回收单未保存!');
    Exit;
  end;
  clientdttmp := TClientDataSet.Create(nil);
  AutoFree(clientdttmp);
  TMidProxy.SqlOpen(sql,clientdttmp);
  ReclaimListID := Format('H%s',[FormatDateTime('yyyymmdd',Now)]);
  if clientdttmp.IsEmpty then
  begin
    ReclaimListID :=ReclaimListID+'001';
  end
  else
  begin
    num := clientdttmp.FieldByName('ListNum').AsInteger +1;
    for I := 0 to 3-length(IntToStr(num))-1 do
    begin
      ReclaimListID := ReclaimListID+'0';
    end;
    ReclaimListID := ReclaimListID +inttostr(num);
  end;
  try
    TMidProxy.SqlExecute(Format('insert into SZActionList values(^%s^,1,GETDATE(),^%s^)',[ReclaimListID,G_MainInfo.MainSysInfo.LogonUserName]));
    ShowMsgSure('新建完成!');
  except
    on ex:Exception do
    begin
      WriteErrorLog(ex.Message);
    end;
  end;
end;

procedure TfrmReclaim.btnAllRightClick(Sender: TObject);

  procedure MoveData(source,Dest:TClientDataSet);
  var
    patientID:string;//病人唯一标识
    i:Integer;
  begin
    //病人唯一标识 索引
    Dest.IndexFieldNames := 'patientid';

    with source do
    begin
      patientID :=FieldByName('patientID').AsString;
      //不存在则添加
      if not Dest.FindKey([patientid]) then
      begin
        Dest.Append;
        for I := 0 to source.FieldCount-1 do
        begin
          Dest.FieldByName(source.Fields[i].FieldName).AsString :=source.Fields[i].AsString;
        end;
        Dest.Post;
        Delete;
      end;
    end;
  end;
   procedure LeftOrRight(source,dest:TClientDataSet);
  begin
    if not source.Active  then Exit;
    if source.IsEmpty then Exit;
    if not dest.Active then Exit;

    MoveData(source,dest);
  end;
var
  tag:Integer;
  mark:Pointer;
begin
  inherited;
  tag := (sender as TAdvGlowButton).Tag;
  case tag of
    0://全部右移
    begin
      if not DLCDS.Active then Exit;
      if DLCDS.IsEmpty then Exit;
      with DLCDS do
      begin
        StartWaitWindow('正在移动数据...');
        try
          DisableControls;
          First;
          while not Eof do
          begin
           //移动数据
           MoveData(TClientDataSet(DLCDS),clientdtRight);
           First;
          end;
          EnableControls;
        finally
          EndWaitWindow;
          dbgrdhleft.DataSource := nil;
          if not clientdtRight.IsEmpty then
           clientdtRight.First;
        end;
      end;
    end;
    1: //右移
    begin
      LeftOrRight(TClientDataSet(DLCDS),clientdtRight);
      if dbgrdhright.DataSource = nil then
        dbgrdhright.DataSource := dsRight;
    end;
    2: //左移
    begin
      LeftOrRight(clientdtRight,TClientDataSet(DLCDS));
      if dbgrdhleft.DataSource=nil then
        dbgrdhleft.DataSource := ds1;
    end;
    3://全部左移
    begin
      if not clientdtRight.Active then Exit;
      if clientdtRight.IsEmpty then Exit;
      with clientdtRight do
      begin
        StartWaitWindow('正在移动数据...');
        try
          DisableControls;
          First;
          while not Eof do
          begin
           //移动数据
           MoveData(clientdtRight,TClientDataSet(DLCDS));
           First;
          end;
          EnableControls;
        finally
          EndWaitWindow;
           dbgrdhright.DataSource := nil;
          if not DLCDS.IsEmpty then
           DLCDS.First;
        end;
      end;
    end;
  end;
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
  if ReclaimListID='' then
  begin
    ShowMsgSure('请先新建回收单!');
    Exit;
  end;
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
    //修改状态为已回收
    clienttmp := TClientDataSet.Create(nil);
    AutoFree(clienttmp);
    //查询回收动作代码
    TMidProxy.SqlOpen('select dm,mc from SZActionCon where prioritynum =1',clienttmp);
    if clienttmp.IsEmpty then
    begin
      ShowMsgSure('回收动作代码为空，需要配置!');
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
        TMidProxy.SqlExecute(Format('update SZBADetail set State=^%s^ where patientid=^%s^',
        [Format('%s_1',[ActionDM]),patientid]));
        //保存动作信息
        sql := Format('insert into SZActionRecord(patientID,ActionDM,ActionMC,ActionState,IsRevoke,ActionTime,ActionPerson) '
            +'values(^%s^,^%s^,^%s^,^1^,^0^,^%s^,^%s^)',
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
    ReclaimListID := '';
    ShowMsgSure('回收完成!');
  except
    on ex:Exception do
    begin
      WriteErrorLog(ex.Message);
      EndWaitWindow;;
    end;
  end;
end;

procedure TfrmReclaim.btnSelClick(Sender: TObject);
 const
  sql ='SELECT * FROM dbo.SZBADetail where IsCancel=0 and  ISNULL(State,^^)=^^';
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
  SQL ='select * from SZBADetail WHERE 1<>1';
begin
  inherited Create(Aowner,EuSZReclaim,SQL);
  LoadOffice;
 // advdtmpckrStart.Date := DateOf(StartOfTheMonth(Now));
  TMidProxy.SqlOpen(SQL,clientdtRight);
end;

procedure TfrmReclaim.LoadOffice;
const
  sql='Select Isnull(UserKS,^^)UserKS from VsUser where usercode = ^%s^';
  officeSql='Select SoDm,SoMC,SoPy From VsSOffice Where SoTy<>1 AND   SODM=^%s^';
var
 clienttmp:TClientDataSet;
 ks:string;  //用户科室
begin
  //当前用户是否设置科室
  try
    clienttmp := TClientDataSet.Create(nil);
    AutoFree(clienttmp);
    TMidProxy.SqlOpen(Format(sql,[G_MainInfo.MainSysInfo.LogonUserCode]),clienttmp);
    if not clienttmp.IsEmpty then
    begin
      ks :=clienttmp.FieldByName('UserKS').AsString;
      if ks<>'' then
      begin
        FillCombobox(Format(officeSql,[ks]),'SoDm','SoMC',cbbOffice);
        cbbOffice.ItemIndex :=0;
        Exit;
      end;

    end;
  finally
   FillCombobox_ZyKS(cbbOffice);
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
