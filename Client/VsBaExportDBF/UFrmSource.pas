unit UFrmSource;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBForm, AdvGlowButton, StdCtrls, SUIEdit, TFlatPanelUnit, DB,
  ActnList, DBClient, UDlClientDataset, DosMove, AdvPanel, AdvAppStyler,
  AdvToolBar, AdvToolBarStylers, AdvOfficeStatusBar, AdvOfficeStatusBarStylers,
  ExtCtrls, DBGridEhGrouping, GridsEh, DBGridEh;

type
  TfrmSource = class(TFrmSuiDBForm)
    fltpnl1: TFlatPanel;
    lbl1: TLabel;
    edtTableName: TsuiEdit;
    lbl2: TLabel;
    edtField: TsuiEdit;
    btn1: TAdvGlowButton;
    btn2: TAdvGlowButton;
    dbgrdh1: TDBGridEh;
    clientdtField: TClientDataSet;
    procedure btn2Click(Sender: TObject);
    procedure edtTableNameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFieldKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure dbgrdh1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    //获取源表字段
    procedure GetSourceField;
    //选择字段
    procedure SelField;
  public
    { Public declarations }
    FieldName,TableName,TableCus:string; //字段、表名、表别名
  end;

var
  frmSource: TfrmSource;

implementation
  uses UMidProxy,UGFun;
{$R *.dfm}

procedure TfrmSource.btn1Click(Sender: TObject);
begin
  inherited;
  SelField;
end;

procedure TfrmSource.btn2Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmSource.dbgrdh1DblClick(Sender: TObject);
begin
  inherited;
  SelField;
  ModalResult := mrOk;
end;

procedure TfrmSource.edtFieldKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 FieldMC:string; //字段名称
begin
  inherited;
  FieldMC := Trim(edtField.Text);
  if FieldMC<>'' then
  begin
    if clientdtField.Active then
    begin
      SetFilter('FieldName like ^%'+FieldMC+'%^ or LOWER(FieldName)=LOWER(^'+FieldMC+'^)',clientdtField);
    end;
  end;

end;

procedure TfrmSource.edtTableNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 tableMC:string;
 Filter:string;
begin
  inherited;
  tableMC := Trim(edtTableName.Text);
  if tableMC<>'' then
  begin
    if clientdtField.Active then
    begin
      Filter := 'tablename like ^%'+tableMC+'%^ or tablecus like ^%'+tableMC+'%^'+' or LOWER(tablename)=LOWER(^'+tableMC+'^)'
            +' or LOWER(tablecus)=LOWER(^'+tableMC+'^)' ;
      SetFilter(Filter,clientdtField);
    end;
  end;
end;

procedure TfrmSource.FormCreate(Sender: TObject);
begin
  inherited;
  GetSourceField;
 
end;

procedure TfrmSource.FormShow(Sender: TObject);
begin
  inherited;
  edtField.SetFocus;
  if TableName <> '' then
    SetFilter(Format(' BID = ^%s^',[TableName]),clientdtField);
end;

procedure TfrmSource.GetSourceField;
const
  SQL='EXEC P_GetDBFRelFields';
begin
  TMidProxy.SqlOpen(SQL,clientdtField);
end;

procedure TfrmSource.SelField;
begin
  if clientdtField.Active and (not clientdtField.IsEmpty) then
  begin
    FieldName :=clientdtField.FieldByName('FieldName').AsString;
    TableName :=clientdtField.FieldByName('BID').AsString;
    TableCus := clientdtField.FieldByName('TableCus').AsString;
  end;
end;

end.
