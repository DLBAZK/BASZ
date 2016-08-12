inherited FrmExportDBF: TFrmExportDBF
  BorderStyle = bsSingle
  Caption = #21355#32479#19978#25253#37197#32622
  ClientHeight = 623
  ClientWidth = 1231
  Position = poScreenCenter
  ExplicitWidth = 1237
  ExplicitHeight = 652
  PixelsPerInch = 96
  TextHeight = 13
  object advspltr1: TAdvSplitter [0]
    Left = 1
    Top = 92
    Height = 512
    ResizeStyle = rsLine
    Visible = False
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
    Top = 604
    Width = 1231
    ExplicitTop = 604
    ExplicitWidth = 1231
  end
  inherited advtlbrpgr1: TAdvToolBarPager
    Width = 1231
    TabOrder = 1
    ExplicitWidth = 1231
    inherited AdvPage1: TAdvPage
      Width = 1223
      ExplicitWidth = 1223
      inherited advtlbr1: TAdvToolBar
        inherited btnacIns: TAdvGlowButton
          Visible = False
        end
        inherited btnacIns1: TAdvGlowButton
          Visible = False
        end
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
    Width = 1
    Height = 512
    Align = alLeft
    Visible = False
    ExplicitWidth = 1
    ExplicitHeight = 512
    FullHeight = 200
    inherited dbgrdh_DLCDS: TDBGridEh
      Width = 1
      Height = 512
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
    Left = 4
    Top = 92
    Width = 1227
    Height = 512
    Transparent = True
    ParentColor = True
    Align = alClient
    TabOrder = 6
    object dbgrdhDBF: TDBGridEh
      Left = 1
      Top = 41
      Width = 1225
      Height = 470
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
          FieldName = 'DBFFieldName'
          Footers = <>
          TextEditing = False
          Title.Alignment = taCenter
          Title.Caption = #19978#25253#23383#27573
          Width = 84
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'FieldDes'
          Footers = <>
          TextEditing = False
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
          Visible = False
          Width = 30
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'FieldName'
          Footers = <>
          TextEditing = False
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
      Width = 1225
      Height = 40
      Transparent = True
      ParentColor = True
      Align = alTop
      TabOrder = 1
      object lbl1: TLabel
        Left = 941
        Top = 9
        Width = 48
        Height = 13
        Caption = #20986#38498#26085#26399
        Visible = False
      end
      object lbl2: TLabel
        Left = 1080
        Top = 9
        Width = 12
        Height = 13
        Caption = #33267
        Visible = False
      end
      object lbl3: TLabel
        Left = 941
        Top = 32
        Width = 48
        Height = 13
        Caption = #23548#20986#36335#24452
        Visible = False
      end
      object lbl4: TLabel
        Left = 29
        Top = 17
        Width = 43
        Height = 13
        Caption = 'DBF'#27169#26495
      end
      object advdtmpckrStart: TAdvDateTimePicker
        Left = 994
        Top = 5
        Width = 81
        Height = 21
        Date = 42310.721793981480000000
        Time = 42310.721793981480000000
        Kind = dkDate
        TabOrder = 0
        Visible = False
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
        Left = 1107
        Top = 5
        Width = 81
        Height = 21
        Date = 42346.721793981480000000
        Time = 42346.721793981480000000
        Kind = dkDate
        TabOrder = 1
        Visible = False
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
        Left = 276
        Top = 5
        Width = 81
        Height = 30
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
        Left = 995
        Top = 27
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
        Visible = False
        Version = '1.3.3.4'
        ButtonStyle = bsButton
        ButtonWidth = 16
        Etched = False
        ButtonCaption = '...'
        OnClickBtn = edtbtnPathClickBtn
      end
      object btnSQL: TAdvGlowButton
        Left = 384
        Top = 5
        Width = 81
        Height = 30
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
      object suiLkcbbDBFType: TsuiDBLookupComboBox
        Left = 83
        Top = 11
        Width = 158
        Height = 21
        BevelInner = bvNone
        KeyField = 'TID'
        ListField = 'DBFTypeMC'
        ListSource = dsDBFType
        TabOrder = 5
        OnCloseUp = suiLkcbbDBFTypeCloseUp
        UIStyle = WinXP
        BorderColor = 6842472
        ArrowColor = clBlack
        ButtonColor = 14609391
      end
    end
  end
  inherited DLCDS: TDlClientDataset
    Left = 32
    Top = 245
  end
  inherited al1: TActionList
    Left = 96
    Top = 245
  end
  inherited ds1: TDataSource
    Left = 64
    Top = 245
  end
  inherited prntdbgrdh: TPrintDBGridEh
    Left = 136
    Top = 248
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
  object clientdtDBFType: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 304
    Top = 176
  end
  object dsDBFType: TDataSource
    DataSet = clientdtDBFType
    Left = 256
    Top = 192
  end
end
