unit UFrmReason;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBListForm, DBGridEhGrouping, PrnDbgeh, DB, ActnList,
  DBClient, UDlClientDataset, DosMove, AdvPanel, AdvAppStyler, AdvToolBar,
  AdvToolBarStylers, AdvOfficeStatusBar, AdvOfficeStatusBarStylers, GridsEh,
  DBGridEh, ExtCtrls, AdvGlowButton,UVsMidClassList;

type
  TfrmRevokeReason = class(TFrmSuiDBListForm)
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Aowner:TComponent);override;
  end;

var
  frmRevokeReason: TfrmRevokeReason;

implementation

{$R *.dfm}
{ TfrmRevokeReason }

constructor TfrmRevokeReason.Create(Aowner: TComponent);
const
 SQL ='select * from SZRevokeReason';
begin
  inherited Create(Aowner,EuSZRevokeReason,SQL);

end;

initialization
  classes.RegisterClass(TfrmRevokeReason);
finalization
  classes.UnRegisterClass(TfrmRevokeReason);

end.
