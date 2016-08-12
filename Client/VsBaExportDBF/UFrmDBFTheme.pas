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
    /// ����ʱ����Ч��
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
    ShowMsgSure('DBF����·������Ϊ��');
    Exit;
  end;
  
  DLCDS.Edit;
  DLCDS.FieldByName('ThemePath').AsString := dbfPath;
  inherited;

end;

procedure TfrmDBFTheme.checkData;
begin
  inherited;
  //�����Ժʱ�����Ч��
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
    raise Exception.Create('��Ժ���ڽ���ʱ�䲻�ܴ��ڵ�ǰʱ��!');

  end;
  if startDate > EndDate then
  begin
    raise Exception.Create('��Ժ���ڿ�ʼʱ�䲻�ܴ��ڽ���ʱ��!');

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
  TID:string;//����ID
  TypeID:string;//DBF�ϱ�����ID
  frmDBF:TFrmExportDBF;
begin
  inherited;
  if DLCDS.Active and (not DLCDS.IsEmpty) then
  begin
    TID := dlcds.FieldByName('TID').AsString;
    TypeID := DLCDS.FieldByName('TypeID').AsString;
    //��DBF�ֶ����ý���
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
  SaveTFiledlgDBFFile.Filter := 'dBase�ļ�(*.DBF)';
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
