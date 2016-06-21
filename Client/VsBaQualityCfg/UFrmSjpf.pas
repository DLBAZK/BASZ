/// <summary>
/// ����������������
/// </summary>
/// <author> Lisa </author>
/// <date> 2016-05-17 </date>
unit UFrmSjpf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBListForm, PrnDbgeh, ImgList, DB, ActnList, DBClient, UDlClientDataset, DosMove, AdvPanel, AdvAppStyler,
  AdvToolBar, AdvToolBarStylers, AdvOfficeStatusBar, AdvOfficeStatusBarStylers, GridsEh, DBGridEh, ExtCtrls, AdvGlowButton,
  UVSMidClassList,DBGridEhGrouping;

type
  TfrmSjpf = class(TFrmSuiDBListForm)
    procedure DLCDSAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  protected
    procedure CheckData;override;
    Procedure InitControl;Override;
  public
    Constructor Create(Aowner:TComponent);Override;
  end;

implementation

uses UgVar,UGFun;

{$R *.dfm}

{ TfrmSjpf }

procedure TfrmSjpf.CheckData;
begin
  inherited;
  IF DlCds.FieldByName('dm').AsString='' Then
     Raise Exception.Create('��Ŀ���벻��Ϊ��!');
  IF DlCds.FieldByName('dmmc').AsString='' Then
     Raise Exception.Create('��Ŀ���Ʋ���Ϊ�գ�');
  if DlCds.FieldByName('xmlx').AsString= '' then
     Raise Exception.Create('��Ŀ���Ͳ���Ϊ�գ�');
end;

constructor TfrmSjpf.Create(Aowner: TComponent);
begin
  inherited Create(Aowner,EuVsSjpf,'');
  FillDBGridEHCombobox('SELECT dm xmlx,dmmc xmlxmc FROM Vsxmlx WHERE isTy = 0',dbgrdh_DLCDS,'xmlx','xmlx','xmlxmc');
end;

procedure TfrmSjpf.DLCDSAfterInsert(DataSet: TDataSet);
begin
  inherited;
  SetFieldValue('isTy',sBoolFalse,Dlcds,False);
end;

procedure TfrmSjpf.InitControl;
begin
  inherited;
end;

initialization
  Classes.RegisterClass(TfrmSjpf);
finalization
  Classes.UnRegisterClass(TfrmSjpf);
  
end.
