/// <summary>
/// 病案流转动作签入签出基类窗体
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

type
   //动作操作类型    aoCheckIn 签入   aoCheckOut 签出    aoRevoke 撤销
  TActionOperation=(aoCheckIn,aoCheckOut,aoRevoke);
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
    btnAddList: TAdvGlowButton;
    btnSaveList: TAdvGlowButton;
    btnPrint: TAdvGlowButton;
    advgrpright: TAdvGroupBox;
    dbgrdhright: TDBGridEh;
    clientdtright: TClientDataSet;
    dsright: TDataSource;
    btnacClose: TAdvGlowButton;
    procedure btnSelClick(Sender: TObject);
    procedure btnAllRightClick(Sender: TObject);
    procedure btnAddListClick(Sender: TObject);
    procedure btnSaveListClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure edtBarcodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    //字典库的动作代码
    FActionDicDM:string;
     //字典对应的动作代码
    FActionDM:string;
    FActionOperation:TActionOperation;
    //上一步动作代码
    PriorActionDM:string;
     //上一步动作状态
    priorActionState:string;
    //动作名称
    ActionMC:string;
    //动作类型描述 签入 签出  10001_1
    ActionTypeDesc:string;
    //上一步步骤序号
    PriorityNum:Integer;
    //动作签入（签出）单号
    ActionListNum:string;
    //动作签入签出描述
    CheckDesc:string;

    procedure SetActionOperation(const value:TActionOperation);
    /// <summary>
    /// 获取上一步动作代码
    /// </summary>
    procedure GetPriorActionDM;
  public
    { Public declarations }
//    Constructor Create(Aowner:TComponent);Override;
    /// <summary>
    /// 动作代码
    /// </summary>
    property  ActionDicDM:string read FActionDicDM write FActionDicDM;
  /// <summary>
  /// 动作操作类型
  /// </summary>
    property ActionOperation:TActionOperation read FActionOperation write SetActionOperation;
  /// <summary>
  /// 打印单子
  /// </summary>
  procedure PrintActionList;virtual;
  end;

var
  frmActionCheckB: TfrmActionCheckB;

implementation
  uses UGFun,UGVar,UCommon,UGShare,UMidProxy,UPublic;
{$R *.dfm}

{ TFrmSuiDBForm1 }

procedure TfrmActionCheckB.btnAddListClick(Sender: TObject);
begin
  inherited;
  if ActionListNum<>'' then
  begin
    ShowMsgSure(Format('存在尚未保存的%s单',[CheckDesc]));
    Exit;
  end;
  //生成新的单号 并保存到数据表
  ActionListNum := GenerateActionListNum(ActionTypeDesc);
  if ActionListNum <>'' then
  begin
    ShowMsgSure('新建成功!');
  end;
end;

procedure TfrmActionCheckB.btnAllRightClick(Sender: TObject);
var
  tag:Integer;
begin
  inherited;
  tag :=(sender as TAdvGlowButton).Tag;
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

procedure TfrmActionCheckB.btnPrintClick(Sender: TObject);
begin
  inherited;
  PrintActionList;
end;

procedure TfrmActionCheckB.btnSaveListClick(Sender: TObject);
const
  //保存回收病历信息
  sqlListDeatil='insert into SZActionListDeatil(ListID,patientID) values(^%s^,^%s^)';
var
  patientid:string;
  sql:string;
  ReclaimTime:string;
begin
  inherited;
  if clientdtright.IsEmpty then
  begin
    ShowMsgSure('尚未签入数据！');
    Exit;
  end;
  if ActionListNum='' then
  begin
    ShowMsgSure('请先新建单号!');
    Exit;
  end;
  StartWaitWindow(Format('正在%s数据',[CheckDesc]));
  try
    try
      ReclaimTime := FormatDateTime('yyyy-mm-dd hh:mm:ss',Now);
      with clientdtRight do
      begin
        DisableControls;
        First;
        while not EOf do
        begin
          patientid:=FieldByName('patientid').AsString;
          TMidProxy.SqlExecute(Format('update SZBADetail set State=^%s^ where patientid=^%s^',
          [ActionTypeDesc,patientid]));
          //保存动作信息
          sql := Format('insert into SZActionRecord(patientID,ActionDM,ActionMC,ActionState,IsRevoke,ActionTime,ActionPerson) '
              +'values(^%s^,^%s^,^%s^,^%s^,^%s^,^%s^,^%s^)',
           [patientid,FActionDM,ActionMC,RightStr(ActionTypeDesc,1),BoolToStr(ActionOperation=aoRevoke),
              ReclaimTime,G_MainInfo.MainSysInfo.LogonUserName]);
          TMidProxy.SqlExecute(sql);
          //保存回收单记录的病人信息
          TMidProxy.SqlExecute(Format(sqlListDeatil,[ActionListNum,FieldByName('patientid').AsString]));
          Next;
        end;
        EnableControls;
      end;
      EndWaitWindow;
      clientdtright.EmptyDataSet;
      ShowMsgSure(CheckDesc+'成功!');
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
const
  sql ='SELECT * FROM SZBADetail where IsCancel=0 and  ISNULL(State,^^)=^%s^ %s';
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
     //签入
    if ActionOperation=aoCheckIn then
    begin
      SQLText := priorActionState;
    end
    //签出
    else if ActionOperation=aoCheckOut then
    begin
      SQLText := FActionDM+'_1';  //当前动作的签入状态
    end;
    StartWaitWindow('正在查询数据...');
    TMidProxy.SqlOpen(Format(sql,[SQLText,condition]),TClientDataSet(DLCDS));
   
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

//constructor TfrmActionCheckB.Create(Aowner: TComponent);
//const
//  SQL ='select * from SZBADetail WHERE 1<>1';
//begin
//  inherited;
//  //加载显示科室
//  LoadOffice(cbbOffice);
//  //查询上一步动作代码
//  GetPriorActionDM;
//  //签入
//  if ActionOperation=aoCheckIn then
//  begin
//    advgrpLeft.Caption := '待签入列表';
//    advgrpright.Caption := '签入列表';
//
//    btnAddList.Caption :='新建签入单';
//    btnSaveList.Caption := '保存签入单';
//    btnPrint.Caption :='打印签入单';
//    ActionTypeDesc :=FActionDM+'_1';
//  end
//  else if ActionOperation=aoCheckOut then //签出
//  begin
//    advgrpLeft.Caption := '待签出列表';
//    advgrpright.Caption := '签出列表';
//    btnAddList.Caption :='新建签出单';
//    btnSaveList.Caption := '保存签出单';
//    btnPrint.Caption :='打印签出单';
//    ActionTypeDesc :=FActionDM+'_2';
//  end;
//  TMidProxy.SqlOpen(SQL,clientdtRight);
//end;

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
        //是否存在病案库
        TMidProxy.SqlOpen(Format('SELECT * FROM SZBADetail where barcode=^%s^',[barcode]),clienttmp);
        if clienttmp.IsEmpty then
        begin
          ShowMsgSure('病案库不存在此记录');
          Exit;
        end;
        //检查状态
        if ActionOperation=aoCheckIn then
        begin
          SQLText := priorActionState;
        end
        //签出
        else if ActionOperation=aoCheckOut then
        begin
          SQLText := FActionDM+'_1';  //当前动作的签入状态
        end;
        TMidProxy.SqlOpen(Format('SELECT * FROM SZBADetail where   ISNULL(State,^^)=^%s^ and  barcode=^%s^',
             [SQLText,barcode]),clienttmp);
        //判断上一步动作状态
        if clienttmp.IsEmpty then
        begin
          ShowMsgSure(Format('该病案未达到%s条件',[CheckDesc]));
          Exit;
        end;
        //是否注销
        if clienttmp.FieldByName('IsCancel').AsBoolean then
        begin
          ShowMsgSure('该条病案信息已注销!');
          Exit;
        end;
        //添加病案信息
        ChangeData(clienttmp,clientdtright,otRight);
      end
      else
      begin
        ShowMsgSure('已经添加到列表!');
      end;
      
    end;
  end;
end;

procedure TfrmActionCheckB.FormCreate(Sender: TObject);
const
  SQL ='select * from SZBADetail WHERE 1<>1';
begin
  inherited;
  //加载显示科室
  LoadOffice(cbbOffice);
  //查询上一步动作代码
  GetPriorActionDM;
  //签入
  if ActionOperation=aoCheckIn then
  begin
    advgrpLeft.Caption := '待签入列表';
    advgrpright.Caption := '签入列表';

    btnAddList.Caption :='新建签入单';
    btnSaveList.Caption := '保存签入单';
    btnPrint.Caption :='打印签入单';
    ActionTypeDesc :=FActionDM+'_1';
  end
  else if ActionOperation=aoCheckOut then //签出
  begin
    advgrpLeft.Caption := '待签出列表';
    advgrpright.Caption := '签出列表';
    btnAddList.Caption :='新建签出单';
    btnSaveList.Caption := '保存签出单';
    btnPrint.Caption :='打印签出单';
    ActionTypeDesc :=FActionDM+'_2';
  end;
  TMidProxy.SqlOpen(SQL,clientdtRight);
  Self.Caption := ActionMC + CheckDesc;
end;

procedure TfrmActionCheckB.GetPriorActionDM;
const
  SQL='SELECT * FROM SZActionCon WHERE PriorityNum =(SELECT PriorityNum-1'
     +' FROM dbo.SZActionCon WHERE ActionDicDM=^%s^)';
var
 clienttmp:TClientDataSet;
begin
  if FActionDicDM<>'' then
  begin
    clienttmp := TClientDataSet.Create(nil);
    AutoFree(clienttmp);
    TMidProxy.SqlOpen(Format(SQL,[FActionDicDM]),clienttmp);
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
    CheckDesc :='签入'
  else
    CheckDesc := '签出';
end;

end.
