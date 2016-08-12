unit UFrmDBFTheme;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBListForm, DBGridEhGrouping, ComCtrls, AdvDateTimePicker,
  AdvDBDateTimePicker, StdCtrls, AdvEdit, AdvEdBtn, PrnDbgeh, DB, ActnList,
  DBClient, UDlClientDataset, DosMove, AdvPanel, AdvAppStyler, AdvToolBar,
  AdvToolBarStylers, AdvOfficeStatusBar, AdvOfficeStatusBarStylers, GridsEh,
  DBGridEh, ExtCtrls, AdvGlowButton, QExport3, QExport3DBF,DateUtils, ExtDlgs;

type
  TfrmDBFTheme = class(TFrmSuiDBListForm)
    advpnlTop: TAdvPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edtbtnPath: TAdvEditBtn;
    advdbdtmpckrStart: TAdvDBDateTimePicker;
    advdbdtmpckrEnd: TAdvDBDateTimePicker;
    btnExport: TAdvGlowButton;
    qxprt3dbf1: TQExport3DBF;
    clientdtDBF: TClientDataSet;
    SaveTFiledlgDBFFile: TSaveTextFileDialog;
    procedure FormShow(Sender: TObject);
    procedure DLCDSAfterScroll(DataSet: TDataSet);
    procedure acSaveExecute(Sender: TObject);
    procedure edtbtnPathClickBtn(Sender: TObject);
    procedure dbgrdh_DLCDSDblClick(Sender: TObject);
  private
    { Private declarations }
    /// <summary>
    /// 检验时间有效性
    /// </summary>
    /// <returns>Boolean</returns>
    function CheckDateValidate:Boolean;
  public
    { Public declarations }
    constructor Create(Aowner:TComponent);override;
    procedure checkData;override;
  end;

var
  frmDBFTheme: TfrmDBFTheme;

implementation
 USES UVsMidClassList,UGVar,UGFun,UCommon,UGShare,UFrmExportDBF;
{$R *.dfm}

{ TFrmSuiDBListForm1 }

procedure TfrmDBFTheme.acSaveExecute(Sender: TObject);
var
 dbfPath:string;
begin
  dbfPath := edtbtnPath.Text;
  if dbfPath ='' then
  begin
    ShowMsgSure('DBF导出路径不能为空');
    Exit;
  end;
  
  DLCDS.Edit;
  DLCDS.FieldByName('ThemePath').AsString := dbfPath;
  inherited;

end;

procedure TfrmDBFTheme.checkData;
begin
  inherited;
  //检验出院时间的有效性
  CheckDateValidate;

end;

function TfrmDBFTheme.CheckDateValidate: Boolean;
var
 startDate,EndDate:TDateTime;
begin
  result :=False;
  startDate := advdbdtmpckrStart.Date;
  EndDate := advdbdtmpckrEnd.Date;
  if EndDate > Now then
  begin
    raise Exception.Create('出院日期结束时间不能大于当前时间!');

  end;
  if startDate > EndDate then
  begin
    raise Exception.Create('出院日期开始时间不能大于结束时间!');

  end;
  Result := True;
end;

constructor TfrmDBFTheme.Create(Aowner: TComponent);
const
  SQL ='SELECT * FROM VsCHDBFTheme';
begin 
  inherited Create(Aowner,EuVsDBFThem,SQL);
end;

procedure TfrmDBFTheme.dbgrdh_DLCDSDblClick(Sender: TObject);
var
  TID:string;//方案ID
  TypeID:string;//DBF上报类型ID
  frmDBF:TFrmExportDBF;
begin
  inherited;
  if DLCDS.Active and (not DLCDS.IsEmpty) then
  begin
    TID := dlcds.FieldByName('TID').AsString;
    TypeID := DLCDS.FieldByName('TypeID').AsString;
    //打开DBF字段配置界面
    frmDBF := TFrmExportDBF.Create(nil);
    AutoFree(frmDBF);
    frmDBF.TypeID := TypeID;
    frmDBF.ShowModal;
    if frmDBF.TypeID<>'' then
    begin
      DLCDS.Edit;
      dlcds.FieldByName('TypeID').AsString := frmDBF.TypeID;
    end;
  end;
end;

procedure TfrmDBFTheme.DLCDSAfterScroll(DataSet: TDataSet);
var
 dbfPath:string;
begin
  inherited;
  dbfPath := DLCDS.FieldByName('ThemePath').AsString;
  edtbtnPath.Text := dbfPath;
  
end;

procedure TfrmDBFTheme.edtbtnPathClickBtn(Sender: TObject);
var
  filename :string;
begin
  inherited;
  SaveTFiledlgDBFFile.Filter := 'dBase文件(*.DBF)';
  if SaveTFiledlgDBFFile.Execute then
  begin
    filename := SaveTFiledlgDBFFile.FileName;
    if Pos('.dbf',filename)<1 then
    begin
      filename := filename+'.DBF';
    end;
    edtbtnPath.Text := filename;
  end;

end;

procedure TfrmDBFTheme.FormShow(Sender: TObject);
begin
  inherited;
  if DLCDS.Active and  DLCDS.IsEmpty then
  begin
    advdbdtmpckrStart.Date :=DateOf(StartOfTheMonth(Now));
    advdbdtmpckrEnd.Date := Now;
  end;
end;

initialization
  Classes.RegisterClass(TfrmDBFTheme);
finalization
  classes.UnRegisterClass(TfrmDBFTheme);

end.
