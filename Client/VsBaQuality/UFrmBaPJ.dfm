inherited FrmBaPJ: TFrmBaPJ
  Caption = #30149#26696#32456#26411#35780#20215
  ClientHeight = 652
  ClientWidth = 1238
  ExplicitWidth = 1254
  ExplicitHeight = 690
  PixelsPerInch = 96
  TextHeight = 13
  inherited advfcstsbr: TAdvOfficeStatusBar
    Top = 633
    Width = 1238
    ExplicitTop = 633
    ExplicitWidth = 1238
  end
  inherited advtlbrpgr1: TAdvToolBarPager
    Width = 1238
    ExplicitWidth = 1238
    inherited AdvPage1: TAdvPage
      Width = 1230
      Height = 0
      ExplicitWidth = 1230
      ExplicitHeight = 0
    end
  end
  inherited AdvPanel1: TAdvPanel
    Width = 1238
    Height = 608
    ExplicitWidth = 1238
    ExplicitHeight = 608
    FullHeight = 200
    object AdvSplitter1: TAdvSplitter
      Left = 425
      Top = 0
      Height = 608
      Appearance.BorderColor = clNone
      Appearance.BorderColorHot = clNone
      Appearance.Color = clWhite
      Appearance.ColorTo = clSilver
      Appearance.ColorHot = clWhite
      Appearance.ColorHotTo = clGray
      GripStyle = sgDots
      ExplicitLeft = 552
      ExplicitTop = 240
      ExplicitHeight = 100
    end
    object AdvPanel2: TAdvPanel
      Left = 0
      Top = 0
      Width = 425
      Height = 608
      Align = alLeft
      Color = 16640730
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      UseDockManager = True
      Version = '2.1.1.0'
      Caption.Color = clHighlight
      Caption.ColorTo = clNone
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clWindowText
      Caption.Font.Height = -11
      Caption.Font.Name = 'Tahoma'
      Caption.Font.Style = []
      ColorTo = 14986888
      StatusBar.Font.Charset = DEFAULT_CHARSET
      StatusBar.Font.Color = clWindowText
      StatusBar.Font.Height = -11
      StatusBar.Font.Name = 'Tahoma'
      StatusBar.Font.Style = []
      FullHeight = 200
      object FlatGroupBox1: TFlatGroupBox
        Left = 1
        Top = 1
        Width = 423
        Height = 88
        Align = alTop
        Caption = #26597#35810
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object EllipsLabel2: TEllipsLabel
          Left = 21
          Top = 25
          Width = 28
          Height = 20
          Caption = #31867#21035
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          EllipsType = etNone
          Version = '1.0.0.0'
        end
        object AdvbtnActLocate: TAdvGlowButton
          Left = 342
          Top = 18
          Width = 74
          Height = 69
          Action = ActLocate
          AutoSize = True
          Caption = '    '#26597#25214
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          ImageIndex = 11
          Images = DM_Img.ilButton
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          ParentFont = False
          Position = bpMiddle
          TabOrder = 1
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
          Layout = blGlyphTop
        end
        object suicbcbbLB: TsuiDBLookupComboBox
          Left = 79
          Top = 17
          Width = 106
          Height = 28
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          KeyField = 'dm'
          ListField = 'dmmc'
          ListSource = dsLB
          ParentFont = False
          TabOrder = 0
          UIStyle = WinXP
          BorderColor = 6842472
          ArrowColor = clBlack
          ButtonColor = 14609391
        end
        object dladvChkCH0A27: TDLAdvCheckBox
          Left = 2
          Top = 50
          Width = 208
          Height = 31
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Alignment = taLeftJustify
          Caption = #20986#38498#26085#26399'                             '#21040
          ReturnIsTab = False
          Version = '1.3.4.1'
        end
        object advDtpks: TAdvDateTimePicker
          Left = 79
          Top = 50
          Width = 106
          Height = 25
          Date = 42507.468182870370000000
          Time = 42507.468182870370000000
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          Kind = dkDate
          ParentFont = False
          TabOrder = 3
          BorderStyle = bsSingle
          Ctl3D = True
          DateTime = 42507.468182870370000000
          Version = '1.2.0.1'
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
        end
        object advDtpjs: TAdvDateTimePicker
          Left = 222
          Top = 50
          Width = 121
          Height = 25
          Date = 42507.468182870370000000
          Time = 42507.468182870370000000
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          Kind = dkDate
          ParentFont = False
          TabOrder = 4
          BorderStyle = bsSingle
          Ctl3D = True
          DateTime = 42507.468182870370000000
          Version = '1.2.0.1'
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
        end
      end
      object dbgrdhBaList: TDBGridEh
        Left = 1
        Top = 89
        Width = 423
        Height = 518
        Align = alClient
        AutoFitColWidths = True
        DataGrouping.GroupLevels = <>
        DataSource = ds1
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
        ParentFont = False
        RowDetailPanel.Color = clBtnFace
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = #24494#36719#38597#40657
        TitleFont.Style = []
        OnCellClick = dbgrdhBaListCellClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'CH0A00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            Footers = <>
            Title.Caption = #20303#38498#21495
          end
          item
            EditButtons = <>
            FieldName = 'CH0A02'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            Footers = <>
            Title.Caption = #22995#21517
          end
          item
            EditButtons = <>
            FieldName = 'CH0A03'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            Footers = <>
            Title.Caption = #24615#21035
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object FlatPanel1: TFlatPanel
      Left = 428
      Top = 0
      Width = 810
      Height = 608
      ParentColor = True
      Align = alClient
      TabOrder = 1
      object FlatPanel2: TFlatPanel
        Left = 1
        Top = 560
        Width = 808
        Height = 47
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentColor = True
        Align = alBottom
        TabOrder = 1
        object AdvbtnacSave: TAdvGlowButton
          Left = 717
          Top = 1
          Width = 90
          Height = 45
          Hint = #20445#23384
          Align = alRight
          AutoSize = True
          Caption = #20445#23384
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          ImageIndex = 10
          Images = DM_Img.ilButton
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = AdvbtnacSaveClick
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
        object AdvbtnClose: TAdvGlowButton
          Left = 627
          Top = 1
          Width = 90
          Height = 45
          Align = alRight
          Action = acClose
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          ImageIndex = 1
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          ParentFont = False
          TabOrder = 0
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
      end
      object dbgrdhPJDetail: TDBGridEh
        Left = 1
        Top = 1
        Width = 808
        Height = 559
        Align = alClient
        AutoFitColWidths = True
        BorderStyle = bsNone
        DataGrouping.GroupLevels = <>
        DataSource = dsPJDetail
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        FooterColor = clYellow
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clBlack
        FooterFont.Height = -14
        FooterFont.Name = #24494#36719#38597#40657
        FooterFont.Style = []
        FooterRowCount = 1
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
        ParentFont = False
        RowDetailPanel.Color = clBtnFace
        RowHeight = 2
        RowLines = 3
        SumList.Active = True
        SumList.VirtualRecords = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = #24494#36719#38597#40657
        TitleFont.Style = []
        UseMultiTitle = True
        Columns = <
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'FcodeName'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            Footers = <>
            HideDuplicates = True
            ReadOnly = True
            TextEditing = False
            Title.Caption = #39033#30446
            Width = 139
            WordWrap = True
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'ScodeName'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            Footers = <>
            HideDuplicates = True
            ReadOnly = True
            TextEditing = False
            Title.Caption = #36136#37327#26631#20934'|'#23376#39033#30446
            Width = 260
            WordWrap = True
          end
          item
            DropDownBox.AutoFitColWidths = False
            EditButtons = <>
            FieldName = 'TcodeName'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            Footer.WordWrap = True
            Footers = <
              item
                Alignment = taRightJustify
                Value = #24635#25187#20998
                ValueType = fvtStaticText
              end>
            ReadOnly = True
            TextEditing = False
            Title.Caption = #36136#37327#26631#20934'|'#32454#39033#30446
            Width = 218
            WordWrap = True
          end
          item
            Alignment = taCenter
            DisplayFormat = '0.00'
            EditButtons = <>
            FieldName = 'Score'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            Footers = <
              item
                DisplayFormat = '0.00'
                ValueType = fvtSum
              end
              item
                DisplayFormat = '0.00'
                Value = 'Score'
                ValueType = fvtFieldValue
              end>
            Title.Caption = #25187#20998
          end
          item
            EditButtons = <>
            FieldName = 'Remark'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            Footers = <>
            Title.Caption = #20854#20182#38382#39064
            Width = 195
            WordWrap = True
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  inherited AdvOfficeStatusBarOfficeStyler1: TAdvOfficeStatusBarOfficeStyler
    Left = 320
    Top = 528
  end
  inherited AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler
    Left = 352
    Top = 528
  end
  inherited advfrmstylr1: TAdvFormStyler
    Left = 448
    Top = 528
  end
  inherited AdvPanelStyler1: TAdvPanelStyler
    Left = 416
    Top = 528
  end
  inherited dosm1: TDosMove
    Left = 384
    Top = 528
  end
  inherited DLCDS: TDlClientDataset
    Left = 328
    Top = 573
  end
  inherited al1: TActionList
    Left = 392
    Top = 573
  end
  inherited ds1: TDataSource
    Left = 360
    Top = 573
  end
  object clientdtPJDetail: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 440
    Top = 576
  end
  object dsPJDetail: TDataSource
    DataSet = clientdtPJDetail
    Left = 480
    Top = 576
  end
  object clientdtLB: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 320
    Top = 344
  end
  object dsLB: TDataSource
    DataSet = clientdtLB
    Left = 288
    Top = 336
  end
end
