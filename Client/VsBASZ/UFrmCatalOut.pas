/// <summary>
/// 病案编目签出动作
/// </summary>
/// <author>jdl</author>
///<date>2016-08-18</date>
unit UFrmCatalOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmAction, DBGridEhGrouping, DB, ActnList, DBClient,
  UDlClientDataset, DosMove, AdvPanel, AdvAppStyler, AdvToolBar,
  AdvToolBarStylers, AdvOfficeStatusBar, AdvOfficeStatusBarStylers, GridsEh,
  DBGridEh, StdCtrls, AdvGroupBox, AdvGlowButton, AdvFontCombo, SUIEdit,
  ComCtrls, AdvDateTimePicker, ExtCtrls, AdvSplitter;

type
  TfrmCatalOut = class(TfrmActionCheckB)
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Aowner:TComponent);override;
    procedure PrintActionList;override;
  end;

var
  frmCatalOut: TfrmCatalOut;

implementation

{$R *.dfm}

{ TfrmCatalOut }

constructor TfrmCatalOut.Create(Aowner: TComponent);
begin
  ActionDicDM :='104';
  ActionOperation :=aoCheckOut;
  inherited Create(Aowner);

end;

procedure TfrmCatalOut.PrintActionList;
begin
  inherited;

end;

initialization
  RegisterClass(TfrmCatalOut);
finalization
  UnRegisterClass(TfrmCatalOut);

end.
