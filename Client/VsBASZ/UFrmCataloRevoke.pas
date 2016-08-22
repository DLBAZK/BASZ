/// <summary>
/// 病案编目撤销动作
/// </summary>
/// <author>jdl</author>
///<date>2016-08-19</date>
unit UFrmCataloRevoke;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmRevokeB, DBGridEhGrouping, DB, ActnList, DBClient,
  UDlClientDataset, DosMove, AdvPanel, AdvAppStyler, AdvToolBar,
  AdvToolBarStylers, AdvOfficeStatusBar, AdvOfficeStatusBarStylers, GridsEh,
  DBGridEh, StdCtrls, AdvGroupBox, AdvGlowButton, AdvFontCombo, SUIEdit,
  ComCtrls, AdvDateTimePicker, ExtCtrls;

type
  TfrmCataloRevoke = class(TfrmRevokeB)
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Aowner:TComponent);override;
  end;

var
  frmCataloRevoke: TfrmCataloRevoke;

implementation

{$R *.dfm}

{ TfrmCataloRevoke }

constructor TfrmCataloRevoke.Create(Aowner: TComponent);
begin
  ActionDicDM :='104';
  inherited;

end;

initialization
  RegisterClass(TfrmCataloRevoke);
finalization
 UnRegisterClass(TfrmCataloRevoke);

end.
