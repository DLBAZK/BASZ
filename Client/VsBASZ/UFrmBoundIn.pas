/// <summary>
/// 病案装订签入动作
/// </summary>
/// <author>jdl</author>
///<date>2016-08-18</date>
unit UFrmBoundIn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmAction, DBGridEhGrouping, DB, ActnList, DBClient,
  UDlClientDataset, DosMove, AdvPanel, AdvAppStyler, AdvToolBar,
  AdvToolBarStylers, AdvOfficeStatusBar, AdvOfficeStatusBarStylers, GridsEh,
  DBGridEh, StdCtrls, AdvGroupBox, AdvGlowButton, AdvFontCombo, SUIEdit,
  ComCtrls, AdvDateTimePicker, ExtCtrls, AdvSplitter;

type
  TfrmBoundIn = class(TfrmActionCheckB)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PrintActionList;override;
  end;

var
  frmBoundIn: TfrmBoundIn;

implementation

{$R *.dfm}

{ TfrmBoundIn }


procedure TfrmBoundIn.FormCreate(Sender: TObject);
begin
  ActionDicDM := '103' ;
  ActionOperation := aoCheckIn;
  inherited;

end;

procedure TfrmBoundIn.PrintActionList;
begin
  inherited;

end;

initialization
 RegisterClass(TfrmBoundIn);
finalization
 UnRegisterClass(TfrmBoundIn);

end.
