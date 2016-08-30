unit UFrmTracer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBForm, DB, ActnList, DBClient, UDlClientDataset, DosMove,
  AdvPanel, AdvAppStyler, AdvToolBar, AdvToolBarStylers, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, ExtCtrls, SUIEdit, StdCtrls, AdvFontCombo,
  AdvGlowButton, ComCtrls, AdvDateTimePicker, AdvGroupBox, DBGridEhGrouping,
  GridsEh, DBGridEh, AdvMetroScrollBox,StrUtils,DateUtils, Buttons;

  const
    SqlText='SELECT * FROM SZBADetail where IsCancel=0 %s';
    
type
  TfrmTracer = class(TFrmSuiDBForm)
    advgrp1: TAdvGroupBox;
    lbl3: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    advdtmpckrEnd: TAdvDateTimePicker;
    advdtmpckrStart: TAdvDateTimePicker;
    btnMore: TAdvGlowButton;
    btnSel: TAdvGlowButton;
    cbbOffice: TAdvOfficeComboBox;
    edtChiefDoctor: TsuiEdit;
    edtName: TsuiEdit;
    edtzynumber: TsuiEdit;
    lbl1: TLabel;
    advdtmpckrRYStart: TAdvDateTimePicker;
    lbl8: TLabel;
    advdtmpckrryEnd: TAdvDateTimePicker;
    dbgrdh2: TDBGridEh;
    advmtrscrlbx1: TAdvMetroScrollBox;
    pb1: TPaintBox;
    btnacClose1: TAdvGlowButton;
    procedure btnSelClick(Sender: TObject);
    procedure btnMoreClick(Sender: TObject);
    procedure dbgrdh2CellClick(Column: TColumnEh);
    procedure btnacClose1Click(Sender: TObject);
  private
    { Private declarations }
    patientid:string;
    /// <summary>
    /// 查询病案信息
    /// </summary>
    /// <param name="condition">查询条件</param>
    procedure GetBADetail(const condition:string);

    procedure GetSelBA;
    /// <summary>
    /// 绘制病案示踪时间轴
    /// </summary>
    /// <param name="PatientID">病人唯一标识</param>
    procedure RePaintTracer;
  public
    { Public declarations }
  end;

var
  frmTracer: TfrmTracer;

implementation
 uses UGFun,UGVar,UCommon,UMidProxy,UPublic;
{$R *.dfm}

procedure TfrmTracer.btnacClose1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmTracer.btnMoreClick(Sender: TObject);
var
  SQLCondition:string;
begin
  inherited;
  SQLCondition := GetCondition;
  if SQLCondition<> '' then
  begin
    //查询数据
    GetBADetail(SQLCondition);
  end;

end;

procedure TfrmTracer.btnSelClick(Sender: TObject);
var
  StartDate,EndDate,ryStartDate,ryEndDate:string;//出院日期
  SODM,chiefDoc,zynum,name:string;//科室代码、主管医师、住院号、姓名
  condition :string;//where条件
begin
  inherited;
  if advdtmpckrStart.Date > advdtmpckrEnd.Date then
  begin
    ShowMsgSure('出院日期的开始日期不能大于结束日期');
    Exit;
  end;
  if advdtmpckrRYStart.Date > advdtmpckrryEnd.Date then
  begin
    ShowMsgSure('入园日期的开始日期不能大于结束日期');
    Exit;
  end;
  StartDate := FormatDateTime('yyyy-mm-dd',advdtmpckrStart.Date);
  EndDate := FormatDateTime('yyyy-mm-dd',advdtmpckrEnd.Date);
  ryStartDate := FormatDateTime('yyyy-mm-dd',advdtmpckrRYStart.Date);
  ryEndDate := FormatDateTime('yyyy-mm-dd',advdtmpckrryEnd.Date);
  condition := Format(' and CYRQ >= ^%s^ AND CYRQ <= ^%s^ ',[StartDate,EndDate]);
  condition := Format(' and RYRQ >= ^%s^ AND CYRQ <= ^%s^ ',[ryStartDate,ryEndDate]);
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
  //查询数据
  GetBADetail(condition);
end;

procedure TfrmTracer.dbgrdh2CellClick(Column: TColumnEh);
begin
  inherited;
  GetSelBA;
end;

procedure TfrmTracer.GetBADetail(const condition: string);
var
 SqlWhere:string;
begin
  SqlWhere := condition;
  if UpperCase(LeftStr(Trim(SqlWhere),3))<>'AND'  then
  begin
    SqlWhere := ' and '+sqlwhere;
  end;
  StartWaitWindow('正在查询数据...');
  TMidProxy.SqlOpen(Format(SqlText,[SqlWhere]),TClientDataSet(DLCDS));
  if dlcds.IsEmpty then
  begin
    EndWaitWindow;
    dbgrdh2.DataSource := ds1;
    ShowMsgSure('未查询到符合的数据');
    Exit;
  end;
  EndWaitWindow;
  if dbgrdh2.DataSource = nil then
    dbgrdh2.DataSource := ds1;
end;

procedure TfrmTracer.GetSelBA;
begin
  if (not  DLCDS.Active) or (dlcds.IsEmpty) then Exit;
  patientid := dlcds.FieldByName('patientid').AsString;
  RePaintTracer;
end;

procedure TfrmTracer.RePaintTracer;
const
  sqlTracer='SELECT * FROM SZActionrecord WHERE patientID =^%s^ ORDER BY ActionTime DESC';
var
  clienttmp:TClientDataSet;
  y,m,d:Integer; //年月日
  actionTime:TDateTime; //操作时间
  ActionDesc:string;//病案示踪描述
  shpYear:TShape;
  layoutL,H,R:Integer; //left、top、 height,圆半径
  Strtime:string;//分钟
  actionState:string;//动作状态
begin
  pb1.Refresh;
  if PatientID='' then Exit;
  clienttmp := TClientDataSet.Create(nil);
  AutoFree(clienttmp);
  TMidProxy.SqlOpen(Format(sqlTracer,[PatientID]),clienttmp);
  layoutL :=0;
  y :=0;
  H := 0;
  R := 15;
  with clienttmp do
  begin
     First;
     while not Eof do
     begin
       actionTime := FieldByName('Actiontime').AsDateTime;
       //绘制示踪时间轴
       if y<>YearOf(actionTime) then
       begin
         y := YearOf(actionTime);
         layoutL := Round(pb1.ClientWidth div 3 ) ;
         //绘制圆形
         with pb1.Canvas do
         begin
           Pen.Color :=clGreen;
           Brush.Color := clGreen;
           H := 3*R;
           Ellipse(layoutL -R,0,layoutL + R,2 * R);
           Brush.Style := bsClear;
           Font.Color := clGreen;
           Font.Size :=16;

           TextOut(layoutL+R,H-3*R,IntToStr(Y));
           //绘制时间轴直线
           MoveTo(layoutL,H-R);
           pen.Color := clBlack;
           Pen.Width := 2;
           H:= 2*R+30;
           LineTo(layoutL,H);
         end;
       end;

       if m <>MonthOf(actionTime)  then
       begin
         m:=MonthOf(actionTime);
         with pb1.Canvas do
         begin
           Font.Color := clGreen;
           Font.Size := 12;
           TextOut(layoutL-R,H,Format('%d月',[m]));
           //绘制直线
           MoveTo(layoutL,H+font.Size);
           Inc(H,30);
           LineTo(layoutL,H);
         end;
       end;

       if d <> DayOf(actionTime) then
       begin
         d:= DayOf(actionTime);
         with pb1.Canvas do
         begin
           MoveTo(layoutL,H);
           Inc(H,10);
           LineTo(layoutL,H);
            //绘制分支
           LineTo(layoutL+R,H);
           //绘制日
           d := DayOf(actionTime);
           Font.Color := clBlue;
           Font.Size := 12;
           TextOut(layoutL+R+5,H-Font.Size,Format('%d日',[d]));
           //绘制直线
           MoveTo(layoutL,H);
           Inc(H,R);
           LineTo(layoutL,H);
         end;
       end;
       ActionDesc := FieldByName('Actionmc').AsString;
       actionState := FieldByName('actionstate').AsString;
       if actionState<>''  then
       begin
         if actionState ='1' then
           ActionDesc :=Format('%s,已签入',[ActionDesc])
         else if actionState ='3' then
           ActionDesc :=Format('%s,已签出',[ActionDesc])
         else if actionState ='2' then
           ActionDesc :=Format('%s,处理中',[ActionDesc])
         else if actionState ='-1' then
           ActionDesc :=Format('%s,撤销签入',[ActionDesc])
         else if actionState ='-3' then
           ActionDesc :=Format('%s,撤销签出',[ActionDesc])
         else if actionState ='-2' then
           ActionDesc :=Format('%s,处理中发现问题',[ActionDesc]);
       end;
       if Strtime <> FormatDateTime('hh:mm',actionTime) then
       begin
         Strtime := FormatDateTime('hh:mm',actionTime);
         with pb1.Canvas do
         begin
           Font.Color := clBlue;
           TextOut(layoutL-2*R,H,Strtime);
           //绘制直线
           MoveTo(layoutL,H+font.Size+5);
           Inc(H,Font.Size+2*R);
           LineTo(layoutL,H);
         end;
       end
       else  //同一时间内的操作
       begin
         Inc(H,20);
         with pb1.Canvas do
         begin
           Font.Color := clGreen;
           TextOut(layoutL+10,H-15,ActionDesc);
           MoveTo(layoutL,H-20);
           LineTo(layoutL,H);
         end;
         Next;
         Continue;
       end;
       //显示动作描述
       with pb1.Canvas do
       begin
         Font.Color := clGreen;
         TextOut(layoutL+10,H-20,ActionDesc);
       end;
       Next;
     end;
  end;
end;
initialization
  RegisterClass(TfrmTracer);
finalization
  UnRegisterClass(TfrmTracer);

end.
