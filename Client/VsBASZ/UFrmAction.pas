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
  ComCtrls, AdvDateTimePicker,StrUtils,USZVar, AdvEdit, AdvPageControl,TypInfo;


  type
    //动作操作类型    aoCheckIn 签入   aoCheckOut 签出    aoRevoke 撤销
    TActionOperation=(aoCheckIn,aoCheckOut,aoRevoke);

 const
  //接收病案
  sqlReclaim ='SELECT * FROM SZBADetail where IsCancel=0 and  ISNULL(State,^^)=^^';
  sqlCheck ='SELECT * FROM SZBADetail where IsCancel=0 and  ISNULL(State,^^)=^%0:s^ and ActionDM=^%1:s^ %2:s';
  sqlRevoke ='SELECT (CASE WHEN a.State=^1^ THEN ^已签入^ WHEN a.State='
         +' ^3^ THEN ^已签出^ END) StateDesc,* FROM SZBADetail a LEFT JOIN SZActionCon b'
      +' ON a.ActionDM=b.DM where IsCancel=0 and '
      +' a.ActionDM=^%0:s^ %1:s';
  //流转动作状态描述
  OperationDesc :array [TActionOperation] of string =('签入','签出','撤销');
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
    //上一步步骤序号
    PriorityNum:Integer;
    //动作签入（签出）单号
    ActionListNum:string;
    //动作签入签出描述
    CheckDesc:string;
    //动作单号前缀
    FListPrefix:string;
    procedure SetActionOperation(const value:TActionOperation);
    /// <summary>
    /// 获取上一步动作代码
    /// </summary>
    procedure GetPriorActionDM;
    /// <summary>
    /// 查询病案数据
    /// </summary>
    /// <param name="Condition">查询条件</param>
    procedure GetBAData(Condition:string;var DataSet:TClientDataSet;const Showmsg:Boolean=True);

    procedure SetDM(const value:string);
    /// <summary>
    /// 按照条形码添加病案
    /// </summary>
    /// <param name="barcode"></param>
    /// <param name="dataSet"></param>
    procedure GetBAByBarcode(const barcode:string;var dataSet:TClientDataSet);

    procedure SetGridDataSource;
  public
    { Public declarations }
    property ActionDM:string read FActionDM write SetDM;
    /// <summary>
    /// 指定的动作代码
    /// </summary>
    property  ActionDicDM:string read FActionDicDM write FActionDicDM;
  /// <summary>
  /// 动作操作类型
  /// </summary>
    property ActionOperation:TActionOperation read FActionOperation write SetActionOperation;
    /// <summary>
    /// 动作单号前缀
    /// </summary>
    property ListPrefix:string read FListPrefix write FListPrefix;
  /// <summary>
  /// 打印单子
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
  //撤销
  if advpgcntrlCheck.ActivePageIndex =2 then
  begin
    advpgcntrl1.ActivePageIndex:=1;
    if not clientdtRevoke.Active then
      GetBAData('1<>1',clientdtRevoke,False);
  end
  else //签入、签出
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
       //上架
      if FActionDicDM='105' then
      begin
        lblSJNumber.Visible :=true;
        edtSJNumber.Visible :=true;
        lblSJNumber.Top := lblSendee.Top;
        edtSJNumber.Top := edtsendee.Top;
        btnSaveList.Caption :='上架';
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
    0://全部右移
    begin
      ChangeData(clientleft,clientright,TOrientation(Tag));
    end;
    1: //右移
    begin
      ChangeData(clientleft,clientright,otRight);
    end;
    2: //左移
    begin
      ChangeData(clientright,clientleft,otLeft);
    end;
    3://全部左移
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
    //查询数据
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
  ReasonDM:string;//撤销原因代码
  ActionState:string;//当前记录的动作状态
  NewActionState:string;
  NewActionDM:string;
  patientid:string;//病人唯一标识
  ReclaimTime:string;//动作操作时间
  BANum:string;//病案号
begin
  inherited;
  if not clientdtRevoke.Active then Exit;
  if clientdtRevoke.IsEmpty then Exit;
  
  if cbbReason.ItemIndex =-1 then
  begin
    ShowMsgSure('请选择撤销原因');
    Exit;
  end;
  ReasonDM := GetDmOFCombobox(cbbReason);
  StartWaitWindow('正在撤销...');
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
        //撤销签入
        if ActionState='1' then
        begin
          NewActionState :='3';
          NewActionDM := PriorActionDM;
        end
        else if ActionState='3' then //撤销签出
        begin
          //当前动作的签入
          NewActionState := '1';
          NewActionDM := FActionDM;
        end;
        //撤销已接收的病案 动作和状态恢复为空值
        if FActionDicDM='101' then
        begin
          NewActionState :='';
          NewActionDM := '';
        end;

        ReclaimTime := FormatDateTime('yyyy-mm-dd hh:mm:ss',Now);
           //更新病案库状态
        TMidProxy.SqlExecute(Format('update SZBADetail set ActionDM=^%0:s^ ,'
           + 'state =^%1:s^ where patientid=^%s^ and iscancel=0',
            [NewActionDM,ActionState,patientid]));
        //添加撤销动作记录
        TMidProxy.SqlExecute(Format('insert into SZActionRecord(patientID,ActionDM,ActionMC,ActionState,ActionTime,ActionPerson) '
                +'values(^%s^,^%s^,^%s^,^-%s^,^%s^,^%s^)',[patientid,FActionDM,
                ActionMC,ActionState,ReclaimTime,G_MainInfo.MainSysInfo.LogonUserName]));
        //添加撤销原因记录
        TMidProxy.SqlExecute(Format('insert into SZActionRevoke(PatientID,RevokeReason,RevokePerson,RevokeTime) '
               +'values(^%s^,^%s^,^%s^,^%s^)',[patientid,ReasonDM,G_MainInfo.MainSysInfo.LogonUserName,ReclaimTime]));
        //删除上架记录
        TMidProxy.SqlExecute(Format('DELETE FROM SZBASJ WHERE patientid =^%s^ AND BANumber =^%s^',[patientid,BANum]));
        Next;
      end;
      EnableControls;
    end;
    EndWaitWindow;
    clientdtRevoke.EmptyDataSet;
    ShowMsgSure('撤销完成');
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
  //保存回收病历信息
  sqlListDeatil='insert into SZActionListDeatil(ListID,patientID) values(^%s^,^%s^)';
    //保存回收单记录
  SQL1 ='insert into SZReclaim(ListNum,Carrier,Sendee,ReceiveTime) values(^%s^,^%s^,^%s^,^%s^)';
  sqlSJ='insert into SZBASJ (patientID,BANumber,SJNumber) values (^%s^,^%s^,^%s^)';
var
  patientid:string;
  sql:string;
  ReclaimTime:string;
  procedure SaveBA(var DataSet:TClientDataSet);
  var
    carrier,sendee:string;//运送人、接收人
    BAstate:string;//动作状态
    SJNum:string;
    BANum:string;//病案号
  begin
    if FActionOperation = aoCheckIn then
      BAstate := '1'
    else if FActionOperation=aoCheckOut then
      BAstate :='3' ;
    //病案接收处理
    if FActionDicDM = '101' then
    begin
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

    end
    else  if FActionDicDM = '105' then
    begin
       //签出即上架 操作
       if FActionOperation=aoCheckOut then
       begin
          SJNum :=edtSJNumber.Text;
          if SJNum ='' then
          begin
            ShowMessage('请输入上架号');
            Exit;
          end;
       end;
    end;
    StartWaitWindow(Format('正在%s数据',[CheckDesc]));
    try
      //生成新的单号 并保存到数据表
      ActionListNum := GenerateActionListNum(FListPrefix,FActionDM);
      ReclaimTime := FormatDateTime('yyyy-mm-dd hh:mm:ss',Now);
      if FActionDicDM ='101' then
      begin
         //保存病案接收单信息
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
          //更新病案状态
          TMidProxy.SqlExecute(Format('update SZBADetail set ActionDM=^%0:s^ ,'
           +' State=^%1:s^ where patientid=^%s^',[FActionDM,BAstate,patientid]));
          //保存动作信息
          sql := Format('insert into SZActionRecord(patientID,ActionDM,ActionMC,ActionState,ActionTime,ActionPerson) '
              +'values(^%s^,^%s^,^%s^,^%s^,^%s^,^%s^)',[patientid,FActionDM,ActionMC,BAstate,
              ReclaimTime,G_MainInfo.MainSysInfo.LogonUserName]);
          TMidProxy.SqlExecute(sql);
          //保存回收单记录的病人信息
          TMidProxy.SqlExecute(Format(sqlListDeatil,[ActionListNum,FieldByName('patientid').AsString]));
          //签出 保存上架号记录
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
      ShowMsgSure(CheckDesc+'成功!');
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
  StartDate,EndDate:string;//出院日期
  SODM,chiefDoc,zynum,name:string;//科室代码、主管医师、住院号、姓名
  condition :string;//where条件
begin
  inherited;
  if edtListNum.Text<>'' then
  begin
    SendMessage(edtListNum.Handle,WM_KEYDOWN,VK_RETURN,0);
    Exit;
  end;
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
  FActionOperation := TActionOperation(advpgcntrlCheck.ActivePageIndex);
  if FActionOperation =aoCheckIn then
   //查询
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
  ActionListNum:string; //单号

begin
  inherited;
   //回车查询单号的病案数据
  if Key=VK_RETURN then
  begin
    ActionListNum :=Trim(edtListNum.Text);
    if ActionListNum='' then Exit;
    //按照单号查询病案
    if FActionOperation=aoCheckIn then
      GetBAByListNum(ActionListNum,PriorActionDM,'3',clientdtInLeft)
    else if FActionOperation=aoCheckOut then
      GetBAByListNum(ActionListNum,FActionDM,'1',clientdtOutLeft)
    else if FActionOperation=aoRevoke then
      GetBAByListNum(ActionListNum,FActionDM,clientdtRevoke);
    SetSbSimpleText(Format('共%d条数据',[clientdtInLeft.RecordCount]));
  end;
end;

procedure TfrmActionCheckB.FormCreate(Sender: TObject);
const
  SQLtext ='select * from SZBADetail WHERE 1<>1';
begin
  inherited;
  edtsendee.Text :=G_MainInfo.MainSysInfo.LogonUserName;
  //加载显示科室
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
    //是否存在病案库
    TMidProxy.SqlOpen(Format('SELECT * FROM SZBADetail where barcode=^%s^',[barcode]),clienttmp);
    if clienttmp.IsEmpty then
    begin
      ShowMsgSure('病案库不存在此记录');
      Exit;
    end;
    //查询
    GetBAData(Format(' barcode=^%s^',[barcode]),clienttmp);
    //判断上一步动作状态
    if clienttmp.IsEmpty then Exit;
    //添加病案信息
    ChangeData(clienttmp,dataSet,otRight);
  end
  else
  begin
    ShowMsgSure('已经添加到列表!');
  end;
end;

procedure TfrmActionCheckB.GetBAData(Condition: string;var DataSet:TClientDataSet;const Showmsg:Boolean=True);
var
  SQLText:string;
begin
  //查询
  try
    if UpperCase(LeftStr(Trim(Condition),3)) <> 'AND' then
    begin
      Condition := ' and '+Condition;
    end;
     //接收病案
    if FActionDicDM ='101' then
    begin
      SQLText :=sqlReclaim+condition;
      if ActionOperation = aoRevoke then   //撤销
      begin
        SQLText := Format(sqlRevoke,[FActionDM,Condition]);
      end;
    end
    else
    begin
        //签入
      if ActionOperation=aoCheckIn then
      begin
        SQLText :=Format(sqlCheck,['3',PriorActionDM,condition]);
      end
      //签出
      else if ActionOperation=aoCheckOut then
      begin
        SQLText :=Format(sqlCheck,['1',FActionDM,condition]);  //当前动作的签入状态
      end
      else if ActionOperation = aoRevoke then   //撤销
      begin
        SQLText := Format(sqlRevoke,[FActionDM,Condition]);
      end;
    end;

    StartWaitWindow('正在查询数据...');
    TMidProxy.SqlOpen(SQLText,DataSet);
    if DataSet.IsEmpty and Showmsg then
    begin
      EndWaitWindow;
      ShowMsgSure('未查询到符合的数据');      
    end;
  finally
    EndWaitWindow;
    SetSbSimpleText(Format('共%d条数据',[DataSet.RecordCount]));
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
    headerCaption := '病 案 接 收 单'
  else if FActionDicDM='105' then
    headerCaption := '病 案 上 架 单'
  else
  begin
    if ActionOperation = aoCheckIn then
      headerCaption :='病 案 签 入 单'
    else if actionoperation=aoCheckOut then
      headerCaption :='病 案 签 出 单';
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
    CheckDesc :='签入'
  else
    CheckDesc := '签出';
end;

procedure TfrmActionCheckB.SetDM(const value: string);
const
  SQLDicDM ='SELECT * FROM SZActionCon where dm =^%s^';
begin
  if value <>'' then
  begin
    FActionDM := value;
    //获取指定的动作代码
    FActionDicDM :=GetFieldValue(Format(SQLDicDM,[FActionDM]),'ActionDICDM');
     //接收
    if FActionDicDM ='101' then
    begin
      lblCarraier.Visible := True;
      edtcarrier.Visible := true;
      lblSendee.Visible := True;
      edtsendee.Visible :=true;
      btnSaveList.Caption := '接收';
      advtbshtCheckOut.Visible :=False;
      advtbshtCheckOut.TabVisible :=False;
    end ;


    //根据配置的动作名称 生成单号前缀 规则：拼音码
    ActionMC := GetFieldValue(Format(SQLDicDM,[FActionDM]),'MC');
    FListPrefix := GetStringPy(ActionMC,Length(ActionMC) div 2);
    //获取上一步的动作代码
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
