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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PrintActionList;override;
  end;

var
  frmFrmCatalogue: TfrmFrmCatalogue;

implementation

{$R *.dfm}
{ TfrmFrmCatalogue }

procedure TfrmFrmCatalogue.FormCreate(Sender: TObject);
begin
  ActionDicDM := '104';
  ActionOperation:=aoCheckIn;
  inherited;

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
