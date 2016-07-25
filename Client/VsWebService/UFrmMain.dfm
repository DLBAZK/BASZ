inherited FrmYinHaiMain: TFrmYinHaiMain
  Caption = #24179#21488#25968#25454#19978#25253
  ClientWidth = 1085
  ExplicitWidth = 1093
  ExplicitHeight = 426
  PixelsPerInch = 96
  TextHeight = 13
  inherited advfcstsbr: TAdvOfficeStatusBar
    Width = 1085
    ExplicitWidth = 1085
  end
  inherited advtlbrpgr1: TAdvToolBarPager
    Width = 1085
    ExplicitWidth = 1085
    inherited AdvPage1: TAdvPage
      Width = 1077
      Height = 0
      ExplicitWidth = 1077
      ExplicitHeight = 0
    end
  end
  inherited AdvPanel1: TAdvPanel
    Width = 1085
    ExplicitWidth = 1085
    FullHeight = 200
    object fltpnl1: TFlatPanel
      Left = 0
      Top = 0
      Width = 1085
      Height = 57
      HelpType = htKeyword
      Transparent = True
      ParentColor = True
      Align = alTop
      TabOrder = 0
      object lbldateStart: TLabel
        Left = 12
        Top = 16
        Width = 52
        Height = 19
        Caption = #20986#38498#26085#26399
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
      end
      object lblDateEnd: TLabel
        Left = 180
        Top = 16
        Width = 13
        Height = 19
        Caption = #21040
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
      end
      object lblID: TLabel
        Left = 340
        Top = 16
        Width = 39
        Height = 19
        Caption = #29992#25143#21517
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 527
        Top = 16
        Width = 26
        Height = 19
        Caption = #23494#30721
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
      end
      object advdtmpckrStart: TAdvDateTimePicker
        Left = 74
        Top = 15
        Width = 100
        Height = 25
        BevelInner = bvNone
        Date = 42370.411250000000000000
        Time = 42370.411250000000000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        Kind = dkDate
        ParentFont = False
        TabOrder = 0
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 42370.411250000000000000
        Version = '1.2.0.1'
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
      end
      object advdtmpckrEnd: TAdvDateTimePicker
        Left = 213
        Top = 15
        Width = 100
        Height = 25
        BevelInner = bvNone
        Date = 42400.411250000000000000
        Time = 42400.411250000000000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        Kind = dkDate
        ParentFont = False
        TabOrder = 1
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 42400.411250000000000000
        Version = '1.2.0.1'
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
      end
      object btnOK: TAdvGlowButton
        Left = 760
        Top = 10
        Width = 100
        Height = 41
        Caption = #19978#25253
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btnOKClick
        Appearance.ColorChecked = 16111818
        Appearance.ColorCheckedTo = 16367008
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 16111818
        Appearance.ColorDownTo = 16367008
        Appearance.ColorHot = 16117985
        Appearance.ColorHotTo = 16372402
        Appearance.ColorMirrorHot = 16107693
        Appearance.ColorMirrorHotTo = 16775412
        Appearance.ColorMirrorDown = 16102556
        Appearance.ColorMirrorDownTo = 16768988
        Appearance.ColorMirrorChecked = 16102556
        Appearance.ColorMirrorCheckedTo = 16768988
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
      end
      object edtID: TEdit
        Left = 391
        Top = 19
        Width = 121
        Height = 21
        TabOrder = 3
      end
      object edtPwd: TEdit
        Left = 580
        Top = 19
        Width = 121
        Height = 21
        TabOrder = 4
      end
    end
    object dbgrdhState: TDBGridEh
      Left = 0
      Top = 57
      Width = 1085
      Height = 294
      Align = alClient
      BorderStyle = bsNone
      DataGrouping.GroupLevels = <>
      DataSource = ds1
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
      ParentFont = False
      RowDetailPanel.Color = clBtnFace
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #24494#36719#38597#40657
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'CH0A01'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #30149#26696#21495
          Width = 109
        end
        item
          EditButtons = <>
          FieldName = 'Operationtime'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #26102#38388
          Width = 170
        end
        item
          EditButtons = <>
          FieldName = 'OperationStateDesc'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #29366#24577
          Width = 246
        end
        item
          EditButtons = <>
          FieldName = 'OperationLB'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #31867#21035
          Width = 153
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
end
