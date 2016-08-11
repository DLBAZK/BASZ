unit UFrmTableRel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBListForm, DBGridEhGrouping, PrnDbgeh, DB, ActnList,
  DBClient, UDlClientDataset, DosMove, AdvPanel, AdvAppStyler, AdvToolBar,
  AdvToolBarStylers, AdvOfficeStatusBar, AdvOfficeStatusBarStylers, GridsEh,
  DBGridEh, ExtCtrls, AdvGlowButton, StdCtrls, AdvCombo, AdvFontCombo,UVsMidClassList,
  SUIEdit;

type
  TfrmTableRel = class(TFrmSuiDBListForm)
    advpnl1: TAdvPanel;
    AdvPanel2: TAdvPanel;
    DBGridEh1: TDBGridEh;
    advpnl2: TAdvPanel;
    cbbTableRel: TAdvOfficeComboBox;
    clientdtLeft: TClientDataSet;
    dsLeft: TDataSource;
    clientdtright: TClientDataSet;
    dsright: TDataSource;
    edtRField: TsuiEdit;
    lbl1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure dbgrdh1DblClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgrdh_DLCDSColumns2GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure acSaveExecute(Sender: TObject);
    procedure dbgrdh1CellClick(Column: TColumnEh);
    procedure edtRFieldKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure FillRel;
  public
    { Public declarations }
    //�������ı�
    RelTableMC,RelTableBID :string;
    Constructor Create(Aowner:TComponent);Override;
  end;

var
  frmTableRel: TfrmTableRel;

implementation
  uses UGFun,UMidProxy,UFrmSource,UCommon;
{$R *.dfm}

procedure TfrmTableRel.acSaveExecute(Sender: TObject);
begin
  DLCDS.Edit;
  DLCDS.FieldByName('BRelKind').AsString := IntToStr(cbbTableRel.ItemIndex);
  if DLCDS.FieldByName('Lkind').AsString ='' then
     DLCDS.FieldByName('Lkind').AsString  := '0';
  if DLCDS.FieldByName('Rkind').AsString ='' then
     DLCDS.FieldByName('Rkind').AsString  := '0';
  DLCDS.FieldByName('RBID').AsString := RelTableBID;
  DLCDS.FieldByName('LBID').AsString:= clientdtLeft.FieldByName('BID').AsString;
  inherited;

end;

constructor TfrmTableRel.Create(Aowner: TComponent);
begin
  inherited Create(Aowner,EuVsDBFRel,'select * from VsCHDBFTableRel ');

end;

procedure TfrmTableRel.dbgrdh1CellClick(Column: TColumnEh);
var
  bid:string;
begin
  inherited;
  bid := clientdtLeft.FieldByName('bid').AsString;
  SetFilter(Format('LBID=^%s^ and RBID=^%s^',[bid,RelTableBID]),DLCDS);
end;

procedure TfrmTableRel.dbgrdh1DblClick(Sender: TObject);
var
 frmField:TfrmSource; //�ֶ�ѡ����
 tableName:string;
begin
  inherited;
  //��ȡ��ǰѡ��ı� 
  tableName := clientdtLeft.FieldByName('BID').AsString;
  frmField := TfrmSource.Create(nil);
  autofree(frmField);
  frmField.TableName := tableName;
  if  frmField.ShowModal = mrOk then
  begin
    if frmField.TableName <>'' then
    begin
      DLCDS.Edit;
      DLCDS.FieldByName('LBID').AsString := frmField.TableName;
      DLCDS.FieldByName('LField').AsString := frmField.FieldName;        
    end;
  end;
end;

procedure TfrmTableRel.dbgrdh_DLCDSColumns2GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  inherited;
  Params.Text := '=';
end;

procedure TfrmTableRel.DBGridEh1DblClick(Sender: TObject);
var
 RBID:string; //�ұ�ID
 RField:string;//�ұ��ֶ�
begin
  inherited;
  if clientdtright.Active and (not clientdtright.IsEmpty) then
  begin
    if DLCDS.Active and (DLCDS.State in [dsInsert,dsEdit]) then
    begin
      //��ȡ�ұ��GUID��ѡ����ֶ�
      RBID := clientdtright.FieldByName('BID').AsString;
      RField :=clientdtright.FieldByName('FieldName').AsString;
      DLCDS.Edit;
      DLCDS.FieldByName('RBID').AsString := RBID;
      DLCDS.FieldByName('RField').AsString := RField;
    end;
  end;
end;

procedure TfrmTableRel.edtRFieldKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 FieldMC:string; //�ֶ�����
 filter:string;
begin
  inherited;
  FieldMC := Trim(edtRField.Text);

  if clientdtright.Active then
  begin
    if FieldMC<>'' then
    begin
       filter :='(FieldName like ^%'+FieldMC+'%^ or LOWER(FieldName)=LOWER(^'+FieldMC+'^)'
           +Format(') and TableName=^%s^ and BID=^%s^',[RelTableMC,RelTableBID]);
    end
    else
    begin
      filter :=Format(' TableName=^%s^ and BID=^%s^',[RelTableMC,RelTableBID]);
    end;

    SetFilter(filter,clientdtright);
  end;



end;

procedure TfrmTableRel.FillRel;
var
 clienttmp:TClientDataSet;
begin
  clienttmp := TClientDataSet.Create(nil);
  AutoFree(clienttmp);
  TMidProxy.SqlOpen('Select Dm, DmMc From EB_Dictionary Where Kind=^20^',clienttmp);
  clienttmp.First;
  while not clienttmp.Eof do
  begin
    cbbTableRel.Items.Add(clienttmp.FieldByName('dm').AsString+'.'+clienttmp.FieldByName('dmmc').AsString);
    clienttmp.Next;
  end;
end;
procedure TfrmTableRel.FormCreate(Sender: TObject);
const
  SQL ='select * from VsCHDBFTable ';
begin
  inherited;

  //���ر����ӷ�ʽ
  FillRel;
 // FillCombobox('Select Dm, DmMc From EB_Dictionary Where Kind=^20^','DM','DMMC',cbbTableRel);
  cbbTableRel.ItemIndex := 1;

  //�����ֶ�����
  FillDBGridEHCombobox(' Select Dm, DmMc From EB_Dictionary Where Kind=^19^',dbgrdh_DLCDS,'LKind','DM','dmmc');
  FillDBGridEHCombobox(' Select Dm, DmMc From EB_Dictionary Where Kind=^19^',dbgrdh_DLCDS,'RKind','DM','dmmc');

  //������߹���ı�
  TMidProxy.SqlOpen(SQL,clientdtLeft);
  // ���ر������ı���ֶ�
  TMidProxy.SqlOpen('EXEC P_GetDBFRelFields',clientdtright);
end;

procedure TfrmTableRel.FormShow(Sender: TObject);
begin
  inherited;
   //��ѯ�����
  SetFilter(Format('RBID=^%s^',[RelTableBID]),DLCDS);
  //��ѯ��������ֶ�
  SetFilter(Format('TableName=^%s^ and BID=^%s^',[RelTableMC,RelTableBID]),clientdtright);
  SetFilter(Format('BID<>^%s^',[RelTableBID]),clientdtLeft);
  dbgrdh1CellClick(nil);
end;

end.
