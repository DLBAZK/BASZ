inherited frmExportPre: TfrmExportPre
  Caption = #23548#20986#25968#25454#39044#35272
  ClientHeight = 748
  ClientWidth = 734
  Position = poScreenCenter
  ExplicitWidth = 750
  ExplicitHeight = 787
  PixelsPerInch = 96
  TextHeight = 13
  inherited advfcstsbr: TAdvOfficeStatusBar
    Top = 729
    Width = 734
    ExplicitTop = 729
    ExplicitWidth = 734
  end
  inherited advtlbrpgr1: TAdvToolBarPager
    Width = 734
    TabOrder = 1
    ExplicitWidth = 734
    inherited AdvPage1: TAdvPage
      Width = 726
      Height = 0
      ExplicitWidth = 726
      ExplicitHeight = 0
    end
  end
  inherited AdvPanel1: TAdvPanel
    Width = 734
    Height = 704
    ExplicitWidth = 734
    ExplicitHeight = 704
    FullHeight = 200
    object advspltr1: TAdvSplitter
      Left = 0
      Top = 441
      Width = 734
      Height = 3
      Cursor = crVSplit
      Align = alTop
      Appearance.BorderColor = clNone
      Appearance.BorderColorHot = clNone
      Appearance.Color = clWhite
      Appearance.ColorTo = clSilver
      Appearance.ColorHot = clWhite
      Appearance.ColorHotTo = clGray
      GripStyle = sgDots
      ExplicitLeft = 731
      ExplicitWidth = 263
    end
    object fltpnl1: TFlatPanel
      Left = 0
      Top = 0
      Width = 734
      Height = 57
      Transparent = True
      ParentColor = True
      Align = alTop
      TabOrder = 0
      object btnOK: TAdvGlowButton
        Left = 21
        Top = 6
        Width = 100
        Height = 41
        Caption = #26597#35810'&O'
        ImageIndex = 11
        Images = DM_Img.ilButton
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        TabOrder = 0
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
      object btnExport: TAdvGlowButton
        Left = 141
        Top = 6
        Width = 100
        Height = 41
        Caption = #23548#20986'&P'
        ImageIndex = 14
        Images = DM_Img.ilButton
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        TabOrder = 1
        OnClick = btnExportClick
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
    object dbgrdh1: TDBGridEh
      Left = 0
      Top = 444
      Width = 734
      Height = 260
      Align = alClient
      AutoFitColWidths = True
      DataGrouping.GroupLevels = <>
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghDblClickOptimizeColWidth, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghAutoFitRowHeight]
      RowDetailPanel.Color = clBtnFace
      RowHeight = 2
      RowLines = 1
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object fltpnl2: TFlatPanel
      Left = 0
      Top = 57
      Width = 734
      Height = 384
      Transparent = True
      ParentColor = True
      Align = alTop
      TabOrder = 2
      object synmDBFSql: TSynMemo
        Left = 1
        Top = 1
        Width = 732
        Height = 382
        Align = alClient
        CodeFolding.CaseSensitive = False
        CodeFolding.FolderBarLinesColor = 12434877
        ActiveLine.Background = clYellow
        ActiveLine.Foreground = clNavy
        ActiveLine.Visible = True
        LineDivider.Visible = False
        LineDivider.Color = clRed
        LineDivider.Style = psSolid
        RightEdge.MouseMove = False
        RightEdge.Visible = True
        RightEdge.Position = 80
        RightEdge.Color = clSilver
        RightEdge.Style = psSolid
        LineSpacing = 0
        LineSpacingRule = lsOneAndHalf
        Background.Visible = False
        Background.RepeatMode = brmNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 0
        Gutter.ShowLineModified = False
        Gutter.LineModifiedColor = clYellow
        Gutter.LineNormalColor = clLime
        Gutter.AutoSize = True
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
        Gutter.LeftOffsetColor = clNone
        Gutter.RightOffsetColor = clNone
        Gutter.ShowLineNumbers = True
        Highlighter = synsqlsyn2
        Options = [eoAutoIndent, eoAutoSizeMaxScrollWidth, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoScrollPastEol, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces, eoColumnEditExtension]
        WantTabs = True
        WordWrap.Enabled = True
        WordWrap.Position = 80
        WordWrap.Style = wwsClientWidth
      end
    end
  end
  inherited ds1: TDataSource
    DataSet = clientdtDBF
  end
  object qxprt3dbfWT42: TQExport3DBF
    DataSet = DLCDS
    About = '(About EMS AdvancedExport)'
    _Version = '3.45'
    NullValue = 'null'
    Left = 88
    Top = 168
  end
  object clientdtDBF: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 480
  end
  object synsqlsyn2: TSynSQLSyn
    Left = 216
    Top = 216
  end
end
