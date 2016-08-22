/// <summary>
/// 病案编目签入动作
/// </summary>
/// <author>jdl</author>
///<date>2016-08-19</date>
unit UFrmCatalogue;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmAction, DBGridEhGrouping, DB, ActnList, DBClient,
  UDlClientDataset, DosMove, AdvPanel, AdvAppStyler, AdvToolBar,
  AdvToolBarStylers, AdvOfficeStatusBar, AdvOfficeStatusBarStylers, GridsEh,
  DBGridEh, StdCtrls, AdvGroupBox, AdvGlowButton, AdvFontCombo, SUIEdit,
  ComCtrls, AdvDateTimePicker, ExtCtrls, AdvSplitter;

type
  TfrmFrmCatalogue = class(TfrmActionCheckB)
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Aowner:TComponent);override;
    procedure PrintActionList;override;
  end;

var
  frmFrmCatalogue: TfrmFrmCatalogue;

implementation

{$R *.dfm}
{ TfrmFrmCatalogue }

constructor TfrmFrmCatalogue.Create(Aowner: TComponent);
begin
  ActionDicDM := '104';
  ActionOperation:=aoCheckIn;
  inherited Create(Aowner);;

end;

procedure TfrmFrmCatalogue.PrintActionList;
begin
  inherited;

end;

initialization
  RegisterClass(TfrmFrmCatalogue);
finalization
  UnRegisterClass(TfrmFrmCatalogue);

end.
