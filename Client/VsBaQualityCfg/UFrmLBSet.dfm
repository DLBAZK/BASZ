inherited frmLBSet: TfrmLBSet
  Caption = #30149#26696#35780#20215#31867#21035#35774#32622
  PixelsPerInch = 96
  TextHeight = 13
  inherited AdvPanel1: TAdvPanel
    FullHeight = 200
    inherited dbgrdh_DLCDS: TDBGridEh
      Columns = <
        item
          EditButtons = <>
          FieldName = 'dm'
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #31867#21035#20195#30721
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = #24494#36719#38597#40657
          Title.Font.Style = []
          Width = 68
        end
        item
          EditButtons = <>
          FieldName = 'dmmc'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #31867#21035#21517#31216
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = #24494#36719#38597#40657
          Title.Font.Style = []
          Width = 160
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'isChoice'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #20840#37096#30149#21382
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = #24494#36719#38597#40657
          Title.Font.Style = []
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'isTy'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #20572#29992#26631#24535
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = #24494#36719#38597#40657
          Title.Font.Style = []
        end>
    end
  end
  inherited DLCDS: TDlClientDataset
    AfterInsert = DLCDSAfterInsert
    Top = 229
  end
  inherited al1: TActionList
    Left = 96
    Top = 237
  end
  inherited ds1: TDataSource
    Left = 64
    Top = 237
  end
  inherited prntdbgrdh: TPrintDBGridEh
    Left = 168
    Top = 272
  end
  inherited dlgSave: TSaveDialog
    Left = 128
    Top = 264
  end
end
