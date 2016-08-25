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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PrintActionList;override;
  end;

var
  frmzkCheckIn: TfrmzkCheckIn;

implementation

{$R *.dfm}
{ TfrmzkCheckIn }


procedure TfrmzkCheckIn.FormCreate(Sender: TObject);
begin
  ActionOperation := aoCheckIn;
  ActionDicDM := '102';
  ListPrefix :='ZK';
  inherited;

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
