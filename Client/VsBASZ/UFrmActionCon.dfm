inherited frmActionCon: TfrmActionCon
  Caption = #27969#36716#21160#20316#33258#23450#20041#37197#32622
  ClientWidth = 959
  ExplicitWidth = 975
  ExplicitHeight = 434
  PixelsPerInch = 96
  TextHeight = 13
  inherited advfcstsbr: TAdvOfficeStatusBar
    Width = 959
    ExplicitWidth = 959
  end
  inherited advtlbrpgr1: TAdvToolBarPager
    Width = 959
    ExplicitWidth = 959
    inherited AdvPage1: TAdvPage
      Width = 951
      ExplicitWidth = 951
      inherited advtlbr1: TAdvToolBar
        Width = 712
        ExplicitWidth = 712
        inherited advtlbrsprtr2: TAdvToolBarSeparator
          Left = 600
          ExplicitLeft = 600
        end
        inherited btnacEdit1: TAdvGlowButton
          Left = 659
          ExplicitLeft = 659
        end
        inherited btnActLocate: TAdvGlowButton
          Left = 551
          Visible = False
          ExplicitLeft = 551
        end
        inherited btnacSave: TAdvGlowButton
          Left = 610
          ExplicitLeft = 610
        end
        object btnUp: TAdvGlowButton
          Left = 453
          Top = 2
          Width = 49
          Height = 47
          Action = actUp
          ImageIndex = 30
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
        object btnDown: TAdvGlowButton
          Left = 502
          Top = 2
          Width = 49
          Height = 47
          Action = actDown
          ImageIndex = 31
          FocusType = ftHot
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          TabOrder = 13
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
    Width = 959
    ExplicitWidth = 959
    FullHeight = 200
    inherited dbgrdh_DLCDS: TDBGridEh
      Width = 959
      Columns = <
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'prioritynum'
          Footers = <>
          TextEditing = False
          Title.Alignment = taCenter
          Title.Caption = #39034#24207
          Title.SortIndex = 1
          Title.SortMarker = smUpEh
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'DM'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #20195#30721
          Width = 91
        end
        item
          EditButtons = <>
          FieldName = 'MC'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #21517#31216
          Width = 132
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'ActionDicDM'
          Footers = <>
          TextEditing = False
          Title.Alignment = taCenter
          Title.Caption = ' '#25351#23450#21160#20316
          Width = 119
        end
        item
          Alignment = taCenter
          Checkboxes = True
          EditButtons = <>
          FieldName = 'BZ'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #20572#29992
          OnUpdateData = dbgrdh_DLCDSColumns4UpdateData
        end>
    end
  end
  inherited DLCDS: TDlClientDataset
    AfterInsert = DLCDSAfterInsert
  end
  inherited al1: TActionList
    object actUp: TAction
      Caption = #19978#31227
      ImageIndex = 30
      OnExecute = actUpExecute
    end
    object actDown: TAction
      Caption = #19979#31227
      ImageIndex = 31
      OnExecute = actDownExecute
    end
  end
end
