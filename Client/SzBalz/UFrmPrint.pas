unit UFrmPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBForm, DB, ActnList, DBClient, UDlClientDataset, DosMove,
  AdvPanel, AdvAppStyler, AdvToolBar, AdvToolBarStylers, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, ExtCtrls, QRPrntr;

type
  TfrmPrint = class(TFrmSuiDBForm)
    qrprvwprint: TQRPreview;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrint: TfrmPrint;

implementation

{$R *.dfm}

end.
