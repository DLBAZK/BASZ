/// <summary>
/// 病案流转动作撤销基类窗体
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
  //查询语句
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
      //字典库的动作代码
    FActionDicDM:string;
     //字典对应的动作代码
    FActionDM:string;
    //动作名称
    ActionMC:string;
     //上一步动作代码
    PriorActionDM:string;
     //上一步动作状态
    priorActionState:string;
     //上一步步骤序号
    PriorityNum:Integer;
    procedure GetPriorActionDM;
  public
    { Public declarations }
    /// <summary>
    /// 动作代码
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
  ReasonDM:string;//撤销原因代码
  ActionState:string;//当前记录的动作状态
  book:Pointer;
  patientid:string;//病人唯一标识
  ReclaimTime:string;//动作操作时间
begin
  inherited;
  if not dlcds.Active then Exit;
  if DLCDS.IsEmpty then Exit;
  
  if cbbReason.ItemIndex =-1 then
  begin
    ShowMsgSure('请选择撤销原因');
    Exit;
  end;
  ReasonDM := GetDmOFCombobox(cbbReason);
  StartWaitWindow('正在撤销...');
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
        //撤销签入
        if RightStr(ActionState,1)='1' then
        begin
           //回收
          if PriorActionDM='' then
          begin
            ActionState :='';
          end
          else
          begin
            //上一步步骤 的签出
            ActionState := PriorActionDM+'_2';
          end;
        end
        else //撤销签出
        begin
          //当前动作的签入
          ActionState := FActionDM+'_1';
        end;
        ReclaimTime := FormatDateTime('yyyy-mm-dd hh:mm:ss',Now);
        //更新病案库状态
        TMidProxy.SqlExecute(Format('update SZBADetail set state =^%s^ where patientid=^%s^ and iscancel=0',[ActionState,patientid]));
        //添加撤销动作记录
        TMidProxy.SqlExecute(Format('insert into SZActionRecord(patientID,ActionDM,ActionMC,ActionState,IsRevoke,ActionTime,ActionPerson) '
                +'values(^%s^,^%s^,^%s^,^%s^,^1^,^%s^,^%s^)',[patientid,FActionDicDM,
                ActionMC,RightStr(ActionState,1),ReclaimTime,G_MainInfo.MainSysInfo.LogonUserName]));
        //添加撤销原因记录
        TMidProxy.SqlExecute(Format('insert into SZActionRevoke(PatientID,RevokeReason,RevokePerson,RevokeTime) '
               +'values(^%s^,^%s^,^%s^,^%s^)',[patientid,ReasonDM,G_MainInfo.MainSysInfo.LogonUserName,ReclaimTime]));
        Next;
      end;
      EnableControls;
      GotoBookmark(book);
    end;
    ShowMsgSure('撤销完成');
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
  StartDate,EndDate:string;//出院日期
  SODM,chiefDoc,zynum,name:string;//科室代码、主管医师、住院号、姓名
  condition :string;//where条件
  SQLText:string;
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
     //可撤销列表
    StartWaitWindow('正在查询数据...');
    TMidProxy.SqlOpen(Format(sql,[Length(FActionDM),FActionDM,condition]),TClientDataSet(DLCDS));
   
    if DLCDS.IsEmpty then
    begin
      dbgrdhleft.DataSource := nil;
      EndWaitWindow;
      ShowMsgSure('未查询到符合的数据!');
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
   //加载科室
  LoadOffice(cbbOffice);
  //加载撤销原因
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
        //是否存在病案库
        TMidProxy.SqlOpen(Format('SELECT * FROM SZBADetail where barcode=^%s^',[barcode]),clienttmp);
        if clienttmp.IsEmpty then
        begin
          ShowMsgSure('病案库不存在此记录');
          Exit;
        end;
        //注销
        if clienttmp.FieldByName('IsCancel').AsBoolean then
        begin
          ShowMsgSure('该病案已被注销!');
          Exit;
        end;

        //判断上一步动作状态
        if LeftStr(clienttmp.FieldByName('state').AsString,Length(FActionDM))<>FActionDM then
        begin
          ShowMsgSure('该病案不属于此流转范围，不能撤销!');
          Exit;
        end;
        //添加病案信息
        ChangeData(clienttmp,DLCDS,otRight);
      end
      else
      begin
        ShowMsgSure('已经添加到列表!');
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
       priorActionState :=PriorActionDM+'_1'; //回收状态
      
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
