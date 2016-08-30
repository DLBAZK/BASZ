inherited frmRptCheck: TfrmRptCheck
  BorderStyle = bsSingle
  Caption = #25253#34920#39044#35272
  ClientHeight = 568
  ClientWidth = 935
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited advfcstsbr: TAdvOfficeStatusBar
    Top = 549
    Width = 935
  end
  inherited advtlbrpgr1: TAdvToolBarPager
    Width = 935
    inherited AdvPage1: TAdvPage
      Width = 927
      ExplicitWidth = 927
    end
  end
  inherited AdvPanel1: TAdvPanel
    Width = 935
    Height = 524
    FullHeight = 200
    inherited AdvPanel2: TAdvPanel
      Width = 935
      FullHeight = 38
      inherited advtlbr1: TAdvToolBar
        inherited btnPreview: TAdvGlowButton
          Visible = False
        end
      end
    end
    inherited aopRep: TAdvOfficePager
      Width = 935
      Height = 486
      NextPictureChanged = False
      PrevPictureChanged = False
    end
  end
end
