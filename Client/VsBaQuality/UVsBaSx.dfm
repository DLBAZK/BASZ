inherited FrmBaSx: TFrmBaSx
  Caption = #30149#20363#31579#36873
  ClientHeight = 526
  ClientWidth = 1023
  Font.Charset = ANSI_CHARSET
  Font.Height = -12
  Font.Name = #24494#36719#38597#40657
  ExplicitWidth = 1039
  ExplicitHeight = 564
  PixelsPerInch = 96
  TextHeight = 17
  inherited advfcstsbr: TAdvOfficeStatusBar
    Top = 507
    Width = 1023
    ExplicitTop = 543
    ExplicitWidth = 1008
  end
  inherited advtlbrpgr1: TAdvToolBarPager
    Width = 1023
    ExplicitWidth = 1008
    inherited AdvPage1: TAdvPage
      Width = 1015
      Height = 0
      ExplicitWidth = 1015
      ExplicitHeight = 0
    end
  end
  inherited AdvPanel1: TAdvPanel
    Width = 1023
    Height = 482
    ExplicitWidth = 1008
    ExplicitHeight = 518
    FullHeight = 200
    object AdvSplitter1: TAdvSplitter
      Left = 456
      Top = 89
      Height = 393
      Beveled = True
      Appearance.BorderColor = clNone
      Appearance.BorderColorHot = clNone
      Appearance.Color = clWhite
      Appearance.ColorTo = clSilver
      Appearance.ColorHot = clWhite
      Appearance.ColorHotTo = clGray
      GripStyle = sgDots
      ExplicitLeft = 1120
      ExplicitTop = 240
      ExplicitHeight = 100
    end
    object AdvPanel2: TAdvPanel
      Left = 0
      Top = 0
      Width = 1023
      Height = 89
      Align = alTop
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = True
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
      ExplicitWidth = 1008
      FullHeight = 200
      object AdvGroupBox1: TAdvGroupBox
        Left = 0
        Top = 0
        Width = 699
        Height = 89
        Align = alLeft
        Caption = #30149#20363#31579#36873#26465#20214
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label1: TLabel
          Left = 343
          Top = 53
          Width = 60
          Height = 20
          Caption = #36136#25511#31867#21035
          Color = 16640730
          ParentColor = False
          Transparent = True
        end
        object dladvChkZyts: TDLAdvCheckBox
          Left = 9
          Top = 53
          Width = 208
          Height = 33
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          Alignment = taLeftJustify
          Caption = #20303#38498#22825#25968'                             '#21040
          ReturnIsTab = False
          Version = '1.3.4.1'
        end
        object dladvChkCH0A27: TDLAdvCheckBox
          Left = 9
          Top = 19
          Width = 208
          Height = 31
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = #20986#38498#26085#26399'                             '#21040
          ReturnIsTab = False
          Version = '1.3.4.1'
        end
        object advDtpks: TAdvDateTimePicker
          Left = 91
          Top = 19
          Width = 90
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
          TabOrder = 2
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
          Left = 223
          Top = 19
          Width = 90
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
        object suiedtstart: TsuiEdit
          Left = 91
          Top = 57
          Width = 90
          Height = 19
          UIStyle = WinXP
          BorderColor = 6842472
          Enabled = False
          TabOrder = 12
          OnExit = suiedtstartExit
          OnKeyPress = suiedtstartKeyPress
        end
        object suiedtEnd: TsuiEdit
          Left = 223
          Top = 56
          Width = 90
          Height = 19
          UIStyle = WinXP
          BorderColor = 6842472
          Enabled = False
          TabOrder = 11
          OnExit = suiedtstartExit
          OnKeyPress = suiedtstartKeyPress
        end
        object AdvGlowButton1: TAdvGlowButton
          Left = 593
          Top = 16
          Width = 100
          Height = 31
          Caption = #31579#36873
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
          TabOrder = 0
          OnClick = AdvGlowButton1Click
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
        object dladvChkCH0A23: TDLAdvCheckBox
          Left = 330
          Top = 20
          Width = 71
          Height = 27
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Alignment = taLeftJustify
          Caption = #20986#38498#31185#23460
          ReturnIsTab = False
          Version = '1.3.4.1'
        end
        object advckbDeath: TAdvOfficeCheckBox
          Left = 542
          Top = 20
          Width = 55
          Height = 31
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          Alignment = taLeftJustify
          Caption = #27515#20129
          ReturnIsTab = False
          Version = '1.3.4.1'
        end
        object advckbOPS: TAdvOfficeCheckBox
          Left = 542
          Top = 53
          Width = 55
          Height = 30
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          Alignment = taLeftJustify
          Caption = #25163#26415
          ReturnIsTab = False
          Version = '1.3.4.1'
        end
        object AdvbtnClose: TAdvGlowButton
          Left = 593
          Top = 51
          Width = 100
          Height = 32
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
          TabOrder = 7
          Appearance.BorderColor = 12631218
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.Color = 14671574
          Appearance.ColorTo = 15000283
          Appearance.ColorChecked = 7915518
          Appearance.ColorCheckedTo = 11918331
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 14144974
          Appearance.ColorMirrorTo = 15197664
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object AdvedtCH0A23: TAdvEditBtn
          Left = 407
          Top = 21
          Width = 129
          Height = 26
          EmptyTextStyle = []
          Flat = False
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Enabled = False
          ReadOnly = False
          TabOrder = 6
          Visible = True
          OnEnter = AdvedtCH0A23Enter
          OnExit = AdvedtCH0A23Exit
          OnKeyDown = AdvedtCH0A23KeyDown
          OnKeyPress = AdvedtCH0A23KeyPress
          Version = '1.3.3.4'
          ButtonStyle = bsButton
          ButtonWidth = 16
          Etched = False
          OnClickBtn = AdvedtCH0A23ClickBtn
        end
        object suicbcbbLB: TsuiDBLookupComboBox
          Left = 407
          Top = 53
          Width = 129
          Height = 26
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          KeyField = 'dm'
          ListField = 'dmmc'
          ListSource = dsLB
          ParentFont = False
          TabOrder = 9
          UIStyle = WinXP
          BorderColor = 6842472
          ArrowColor = clBlack
          ButtonColor = 14609391
        end
      end
      object AdvGroupBox2: TAdvGroupBox
        Left = 699
        Top = 0
        Width = 324
        Height = 89
        Align = alClient
        Caption = #23450#20301
        TabOrder = 1
        ExplicitLeft = 705
        ExplicitWidth = 415
        object Label2: TLabel
          Left = 6
          Top = 34
          Width = 36
          Height = 13
          Caption = #20303#38498#21495
          Color = 16640730
          ParentColor = False
          Transparent = True
        end
        object Label3: TLabel
          Left = 169
          Top = 34
          Width = 24
          Height = 13
          Caption = #22995#21517
          Color = 16640730
          ParentColor = False
          Transparent = True
        end
        object Label4: TLabel
          Left = 6
          Top = 58
          Width = 24
          Height = 13
          Caption = #26465#30721
          Color = 16640730
          ParentColor = False
          Transparent = True
        end
        object suiedtCH0A00: TsuiEdit
          Left = 47
          Top = 28
          Width = 114
          Height = 19
          UIStyle = WinXP
          BorderColor = 6842472
          TabOrder = 0
        end
        object suiedtBarCode: TsuiEdit
          Left = 47
          Top = 56
          Width = 114
          Height = 19
          UIStyle = WinXP
          BorderColor = 6842472
          TabOrder = 3
        end
        object suiedtCH0A02: TsuiEdit
          Left = 200
          Top = 28
          Width = 114
          Height = 19
          UIStyle = WinXP
          BorderColor = 6842472
          TabOrder = 1
        end
        object btnLocate: TAdvGlowButton
          Left = 203
          Top = 52
          Width = 100
          Height = 31
          Caption = #23450#20301
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
          TabOrder = 2
          OnClick = btnLocateClick
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
    object FlatPanel1: TFlatPanel
      Left = 522
      Top = 89
      Width = 501
      Height = 393
      Transparent = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentColor = True
      Align = alClient
      TabOrder = 3
      ExplicitWidth = 486
      ExplicitHeight = 429
      object FlatPanel2: TFlatPanel
        Left = 1
        Top = 1
        Width = 499
        Height = 32
        ParentColor = True
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 484
        object suichkCheckAll: TsuiCheckBox
          Tag = 201
          Left = 9
          Top = 5
          Width = 49
          Height = 26
          UIStyle = DeepBlue
          ParentFont = False
          AutoSize = True
          Checked = False
          Caption = #20840#36873
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          TabOrder = 0
          State = cbUnchecked
          Transparent = False
          OnClick = suichkAllClick
        end
        object suichkinverseAll: TsuiCheckBox
          Tag = 202
          Left = 68
          Top = 5
          Width = 49
          Height = 26
          UIStyle = DeepBlue
          ParentFont = False
          AutoSize = True
          Checked = False
          Caption = #21453#36873
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          TabOrder = 1
          State = cbUnchecked
          Transparent = False
          OnClick = suichkAllClick
        end
        object suichkAllCancle: TsuiCheckBox
          Tag = 203
          Left = 127
          Top = 5
          Width = 49
          Height = 26
          UIStyle = DeepBlue
          ParentFont = False
          AutoSize = True
          Checked = False
          Caption = #21462#28040
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          TabOrder = 2
          State = cbUnchecked
          Transparent = False
          OnClick = suichkAllClick
        end
      end
      object dbgrdhDest: TDBGridEh
        Left = 1
        Top = 33
        Width = 499
        Height = 319
        Align = alClient
        AutoFitColWidths = True
        DataGrouping.GroupLevels = <>
        DataSource = dsDest
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -12
        FooterFont.Name = #24494#36719#38597#40657
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
        ParentFont = False
        RowDetailPanel.Color = clBtnFace
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = #24494#36719#38597#40657
        TitleFont.Style = []
        Columns = <
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'chk'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #36873#25321
            Width = 33
          end
          item
            EditButtons = <>
            FieldName = 'Ch0A01'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #30149#26696#21495
          end
          item
            EditButtons = <>
            FieldName = 'CH0A00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20303#38498#21495
          end
          item
            EditButtons = <>
            FieldName = 'CH0A02'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #22995#21517
          end
          item
            EditButtons = <>
            FieldName = 'CH0A03'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #24615#21035
          end
          item
            EditButtons = <>
            FieldName = 'CH0A23'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20986#38498#31185#23460
          end
          item
            EditButtons = <>
            FieldName = 'CH0A27'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20986#38498#26085#26399
          end
          item
            EditButtons = <>
            FieldName = 'CH0A33'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20027#31649#21307#24072
          end>
        object RowDetailData: TRowDetailPanelControlEh
          object FlatPanel6: TFlatPanel
            Left = 0
            Top = 0
            Width = 561
            Height = 0
            Transparent = True
            ParentColor = True
            Align = alLeft
            TabOrder = 0
            object FlatPanel7: TFlatPanel
              Left = 1
              Top = 1
              Width = 559
              Height = 32
              ParentColor = True
              Align = alTop
              TabOrder = 0
              object suiCheckBox7: TsuiCheckBox
                Left = 9
                Top = 5
                Width = 45
                Height = 23
                UIStyle = DeepBlue
                AutoSize = True
                Checked = False
                Caption = #20840#36873
                TabOrder = 0
                State = cbUnchecked
                Transparent = False
              end
              object suiCheckBox8: TsuiCheckBox
                Left = 64
                Top = 5
                Width = 45
                Height = 23
                UIStyle = DeepBlue
                AutoSize = True
                Checked = False
                Caption = #21453#36873
                TabOrder = 1
                State = cbUnchecked
                Transparent = False
              end
              object FlatButton3: TFlatButton
                Left = 115
                Top = 5
                Width = 65
                Height = 25
                Caption = #20840#21462#28040
                TabOrder = 2
              end
            end
            object DBGridEh1: TDBGridEh
              Left = 1
              Top = 33
              Width = 559
              Height = 451
              Align = alClient
              DataGrouping.GroupLevels = <>
              Flat = True
              FooterColor = clWindow
              FooterFont.Charset = ANSI_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -15
              FooterFont.Name = #24494#36719#38597#40657
              FooterFont.Style = []
              RowDetailPanel.Color = clBtnFace
              TabOrder = 1
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -15
              TitleFont.Name = #24494#36719#38597#40657
              TitleFont.Style = []
              Columns = <
                item
                  Checkboxes = True
                  EditButtons = <>
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #36873#25321
                  Width = 33
                end
                item
                  EditButtons = <>
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #20303#38498#21495
                end
                item
                  EditButtons = <>
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #22995#21517
                end
                item
                  EditButtons = <>
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #24615#21035
                end
                item
                  EditButtons = <>
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #20986#38498#31185#23460
                end
                item
                  EditButtons = <>
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #20986#38498#26085#26399
                end
                item
                  EditButtons = <>
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #20027#31649#21307#24072
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
          end
        end
      end
      object FlatPanel8: TFlatPanel
        Left = 1
        Top = 352
        Width = 499
        Height = 40
        ParentColor = True
        Align = alBottom
        TabOrder = 2
        ExplicitTop = 388
        ExplicitWidth = 484
        object AdvbtnSave: TAdvGlowButton
          Left = 398
          Top = 1
          Width = 100
          Height = 38
          Hint = #20445#23384
          Align = alRight
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
          TabOrder = 0
          OnClick = AdvbtnSaveClick
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
          ExplicitLeft = 383
        end
      end
    end
    object FlatPanel3: TFlatPanel
      Left = 0
      Top = 89
      Width = 456
      Height = 393
      Transparent = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentColor = True
      Align = alLeft
      TabOrder = 1
      ExplicitHeight = 429
      object FlatPanel4: TFlatPanel
        Left = 1
        Top = 1
        Width = 454
        Height = 32
        ParentColor = True
        Align = alTop
        TabOrder = 0
        object suichkAll: TsuiCheckBox
          Tag = 101
          Left = 13
          Top = 5
          Width = 49
          Height = 26
          UIStyle = DeepBlue
          ParentFont = False
          AutoSize = True
          Checked = False
          Caption = #20840#36873
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          TabOrder = 0
          State = cbUnchecked
          Transparent = False
          OnClick = suichkAllClick
        end
        object suichkinverse: TsuiCheckBox
          Tag = 102
          Left = 72
          Top = 5
          Width = 49
          Height = 26
          UIStyle = DeepBlue
          ParentFont = False
          AutoSize = True
          Checked = False
          Caption = #21453#36873
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          TabOrder = 1
          State = cbUnchecked
          Transparent = False
          OnClick = suichkAllClick
        end
        object suichkCancle: TsuiCheckBox
          Tag = 103
          Left = 131
          Top = 5
          Width = 49
          Height = 26
          UIStyle = DeepBlue
          ParentFont = False
          AutoSize = True
          Checked = False
          Caption = #21462#28040
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          TabOrder = 2
          State = cbUnchecked
          Transparent = False
          OnClick = suichkAllClick
        end
      end
      object dbgrdhSource: TDBGridEh
        Left = 1
        Top = 33
        Width = 454
        Height = 359
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
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -12
        FooterFont.Name = #24494#36719#38597#40657
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
        ParentFont = False
        RowDetailPanel.Color = clBtnFace
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = #24494#36719#38597#40657
        TitleFont.Style = []
        Columns = <
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'chk'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #36873#25321
            Width = 33
          end
          item
            EditButtons = <>
            FieldName = 'Ch0A01'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #30149#26696#21495
          end
          item
            EditButtons = <>
            FieldName = 'CH0A00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20303#38498#21495
          end
          item
            EditButtons = <>
            FieldName = 'CH0A02'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #22995#21517
          end
          item
            EditButtons = <>
            FieldName = 'CH0A03'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #24615#21035
          end
          item
            EditButtons = <>
            FieldName = 'CH0A23'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20986#38498#31185#23460
          end
          item
            EditButtons = <>
            FieldName = 'CH0A27'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20986#38498#26085#26399
          end
          item
            EditButtons = <>
            FieldName = 'CH0A33'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20027#31649#21307#24072
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object FlatPanel5: TFlatPanel
      Left = 459
      Top = 89
      Width = 63
      Height = 393
      ParentColor = True
      Align = alLeft
      TabOrder = 2
      ExplicitHeight = 429
      object FlatbtnAllRight: TFlatButton
        Left = 24
        Top = 122
        Width = 25
        Height = 25
        Caption = '>>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = FlatbtnAllRightClick
      end
      object FlatbtnRight: TFlatButton
        Tag = 1
        Left = 24
        Top = 177
        Width = 25
        Height = 25
        Caption = '>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = FlatbtnAllRightClick
      end
      object FlatbtnLeft: TFlatButton
        Tag = 2
        Left = 24
        Top = 232
        Width = 25
        Height = 25
        Caption = '<'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = FlatbtnAllRightClick
      end
      object FlatbtnAllLeft: TFlatButton
        Tag = 3
        Left = 24
        Top = 287
        Width = 25
        Height = 25
        Caption = '<<'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = FlatbtnAllRightClick
      end
    end
  end
  inherited AdvOfficeStatusBarOfficeStyler1: TAdvOfficeStatusBarOfficeStyler
    Left = 176
    Top = 448
  end
  inherited AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler
    Left = 216
    Top = 448
  end
  inherited advfrmstylr1: TAdvFormStyler
    Left = 344
    Top = 440
  end
  inherited AdvPanelStyler1: TAdvPanelStyler
    Left = 312
    Top = 440
  end
  inherited dosm1: TDosMove
    Left = 264
    Top = 432
  end
  inherited DLCDS: TDlClientDataset
    Left = 136
    Top = 461
  end
  inherited al1: TActionList
    Left = 408
    Top = 421
  end
  inherited ds1: TDataSource
    DataSet = clientdtSource
    Left = 376
    Top = 445
  end
  object dsDest: TDataSource
    DataSet = clientdtDest
    Left = 560
    Top = 192
  end
  object clientdtDest: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 592
    Top = 192
    object clientdtDestchk: TBooleanField
      FieldName = 'chk'
    end
    object clientdtDestCH0A00: TStringField
      FieldName = 'CH0A00'
    end
    object clientdtDestCH0A02: TStringField
      FieldName = 'CH0A02'
    end
    object clientdtDestCH0A03: TStringField
      FieldName = 'CH0A03'
    end
    object clientdtDestCH0A23: TStringField
      FieldName = 'CH0A23'
    end
    object clientdtDestCH0A27: TStringField
      FieldName = 'CH0A27'
    end
    object clientdtDestCH0A33: TStringField
      FieldName = 'CH0A33'
    end
    object clientdtDestCh0A01: TStringField
      FieldName = 'Ch0A01'
    end
    object clientdtDestChYear: TStringField
      FieldName = 'ChYear'
    end
    object clientdtDestCH0ABarcode: TStringField
      FieldName = 'CH0ABarcode'
    end
  end
  object clientdtSource: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 264
    Top = 464
    object clientdtSourcechk: TBooleanField
      FieldName = 'chk'
    end
    object clientdtSourceCH0A00: TStringField
      FieldName = 'CH0A00'
    end
    object clientdtSourceCH0A02: TStringField
      FieldName = 'CH0A02'
    end
    object clientdtSourceCH0A03: TStringField
      FieldName = 'CH0A03'
    end
    object clientdtSourceCH0A23: TStringField
      FieldName = 'CH0A23'
    end
    object clientdtSourceCH0A27: TStringField
      FieldName = 'CH0A27'
    end
    object clientdtSourceCH0A33: TStringField
      FieldName = 'CH0A33'
    end
    object clientdtSourceCh0A01: TStringField
      FieldName = 'Ch0A01'
    end
    object clientdtSourceChYear: TStringField
      FieldName = 'ChYear'
    end
    object clientdtSourceCH0ABarcode: TStringField
      FieldName = 'CH0ABarcode'
    end
  end
  object dsLB: TDataSource
    DataSet = clientdtLB
    Left = 288
    Top = 336
  end
  object clientdtLB: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 320
    Top = 344
  end
end
