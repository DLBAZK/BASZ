/// <summary>
/// ²¡°¸ÖÊ¿Ø³·Ïú
/// </summary>
/// <author>jdl</author>
///<date>2016-08-17</date>

unit UFrmZKRevoke;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmRevokeB, DBGridEhGrouping, DB, ActnList, DBClient,
  UDlClientDataset, DosMove, AdvPanel, AdvAppStyler, AdvToolBar,
  AdvToolBarStylers, AdvOfficeStatusBar, AdvOfficeStatusBarStylers, GridsEh,
  DBGridEh, StdCtrls, AdvGroupBox, AdvGlowButton, AdvFontCombo, SUIEdit,
  ComCtrls, AdvDateTimePicker, ExtCtrls, AdvEdit;

type
  TfrmZKRevoke = class(TfrmRevokeB)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmZKRevoke: TfrmZKRevoke;

implementation

{$R *.dfm}

{ TfrmZKRevoke }


procedure TfrmZKRevoke.FormCreate(Sender: TObject);
begin
  ActionDicDM :='102';
  inherited;

end;

initialization
  RegisterClass(TfrmZKRevoke);
finalization
 UnRegisterClass(TfrmZKRevoke);

end.
