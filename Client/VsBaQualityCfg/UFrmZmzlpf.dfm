inherited FrmZmzlpf: TFrmZmzlpf
  Caption = #30149#21382#32456#26411#36136#37327#31561#32423#35774#32622
  ClientHeight = 426
  ClientWidth = 786
  ExplicitWidth = 802
  ExplicitHeight = 464
  PixelsPerInch = 96
  TextHeight = 13
  inherited advfcstsbr: TAdvOfficeStatusBar
    Top = 407
    Width = 786
    ExplicitTop = 407
    ExplicitWidth = 786
  end
  inherited advtlbrpgr1: TAdvToolBarPager
    Width = 786
    Caption.Caption = #30149#21382#32456#26411#36136#37327#31561#32423#35774#32622
    ExplicitWidth = 786
    inherited AdvPage1: TAdvPage
      Width = 778
      ExplicitWidth = 778
    end
  end
  inherited AdvPanel1: TAdvPanel
    Top = 129
    Width = 786
    Height = 278
    TabOrder = 5
    ExplicitTop = 129
    ExplicitWidth = 786
    ExplicitHeight = 278
    FullHeight = 200
    object advspltr1: TAdvSplitter [0]
      Left = 174
      Top = 0
      Height = 278
      Appearance.BorderColor = clNone
      Appearance.BorderColorHot = clNone
      Appearance.Color = clWhite
      Appearance.ColorTo = clSilver
      Appearance.ColorHot = clWhite
      Appearance.ColorHotTo = clGray
      GripStyle = sgDots
      ExplicitLeft = 220
      ExplicitTop = 59
      ExplicitHeight = 100
    end
    inherited dbgrdh_DLCDS: TDBGridEh
      Left = 177
      Width = 609
      Height = 278
      TabOrder = 1
      Columns = <
        item
          Alignment = taCenter
          Checkboxes = True
          EditButtons = <>
          FieldName = 'isTy'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #20572#29992#26631#24535
          Width = 56
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'itemCode'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #20195#30721
          Width = 44
        end
        item
          EditButtons = <>
          FieldName = 'codeName'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #21517#31216
          Width = 234
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'xmlx'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #39033#30446#31867#22411
          Width = 140
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'zklb'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #31867#21035
          Visible = False
          Width = 77
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'xmfz'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #20998#20540
          Width = 48
        end
        item
          Alignment = taCenter
          Checkboxes = True
          EditButtons = <>
          FieldName = 'isBj'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #19993#32423#26631#24535
        end>
    end
    object tvZmzlpf: TTreeView
      Left = 0
      Top = 0
      Width = 174
      Height = 278
      Align = alLeft
      HideSelection = False
      Indent = 30
      ReadOnly = True
      TabOrder = 0
      OnChange = tvZmzlpfChange
    end
  end
  object AdvPanel2: TAdvPanel [3]
    Left = 0
    Top = 92
    Width = 786
    Height = 37
    Align = alTop
    BevelOuter = bvNone
    Color = 16640730
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    UseDockManager = True
    Version = '2.1.1.0'
    BorderColor = clGray
    Caption.Color = 14059353
    Caption.ColorTo = 9648131
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWhite
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    CollapsColor = clNone
    CollapsDelay = 0
    ColorTo = 14986888
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clNone
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWhite
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 14716773
    StatusBar.ColorTo = 16374724
    StatusBar.GradientDirection = gdVertical
    Styler = AdvPanelStyler1
    FullHeight = 200
    object lbllb1: TEllipsLabel
      Left = 3
      Top = 11
      Width = 48
      Height = 13
      Caption = #36136#25511#31867#21035
      Transparent = True
      EllipsType = etNone
      Version = '1.0.0.0'
    end
    object suicbcbblb: TsuiDBLookupComboBox
      Left = 57
      Top = 10
      Width = 145
      Height = 21
      KeyField = 'dm'
      ListField = 'dmmc'
      ListSource = dslb
      TabOrder = 0
      OnCloseUp = suicbcbblbCloseUp
      UIStyle = WinXP
      BorderColor = 6842472
      ArrowColor = clBlack
      ButtonColor = 14609391
    end
  end
  inherited DLCDS: TDlClientDataset
    BeforeInsert = DLCDSBeforeInsert
    AfterInsert = DLCDSAfterInsert
    Left = 296
    Top = 93
  end
  inherited al1: TActionList
    Left = 360
    Top = 93
  end
  inherited ds1: TDataSource
    Left = 328
    Top = 93
  end
  inherited prntdbgrdh: TPrintDBGridEh
    Left = 392
    Top = 92
  end
  object clientdtlb: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 96
    Top = 200
  end
  object dslb: TDataSource
    DataSet = clientdtlb
    Left = 64
    Top = 224
  end
end
