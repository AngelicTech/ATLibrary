inherited DNAReactivationDlg: TDNAReactivationDlg
  Caption = 'Product Re-Activation'
  ClientHeight = 460
  ExplicitWidth = 566
  ExplicitHeight = 489
  PixelsPerInch = 96
  TextHeight = 13
  inherited bevFooterDivide: TdxBevel
    Top = 396
    ExplicitTop = 400
    ExplicitWidth = 560
  end
  inherited pnlButtons: TPanel
    Top = 400
    ExplicitTop = 400
    object btnForgotPwd: TcxButton
      AlignWithMargins = True
      Left = 12
      Top = 12
      Width = 170
      Height = 36
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 12
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'I Forgot My Password!'
      OptionsImage.ImageIndex = 10
      OptionsImage.Images = ilstDlg
      OptionsImage.Spacing = 12
      TabOrder = 2
      OnClick = ForgotPwdButtonClicked
    end
  end
  inherited gbxInstruct: TcxGroupBox
    Top = 260
    ExplicitTop = 260
    ExplicitHeight = 120
    Height = 120
    inherited lblInstructCap: TcxLabel
      Caption = 'This code has already been activated!'
      Style.IsFontAssigned = True
    end
    inherited lblInstruct: TcxLabel
      Caption = 
        'Please confirm that you wish to re-activate it by entering your ' +
        'current password and then a new, never-before used password. Ple' +
        'ase note that you are required to change your password during re' +
        '-activation for your own security. If you have forgotten your cu' +
        'rrent password you can retrieve it using the "I Forgot My Passwo' +
        'rd!" button below.'
      ExplicitHeight = 81
      Height = 81
    end
  end
  inherited gpnlContents: TGridPanel
    Height = 228
    ExplicitHeight = 228
    inherited imgLogo: TImage
      Height = 228
      ExplicitHeight = 218
    end
    inherited pnlContents: TPanel
      Height = 228
      ExplicitHeight = 228
      inherited gbxInfo: TcxGroupBox
        Caption = 'Authentication'
        ExplicitHeight = 228
        Height = 228
        object bevContentSep: TdxBevel
          AlignWithMargins = True
          Left = 18
          Top = 79
          Width = 326
          Height = 4
          Margins.Left = 16
          Margins.Top = 12
          Margins.Right = 16
          Margins.Bottom = 0
          Align = alTop
          Shape = dxbsLineBottom
          ExplicitLeft = 0
          ExplicitTop = 376
          ExplicitWidth = 550
        end
        object txtCurrentPwd: TcxButtonEdit
          AlignWithMargins = True
          Left = 18
          Top = 43
          Margins.Left = 16
          Margins.Top = 0
          Margins.Right = 16
          Margins.Bottom = 0
          Align = alTop
          AutoSize = False
          PopupMenu = puDlgEdit
          Properties.Buttons = <
            item
              Action = actShowCurrPwd
              Kind = bkGlyph
              Width = 24
            end
            item
              Action = actClearCurrPwd
              Kind = bkGlyph
              Width = 24
            end>
          Properties.EchoMode = eemPassword
          Properties.Images = ilstDlg
          TabOrder = 1
          TextHint = 'Please enter your CURRENT password.'
          Height = 24
          Width = 326
        end
        object lblCurrentPwd: TcxLabel
          AlignWithMargins = True
          Left = 18
          Top = 26
          Margins.Left = 16
          Margins.Top = 8
          Margins.Right = 16
          Margins.Bottom = 0
          Align = alTop
          Caption = 'Current Password:'
          FocusControl = txtCurrentPwd
          Transparent = True
        end
        object txtConfirmPassword: TcxButtonEdit
          AlignWithMargins = True
          Left = 18
          Top = 157
          Margins.Left = 16
          Margins.Top = 0
          Margins.Right = 16
          Margins.Bottom = 0
          Align = alTop
          AutoSize = False
          PopupMenu = puDlgEdit
          Properties.Buttons = <
            item
              Action = actShowConfPwd
              Kind = bkGlyph
              Width = 24
            end
            item
              Action = actClearConfPwd
              Kind = bkGlyph
              Width = 24
            end>
          Properties.EchoMode = eemPassword
          Properties.Images = ilstDlg
          TabOrder = 5
          TextHint = 'Please confirm your NEW password.'
          Height = 24
          Width = 326
        end
        object lblConfirmNewPwd: TcxLabel
          AlignWithMargins = True
          Left = 18
          Top = 140
          Margins.Left = 16
          Margins.Top = 8
          Margins.Right = 16
          Margins.Bottom = 0
          Align = alTop
          Caption = 'Confirm New Password:'
          FocusControl = txtConfirmPassword
          Transparent = True
          ExplicitTop = 144
        end
        object txtNewPassword: TcxButtonEdit
          AlignWithMargins = True
          Left = 18
          Top = 108
          Margins.Left = 16
          Margins.Top = 0
          Margins.Right = 16
          Margins.Bottom = 0
          Align = alTop
          AutoSize = False
          PopupMenu = puDlgEdit
          Properties.Buttons = <
            item
              Action = actShowNewPwd
              Kind = bkGlyph
              Width = 24
            end
            item
              Action = actClearNewPwd
              Kind = bkGlyph
              Width = 24
            end>
          Properties.EchoMode = eemPassword
          Properties.Images = ilstDlg
          TabOrder = 2
          TextHint = 'Please enter a NEW password.'
          Height = 24
          Width = 326
        end
        object lblNewPassword: TcxLabel
          AlignWithMargins = True
          Left = 18
          Top = 91
          Margins.Left = 16
          Margins.Top = 8
          Margins.Right = 16
          Margins.Bottom = 0
          Align = alTop
          Caption = 'New Password:'
          FocusControl = txtNewPassword
          Transparent = True
        end
      end
    end
  end
  inherited ilstDlg: TcxImageList
    FormatVersion = 1
    DesignInfo = 11010080
    ImageInfo = <
      item
        Image.Data = {
          2F0200005844424D020004023604850000424D36040000000000003600000028
          0000000210000000830100200000000000000400000500000000820101044705
          0711700A0000000087060914750101044700000000010104473C58C1F64261D8
          FF05081373080000000085060915774261D8FF3C58C3F701010447070B177B03
          4261D8FF810508137306000000008106091577034261D8FF83070A177A000000
          00070B1A7F034261D8FF810508137304000000008106091577034261D8FF8107
          0B197E030000000081070B1A7F034261D8FF8105081373020000000081060915
          77034261D8FF81070B197E050000000081070B1A7F034261D8FF820508137306
          091577034261D8FF81070B197E070000000081070B1A7F064261D8FF81070B19
          7E090000000081070B1A7F044261D8FF81070B197E0A00000000810609157704
          4261D8FF810609137409000000008106091577064261D8FF8106091374070000
          00008106091577034261D8FF82070B197E070B1A7F034261D8FF810609137405
          000000008106091577034261D8FF81070B187D020000000081070B1A7F034261
          D8FF810609137403000000008106091577034261D8FF81070B187D0400000000
          81070B1A7F034261D8FF83060913740000000006091475034261D8FF81070B18
          7D060000000081070B1A7F034261D8FF85050813720102054D3E5BC9F94261D8
          FF070B187D080000000087070B1A7F4261D8FF3E5BC9F90102064E0000000001
          02054D070A177A0A0000000083070B177B0102054D00000000}
        Mask.Data = {
          2E0000005844424D02000100817E030083424D7E0700813E0300812803008110
          03008110030083010001050081400B0081020B0003FF4100}
      end
      item
        Image.Data = {
          530200005844424D020004023604850000424D36040000000000003600000028
          000000021000000083010020000000000000040000280000000083010101381C
          1C1C994F4F4FD9027B7B7BFA834F4F4FD91C1C1C990101013806000000008500
          000019A8A8A8FF9F9F9FFFCECECEFFEDEDEDFF02FDFDFDFF85EDEDEDFFCECECE
          FF3E3E3EC72D2D2DB400000019030000000086010101358E8E8EFFC3C3C3FFFF
          FFFFFFFBF7F4FFE5D2BFFF02C89E73FF8DE5D2BFFFFBF7F4FFFFFFFFFFC3C3C3
          FF646464EA010101350000000000000022676767ECD0D0D0FFFFFFFFFFFBF7F4
          FFD1AD8AFF04B8824BFF88D1AD8AFFFBF7F4FFFFFFFFFFD0D0D0FF676767EC00
          0000222B2B2BB1C7C7C7FF02FFFFFFFF81E5D2BFFF06B8824BFF81E5D2BFFF02
          FFFFFFFF840C0C0C742B2B2BB1777777F7FBFBFBFF02FFFFFFFF81C89E73FF06
          B8824BFF81C89E73FF02FFFFFFFF81FBFBFBFF02777777F781FBFBFBFF02FFFF
          FFFF81C89E73FF03B8824BFF06FFFFFFFF84FBFBFBFF777777F7303030B8CACA
          CAFF02FFFFFFFF81E5D2BFFF03B8824BFF06FFFFFFFF88CACACAFF303030B800
          0000296C6C6CF0D5D5D5FFFFFFFFFFFBF7F4FFD1AD8AFF02B8824BFF05FFFFFF
          FF8BD5D5D5FF6C6C6CF000000029000000000101013F6B6B6BEFC7C7C7FFFFFF
          FFFFFBF7F4FFE5D2BFFFC89E73FF04FFFFFFFF83C7C7C7FF6B6B6BEF0101013F
          03000000008500000021323232BAA0A0A0FFCFCFCFFFEDEDEDFF02FCFCFCFF85
          EDEDEDFFCFCFCFFFA0A0A0FF323232BA000000210600000000830101013A1D1D
          1D9B969696FF02878787FF83515151DA1D1D1D9B0101013A2400000000}
        Mask.Data = {
          2E0000005844424D02000100817E030083424D7E0700813E0300812803008110
          03008110030083010001050081400B0081020B0003FF4100}
      end
      item
        Image.Data = {
          F90300005844424D020004023604850000424D36040000000000003600000028
          0000000210000000830100200000000000000400000700000000890000000200
          0000070000000C0000001000000012000000110000000E000000080000000205
          0000000085000000010000000400000012020806790D2E1FC6021F6949FF861F
          6A49FF113726D2030C08840000001500000005000000010300000000FD000000
          050000003514432FDC22805AFF27AC7CFF2AC592FF2BC894FF2BC693FF28AE80
          FF23855EFF113A29D40000003D00000007000000010000000000000003000000
          311A563DED279D72FF2DC896FF2CC996FF54D4ACFF66DAB5FF39CD9DFF2EC996
          FF30CA99FF29A477FF1F684AF80000003D00000005000000000000000A113827
          D02CA57AFF31CA99FF2CC896FF4AD2A8FF1E835AFF006539FF43BE96FF2FCB99
          FF2FCB98FF32CC9CFF2FAD83FF123D2BD300000013000000020104025E2C8A64
          FF39CD9EFF2ECA97FF49D3A9FF32956FFF87AF9DFFB1CFC1FF218A5EFF43D3A8
          FF34CF9FFF31CD9BFF3CD0A3FF2F946EFF030B087F000000070C261BB63BB38C
          FF37CD9FFF49D5A9FF41A382FF679782FFF8F1EEFFF9F3EEFF337D5BFF54C4A1
          FF41D5A8FF3CD3A4FF3AD1A4FF3FBC95FF103A2ACD0000000B144B34DF49CAA4
          FF42D2A8FF4DB392FF4C8268FFF0E9E6FFC0C3B5FFEFE3DDFFCEDDD4FF19734D
          FF5EDCB8FF46D8ACFF45D6AAFF4FD4ACFF207252F80000000E1D6346F264D9B8
          FF44D3A8FF09653FFFD2D2CBFF688F75FF0F6941FF71967CFFF1E8E3FF70A28B
          FF44A685FF5CDFBAFF4AD9AFFF69E2C2FF25845EFF00000019154C36DC76D9BE
          FF50DAB1FF3BBA92FF07673FFF2D9C74FF55DEB8FF2B9971FF71967CFFF0EAE7
          FF4D886AFF58BB9AFF59DEB9FF7DE2C7FFA1237B59F80000000C0A241AAB75C8
          B0FF60E0BCFF54DDB7FF57DFBAFF5AE1BDFF5CE2BEFF5DE4C1FF268C65FF678E
          74FFE6E1DCFF156945FF5DD8B4FF83D5BDFF113D2CC60000000900020147419C
          79FF95ECD6FF58DFBAFF5CE2BDFF5FE4BFFF62E6C1FF65E6C5FF65E8C7FF37A1
          7CFF1D6B48FF268B62FF98EFD9FF4BAC8CFF0209076D02000000048E0D2F22B5
          76C6ADFF9AEED9FF63E5C0FF62E7C3FF67E7C6FF69E8C8FF6AE9C9FF69EAC9FF
          5CD6B6FF97EDD7FF86D3BBFF164F3BD20000000C02000000018E000000181958
          41DA6EC1A8FFB5F2E3FF98F0DAFF85EDD4FF73EBCEFF88EFD6FF9CF2DDFFBAF4
          E7FF76CDB3FF22795AEA0000002E0000000202000000008D0000000100000017
          0F3528B842AB87FF85D2BBFFA8E6D6FFC5F4EBFFABE9D8FF89D8C1FF49B692FF
          154F3CCB000000270000000304000000008B0000000100000003000201410923
          1A9D175640CF258866EE175843CF0E3428B00105045600000006000000020300
          000000}
        Mask.Data = {
          2E0000005844424D02000100817E030083424D7E0700813E0300812803008110
          03008110030083010001050081400B0081020B0003FF4100}
      end
      item
        Image.Data = {
          100400005844424D020004023604850000424D36040000000000003600000028
          00000002100000008301002000000000000004000006000000008C0000000200
          00000C00000146070324AB13085CE31B0C89FF1A0C89FF13085DE4080325AD00
          00024D0000000E000000030300000000C60000000300000019070324A91F1393
          FF2023AEFF222EC2FF2333CBFF2333CCFF222EC3FF2023AFFF1F1394FF09042A
          B20000001E00000004000000000000000200000015110B47CD2320A6FF2B3BCC
          FF3749D3FF3243D1FF2737CDFF2637CDFF3142D0FF3748D4FF2B3ACDFF2321A8
          FF120B4AD20000001D00000003000000090A0726A72825AAFF2D3FD0FF333FC7
          FF2524ABFF2F35BCFF3648D3FF3649D3FF2F35BCFF2524ABFF333EC7FF2C3ED0
          FF2725ACFF0B072CB10000000D0000013D2F27A0FD2A3ACCFF3640C6FF5D5BBD
          FFEDEDF8FF8B89CEFF3135B9FF3235B9FF8B89CEFFEDEDF8FF5D5BBDFF353FC6
          FF2938CDFF2E26A4FF0000024A0B08249F3539BCFF2E40D0FF241FA5FFECE7EC
          FFF5EBE4FFF8F2EEFF029491D1FFCEF8F1EDFFF3E9E2FFECE6EBFF241FA5FF2C
          3DCFFF3238BEFF0F0B30B0241F70E03340CBFF3244D1FF2A2DB5FF806EADFFEB
          DBD3FFF4EAE4FFF7F2EDFFF8F1EDFFF4E9E2FFEADAD1FF7D6DACFF292CB5FF2F
          42D0FF2E3ECBFF262178E53A33A6FA3446D0FF3548D3FF384CD5FF3032B4FF8A
          7DB9FFF6ECE7FFF5ECE6FFF4EBE5FFF6EBE5FF897BB8FF3031B4FF3649D3FF33
          45D2FF3244D1FF3A33A6FA413BACFA4355D7FF394ED5FF4A5DDAFF4141B7FF91
          89C7FFF7EFE9FFF6EEE9FFF6EFE8FFF7EDE8FF9087C5FF4040B7FF475BD8FF37
          4AD4FF3D50D4FF403BABFA2F2C78DC5765DAFF596CDDFF4D4BBAFF8F89CAFFFB
          F6F4FFF7F1ECFFEDE1D9FFEDE0D9FFF7F0EAFFFAF5F2FF8F89CAFF4C4BB9FF55
          68DCFF5563D9FF312F80E1100F27987A85DDFF8798E8FF271B9BFFE5DADEFFF6
          EEEBFFEDDFDAFF02816CA9FFC6EDDFD8FFF4ECE7FFE5D9DCFF271B9BFF8494E7
          FF7881DDFF161537AC000001356364CAFC9EACEDFF666DCEFF5444A1FFCCB6BC
          FF7866A8FF4A48B6FF4B49B7FF7866A8FFCBB5BCFF5444A1FF646BCCFF9BAAEE
          FF6568CCFD0000023F00000004141429977B84DFFFA5B6F1FF6B72D0FF2B1F9B
          FF4F4FB9FF8EA2ECFF8EA1ECFF5050BBFF2B1F9BFF6970D0FFA2B3F0FF8086E0
          FF1A1B38A700000008000000010000000C292A55BC8087E2FFAEBDF3FFA3B6F1
          FF9DAFF0FF95A9EEFF95A8EEFF9BADEFFFA2B3F0FFACBCF3FF838AE3FF2C2D5B
          C100000011000000020000000000000001000000050A0B16796B70CDF8929CEA
          FFA1AEEFFFB0BFF3FFB0BFF4FFA2AEEFFF939DE9FF6C71CEF80B0C177D000000
          0800000002040000000084000000030000012D141528933C3F78D0026F74D9FC
          853C3F78D0151629950000013000000004000000010200000000}
        Mask.Data = {
          2E0000005844424D02000100817E030083424D7E0700813E0300812803008110
          03008110030083010001050081400B0081020B0003FF4100}
      end
      item
        Image.Data = {
          F80200005844424D020004023604850000424D36040000000000003600000028
          0000000210000000830100200000000000000400001600000000811B254E9C0E
          00000000861C264F9D4362D8FF242F5CAB060606382F2F2F995E5E5ED9027E7E
          7EFA835E5E5ED92F2F2F9906060638060000000085283463B34362D8FFD5DBF2
          FFCECECEFFEDEDEDFF02FDFDFDFF85EDEDEDFFCECECEFF505050C7414141B401
          0101190300000000A105050535FFFFFFFFD6DCF2FF4362D8FFD4DAF1FFFCF9F7
          FFD0AD8AFFC19162FFD4B494FFEDE0D2FFFFFFFFFFC3C3C3FF6E6E6EEA050505
          350000000002020222707070ECD0D0D0FFFFFFFFFFD4DAF1FF4362D8FFCAD1ED
          FFF9F5F1FFCAA179FFB8824CFFC5996CFFEDE0D2FFFFFFFFFFD0D0D0FF707070
          EC020202223F3F3FB1C7C7C7FF02FFFFFFFF88FCF9F7FFCCD2EDFF4362D8FFCA
          D1EDFFF9F5F1FFCAA179FFB8824CFFD4B494FF02FFFFFFFF841B1B1B743F3F3F
          B17C7C7CF7FBFBFBFF02FFFFFFFF88D0AC88FFF9F5F1FFCCD2EDFF4362D8FFCA
          D1EDFFF9F5F1FFCAA179FFC19162FF02FFFFFFFF81FBFBFBFF027C7C7CF781FB
          FBFBFF02FFFFFFFF88C19162FFC9A077FFF9F5F1FFCCD2EDFF4362D8FFCAD1ED
          FFF9F5F1FFD0AD8AFF02FFFFFFFF84FBFBFBFF7C7C7CF7444444B8CACACAFF02
          FFFFFFFF88D4B494FFB8824CFFC9A077FFF9F5F1FFCCD2EDFF4362D8FFCAD1ED
          FFFCF9F7FF02FFFFFFFFA1CACACAFF444444B803030329747474F0D5D5D5FFFF
          FFFFFFEDE0D2FFC5996CFFB8824CFFC9A077FFF9F5F1FFCCD2EDFF4362D8FFD3
          D9F1FFFFFFFFFFD5D5D5FF747474F003030329000000000808083F737373EFC7
          C7C7FFFFFFFFFFEDE0D2FFD4B494FFC19162FFD0AC88FFFCF9F7FFD4DAF1FF43
          62D8FFD5DBF2FFE0E0E0EF0808083F03000000008502020221454545BAA0A0A0
          FFCFCFCFFFEDEDEDFF02FCFCFCFF85EDEDEDFFCFCFCFFFD6DCF2FF4362D8FF29
          3665B60600000000830606063A3030309B969696FF02878787FF86606060DA30
          30309B0606063A232F5AAA4362D8FF1C264F9D0E00000000811B254E9C120000
          0000}
        Mask.Data = {
          2E0000005844424D02000100817E030083424D7E0700813E0300812803008110
          03008110030083010001050081400B0081020B0003FF4100}
      end
      item
        Image.Data = {
          BD0300005844424D020004023604850000424D36040000000000003600000028
          0000000210000000830100200000000000000400000500000000820000000300
          00000E0200000018820000000F00000004020000000082000000030000000E02
          000000188A0000000F0000000400000000000000030000001A341705A57A350A
          EE793409EF331503A70000001C0200000003960000001A341705A57A350AEE79
          3409EF331503A70000001C0000000300000009351D0C9BB8753AFFF1BF6DFFF1
          BD6AFFB56E32FF331908A10000000C00000009331A0A9BB76E33FFEEA456FFED
          A353FFB3662BFF331908A1020000000C969D6033EEF6CE8FFFC08B56FFD2A26C
          FFF3C983FF8F4F22F0000000140000001096572BEFF4B774FFB57946FFC8905A
          FFF0B069FF8F4E22EF0000001000000009AA7242EDFAE3BFFFA26537FFAE7444
          FFF8DEB5FFAC6937FF020000002AA7B77643FFF9D4A9FF97582EFFA36539FFF7
          CFA0FF9A5F31EE0000000D00000004402D1C90DFAE7DFFF4DDC1FFF3DDC0FFDE
          B58BFFCB9C75FF66362AFF5F3125FFD0A179FFE1B58AFFF4D5B3FFF3D4B1FFD4
          9F6DFF3B28189300000006000000010000000B3F2F1E8EC28F5CF2D69F68FFE0
          BA94FFE6CBB4FFF0DED4FF9E786CFFCAAB94FFDDB591FFD29963FFB98555F33D
          2C1C910000000D0000000102000000008D000000030000000A150E0C66AA8374
          FBF9F4F2FFF2E2D9FFE4CDC4FF977167FF84594CFB0F07056F00000010000000
          040000000104000000008A000000010000000C3F2922B2B58B7DFFFAF5F3FFF4
          E5DCFFB7998EFF2F1913B40000000F0000000106000000008A00000003070504
          429F7365FDDECAC2FFB89388FFF8F3F1FFF3E7DFFF895E53FD0502023F000000
          0305000000008C000000010000000F6E4A3FD8E6D1C9FFEFE5E1FF69463BE077
          5148DFF6F1EEFFDFCFC6FF512F26D70000000E0000000104000000008C000000
          042C1E1A8ACCAEA3FFF0E5E1FF593C32C80000001E000000195A3D35C5F4EEEC
          FFB99B93FF1E110D8800000004030000000096000000020705043BB38B7BFBEE
          E2DDFF473029B00000001000000002000000010000000C432C24ACF2EAE7FF91
          675BFD050202390000000200000000000000010000000B7C5A4FD6EBDED9FF35
          252094000000070000000202000000008D00000001000000042F1F1A91ECE3E0
          FF56342BD50000000A000000010000000230231E85EBDCD6FF21181472000000
          0500000001050000000084000000021B120F6FE9DFDCFF1F120E840200000002
          84644940BB150F0D59000000030000000107000000008400000001100A095749
          2F27BA00000001}
        Mask.Data = {
          2E0000005844424D02000100817E030083424D7E0700813E0300812803008110
          03008110030083010001050081400B0081020B0003FF4100}
      end
      item
        Image.Data = {
          CD0300005844424D020004023604850000424D36040000000000003600000028
          0000000210000000830100200000000000000400000500000000830000000200
          0000090000000E020000000F0200000010020000001183000000100000000B00
          000003040000000086000000085D3E33C0AD715DFFAC715CFFAC705CFFAC6E5A
          FF02AB6F5BFF84AB6D5BFFAB6D59FF5C3B31C30000000B04000000008C000000
          0BAF7361FFFDFBF9FFFBF6F2FFFBF5F2FFFAF5F1FFFBF4EFFFF9F3EEFFF9F2EE
          FFFAF2ECFFAC705CFF0000000F0400000000870000000BB17863FFFDFBFAFFF7
          EEE7FFF8EDE7FFF7EDE7FFF7EDE6FF02F6ECE5FF8BFAF2EEFFAE715FFF000000
          20000000100000000B00000003000000000000000BB37B68FFFDFCFBFFF8EFE8
          FF02F7EEE8FF9DF8EEE7FFF7EEE7FFF7ECE6FFFAF3EFFFB07762FFC19D92FFB5
          7C69FF63443BC30000000B000000000000000AB57E6BFFFEFCFBFFF9F0EAFFF8
          F0EAFFF8EFE9FFF8EFE8FFF8EEE9FFF8EEE7FFFBF5F1FFB27965FFEBE6E2FFFA
          F3EDFFB6806CFF0000000F0000000000000009B9826FFFFEFDFCFF02F9F2EDFF
          A1F9F0EBFFF9F0EAFFF8F0EAFFF8F0E9FFFBF6F3FFB37C69FFE9E1DAFFFAF3EF
          FFB8816FFF000000100000000000000008BB8774FFFEFDFDFFFAF3EFFFFAF4EE
          FFFAF3EEFFFAF1ECFFF9F1EBFFF9F0EBFFFCF8F5FFB6806CFFEAE1DBFFFAF4F0
          FFB98672FF0000000F0000000000000007BF8B77FFFEFEFDFFFBF5F1FFFBF5F0
          FFFBF4F0FF02FAF3EFFF8EF9F3EDFFFCF9F7FFBA8470FFECE4DDFFFBF5F2FFBB
          8875FF0000000E0000000000000007C18E7DFFFEFEFDFFFAF5F3FFFBF6F2FFFB
          F5F1FF02FBF5F0FF8BFAF4EFFFFDFAF8FFBC8977FFEDE7E0FFFBF6F4FFBC8B79
          FF0000000D0000000000000006C49382FFFEFEFEFF02FBF6F4FF02FCF6F3FF8C
          FCF4F2FFFBF5F1FFFDFBF9FFBF8C7BFFEFE8E3FFFCF8F5FFBF8E7BFF0000000D
          0000000000000005C49785FFFFFEFEFF03FEFEFEFF81FEFEFDFF02FEFDFDFF9D
          FEFDFCFFC2907EFFF0EBE6FFFCF9F7FFC29180FF0000000C0000000000000003
          71554BC0C89988FFC99887FFC79887FFC59786FFC79785FFC79784FFC59684FF
          C59683FFCDA79AFFF4EFEAFFFDFAF8FFC49686FF0000000B0000000000000001
          00000003000000040000000BD8BBB0FFF8F8F8FF02F5F0EFFF02F5EFEDFF85F7
          F0EEFFFAF4F1FFFDFBF9FFC7998AFF0000000A04000000008300000005CCA392
          FFFFFEFEFF03FEFEFEFF81FEFEFDFF02FEFDFDFF83FEFDFCFFCA9D8DFF000000
          0904000000008C00000003745C53C0CEA495FFCFA494FFCDA494FFCCA393FFCD
          A392FFCDA391FFCCA291FFCCA290FF735A51C200000006}
        Mask.Data = {
          2E0000005844424D02000100817E030083424D7E0700813E0300812803008110
          03008110030083010001050081400B0081020B0003FF4100}
      end
      item
        Image.Data = {
          7C0300005844424D020004023604850000424D36040000000000003600000028
          0000000210000000830100200000000000000400000900000000830000000300
          00000C0000001002000000110200000012020000001382000000100000000405
          000000008B0000000BA97462FFA87361FFA77160FFA5705EFFA56F5DFFA36E5C
          FFA36C5BFFA26C5AFFA26B59FF0000000F0500000000870000000DAB7765FFFD
          FBF8FFF7EFE8FFF6EFE6FFF6EEE6FFF5EEE5FF02F5EDE4FF82A36C5BFF000000
          1302000000008E1B395CB7326BB1FF316AB0FF2D62A6FFAD7B69FFFDFCFAFFF7
          F0E9FFF7F0E8FFF7EFE7FFF6EFE7FFF6EEE6FFF5EEE5FFA46E5CFF0000001202
          000000008E3875B8FF91D2F4FF65BEEEFF5FB5E4FFB07E6CFFFEFDFCFFF7F2EA
          FFF8F1E9FFF7F0E9FFF6F0E8FFF6EFE7FFF6EFE6FFA6715FFF00000011020000
          00008E3E7CBCFF9AD6F5FF6BC3F0FF65B8E5FFB2806FFFFEFEFDFFF8F3ECFFF8
          F2EBFFF7F1EAFFF7F1E9FFF7F0E8FFF7EFE8FFA87462FF000000100200000000
          8E4284C1FFA4DBF6FF72C7F1FF6BBEE8FFB48472FFFFFFFEFFF9F3EEFFF9F3ED
          FFF9F2ECFFF8F2EBFFF7F1EAFFF7F0E9FFAB7665FF0000000F02000000008E47
          8BC5FFADE1F8FF79CCF2FF72C3E9FFB68675FFFFFFFFFFF9F5EEFFF9F4EEFFF9
          F3EDFFF8F3ECFFF8F2EBFFF7F2EBFFAC7969FF0000000E0200000000874B92CA
          FFB6E6FAFF81D2F4FF79C9EBFFB88877FFFFFFFFFFFAF5F0FF02F9F5EFFF85F9
          F4EEFFF9F3EDFFF9F3ECFFAF7D6BFF0000000D0200000000854F98CDFFBEE9FA
          FF88D6F6FF81CEEEFFBB8B7AFF06FFFFFFFF83FDFCFAFFB1816EFF0000000C02
          000000008E529DD1FFC5EDFBFF8FDBF7FF89D5F2FFBD8D7CFFBB8C7BFFBA8B7A
          FFB98978FFB98976FFB78875FFB68673FFB58372FFB38370FF00000009020000
          00008A55A1D4FFCBF0FCFF95E0F8FF82CBE9FF71B7D9FF70B7D9FF6FB7DAFF6F
          B8DBFF6EB7DBFF4285BBFF020000000982000000080000000202000000008A57
          A5D7FFCBEDF8FF72B2D0FF5692B7FF5793B7FF5895BAFF5A99BDFF61A3C9FF68
          AFD4FF4084BBFF06000000008A58A8D9FFBCDBE7FF8E7774FF9B6F60FF94695A
          FF8F6355FF885C4FFF7A6462FF97BCD3FF478EC4FF06000000008A315D78BD49
          90BFFFB48E7EFFF3EDE7FFDEC9B8FFDDC8B5FFDBC4B2FF976F5FFF3A7AAEFF2F
          5975BD080000000086644E46BDB69181FFB69080FFB58E7EFFB28C7CFF5C463E
          BD0600000000}
        Mask.Data = {
          2E0000005844424D02000100817E030083424D7E0700813E0300812803008110
          03008110030083010001050081400B0081020B0003FF4100}
      end
      item
        Image.Data = {
          520300005844424D020004023604850000424D36040000000000003600000028
          000000021000000083010020000000000000040000150000000083573C24FF55
          3D23FF553921FF02000000008452381FFF51371FFF50361EFF4E371CFF020000
          0000834D331BFF4C321AFF4B331CFF020000000084573D25FF00000002000000
          0A0000000F020000001103000000128500000013000000120000000C00000003
          4D331BFF02000000008E583E26FF000000086D4527C1C67E46FFC57C44FFC37A
          42FFC27841FFC0763FFFBF753EFFBE733DFFBC723BFF683E20C40000000C4E33
          1BFF03000000008C0000000CCA8349FFF3CCA6FFF1C398FFEFC196FFEEC093FF
          EDBE91FFEBBC8EFFEBBA8DFFEBB98BFFBD723BFF0000001104000000008C0000
          000BCB854BFFF4CFAAFFF1C59AFFF1C398FFEFC195FFEEBF93FFEDBD90FFECBC
          8FFFEBBA8DFFBE733DFF0000001103000000008E5D422AFF0000000ACC874DFF
          F6D1ADFFF2C79CFFF1C59AFFF0C398FFEFC195FFEEBF93FFEDBD91FFECBC8EFF
          C0743EFF0000000F52371FFF02000000008E5E432AFF00000009CE884FFFF7D4
          B1FFF3C99FFFF3C79DFFF1C59AFFF1C398FFEFC195FFEFC093FFEDBD91FFC076
          3FFF0000000E533820FF02000000008E5F452CFF00000008CF8A50FFF8D6B4FF
          F5CBA1FFF4C99FFFF3C79CFFF2C59AFFF0C397FFEFC296FFEEBF94FFC27841FF
          0000000D533921FF02000000008E5F462DFF00000007D08B51FFF9D8B8FFF6CD
          A3FFF5CBA1FFF4C99EFFF2C79DFFF2C59AFFF0C398FFEFC196FFC37A43FF0000
          000C553B23FF03000000008C00000005D18D52FFFADBBBFFF7CEA5FFF6CCA3FF
          F5CBA1FFF3C99EFFF3C79DFFF2C59AFFF0C397FFC57C44FF0000000A04000000
          008C00000004D28E53FFFADCBDFFFADABBFFF9D9B9FFF8D7B7FFF7D6B5FFF6D4
          B1FFF5D2AFFFF4CFACFFC77E46FF0000000803000000008E63482FFF00000002
          754F2FBFD28F54FFD18D52FFD08C51FFCF8A50FFCE884EFFCD874DFFCB854BFF
          CA8349FF704728C200000005593E26FF020000000084634931FF000000000000
          00020000000303000000040400000005830000000400000001594228FF020000
          000083644931FF654B2FFF634831FF02000000008461472EFF61462EFF5F462D
          FF5F452DFF0200000000835D422AFF5C422AFF5B4128FF1100000000}
        Mask.Data = {
          2E0000005844424D02000100817E030083424D7E0700813E0300812803008110
          03008110030083010001050081400B0081020B0003FF4100}
      end
      item
        Image.Data = {
          860200005844424D020004023604850000424D36040000000000003600000028
          0000000210000000830100200000000000000400003100000000830000000200
          0000090000000B0C0000000084000000020000000E341D0FA0773F19DD050000
          0000840000000100000005000000080000000302000000008500000003000000
          0E351E0FA0C79A69FF8C4A22EC04000000008C00000002000000091109046394
          5931EC0000000A00000004000000090201002C4B2B16BAC69560FFDFC295FF61
          381CC80200000000BD000000010000000402010027462713B7B07949FFB27142
          FF040201360F09055B3B2313A6996139F9D2A66EFFEECD94FFCCA379FF22140B
          7B000000000000000200000007170E076B925D36F3D7AE76FFF3D597FFB5794B
          FFA66C41FFB47E50FFCEA26DFFEECC90FFEFCD92FFEEDEB6FF95623CE9000000
          1A0000000203020129583720BFC19261FFF2D49AFFF5DA9FFFF6DA9DFFF4D79D
          FFF4D79CFFF4D69AFFF3D59AFFF3D89FFFF5ECC5FFCAA176FF140D085E000000
          0500000003A37B55EBEADDBCFFFBF7D4FFFCF3CCFFFCF3CEFFFCF2CAFFFAECC0
          FFF8E6B6FFF6E3B2FFF6ECC3FFF1EBCAFFCDA981FF271B127D00000008020000
          00018E0403022A72573EC4DABE99FFFAF7D8FFFDFAD9FFFDF7D4FFFDFDE1FFF5
          EFD0FFEADBBAFFD6B892FF9E7653E816100B5E00000007000000010200000000
          8D00000001000000051F19126AB79571F2ECDFBDFFFEFDDFFFB48358FF977452
          E1654D37BB221A12700000001300000004000000010500000000890000000302
          020121604C38B3DABF9AFFBC8D63FF0000000B00000005000000030000000108
          0000000085000000010000000417130E5BA07C5BE80000000E0D000000008300
          00000200000003000000011700000000}
        Mask.Data = {
          2E0000005844424D02000100817E030083424D7E0700813E0300812803008110
          03008110030083010001050081400B0081020B0003FF4100}
      end
      item
        Image.Data = {
          D70300005844424D020004023604850000424D36040000000000003600000028
          0000000210000000830100200000000000000400000A00000000840000000100
          0000050000000B000000100200000011830000000D0000000700000002060000
          00008B0000000303020111341B146E683528C8773D2DE5884332FF743929E662
          2E21CA2F16107303010115000000040200000000FD0000000100000005000000
          10100907387F4738E1AE7F71FFBB9F94FF74584DFF4E3023FF74584CFFB99D92
          FFA67467FF713729E00D06052B00000000000000020000000C0C0A054A9D8779
          DAA16D5CFED9C2BBFFEAE0D9FF8D7162FF9C7F6FFF706159FF917667FF7C6154
          FFE1D4CDFFC8ACA2FF5F2D20C5000000030102011711241499474127FDDBC9BA
          FFB58574FFF5EEEBFFF3E9E5FF755342FF907C71FF000000FF6B5D54FF72503E
          FFECE2DDFFDFD0CAFF7E3D2CF50000000C122B17AA256140FF49916FFFCDCCBE
          FFC09889FFE6D6D0FFF9F5F2FF9C8173FFEFE8CBFF938075FF9C7F6FFF917566
          FFF3ECE8FFD1BBB3FF623023C407110A4F205836FF558B68FF60714DFFB3AC91
          FFE3D0C4FFBC9280FFCDAC9FFFDCCAC3FFA2877AFF836352FFA2877AFFDAC7C0
          FFC19B8FFF763D2EDE0E0705282C2B1AB25E6C4DFF968455FFCA955FFFDBAA71
          FFF1DCBFFFDDDED2FFC3B8ACFFB69989FFB28B7BFFB07C6AFFB08373FFA57969
          F63B27216E0201010D00000003926443E8CB9A69FFD3A16AFFE6BB80FFEAC48E
          FFEDCD9EFFA3B9A1FFBEEADCFFC1DDCFFFD1DAD0FFD4D8CEFFD6D8CEFFB3ADA0
          F50000000F000000010000000060593CFA67825DFFC4B07BFFECC996FFF2D9B3
          FFF2DAB5FFBCC6A7FF98B79DFFC4C7A7FFE8C995FF7D966DFF53AF8BFF345A3D
          FA0000000C000000008F00000000275B3FE74FAE8BFF819C72FFF2DDB9FFF5E3
          C3FFF5E4C5FFF6E3C5FFEBE0C2FFAAC4ADFFA0BEA4FF67CBA8FF57C19EFF3358
          3FE80000000A020000000086184C37AD4BAA87FF7BA077FFF7E8CDFFF7EAD0FF
          F8EBD3FF02F8ECD3FF86C7D7C2FFB5E0CFFF6FE3C2FF54BC9CFF2C3D2CAE0000
          0006020000000086091E1645477D5EFFBCBC8DFFCEDAC4FFC5DDCDFFD9E5D4FF
          02FAF2DEFF86F6EEDBFFD2DFC9FF6CC09EFF469B7BFF171A1247000000020200
          0000008D0000000441473499B2A47BFF8BC6A9FFD4F8EEFFD3E7DBFFFCF7E9FF
          FCF7E8FFD0E5D8FF93D6BCFF55BFA1FF2752409A0000000503000000008D0000
          00010504030A36402F814EA889FA8ADFC9FFC3E0CFFFFDFAEEFFFAF3E1FFB7C5
          A6FF519C7DFA235647820102010800000001050000000089000000020D201A32
          357C68AF599677E5D2AF88FFBC9D7AE68D755BAF1A1A14330000000305000000
          00}
      end>
  end
  inherited alstDlg: TActionList
    Left = 74
    Top = 168
    object actClearCurrPwd: TAction
      Caption = 'Clear Current Password'
      Hint = 'Clear Current Password'
      ImageIndex = 0
      OnExecute = actClearCurrPwdExecute
    end
    object actClearNewPwd: TAction
      Caption = 'Clear New Password'
      Hint = 'Clear New Password'
      ImageIndex = 0
      OnExecute = actClearNewPwdExecute
    end
    object actClearConfPwd: TAction
      Caption = 'Clear Confirm New Password'
      Hint = 'Clear Confirm New Password'
      ImageIndex = 0
      OnExecute = actClearConfPwdExecute
    end
    object actShowCurrPwd: TAction
      Caption = 'Show Current Password'
      Hint = 'Show Current Password'
      ImageIndex = 1
      OnExecute = actShowCurrPwdExecute
      OnUpdate = actShowCurrPwdUpdate
    end
    object actShowNewPwd: TAction
      Caption = 'Show New Password'
      Hint = 'Show New Password'
      ImageIndex = 1
      OnExecute = actShowNewPwdExecute
      OnUpdate = actShowNewPwdUpdate
    end
    object actShowConfPwd: TAction
      Caption = 'Show Confirm New Password'
      Hint = 'Show Confirm New Password'
      ImageIndex = 1
      OnExecute = actShowConfPwdExecute
      OnUpdate = actShowConfPwdUpdate
    end
  end
  inherited barmgrDlg: TdxBarManager
    Left = 32
    Top = 214
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited puDlgEdit: TdxBarPopupMenu
    Left = 84
    Top = 214
  end
  inherited tskbrDlg: TdxTaskbarProgress
    Left = 128
    Top = 168
  end
end