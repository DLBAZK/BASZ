inherited FrmYinHaiMain: TFrmYinHaiMain
  Caption = #24179#21488#25968#25454#19978#25253
  ClientHeight = 623
  ClientWidth = 1085
  ExplicitWidth = 1101
  ExplicitHeight = 662
  PixelsPerInch = 96
  TextHeight = 13
  inherited advfcstsbr: TAdvOfficeStatusBar
    Top = 604
    Width = 1085
    ExplicitTop = 577
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
    Height = 579
    ExplicitWidth = 1085
    ExplicitHeight = 552
    FullHeight = 200
    object fltpnl1: TFlatPanel
      Left = 0
      Top = 0
      Width = 1085
      Height = 81
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
        Left = 184
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
        Left = 12
        Top = 56
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
        Left = 180
        Top = 56
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
      object lblLB: TLabel
        Left = 332
        Top = 16
        Width = 52
        Height = 19
        Caption = #19978#25253#31867#21035
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
        Left = 502
        Top = 34
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
        Left = 74
        Top = 54
        Width = 100
        Height = 21
        TabOrder = 3
      end
      object edtPwd: TEdit
        Left = 213
        Top = 54
        Width = 100
        Height = 21
        TabOrder = 4
      end
      object btnUpload: TAdvGlowButton
        Left = 622
        Top = 34
        Width = 100
        Height = 41
        Caption = #32416#38169#34917#25253
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
        TabOrder = 5
        OnClick = btnUploadClick
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
      object btnClose: TAdvGlowButton
        Left = 750
        Top = 34
        Width = 100
        Height = 41
        Action = acClose
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ImageIndex = 1
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        TabOrder = 6
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
      object cbbBALB: TComboBoxEx
        Left = 394
        Top = 13
        Width = 100
        Height = 22
        ItemsEx = <
          item
            Caption = #20840#37096#19978#25253
          end
          item
            Caption = #22522#26412#20449#24687
          end
          item
            Caption = #35786#26029#20449#24687
          end
          item
            Caption = #25163#26415#20449#24687
          end>
        Style = csExDropDownList
        ItemHeight = 16
        TabOrder = 7
      end
    end
    object dbgrdhState: TDBGridEh
      Left = 0
      Top = 81
      Width = 1085
      Height = 399
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
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDblClickOptimizeColWidth, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove]
      ParentFont = False
      RowDetailPanel.Color = clBtnFace
      SortLocal = True
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #24494#36719#38597#40657
      TitleFont.Style = []
      OnSortMarkingChanged = dbgrdhStateSortMarkingChanged
      Columns = <
        item
          EditButtons = <>
          FieldName = 'CH0A01'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #19978#25253#30149#26696#21495
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
          ButtonStyle = cbsNone
          EditButtons = <>
          FieldName = 'OperationLB'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #31867#21035
          Title.SortIndex = 1
          Title.SortMarker = smUpEh
          Title.TitleButton = True
          Width = 153
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object fltpnl2: TFlatPanel
      Left = 0
      Top = 480
      Width = 1085
      Height = 99
      ParentColor = True
      Align = alBottom
      TabOrder = 2
      object lbl1: TLabel
        Left = 537
        Top = 1
        Width = 547
        Height = 97
        Align = alClient
        Caption = 
          #32416#38169#34917#25253':'#13#10'              1'#12289#36873#25321#19978#25253#22833#36133#30149#26696#30340#20986#38498#26085#26399#13#10'              2'#12289#36873#25321#19978#25253#22833#36133#30149#26696#30340#19978 +
          #25253#31867#21035#13#10'              3'#12289#36755#20837#19978#25253#24179#21488#20998#37197#30340#29992#25143#21517#21644#23494#30721#13#10'              4'#12289#28857#20987#12304#32416#38169#34917#25253#12305#25353#38062 +
          #65292#31561#24453#19978#25253#23436#25104
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
        WordWrap = True
        ExplicitLeft = 512
        ExplicitWidth = 572
      end
      object lbl2: TLabel
        Left = 1
        Top = 1
        Width = 536
        Height = 97
        Align = alLeft
        Caption = 
          #19978#25253#27493#39588#65306#13#10'               1'#12289#36873#25321#20986#38498#26085#26399#13#10'               2'#12289#36873#25321#19978#25253#31867#21035#65288#21253#21547#22522#26412#20449#24687#12289#35786 +
          #26029#20449#24687#12289#25163#26415#20449#24687#65292#40664#35748#19978#25253#20840#37096#20449#24687#65289#13#10'               3'#12289#36755#20837#19978#25253#24179#21488#20998#37197#30340#29992#25143#21517#21644#23494#30721#13#10'          ' +
          '     4'#12289#28857#20987#12304#19978#25253#12305#25353#38062#65292#31561#24453#19978#25253#23436#25104
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
    end
  end
  object htprWeb: THTTPRIO
    HTTPWebNode.UseUTF8InHeader = True
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 536
    Top = 200
  end
end
