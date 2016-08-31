/// <summary>
/// 病案签入签出单
/// </summary>
/// <author> JDL</author>
/// <date> 2016-08-17 </date>
unit URptCheck;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBClient, qrpctrls;

type
  TRptCheck = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    yymc: TQRLabel;
    qrlRepCaption: TQRLabel;
    QRShape2: TQRShape;
    qrshp1: TQRShape;
    QRShape17: TQRShape;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    Cds1: TClientDataSet;
    QRShape13: TQRShape;
    qrdbtxtpatientID: TQRDBText;
    QRShape14: TQRShape;
    qrdbtxtBANumber: TQRDBText;
    QRShape15: TQRShape;
    qrdbtxtName: TQRDBText;
    QRShape16: TQRShape;
    qrdbtxtSex: TQRDBText;
    QRShape18: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    qrdbtxtCYKBMC: TQRDBText;
    QRShape23: TQRShape;
    qrxpr1: TQRExpr;
    qrbndSummaryBand1: TQRBand;
    qrsysdt1: TQRSysData;
    qrlblzbr: TQRLabel;
    qrshp2: TQRShape;
    qrshp3: TQRShape;
    qrdbtxtSex1: TQRDBText;
    qrbndColumnHeaderBand1: TQRBand;
    qrlbl3: TQRLabel;
    qrlbl4: TQRLabel;
    qrlbl5: TQRLabel;
    qrlbl6: TQRLabel;
    qrlbl7: TQRLabel;
    qrlbl8: TQRLabel;
    qrlbl9: TQRLabel;
    qrm1: TQRMemo;
    qrbndPageFooterBand1: TQRBand;
    qrxpr2: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }

  end;

  var
  RptReclaim:TRptCheck;
implementation

{$R *.DFM}



end.
