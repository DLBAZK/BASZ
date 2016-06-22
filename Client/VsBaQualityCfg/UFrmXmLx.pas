unit UFrmXmLx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBListForm, DBGridEhGrouping, PrnDbgeh, DB, ActnList,
  DBClient, UDlClientDataset, DosMove, AdvPanel, AdvAppStyler, AdvToolBar,
  AdvToolBarStylers, AdvOfficeStatusBar, AdvOfficeStatusBarStylers, GridsEh,
  DBGridEh, ExtCtrls, AdvGlowButton,UVsMidClassList;

type
  TfrmXmLx = class(TFrmSuiDBListForm)
  private
    { Private declarations }
  public
    { Public declarations }
    constructor  Create(Aowner:TComponent);Override;
    Procedure CheckData;Override;
  end;

var
  frmXmLx: TfrmXmLx;

implementation

{$R *.dfm}

{ TFrmSuiDBListForm1 }

procedure TfrmXmLx.CheckData;
begin
  inherited;
  if DLCDS.FieldByName('dm').AsString = '' then
    raise Exception.Create('项目代码不能为空！');
  if DLCDS.FieldByName('dmmc').AsString = '' then
    raise Exception.Create('名称不能为空！');
  if Length(DLCDS.FieldByName('dm').AsString) >4 then
    raise Exception.Create('项目代码长度不能大于4位！');
end;

constructor TfrmXmLx.Create(Aowner: TComponent);
begin
  inherited Create(Aowner,EuVsXmLx,'select * from Vsxmlx order by dm');

end;

initialization
   Classes.RegisterClass(TfrmXmLx);
finalization
   Classes.UnRegisterClass(TfrmXmLx);

end.
