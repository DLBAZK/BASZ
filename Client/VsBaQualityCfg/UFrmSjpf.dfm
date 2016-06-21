inherited frmSjpf: TfrmSjpf
  Caption = #30149#26696#25968#25454#35780#20998#35774#32622
  ClientHeight = 472
  ClientWidth = 811
  ExplicitWidth = 827
  ExplicitHeight = 510
  PixelsPerInch = 96
  TextHeight = 13
  inherited advfcstsbr: TAdvOfficeStatusBar
    Top = 453
    Width = 811
    ExplicitTop = 453
    ExplicitWidth = 811
  end
  inherited advtlbrpgr1: TAdvToolBarPager
    Width = 811
    Caption.Caption = #30149#26696#25968#25454#35780#20998#35774#32622
    ExplicitWidth = 811
    inherited AdvPage1: TAdvPage
      Width = 803
      ExplicitWidth = 803
    end
  end
  inherited AdvPanel1: TAdvPanel
    Width = 811
    Height = 361
    ExplicitWidth = 811
    ExplicitHeight = 361
    FullHeight = 200
    inherited dbgrdh_DLCDS: TDBGridEh
      Width = 811
      Height = 361
      Columns = <
        item
          Alignment = taCenter
          ButtonStyle = cbsEllipsis
          Checkboxes = True
          EditButtons = <>
          FieldName = 'isTy'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #20572#29992#26631#24535
          Title.TitleButton = True
          Width = 60
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'xh'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #39033#30446#24207#21495
          Title.TitleButton = True
          Width = 56
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'dm'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #39033#30446#20195#30721
          Title.TitleButton = True
          Width = 56
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'dmmc'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #39033#30446#21517#31216
          Title.TitleButton = True
          Width = 141
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'xmlx'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #39033#30446#31867#22411
          Width = 106
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'xmfz'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #39033#30446#20998#20540
          Title.TitleButton = True
          Width = 57
        end
        item
          EditButtons = <>
          FieldName = 'sSql'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #26465#20214'SQL'
          Title.TitleButton = True
          Width = 313
        end>
    end
  end
  inherited DLCDS: TDlClientDataset
    AfterInsert = DLCDSAfterInsert
  end
end
