inherited frmDBFTable: TfrmDBFTable
  Caption = 'DBF'#19978#25253#25968#25454#28304#34920
  ClientHeight = 515
  ClientWidth = 744
  ExplicitWidth = 760
  ExplicitHeight = 554
  PixelsPerInch = 96
  TextHeight = 13
  inherited advfcstsbr: TAdvOfficeStatusBar
    Top = 496
    Width = 744
    ExplicitTop = 496
    ExplicitWidth = 744
  end
  inherited advtlbrpgr1: TAdvToolBarPager
    Width = 744
    TabOrder = 1
    ExplicitWidth = 744
    inherited AdvPage1: TAdvPage
      Width = 736
      ExplicitWidth = 736
      inherited advtlbr1: TAdvToolBar
        Width = 663
        ExplicitWidth = 663
        inherited advtlbrsprtr2: TAdvToolBarSeparator
          Left = 551
          ExplicitLeft = 551
        end
        inherited btnacEdit1: TAdvGlowButton
          Left = 610
          ExplicitLeft = 610
        end
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
        inherited btnacSave: TAdvGlowButton
          Left = 561
          ExplicitLeft = 561
        end
        object btnTableSql: TAdvGlowButton
          Left = 502
          Top = 2
          Width = 49
          Height = 47
          Action = actTableSql
          AntiAlias = aaNone
          ImageIndex = 27
          FocusType = ftHot
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          TabOrder = 12
          Appearance.BorderColor = 14727579
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15653832
          Appearance.ColorTo = 16178633
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = clNone
          Appearance.ColorDisabledTo = clNone
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 16245200
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = clNone
          Appearance.ColorMirrorDisabledTo = clNone
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
          Layout = blGlyphTop
        end
      end
    end
  end
  inherited AdvPanel1: TAdvPanel
    Width = 744
    Height = 404
    ExplicitWidth = 744
    ExplicitHeight = 404
    FullHeight = 200
    inherited dbgrdh_DLCDS: TDBGridEh
      Width = 744
      Height = 404
      AutoFitColWidths = True
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghEnterAsTab, dghRowHighlight, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghAutoFitRowHeight]
      OnDblClick = dbgrdh_DLCDSDblClick
      Columns = <
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'TableName'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #34920#21517
          Width = 104
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'TableCus'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #21035#21517
          Width = 78
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'TableDesc'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #34920#35828#26126
          Width = 122
        end
        item
          EditButtons = <>
          Footers = <>
          TextEditing = False
          Title.Alignment = taCenter
          Title.Caption = #20851#32852#34920
          Visible = False
          Width = 56
        end
        item
          EditButtons = <>
          FieldName = 'TableRel'
          Footers = <>
          TextEditing = False
          Title.Alignment = taCenter
          Title.Caption = #20851#32852#34920#36798#24335
          Width = 406
        end>
    end
  end
  inherited al1: TActionList
    object actTableSql: TAction
      Caption = #34920'SQL'
      ImageIndex = 27
      OnExecute = actTableSqlExecute
    end
  end
end
