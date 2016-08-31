inherited frmBACancel: TfrmBACancel
  Caption = #30149#26696#27880#38144
  ClientHeight = 596
  ClientWidth = 1020
  OnCreate = FormCreate
  ExplicitWidth = 1036
  ExplicitHeight = 635
  PixelsPerInch = 96
  TextHeight = 13
  inherited advfcstsbr: TAdvOfficeStatusBar
    Top = 577
    Width = 1020
    ExplicitTop = 577
    ExplicitWidth = 869
  end
  inherited advtlbrpgr1: TAdvToolBarPager
    Width = 1020
    ExplicitWidth = 869
    inherited AdvPage1: TAdvPage
      Width = 1012
      ExplicitWidth = 1012
      inherited advtlbr1: TAdvToolBar
        inherited btnacIns: TAdvGlowButton
          Visible = False
        end
        inherited btnacIns1: TAdvGlowButton
          Visible = False
        end
        inherited btnacEdit: TAdvGlowButton
          Visible = False
        end
        inherited btnacClose: TAdvGlowButton
          Visible = False
        end
        inherited btnActLocate: TAdvGlowButton
          Visible = False
        end
      end
    end
  end
  inherited AdvPanel1: TAdvPanel
    Width = 1020
    Height = 485
    ExplicitWidth = 869
    ExplicitHeight = 485
    FullHeight = 200
    inherited dbgrdh_DLCDS: TDBGridEh
      Top = 121
      Width = 1020
      Height = 364
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghEnterAsTab, dghRowHighlight, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove]
      Columns = <
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'ZYNumber'
          Footers = <>
          TextEditing = False
          Title.Alignment = taCenter
          Title.Caption = #20303#38498#21495
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = #24494#36719#38597#40657
          Title.Font.Style = []
          Width = 112
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'name'
          Footers = <>
          TextEditing = False
          Title.Alignment = taCenter
          Title.Caption = #22995#21517
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = #24494#36719#38597#40657
          Title.Font.Style = []
          Width = 104
        end
        item
          Alignment = taCenter
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'age'
          Footers = <>
          TextEditing = False
          Title.Alignment = taCenter
          Title.Caption = #24180#40836
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = #24494#36719#38597#40657
          Title.Font.Style = []
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'CYKBmc'
          Footers = <>
          TextEditing = False
          Title.Alignment = taCenter
          Title.Caption = #20986#38498#31185#21035
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = #24494#36719#38597#40657
          Title.Font.Style = []
          Width = 135
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'ChiefDoctor'
          Footers = <>
          TextEditing = False
          Title.Alignment = taCenter
          Title.Caption = #20027#31649#21307#24072
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = #24494#36719#38597#40657
          Title.Font.Style = []
          Width = 119
        end
        item
          AutoFitColWidth = False
          Checkboxes = True
          EditButtons = <>
          FieldName = 'iscancel'
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #27880#38144
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = #24494#36719#38597#40657
          Title.Font.Style = []
          Width = 75
          OnUpdateData = dbgrdh_DLCDSColumns5UpdateData
        end>
    end
    object advgrp1: TAdvGroupBox
      Left = 0
      Top = 0
      Width = 1020
      Height = 121
      BorderColor = clBlue
      CaptionPosition = cpTopCenter
      Align = alTop
      Caption = #31579#36873#26465#20214
      TabOrder = 1
      ExplicitWidth = 869
      object lbl2: TLabel
        Left = 173
        Top = 32
        Width = 48
        Height = 13
        Caption = #20986#38498#26085#26399
        Color = 16640730
        ParentColor = False
        Transparent = True
      end
      object lbl5: TLabel
        Left = 334
        Top = 32
        Width = 48
        Height = 13
        Caption = #20986#38498#31185#23460
        Color = 16640730
        ParentColor = False
      end
      object lbl6: TLabel
        Left = 346
        Top = 93
        Width = 36
        Height = 13
        Caption = #20303#38498#21495
        Color = 16640730
        ParentColor = False
      end
      object lbl4: TLabel
        Left = 530
        Top = 32
        Width = 48
        Height = 13
        Caption = #20027#31649#21307#24072
        Color = 16640730
        ParentColor = False
      end
      object lbl7: TLabel
        Left = 530
        Top = 93
        Width = 48
        Height = 13
        Caption = #30149#20154#22995#21517
        Color = 16640730
        ParentColor = False
      end
      object lbl3: TLabel
        Left = 252
        Top = 62
        Width = 12
        Height = 13
        Caption = #33267
        Color = 16640730
        ParentColor = False
      end
      object edtzynumber: TsuiEdit
        Left = 388
        Top = 87
        Width = 121
        Height = 19
        UIStyle = WinXP
        BorderColor = 6842472
        TabOrder = 4
      end
      object advdtmpckrStart: TAdvDateTimePicker
        Left = 230
        Top = 27
        Width = 79
        Height = 21
        Date = 42232.434814814810000000
        Time = 42232.434814814810000000
        Kind = dkDate
        TabOrder = 0
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 42232.434814814810000000
        Version = '1.2.0.1'
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
      end
      object advdtmpckrEnd: TAdvDateTimePicker
        Left = 230
        Top = 85
        Width = 79
        Height = 21
        Date = 42598.434814814810000000
        Time = 42598.434814814810000000
        Kind = dkDate
        TabOrder = 1
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 42598.434814814810000000
        Version = '1.2.0.1'
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
      end
      object edtName: TsuiEdit
        Left = 584
        Top = 87
        Width = 121
        Height = 19
        UIStyle = WinXP
        BorderColor = 6842472
        TabOrder = 5
      end
      object edtChiefDoctor: TsuiEdit
        Left = 584
        Top = 29
        Width = 121
        Height = 19
        UIStyle = WinXP
        BorderColor = 6842472
        TabOrder = 3
      end
      object btnSel: TAdvGlowButton
        Left = 750
        Top = 73
        Width = 100
        Height = 33
        Caption = #26126#32454#26597#35810
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        Picture.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000004454944415478DAADD47B4C5B551800F0EFDC7BDBDE72298576B5AC0F
          1EBA802E734E434C1CEAA63CC6C6FE2073C61174B8A964D1C0FE50E37C84A8DB
          1F2EB2B8C9B231361F5BC81E66D1B8041D03B24496388CA2FD6364D97440A183
          625B58A18FFB3C9E03852C2E5016F892DB736F6EF3FDEEF9BE730E82FF4589CB
          5806086D63101420001B0688630D6E91B10D009F6F1F8AFD0DF7116836B193CF
          214F7BF41C7AC168C0169ED7214EAF07AC61902409C7454D89C6E19AAAE2FD1D
          BED8B9FB028A9D7C2E427028D58836D8EC16F6B16737A3554F1521ABDD892531
          8EFAAF7BA0E7F2053C70DDA385C6A4902869F50439B6608094A5D924A0EDB979
          F9DCD6DA4F993585CF81CE60A0AF31F903D2340D42A3C3F0E35707F1D59F4E6B
          23FE499F246BAF10A42B2950EC3496F30674D2E5B6A5577F789829585F0A8861
          491B10C531F945A44C3460327C079FDAFF1E745FFA411B0DC6CFB70F462B9302
          25AE94168B99DDB6AEE265B4E383CF91CEC003C3305333A35913D0D43DD6347C
          C3F33B1C7DFF55DCF7CF6DBF28A9E5ED43D1BFE605366409BD997663FECEFA23
          50B8710B4D472E066692528C7E3D79987A8E462671E3BBD5B8E7CA2FD29DB0B4
          F3C19CB473C7AE0CE339818DD9C2A8CB956EAD3D70065616AC4589A00A90DADF
          03A8AA828F7F52075DADDF2BC160ACEE917C6BF3979D5E3CDF0CFADC2E7356CD
          DE13F0C4BAD25920115325BA1B902411377DB40B7777FCAC84C662BBF2F36C27
          1B3BFBE7064ADCC2C5E576A16453F56ED852F30E6259D26086990566565A02C1
          C3DE3E7464CF0EADD7732D1C8988154E87B9EBDBDFE6291169F29B2693BEE1E1
          D5ABF46F7CDCC4B857E44F9587223429BD9F4EAE81A22870E19BC3B8E3EC51E8
          EF1FFDB56D60F2E9B26C015D1C88CC0D94BA531C64687138CCCF3CBAB608BD54
          5BCF64BA736066F12404906511BADB5B71E79943E0F30E81D7FB6F1759A6EB17
          B4D1C85E785EAF679B1D0E4B76EECAC751E1E64A266FCD9320A4A5634D51907F
          6800FEB8DC8A7BAFB6E1141E338AACE29B378714FFC8383D9BAA920209A48CE3
          D8BD164BEAEA0CAB99CDB06522C16CC1AA22A3707014C683410885C29A63793A
          6336713016F0E341DFA41C8933DF75F8E2D549011AA41F0F91A18A409B0CBC2E
          878C3CDD5E92A88C4B92FCA7AA6A3D1C07AF65087296605090AA010E4DE8E488
          4811B13A293013A5598295543F8BBC3691EE29A40923970623B7A63F822F273B
          E3A02555CE11788DA1487042274545A68520350B02EE8EB78A56A0606002CE7A
          FCB32BA5D869A86019A08893220A45C23A2926DD8B2405E60A826C254883C544
          10C32C2212E40441762F1A48202F720C7C41107B0A4554C081095D3C2E315F13
          A46ED14002A92233F9CC9A2667A6E82982484F383213B689ACAEB7170D24904A
          8E8506AB497EC048110DE140582FC525D4B824C034C2BFAE63F13E9B052D4B4F
          3340446491D717BBB164C00C424E847D9976D3B2684C418140A475498104B29D
          B4965C709B9C6107FE03BE552017689A3D920000000049454E44AE426082}
        TabOrder = 6
        OnClick = btnSelClick
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
      object btnMore: TAdvGlowButton
        Left = 750
        Top = 27
        Width = 100
        Height = 33
        Caption = #26356#22810#26465#20214
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        Picture.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000002644944415478DAED554D681341147E338969F622C94150880D620F31
          A9209A93D512A8782A88677B1349E2CF4111F1E845110F7A10ECE6A44241D06B
          3D88887F95E6D4804D40E24530E66045906E704B92797E938D669326CD16F122
          7D30999D37F3BEEFFDCD44D03F16B145E08120B71B7384484922C98E8EDBB3E0
          8E133C08021B4A746CC9BDAEE0C3D4046F3042CE61764526B8DB99DFC2EE2577
          EBB84D42CB44F533ED53E6316C3EEF00288C7A2F1075EF4B17BE0F639B7BAF46
          D4B84774EE8ACBDABC0CB01B30F04B69F0E8E884181909B1528A844E96105D4C
          DCCE22B4BCBA5AA16A35AF81757AE1193F20CAA6FB1439F7109BA7705086C37B
          281E9FA46030C08D8626581F8A0F8E5B9645A5D24BB6AC2FBA866B509788D287
          FAE4F50FC90B8499D2B98C46F7F3F8F841110C1AA414EB285AE567561408F8A8
          56AB8942615155AB1F75519B30FE4694D9D5D345BD6226A146242AEEF74B954C
          4E884422C612E28013F9FD826DDB06F87B2E160B9A1C5AF90AC659785F1E42D0
          2239A94341A17684C321954A1D11B158949A4D6ED5031188A5A5322F2C2C8268
          0DA9F1212D8C9C67DEAD6B621A28B317E1D535227B7B241251D3D387E5D8D84E
          4482FE5BFE4CF3F36F7965E53B5681AF00BF00F0C7FD5086DC64F32E484E83C4
          4824F6AA9999A3B25E6FD2DCDC6B552E7F9242183FD04DE8BCCCAD41081E9E0A
          F3098E9DD0ED3B35B50F85B5299FFF00BDF11375BA0FF0F31B597B20983D8063
          B731269DCBA76DF4A5E2A7F8390B82CA5F12B4488E235577F01177D65CC4C0C5
          CC3E1B66B989D734076FE93AD26263BE04F0475EAC36F95C9B571D93F44DAF16
          FFC51FCE16C1C6F20B75FEDB8928A197AF0000000049454E44AE426082}
        TabOrder = 7
        OnClick = btnMoreClick
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
      object pnl1: TPanel
        Left = 2
        Top = 16
        Width = 159
        Height = 103
        Align = alLeft
        BevelOuter = bvLowered
        Color = 16640730
        ParentBackground = False
        TabOrder = 8
        object lbl8: TLabel
          Left = 60
          Top = 11
          Width = 48
          Height = 31
          Caption = #26465#30721
          Color = 16640730
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object advedtBarCode: TAdvEdit
          Left = 6
          Top = 62
          Width = 149
          Height = 33
          EmptyTextStyle = []
          Flat = True
          FocusColor = clBtnFace
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Separator = ';'
          BorderStyle = bsNone
          Color = clBtnFace
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Visible = True
          OnKeyDown = advedtBarCodeKeyDown
          Version = '2.9.4.1'
        end
      end
      object advedtOffice: TAdvEdit
        Left = 388
        Top = 27
        Width = 121
        Height = 19
        EmptyText = #25353#31354#26684#38190#33719#21462#31185#23460
        EmptyTextStyle = []
        FocusColor = 16640730
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
        Lookup.Separator = ';'
        Color = clWindow
        TabOrder = 2
        Visible = True
        OnKeyDown = advedtOfficeKeyDown
        Version = '2.9.4.1'
      end
    end
  end
  inherited DLCDS: TDlClientDataset
    Left = 48
    Top = 261
  end
  inherited al1: TActionList
    Left = 112
    Top = 261
  end
  inherited ds1: TDataSource
    Left = 80
    Top = 261
  end
  inherited prntdbgrdh: TPrintDBGridEh
    Left = 152
    Top = 264
  end
  inherited dlgSave: TSaveDialog
    Left = 8
    Top = 272
  end
end
