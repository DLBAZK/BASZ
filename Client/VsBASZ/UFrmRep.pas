/// <summary>
///  FastReport基类
/// </summary>
/// <date> 2012-04-11 </date>
/// <author> ZMJ </author>
unit UFrmRep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiBForm, DosMove, AdvPanel, AdvAppStyler, AdvToolBar,
  AdvToolBarStylers, AdvOfficeStatusBar, AdvOfficeStatusBarStylers, ExtCtrls,
  SUIImagePanel, SUIGroupBox, AdvOfficeButtons, StdCtrls, AdvGroupBox,
  ComCtrls, AdvGlowButton, DB, DBClient, UGVar, QuickRpt, QRCtrls, QRPrntr,
  AdvOfficePager, EllipsLabel, QRPrev,UFrmSetPage,UFrmSuiDBListForm, ActnList,
  AdvDateTimePicker;

type
  Eu_RepKSKind=(
    rkk_KS=0,
    rkk_GK=1,
    rkk_BQ=2
  );
        
  TRepToExcelInfo = record
    ExcelFileName: String;
    BeginFillRow: Integer;
    ExportFields: array of string;
    ExcelSheetName: string;
  end;
     
  TRptGroupInfo = record
    RptCds: TClientDataSet;
    GroupFields: TArrayOfString;
    FilterField: string;
    ExcelFileName: String;
    GroupMcField: string;
    IndexField: string;
    BeginFillRow: Integer;
    ExportFields: TArrayOfString;
    GroupFieldCaption:string;
    GroupFieldCountCaption:string;
  end;
  
  TFrmRep = class(TFrmSuiBForm)
    AdvPanel2: TAdvPanel;
    btnPrint: TAdvGlowButton;
    btnExport: TAdvGlowButton;
    btnClose: TAdvGlowButton;
    aopRep: TAdvOfficePager;
    sbtn1: TAdvGlowButton;
    sbtn2: TAdvGlowButton;
    sbtn3: TAdvGlowButton;
    advtlbr1: TAdvToolBar;
    btnPreview: TAdvGlowButton;
    advtlbrsprtr1: TAdvToolBarSeparator;
    advtlbrsprtr2: TAdvToolBarSeparator;
    advtlbrsprtr3: TAdvToolBarSeparator;
    ac1: TActionList;
    procedure btnCloseClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure sbtn1Click(Sender: TObject);
    procedure sbtn2Click(Sender: TObject);
    procedure sbtn3Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    /// <summary>
    /// 记录报表列表
    /// </summary>
    FRepList:TList;
    FRepPreviewList:TList;
    /// <summary>
    /// 记录汉化事件类列表
    /// </summary>
    FCHRptList:TList;
    /// <summary>
    /// 是否显示报表设置窗体 True: 显示; False: 不显示;
    /// </summary>
    FIsShowRptPageSet: Boolean;
    /// <summary>
    /// 是否采用基类的方式显示报表
    ///   True: 采用基类方式显示
    ///   False: 子类自己显示报表
    /// </summary>
    FIsDlfPreview: Boolean;
    /// <summary>
    /// 是否要分组显示 True: 分组显示; False: 不分组显示;
    /// </summary>
    FIsGroupRpt: Boolean;
    /// <summary>
    /// 是否为分组显示的具体信息
    /// </summary>
    FGroupInfo: TRptGroupInfo;
    /// <summary>
    /// 多张报表时,QuickRep中的DataSet数据是否相同
    /// </summary>
    FIsRptSameDataSet: Boolean;
    /// <summary>
    /// 报表上ClientDataset的SQL语句
    /// </summary>
    FRepCdsSQL: string;
    function GetStartDate: string;
    function GetEndDate: string;
    /// <summary>
    /// 调用报表纸张设置对话框
    /// </summary>
//    Procedure RptPageSet;
    function GetRep(Idx: Integer): TQuickRep;
    function GetRepCds(Idx: Integer): TClientDataSet;
    function GetRepCount: Integer;
    function GetRepCaption(index: Integer): string;
    procedure SetRepCaption(index: Integer; const Value: string);
    { Private declarations }
  Protected
//    fdbRep: TfrxDBDataset;
//    CdsRep: TClientDataSet; 
    FRepToExcelInfo: array of TRepToExcelInfo;
    FExcelApp: Variant;
    /// <summary>
    /// FastReport 模板名
    /// </summary>
    FRepTemplate: string;
    FMasterDataName: string;
    FDBRepName: string;  
    /// <summary>
    ///  指定当前报表是否日报格式，日报格式在输出到EXCEL时，按DTPEnd显示的日期输出。
    /// </summary>
    FIsDayReport: Boolean;
    FRepType: TEuReportType;
    FXLSRepTitle: string;

    FrmSetPage:TFrmSetPage;
    
    Procedure InitControl;override;
    /// <summary>
    /// 设置QuickRep的相关信息  让子类重载这个方法;
    /// </summary>
    procedure OpenRptCds;virtual;
    procedure SetRptQRLabelCaption;virtual;

    /// <summary>
    /// 默认报表导出到Excel
    /// </summary>
    procedure RptToExcel;virtual;
    /// <summary>
    /// 分组报表导出到Excel
    /// </summary>
    procedure GroupRptToExcel;virtual;
    /// <summary>
    /// 默认的报表导出到Excel的过程(供子类调用)
    /// </summary>
    function  DlfExportToExcel(ExcelFileName:String;BeginFillRow:Integer;ExportFields:Array Of String;ExcelSheetName: string='';Cds:TClientDataSet=nil):Variant;virtual;
    /// <summary>
    /// 默认的分组报表导出到Excel的过程(供子类调用)
    /// </summary>
    procedure DlfGroupRptToExcel;virtual;
    /// <summary>
    /// 设置报表导出到Excel的相关信息
    /// <param name="Idx"> 报表的索引号(从零开始) </param>
    /// <param name="sExcelFileName"> 导出Excel报表模板文件名 </param>
    /// <param name="iBeginFillRow"> 开始填充数据的行数 </param>
    /// <param name="aExportFields"> 要导出的字段名集合 </param>
    /// <param name="sExcelSheetName"> 导出Excel的Sheet的名称,如果此参数为空则不修改Sheet名称,默认值为空 </param>
    /// </summary>
    procedure SetRepToExcelInfo(const Idx: Integer;sExcelFileName: String;const iBeginFillRow: Integer;
                                aExportFields: array of string; sExcelSheetName: string='');
    procedure RepPrview(ARep: TQuickRep);

    procedure CreateRepPrview;
    function CreatePage(const sCaption: string): TAdvOfficePage;
    procedure BeforePreparerRpt();virtual;
    procedure ShowRrpt;
    procedure SetRptHeaderCaption(const Caption:string);
  public
    { Public declarations }
    destructor Destroy; override;      
    /// <summary>
    /// 报报创建
    /// </summary>
    procedure RepCreate(RepsClass: array of TQuickRepClass);         
    /// <summary>
    /// 设置报表的默认信息
    /// </summary>
    Procedure SetRptDefault(Rpt:TQuickRep);
    procedure DlfSQLOpen(const sSQL: string;Cds: TClientDataSet=nil);virtual;
    property sStartDate: string read GetStartDate;
    property sEndDate: string read GetEndDate;
    property sRepTemplate: string read FRepTemplate write FRepTemplate;
    property RepCdsSQL: string read FRepCdsSQL write FRepCdsSQL;
    property IsDlfPreview: Boolean read FIsDlfPreview write FIsDlfPreview;
    property IsGroupRpt: Boolean read FIsGroupRpt write FIsGroupRpt;
    property GroupInfo: TRptGroupInfo read FGroupInfo write FGroupInfo;
    property ExcelApp: Variant read FExcelApp write FExcelApp;
    property IsDayReport:Boolean read FIsDayReport Write FIsDayReport;
    property RepType: TEuReportType read FRepType write FRepType;
    property XLSRepTitle: string read FXLSRepTitle write FXLSRepTitle;  
    property RepCount: Integer read GetRepCount;          
    property Rep[index: Integer]:TQuickRep  read GetRep;
    property RepCds[index: Integer]:TClientDataSet  read GetRepCds;
    property RepCaption[index: Integer]:string  read GetRepCaption write SetRepCaption;
    property IsRptSameDataSet: Boolean read FIsRptSameDataSet write FIsRptSameDataSet;
    Property IsShowRptPageSet:Boolean Read FIsShowRptPageSet Write FIsShowRptPageSet;
  end;

implementation

uses
  UMidProxy, UGFun, UCommon, StrUtils, UExportToExcel, UGShare, DateUtils, UCHRpt,
  UQickRepPreview,UDM_Img;

{$R *.dfm}
     
ResourceString
  SNotFoundReportProject='找不到报表工程文件，无法启动报表汇总功能，请跟系统管理员联系！';

{ TFrmRep_12 }

procedure TFrmRep.BeforePreparerRpt;
begin
//用于显示报表之前执行
end;

procedure TFrmRep.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmRep.btnPreviewClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  try
    RptPageSet(FrmSetPage,MenuCode,caption,FIsShowRptPageSet,FRepList,FCHRptList, aopRep);
  except
    on e:Exception do
       if e.Message='D70E8588-F4B8-4CEB-8AAF-3CFCAD6838A0' then
          Exit;
  end;

  if not FIsDlfPreview then  // 如果不采用基类的方式显示报表
    Exit;

  // 以下是基类默认的报表显示方式
  try
    StartWaitWindow(CReportWaitString);
    OpenRptCds;
  finally
    EndWaitWindow;
  end;

  BeforePreparerRpt();
  for i:=0 to FRepList.Count - 1 do
    TQuickRep(FRepList[I]).Prepare;
  for i:=0 to FRepList.Count - 1 do
    TQuickRepPreview(FRepPreviewList[i]).Preview(TQuickRep(FRepList[I]).QRPrinter);
  sbtn1.Enabled:=true;
  sbtn2.Enabled:=true;
  sbtn3.Enabled:=true;
  btnPrint.Enabled:=true;
  btnExport.Enabled:=true;
end;

procedure TFrmRep.btnPrintClick(Sender: TObject);
Var
  I:Integer;
  QRPrints:Array of TQRPrinter;
begin
  inherited;
  SetLength(QRPrints,FRepList.Count);
  for i:=0 to FRepList.Count - 1 do
    QRPrints[i]:=TQuickRep(FRepList[I]).QRPrinter;
  TQuickRepPreview.PrintSetupClick(QRPrints);
end;

function TFrmRep.CreatePage(const sCaption: string): TAdvOfficePage;
begin
  Result:=TAdvOfficePage.Create(aopRep);
  with Result do begin
    Left := 1;
    Top := 26;
    Width := 923;
    Height := 411;
    Caption := StringReplace(sCaption, ' ', '', [rfReplaceAll]);
    PageAppearance.BorderColor := 14922381;
    PageAppearance.Color := 16445929;
    PageAppearance.ColorTo := 15587527;
    PageAppearance.ColorMirror := 15587527;
    PageAppearance.ColorMirrorTo := 16773863;
    PageAppearance.Gradient := ggVertical;
    PageAppearance.GradientMirror := ggVertical;
    TabAppearance.BorderColor := clNone;
    TabAppearance.BorderColorHot := 15383705;
    TabAppearance.BorderColorSelected := 14922381;
    TabAppearance.BorderColorSelectedHot := 6343929;
    TabAppearance.BorderColorDisabled := clNone;
    TabAppearance.BorderColorDown := clNone;
    TabAppearance.Color := clBtnFace;
    TabAppearance.ColorTo := clWhite;
    TabAppearance.ColorSelected := 16709360;
    TabAppearance.ColorSelectedTo := 16445929;
    TabAppearance.ColorDisabled := clWhite;
    TabAppearance.ColorDisabledTo := clSilver;
    TabAppearance.ColorHot := 14542308;
    TabAppearance.ColorHotTo := 16768709;
    TabAppearance.ColorMirror := clWhite;
    TabAppearance.ColorMirrorTo := clWhite;
    TabAppearance.ColorMirrorHot := 14016477;
    TabAppearance.ColorMirrorHotTo := 10736609;
    TabAppearance.ColorMirrorSelected := 16445929;
    TabAppearance.ColorMirrorSelectedTo := 16181984;
    TabAppearance.ColorMirrorDisabled := clWhite;
    TabAppearance.ColorMirrorDisabledTo := clSilver;
    TabAppearance.Font.Charset := DEFAULT_CHARSET;
    TabAppearance.Font.Color := clWindowText;
    TabAppearance.Font.Height := -11;
    TabAppearance.Font.Name := 'Tahoma';
    TabAppearance.Font.Style := [];
    TabAppearance.Gradient := ggVertical;
    TabAppearance.GradientMirror := ggVertical;
    TabAppearance.GradientHot := ggRadial;
    TabAppearance.GradientMirrorHot := ggVertical;
    TabAppearance.GradientSelected := ggVertical;
    TabAppearance.GradientMirrorSelected := ggVertical;
    TabAppearance.GradientDisabled := ggVertical;
    TabAppearance.GradientMirrorDisabled := ggVertical;
    TabAppearance.TextColor := 9126421;
    TabAppearance.TextColorHot := 9126421;
    TabAppearance.TextColorSelected := 9126421;
    TabAppearance.TextColorDisabled := clGray;
    TabAppearance.ShadowColor := 15255470;
    TabAppearance.HighLightColor := 16775871;
    TabAppearance.HighLightColorHot := 16643309;
    TabAppearance.HighLightColorSelected := 6540536;
    TabAppearance.HighLightColorSelectedHot := 12451839;
    TabAppearance.HighLightColorDown := 16776144;
    TabAppearance.BackGround.Color := 16767935;
    TabAppearance.BackGround.ColorTo := clNone;
    TabAppearance.BackGround.Direction := gdHorizontal;
  end;
end;

procedure TFrmRep.CreateRepPrview;
var
  i: Integer;
  APage: TAdvOfficePage;
  APreview: TQuickRepPreview;
  procedure _AddPreview(const Idx: Integer);
  begin
    APage:=CreatePage(RepCaption[Idx]);
    aopRep.AddAdvPage(APage);
    APage.Name:='Page_'+InttoStr(Idx);
    APage.Parent:=aopRep;
    APreview:=TQuickRepPreview.CreatePreview(APage);
    FRepPreviewList.Add(APreview);
  end;
begin
  for i:= 0 to FRepList.Count - 1 do
    _AddPreview(i);
  aopRep.TabSettings.Height:=IIF(FRepList.Count=1,0,26);
  if FRepList.Count>0 then
    aopRep.ActivePageIndex:=0;
end;

procedure TFrmRep.btnExportClick(Sender: TObject);
begin
  inherited;
  if not RepCds[0].Active then
    OpenRptCds;
  if RepCds[0].RecNo>0 then
    RepCds[0].First;
  if not IsGroupRpt then
    RptToExcel
  else
    GroupRptToExcel;
end;

destructor TFrmRep.Destroy;
Var
  I:Integer;
  Obj:TObject;
begin
  for I := 0 to FCHRptList.Count - 1 do begin
    Obj:=FCHRptList.Items[I];
    if Assigned(Obj) then
       FreeAndNil(Obj);
  end;
  FreeAndNil(FCHRptList);   
  inherited;
end;

function TFrmRep.DlfExportToExcel(ExcelFileName: String;
  BeginFillRow: Integer; ExportFields: array of String; ExcelSheetName: string;
  Cds: TClientDataSet): Variant;
Var
  DateStr:String;
begin
  Result:=UnAssigned;
  if not Assigned(Cds) then
     cds:=RepCds[0];
  DateStr:=CReportTabDate+GetRptCalendarStr(FrmSetPage.dtpStart.Date,FrmSetPage.dtpEnd.Date);
  if FIsDayReport then
     DateStr:=CReportTabDate+FormatDateTime(CDateFormatStr,FrmSetPage.dtpEnd.DateTime)+'  '+ DayToWeek(FrmSetPage.dtpEnd.DateTime);
  if VarType(ExcelApp)=varEmpty then
    FExcelApp:=
        ExportToExcel(Cds,ExcelFileName,BeginFillRow,ExportFields,
                     [G_MainInfo.MainSysInfo.HospitalCode,G_MainInfo.MainSysInfo.HospitalName,
                     '',DateStr],ExcelSheetName)
  else
    FExcelApp:=
        ExportToExcel(Cds,ExcelFileName,FExcelApp,BeginFillRow,ExportFields,
                     [G_MainInfo.MainSysInfo.HospitalCode,G_MainInfo.MainSysInfo.HospitalName,
                     '',DateStr],ExcelSheetName);
  if FXLSRepTitle<>'' then
    FExcelApp.ActiveSheet.Cells[1,1].Value:=FXLSRepTitle;
  Result:=FExcelApp;
end;

procedure TFrmRep.DlfGroupRptToExcel;
Var
  CdsTemp: TClientDataSet;
  sHospitalCode,sHospitalName,sDateRange: string;
  function _GetFilterStr: string;
  const
    sFilterStr='(%s=^%s^)';
  var
    i: Integer;
    FList: TStrings;
    AField: TField;
  begin
    FList:=TStringList.Create;
    AutoFree(FList);
    FList.Delimiter:=';';
    FList.DelimitedText:=FGroupInfo.FilterField;
    Result:='';
    for i:=0 to FList.Count - 1 do  begin
      AField:=CdsTemp.FindField(FList[i]);
      if Assigned(AField) then begin
        Result:=Result+Format(sFilterStr, [FList[i], AField.AsString]);
        if i<FList.Count-1 then
          Result:=Result+' and ';
      end;
    end;
  end;  
Begin
  CdsTemp:=TClientDataSet.Create(NIl);
  AutoFree(CdsTemp);
  sHospitalCode:=G_MainInfo.MainSysInfo.HospitalCode;
  sDateRange:=CReportTabDate+GetRptCalendarStr(FrmSetPage.dtpStart.Date,FrmSetPage.dtpEnd.Date);
  if FIsDayReport then
     sDateRange:=CReportTabDate+FormatDateTime(CDateFormatStr,FrmSetPage.dtpEnd.DateTime)+'  '+ DayToWeek(FrmSetPage.dtpEnd.DateTime);
  with GroupInfo do begin
    CdsGroup(RptCds,CdsTemp,GroupFields);
    While Not CdsTemp.Eof Do
      Begin
        SetFilter(_GetFilterStr,RptCds);
        sHospitalName:=G_MainInfo.MainSysInfo.HospitalName+GroupFieldCaption+CdsTemp.FieldByName(GroupMcField).AsString+GroupFieldCountCaption+IntToStr(RptCds.RecordCount);
        if VarType(ExcelApp)=varEmpty then
           FExcelApp:=ExportToExcel(RptCds,ExcelFileName,BeginFillRow,ExportFields,[sHospitalCode,sHospitalName,'',sDateRange],
                         FormatActiveSheetName(CdsTemp.FieldByName(GroupMcField).AsString))
        else
           FExcelApp:=ExportToExcel(RptCds,ExcelFileName,FExcelApp,BeginFillRow,ExportFields,[sHospitalCode,sHospitalName,'',sDateRange],
                         FormatActiveSheetName(CdsTemp.FieldByName(GroupMcField).AsString));
        CdsTemp.Next;
      End;
    RptCds.Filtered:=False;
  end;
  FExcelApp:=UnAssigned;
end;

procedure TFrmRep.DlfSQLOpen(const sSQL: string; Cds: TClientDataSet);
begin
  if not Assigned(Cds) then
    Cds:=RepCds[0];
  TMidProxy.SqlOpen(Format(sSQL,[DateToStr(FrmSetPage.dtpStart.Date),DateToStr(FrmSetPage.dtpEnd.Date)]),Cds);
end;

function TFrmRep.GetEndDate: string;
begin
  Result:=DateToStr(FrmSetPage.dtpEnd.Date);
end;

function TFrmRep.GetRep(Idx: Integer): TQuickRep;
begin
  Result:=nil;
  if (Idx<0)or(Idx>=FRepList.Count) then
     Exit;
  Result:=TQuickRep(FRepList[Idx]);
end;

function TFrmRep.GetRepCaption(index: Integer): string;
var
  i: Integer;
begin
  Result:='';
  if (index<0)or(index>RepCount-1) then
    Exit;
  for I:=0 to Rep[index].ComponentCount-1 do
    if SameText(Rep[index].Components[i].Name,'QrlRepCaption')and
       (Rep[index].Components[i] is TQRLabel) then
      Result:=StringReplace(StringReplace(TQRLabel(Rep[index].Components[i]).Caption,' ','',[rfReplaceAll]),'　','',[rfReplaceAll]);
end;

function TFrmRep.GetRepCds(Idx: Integer): TClientDataSet;
var
  tRep: TQuickRep;
begin
  Result:=nil;
  tRep:=GetRep(Idx);
  if not Assigned(tRep) then
    Exit;
  if Assigned(tRep.DataSet) then
    Result:=TClientDataSet(tRep.DataSet);
end;

function TFrmRep.GetRepCount: Integer;
begin
  Result:=FRepList.Count;
end;

function TFrmRep.GetStartDate: string;
begin
  Result:=DateToStr(FrmSetPage.dtpStart.Date);
end;

procedure TFrmRep.GroupRptToExcel;
begin
  DlfGroupRptToExcel;
end;

procedure TFrmRep.InitControl;
  Procedure _SetRptSEDate;
  Var
    PeriodStart,PeriodEnd:String;
  Begin
    With FrmSetPage Do Begin
      IF (G_MainInfo.MainSysInfo.TjPeriodStart='01') And (G_MainInfo.MainSysInfo.TjPeriodEnd='31') Then
         Begin
           PeriodStart:=Format('%s-%d-%d',[G_MainInfo.MainSysInfo.UseYear,
                                           MonthOf(StrToDate(sDateRangeCheck(G_MainInfo.MainSysInfo.ServerCurDate))),1]);
           PeriodEnd:=Format('%s-%d-%d',[G_MainInfo.MainSysInfo.UseYear,
                                         MonthOf(StrToDate(sDateRangeCheck(G_MainInfo.MainSysInfo.ServerCurDate))),
                                         DayOf(EndOfAMonth(StrToInt(G_MainInfo.MainSysInfo.UseYear),
                                                           MonthOf(StrToDate(sDateRangeCheck(G_MainInfo.MainSysInfo.ServerCurDate)))))]);
         End
      Else
         Begin
           PeriodStart:=Format('%s-%d-%s',[G_MainInfo.MainSysInfo.UseYear,
                                           IIF(MonthOf(StrToDate(sDateRangeCheck(G_MainInfo.MainSysInfo.ServerCurDate)))-1<=0,12,
                                               MonthOf(StrToDate(sDateRangeCheck(G_MainInfo.MainSysInfo.ServerCurDate)))-1),
                                           G_MainInfo.MainSysInfo.TjPeriodStart]);
           PeriodEnd:=Format('%s-%d-%D',[G_MainInfo.MainSysInfo.UseYear,
                                         MonthOf(StrToDate(sDateRangeCheck(G_MainInfo.MainSysInfo.ServerCurDate))),
                                         DayOf(StrToDate(sDateRangeCheck(G_MainInfo.MainSysInfo.ServerCurDate)))]);

         End;
      DtpStart.Date:=StrToDate(PeriodStart);
      DtpEnd.Date:=StrToDate(PeriodEnd);
    End;
  End;
begin
  inherited;
  FExcelApp:=UnAssigned;
  FIsDayReport:=False;
  FIsShowRptPageSet:=True;
  FRepList:=TList.Create;
  FRepPreviewList:=TList.Create;
  FCHRptList:=TList.Create;
//  Suif1.Caption:=lblRepTitle.Caption;
//  Caption:=Suif1.Caption;
  if not Assigned(FrmSetPage) then
     FrmSetPage:=TFrmSetPage.Create(self);
  _SetRptSEDate;
  FrmSetPage.Caption:='报表设置';
  FrmSetPage.advtlbrpgr1.Caption.Caption:=FrmSetPage.Caption;
  FIsDlfPreview:=True;
  FIsGroupRpt:=False;
  FIsRptSameDataSet:=True;
  FRepCdsSQL:='';
  FRepType:=rt_BA;
  FXLSRepTitle:='';
  FDBRepName:='Cds1';
  FMasterDataName:='MasterData1';
  SetStartEndDate(FrmSetPage.dtpStart, FrmSetPage.dtpEnd);
  FExcelApp:=UnAssigned;
  FIsDayReport:=False;
  FIsDlfPreview:=True;
  FIsGroupRpt:=False;
  FRepType:=rt_BA;
  FXLSRepTitle:='';


//  FRep.PreviewOptions.Buttons:=[pbPrint,pbExport,pbZoom,pbFind,pbOutline,pbPageSetup,pbTools,pbNavigator,pbExportQuick];
end;

procedure TFrmRep.OpenRptCds;
var
  FCds: TClientDataSet;
  procedure _RptDatasetGetData;
  var
    i: Integer;
    DestCDS:TClientDataSet;
  begin
    if not Assigned(FCds) then
      Exit;
    for i:=1 to FRepList.Count - 1 do begin
      DestCDS:=GetRepCds(I);
      if Assigned(DestCDS) then
        DestCDS.Data:=FCds.Data;
    end;
  end;
begin
  SetRptQRLabelCaption;
  if FRepCdsSQL='' then
    Exit;
  FCds:=RepCds[0];
  DlfSQLOpen(FRepCdsSQL,FCds);
  if IsGroupRpt then
     FCds.IndexFieldNames:=GroupInfo.IndexField;
  if (RepCount>1) and FIsRptSameDataSet then
    _RptDatasetGetData;
end;

procedure TFrmRep.RepCreate(RepsClass: array of TQuickRepClass);
var
  i: Integer;
  ARep: TQuickRep;
  //每次在创建之前先检查是否已创建过，如果创建过则释放。主要是为了能根据不同条件去灵活调用不同报表。
  procedure _FreeRep();
  Var
    j:Integer;
    advPage:TAdvOfficePage;
    Rep:TWinControl;
  Begin
    for j := 0 to FRepList.Count - 1 do begin
      Rep:=TWinControl(FRepList[j]);
      if Assigned(Rep) then
         FreeAndNil(Rep);
      Rep:=TWinControl(FRepPreviewList[j]);
      if Assigned(Rep) then
         FreeAndNil(Rep);
    end;
    FRepList.Clear;
    FRepPreviewList.Clear;
    while aopRep.AdvPageCount>0 do begin
      advPage:=aopRep.AdvPages[0];
      aopRep.RemoveAdvPage(advPage);
      advPage.Free;
    end;
  End;
begin
  _FreeRep();
  for i:=0 to High(RepsClass) do begin
    ARep:=RepsClass[I].Create(Self);
    SetRptDefault(ARep);
  end;
  CreateRepPrview;
end;

procedure TFrmRep.RepPrview(ARep: TQuickRep);
var
  ACustomQuickRep: TCustomQuickRep;
begin

  ACustomQuickRep:=TCustomQuickRep(ARep);
  Application.ProcessMessages;
  if not ACustomQuickRep.QRPrinter.ShowingPreview then
  begin
    QRPrinter.Destination := qrdMetafile;
    QRPrinter.Master := Self;
    QRPrinter.OnPrintSetup := ARep.PrinterSetup;
    QRPrinter.OnExportToFilter := ARep.ExportToFilter;
    QRPrinter.Title := ARep.ReportTitle;
    QRPrinter.OnPreview := nil;
    // call below is in QR4 only
//    ARep.SetPrinterValues;
    QRPrinter.Preview;
//    ARep.CreateReport(false);
    QRPrinter.ReportLoaded := true;
    if ARep.Cancelled then
    begin
      QRPrinter.Free;
      Exit;
    end;
    repeat
      Application.HandleMessage
    until (QRPrinter = nil) or (not QRPrinter.ShowingPreview) or Application.Terminated ;
  end;
end;

procedure TFrmRep.RptToExcel;
var
  I: Integer;
begin
  for i:=0 to High(FRepToExcelInfo) do
    with FRepToExcelInfo[I] do
      FExcelApp:=DlfExportToExcel(ExcelFileName,BeginFillRow,ExportFields,ExcelSheetName);
  FExcelApp:=UnAssigned;
end;

procedure TFrmRep.sbtn1Click(Sender: TObject);
  var
    j: integer;
begin
  inherited;
  for j:=0 to FRepList.Count - 1 do
    TQuickRepPreview(FRepPreviewList[j]).QRPreview.ZoomToFit;
end;

procedure TFrmRep.sbtn2Click(Sender: TObject);
  var
    j: integer;
begin
  inherited;
  for j:=0 to FRepList.Count - 1 do
    TQuickRepPreview(FRepPreviewList[j]).QRPreview.ZoomToWidth;
end;

procedure TFrmRep.sbtn3Click(Sender: TObject);
  var
    j: integer;
begin
  inherited;
  for j:=0 to FRepList.Count - 1 do
  begin
    TQuickRepPreview(FRepPreviewList[j]).QRPreview.Zoom := 100;
    TQuickRepPreview(FRepPreviewList[j]).QRPreview.UpdateZoom;
  end;
end;

procedure TFrmRep.SetRepCaption(index: Integer; const Value: string);
var
  i: Integer;
begin
  if (index<0)or(index>RepCount-1) then
    Exit;
  for I:=0 to Rep[index].ComponentCount-1 do
    if SameText(Rep[index].Components[i].Name,'QrlRepCaption')and
       (Rep[index].Components[i] is TQRCustomLabel) then
      TQRCustomLabel(Rep[index].Components[i]).Caption:=Value;
end;

procedure TFrmRep.SetRepToExcelInfo(const Idx: Integer;
  sExcelFileName: String; const iBeginFillRow: Integer;
  aExportFields: array of string; sExcelSheetName: string);
var
  i: Integer;
begin
  if Idx<0 then
    Exit;
  SetLength(FRepToExcelInfo,Idx+1);
  with FRepToExcelInfo[Idx] do begin
    ExcelFileName:=sExcelFileName;
    BeginFillRow:=iBeginFillRow;
    SetLength(ExportFields,Length(aExportFields));
    for i:=0 to High(ExportFields) do
      ExportFields[I]:=aExportFields[I];
    ExcelSheetName:=sExcelSheetName;
  end;
end;

procedure TFrmRep.SetRptDefault(Rpt: TQuickRep);
begin
  SetRpt(Caption,Rpt,FRepList);
end;

procedure TFrmRep.SetRptHeaderCaption(const Caption:string);
var
 i :Integer;
 Rpt:TQuickRep;
 Obj:TQRCustomLabel;
begin
  for i:=0 to FRepList.Count - 1 do
  begin
    Rpt:= FRepList[i];
    Obj :=TQRCustomLabel(Rpt.FindComponent('qrlRepCaption'));
    if Assigned(Obj) then
    begin
      Obj.Caption := Caption;
    end;
    
  end;
end;

procedure TFrmRep.SetRptQRLabelCaption;
var
  i: Integer;
begin
  for i:=0 to FRepList.Count - 1 do
    SetRptQRLCaption(FRepList[I], FRepType, FrmSetPage.dtpStart.Date, FrmSetPage.dtpEnd.Date);
end;

procedure TFrmRep.ShowRrpt;
var
 i :Integer;
begin
  BeforePreparerRpt();
  for i:=0 to FRepList.Count - 1 do
    TQuickRep(FRepList[I]).Prepare;
  for i:=0 to FRepList.Count - 1 do
    TQuickRepPreview(FRepPreviewList[i]).Preview(TQuickRep(FRepList[I]).QRPrinter);
  sbtn1.Enabled:=true;
  sbtn2.Enabled:=true;
  sbtn3.Enabled:=true;
  btnPrint.Enabled:=true;
  btnExport.Enabled:=true;
end;

end.
