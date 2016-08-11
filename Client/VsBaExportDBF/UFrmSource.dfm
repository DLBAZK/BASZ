inherited frmSource: TfrmSource
  BorderStyle = bsSingle
  Caption = #19978#25253#28304#34920#23383#27573
  ClientHeight = 691
  ClientWidth = 533
  Position = poScreenCenter
  OnCreate = FormCreate
  ExplicitWidth = 539
  ExplicitHeight = 720
  PixelsPerInch = 96
  TextHeight = 13
  inherited advfcstsbr: TAdvOfficeStatusBar
    Top = 672
    Width = 533
    ExplicitTop = 662
    ExplicitWidth = 523
  end
  inherited advtlbrpgr1: TAdvToolBarPager
    Width = 533
    TabOrder = 1
    ExplicitWidth = 523
    inherited AdvPage1: TAdvPage
      Width = 525
      Height = 0
      ExplicitWidth = 525
      ExplicitHeight = 0
    end
  end
  inherited AdvPanel1: TAdvPanel
    Width = 533
    Height = 647
    ExplicitWidth = 523
    ExplicitHeight = 637
    FullHeight = 200
    object fltpnl1: TFlatPanel
      Left = 0
      Top = 0
      Width = 533
      Height = 57
      Transparent = True
      ParentColor = True
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 523
      object lbl1: TLabel
        Left = 16
        Top = 17
        Width = 24
        Height = 13
        Caption = #34920#21517
      end
      object lbl2: TLabel
        Left = 144
        Top = 17
        Width = 24
        Height = 13
        Caption = #23383#27573
      end
      object edtField: TsuiEdit
        Left = 198
        Top = 14
        Width = 80
        Height = 19
        UIStyle = DeepBlue
        BorderColor = clBlack
        TabOrder = 0
        OnKeyUp = edtFieldKeyUp
      end
      object btn1: TAdvGlowButton
        Left = 284
        Top = 6
        Width = 100
        Height = 41
        Caption = #30830#23450
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        TabOrder = 1
        OnClick = btn1Click
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
      object btn2: TAdvGlowButton
        Left = 412
        Top = 6
        Width = 100
        Height = 41
        Caption = #21462#28040
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        TabOrder = 2
        OnClick = btn2Click
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
      Top = 57
      Width = 533
      Height = 590
      Align = alClient
      AutoFitColWidths = True
      DataGrouping.GroupLevels = <>
      DataSource = ds1
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove]
      RowDetailPanel.Color = clBtnFace
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbgrdh1DblClick
      Columns = <
        item
          EditButtons = <>
          EditMask = 'TableName'
          FieldName = 'TableName'
          Footers = <>
          TextEditing = False
          Title.Alignment = taCenter
          Title.Caption = #28304#34920#21517#31216
          Width = 90
        end
        item
          EditButtons = <>
          FieldName = 'TableCus'
          Footers = <>
          TextEditing = False
          Title.Alignment = taCenter
          Title.Caption = #28304#34920#21035#21517
        end
        item
          EditButtons = <>
          EditMask = 'FieldName'
          FieldName = 'FieldName'
          Footers = <>
          TextEditing = False
          Title.Alignment = taCenter
          Title.Caption = #28304#23383#27573
          Width = 243
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object edtTableName: TsuiEdit [3]
    Left = 46
    Top = 39
    Width = 80
    Height = 19
    UIStyle = DeepBlue
    BorderColor = clBlack
    TabOrder = 6
    OnKeyUp = edtTableNameKeyUp
  end
  inherited ds1: TDataSource
    DataSet = clientdtField
  end
  object clientdtField: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 176
  end
end
