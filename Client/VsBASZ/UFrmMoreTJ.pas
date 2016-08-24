unit UFrmMoreTJ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBForm, DB, ActnList, DBClient, UDlClientDataset, DosMove,
  AdvPanel, AdvAppStyler, AdvToolBar, AdvToolBarStylers, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, ExtCtrls, ComCtrls, AdvDateTimePicker, StdCtrls,
  AdvGlowButton, TFlatGroupBoxUnit, SUIEdit, AdvFontCombo, AdvEdit;

type
  TfrmMoreTJ = class(TFrmSuiDBForm)
    fltgrpbxCondition: TFlatGroupBox;
    btnOK: TAdvGlowButton;
    lbl2: TLabel;
    advdtmpckrStart: TAdvDateTimePicker;
    lbl3: TLabel;
    advdtmpckrEnd: TAdvDateTimePicker;
    btnClose: TAdvGlowButton;
    lbl5: TLabel;
    lbl4: TLabel;
    edtDrectorDoctor: TsuiEdit;
    lbl1: TLabel;
    edtAttendingDoctor: TsuiEdit;
    lbl6: TLabel;
    edtResidentDoctor: TsuiEdit;
    lbl7: TLabel;
    edtName: TsuiEdit;
    lbl8: TLabel;
    cbbGender: TAdvOfficeComboBox;
    lbl9: TLabel;
    edtAge: TsuiEdit;
    lbl10: TLabel;
    edtPhone: TsuiEdit;
    advpnlBom: TAdvPanel;
    edtPatientID: TsuiEdit;
    lbl11: TLabel;
    edtBANumber: TsuiEdit;
    lbl12: TLabel;
    advedtOffice: TAdvEdit;
    procedure advedtOfficeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
   //��Ժ���Ҵ���
    ksdm:string;

  public
    { Public declarations }
    Condition:string;//where���
  end;

var
  frmMoreTJ: TfrmMoreTJ;

implementation
  uses UGVar,UGFun,UCommon;
{$R *.dfm}

procedure TfrmMoreTJ.advedtOfficeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key=32 then
  begin
    ksdm := ShowDM(sdm_ZyKs,advedtOffice,False);
  end;
end;

procedure TfrmMoreTJ.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmMoreTJ.btnOKClick(Sender: TObject);
var
  StartDate,EndDate:string;//��Ժ����
begin
  inherited;
  if advdtmpckrStart.Date > advdtmpckrEnd.Date then
  begin
    ShowMsgSure('��ʼ���ڲ��ܴ��ڽ�������');
    Exit;
  end;
  StartDate := FormatDateTime('yyyy-mm-dd',advdtmpckrStart.Date);
  EndDate := FormatDateTime('yyyy-mm-dd',advdtmpckrEnd.Date);
  Condition := Format(' and RYRQ >= ^%s^ AND RYRQ <= ^%s^ ',[StartDate,EndDate]);
  //��Ժ����
  if ksdm <>'' then
  begin
    Condition :=Condition + Format(' and RYKB=^%s^',[ksdm]);
  end;
  //����ҽʦ
  if edtDrectorDoctor.Text<> '' then
  begin
    Condition :=Condition +format(' and DirectDoctor=^%s^',[edtDrectorDoctor.Text]);
  end;

  //����ҽʦ
  if edtAttendingDoctor.Text<> '' then
  begin
    Condition :=Condition +format(' and AttendingDoctor=^%s^',[edtAttendingDoctor.Text]);
  end;
   //סԺҽʦ
  if edtResidentDoctor.Text<> '' then
  begin
    Condition :=Condition +format(' and ResidentDoctor=^%s^',[edtResidentDoctor.Text]);
  end;
  //����
  if edtName.Text <>'' then
  begin
    Condition :=Condition +format(' and name =^%s^',[edtName.Text]);
  end;
  //�Ա�
  if cbbGender.ItemIndex >-1 then
  begin
    Condition :=Condition +format(' and sex =^%s^',[GetDmOFCombobox(cbbGender)]);
  end;
  //����
  if edtAge.Text <>'' then
  begin
    Condition :=Condition +format(' and age =%d',[StrToInt(edtAge.Text)]);
  end;
  //����ID
  if edtPatientID.Text <>'' then
  begin
    Condition :=Condition +format(' and patientID =^%s^',[edtPatientID.Text]);
  end;
  //������
  if edtBANumber.Text <>'' then
  begin
    Condition :=Condition +format(' and BANumber =^%s^',[edtBANumber.Text]);
  end;
  //��ϵ��ʽ
  if edtPhone.Text <>'' then
  begin
    Condition :=Condition +format(' and Phone =^%s^',[edtPhone.Text]);
  end;
end;

procedure TfrmMoreTJ.FormCreate(Sender: TObject);
begin
  inherited;
  //����Ա�
  FillCombobox('SELECT id,xb FROM dbo.VsZhdm_12 WHERE ISNULL(xb,^^)<>^^','id','xb',cbbGender);
end;

end.
