inherited frmTableRel: TfrmTableRel
  BorderStyle = bsSingle
  Caption = #28304#34920#20851#32852#35774#32622
  ClientHeight = 417
  ClientWidth = 779
  Position = poScreenCenter
  OnCreate = FormCreate
  ExplicitWidth = 785
  ExplicitHeight = 446
  PixelsPerInch = 96
  TextHeight = 13
  inherited advfcstsbr: TAdvOfficeStatusBar
    Top = 398
    Width = 779
    ExplicitTop = 398
    ExplicitWidth = 779
  end
  inherited advtlbrpgr1: TAdvToolBarPager
    Width = 779
    CaptionButtons = [cbClose, cbMinimize]
    TabOrder = 1
    ExplicitWidth = 779
    inherited AdvPage1: TAdvPage
      Width = 771
      ExplicitWidth = 771
      inherited advtlbr1: TAdvToolBar
        inherited btnacFirst: TAdvGlowButton
          Visible = False
        end
        inherited btnacPrior: TAdvGlowButton
          Visible = False
        end
        inherited btnacNext: TAdvGlowButton
          Visible = False
        end
        inherited btnacLast: TAdvGlowButton
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
    Left = 205
    Width = 369
    Height = 306
    ExplicitLeft = 205
    ExplicitWidth = 369
    ExplicitHeight = 306
    FullHeight = 200
    inherited dbgrdh_DLCDS: TDBGridEh
      Top = 33
      Width = 369
      Height = 273
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghAutoFitRowHeight]
      Columns = <
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'LKind'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #31867#21035
          Width = 70
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'LField'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #24038#20540
          Width = 85
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          Footers = <>
          TextEditing = False
          Width = 31
          OnGetCellParams = dbgrdh_DLCDSColumns2GetCellParams
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'RField'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #21491#20540
          Width = 75
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'RKind'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #31867#21035
          Width = 70
        end>
    end
    object advpnl2: TAdvPanel
      Left = 0
      Top = 0
      Width = 369
      Height = 33
      Align = alTop
      Color = 16640730
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
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
      object cbbTableRel: TAdvOfficeComboBox
        Left = 32
        Top = 6
        Width = 121
        Height = 19
        Button.Color = 16572875
        Button.ColorTo = 14722429
        Button.ColorHot = 14483455
        Button.ColorHotTo = 6013175
        Button.ColorDown = 557032
        Button.ColorDownTo = 8182519
        Button.Width = 12
        DisplayRecentSelection = False
        BorderColor = clNone
        BorderHotColor = clBlack
        SelectionColor = 14722429
        SelectionTextColor = clWhite
        SelectionGradient = sgVertical
        Version = '1.5.2.1'
        ItemIndex = -1
        ItemHeight = 14
        TabOrder = 0
        Style = csDropDownList
      end
    end
  end
  object advpnl1: TAdvPanel [3]
    Left = 0
    Top = 92
    Width = 205
    Height = 306
    Align = alLeft
    Color = 16640730
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
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
    object dbgrdh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 203
      Height = 304
      Align = alClient
      DataGrouping.GroupLevels = <>
      DataSource = dsLeft
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghColumnResize, dghColumnMove]
      RowDetailPanel.Color = clBtnFace
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbgrdh1CellClick
      OnDblClick = dbgrdh1DblClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'TableName'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #34920#21517#31216
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'TableDesc'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #34920#35828#26126
          Width = 100
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object AdvPanel2: TAdvPanel [4]
    Left = 574
    Top = 92
    Width = 205
    Height = 306
    Align = alRight
    Color = 16640730
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
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
    object lbl1: TLabel
      Left = 6
      Top = 14
      Width = 48
      Height = 13
      Caption = #23383#27573#21517#31216
    end
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 33
      Width = 203
      Height = 272
      Align = alBottom
      DataGrouping.GroupLevels = <>
      DataSource = dsright
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghColumnResize, dghColumnMove]
      RowDetailPanel.Color = clBtnFace
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGridEh1DblClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'FieldName'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #23383#27573#21517#31216
          Width = 80
        end
        item
          EditButtons = <>
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #23383#27573#35828#26126
          Visible = False
          Width = 100
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object edtRField: TsuiEdit
      Left = 61
      Top = 8
      Width = 121
      Height = 19
      UIStyle = DeepBlue
      BorderColor = clBlack
      TabOrder = 1
      OnKeyUp = edtRFieldKeyUp
    end
  end
  object clientdtLeft: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 256
  end
  object dsLeft: TDataSource
    DataSet = clientdtLeft
    Left = 64
    Top = 256
  end
  object clientdtright: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 592
    Top = 168
  end
  object dsright: TDataSource
    DataSet = clientdtright
    Left = 656
    Top = 192
  end
end
