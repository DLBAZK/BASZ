inherited frmRevokeB: TfrmRevokeB
  Caption = #27969#36716#25764#38144#22522#31867
  ClientHeight = 590
  ClientWidth = 916
  OnCreate = FormCreate
  ExplicitWidth = 932
  ExplicitHeight = 629
  PixelsPerInch = 96
  TextHeight = 13
  inherited advfcstsbr: TAdvOfficeStatusBar
    Top = 571
    Width = 916
    ExplicitTop = 571
    ExplicitWidth = 916
  end
  inherited advtlbrpgr1: TAdvToolBarPager
    Width = 916
    ExplicitWidth = 916
    inherited AdvPage1: TAdvPage
      Width = 908
      Height = 0
      ExplicitWidth = 908
      ExplicitHeight = 0
    end
  end
  inherited AdvPanel1: TAdvPanel
    Width = 916
    Height = 546
    ExplicitWidth = 916
    ExplicitHeight = 546
    FullHeight = 200
    object advpnl1: TAdvPanel
      Left = 0
      Top = 0
      Width = 916
      Height = 137
      Align = alTop
      BevelOuter = bvNone
      Color = 16640730
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      UseDockManager = True
      Version = '2.1.1.0'
      BorderColor = clGray
      Caption.Color = 14059353
      Caption.ColorTo = 9648131
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clWhite
      Caption.Font.Height = -11
      Caption.Font.Name = 'Tahoma'
      Caption.Font.Style = []
      Caption.GradientDirection = gdVertical
      Caption.Indent = 2
      Caption.ShadeLight = 255
      CollapsColor = clNone
      CollapsDelay = 0
      ColorTo = 14986888
      ShadowColor = clBlack
      ShadowOffset = 0
      StatusBar.BorderColor = clNone
      StatusBar.BorderStyle = bsSingle
      StatusBar.Font.Charset = DEFAULT_CHARSET
      StatusBar.Font.Color = clWhite
      StatusBar.Font.Height = -11
      StatusBar.Font.Name = 'Tahoma'
      StatusBar.Font.Style = []
      StatusBar.Color = 14716773
      StatusBar.ColorTo = 16374724
      StatusBar.GradientDirection = gdVertical
      Styler = AdvPanelStyler1
      FullHeight = 137
      object lbl2: TLabel
        Left = 4
        Top = 17
        Width = 48
        Height = 13
        Caption = #20986#38498#26085#26399
        Color = 16640730
        ParentColor = False
        Transparent = True
      end
      object lbl3: TLabel
        Left = 151
        Top = 15
        Width = 12
        Height = 13
        Caption = #33267
        Color = 16640730
        ParentColor = False
      end
      object lbl4: TLabel
        Left = 192
        Top = 40
        Width = 48
        Height = 13
        Caption = #20027#31649#21307#24072
        Color = 16640730
        ParentColor = False
      end
      object lbl5: TLabel
        Left = 4
        Top = 42
        Width = 48
        Height = 13
        Caption = #20986#38498#31185#23460
        Color = 16640730
        ParentColor = False
      end
      object lbl6: TLabel
        Left = 4
        Top = 75
        Width = 36
        Height = 13
        Caption = #20303#38498#21495
        Color = 14986888
        ParentColor = False
      end
      object lbl7: TLabel
        Left = 192
        Top = 75
        Width = 48
        Height = 13
        Caption = #30149#20154#22995#21517
        Color = 14986888
        ParentColor = False
      end
      object lbl1: TLabel
        Left = 392
        Top = 17
        Width = 48
        Height = 13
        Caption = #25764#38144#21407#22240
        Color = 16640730
        ParentColor = False
      end
      object lbl8: TLabel
        Left = 392
        Top = 42
        Width = 24
        Height = 13
        Caption = #26465#30721
        Color = 16640730
        ParentColor = False
      end
      object advdtmpckrStart: TAdvDateTimePicker
        Left = 58
        Top = 9
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
        Left = 176
        Top = 9
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
      object edtChiefDoctor: TsuiEdit
        Left = 246
        Top = 40
        Width = 121
        Height = 19
        UIStyle = WinXP
        BorderColor = 6842472
        TabOrder = 2
      end
      object cbbOffice: TAdvOfficeComboBox
        Left = 58
        Top = 40
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
        TabOrder = 3
        Style = csDropDownList
      end
      object edtzynumber: TsuiEdit
        Left = 58
        Top = 69
        Width = 121
        Height = 19
        UIStyle = WinXP
        BorderColor = 6842472
        TabOrder = 4
      end
      object edtName: TsuiEdit
        Left = 246
        Top = 69
        Width = 121
        Height = 19
        UIStyle = WinXP
        BorderColor = 6842472
        TabOrder = 5
      end
      object btnSel: TAdvGlowButton
        Left = 86
        Top = 94
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
        Left = 267
        Top = 94
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
      object cbbReason: TAdvOfficeComboBox
        Left = 456
        Top = 11
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
        TabOrder = 8
        Style = csDropDownList
      end
      object edtBarcode: TsuiEdit
        Left = 456
        Top = 40
        Width = 121
        Height = 19
        UIStyle = WinXP
        BorderColor = 6842472
        TabOrder = 9
        OnKeyDown = edtBarcodeKeyDown
      end
      object btnRevoke: TAdvGlowButton
        Left = 456
        Top = 94
        Width = 100
        Height = 33
        Caption = #25764#38144
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
          702E6469643A3933353637383638423545463131453042414133424245344437
          4231333531442220786D704D4D3A496E7374616E636549443D22786D702E6969
          643A393335363738363742354546313145304241413342424534443742313335
          31442220786D703A43726561746F72546F6F6C3D2241646F62652050686F746F
          73686F70204353352057696E646F7773223E203C786D704D4D3A446572697665
          6446726F6D2073745265663A696E7374616E636549443D22786D702E6969643A
          3332454239343444454642354530313139414234414644393033394633354542
          222073745265663A646F63756D656E7449443D22757569643A41453346343630
          38384638394445313141383630393946313231413230343239222F3E203C2F72
          64663A4465736372697074696F6E3E203C2F7264663A5244463E203C2F783A78
          6D706D6574613E203C3F787061636B657420656E643D2272223F3E71FD104500
          0003794944415478DAC4975D48145114C7CFBA6A2E1A8B862159463D942F8652
          8196426845D21785204992B1102842810882D1431844BE240952285A51148460
          107D4B81A10982F4D007586166198B9AA22EADF3D1FFEEDEDDBD333BB3331AE4
          81DFB2E7DEB9670EE79E73EE1D87AAAAB49212472B2CF181DFB3D94B59530BDA
          802C8C1D014360DCB695968F9108A88A6A972C7015B40B6305E01EF02CC18E76
          0B145935A31A640A7A3970822AD00E72C063E0021E3E47C2339966B6355BA0CA
          A6895809AE81072C68A05C98F3800AE0E27A163808D24003D80A36DACA014556
          CCE6A78093BFB8DC60DEA5D37B9695848A64EAC0CC7FA90239E240152810E673
          4D17161E27E7969D24F5F790FC61C0ECB16ABE254C7CA04E573DA10884736004
          745A799D78B486569D68081A28AE205FB387A4A1E7468F3608FF3BF42F8F38B0
          188E401FA73066D8761CD0EAF987C93FF0D4CAEF56F31C50345570113C8B692A
          2191350F211593F536F4F21A0C9B3AC01B43062FAD339699A32841C2BAB6B918
          082BD146701B7C8B3A0BB0F80AF80E9A78B78BDDC5645983CA88BD6613B73D0A
          5E02B73E0297F9BE17D8291D3510015913118B08905009CD6279871C600DA704
          DC01C7ACB74062B51BD179042C640E94F2248FDA02860F74D8394894292F9124
          85917F8DD93980DA409FE161C4EE24A00C74F3FF3199EFBE4EAA6F3E100565DA
          4B0B8F6E928D75F5A031A487C4C16E44137BD3D9A1728BF77D5BE24C5B4BCEF4
          4C92C6BF9032B7A48E7D03D464BCF0CA620E20A6D405CA80DBCA82233E811273
          8B281E0EC873B3A4CEFEB6FBF2614E4A28110311F8B1674DB8CB827AD014CB4A
          6AED2572E5EF0B5684FF0F791B4F92F47334D612D6A7CF83C1D0C0BA5793C29D
          500DE30759826E48525E61B00A80C3E9A4A46DBBC8624D0A18D48C195401231D
          545A65B434F659D38816A15BAC61D7B662A32B5930072269596570C98892C9D6
          0B947AAA8EE29257D3C2DB5EF2BD1BB0B3FFEC64EC8DCA27F6F2B1DDA9217DBB
          EE32D26975325A74BD2221B77278A2FBD9C08637D3C2B53C1292219D11372D5F
          5C3A7BFDA61F26769A0F7862E3997E9DEE367B56E7806A860CBA4036280543C2
          DC081816F4195002368316AEBBCD6CDBFD346307D469F049B85631F1F283653F
          78CFC71EF27DFF0ACE81F560E25FBF0DA774FA5D3E7688DF1FBDDC49E6E07D83
          D3CF6FEFDBD0BEB0CAC8D3DD6A26B81313CBC954C74A7F9EFF15600070E68403
          AA517D270000000049454E44AE426082}
        TabOrder = 10
        OnClick = btnRevokeClick
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
      object btnacClose: TAdvGlowButton
        Left = 624
        Top = 94
        Width = 100
        Height = 33
        Action = acClose
        ImageIndex = 1
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        TabOrder = 11
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
    object advgrpLeft: TAdvGroupBox
      Left = 0
      Top = 137
      Width = 916
      Height = 409
      Align = alClient
      Caption = #24453#25764#38144#21015#34920
      TabOrder = 1
      object dbgrdhleft: TDBGridEh
        Left = 2
        Top = 16
        Width = 912
        Height = 391
        Align = alClient
        DataGrouping.GroupLevels = <>
        DataSource = ds1
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghAutoFitRowHeight]
        RowDetailPanel.Color = clBtnFace
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'ZYNumber'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20303#38498#21495
            Width = 79
          end
          item
            AutoFitColWidth = False
            BiDiMode = bdLeftToRight
            EditButtons = <>
            FieldName = 'Name'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #22995#21517
          end
          item
            EditButtons = <>
            FieldName = 'CYRQ'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20986#38498#26085#26399
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'CYKBmc'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20986#38498#31185#21035
            Width = 73
          end
          item
            EditButtons = <>
            FieldName = 'ChiefDoctor'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20027#31649#21307#24072
            Width = 82
          end
          item
            EditButtons = <>
            FieldName = 'StateDesc'
            Footers = <>
            TextEditing = False
            Title.Alignment = taCenter
            Title.Caption = #29366#24577
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  inherited DLCDS: TDlClientDataset
    Top = 269
  end
  inherited al1: TActionList
    Left = 112
    Top = 269
  end
  inherited ds1: TDataSource
    Left = 64
    Top = 269
  end
end
