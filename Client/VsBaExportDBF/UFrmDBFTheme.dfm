inherited frmDBFTheme: TfrmDBFTheme
  Caption = 'DBF'#19978#25253#26041#26696#37197#32622
  ClientHeight = 441
  ClientWidth = 684
  ExplicitWidth = 700
  ExplicitHeight = 480
  PixelsPerInch = 96
  TextHeight = 13
  inherited advfcstsbr: TAdvOfficeStatusBar
    Top = 422
    Width = 684
    ExplicitTop = 422
    ExplicitWidth = 684
  end
  inherited advtlbrpgr1: TAdvToolBarPager
    Width = 684
    TabOrder = 1
    ExplicitWidth = 684
    inherited AdvPage1: TAdvPage
      Width = 676
      ExplicitWidth = 676
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
    Width = 684
    Height = 330
    ExplicitWidth = 684
    ExplicitHeight = 330
    FullHeight = 200
    inherited dbgrdh_DLCDS: TDBGridEh
      Top = 41
      Width = 684
      Height = 289
      OnDblClick = dbgrdh_DLCDSDblClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ThemeMC'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #26041#26696#21517#31216
        end>
    end
    object advpnlTop: TAdvPanel
      Left = 0
      Top = 0
      Width = 684
      Height = 41
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
      object lbl1: TLabel
        Left = 5
        Top = 16
        Width = 48
        Height = 13
        Caption = #20986#38498#26085#26399
        Color = 14986888
        ParentColor = False
        Transparent = True
      end
      object lbl2: TLabel
        Left = 144
        Top = 16
        Width = 12
        Height = 13
        Caption = #33267
        Color = 14986888
        ParentColor = False
      end
      object lbl3: TLabel
        Left = 261
        Top = 16
        Width = 48
        Height = 13
        Caption = #23548#20986#36335#24452
        Color = 14986888
        ParentColor = False
      end
      object edtbtnPath: TAdvEditBtn
        Left = 315
        Top = 12
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
        TabOrder = 0
        Visible = True
        Version = '1.3.3.4'
        ButtonStyle = bsButton
        ButtonWidth = 16
        Etched = False
        ButtonCaption = '...'
        OnClickBtn = edtbtnPathClickBtn
      end
      object advdbdtmpckrStart: TAdvDBDateTimePicker
        Left = 59
        Top = 12
        Width = 80
        Height = 21
        Date = 42593.426053240740000000
        Time = 42593.426053240740000000
        Kind = dkDate
        TabOrder = 1
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 42593.426053240740000000
        Version = '1.2.0.1'
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
        DataField = 'StartDate'
        DataSource = ds1
      end
      object advdbdtmpckrEnd: TAdvDBDateTimePicker
        Left = 165
        Top = 12
        Width = 80
        Height = 21
        Date = 42593.426053240740000000
        Time = 42593.426053240740000000
        Kind = dkDate
        TabOrder = 2
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 42593.426053240740000000
        Version = '1.2.0.1'
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
        DataField = 'EndDate'
        DataSource = ds1
      end
      object btnExport: TAdvGlowButton
        Left = 538
        Top = 4
        Width = 81
        Height = 33
        Caption = #23548#20986'&P'
        ImageIndex = 14
        Images = DM_Img.ilButton
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        TabOrder = 3
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
  inherited DLCDS: TDlClientDataset
    AfterScroll = DLCDSAfterScroll
    Left = 48
    Top = 269
  end
  inherited al1: TActionList
    Left = 112
    Top = 269
  end
  inherited ds1: TDataSource
    Left = 80
    Top = 269
  end
  inherited prntdbgrdh: TPrintDBGridEh
    Left = 152
    Top = 272
  end
  inherited dlgSave: TSaveDialog
    Left = 56
    Top = 200
  end
  object qxprt3dbf1: TQExport3DBF
    DataSet = clientdtDBF
    About = '(About EMS AdvancedExport)'
    _Version = '3.45'
    NullValue = 'null'
    Left = 288
    Top = 224
  end
  object clientdtDBF: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 224
  end
  object SaveTFiledlgDBFFile: TSaveTextFileDialog
    Left = 184
    Top = 176
  end
end
