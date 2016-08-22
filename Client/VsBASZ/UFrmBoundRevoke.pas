/// <summary>
/// 病案装订撤销动作
/// </summary>
/// <author>jdl</author>
///<date>2016-08-19</date>
unit UFrmBoundRevoke;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmRevokeB, DBGridEhGrouping, DB, ActnList, DBClient,
  UDlClientDataset, DosMove, AdvPanel, AdvAppStyler, AdvToolBar,
  AdvToolBarStylers, AdvOfficeStatusBar, AdvOfficeStatusBarStylers, GridsEh,
  DBGridEh, StdCtrls, AdvGroupBox, AdvGlowButton, AdvFontCombo, SUIEdit,
  ComCtrls, AdvDateTimePicker, ExtCtrls;

type
  TfrmBoundRevoke = class(TfrmRevokeB)
  private
    { Private declarations }
  public
    { Public declarations }
     constructor Create(Aowner:TComponent);override;
    end;

var
  frmBoundRevoke: TfrmBoundRevoke;

implementation

{$R *.dfm}
{ TfrmBoundRevoke }

constructor TfrmBoundRevoke.Create(Aowner: TComponent);
begin
  ActionDicDM :='103';
  inherited;

end;

initialization
  RegisterClass(TfrmBoundRevoke);
finalization
  UnRegisterClass(TfrmBoundRevoke);

end.
