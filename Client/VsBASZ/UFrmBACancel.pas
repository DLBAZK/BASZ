/// <summary>
/// 病案注销窗体
/// </summary>
/// <author>jdl</author>
///<date>2016-08-25</date>

unit UFrmBACancel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBListForm, DBGridEhGrouping, AdvEdit, ExtCtrls, ComCtrls,
  AdvDateTimePicker, AdvFontCombo, StdCtrls, SUIEdit, AdvGroupBox, PrnDbgeh, DB,
  ActnList, DBClient, UDlClientDataset, DosMove, AdvPanel, AdvAppStyler,
  AdvToolBar, AdvToolBarStylers, AdvOfficeStatusBar, AdvOfficeStatusBarStylers,
  GridsEh, DBGridEh, AdvGlowButton,UVsMidClassList;

  const
  sql ='SELECT *,Iscancel bz FROM SZBADetail where %s';

type
  TfrmBACancel = class(TFrmSuiDBListForm)
    advgrp1: TAdvGroupBox;
    lbl2: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl4: TLabel;
    lbl7: TLabel;
    lbl3: TLabel;
    edtzynumber: TsuiEdit;
    advdtmpckrStart: TAdvDateTimePicker;
    advdtmpckrEnd: TAdvDateTimePicker;
    edtName: TsuiEdit;
    edtChiefDoctor: TsuiEdit;
    btnSel: TAdvGlowButton;
    btnMore: TAdvGlowButton;
    pnl1: TPanel;
    lbl8: TLabel;
    advedtBarCode: TAdvEdit;
    advedtOffice: TAdvEdit;
    procedure btnMoreClick(Sender: TObject);
    procedure advedtOfficeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSelClick(Sender: TObject);
    procedure dbgrdh_DLCDSColumns5UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure acSaveExecute(Sender: TObject);
    procedure advedtBarCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    //科室代码
    ksdm:string;
    /// <summary>
    /// 查询病案信息
    /// </summary>
    /// <param name="Condition">条件</param>
    procedure GetBAInfo(const Condition:string;showMsg:Boolean=True);
    /// <summary>
    /// 是否可以注销
    /// </summary>
    /// <param name="ActionDM">动作代码</param>
    /// <returns>boolean</returns>
    function  IsCancel(const ActionDM:string):Boolean;
  public
    { Public declarations }
  
  end;

var
  frmBACancel: TfrmBACancel;

implementation
uses UMidProxy,UPublic,UCommon,UGShare,UGFun,UGVar,TypInfo;
{$R *.dfm}
{ TfrmBACancel }

procedure TfrmBACancel.acSaveExecute(Sender: TObject);
const
  sqlUpdate='Update SZBADetail set IsCancel=%d where patientid=^%s^';
var
  NewValue,OldValue:Boolean;
  patientid:string;//病人标识
  book:Pointer;
  flag:Boolean;
begin
 // inherited;
  flag :=false;
  with DLCDS do
  begin
    if state= dsEdit then
      Post;
    book := GetBookmark;
    DisableControls;
    First;
    while not Eof do
    begin
      NewValue :=FieldByName('IsCancel').AsBoolean;
      OldValue :=FieldByName('BZ').AsBoolean;
      patientid := FieldByName('patientid').AsString;
      if NewValue<>OldValue then
      begin
        flag := true;
        Edit;
        FieldByName('bz').AsBoolean :=NewValue;
        Post;
        if NewValue then
          TMidProxy.SqlExecute(Format(sqlUpdate,[1,patientid]))
        else
          TMidProxy.SqlExecute(Format(sqlUpdate,[0,patientid]));
      end;
      Next;
    end;
    EnableControls;
    GotoBookmark(book);
    if flag then
    begin
      acSave.Enabled :=False;
      ShowMsgSure('保存成功');
    end;


  end;
end;

procedure TfrmBACancel.advedtBarCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 BarCode:string;
 clienttmp:TClientDataSet;
begin
  inherited;
  if key =VK_RETURN then
  begin
    BarCode := advedtBarCode.Text;
    clienttmp := TClientDataSet.Create(nil);
    AutoFree(clienttmp);
    try
      TMidProxy.SqlOpen(Format(sql,[Format(' barcode=^%s^',[BarCode])]),clienttmp);
      if clienttmp.IsEmpty then
      begin
        ShowMsgSure('未查询到数据!');
        Exit;
      end;
      ChangeData(clienttmp,TClientDataSet(DLCDS),otRight);
      dbgrdh_DLCDS.DataSource :=ds1;
    except
      on ex:Exception do
      begin
        WriteErrorLog(ex.Message);
      end;

    end;
  end;
end;

procedure TfrmBACancel.advedtOfficeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key=32 then
  begin
    ksdm := ShowDM(sdm_ZyKs,advedtOffice,False);
  end;
end;

procedure TfrmBACancel.btnMoreClick(Sender: TObject);
var
  SQLCondition:string;
begin
  inherited;
  try
    SQLCondition := GetCondition;
    if SQLCondition<>'' then
    begin
      GetBAInfo(SQLCondition);
    end;
  finally

  end;
end;

procedure TfrmBACancel.btnSelClick(Sender: TObject);
var
  StartDate,EndDate:string;//出院日期
  chiefDoc,zynum,name:string;//主管医师、住院号、姓名
  condition :string;//where条件
begin
  inherited;
  if advedtBarCode.Text <>'' then
  begin
    SendMessage(advedtBarCode.Handle,WM_KEYDOWN,VK_RETURN,0);
    Exit;
  end;
  if advdtmpckrStart.Date > advdtmpckrEnd.Date then
  begin
    ShowMsgSure('开始日期不能大于结束日期');
    Exit;
  end;
  StartDate := FormatDateTime('yyyy-mm-dd',advdtmpckrStart.Date);
  EndDate := FormatDateTime('yyyy-mm-dd',advdtmpckrEnd.Date);
  condition := Format(' CYRQ >= ^%s^ AND CYRQ <= ^%s^ ',[StartDate,EndDate]);
  //科别
  if ksdm<>'' then
  begin
    condition := condition + Format(' and CYKB=^%s^',[ksdm]);
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
  //查询病案信息
  GetBAInfo(condition);
end;

procedure TfrmBACancel.dbgrdh_DLCDSColumns5UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
var
 DM:string; //动作代码
begin
  inherited;
  DM :=DLCDS.FieldByName('ActionDM').AsString;
  if not IsCancel(DM) then
  begin
    Value := 0;
    ShowMsgSure('病案已执行过质控，不能注销！');
  end;
end;

procedure TfrmBACancel.FormCreate(Sender: TObject);
begin
  inherited;
  GetBAInfo('1<>1',False);
   if dlcds.IsEmpty then
    dbgrdh_DLCDS.DataSource := nil;
end;

procedure TfrmBACancel.GetBAInfo(const Condition: string;showMsg:Boolean=True);
begin
  try
    if Condition<>'' then
    begin
      TMidProxy.SqlOpen(Format(sql,[Condition]),TclientDataSet(DLCDS));
      SetSbSimpleText(Format('共%d条数据',[dlcds.RecordCount]));
      if DLCDS.IsEmpty then
      begin
        dbgrdh_DLCDS.DataSource :=nil;
        if showMsg then
         ShowMsgSure('未查询到符合的数据');
        Exit;
      end;
      dbgrdh_DLCDS.DataSource := ds1;
    end;
  finally

  end;
end;

function TfrmBACancel.IsCancel(const ActionDM: string): Boolean;
 const
   CheckSql='SELECT * FROM SZActionCon WHERE PriorityNum <= (SELECT PriorityNum '
           +' FROM SZActionCon WHERE ActionDicDM=^103^) AND DM=^%s^';
begin
  Result := not ExistsRecord(Format(CheckSql,[ActionDM]));
end;

initialization
  RegisterClass(TfrmBACancel);
finalization
  RegisterClass(TfrmBACancel);

end.
