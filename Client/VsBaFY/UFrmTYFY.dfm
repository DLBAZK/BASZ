object FrmTYFY: TFrmTYFY
  Left = 0
  Top = 0
  Width = 755
  Height = 1883
  TabOrder = 0
  object lbl100: TLabel
    Left = 113
    Top = 53
    Width = 28
    Height = 13
    Caption = #25250#25937':'
  end
  object lbl103: TLabel
    Left = 121
    Top = 61
    Width = 28
    Height = 13
    Caption = #25250#25937':'
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 755
    Height = 1883
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    TabOrder = 0
    ExplicitHeight = 1891
    object AdvGroupBox1: TAdvGroupBox
      Left = 0
      Top = 0
      Width = 755
      Height = 121
      BorderStyle = bsNone
      Align = alTop
      TabOrder = 0
      object lbl1: TLabel
        Left = 215
        Top = 17
        Width = 219
        Height = 38
        Caption = #30149' '#26696' '#39318' '#39029' '#38468' '#39029
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -29
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 239
        Top = 61
        Width = 171
        Height = 25
        Caption = #65288#21307#30103#36136#37327#31649#29702#29992#65289
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
      end
      object lbl3: TLabel
        Left = 9
        Top = 96
        Width = 36
        Height = 13
        Caption = #22995#21517#65306
      end
      object bvl1: TBevel
        Left = 51
        Top = 110
        Width = 61
        Height = 3
        Shape = bsBottomLine
      end
      object lblName: TLabel
        Left = 58
        Top = 96
        Width = 3
        Height = 13
      end
      object bvl2: TBevel
        Left = 161
        Top = 110
        Width = 54
        Height = 3
        Shape = bsBottomLine
      end
      object lbl4: TLabel
        Left = 128
        Top = 96
        Width = 36
        Height = 13
        Caption = #24180#40836#65306
      end
      object lblNL: TLabel
        Left = 176
        Top = 96
        Width = 3
        Height = 13
      end
      object bvl3: TBevel
        Left = 280
        Top = 110
        Width = 56
        Height = 3
        Shape = bsBottomLine
      end
      object lbl6: TLabel
        Left = 238
        Top = 96
        Width = 36
        Height = 13
        Caption = #24615#21035#65306
      end
      object lblXB: TLabel
        Left = 301
        Top = 96
        Width = 3
        Height = 13
      end
      object bvl4: TBevel
        Left = 393
        Top = 110
        Width = 100
        Height = 3
        Shape = bsBottomLine
      end
      object lbl5: TLabel
        Left = 351
        Top = 96
        Width = 36
        Height = 13
        Caption = #31185#21035#65306
      end
      object lblKB: TLabel
        Left = 400
        Top = 96
        Width = 3
        Height = 13
      end
      object lbl7: TLabel
        Left = 495
        Top = 96
        Width = 48
        Height = 13
        Caption = #20303#38498#21495#65306
      end
      object lblZYH: TLabel
        Left = 544
        Top = 96
        Width = 3
        Height = 13
      end
      object bvl5: TBevel
        Left = 541
        Top = 110
        Width = 100
        Height = 3
        Shape = bsBottomLine
      end
    end
    object AdvGroupBox2: TAdvGroupBox
      Left = 0
      Top = 121
      Width = 755
      Height = 368
      BorderStyle = bsNone
      Align = alTop
      Caption = #19968#12289#25163#26415#20449#24687
      TabOrder = 1
      object dbgrdhSS: TDBGridEh
        Left = 2
        Top = 16
        Width = 751
        Height = 350
        Align = alClient
        DataGrouping.GroupLevels = <>
        DataSource = dsss
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        ParentFont = False
        RowDetailPanel.Color = clBtnFace
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        UseMultiTitle = True
        OnKeyDown = dbgrdhSSKeyDown
        Columns = <
          item
            EditButtons = <>
            FieldName = 'CH0E05'
            Footers = <>
            Title.Caption = #25163#26415#32534#30721
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 74
          end
          item
            EditButtons = <>
            FieldName = 'ssmc'
            Footers = <>
            Title.Caption = #25163#26415#21517#31216
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
          end
          item
            EditButtons = <>
            FieldName = 'CH0ESC00'
            Footers = <>
            Title.Caption = #26159#21542#25321#26399#25163#26415
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
          end
          item
            EditButtons = <>
            FieldName = 'CH0EE5'
            Footers = <>
            Title.Caption = #25163#26415#39118#38505'(NNIS)'#20998#32423
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
          end
          item
            EditButtons = <>
            FieldName = 'CH0EE6'
            Footers = <>
            Title.Caption = #26159#21542#26415#21069'0.5-2'#23567#26102#20869#39044#38450#29992#25239#33740#33647
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
          end
          item
            EditButtons = <>
            FieldName = 'CH0EE7'
            Footers = <>
            Title.Caption = #28165#27905#25163#26415#22260#26415#26399#39044#38450#29992#25239#33740#33647#22825#25968
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
          end
          item
            EditButtons = <>
            FieldName = 'CH0EZ13'
            Footers = <>
            Title.Caption = #26159#21542#20026#37325#36820#25163#26415#23460#20877#25163#26415
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
          end
          item
            EditButtons = <>
            FieldName = 'CH0EZ02'
            Footers = <>
            Title.Caption = #40635#37257#24182#21457#30151
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
          end
          item
            EditButtons = <>
            FieldName = 'CH0EZ03'
            Footers = <>
            Title.Caption = #26415#20013#24322#29289#36951#30041
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
          end
          item
            EditButtons = <>
            FieldName = 'CH0EZ04'
            Footers = <>
            Title.Caption = #25163#26415#24182#21457#30151
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
          end
          item
            EditButtons = <>
            FieldName = 'CH0EZ05'
            Footers = <>
            Title.Caption = #26415#21518#20986#34880#25110#34880#32959
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
          end
          item
            EditButtons = <>
            FieldName = 'CH0EZ06'
            Footers = <>
            Title.Caption = #25163#26415#20260#21475#35010#24320
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
          end
          item
            EditButtons = <>
            FieldName = 'CH0EZ07'
            Footers = <>
            Title.Caption = #26415#21518#28145#38745#33033#34880#26643
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
          end
          item
            EditButtons = <>
            FieldName = 'CH0EZ08'
            Footers = <>
            Title.Caption = #26415#21518#29983#29702'/'#20195#35874#32010#20081
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
          end
          item
            EditButtons = <>
            FieldName = 'CH0EZ09'
            Footers = <>
            Title.Caption = #26415#21518#21628#21560#34928#31469
          end
          item
            EditButtons = <>
            FieldName = 'CH0EZ10'
            Footers = <>
            Title.Caption = #26415#21518#32954#37096#26643#22622
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
          end
          item
            EditButtons = <>
            FieldName = 'CH0EZ17'
            Footers = <>
            Title.Caption = #26415#21518#32954#37096#24863#26579
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
          end
          item
            EditButtons = <>
            FieldName = 'CH0EZ11'
            Footers = <>
            Title.Caption = #26415#21518#36133#34880#30151
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
          end
          item
            EditButtons = <>
            FieldName = 'CH0EZ16'
            Footers = <>
            Title.Caption = #26415#21518#39592#25240
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
          end
          item
            EditButtons = <>
            FieldName = 'CH0EZ12'
            Footers = <>
            Title.Caption = #26415#21518#39627#20851#33410#39592#25240
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
          end
          item
            EditButtons = <>
            FieldName = 'CH0EZ18'
            Footers = <>
            Title.Caption = #26415#21518#20154#24037#27668#36947#24847#22806#33073#20986
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object AdvGroupBox3: TAdvGroupBox
      Left = 0
      Top = 489
      Width = 755
      Height = 160
      BorderStyle = bsNone
      Align = alTop
      Caption = #20108#12289#20303#38498#37325#36820
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object lbl8: TLabel
        Left = 9
        Top = 32
        Width = 150
        Height = 16
        Caption = #36317#19978#19968#27425#20303#26412#38498#26102#38388#65306
      end
      object lbl9: TLabel
        Left = 196
        Top = 32
        Width = 318
        Height = 16
        Caption = '0.'#31532#19968#27425#20303#26412#38498' 1.'#24403#22825' 2.2-15'#22825' 3.16-31'#22825' 4.>31'#22825
      end
      object lbl10: TLabel
        Left = 9
        Top = 58
        Width = 359
        Height = 16
        Caption = #19978#19968#27425#20303#26412#38498#19982#26412#27425#20303#38498#26159#21542#22240#21516#19968#30142#30149'('#20027#35201#35786#26029') '#65306
      end
      object lbl11: TLabel
        Left = 416
        Top = 56
        Width = 161
        Height = 16
        Caption = '0.'#31532#19968#27425#20303#26412#38498' 1.'#21542' 2.'#26159
      end
      object lbl12: TLabel
        Left = 9
        Top = 84
        Width = 139
        Height = 16
        Caption = #37325#36820#25163#26415#23460#20877#25163#26415' '#65306
      end
      object lbl13: TLabel
        Left = 196
        Top = 84
        Width = 76
        Height = 16
        Caption = '0.- 1.'#21542' 2.'#26159
      end
      object lbl14: TLabel
        Left = 326
        Top = 84
        Width = 94
        Height = 16
        Caption = #20877#25163#26415#27515#20129' '#65306
      end
      object lbl15: TLabel
        Left = 468
        Top = 84
        Width = 76
        Height = 16
        Caption = '0.- 1.'#21542' 2.'#26159
      end
      object lbl16: TLabel
        Left = 9
        Top = 110
        Width = 109
        Height = 16
        Caption = #26159#21542#25321#26399#25163#26415' '#65306
      end
      object lbl17: TLabel
        Left = 177
        Top = 110
        Width = 76
        Height = 16
        Caption = '0.- 1.'#21542' 2.'#26159
      end
      object lbl18: TLabel
        Left = 350
        Top = 110
        Width = 68
        Height = 16
        Caption = #36827#34892'PCI '#65306
      end
      object lbl19: TLabel
        Left = 468
        Top = 110
        Width = 76
        Height = 16
        Caption = '0.- 1.'#26080' 2.'#26377
      end
      object lbl20: TLabel
        Left = 9
        Top = 136
        Width = 219
        Height = 16
        Caption = #36827#34892'PCI'#21518#21516#19968#22825#36827#34892'CABG'#25163#26415' '#65306
      end
      object lbl21: TLabel
        Left = 280
        Top = 136
        Width = 76
        Height = 16
        Caption = '0.- 1.'#26080' 2.'#26377
      end
      object edtCH0ATY18: TEdit
        Left = 161
        Top = 26
        Width = 29
        Height = 22
        TabOrder = 0
        OnKeyPress = edtCH0ATY18KeyPress
      end
      object edtCH0ATY19: TEdit
        Left = 369
        Top = 52
        Width = 29
        Height = 22
        TabOrder = 1
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0EZ13: TEdit
        Left = 147
        Top = 78
        Width = 29
        Height = 22
        TabOrder = 2
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0EZ14: TEdit
        Left = 419
        Top = 78
        Width = 29
        Height = 22
        TabOrder = 3
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0ESC00: TEdit
        Left = 128
        Top = 104
        Width = 29
        Height = 22
        TabOrder = 4
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0EZ19: TEdit
        Left = 419
        Top = 104
        Width = 29
        Height = 22
        TabOrder = 5
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0EZ15: TEdit
        Left = 231
        Top = 130
        Width = 29
        Height = 22
        TabOrder = 6
        OnKeyPress = edtCH0AYN04KeyPress
      end
    end
    object AdvGroupBox4: TAdvGroupBox
      Left = 0
      Top = 649
      Width = 755
      Height = 185
      BorderStyle = bsNone
      Align = alTop
      Caption = #19977#12289#20837#20303#37325#30149#30417#25252#23460#65288'ICU'#65289#24773#20917'('#21253#25324'CCU'#12289'NICU'#12289'PICU'#12289'SICU'#31561#25152#26377#21333#20803')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object dbgrdhICU: TDBGridEh
        Left = 2
        Top = 19
        Width = 751
        Height = 164
        Align = alClient
        DataGrouping.GroupLevels = <>
        DataSource = dsICU
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        RowDetailPanel.Color = clBtnFace
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        UseMultiTitle = True
        OnKeyDown = dbgrdhICUKeyDown
        Columns = <
          item
            EditButtons = <>
            FieldName = 'CH0R03'
            Footers = <>
            Title.Caption = #37325#30151#30417#25252#23460#21517#31216
          end
          item
            EditButtons = <>
            EditMask = '0000-90-90 90:90;1; '
            FieldName = 'CH0R05'
            Footers = <>
            Title.Caption = #36827#20837#26102#38388
          end
          item
            EditButtons = <>
            EditMask = '0000-90-90 90:90;1; '
            FieldName = 'CH0R06'
            Footers = <>
            Title.Caption = #31163#24320#26102#38388
          end
          item
            EditButtons = <>
            FieldName = 'CH0R10'
            Footers = <>
            Title.Caption = #26159#21542#21457#29983#20154#24037#27668#36947#33073#20986
          end
          item
            EditButtons = <>
            FieldName = 'CH0R11'
            Footers = <>
            Title.Caption = #26159#21542#38750#39044#26399#30340#37325#36820#37325#30151#21307#23398#31185
          end
          item
            EditButtons = <>
            FieldName = 'CH0R12'
            Footers = <>
            Title.Caption = #37325#36820#38388#38548
          end
          item
            EditButtons = <>
            FieldName = 'CH0R13'
            Footers = <>
            Title.Caption = 'ICU'#27515#20129
          end
          item
            EditButtons = <>
            FieldName = 'CH0R14'
            Footers = <>
            Title.Caption = #20351#29992#20013#38745#33033#23548#31649#26085#25968
          end
          item
            EditButtons = <>
            FieldName = 'CH0R15'
            Footers = <>
            Title.Caption = #26159#21542#21457#29983#19982#20013#24515#38745#33033#32622#31649#30456#20851#34880#28082#24863#26579
          end
          item
            EditButtons = <>
            FieldName = 'CH0R16'
            Footers = <>
            Title.Caption = #20351#29992#21628#21560#26426#26085#25968
          end
          item
            EditButtons = <>
            FieldName = 'CH0R17'
            Footers = <>
            Title.Caption = #26159#21542#21457#29983#19982#21628#21560#26426#30456#20851#32954#28814#24863#26579
          end
          item
            EditButtons = <>
            FieldName = 'CH0R18'
            Footers = <>
            Title.Caption = #20351#29992#30041#32622#23548#23615#31649#26085#25968
          end
          item
            EditButtons = <>
            FieldName = 'CH0R19'
            Footers = <>
            Title.Caption = #26159#21542#21457#29983#19982#30041#32622#23548#23615#31649#30456#20851#27852#23615#31995#32479#24863#26579
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object AdvGroupBox5: TAdvGroupBox
      Left = 0
      Top = 834
      Width = 755
      Height = 184
      BorderStyle = bsNone
      Align = alTop
      Caption = #22235#12289#21512#29702#29992#33647' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object lbl22: TLabel
        Left = 9
        Top = 36
        Width = 199
        Height = 16
        Caption = #20303#38498#26399#38388#26159#21542#24212#29992#25239#33740#33647#29289' '#65306
      end
      object lbl23: TLabel
        Left = 277
        Top = 36
        Width = 76
        Height = 16
        Caption = '0.- 1.'#21542' 2.'#26159
      end
      object lbl24: TLabel
        Left = 364
        Top = 36
        Width = 109
        Height = 16
        Caption = #20351#29992#25345#32493#26102#38388' '#65306
      end
      object lbl26: TLabel
        Left = 9
        Top = 67
        Width = 233
        Height = 16
        Caption = 'I'#31867#25163#26415#20999#21475#39044#38450#24615#24212#29992#25239#33740#33647#29289' '#65306
      end
      object lbl27: TLabel
        Left = 277
        Top = 67
        Width = 76
        Height = 16
        Caption = '0.- 1.'#21542' 2.'#26159
      end
      object lbl28: TLabel
        Left = 549
        Top = 36
        Width = 65
        Height = 16
        Caption = #32852#21512#29992#33647':'
      end
      object lbl29: TLabel
        Left = 655
        Top = 36
        Width = 76
        Height = 16
        Caption = '0.- 1.'#21542' 2.'#26159
      end
      object lbl25: TLabel
        Left = 517
        Top = 36
        Width = 30
        Height = 16
        Caption = #23567#26102
      end
      object lbl30: TLabel
        Left = 364
        Top = 67
        Width = 109
        Height = 16
        Caption = #20351#29992#25345#32493#26102#38388' '#65306
      end
      object lbl31: TLabel
        Left = 517
        Top = 67
        Width = 30
        Height = 16
        Caption = #23567#26102
      end
      object lbl32: TLabel
        Left = 549
        Top = 67
        Width = 65
        Height = 16
        Caption = #32852#21512#29992#33647':'
      end
      object lbl33: TLabel
        Left = 655
        Top = 67
        Width = 76
        Height = 16
        Caption = '0.- 1.'#21542' 2.'#26159
      end
      object lbl34: TLabel
        Left = 9
        Top = 98
        Width = 210
        Height = 16
        Caption = #25239#33740#33647#29289#24739#32773#30149#21407#23398#26816#26597#36865#26816#65306
      end
      object lbl35: TLabel
        Left = 277
        Top = 98
        Width = 76
        Height = 16
        Caption = '0.- 1.'#21542' 2.'#26159
      end
      object lbl36: TLabel
        Left = 364
        Top = 98
        Width = 195
        Height = 16
        Caption = #28165#27905#25163#26415#21069'0.5-2'#23567#26102#20869#32473#33647#65306
      end
      object lbl37: TLabel
        Left = 655
        Top = 98
        Width = 76
        Height = 16
        Caption = '0.- 1.'#21542' 2.'#26159
      end
      object lbl38: TLabel
        Left = 9
        Top = 129
        Width = 225
        Height = 16
        Caption = #39627#20851#33410#32622#25442#26415#21069'0.5-2'#23567#26102#20869#32473#33647#65306
      end
      object lbl39: TLabel
        Left = 277
        Top = 129
        Width = 76
        Height = 16
        Caption = '0.- 1.'#21542' 2.'#26159
      end
      object lbl40: TLabel
        Left = 364
        Top = 129
        Width = 240
        Height = 16
        Caption = #23376#23467#32908#30244#20999#38500#26415#21069'0.5-2'#23567#26102#20869#32473#33647#65306
      end
      object lbl41: TLabel
        Left = 655
        Top = 129
        Width = 76
        Height = 16
        Caption = '0.- 1.'#21542' 2.'#26159
      end
      object lbl42: TLabel
        Left = 9
        Top = 160
        Width = 225
        Height = 16
        Caption = #33181#20851#33410#32622#25442#26415#21069'0.5-2'#23567#26102#20869#32473#33647#65306
      end
      object lbl43: TLabel
        Left = 277
        Top = 160
        Width = 76
        Height = 16
        Caption = '0.- 1.'#21542' 2.'#26159
      end
      object edtCH0AYN04: TEdit
        Left = 238
        Top = 30
        Width = 29
        Height = 22
        TabOrder = 0
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0AYN01: TEdit
        Left = 238
        Top = 61
        Width = 29
        Height = 22
        TabOrder = 3
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0AYN06: TEdit
        Left = 616
        Top = 30
        Width = 29
        Height = 22
        TabOrder = 2
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0AYN05: TEdit
        Left = 474
        Top = 30
        Width = 37
        Height = 22
        BevelInner = bvNone
        BevelOuter = bvNone
        TabOrder = 1
      end
      object edtCH0AYN02: TEdit
        Left = 474
        Top = 61
        Width = 37
        Height = 22
        BevelInner = bvNone
        BevelOuter = bvNone
        TabOrder = 4
      end
      object edtCH0AYN03: TEdit
        Left = 616
        Top = 61
        Width = 29
        Height = 22
        TabOrder = 5
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0ATY01: TEdit
        Left = 238
        Top = 92
        Width = 29
        Height = 22
        TabOrder = 6
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0ATY02: TEdit
        Left = 616
        Top = 92
        Width = 29
        Height = 22
        TabOrder = 7
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0ATY04: TEdit
        Left = 238
        Top = 123
        Width = 29
        Height = 22
        TabOrder = 8
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0ATY06: TEdit
        Left = 616
        Top = 123
        Width = 29
        Height = 22
        TabOrder = 9
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0ATY05: TEdit
        Left = 238
        Top = 154
        Width = 29
        Height = 22
        TabOrder = 10
        OnKeyPress = edtCH0AYN04KeyPress
      end
    end
    object AdvGroupBox6: TAdvGroupBox
      Left = 0
      Top = 1018
      Width = 755
      Height = 239
      BorderStyle = bsNone
      Align = alTop
      Caption = #20116#12289#24739#32773#23433#20840
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object lbl44: TLabel
        Left = 3
        Top = 28
        Width = 170
        Height = 16
        Caption = #21457#29983#25163#26415#36807#31243#20013#24322#29289#36951#30041':'
      end
      object lbl45: TLabel
        Left = 214
        Top = 28
        Width = 76
        Height = 16
        Caption = '0.- 1.'#21542' 2.'#26159
      end
      object lbl46: TLabel
        Left = 306
        Top = 28
        Width = 80
        Height = 16
        Caption = #26159#21542#26377#21387#30126':'
      end
      object lbl47: TLabel
        Left = 435
        Top = 28
        Width = 76
        Height = 16
        Caption = '0.- 1.'#21542' 2.'#26159
      end
      object lbl48: TLabel
        Left = 3
        Top = 59
        Width = 155
        Height = 16
        Caption = #26159#21542#20303#38498#26399#38388#21457#29983#21387#30126':'
      end
      object lbl49: TLabel
        Left = 214
        Top = 59
        Width = 76
        Height = 16
        Caption = '0.- 1.'#21542' 2.'#26159
      end
      object lbl50: TLabel
        Left = 321
        Top = 59
        Width = 65
        Height = 16
        Caption = #21387#30126#20998#26399':'
      end
      object lbl51: TLabel
        Left = 435
        Top = 59
        Width = 316
        Height = 16
        Caption = '0.- 1.'#8544#26399' 2.'#8545#26399' 3.'#8546#26399' 4.'#8547#26399' 5.'#19981#21487#20998#26399#30340#21387#30126
      end
      object lbl52: TLabel
        Left = 3
        Top = 90
        Width = 100
        Height = 16
        Caption = #38498#20869#36300#20498'/'#22368#24202':'
      end
      object lbl53: TLabel
        Left = 170
        Top = 90
        Width = 76
        Height = 16
        Caption = '0.- 1.'#21542' 2.'#26159
      end
      object lbl54: TLabel
        Left = 256
        Top = 90
        Width = 130
        Height = 16
        Caption = #36300#20498'/'#22368#24202#20005#37325#31243#24230':'
      end
      object lbl55: TLabel
        Left = 435
        Top = 90
        Width = 127
        Height = 16
        Caption = '0.- 1.1'#32423' 2.2'#32423' 3.3'#32423
      end
      object lbl56: TLabel
        Left = 3
        Top = 121
        Width = 125
        Height = 16
        Caption = #36300#20498#25110#22368#24202#30340#21407#22240':'
      end
      object lbl57: TLabel
        Left = 3
        Top = 152
        Width = 110
        Height = 16
        Caption = #21457#29983#21307#28304#24615#27668#33016':'
      end
      object lbl58: TLabel
        Left = 170
        Top = 152
        Width = 76
        Height = 16
        Caption = '0.- 1.'#21542' 2.'#26159
      end
      object lbl59: TLabel
        Left = 258
        Top = 152
        Width = 215
        Height = 16
        Caption = #21457#29983#21307#28304#24615#24847#22806#31359#21050#20260#25110#25749#35010#20260':'
      end
      object lbl60: TLabel
        Left = 530
        Top = 152
        Width = 76
        Height = 16
        Caption = '0.- 1.'#21542' 2.'#26159
      end
      object lbl61: TLabel
        Left = 3
        Top = 183
        Width = 65
        Height = 16
        Caption = #25509#21463#36755#34880':'
      end
      object lbl62: TLabel
        Left = 170
        Top = 183
        Width = 76
        Height = 16
        Caption = '0.- 1.'#26080' 2.'#26377
      end
      object lbl63: TLabel
        Left = 408
        Top = 183
        Width = 65
        Height = 16
        Caption = #36755#34880#21453#24212':'
      end
      object lbl65: TLabel
        Left = 3
        Top = 214
        Width = 65
        Height = 16
        Caption = #25509#21463#36755#28082':'
      end
      object lbl67: TLabel
        Left = 408
        Top = 214
        Width = 65
        Height = 16
        Caption = #36755#28082#21453#24212':'
      end
      object lbl64: TLabel
        Left = 170
        Top = 214
        Width = 76
        Height = 16
        Caption = '0.- 1.'#26080' 2.'#26377
      end
      object lbl66: TLabel
        Left = 530
        Top = 183
        Width = 76
        Height = 16
        Caption = '0.- 1.'#26080' 2.'#26377
      end
      object lbl68: TLabel
        Left = 530
        Top = 214
        Width = 76
        Height = 16
        Caption = '0.- 1.'#26080' 2.'#26377
      end
      object edtCh0EZ03: TEdit
        Left = 179
        Top = 22
        Width = 29
        Height = 22
        TabOrder = 0
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0AYNA7: TEdit
        Left = 400
        Top = 22
        Width = 29
        Height = 22
        TabOrder = 1
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0AYNA8: TEdit
        Left = 179
        Top = 53
        Width = 29
        Height = 22
        TabOrder = 2
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0AYNA9: TEdit
        Left = 400
        Top = 53
        Width = 29
        Height = 22
        TabOrder = 3
        OnKeyPress = edtCH0AYNA9KeyPress
      end
      object edtCH0AYNB0: TEdit
        Left = 129
        Top = 84
        Width = 29
        Height = 22
        TabOrder = 4
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0AYNB1: TEdit
        Left = 400
        Top = 84
        Width = 29
        Height = 22
        TabOrder = 5
        OnKeyPress = edtCH0AYNB1KeyPress
      end
      object edtCH0P11: TEdit
        Left = 129
        Top = 146
        Width = 29
        Height = 22
        TabOrder = 7
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0P13: TEdit
        Left = 495
        Top = 146
        Width = 29
        Height = 22
        TabOrder = 8
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0A57: TEdit
        Left = 129
        Top = 177
        Width = 29
        Height = 22
        TabOrder = 9
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0ATY15: TEdit
        Left = 495
        Top = 177
        Width = 29
        Height = 22
        TabOrder = 10
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0A58: TEdit
        Left = 129
        Top = 208
        Width = 29
        Height = 22
        TabOrder = 11
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0ATY16: TEdit
        Left = 495
        Top = 208
        Width = 29
        Height = 22
        TabOrder = 12
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object cbbCH0AYNB2: TAdvOfficeComboBox
        Left = 134
        Top = 116
        Width = 295
        Height = 24
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
        Version = '1.5.2.1'
        ItemIndex = -1
        ItemHeight = 14
        TabOrder = 6
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        Style = csDropDownList
      end
    end
    object AdvGroupBox7: TAdvGroupBox
      Left = 0
      Top = 1257
      Width = 755
      Height = 120
      BorderStyle = bsNone
      Align = alTop
      Caption = #20845#12289#21307#38498#24863#26579
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      object lbl69: TLabel
        Left = 3
        Top = 33
        Width = 65
        Height = 16
        Caption = #21307#38498#24863#26579':'
      end
      object lbl70: TLabel
        Left = 115
        Top = 29
        Width = 76
        Height = 16
        Caption = '0.- 1.'#26080' 2.'#26377
      end
      object lbl71: TLabel
        Left = 241
        Top = 33
        Width = 95
        Height = 16
        Caption = #21307#38498#24863#26579#27425#25968':'
      end
      object lbl72: TLabel
        Left = 386
        Top = 33
        Width = 15
        Height = 16
        Caption = #27425
      end
      object lbl73: TLabel
        Left = 414
        Top = 33
        Width = 125
        Height = 16
        Caption = #25163#26415#30456#20851#21307#38498#24863#26579':'
      end
      object lbl74: TLabel
        Left = 592
        Top = 33
        Width = 76
        Height = 16
        Caption = '0.- 1.'#26080' 2.'#26377
      end
      object lbl75: TLabel
        Left = 3
        Top = 64
        Width = 125
        Height = 16
        Caption = #25163#26415#24739#32773#32954#37096#24863#26579':'
      end
      object lbl76: TLabel
        Left = 177
        Top = 64
        Width = 76
        Height = 16
        Caption = '0.- 1.'#26080' 2.'#26377
      end
      object lbl77: TLabel
        Left = 269
        Top = 64
        Width = 155
        Height = 16
        Caption = #25163#26415#24739#32773#25163#26415#37096#20301#24863#26579':'
      end
      object lbl78: TLabel
        Left = 465
        Top = 61
        Width = 76
        Height = 16
        Caption = '0.- 1.'#26080' 2.'#26377
      end
      object lbl79: TLabel
        Left = 3
        Top = 95
        Width = 65
        Height = 16
        Caption = #34880#28082#36879#26512':'
      end
      object lbl80: TLabel
        Left = 115
        Top = 95
        Width = 76
        Height = 16
        Caption = '0.- 1.'#26080' 2.'#26377
      end
      object lbl81: TLabel
        Left = 269
        Top = 95
        Width = 140
        Height = 16
        Caption = #19982#34880#28082#36879#26512#30456#20851#24863#26579':'
      end
      object lbl82: TLabel
        Left = 465
        Top = 95
        Width = 76
        Height = 16
        Caption = '0.- 1.'#26080' 2.'#26377
      end
      object edtCH0A54: TEdit
        Left = 74
        Top = 27
        Width = 29
        Height = 22
        TabOrder = 0
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0AQ1: TEdit
        Left = 351
        Top = 27
        Width = 29
        Height = 22
        TabOrder = 1
      end
      object edtCH0ATY07: TEdit
        Left = 557
        Top = 27
        Width = 29
        Height = 22
        TabOrder = 2
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0ATY17: TEdit
        Left = 133
        Top = 58
        Width = 29
        Height = 22
        TabOrder = 4
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0AQ5: TEdit
        Left = 430
        Top = 55
        Width = 29
        Height = 22
        TabOrder = 3
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0ATY08: TEdit
        Left = 74
        Top = 89
        Width = 29
        Height = 22
        TabOrder = 5
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0ATY09: TEdit
        Left = 430
        Top = 89
        Width = 29
        Height = 22
        TabOrder = 6
        OnKeyPress = edtCH0AYN04KeyPress
      end
    end
    object AdvGroupBox8: TAdvGroupBox
      Left = 0
      Top = 1377
      Width = 755
      Height = 120
      BorderStyle = bsNone
      Align = alTop
      Caption = #19971#12289#20020#24202#36335#24452
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      object lbl83: TLabel
        Left = 5
        Top = 29
        Width = 155
        Height = 16
        Caption = #26159#21542#23454#26045#20020#24202#36335#24452#31649#29702':'
      end
      object lbl84: TLabel
        Left = 206
        Top = 29
        Width = 76
        Height = 16
        Caption = '0.- 1.'#21542' 2.'#26159
      end
      object lbl85: TLabel
        Left = 324
        Top = 29
        Width = 125
        Height = 16
        Caption = #26159#21542#23436#25104#20020#24202#36335#24452':'
      end
      object lbl86: TLabel
        Left = 517
        Top = 29
        Width = 76
        Height = 16
        Caption = '0.- 1.'#21542' 2.'#26159
      end
      object lbl87: TLabel
        Left = 5
        Top = 60
        Width = 65
        Height = 16
        Caption = #36864#20986#21407#22240':'
      end
      object lbl88: TLabel
        Left = 5
        Top = 91
        Width = 65
        Height = 16
        Caption = #26159#21542#21464#24322':'
      end
      object lbl89: TLabel
        Left = 130
        Top = 91
        Width = 76
        Height = 16
        Caption = '0.- 1.'#21542' 2.'#26159
      end
      object lbl90: TLabel
        Left = 232
        Top = 91
        Width = 65
        Height = 16
        Caption = #21464#24322#21407#22240':'
      end
      object edtCh0ANQ: TEdit
        Left = 166
        Top = 23
        Width = 29
        Height = 22
        TabOrder = 0
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0AYN07: TEdit
        Left = 468
        Top = 23
        Width = 29
        Height = 22
        TabOrder = 1
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0AYN08: TEdit
        Left = 78
        Top = 54
        Width = 433
        Height = 22
        MaxLength = 50
        TabOrder = 2
      end
      object edtCH0AYN09: TEdit
        Left = 81
        Top = 85
        Width = 29
        Height = 22
        TabOrder = 3
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0AYNAA: TEdit
        Left = 307
        Top = 85
        Width = 433
        Height = 22
        MaxLength = 50
        TabOrder = 4
      end
    end
    object AdvGroupBox9: TAdvGroupBox
      Left = 0
      Top = 1497
      Width = 755
      Height = 216
      BorderStyle = bsNone
      Align = alTop
      Caption = #20843#12289#20854#20182
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      object lbl91: TLabel
        Left = 5
        Top = 25
        Width = 35
        Height = 16
        Caption = #25250#25937':'
      end
      object lbl92: TLabel
        Left = 93
        Top = 25
        Width = 56
        Height = 16
        Caption = '1.'#26080' 2.'#26377
      end
      object lbl93: TLabel
        Left = 167
        Top = 25
        Width = 35
        Height = 16
        Caption = #25250#25937':'
      end
      object lbl94: TLabel
        Left = 253
        Top = 25
        Width = 15
        Height = 16
        Caption = #27425
      end
      object lbl95: TLabel
        Left = 309
        Top = 25
        Width = 35
        Height = 16
        Caption = #25104#21151':'
      end
      object lbl96: TLabel
        Left = 388
        Top = 25
        Width = 15
        Height = 16
        Caption = #27425
      end
      object lbl97: TLabel
        Left = 5
        Top = 56
        Width = 95
        Height = 16
        Caption = #35786#26029#31526#21512#24773#20917':'
      end
      object lbl98: TLabel
        Left = 127
        Top = 56
        Width = 75
        Height = 16
        Caption = #20986#38498#19982#38376#35786
      end
      object lbl99: TLabel
        Left = 269
        Top = 60
        Width = 75
        Height = 16
        Caption = #20837#38498#19982#20986#38498
      end
      object lbl101: TLabel
        Left = 503
        Top = 56
        Width = 75
        Height = 16
        Caption = #20020#24202#19982#30149#29702
      end
      object lbl102: TLabel
        Left = 619
        Top = 54
        Width = 75
        Height = 16
        Caption = #25918#23556#19982#30149#29702
      end
      object lbl104: TLabel
        Left = 67
        Top = 87
        Width = 135
        Height = 16
        Caption = #25163#26415#20912#20923#19982#30707#34593#30149#29702
      end
      object lbl105: TLabel
        Left = 388
        Top = 56
        Width = 75
        Height = 16
        Caption = #26415#21069#19982#26415#21518
      end
      object lbl106: TLabel
        Left = 269
        Top = 82
        Width = 210
        Height = 16
        Caption = ' 1.'#31526#21512' 2.'#19981#31526#21512' 3.'#19981#32943#23450' 4.'#26410#20570
      end
      object lbl107: TLabel
        Left = 5
        Top = 125
        Width = 215
        Height = 16
        Caption = #21333#30149#31181#36136#37327#31649#29702#19982#36153#29992#25511#21046#30149#31181':'
      end
      object lbl108: TLabel
        Left = 269
        Top = 125
        Width = 76
        Height = 16
        Caption = '0.- 1.'#21542' 2.'#26159
      end
      object lbl109: TLabel
        Left = 388
        Top = 125
        Width = 65
        Height = 16
        Caption = #32435#20837#36136#25511':'
      end
      object lbl110: TLabel
        Left = 503
        Top = 125
        Width = 76
        Height = 16
        Caption = '0.- 1.'#21542' 2.'#26159
      end
      object lbl111: TLabel
        Left = 5
        Top = 156
        Width = 80
        Height = 16
        Caption = #26410#32435#20837#21407#22240':'
      end
      object lbl112: TLabel
        Left = 5
        Top = 189
        Width = 140
        Height = 16
        Caption = #26159#21542#21457#29983#22260#26415#26399#27515#20129':'
      end
      object lbl113: TLabel
        Left = 206
        Top = 189
        Width = 76
        Height = 16
        Caption = '0.- 1.'#21542' 2.'#26159
      end
      object lbl114: TLabel
        Left = 328
        Top = 189
        Width = 125
        Height = 16
        Caption = #26159#21542#21457#29983#26415#21518#29469#27515':'
      end
      object lbl115: TLabel
        Left = 503
        Top = 189
        Width = 76
        Height = 16
        Caption = '0.- 1.'#21542' 2.'#26159
      end
      object edtqj: TEdit
        Left = 58
        Top = 19
        Width = 29
        Height = 22
        TabOrder = 0
      end
      object edttCH0A46: TEdit
        Left = 215
        Top = 19
        Width = 29
        Height = 22
        TabOrder = 1
      end
      object edttCH0A47: TEdit
        Left = 350
        Top = 19
        Width = 29
        Height = 22
        TabOrder = 2
      end
      object edtCH0A43: TEdit
        Left = 215
        Top = 50
        Width = 29
        Height = 22
        TabOrder = 4
        OnKeyPress = edtCH0A43KeyPress
      end
      object edtCH0A44: TEdit
        Left = 350
        Top = 50
        Width = 29
        Height = 22
        TabOrder = 5
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0AC1: TEdit
        Left = 584
        Top = 50
        Width = 29
        Height = 22
        TabOrder = 7
        OnKeyPress = edtCH0A43KeyPress
      end
      object edtCH0AC2: TEdit
        Left = 700
        Top = 48
        Width = 29
        Height = 22
        TabOrder = 3
        OnKeyPress = edtCH0A43KeyPress
      end
      object edtCh0AQ6: TEdit
        Left = 215
        Top = 81
        Width = 29
        Height = 22
        TabOrder = 8
        OnKeyPress = edtCH0A43KeyPress
      end
      object edtCH0ACD: TEdit
        Left = 467
        Top = 50
        Width = 29
        Height = 22
        TabOrder = 6
        OnKeyPress = edtCH0A43KeyPress
      end
      object edtCH0ATY10: TEdit
        Left = 215
        Top = 119
        Width = 29
        Height = 22
        TabOrder = 9
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0ATY11: TEdit
        Left = 467
        Top = 119
        Width = 29
        Height = 22
        TabOrder = 10
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0ATY12: TEdit
        Left = 93
        Top = 150
        Width = 433
        Height = 22
        TabOrder = 11
      end
      object edtCH0ATY13: TEdit
        Left = 152
        Top = 183
        Width = 29
        Height = 22
        TabOrder = 12
        OnKeyPress = edtCH0AYN04KeyPress
      end
      object edtCH0ATY14: TEdit
        Left = 467
        Top = 183
        Width = 29
        Height = 22
        TabOrder = 13
        OnKeyPress = edtCH0AYN04KeyPress
      end
    end
    object AdvGroupBox10: TAdvGroupBox
      Left = 0
      Top = 1713
      Width = 755
      Height = 160
      BorderStyle = bsNone
      Align = alTop
      Caption = #20061#12289#26032#29983#20799
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      object dbgrdhXSE: TDBGridEh
        Left = 2
        Top = 19
        Width = 751
        Height = 139
        Align = alClient
        DataGrouping.GroupLevels = <>
        DataSource = dsXSER
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        RowDetailPanel.Color = clBtnFace
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        UseMultiTitle = True
        OnKeyDown = dbgrdhXSEKeyDown
        Columns = <
          item
            EditButtons = <>
            FieldName = 'xh'
            Footers = <>
            Title.Caption = #24207#21495
          end
          item
            EditButtons = <>
            FieldName = 'XB'
            Footers = <>
            Title.Caption = #24615#21035
          end
          item
            EditButtons = <>
            FieldName = 'PF'
            Footers = <>
            Title.Caption = #38463#27663#35780#20998
          end
          item
            EditButtons = <>
            FieldName = 'SC'
            Footers = <>
            Title.Caption = #36523#38271
          end
          item
            EditButtons = <>
            FieldName = 'TZ'
            Footers = <>
            Title.Caption = #20307#37325
          end
          item
            EditButtons = <>
            FieldName = 'CCQK'
            Footers = <>
            Title.Caption = #20135#20986#24773#20917
          end
          item
            EditButtons = <>
            FieldName = 'CYQK'
            Footers = <>
            Title.Caption = #20986#38498#24773#20917
          end
          item
            EditButtons = <>
            FieldName = 'CYRQ'
            Footers = <>
            Title.Caption = #20986#29983#26102#38388
          end
          item
            Checkboxes = False
            EditButtons = <>
            FieldName = 'JB'
            Footers = <>
            Title.Caption = #30142#30149
          end
          item
            EditButtons = <>
            FieldName = 'SWSJ'
            Footers = <>
            Title.Caption = #27515#20129#26085#26399
          end
          item
            EditButtons = <>
            FieldName = 'SWYY'
            Footers = <>
            Title.Caption = #27515#20129#21407#22240
          end
          item
            EditButtons = <>
            FieldName = 'YYGR'
            Footers = <>
            Title.Caption = #26159#21542#21457#29983#21307#38498#24863#26579
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object ds1: TDataSource
    DataSet = clientdtDLCDS
    Left = 481
    Top = 48
  end
  object dsss: TDataSource
    DataSet = dldtSS
    Left = 512
    Top = 328
  end
  object clientdtDLCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 48
  end
  object dsICU: TDataSource
    DataSet = dldtICU
    Left = 560
    Top = 776
  end
  object dldtXSER: TDlClientDataset
    Aggregates = <>
    Params = <>
    Left = 320
    Top = 1792
  end
  object dsXSER: TDataSource
    DataSet = clientdtDLCDS
    Left = 384
    Top = 1784
  end
  object dldtSS: TDlClientDataset
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 296
  end
  object dldtICU: TDlClientDataset
    Aggregates = <>
    Params = <>
    Left = 448
    Top = 752
  end
  object clientdtXSER: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 1792
  end
end