inherited FrmExportDBF: TFrmExportDBF
  Caption = #21355#32479#19978#25253#37197#32622
  ClientHeight = 613
  ClientWidth = 1221
  ExplicitWidth = 1237
  ExplicitHeight = 652
  PixelsPerInch = 96
  TextHeight = 13
  object advspltr1: TAdvSplitter [0]
    Left = 545
    Top = 92
    Height = 502
    ResizeStyle = rsLine
    Appearance.BorderColor = clNone
    Appearance.BorderColorHot = clNone
    Appearance.Color = clWhite
    Appearance.ColorTo = clSilver
    Appearance.ColorHot = clWhite
    Appearance.ColorHotTo = clGray
    GripStyle = sgDots
    ExplicitLeft = 344
    ExplicitTop = 304
    ExplicitHeight = 100
  end
  inherited advfcstsbr: TAdvOfficeStatusBar
    Top = 594
    Width = 1221
    ExplicitTop = 594
    ExplicitWidth = 1221
  end
  inherited advtlbrpgr1: TAdvToolBarPager
    Width = 1221
    TabOrder = 1
    ExplicitWidth = 1221
    inherited AdvPage1: TAdvPage
      Width = 1213
      ExplicitWidth = 1213
      inherited advtlbr1: TAdvToolBar
        inherited btnActLocate: TAdvGlowButton
          Visible = False
        end
        inherited btnActLocate1: TAdvGlowButton
          Visible = False
        end
      end
    end
  end
  inherited AdvPanel1: TAdvPanel
    Width = 545
    Height = 502
    Align = alLeft
    ExplicitWidth = 545
    ExplicitHeight = 502
    FullHeight = 200
    inherited dbgrdh_DLCDS: TDBGridEh
      Width = 545
      Height = 502
      AutoFitColWidths = True
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghEnterAsTab, dghRowHighlight, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghAutoFitRowHeight]
      UseMultiTitle = True
      Columns = <
        item
          EditButtons = <>
          FieldName = 'TableName'
          Footers = <>
          Title.Caption = #34920#21517
          Width = 70
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'TableCus'
          Footers = <>
          Title.Caption = #21035#21517
          Width = 30
          OnUpdateData = dbgrdh_DLCDSColumns1UpdateData
        end
        item
          EditButtons = <>
          FieldName = 'TableDesc'
          Footers = <>
          Title.Caption = #34920#35828#26126
          Visible = False
          Width = 68
        end
        item
          EditButtons = <>
          FieldName = 'TableRel'
          Footers = <>
          Title.Caption = #20851#32852#34920#36798#24335
          Width = 314
        end
        item
          Alignment = taCenter
          AutoFitColWidth = False
          BiDiMode = bdLeftToRight
          EditButtons = <>
          FieldName = 'LinkTableCus'
          Footers = <>
          Title.Caption = #20851#32852#34920
          Width = 30
        end>
    end
  end
  object fltpnl1: TFlatPanel [4]
    Left = 548
    Top = 92
    Width = 673
    Height = 502
    Transparent = True
    ParentColor = True
    Align = alClient
    TabOrder = 6
    object dbgrdhDBF: TDBGridEh
      Left = 1
      Top = 67
      Width = 671
      Height = 434
      Align = alClient
      AutoFitColWidths = True
      DataGrouping.GroupLevels = <>
      DataSource = dsDBF
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghEnterAsTab, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghAutoFitRowHeight]
      RowDetailPanel.Color = clBtnFace
      RowHeight = 2
      RowLines = 1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      OnDblClick = dbgrdhDBFDblClick
      Columns = <
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'DBFName'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #19978#25253#23383#27573
          Width = 84
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'DBFMC'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #23383#27573#35828#26126
          Width = 121
          WordWrap = True
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'DBFBZ'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #21551#29992
          Width = 30
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'FieldName'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #28304#23383#27573
          Width = 108
        end
        item
          EditButtons = <>
          FieldName = 'FieldSQL'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #33258#23450#20041#23383#27573'SQL'
          Width = 320
          WordWrap = True
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object fltpnl2: TFlatPanel
      Left = 1
      Top = 1
      Width = 671
      Height = 66
      Transparent = True
      ParentColor = True
      Align = alTop
      TabOrder = 1
      object lbl1: TLabel
        Left = 5
        Top = 16
        Width = 48
        Height = 13
        Caption = #20986#38498#26085#26399
      end
      object lbl2: TLabel
        Left = 144
        Top = 16
        Width = 12
        Height = 13
        Caption = #33267
      end
      object lbl3: TLabel
        Left = 5
        Top = 39
        Width = 48
        Height = 13
        Caption = #23548#20986#36335#24452
      end
      object advdtmpckrStart: TAdvDateTimePicker
        Left = 58
        Top = 12
        Width = 81
        Height = 21
        Date = 42310.721793981480000000
        Time = 42310.721793981480000000
        Kind = dkDate
        TabOrder = 0
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 42310.721793981480000000
        Version = '1.2.0.1'
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
      end
      object advdtmpckrEnd: TAdvDateTimePicker
        Left = 171
        Top = 12
        Width = 81
        Height = 21
        Date = 42346.721793981480000000
        Time = 42346.721793981480000000
        Kind = dkDate
        TabOrder = 1
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 42346.721793981480000000
        Version = '1.2.0.1'
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
      end
      object btnExport: TAdvGlowButton
        Left = 272
        Top = 16
        Width = 81
        Height = 44
        Caption = #23548#20986'&P'
        ImageIndex = 14
        Images = DM_Img.ilButton
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        TabOrder = 2
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
      object edtbtnPath: TAdvEditBtn
        Left = 59
        Top = 34
        Width = 190
        Height = 21
        EmptyText = #23548#20986'DBF'#25991#20214#21517
        EmptyTextStyle = []
        Flat = False
        FocusColor = clBtnFace
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
        Lookup.Separator = ';'
        BevelInner = bvNone
        Color = clWindow
        ReadOnly = False
        TabOrder = 3
        Visible = True
        Version = '1.3.3.4'
        ButtonStyle = bsButton
        ButtonWidth = 16
        Etched = False
        ButtonCaption = '...'
        OnClickBtn = edtbtnPathClickBtn
      end
      object btnSQL: TAdvGlowButton
        Left = 384
        Top = 16
        Width = 81
        Height = 44
        Caption = #39044#35272'&P'
        ImageIndex = 3
        Images = DM_Img.ilButton
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        TabOrder = 4
        OnClick = btnSQLClick
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
  end
  object dsDBF: TDataSource
    DataSet = mtblhDBF
    Left = 800
    Top = 400
  end
  object clientdtDBF: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 568
    Top = 520
  end
  object SaveTFiledlgDBFFile: TSaveTextFileDialog
    Left = 184
    Top = 176
  end
  object qxprt3dbfWT: TQExport3DBF
    About = '(About EMS AdvancedExport)'
    _Version = '3.45'
    NullValue = 'null'
    Left = 712
    Top = 256
  end
  object dlclntdtstDBF: TDlClientDataset
    Aggregates = <>
    Params = <>
    Left = 800
    Top = 360
  end
  object mtblhDBF: TMemTableEh
    CachedUpdates = True
    FetchAllOnOpen = True
    Params = <>
    DataDriver = dtstdrvrhddmtblh1
    Left = 800
    Top = 296
  end
  object dtstdrvrhddmtblh1: TDataSetDriverEh
    ProviderDataSet = dlclntdtstDBF
    OnUpdateRecord = dtstdrvrhddmtblh1UpdateRecord
    Left = 800
    Top = 328
  end
  object mtblhDBFTable: TMemTableEh
    Params = <>
    DataDriver = dtstdrvrhDBFTable
    Left = 272
    Top = 256
  end
  object dtstdrvrhDBFTable: TDataSetDriverEh
    ProviderDataSet = DLCDS
    Left = 224
    Top = 256
  end
  object tbl1: TTable
    CachedUpdates = True
    Left = 856
    Top = 320
  end
  object dtstdrvrhDBF: TDataSetDriverEh
    ProviderDataSet = tbl1
    Left = 776
    Top = 296
  end
end
