/// <summary>
/// 病案质控签出动作
/// </summary>
/// <author>jdl</author>
///<date>2016-08-18</date>

unit UFrmZKCheckOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmAction, DBGridEhGrouping, DB, ActnList, DBClient,
  UDlClientDataset, DosMove, AdvPanel, AdvAppStyler, AdvToolBar,
  AdvToolBarStylers, AdvOfficeStatusBar, AdvOfficeStatusBarStylers, GridsEh,
  DBGridEh, StdCtrls, AdvGroupBox, AdvGlowButton, AdvFontCombo, SUIEdit,
  ComCtrls, AdvDateTimePicker, ExtCtrls, AdvSplitter;

type
  TfrmZKCheckOut = class(TfrmActionCheckB)
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Aowner:TComponent);override;
    procedure PrintActionList;override;
  end;

var
  frmZKCheckOut: TfrmZKCheckOut;

implementation

{$R *.dfm}
{ TfrmZKCheckOut }

constructor TfrmZKCheckOut.Create(Aowner: TComponent);
begin
  ActionOperation := aoCheckOut;
  ActionDicDM := '102';
  inherited;
end;

procedure TfrmZKCheckOut.PrintActionList;
begin
  inherited;

end;

initialization
  RegisterClass(TfrmZKCheckOut);
finalization
  UnRegisterClass(TfrmZKCheckOut);

end.
