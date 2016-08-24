inherited frmMoreTJ: TfrmMoreTJ
  BorderStyle = bsSingle
  Caption = #26356#22810#26465#20214
  ClientHeight = 259
  ClientWidth = 643
  Position = poScreenCenter
  OnCreate = FormCreate
  ExplicitWidth = 649
  ExplicitHeight = 288
  PixelsPerInch = 96
  TextHeight = 13
  inherited advfcstsbr: TAdvOfficeStatusBar
    Top = 240
    Width = 643
    ExplicitTop = 240
    ExplicitWidth = 643
  end
  inherited advtlbrpgr1: TAdvToolBarPager
    Width = 643
    CaptionButtons = [cbClose, cbMinimize]
    ExplicitWidth = 643
    inherited AdvPage1: TAdvPage
      Width = 635
      Height = 0
      ExplicitWidth = 635
      ExplicitHeight = 0
    end
  end
  inherited AdvPanel1: TAdvPanel
    Width = 643
    Height = 215
    ExplicitWidth = 643
    ExplicitHeight = 215
    FullHeight = 200
    object fltgrpbxCondition: TFlatGroupBox
      Left = 0
      Top = 0
      Width = 643
      Height = 164
      Align = alClient
      Caption = #26465#20214#31579#36873
      TabOrder = 0
      object lbl2: TLabel
        Left = 6
        Top = 28
        Width = 48
        Height = 13
        Caption = #20837#38498#26085#26399
        Color = 16640730
        ParentColor = False
        Transparent = True
      end
      object lbl3: TLabel
        Left = 153
        Top = 28
        Width = 12
        Height = 13
        Caption = #33267
        Color = 16640730
        ParentColor = False
      end
      object lbl5: TLabel
        Left = 276
        Top = 28
        Width = 48
        Height = 13
        Caption = #20837#38498#31185#23460
        Color = 16640730
        ParentColor = False
      end
      object lbl4: TLabel
        Left = 464
        Top = 28
        Width = 48
        Height = 13
        Caption = #20027#20219#21307#24072
        Color = 16640730
        ParentColor = False
      end
      object lbl1: TLabel
        Left = 6
        Top = 61
        Width = 48
        Height = 13
        Caption = #20027#27835#21307#24072
        Color = 16640730
        ParentColor = False
      end
      object lbl6: TLabel
        Left = 276
        Top = 61
        Width = 48
        Height = 13
        Caption = #20303#38498#21307#24072
        Color = 16640730
        ParentColor = False
      end
      object lbl7: TLabel
        Left = 6
        Top = 99
        Width = 24
        Height = 13
        Caption = #22995#21517
        Color = 16640730
        ParentColor = False
      end
      object lbl8: TLabel
        Left = 276
        Top = 99
        Width = 24
        Height = 13
        Caption = #24615#21035
        Color = 16640730
        ParentColor = False
        Transparent = True
      end
      object lbl9: TLabel
        Left = 464
        Top = 99
        Width = 24
        Height = 13
        Caption = #24180#40836
        Color = 16640730
        ParentColor = False
        Transparent = True
      end
      object lbl10: TLabel
        Left = 464
        Top = 132
        Width = 48
        Height = 13
        Caption = #32852#31995#30005#35805
        Color = 16640730
        ParentColor = False
        Transparent = True
      end
      object lbl11: TLabel
        Left = 6
        Top = 132
        Width = 35
        Height = 13
        Caption = #30149#20154'ID'
        Color = 16640730
        ParentColor = False
      end
      object lbl12: TLabel
        Left = 276
        Top = 132
        Width = 36
        Height = 13
        Caption = #30149#26696#21495
        Color = 16640730
        ParentColor = False
        Transparent = True
      end
      object advdtmpckrEnd: TAdvDateTimePicker
        Left = 178
        Top = 20
        Width = 79
        Height = 21
        Date = 42598.434814814810000000
        Time = 42598.434814814810000000
        Kind = dkDate
        TabOrder = 0
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
      object advdtmpckrStart: TAdvDateTimePicker
        Left = 60
        Top = 20
        Width = 79
        Height = 21
        Date = 42232.434814814810000000
        Time = 42232.434814814810000000
        Kind = dkDate
        TabOrder = 1
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
      object edtDrectorDoctor: TsuiEdit
        Left = 518
        Top = 22
        Width = 121
        Height = 19
        UIStyle = WinXP
        BorderColor = 6842472
        TabOrder = 2
      end
      object edtAttendingDoctor: TsuiEdit
        Left = 60
        Top = 55
        Width = 121
        Height = 19
        UIStyle = WinXP
        BorderColor = 6842472
        TabOrder = 3
      end
      object edtResidentDoctor: TsuiEdit
        Left = 330
        Top = 55
        Width = 121
        Height = 19
        UIStyle = WinXP
        BorderColor = 6842472
        TabOrder = 4
      end
      object edtName: TsuiEdit
        Left = 60
        Top = 93
        Width = 121
        Height = 19
        UIStyle = WinXP
        BorderColor = 6842472
        TabOrder = 5
      end
      object cbbGender: TAdvOfficeComboBox
        Left = 330
        Top = 93
        Width = 121
        Height = 19
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
        Style = csDropDownList
      end
      object edtAge: TsuiEdit
        Left = 518
        Top = 93
        Width = 121
        Height = 19
        UIStyle = WinXP
        BorderColor = 6842472
        TabOrder = 7
      end
      object edtPhone: TsuiEdit
        Left = 518
        Top = 123
        Width = 121
        Height = 19
        UIStyle = WinXP
        BorderColor = 6842472
        TabOrder = 8
      end
      object edtPatientID: TsuiEdit
        Left = 60
        Top = 129
        Width = 121
        Height = 19
        UIStyle = WinXP
        BorderColor = 6842472
        TabOrder = 9
      end
      object edtBANumber: TsuiEdit
        Left = 330
        Top = 129
        Width = 121
        Height = 19
        UIStyle = WinXP
        BorderColor = 6842472
        TabOrder = 10
      end
      object advedtOffice: TAdvEdit
        Left = 330
        Top = 22
        Width = 121
        Height = 21
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
        TabOrder = 11
        Visible = True
        OnKeyDown = advedtOfficeKeyDown
        Version = '2.9.4.1'
      end
    end
    object advpnlBom: TAdvPanel
      Left = 0
      Top = 164
      Width = 643
      Height = 51
      Align = alBottom
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
      object btnClose: TAdvGlowButton
        Left = 557
        Top = 15
        Width = 80
        Height = 30
        Caption = #36864#20986
        ModalResult = 2
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        Picture.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C000003AD69545874584D4C3A636F6D2E61646F62652E786D7000
          000000003C3F787061636B657420626567696E3D22EFBBBF222069643D225735
          4D304D7043656869487A7265537A4E54637A6B633964223F3E203C783A786D70
          6D65746120786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A
          786D70746B3D2241646F626520584D5020436F726520352E302D633036302036
          312E3133343737372C20323031302F30322F31322D31373A33323A3030202020
          2020202020223E203C7264663A52444620786D6C6E733A7264663D2268747470
          3A2F2F7777772E77332E6F72672F313939392F30322F32322D7264662D73796E
          7461782D6E7323223E203C7264663A4465736372697074696F6E207264663A61
          626F75743D222220786D6C6E733A786D705269676874733D22687474703A2F2F
          6E732E61646F62652E636F6D2F7861702F312E302F7269676874732F2220786D
          6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F78
          61702F312E302F6D6D2F2220786D6C6E733A73745265663D22687474703A2F2F
          6E732E61646F62652E636F6D2F7861702F312E302F73547970652F5265736F75
          726365526566232220786D6C6E733A786D703D22687474703A2F2F6E732E6164
          6F62652E636F6D2F7861702F312E302F2220786D705269676874733A4D61726B
          65643D2246616C73652220786D704D4D3A4F726967696E616C446F63756D656E
          7449443D22757569643A41453346343630383846383944453131413836303939
          463132314132303432392220786D704D4D3A446F63756D656E7449443D22786D
          702E6469643A3845414536304137423545463131453042414133424245344437
          4231333531442220786D704D4D3A496E7374616E636549443D22786D702E6969
          643A384541453630413642354546313145304241413342424534443742313335
          31442220786D703A43726561746F72546F6F6C3D2241646F62652050686F746F
          73686F70204353352057696E646F7773223E203C786D704D4D3A446572697665
          6446726F6D2073745265663A696E7374616E636549443D22786D702E6969643A
          3332454239343444454642354530313139414234414644393033394633354542
          222073745265663A646F63756D656E7449443D22757569643A41453346343630
          38384638394445313141383630393946313231413230343239222F3E203C2F72
          64663A4465736372697074696F6E3E203C2F7264663A5244463E203C2F783A78
          6D706D6574613E203C3F787061636B657420656E643D2272223F3E28E17B7400
          0003734944415478DAC4975F4853511CC77FDBAECB7453672C89A834852C3408
          89E8A1A28191589112253D84D21F9F2229244A492D53E9210B0A7A305404C312
          AC500A0C5F324249882C4B0A06420F254D4D736EEA6EDFBB9DCD7BEFB67BB7B5
          D1810FF772EFDDF97DCFF7FC7E67E768789EA7FFD938DFDD85EC487EBF1198C1
          4844D1EF7E5911C0BB549D580DF24111286481E56D00F4832E6055EB50237640
          41800E9C037541828A9B85D1083A410DF8169200D77240015BC033760DB79D04
          C79888A6401F682502965CF2F707C11360F8871CD333378401940367D0249439
          B08F8D5C1FA5642F653954125CC08A03196CE4FA2857DC09300A6EAA09680D21
          D9226DF5A00FBCF713B0BCE81650C8EC8F65BB050E8813D15786A08E5D03C2ED
          B090FED059A27883FF7B2D47719612373CBA55E8271F58BC652F5E07F270C90B
          9ACE7B8B28F1E27DF7FDAAC3E5347BF528B97E4C78EA3921898C371E932E73BB
          675469E964EF68504BCA01B903F98AA3DFBA53F8CA8D764D1A191B7A4863DE00
          378C64B8DE85E0B9BEF7C2B74A7D81C2400EEC56926CEF6D27FDFEE3A4D1C77B
          46694AA32488704DFD246E33828B56527BCF03B5A53D95559B55E4006D03148C
          25EB67FA5D8DF975CCFB1E6A53D712979923F970AEB9821C6F5E90525F8C2CF9
          1418546C23E7C7219AA98288058870B9FC98BD5D41F6FE2E35FBBD98A502785E
          27EC0DD4588413CB135FFD82BBA626C9F9699842E9C38BDC811935D542F9A5D4
          7610979E2DACDD12B4C61432D53F42056C0AD5019B4C008D29CD19E913C854DB
          4E71593992C0FCC29F1511263344749216D511420E8CCB1D78ABA438B1B81CC1
          7325B64F375792ED5AA924277410613C5DA53A7A6095E740BFF29C49E77CFA4E
          25CDBFEA26C7E810FDAA299326E6D2A2DAFC3FF7E680681D70EFEB4682AD8673
          DD2DC4ADCB206DB289E69EB6D2C2F080EF9DE3C3304D5E2EA1E4539730241D4D
          B7347AA62D786BF3ED8ABC4ABEEF49F5FE19F5C6F8CFE82528106ED6BFB6891C
          F008E9636BB42546C191AD7425E07E406459197817A33D41B5782F204942121C
          F030018A8153F42C1A748226C933691548180405C016A5F86DA04CFE5C5E8672
          06C02E3016CEF22AC30ECE0304E79D8A4B7190261C2A845DC619A150C29CEF87
          4038EFDD0BED6CA89CB942671DEC6876845549967CA90083AC927A4215CC8531
          2227EBBC4FB6B110AA653CD2B2D0FCEFE3F95F0106001DD9CFB7B68412400000
          000049454E44AE426082}
        TabOrder = 0
        OnClick = btnCloseClick
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
      object btnOK: TAdvGlowButton
        Left = 421
        Top = 15
        Width = 80
        Height = 30
        Caption = #30830#23450
        ModalResult = 1
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        Picture.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C000003AD69545874584D4C3A636F6D2E61646F62652E786D7000
          000000003C3F787061636B657420626567696E3D22EFBBBF222069643D225735
          4D304D7043656869487A7265537A4E54637A6B633964223F3E203C783A786D70
          6D65746120786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A
          786D70746B3D2241646F626520584D5020436F726520352E302D633036302036
          312E3133343737372C20323031302F30322F31322D31373A33323A3030202020
          2020202020223E203C7264663A52444620786D6C6E733A7264663D2268747470
          3A2F2F7777772E77332E6F72672F313939392F30322F32322D7264662D73796E
          7461782D6E7323223E203C7264663A4465736372697074696F6E207264663A61
          626F75743D222220786D6C6E733A786D705269676874733D22687474703A2F2F
          6E732E61646F62652E636F6D2F7861702F312E302F7269676874732F2220786D
          6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F78
          61702F312E302F6D6D2F2220786D6C6E733A73745265663D22687474703A2F2F
          6E732E61646F62652E636F6D2F7861702F312E302F73547970652F5265736F75
          726365526566232220786D6C6E733A786D703D22687474703A2F2F6E732E6164
          6F62652E636F6D2F7861702F312E302F2220786D705269676874733A4D61726B
          65643D2246616C73652220786D704D4D3A4F726967696E616C446F63756D656E
          7449443D22757569643A41453346343630383846383944453131413836303939
          463132314132303432392220786D704D4D3A446F63756D656E7449443D22786D
          702E6469643A3845463132323738423545463131453042414133424245344437
          4231333531442220786D704D4D3A496E7374616E636549443D22786D702E6969
          643A384546313232373742354546313145304241413342424534443742313335
          31442220786D703A43726561746F72546F6F6C3D2241646F62652050686F746F
          73686F70204353352057696E646F7773223E203C786D704D4D3A446572697665
          6446726F6D2073745265663A696E7374616E636549443D22786D702E6969643A
          3332454239343444454642354530313139414234414644393033394633354542
          222073745265663A646F63756D656E7449443D22757569643A41453346343630
          38384638394445313141383630393946313231413230343239222F3E203C2F72
          64663A4465736372697074696F6E3E203C2F7264663A5244463E203C2F783A78
          6D706D6574613E203C3F787061636B657420656E643D2272223F3E42CDE08200
          0003144944415478DAC4974F4854411CC7675D5992A240583A0485B8B8D52102
          0FB2E6220842210405517452E8D2A16B281AEEAE8126748B6E921005D1210C84
          4078F4C7E892D04105A1B235F6142C088264FB76FACEDB37BBF366E6FD739FB8
          F87BDFDFCCF8DEE7CD6F7E33F32646292587F96BE5CEE3D51BB85609A5306212
          424D4B695D2B68B7CBF0EDBAD3D0247485FF9F759F78AFFD3CA6C4F269AD0E1D
          9FCDFE6DBC4000781BCA83F0AFA16E089AE46D02DC80BF04FF1574D30BCE23DF
          C2F11EF038E077512EC25F40DDB00B9CF903F0A7A13FF1BC17F053EE70F905F4
          F034E06B283F7540F57039ECB7A16B808FEAE04A0434F0CB807F4539ED800683
          F3B027804244AACF004C8870FE02AD620404783FE00B28279A808B61C7B0D136
          54DEE2704D0ED4E11D80BF8E10CEC37E133ADE7801A2E6809DED089735B5A284
          73FF21EC22ABD244C082637A99FD0704E73D9FD546C05E64F2070C678AB5840C
          70AA9803DD80754701672B9C0B9CF77C58CD015A198C02FE28BB8B52D50BCE74
          4897849966E133D99D5A9BD5EE0A67D60EEB902370DE0B9EEB29BAC28FC44F90
          E9EC76035E7F012D9C5B4A8EC031AF9E574985E4325B0A3C46E26422F3C36A17
          CD07CE2C294720EE1576FEE05CEF6F073CDF5752E0F78DE37E70BE173966C1B6
          E798937F75CB5D2A9244CB5192EBFBE5A867366AB40782E3AF2C0FC1BA57C2C9
          BD1CEB5D55EB8C9341E1CCDF9077C32F5ED95EF8DCA900451B374E858197E16C
          CA43B0E437D50A9F525AF803E34C183873DEEAD601F65DB7E2B7BC4E7DEC724C
          B749A3332C9CE93CD52CC50C3419646D2FBC4FD7D606A36B3FF077900F9A5960
          F57C116A04D958F2C6B9FDC04DC818E1EDEAF780D5F3113CF64F805D2D2C9CC9
          042EDFC4A388230276CFB7E05F07602F62F84B5C66C4FBA469E808FB32EC0A2A
          CB11C1E7711991E1D21028638E4306ED81AD3701DF85DCB3E17B325C4D4275CC
          BFC32EC0BD032D8584CF41CEC27FA2EBB97236F44838133A077D8E46F6397595
          7D52B1ED5482EFC05F86839944DEA05C12B3DDED0CEC78019F8443525A0F5F14
          7A8E9D87E0C44436A4312741E0EC173BECE3F97F010600D5B48504EE64C93700
          00000049454E44AE426082}
        TabOrder = 1
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
    end
  end
  inherited DLCDS: TDlClientDataset
    Left = 40
    Top = 269
  end
  inherited al1: TActionList
    Left = 104
    Top = 269
  end
  inherited ds1: TDataSource
    Left = 72
    Top = 269
  end
end
