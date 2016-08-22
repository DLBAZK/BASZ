/// <summary>
/// 病案质控签入动作
/// </summary>
/// <author>jdl</author>
///<date>2016-08-18</date>

unit UFrmZKCheckIn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmAction, DBGridEhGrouping, DB, ActnList, DBClient,
  UDlClientDataset, DosMove, AdvPanel, AdvAppStyler, AdvToolBar,
  AdvToolBarStylers, AdvOfficeStatusBar, AdvOfficeStatusBarStylers, GridsEh,
  DBGridEh, StdCtrls, AdvGroupBox, AdvGlowButton, AdvFontCombo, SUIEdit,
  ComCtrls, AdvDateTimePicker, ExtCtrls, AdvSplitter;

type
  TfrmzkCheckIn = class(TfrmActionCheckB)
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Aowner:TComponent);override;
    procedure PrintActionList;override;
  end;

var
  frmzkCheckIn: TfrmzkCheckIn;

implementation

{$R *.dfm}
{ TfrmzkCheckIn }

constructor TfrmzkCheckIn.Create(Aowner: TComponent);
begin
  ActionOperation := aoCheckIn;
  ActionDicDM := '102';
  inherited Create(Aowner);
end;

procedure TfrmzkCheckIn.PrintActionList;
begin
  inherited;

end;

initialization
  RegisterClass(TfrmzkCheckIn);
finalization
  RegisterClass(TfrmzkCheckIn);

end.
