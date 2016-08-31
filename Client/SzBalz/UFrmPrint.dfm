inherited frmPrint: TfrmPrint
  BorderStyle = bsSingle
  Caption = #25171#21360#39044#35272
  ClientHeight = 405
  ClientWidth = 695
  Position = poScreenCenter
  ExplicitWidth = 701
  ExplicitHeight = 434
  PixelsPerInch = 96
  TextHeight = 13
  inherited advfcstsbr: TAdvOfficeStatusBar
    Top = 386
    Width = 695
  end
  inherited advtlbrpgr1: TAdvToolBarPager
    Width = 695
    TabOrder = 1
    inherited AdvPage1: TAdvPage
      Width = 687
      Height = 0
      ExplicitWidth = 687
      ExplicitHeight = 0
    end
  end
  inherited AdvPanel1: TAdvPanel
    Width = 695
    Height = 361
    FullHeight = 200
    object qrprvwprint: TQRPreview
      Left = 0
      Top = 0
      Width = 695
      Height = 361
      HorzScrollBar.Tracking = True
      VertScrollBar.Tracking = True
      Align = alClient
      TabOrder = 0
      PageNumber = 1
      Zoom = 100
      ExplicitWidth = 685
      ExplicitHeight = 250
    end
  end
end
