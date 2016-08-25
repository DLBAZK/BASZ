/// <summary>
/// 病案装订签出动作
/// </summary>
/// <author>jdl</author>
///<date>2016-08-18</date>
unit UFrmBoundOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmAction, DBGridEhGrouping, DB, ActnList, DBClient,
  UDlClientDataset, DosMove, AdvPanel, AdvAppStyler, AdvToolBar,
  AdvToolBarStylers, AdvOfficeStatusBar, AdvOfficeStatusBarStylers, GridsEh,
  DBGridEh, StdCtrls, AdvGroupBox, AdvGlowButton, AdvFontCombo, SUIEdit,
  ComCtrls, AdvDateTimePicker, ExtCtrls, AdvSplitter;

type
  TfrmBoundOut = class(TfrmActionCheckB)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PrintActionList;override;
  end;

var
  frmBoundOut: TfrmBoundOut;

implementation

{$R *.dfm}

{ TfrmBoundOut }


procedure TfrmBoundOut.FormCreate(Sender: TObject);
begin
  ActionDicDM := '103';
  ActionOperation:=aoCheckOut;
  ListPrefix :='ZD';
  inherited;

end;

procedure TfrmBoundOut.PrintActionList;
begin
  inherited;

end;

initialization
  RegisterClass(TfrmBoundOut);
finalization
  UnRegisterClass(TfrmBoundOut);

end.
