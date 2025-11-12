object FormHomeC: TFormHomeC
  Left = 0
  Top = 0
  Caption = 'FormHomeC'
  ClientHeight = 644
  ClientWidth = 410
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object pcMain: TPageControl
    Left = 0
    Top = 0
    Width = 410
    Height = 644
    ActivePage = tsMain
    Align = alClient
    TabOrder = 1
    object tsMain: TTabSheet
      Caption = 'tsMain'
      object pHomeBackground: TPanel
        Left = 0
        Top = 0
        Width = 402
        Height = 614
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object scbxMain: TScrollBox
          Left = 0
          Top = 0
          Width = 402
          Height = 614
          Margins.Left = 25
          Margins.Top = 15
          Margins.Right = 25
          Margins.Bottom = 10
          Align = alClient
          BorderStyle = bsNone
          TabOrder = 0
          UseWheelForScrolling = True
          object pCategorias: TPanel
            AlignWithMargins = True
            Left = 0
            Top = 150
            Width = 402
            Height = 119
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            BevelOuter = bvNone
            Color = cl3DLight
            ParentBackground = False
            TabOrder = 0
            object lblCategorias: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 396
              Height = 20
              Align = alTop
              Caption = 'Categorias'
              Color = clCoral
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              ExplicitWidth = 74
            end
            object scbxCategorias: TScrollBox
              AlignWithMargins = True
              Left = 0
              Top = 26
              Width = 402
              Height = 93
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
              UseWheelForScrolling = True
            end
          end
          object pEndereco: TPanel
            Left = 0
            Top = 62
            Width = 402
            Height = 88
            Align = alTop
            BevelOuter = bvNone
            Color = clWindow
            ParentBackground = False
            TabOrder = 1
            object lblEnderecoTitle: TLabel
              Left = 6
              Top = 9
              Width = 68
              Height = 20
              Margins.Bottom = 80
              Caption = 'Endere'#231'o:'
              Color = clCoral
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object lblEnderecoAtual: TLabel
              Left = 78
              Top = 9
              Width = 114
              Height = 20
              Caption = 'lblEnderecoAtual'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object pButtonAddEndereco: TPanel
              Left = 284
              Top = 32
              Width = 115
              Height = 37
              Caption = 'Adicionar Endere'#231'o'
              Color = clCoral
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 0
            end
            object cbEnderecos: TComboBox
              Left = 6
              Top = 40
              Width = 267
              Height = 23
              BevelInner = bvNone
              BevelOuter = bvNone
              Style = csDropDownList
              TabOrder = 1
              StyleName = 'Windows'
            end
          end
          object pHeaderMenuPrincipal: TPanel
            AlignWithMargins = True
            Left = 0
            Top = 27
            Width = 402
            Height = 35
            Margins.Left = 0
            Margins.Top = 27
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 2
            object lblMenuPrincipal: TLabel
              Left = 6
              Top = 13
              Width = 135
              Height = 25
              Caption = 'Menu Principal'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -19
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object pRestaurantes: TPanel
            AlignWithMargins = True
            Left = 0
            Top = 269
            Width = 402
            Height = 345
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            BevelOuter = bvNone
            Color = cl3DLight
            ParentBackground = False
            TabOrder = 3
            object lblRestaurantes: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 396
              Height = 20
              Align = alTop
              Caption = 'Restaurantes e Com'#233'rcios'
              Color = clCoral
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              ExplicitWidth = 181
            end
            object scbxRestaurantes: TScrollBox
              AlignWithMargins = True
              Left = 0
              Top = 26
              Width = 402
              Height = 319
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HorzScrollBar.Smooth = True
              HorzScrollBar.Tracking = True
              VertScrollBar.Tracking = True
              VertScrollBar.Visible = False
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
              UseWheelForScrolling = True
              ExplicitLeft = 2
            end
          end
        end
      end
    end
    object tsLojas: TTabSheet
      Caption = 'tsLojas'
      ImageIndex = 1
      object scbxMainLojas: TScrollBox
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 402
        Height = 614
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        TabOrder = 0
        UseWheelForScrolling = True
        object pCategoriasL: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 73
          Width = 398
          Height = 141
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object scbxCategoriasL: TScrollBox
            AlignWithMargins = True
            Left = 0
            Top = 28
            Width = 398
            Height = 113
            Margins.Left = 0
            Margins.Top = 28
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            TabOrder = 0
            UseWheelForScrolling = True
            object lblCategoriasL: TLabel
              Left = 13
              Top = 10
              Width = 81
              Height = 21
              Caption = 'Categorias'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
        object scbxComerciosL: TScrollBox
          Left = 0
          Top = 214
          Width = 398
          Height = 396
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 1
          UseWheelForScrolling = True
          object lblComerciosL: TLabel
            Left = 13
            Top = 22
            Width = 80
            Height = 21
            Caption = 'Com'#233'rcios'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object pHeaderLojas: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 27
          Width = 398
          Height = 46
          Margins.Left = 0
          Margins.Top = 27
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 2
          object lblRestaurantesLojas: TLabel
            Left = 53
            Top = 13
            Width = 195
            Height = 21
            Caption = 'Restaurantes e Com'#233'rcios'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object iButtonBackLojas: TImage
            Left = 7
            Top = 8
            Width = 30
            Height = 30
            Center = True
            Picture.Data = {
              0954506E67496D61676589504E470D0A1A0A0000000D49484452000002000000
              02000806000000F478D4FA000000097048597300000B1300000B1301009A9C18
              000000B46558496649492A000800000006001201030001000000010000001A01
              050001000000560000001B010500010000005E00000028010300010000000200
              0000130203000100000001000000698704000100000066000000000000004800
              0000010000004800000001000000060000900700040000003032313001910700
              040000000102030000A00700040000003031303001A0030001000000FFFF0000
              02A00400010000000002000003A00400010000000002000000000000915FF1DA
              00000E164944415478DAEDD84DAA5CD715866119F7051983879096461008B89B
              99791499802160703ACA400CEE07627753B2742CE9DE5BB7FECE3E7BAFF53D0F
              2C8AEAEDDEF772BE790300C4F966F6030080E309000008240000209000008040
              0200000209000008240000209000008040020000020900000824000020900000
              8040020000020900000824000020900000804002000002090000082400002090
              0000804002000002090000082400002090000080400200000209000008240000
              2090000080400200000209000008240000209000008040020000020900000824
              0000209000008040020000020900000824000020900000804002000002090000
              0824000020900000804002000002090000082400002090000080400200000209
              0000082400002090000080400200000209000008240000209000008040020000
              0209000008240000209000008040020000020900000824000020900000804002
              0000020900000824000020900000804002000002090000082400002090000080
              4002000002090000082400002090000080400200000209000008240000209000
              0080400200000209000008240000209000008040020072BDFBF4FB7EF64380E3
              0900C8F461FC7F3CDDB7A7FBFBE9FE3DFB41C0B10400E4D9C6FFEDA7FFFF7B23
              02208E00802C4FC77F2302208C00801CE7C67F2302208800800C97C67F230220
              840080FEAE1DFF8D08800002007ABB75FC3722009A1300D0D7BDE3BF1101D098
              00809E1E1DFF8D0880A60400F4B3D7F86F4400342400A097BDC77F2302A01901
              007D8C1AFF8D0880460400F4307AFC3722009A100050DF51E3BF1101D0800080
              DA8E1EFF8D0880E20400D4356BFC3722000A130050D3ECF1DF8800284A00403D
              AB8CFF4604404102006A596DFC3722008A110050C7AAE3BF1101508800801A56
              1FFF8D0880220400ACAFCAF86F4400142000606DD5C67F230260710200D65575
              FC372200162600604DD5C77F230260510200D6D365FC372200162400602DDDC6
              7F230260310200D6D175FC372200162200600DDDC77F230260110200E64B19FF
              CDAFA7FBEE74BFCF7E082413003057DAF8FF76BAEF4FF7D3EC87403A0100F318
              7F601A010073187F602A0100C733FEC07402008E65FC81250800388EF1079621
              00E018C61F588A0080F18C3FB01C010063197F60490200C631FEC0B204008C61
              FC81A50900D89FF107962700605FC61F284100C07E8C3F508600807D187FA014
              01008F33FE403902001E63FC81920400DCCFF803650900B88FF1074A1300703B
              E30F942700E036C61F684100C0F58C3FD0860080EB187FA015010097197FA01D
              0100AF33FE404B0200CE33FE405B02005E66FC81D604003C67FC81F604007CCD
              F8031104007C66FC811802003E32FE40140100C61F0824004867FC8148028064
              C61F8825004865FC8168028044C61F8827004863FC01DE0800B2187F804F0400
              298C3FC0170400098C3FC0130280EE8C3FC00B04009D197F803304005D197F80
              5708003A32FE00170800BA31FE005710007462FC01AE2400E8C2F803DC4000D0
              81F107B89100A03AE30F7007014065C61FE04E0280AA8C3FC003040015197F80
              070900AA31FE003B10005462FC01762200A8C2F803EC48005081F107D8990060
              75C61F600001C0CA8C3FC020028055197F808104002B32FE008309005663FC01
              0E20005889F1073888006015C61FE040028015187F808309006633FE00130800
              6632FE009308006631FE001309006630FE009309008E66FC011620003892F107
              588400E028C61F6021028023187F80C508004633FE000B12008C64FC01162500
              18C5F8032C4C003082F107589C00606FC61FA00001C09E8C3F40110280BD187F
              804204007B30FE00C508001E65FC010A12003CC2F803142500B897F107284C00
              700FE30F509C00E056C61FA00101C02D8C3F401302806B197F80460400D730FE
              00CD08002E31FE000D09005E63FC019A12009C63FC011A1300BCC4F803342700
              78CAF8030410007CC9F8038410006C8C3F401001C007C61F208C00C0F8030412
              00D98C3F40280190CBF803041300998C3F40380190C7F8032000C2187F00FE20
              0072187F00FE240032187F00BE2200FA33FE003C23007A33FE00BC4800F465FC
              01384B00F464FC01789500E8C7F803709100E8C5F803701501D087F107E06A02
              A007E30FC04D04407DC61F809B0980DA8C3F0077110075197F00EE26006A32FE
              003C4400D463FC01789800A8C5F803B00B015047DAF87FF0C3E97E9EFD0860BA
              5F4EF77EF623BA110035248E3FC0E69FA7FBC7EC47742300D667FC8174026000
              01B036E30F2000861000EB32FE001F09800104C09A8C3FC06702600001B01EE3
              0FF03501308000588BF107784E000C2000D661FC015E26000610006B30FE00E7
              09800104C07CC61FE075026000013097F107B84C000C2000E631FE00D7110003
              0880398C3FC0F504C00002E078C61FE03602600001702CE30F703B0130800038
              8EF107B88F001840001CC3F803DC4F000C2000C633FE008F1100030880B18C3F
              C0E304C00002601CE30FB00F0130800018C3F803EC47000C2000C6F8EBE9FE75
              BABFCC7E08400302600001308E0800D887001840008C2502001E2700061000E3
              890080C708800104C0314400C0FD04C00002E0382200E03E02600001702C1100
              703B01308000389E0800B88D00184000CC210200AE2700061000F3880080EB08
              800104C05C2200E03201308000984F0400BC4E000C2000D6200200CE13000308
              80758800809709800104C05A4400C07302600001B01E1100F035013080005893
              0800F84C000C2000D62502003E1200030880B589000001308400589F0800D209
              800104400D220048260006100075BC3BDD8FA77B3BFB2107FAE1743FCF7E0430
              DD2FA77B3FFB11DD08805AD2BE04FC76BAEF4FF7D3EC8700742300EA1101003C
              4C00D4240200788800A84B0400703701509B0800E02E02A03E1100C0CD04400F
              2200809B08803E440000571300BD880000AE2200FA1101005C24007A120100BC
              4A00F4250200384B00F4260200789100E84F0400F08C00C8200200F88A00C821
              0200F89300C8220200F88300C82302001000A14400403801904B0400041300D9
              4400402801800800082400F84004008411006C4400401001C0974400400801C0
              532200208000E0252200A03901C0392200A03101C06B4400405302804B440040
              4302806B880080660400D71201008D08006E2102009A1000DC4A0400342000B8
              870800284E00702F1100509800E0112200A02801C0A34400404102803D880080
              6204007B110100850800F62402008A1000EC4D0400142000184104002C4E0030
              8A080058980060241100B02801C06822006041028023880080C508008E220200
              16220038920800588400E068220060010280194400C0640280594400C0440280
              994400C0240280D94400C004028015880080830900562102000E240058890800
              38880060352200E000028015890080C10400AB12010003090056260200061100
              AC4E04000C2000A8400400EC4C0050850800D89100A0121100B0130140352200
              600702808A4400C0830400558900800708002A13010077120054270200EE2000
              E8400400DC4800D0850800B88100A013110070250140372200E00A02808E4400
              C0050280AE4400C02B04009D890080330400DD89008017080012880080270400
              294400C0170400494400C0270280342200E08D0020930800E20900528900209A
              0020990800620900D28900209200001100041200F0910800A20800F84C040031
              04007C4D04001104003C270280F60400BC4C0400AD0900384F04006D0900789D
              08005A120070990800DA1100701D1100B42200E07A2200684300C06D4400D082
              0080DB8900A03C0100F7110140690200EE270280B204003C460400250900789C
              0800CA1100B00F1100942200603F2200284300C0BE440050820080FD89006079
              0200C61001C0D204008C230280650900184B04004B1200309E0800962300E018
              2200588A0080E38800601902008E250280250800389E0800A6130030870800A6
              1200308F0800A6110030970800A6100030DFBBD3FD78BAB7B31F72905F4FF7DD
              E97E9FFD10482600600D295F02FE7BBABF9DEE3FB31F02E90400ACA37B04187F
              58880080B5748D00E30F8B1100B09E6E1160FC61410200D6D425028C3F2C4A00
              C0BAAA4780F187850900585BD50830FEB0380100EBAB1601C61F0A1000504395
              0830FE508400803A568F00E30F850800A865D50830FE508C00807A568B00E30F
              050900A869950830FE50940080BA664780F187C20400D4362B028C3F142700A0
              BEA323C0F8430302007A382A028C3F342100A08FD11160FCA1110100BD8C8A00
              E30FCD0800E867EF0830FED09000809EF68A00E30F4D0900E8EBD10830FED098
              0080DEEE8D00E30FCD0900E8EFD60830FE10400040866B23C0F843080100392E
              4580F187200200B29C8B00E30F610400E4791A01C61F020900C8B445C0B76F8C
              3F44120090EBDDA7DFF7B31F021C4F0000402001000081040000041200001048
              0000402001000081040000041200001048000040200100008104000004120000
              1048000040200100008104000004120000104800004020010000810400000412
              0000104800004020010000810400000412000010480000402001000081040000
              0412000010480000402001000081040000041200001048000040200100008104
              0000041200001048000040200100008104000004120000104800004020010000
              8104000004120000104800004020010000810400000412000010480000402001
              0000810400000412000010480000402001000081040000041200001048000040
              2001000081040000041200001048000040200100008104000004120000104800
              0040200100008104000004120000104800004020010000810400000412000010
              4800004020010000810400000412000010480000402001000081040000041200
              0010480000402001000081040000041200001048000040A0FF030801D62EB80B
              0D7D0000000049454E44AE426082}
            Proportional = True
            OnClick = iButtonBackAlterarSenhaClick
          end
        end
      end
    end
    object tsPerfil: TTabSheet
      Caption = 'tsPerfil'
      ImageIndex = 2
      object pcPerfil: TPageControl
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 402
        Height = 614
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        ActivePage = tsVisualizarPefil
        Align = alClient
        TabOrder = 0
        object tsVisualizarPefil: TTabSheet
          Caption = 'tsVisualizarPefil'
          object scbxMainPerfil: TScrollBox
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 394
            Height = 584
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            BevelOuter = bvNone
            BorderStyle = bsNone
            TabOrder = 0
            UseWheelForScrolling = True
            object pEnderecos: TPanel
              AlignWithMargins = True
              Left = 0
              Top = 160
              Width = 394
              Height = 211
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
              object scbxEnderecos: TScrollBox
                AlignWithMargins = True
                Left = 0
                Top = 0
                Width = 394
                Height = 211
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alClient
                BevelOuter = bvNone
                BorderStyle = bsNone
                TabOrder = 0
                UseWheelForScrolling = True
                object lblEnderecos: TLabel
                  Left = 9
                  Top = 14
                  Width = 71
                  Height = 20
                  Caption = 'Endere'#231'os'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Segoe UI'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object pButtonEditarEndereco: TPanel
                  Left = 302
                  Top = 14
                  Width = 86
                  Height = 24
                  BevelOuter = bvNone
                  Caption = 'Editar'
                  Color = clCoral
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -12
                  Font.Name = 'Segoe UI'
                  Font.Style = [fsBold]
                  ParentBackground = False
                  ParentFont = False
                  TabOrder = 0
                  OnClick = pButtonEditarEnderecoClick
                end
              end
            end
            object pHeaderPerfil: TPanel
              AlignWithMargins = True
              Left = 0
              Top = 2
              Width = 394
              Height = 46
              Margins.Left = 0
              Margins.Top = 2
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 1
              object lblHeaderPerfil: TLabel
                Left = 53
                Top = 13
                Width = 41
                Height = 21
                Caption = 'Perfil'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object iButtonBackPerfil: TImage
                Left = 7
                Top = 8
                Width = 30
                Height = 30
                Center = True
                Picture.Data = {
                  0954506E67496D61676589504E470D0A1A0A0000000D49484452000002000000
                  02000806000000F478D4FA000000097048597300000B1300000B1301009A9C18
                  000000B46558496649492A000800000006001201030001000000010000001A01
                  050001000000560000001B010500010000005E00000028010300010000000200
                  0000130203000100000001000000698704000100000066000000000000004800
                  0000010000004800000001000000060000900700040000003032313001910700
                  040000000102030000A00700040000003031303001A0030001000000FFFF0000
                  02A00400010000000002000003A00400010000000002000000000000915FF1DA
                  00000E164944415478DAEDD84DAA5CD715866119F7051983879096461008B89B
                  99791499802160703ACA400CEE07627753B2742CE9DE5BB7FECE3E7BAFF53D0F
                  2C8AEAEDDEF772BE790300C4F966F6030080E309000008240000209000008040
                  0200000209000008240000209000008040020000020900000824000020900000
                  8040020000020900000824000020900000804002000002090000082400002090
                  0000804002000002090000082400002090000080400200000209000008240000
                  2090000080400200000209000008240000209000008040020000020900000824
                  0000209000008040020000020900000824000020900000804002000002090000
                  0824000020900000804002000002090000082400002090000080400200000209
                  0000082400002090000080400200000209000008240000209000008040020000
                  0209000008240000209000008040020000020900000824000020900000804002
                  0000020900000824000020900000804002000002090000082400002090000080
                  4002000002090000082400002090000080400200000209000008240000209000
                  0080400200000209000008240000209000008040020072BDFBF4FB7EF64380E3
                  0900C8F461FC7F3CDDB7A7FBFBE9FE3DFB41C0B10400E4D9C6FFEDA7FFFF7B23
                  02208E00802C4FC77F2302208C00801CE7C67F2302208800800C97C67F230220
                  840080FEAE1DFF8D08800002007ABB75FC3722009A1300D0D7BDE3BF1101D098
                  00809E1E1DFF8D0880A60400F4B3D7F86F4400342400A097BDC77F2302A01901
                  007D8C1AFF8D0880460400F4307AFC3722009A100050DF51E3BF1101D0800080
                  DA8E1EFF8D0880E20400D4356BFC3722000A130050D3ECF1DF8800284A00403D
                  AB8CFF4604404102006A596DFC3722008A110050C7AAE3BF1101508800801A56
                  1FFF8D0880220400ACAFCAF86F4400142000606DD5C67F230260710200D65575
                  FC372200162600604DD5C77F230260510200D6D365FC372200162400602DDDC6
                  7F230260310200D6D175FC372200162200600DDDC77F230260110200E64B19FF
                  CDAFA7FBEE74BFCF7E082413003057DAF8FF76BAEF4FF7D3EC87403A0100F318
                  7F601A010073187F602A0100C733FEC07402008E65FC81250800388EF1079621
                  00E018C61F588A0080F18C3FB01C010063197F60490200C631FEC0B204008C61
                  FC81A50900D89FF107962700605FC61F284100C07E8C3F508600807D187FA014
                  01008F33FE403902001E63FC81920400DCCFF803650900B88FF1074A1300703B
                  E30F942700E036C61F684100C0F58C3FD0860080EB187FA015010097197FA01D
                  0100AF33FE404B0200CE33FE405B02005E66FC81D604003C67FC81F604007CCD
                  F8031104007C66FC811802003E32FE40140100C61F0824004867FC8148028064
                  C61F8825004865FC8168028044C61F8827004863FC01DE0800B2187F804F0400
                  298C3FC0170400098C3FC0130280EE8C3FC00B04009D197F803304005D197F80
                  5708003A32FE00170800BA31FE005710007462FC01AE2400E8C2F803DC4000D0
                  81F107B89100A03AE30F7007014065C61FE04E0280AA8C3FC003040015197F80
                  070900AA31FE003B10005462FC01762200A8C2F803EC48005081F107D8990060
                  75C61F600001C0CA8C3FC020028055197F808104002B32FE008309005663FC01
                  0E20005889F1073888006015C61FE040028015187F808309006633FE00130800
                  6632FE009308006631FE001309006630FE009309008E66FC011620003892F107
                  588400E028C61F6021028023187F80C508004633FE000B12008C64FC01162500
                  18C5F8032C4C003082F107589C00606FC61FA00001C09E8C3F40110280BD187F
                  804204007B30FE00C508001E65FC010A12003CC2F803142500B897F107284C00
                  700FE30F509C00E056C61FA00101C02D8C3F401302806B197F80460400D730FE
                  00CD08002E31FE000D09005E63FC019A12009C63FC011A1300BCC4F803342700
                  78CAF8030410007CC9F8038410006C8C3F401001C007C61F208C00C0F8030412
                  00D98C3F40280190CBF803041300998C3F40380190C7F8032000C2187F00FE20
                  0072187F00FE240032187F00BE2200FA33FE003C23007A33FE00BC4800F465FC
                  01384B00F464FC01789500E8C7F803709100E8C5F803701501D087F107E06A02
                  A007E30FC04D04407DC61F809B0980DA8C3F0077110075197F00EE26006A32FE
                  003C4400D463FC01789800A8C5F803B00B015047DAF87FF0C3E97E9EFD0860BA
                  5F4EF77EF623BA110035248E3FC0E69FA7FBC7EC47742300D667FC8174026000
                  01B036E30F2000861000EB32FE001F09800104C09A8C3FC06702600001B01EE3
                  0FF03501308000588BF107784E000C2000D661FC015E26000610006B30FE00E7
                  09800104C07CC61FE075026000013097F107B84C000C2000E631FE00D7110003
                  0880398C3FC0F504C00002E078C61FE03602600001702CE30F703B0130800038
                  8EF107B88F001840001CC3F803DC4F000C2000C633FE008F1100030880B18C3F
                  C0E304C00002601CE30FB00F0130800018C3F803EC47000C2000C6F8EBE9FE75
                  BABFCC7E08400302600001308E0800D887001840008C2502001E2700061000E3
                  890080C708800104C0314400C0FD04C00002E0382200E03E02600001702C1100
                  703B01308000389E0800B88D00184000CC210200AE2700061000F3880080EB08
                  800104C05C2200E03201308000984F0400BC4E000C2000D6200200CE13000308
                  80758800809709800104C05A4400C07302600001B01E1100F035013080005893
                  0800F84C000C2000D62502003E1200030880B589000001308400589F0800D209
                  800104400D220048260006100075BC3BDD8FA77B3BFB2107FAE1743FCF7E0430
                  DD2FA77B3FFB11DD08805AD2BE04FC76BAEF4FF7D3EC8700742300EA1101003C
                  4C00D4240200788800A84B0400703701509B0800E02E02A03E1100C0CD04400F
                  2200809B08803E440000571300BD880000AE2200FA1101005C24007A120100BC
                  4A00F4250200384B00F4260200789100E84F0400F08C00C8200200F88A00C821
                  0200F89300C8220200F88300C82302001000A14400403801904B0400041300D9
                  4400402801800800082400F84004008411006C4400401001C0974400400801C0
                  532200208000E0252200A03901C0392200A03101C06B4400405302804B440040
                  4302806B880080660400D71201008D08006E2102009A1000DC4A0400342000B8
                  870800284E00702F1100509800E0112200A02801C0A34400404102803D880080
                  6204007B110100850800F62402008A1000EC4D0400142000184104002C4E0030
                  8A080058980060241100B02801C06822006041028023880080C508008E220200
                  16220038920800588400E068220060010280194400C0640280594400C0440280
                  994400C0240280D94400C004028015880080830900562102000E240058890800
                  38880060352200E000028015890080C10400AB12010003090056260200061100
                  AC4E04000C2000A8400400EC4C0050850800D89100A0121100B0130140352200
                  600702808A4400C0830400558900800708002A13010077120054270200EE2000
                  E8400400DC4800D0850800B88100A013110070250140372200E00A02808E4400
                  C0050280AE4400C02B04009D890080330400DD89008017080012880080270400
                  294400C0170400494400C0270280342200E08D0020930800E20900528900209A
                  0020990800620900D28900209200001100041200F0910800A20800F84C040031
                  04007C4D04001104003C270280F60400BC4C0400AD0900384F04006D0900789D
                  08005A120070990800DA1100701D1100B42200E07A2200684300C06D4400D082
                  0080DB8900A03C0100F7110140690200EE270280B204003C460400250900789C
                  0800CA1100B00F1100942200603F2200284300C0BE440050820080FD89006079
                  0200C61001C0D204008C230280650900184B04004B1200309E0800962300E018
                  2200588A0080E38800601902008E250280250800389E0800A6130030870800A6
                  1200308F0800A6110030970800A6100030DFBBD3FD78BAB7B31F72905F4FF7DD
                  E97E9FFD10482600600D295F02FE7BBABF9DEE3FB31F02E90400ACA37B04187F
                  58880080B5748D00E30F8B1100B09E6E1160FC61410200D6D425028C3F2C4A00
                  C0BAAA4780F187850900585BD50830FEB0380100EBAB1601C61F0A1000504395
                  0830FE508400803A568F00E30F850800A865D50830FE508C00807A568B00E30F
                  050900A869950830FE50940080BA664780F187C20400D4362B028C3F142700A0
                  BEA323C0F8430302007A382A028C3F342100A08FD11160FCA1110100BD8C8A00
                  E30FCD0800E867EF0830FED09000809EF68A00E30F4D0900E8EBD10830FED098
                  0080DEEE8D00E30FCD0900E8EFD60830FE10400040866B23C0F843080100392E
                  4580F187200200B29C8B00E30F610400E4791A01C61F020900C8B445C0B76F8C
                  3F44120090EBDDA7DFF7B31F021C4F0000402001000081040000041200001048
                  0000402001000081040000041200001048000040200100008104000004120000
                  1048000040200100008104000004120000104800004020010000810400000412
                  0000104800004020010000810400000412000010480000402001000081040000
                  0412000010480000402001000081040000041200001048000040200100008104
                  0000041200001048000040200100008104000004120000104800004020010000
                  8104000004120000104800004020010000810400000412000010480000402001
                  0000810400000412000010480000402001000081040000041200001048000040
                  2001000081040000041200001048000040200100008104000004120000104800
                  0040200100008104000004120000104800004020010000810400000412000010
                  4800004020010000810400000412000010480000402001000081040000041200
                  0010480000402001000081040000041200001048000040A0FF030801D62EB80B
                  0D7D0000000049454E44AE426082}
                Proportional = True
                OnClick = iButtonBackAlterarSenhaClick
              end
              object pButtonAlterarSenhaV: TPanel
                Left = 302
                Top = 11
                Width = 86
                Height = 26
                BevelOuter = bvNone
                Caption = 'Alterar Senha'
                Color = clCoral
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentBackground = False
                ParentFont = False
                TabOrder = 0
                OnClick = pButtonAlterarSenhaVClick
              end
            end
            object pInfoVisualizar: TPanel
              AlignWithMargins = True
              Left = 0
              Top = 48
              Width = 394
              Height = 112
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 2
              object scbxInfoVisualizar: TScrollBox
                AlignWithMargins = True
                Left = 0
                Top = 0
                Width = 394
                Height = 112
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alClient
                BevelOuter = bvNone
                BorderStyle = bsNone
                TabOrder = 0
                UseWheelForScrolling = True
                object lblDados: TLabel
                  Left = 9
                  Top = 8
                  Width = 107
                  Height = 20
                  Caption = 'Dados Pessoais'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Segoe UI'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lblNomeV: TLabel
                  Left = 9
                  Top = 35
                  Width = 36
                  Height = 15
                  Caption = 'Nome:'
                end
                object lblNomeDV: TLabel
                  Left = 63
                  Top = 35
                  Width = 61
                  Height = 15
                  Caption = 'lblNomeDV'
                end
                object lblCPFV: TLabel
                  Left = 9
                  Top = 55
                  Width = 24
                  Height = 15
                  Caption = 'CPF:'
                end
                object lblTelefoneV: TLabel
                  Left = 9
                  Top = 75
                  Width = 48
                  Height = 15
                  Caption = 'Telefone:'
                end
                object lblCPFDV: TLabel
                  Left = 63
                  Top = 55
                  Width = 49
                  Height = 15
                  Caption = 'lblCPFDV'
                end
                object lblTelefoneDV: TLabel
                  Left = 63
                  Top = 76
                  Width = 73
                  Height = 15
                  Caption = 'lblTelefoneDV'
                end
                object lblEmailV: TLabel
                  Left = 9
                  Top = 96
                  Width = 32
                  Height = 15
                  Caption = 'Email:'
                end
                object lblEmailDV: TLabel
                  Left = 63
                  Top = 96
                  Width = 57
                  Height = 15
                  Caption = 'lblEmailDV'
                end
              end
              object pButtonEditarDados: TPanel
                Left = 302
                Top = 8
                Width = 86
                Height = 24
                BevelOuter = bvNone
                Caption = 'Editar'
                Color = clCoral
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentBackground = False
                ParentFont = False
                TabOrder = 1
                OnClick = pButtonEditarDadosClick
              end
            end
            object pPagamentos: TPanel
              AlignWithMargins = True
              Left = 0
              Top = 371
              Width = 394
              Height = 213
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 3
              object scbxPagamentos: TScrollBox
                AlignWithMargins = True
                Left = 0
                Top = 0
                Width = 394
                Height = 213
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alClient
                BevelOuter = bvNone
                BorderStyle = bsNone
                TabOrder = 0
                UseWheelForScrolling = True
                object lblFormasPagamento: TLabel
                  Left = 9
                  Top = 14
                  Width = 157
                  Height = 20
                  Caption = 'Formas de Pagamento'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Segoe UI'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object pButtonEditarPagamentos: TPanel
                  Left = 302
                  Top = 14
                  Width = 86
                  Height = 24
                  BevelOuter = bvNone
                  Caption = 'Editar'
                  Color = clCoral
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -12
                  Font.Name = 'Segoe UI'
                  Font.Style = [fsBold]
                  ParentBackground = False
                  ParentFont = False
                  TabOrder = 0
                  OnClick = pButtonEditarPagamentosClick
                end
              end
            end
          end
        end
        object tsPerfilE: TTabSheet
          Caption = 'tsPerfilE'
          ImageIndex = 1
          object scbxMainPerfilE: TScrollBox
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 394
            Height = 584
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            BevelOuter = bvNone
            BorderStyle = bsNone
            TabOrder = 0
            UseWheelForScrolling = True
            object pHeaderPerfilE: TPanel
              AlignWithMargins = True
              Left = 0
              Top = 2
              Width = 394
              Height = 46
              Margins.Left = 0
              Margins.Top = 2
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
              object lblPerfilTitlePerfilE: TLabel
                Left = 53
                Top = 13
                Width = 41
                Height = 21
                Caption = 'Perfil'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object iButtonBackEditarPerfil: TImage
                Left = 7
                Top = 8
                Width = 30
                Height = 30
                Center = True
                Picture.Data = {
                  0954506E67496D61676589504E470D0A1A0A0000000D49484452000002000000
                  02000806000000F478D4FA000000097048597300000B1300000B1301009A9C18
                  000000B46558496649492A000800000006001201030001000000010000001A01
                  050001000000560000001B010500010000005E00000028010300010000000200
                  0000130203000100000001000000698704000100000066000000000000004800
                  0000010000004800000001000000060000900700040000003032313001910700
                  040000000102030000A00700040000003031303001A0030001000000FFFF0000
                  02A00400010000000002000003A00400010000000002000000000000915FF1DA
                  00000E164944415478DAEDD84DAA5CD715866119F7051983879096461008B89B
                  99791499802160703ACA400CEE07627753B2742CE9DE5BB7FECE3E7BAFF53D0F
                  2C8AEAEDDEF772BE790300C4F966F6030080E309000008240000209000008040
                  0200000209000008240000209000008040020000020900000824000020900000
                  8040020000020900000824000020900000804002000002090000082400002090
                  0000804002000002090000082400002090000080400200000209000008240000
                  2090000080400200000209000008240000209000008040020000020900000824
                  0000209000008040020000020900000824000020900000804002000002090000
                  0824000020900000804002000002090000082400002090000080400200000209
                  0000082400002090000080400200000209000008240000209000008040020000
                  0209000008240000209000008040020000020900000824000020900000804002
                  0000020900000824000020900000804002000002090000082400002090000080
                  4002000002090000082400002090000080400200000209000008240000209000
                  0080400200000209000008240000209000008040020072BDFBF4FB7EF64380E3
                  0900C8F461FC7F3CDDB7A7FBFBE9FE3DFB41C0B10400E4D9C6FFEDA7FFFF7B23
                  02208E00802C4FC77F2302208C00801CE7C67F2302208800800C97C67F230220
                  840080FEAE1DFF8D08800002007ABB75FC3722009A1300D0D7BDE3BF1101D098
                  00809E1E1DFF8D0880A60400F4B3D7F86F4400342400A097BDC77F2302A01901
                  007D8C1AFF8D0880460400F4307AFC3722009A100050DF51E3BF1101D0800080
                  DA8E1EFF8D0880E20400D4356BFC3722000A130050D3ECF1DF8800284A00403D
                  AB8CFF4604404102006A596DFC3722008A110050C7AAE3BF1101508800801A56
                  1FFF8D0880220400ACAFCAF86F4400142000606DD5C67F230260710200D65575
                  FC372200162600604DD5C77F230260510200D6D365FC372200162400602DDDC6
                  7F230260310200D6D175FC372200162200600DDDC77F230260110200E64B19FF
                  CDAFA7FBEE74BFCF7E082413003057DAF8FF76BAEF4FF7D3EC87403A0100F318
                  7F601A010073187F602A0100C733FEC07402008E65FC81250800388EF1079621
                  00E018C61F588A0080F18C3FB01C010063197F60490200C631FEC0B204008C61
                  FC81A50900D89FF107962700605FC61F284100C07E8C3F508600807D187FA014
                  01008F33FE403902001E63FC81920400DCCFF803650900B88FF1074A1300703B
                  E30F942700E036C61F684100C0F58C3FD0860080EB187FA015010097197FA01D
                  0100AF33FE404B0200CE33FE405B02005E66FC81D604003C67FC81F604007CCD
                  F8031104007C66FC811802003E32FE40140100C61F0824004867FC8148028064
                  C61F8825004865FC8168028044C61F8827004863FC01DE0800B2187F804F0400
                  298C3FC0170400098C3FC0130280EE8C3FC00B04009D197F803304005D197F80
                  5708003A32FE00170800BA31FE005710007462FC01AE2400E8C2F803DC4000D0
                  81F107B89100A03AE30F7007014065C61FE04E0280AA8C3FC003040015197F80
                  070900AA31FE003B10005462FC01762200A8C2F803EC48005081F107D8990060
                  75C61F600001C0CA8C3FC020028055197F808104002B32FE008309005663FC01
                  0E20005889F1073888006015C61FE040028015187F808309006633FE00130800
                  6632FE009308006631FE001309006630FE009309008E66FC011620003892F107
                  588400E028C61F6021028023187F80C508004633FE000B12008C64FC01162500
                  18C5F8032C4C003082F107589C00606FC61FA00001C09E8C3F40110280BD187F
                  804204007B30FE00C508001E65FC010A12003CC2F803142500B897F107284C00
                  700FE30F509C00E056C61FA00101C02D8C3F401302806B197F80460400D730FE
                  00CD08002E31FE000D09005E63FC019A12009C63FC011A1300BCC4F803342700
                  78CAF8030410007CC9F8038410006C8C3F401001C007C61F208C00C0F8030412
                  00D98C3F40280190CBF803041300998C3F40380190C7F8032000C2187F00FE20
                  0072187F00FE240032187F00BE2200FA33FE003C23007A33FE00BC4800F465FC
                  01384B00F464FC01789500E8C7F803709100E8C5F803701501D087F107E06A02
                  A007E30FC04D04407DC61F809B0980DA8C3F0077110075197F00EE26006A32FE
                  003C4400D463FC01789800A8C5F803B00B015047DAF87FF0C3E97E9EFD0860BA
                  5F4EF77EF623BA110035248E3FC0E69FA7FBC7EC47742300D667FC8174026000
                  01B036E30F2000861000EB32FE001F09800104C09A8C3FC06702600001B01EE3
                  0FF03501308000588BF107784E000C2000D661FC015E26000610006B30FE00E7
                  09800104C07CC61FE075026000013097F107B84C000C2000E631FE00D7110003
                  0880398C3FC0F504C00002E078C61FE03602600001702CE30F703B0130800038
                  8EF107B88F001840001CC3F803DC4F000C2000C633FE008F1100030880B18C3F
                  C0E304C00002601CE30FB00F0130800018C3F803EC47000C2000C6F8EBE9FE75
                  BABFCC7E08400302600001308E0800D887001840008C2502001E2700061000E3
                  890080C708800104C0314400C0FD04C00002E0382200E03E02600001702C1100
                  703B01308000389E0800B88D00184000CC210200AE2700061000F3880080EB08
                  800104C05C2200E03201308000984F0400BC4E000C2000D6200200CE13000308
                  80758800809709800104C05A4400C07302600001B01E1100F035013080005893
                  0800F84C000C2000D62502003E1200030880B589000001308400589F0800D209
                  800104400D220048260006100075BC3BDD8FA77B3BFB2107FAE1743FCF7E0430
                  DD2FA77B3FFB11DD08805AD2BE04FC76BAEF4FF7D3EC8700742300EA1101003C
                  4C00D4240200788800A84B0400703701509B0800E02E02A03E1100C0CD04400F
                  2200809B08803E440000571300BD880000AE2200FA1101005C24007A120100BC
                  4A00F4250200384B00F4260200789100E84F0400F08C00C8200200F88A00C821
                  0200F89300C8220200F88300C82302001000A14400403801904B0400041300D9
                  4400402801800800082400F84004008411006C4400401001C0974400400801C0
                  532200208000E0252200A03901C0392200A03101C06B4400405302804B440040
                  4302806B880080660400D71201008D08006E2102009A1000DC4A0400342000B8
                  870800284E00702F1100509800E0112200A02801C0A34400404102803D880080
                  6204007B110100850800F62402008A1000EC4D0400142000184104002C4E0030
                  8A080058980060241100B02801C06822006041028023880080C508008E220200
                  16220038920800588400E068220060010280194400C0640280594400C0440280
                  994400C0240280D94400C004028015880080830900562102000E240058890800
                  38880060352200E000028015890080C10400AB12010003090056260200061100
                  AC4E04000C2000A8400400EC4C0050850800D89100A0121100B0130140352200
                  600702808A4400C0830400558900800708002A13010077120054270200EE2000
                  E8400400DC4800D0850800B88100A013110070250140372200E00A02808E4400
                  C0050280AE4400C02B04009D890080330400DD89008017080012880080270400
                  294400C0170400494400C0270280342200E08D0020930800E20900528900209A
                  0020990800620900D28900209200001100041200F0910800A20800F84C040031
                  04007C4D04001104003C270280F60400BC4C0400AD0900384F04006D0900789D
                  08005A120070990800DA1100701D1100B42200E07A2200684300C06D4400D082
                  0080DB8900A03C0100F7110140690200EE270280B204003C460400250900789C
                  0800CA1100B00F1100942200603F2200284300C0BE440050820080FD89006079
                  0200C61001C0D204008C230280650900184B04004B1200309E0800962300E018
                  2200588A0080E38800601902008E250280250800389E0800A6130030870800A6
                  1200308F0800A6110030970800A6100030DFBBD3FD78BAB7B31F72905F4FF7DD
                  E97E9FFD10482600600D295F02FE7BBABF9DEE3FB31F02E90400ACA37B04187F
                  58880080B5748D00E30F8B1100B09E6E1160FC61410200D6D425028C3F2C4A00
                  C0BAAA4780F187850900585BD50830FEB0380100EBAB1601C61F0A1000504395
                  0830FE508400803A568F00E30F850800A865D50830FE508C00807A568B00E30F
                  050900A869950830FE50940080BA664780F187C20400D4362B028C3F142700A0
                  BEA323C0F8430302007A382A028C3F342100A08FD11160FCA1110100BD8C8A00
                  E30FCD0800E867EF0830FED09000809EF68A00E30F4D0900E8EBD10830FED098
                  0080DEEE8D00E30FCD0900E8EFD60830FE10400040866B23C0F843080100392E
                  4580F187200200B29C8B00E30F610400E4791A01C61F020900C8B445C0B76F8C
                  3F44120090EBDDA7DFF7B31F021C4F0000402001000081040000041200001048
                  0000402001000081040000041200001048000040200100008104000004120000
                  1048000040200100008104000004120000104800004020010000810400000412
                  0000104800004020010000810400000412000010480000402001000081040000
                  0412000010480000402001000081040000041200001048000040200100008104
                  0000041200001048000040200100008104000004120000104800004020010000
                  8104000004120000104800004020010000810400000412000010480000402001
                  0000810400000412000010480000402001000081040000041200001048000040
                  2001000081040000041200001048000040200100008104000004120000104800
                  0040200100008104000004120000104800004020010000810400000412000010
                  4800004020010000810400000412000010480000402001000081040000041200
                  0010480000402001000081040000041200001048000040A0FF030801D62EB80B
                  0D7D0000000049454E44AE426082}
                Proportional = True
                OnClick = iButtonBackAlterarSenhaClick
              end
              object pButtonAlterarSenhaPerfilE: TPanel
                Left = 302
                Top = 11
                Width = 86
                Height = 26
                BevelOuter = bvNone
                Caption = 'Alterar Senha'
                Color = clCoral
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentBackground = False
                ParentFont = False
                TabOrder = 0
                OnClick = pButtonAlterarSenhaVClick
              end
            end
            object pInfoE: TPanel
              AlignWithMargins = True
              Left = 0
              Top = 48
              Width = 394
              Height = 112
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 1
              object ScrollBox3: TScrollBox
                AlignWithMargins = True
                Left = 0
                Top = 0
                Width = 394
                Height = 112
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alClient
                BevelOuter = bvNone
                BorderStyle = bsNone
                TabOrder = 0
                object Label3: TLabel
                  Left = 9
                  Top = 8
                  Width = 107
                  Height = 20
                  Caption = 'Dados Pessoais'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Segoe UI'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label4: TLabel
                  Left = 9
                  Top = 33
                  Width = 36
                  Height = 15
                  Caption = 'Nome:'
                end
                object Label6: TLabel
                  Left = 9
                  Top = 60
                  Width = 24
                  Height = 15
                  Caption = 'CPF:'
                end
                object Label7: TLabel
                  Left = 9
                  Top = 85
                  Width = 48
                  Height = 15
                  Caption = 'Telefone:'
                end
                object Label10: TLabel
                  Left = 202
                  Top = 33
                  Width = 32
                  Height = 15
                  Caption = 'Email:'
                end
                object eNomeDE: TEdit
                  Left = 63
                  Top = 30
                  Width = 121
                  Height = 23
                  TabOrder = 0
                  Text = 'eNomeDE'
                end
                object eEmailDE: TEdit
                  Left = 240
                  Top = 30
                  Width = 148
                  Height = 23
                  TabOrder = 1
                  Text = 'eEmailDE'
                end
                object meCPFDE: TMaskEdit
                  Left = 63
                  Top = 57
                  Width = 121
                  Height = 23
                  TabOrder = 2
                  Text = 'meCPFDE'
                end
                object meTelefoneDE: TMaskEdit
                  Left = 63
                  Top = 82
                  Width = 121
                  Height = 23
                  TabOrder = 3
                  Text = 'meTelefoneDE'
                end
              end
              object pSalvar: TPanel
                Left = 302
                Top = 83
                Width = 86
                Height = 24
                BevelOuter = bvNone
                Caption = 'Salvar'
                Color = clCoral
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentBackground = False
                ParentFont = False
                TabOrder = 1
              end
            end
          end
        end
        object tsAtualizarSenhaPerfil: TTabSheet
          Caption = 'tsAtualizarSenhaPerfil'
          ImageIndex = 2
          object lblAlterarSenhaTitle: TLabel
            Left = 39
            Top = 12
            Width = 103
            Height = 21
            Caption = 'Alterar Senha'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object iButtonBackAlterarSenha: TImage
            Left = 3
            Top = 9
            Width = 30
            Height = 30
            Center = True
            Picture.Data = {
              0954506E67496D61676589504E470D0A1A0A0000000D49484452000002000000
              02000806000000F478D4FA000000097048597300000B1300000B1301009A9C18
              000000B46558496649492A000800000006001201030001000000010000001A01
              050001000000560000001B010500010000005E00000028010300010000000200
              0000130203000100000001000000698704000100000066000000000000004800
              0000010000004800000001000000060000900700040000003032313001910700
              040000000102030000A00700040000003031303001A0030001000000FFFF0000
              02A00400010000000002000003A00400010000000002000000000000915FF1DA
              00000E164944415478DAEDD84DAA5CD715866119F7051983879096461008B89B
              99791499802160703ACA400CEE07627753B2742CE9DE5BB7FECE3E7BAFF53D0F
              2C8AEAEDDEF772BE790300C4F966F6030080E309000008240000209000008040
              0200000209000008240000209000008040020000020900000824000020900000
              8040020000020900000824000020900000804002000002090000082400002090
              0000804002000002090000082400002090000080400200000209000008240000
              2090000080400200000209000008240000209000008040020000020900000824
              0000209000008040020000020900000824000020900000804002000002090000
              0824000020900000804002000002090000082400002090000080400200000209
              0000082400002090000080400200000209000008240000209000008040020000
              0209000008240000209000008040020000020900000824000020900000804002
              0000020900000824000020900000804002000002090000082400002090000080
              4002000002090000082400002090000080400200000209000008240000209000
              0080400200000209000008240000209000008040020072BDFBF4FB7EF64380E3
              0900C8F461FC7F3CDDB7A7FBFBE9FE3DFB41C0B10400E4D9C6FFEDA7FFFF7B23
              02208E00802C4FC77F2302208C00801CE7C67F2302208800800C97C67F230220
              840080FEAE1DFF8D08800002007ABB75FC3722009A1300D0D7BDE3BF1101D098
              00809E1E1DFF8D0880A60400F4B3D7F86F4400342400A097BDC77F2302A01901
              007D8C1AFF8D0880460400F4307AFC3722009A100050DF51E3BF1101D0800080
              DA8E1EFF8D0880E20400D4356BFC3722000A130050D3ECF1DF8800284A00403D
              AB8CFF4604404102006A596DFC3722008A110050C7AAE3BF1101508800801A56
              1FFF8D0880220400ACAFCAF86F4400142000606DD5C67F230260710200D65575
              FC372200162600604DD5C77F230260510200D6D365FC372200162400602DDDC6
              7F230260310200D6D175FC372200162200600DDDC77F230260110200E64B19FF
              CDAFA7FBEE74BFCF7E082413003057DAF8FF76BAEF4FF7D3EC87403A0100F318
              7F601A010073187F602A0100C733FEC07402008E65FC81250800388EF1079621
              00E018C61F588A0080F18C3FB01C010063197F60490200C631FEC0B204008C61
              FC81A50900D89FF107962700605FC61F284100C07E8C3F508600807D187FA014
              01008F33FE403902001E63FC81920400DCCFF803650900B88FF1074A1300703B
              E30F942700E036C61F684100C0F58C3FD0860080EB187FA015010097197FA01D
              0100AF33FE404B0200CE33FE405B02005E66FC81D604003C67FC81F604007CCD
              F8031104007C66FC811802003E32FE40140100C61F0824004867FC8148028064
              C61F8825004865FC8168028044C61F8827004863FC01DE0800B2187F804F0400
              298C3FC0170400098C3FC0130280EE8C3FC00B04009D197F803304005D197F80
              5708003A32FE00170800BA31FE005710007462FC01AE2400E8C2F803DC4000D0
              81F107B89100A03AE30F7007014065C61FE04E0280AA8C3FC003040015197F80
              070900AA31FE003B10005462FC01762200A8C2F803EC48005081F107D8990060
              75C61F600001C0CA8C3FC020028055197F808104002B32FE008309005663FC01
              0E20005889F1073888006015C61FE040028015187F808309006633FE00130800
              6632FE009308006631FE001309006630FE009309008E66FC011620003892F107
              588400E028C61F6021028023187F80C508004633FE000B12008C64FC01162500
              18C5F8032C4C003082F107589C00606FC61FA00001C09E8C3F40110280BD187F
              804204007B30FE00C508001E65FC010A12003CC2F803142500B897F107284C00
              700FE30F509C00E056C61FA00101C02D8C3F401302806B197F80460400D730FE
              00CD08002E31FE000D09005E63FC019A12009C63FC011A1300BCC4F803342700
              78CAF8030410007CC9F8038410006C8C3F401001C007C61F208C00C0F8030412
              00D98C3F40280190CBF803041300998C3F40380190C7F8032000C2187F00FE20
              0072187F00FE240032187F00BE2200FA33FE003C23007A33FE00BC4800F465FC
              01384B00F464FC01789500E8C7F803709100E8C5F803701501D087F107E06A02
              A007E30FC04D04407DC61F809B0980DA8C3F0077110075197F00EE26006A32FE
              003C4400D463FC01789800A8C5F803B00B015047DAF87FF0C3E97E9EFD0860BA
              5F4EF77EF623BA110035248E3FC0E69FA7FBC7EC47742300D667FC8174026000
              01B036E30F2000861000EB32FE001F09800104C09A8C3FC06702600001B01EE3
              0FF03501308000588BF107784E000C2000D661FC015E26000610006B30FE00E7
              09800104C07CC61FE075026000013097F107B84C000C2000E631FE00D7110003
              0880398C3FC0F504C00002E078C61FE03602600001702CE30F703B0130800038
              8EF107B88F001840001CC3F803DC4F000C2000C633FE008F1100030880B18C3F
              C0E304C00002601CE30FB00F0130800018C3F803EC47000C2000C6F8EBE9FE75
              BABFCC7E08400302600001308E0800D887001840008C2502001E2700061000E3
              890080C708800104C0314400C0FD04C00002E0382200E03E02600001702C1100
              703B01308000389E0800B88D00184000CC210200AE2700061000F3880080EB08
              800104C05C2200E03201308000984F0400BC4E000C2000D6200200CE13000308
              80758800809709800104C05A4400C07302600001B01E1100F035013080005893
              0800F84C000C2000D62502003E1200030880B589000001308400589F0800D209
              800104400D220048260006100075BC3BDD8FA77B3BFB2107FAE1743FCF7E0430
              DD2FA77B3FFB11DD08805AD2BE04FC76BAEF4FF7D3EC8700742300EA1101003C
              4C00D4240200788800A84B0400703701509B0800E02E02A03E1100C0CD04400F
              2200809B08803E440000571300BD880000AE2200FA1101005C24007A120100BC
              4A00F4250200384B00F4260200789100E84F0400F08C00C8200200F88A00C821
              0200F89300C8220200F88300C82302001000A14400403801904B0400041300D9
              4400402801800800082400F84004008411006C4400401001C0974400400801C0
              532200208000E0252200A03901C0392200A03101C06B4400405302804B440040
              4302806B880080660400D71201008D08006E2102009A1000DC4A0400342000B8
              870800284E00702F1100509800E0112200A02801C0A34400404102803D880080
              6204007B110100850800F62402008A1000EC4D0400142000184104002C4E0030
              8A080058980060241100B02801C06822006041028023880080C508008E220200
              16220038920800588400E068220060010280194400C0640280594400C0440280
              994400C0240280D94400C004028015880080830900562102000E240058890800
              38880060352200E000028015890080C10400AB12010003090056260200061100
              AC4E04000C2000A8400400EC4C0050850800D89100A0121100B0130140352200
              600702808A4400C0830400558900800708002A13010077120054270200EE2000
              E8400400DC4800D0850800B88100A013110070250140372200E00A02808E4400
              C0050280AE4400C02B04009D890080330400DD89008017080012880080270400
              294400C0170400494400C0270280342200E08D0020930800E20900528900209A
              0020990800620900D28900209200001100041200F0910800A20800F84C040031
              04007C4D04001104003C270280F60400BC4C0400AD0900384F04006D0900789D
              08005A120070990800DA1100701D1100B42200E07A2200684300C06D4400D082
              0080DB8900A03C0100F7110140690200EE270280B204003C460400250900789C
              0800CA1100B00F1100942200603F2200284300C0BE440050820080FD89006079
              0200C61001C0D204008C230280650900184B04004B1200309E0800962300E018
              2200588A0080E38800601902008E250280250800389E0800A6130030870800A6
              1200308F0800A6110030970800A6100030DFBBD3FD78BAB7B31F72905F4FF7DD
              E97E9FFD10482600600D295F02FE7BBABF9DEE3FB31F02E90400ACA37B04187F
              58880080B5748D00E30F8B1100B09E6E1160FC61410200D6D425028C3F2C4A00
              C0BAAA4780F187850900585BD50830FEB0380100EBAB1601C61F0A1000504395
              0830FE508400803A568F00E30F850800A865D50830FE508C00807A568B00E30F
              050900A869950830FE50940080BA664780F187C20400D4362B028C3F142700A0
              BEA323C0F8430302007A382A028C3F342100A08FD11160FCA1110100BD8C8A00
              E30FCD0800E867EF0830FED09000809EF68A00E30F4D0900E8EBD10830FED098
              0080DEEE8D00E30FCD0900E8EFD60830FE10400040866B23C0F843080100392E
              4580F187200200B29C8B00E30F610400E4791A01C61F020900C8B445C0B76F8C
              3F44120090EBDDA7DFF7B31F021C4F0000402001000081040000041200001048
              0000402001000081040000041200001048000040200100008104000004120000
              1048000040200100008104000004120000104800004020010000810400000412
              0000104800004020010000810400000412000010480000402001000081040000
              0412000010480000402001000081040000041200001048000040200100008104
              0000041200001048000040200100008104000004120000104800004020010000
              8104000004120000104800004020010000810400000412000010480000402001
              0000810400000412000010480000402001000081040000041200001048000040
              2001000081040000041200001048000040200100008104000004120000104800
              0040200100008104000004120000104800004020010000810400000412000010
              4800004020010000810400000412000010480000402001000081040000041200
              0010480000402001000081040000041200001048000040A0FF030801D62EB80B
              0D7D0000000049454E44AE426082}
            Proportional = True
            OnClick = iButtonBackAlterarSenhaClick
          end
          object pAlterarSenha: TPanel
            Left = 27
            Top = 63
            Width = 337
            Height = 244
            BevelOuter = bvNone
            Color = clCoral
            ParentBackground = False
            TabOrder = 0
            object lblAlterarSenha: TLabel
              Left = 120
              Top = 12
              Width = 120
              Height = 25
              Caption = 'Alterar Senha'
              Color = clCream
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -19
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object lblSenhaAtual: TLabel
              Left = 40
              Top = 58
              Width = 67
              Height = 15
              Caption = 'Senha atual:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblNovaSenha: TLabel
              Left = 40
              Top = 87
              Width = 67
              Height = 15
              Caption = 'Nova senha:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblDigiteNovamente: TLabel
              Left = 40
              Top = 110
              Width = 101
              Height = 30
              Caption = 'Digite novamente'#13#10' a nova senha:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object eSenhaAtual: TEdit
              Left = 147
              Top = 55
              Width = 150
              Height = 23
              TabOrder = 0
            end
            object eSenhaNova: TEdit
              Left = 147
              Top = 84
              Width = 150
              Height = 23
              TabOrder = 1
            end
            object eSenhaConfirmacao: TEdit
              Left = 147
              Top = 113
              Width = 150
              Height = 23
              TabOrder = 2
            end
            object pButtonConfirmarAlterarSenha: TPanel
              Left = 80
              Top = 184
              Width = 71
              Height = 41
              Caption = 'Confirmar'
              TabOrder = 3
            end
            object pButtonCancelarAlterarSenha: TPanel
              Left = 200
              Top = 184
              Width = 71
              Height = 41
              Caption = 'Cancelar'
              TabOrder = 4
            end
          end
          object pDicas: TPanel
            Left = 27
            Top = 339
            Width = 337
            Height = 209
            BevelOuter = bvNone
            Color = clCoral
            ParentBackground = False
            TabOrder = 1
            object lblDicasTitle: TLabel
              Left = 42
              Top = 20
              Width = 246
              Height = 25
              Caption = 'Dicas para uma senha forte:'
              Color = clCream
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -19
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object lblDicas: TLabel
              Left = 53
              Top = 66
              Width = 248
              Height = 120
              Caption = 
                ' - Minimo de 6 caracteres;'#13#10' - Mai'#250'sculas e Min'#250'sculas;'#13#10' - N'#250'me' +
                'ros;'#13#10' - Caracteres especiais;'#13#10' - Evite dados pessoais(anivers'#225 +
                'rio, '#13#10'n'#250'mero de celular, etc.).'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
        object tsEnderecosE: TTabSheet
          Caption = 'tsEnderecosE'
          ImageIndex = 3
          object scbxMainEnderecosE: TScrollBox
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 394
            Height = 584
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            BevelOuter = bvNone
            BorderStyle = bsNone
            TabOrder = 0
            UseWheelForScrolling = True
            object pEnderecosE: TPanel
              AlignWithMargins = True
              Left = 0
              Top = 48
              Width = 377
              Height = 541
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
              object scbxEnderecosE: TScrollBox
                AlignWithMargins = True
                Left = 0
                Top = 0
                Width = 377
                Height = 541
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alClient
                BevelOuter = bvNone
                BorderStyle = bsNone
                TabOrder = 0
                UseWheelForScrolling = True
                object lblEnderecosTitle: TLabel
                  Left = 9
                  Top = 14
                  Width = 71
                  Height = 20
                  Caption = 'Endere'#231'os'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Segoe UI'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
              end
            end
            object pHeaderEnderecosE: TPanel
              AlignWithMargins = True
              Left = 0
              Top = 2
              Width = 377
              Height = 46
              Margins.Left = 0
              Margins.Top = 2
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 1
              object lblPerfilTitleEnderecosE: TLabel
                Left = 53
                Top = 13
                Width = 41
                Height = 21
                Caption = 'Perfil'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object iButtonBackEnderecosE: TImage
                Left = 7
                Top = 8
                Width = 30
                Height = 30
                Center = True
                Picture.Data = {
                  0954506E67496D61676589504E470D0A1A0A0000000D49484452000002000000
                  02000806000000F478D4FA000000097048597300000B1300000B1301009A9C18
                  000000B46558496649492A000800000006001201030001000000010000001A01
                  050001000000560000001B010500010000005E00000028010300010000000200
                  0000130203000100000001000000698704000100000066000000000000004800
                  0000010000004800000001000000060000900700040000003032313001910700
                  040000000102030000A00700040000003031303001A0030001000000FFFF0000
                  02A00400010000000002000003A00400010000000002000000000000915FF1DA
                  00000E164944415478DAEDD84DAA5CD715866119F7051983879096461008B89B
                  99791499802160703ACA400CEE07627753B2742CE9DE5BB7FECE3E7BAFF53D0F
                  2C8AEAEDDEF772BE790300C4F966F6030080E309000008240000209000008040
                  0200000209000008240000209000008040020000020900000824000020900000
                  8040020000020900000824000020900000804002000002090000082400002090
                  0000804002000002090000082400002090000080400200000209000008240000
                  2090000080400200000209000008240000209000008040020000020900000824
                  0000209000008040020000020900000824000020900000804002000002090000
                  0824000020900000804002000002090000082400002090000080400200000209
                  0000082400002090000080400200000209000008240000209000008040020000
                  0209000008240000209000008040020000020900000824000020900000804002
                  0000020900000824000020900000804002000002090000082400002090000080
                  4002000002090000082400002090000080400200000209000008240000209000
                  0080400200000209000008240000209000008040020072BDFBF4FB7EF64380E3
                  0900C8F461FC7F3CDDB7A7FBFBE9FE3DFB41C0B10400E4D9C6FFEDA7FFFF7B23
                  02208E00802C4FC77F2302208C00801CE7C67F2302208800800C97C67F230220
                  840080FEAE1DFF8D08800002007ABB75FC3722009A1300D0D7BDE3BF1101D098
                  00809E1E1DFF8D0880A60400F4B3D7F86F4400342400A097BDC77F2302A01901
                  007D8C1AFF8D0880460400F4307AFC3722009A100050DF51E3BF1101D0800080
                  DA8E1EFF8D0880E20400D4356BFC3722000A130050D3ECF1DF8800284A00403D
                  AB8CFF4604404102006A596DFC3722008A110050C7AAE3BF1101508800801A56
                  1FFF8D0880220400ACAFCAF86F4400142000606DD5C67F230260710200D65575
                  FC372200162600604DD5C77F230260510200D6D365FC372200162400602DDDC6
                  7F230260310200D6D175FC372200162200600DDDC77F230260110200E64B19FF
                  CDAFA7FBEE74BFCF7E082413003057DAF8FF76BAEF4FF7D3EC87403A0100F318
                  7F601A010073187F602A0100C733FEC07402008E65FC81250800388EF1079621
                  00E018C61F588A0080F18C3FB01C010063197F60490200C631FEC0B204008C61
                  FC81A50900D89FF107962700605FC61F284100C07E8C3F508600807D187FA014
                  01008F33FE403902001E63FC81920400DCCFF803650900B88FF1074A1300703B
                  E30F942700E036C61F684100C0F58C3FD0860080EB187FA015010097197FA01D
                  0100AF33FE404B0200CE33FE405B02005E66FC81D604003C67FC81F604007CCD
                  F8031104007C66FC811802003E32FE40140100C61F0824004867FC8148028064
                  C61F8825004865FC8168028044C61F8827004863FC01DE0800B2187F804F0400
                  298C3FC0170400098C3FC0130280EE8C3FC00B04009D197F803304005D197F80
                  5708003A32FE00170800BA31FE005710007462FC01AE2400E8C2F803DC4000D0
                  81F107B89100A03AE30F7007014065C61FE04E0280AA8C3FC003040015197F80
                  070900AA31FE003B10005462FC01762200A8C2F803EC48005081F107D8990060
                  75C61F600001C0CA8C3FC020028055197F808104002B32FE008309005663FC01
                  0E20005889F1073888006015C61FE040028015187F808309006633FE00130800
                  6632FE009308006631FE001309006630FE009309008E66FC011620003892F107
                  588400E028C61F6021028023187F80C508004633FE000B12008C64FC01162500
                  18C5F8032C4C003082F107589C00606FC61FA00001C09E8C3F40110280BD187F
                  804204007B30FE00C508001E65FC010A12003CC2F803142500B897F107284C00
                  700FE30F509C00E056C61FA00101C02D8C3F401302806B197F80460400D730FE
                  00CD08002E31FE000D09005E63FC019A12009C63FC011A1300BCC4F803342700
                  78CAF8030410007CC9F8038410006C8C3F401001C007C61F208C00C0F8030412
                  00D98C3F40280190CBF803041300998C3F40380190C7F8032000C2187F00FE20
                  0072187F00FE240032187F00BE2200FA33FE003C23007A33FE00BC4800F465FC
                  01384B00F464FC01789500E8C7F803709100E8C5F803701501D087F107E06A02
                  A007E30FC04D04407DC61F809B0980DA8C3F0077110075197F00EE26006A32FE
                  003C4400D463FC01789800A8C5F803B00B015047DAF87FF0C3E97E9EFD0860BA
                  5F4EF77EF623BA110035248E3FC0E69FA7FBC7EC47742300D667FC8174026000
                  01B036E30F2000861000EB32FE001F09800104C09A8C3FC06702600001B01EE3
                  0FF03501308000588BF107784E000C2000D661FC015E26000610006B30FE00E7
                  09800104C07CC61FE075026000013097F107B84C000C2000E631FE00D7110003
                  0880398C3FC0F504C00002E078C61FE03602600001702CE30F703B0130800038
                  8EF107B88F001840001CC3F803DC4F000C2000C633FE008F1100030880B18C3F
                  C0E304C00002601CE30FB00F0130800018C3F803EC47000C2000C6F8EBE9FE75
                  BABFCC7E08400302600001308E0800D887001840008C2502001E2700061000E3
                  890080C708800104C0314400C0FD04C00002E0382200E03E02600001702C1100
                  703B01308000389E0800B88D00184000CC210200AE2700061000F3880080EB08
                  800104C05C2200E03201308000984F0400BC4E000C2000D6200200CE13000308
                  80758800809709800104C05A4400C07302600001B01E1100F035013080005893
                  0800F84C000C2000D62502003E1200030880B589000001308400589F0800D209
                  800104400D220048260006100075BC3BDD8FA77B3BFB2107FAE1743FCF7E0430
                  DD2FA77B3FFB11DD08805AD2BE04FC76BAEF4FF7D3EC8700742300EA1101003C
                  4C00D4240200788800A84B0400703701509B0800E02E02A03E1100C0CD04400F
                  2200809B08803E440000571300BD880000AE2200FA1101005C24007A120100BC
                  4A00F4250200384B00F4260200789100E84F0400F08C00C8200200F88A00C821
                  0200F89300C8220200F88300C82302001000A14400403801904B0400041300D9
                  4400402801800800082400F84004008411006C4400401001C0974400400801C0
                  532200208000E0252200A03901C0392200A03101C06B4400405302804B440040
                  4302806B880080660400D71201008D08006E2102009A1000DC4A0400342000B8
                  870800284E00702F1100509800E0112200A02801C0A34400404102803D880080
                  6204007B110100850800F62402008A1000EC4D0400142000184104002C4E0030
                  8A080058980060241100B02801C06822006041028023880080C508008E220200
                  16220038920800588400E068220060010280194400C0640280594400C0440280
                  994400C0240280D94400C004028015880080830900562102000E240058890800
                  38880060352200E000028015890080C10400AB12010003090056260200061100
                  AC4E04000C2000A8400400EC4C0050850800D89100A0121100B0130140352200
                  600702808A4400C0830400558900800708002A13010077120054270200EE2000
                  E8400400DC4800D0850800B88100A013110070250140372200E00A02808E4400
                  C0050280AE4400C02B04009D890080330400DD89008017080012880080270400
                  294400C0170400494400C0270280342200E08D0020930800E20900528900209A
                  0020990800620900D28900209200001100041200F0910800A20800F84C040031
                  04007C4D04001104003C270280F60400BC4C0400AD0900384F04006D0900789D
                  08005A120070990800DA1100701D1100B42200E07A2200684300C06D4400D082
                  0080DB8900A03C0100F7110140690200EE270280B204003C460400250900789C
                  0800CA1100B00F1100942200603F2200284300C0BE440050820080FD89006079
                  0200C61001C0D204008C230280650900184B04004B1200309E0800962300E018
                  2200588A0080E38800601902008E250280250800389E0800A6130030870800A6
                  1200308F0800A6110030970800A6100030DFBBD3FD78BAB7B31F72905F4FF7DD
                  E97E9FFD10482600600D295F02FE7BBABF9DEE3FB31F02E90400ACA37B04187F
                  58880080B5748D00E30F8B1100B09E6E1160FC61410200D6D425028C3F2C4A00
                  C0BAAA4780F187850900585BD50830FEB0380100EBAB1601C61F0A1000504395
                  0830FE508400803A568F00E30F850800A865D50830FE508C00807A568B00E30F
                  050900A869950830FE50940080BA664780F187C20400D4362B028C3F142700A0
                  BEA323C0F8430302007A382A028C3F342100A08FD11160FCA1110100BD8C8A00
                  E30FCD0800E867EF0830FED09000809EF68A00E30F4D0900E8EBD10830FED098
                  0080DEEE8D00E30FCD0900E8EFD60830FE10400040866B23C0F843080100392E
                  4580F187200200B29C8B00E30F610400E4791A01C61F020900C8B445C0B76F8C
                  3F44120090EBDDA7DFF7B31F021C4F0000402001000081040000041200001048
                  0000402001000081040000041200001048000040200100008104000004120000
                  1048000040200100008104000004120000104800004020010000810400000412
                  0000104800004020010000810400000412000010480000402001000081040000
                  0412000010480000402001000081040000041200001048000040200100008104
                  0000041200001048000040200100008104000004120000104800004020010000
                  8104000004120000104800004020010000810400000412000010480000402001
                  0000810400000412000010480000402001000081040000041200001048000040
                  2001000081040000041200001048000040200100008104000004120000104800
                  0040200100008104000004120000104800004020010000810400000412000010
                  4800004020010000810400000412000010480000402001000081040000041200
                  0010480000402001000081040000041200001048000040A0FF030801D62EB80B
                  0D7D0000000049454E44AE426082}
                Proportional = True
                OnClick = iButtonBackAlterarSenhaClick
              end
              object pButtonAlterarSenhaEnderecosE: TPanel
                Left = 302
                Top = 11
                Width = 86
                Height = 26
                BevelOuter = bvNone
                Caption = 'Alterar Senha'
                Color = clCoral
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentBackground = False
                ParentFont = False
                TabOrder = 0
              end
            end
          end
        end
        object tsPagamentosE: TTabSheet
          Caption = 'tsPagamentosE'
          ImageIndex = 4
          object scbxMainPagamentosE: TScrollBox
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 394
            Height = 584
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            BevelOuter = bvNone
            BorderStyle = bsNone
            TabOrder = 0
            UseWheelForScrolling = True
            object pPagamentosE: TPanel
              AlignWithMargins = True
              Left = 0
              Top = 48
              Width = 394
              Height = 536
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
              object scbxPagamentosE: TScrollBox
                AlignWithMargins = True
                Left = 0
                Top = 0
                Width = 394
                Height = 536
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alClient
                BevelOuter = bvNone
                BorderStyle = bsNone
                TabOrder = 0
                UseWheelForScrolling = True
                object lblPagamentosTitle: TLabel
                  Left = 9
                  Top = 12
                  Width = 157
                  Height = 20
                  Caption = 'Formas de Pagamento'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Segoe UI'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
              end
            end
            object pHeaderPagamentosE: TPanel
              AlignWithMargins = True
              Left = 0
              Top = 2
              Width = 394
              Height = 46
              Margins.Left = 0
              Margins.Top = 2
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 1
              object lblPerfilTitlePagamentosE: TLabel
                Left = 53
                Top = 13
                Width = 41
                Height = 21
                Caption = 'Perfil'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object iButtonBackPagamentosE: TImage
                Left = 7
                Top = 8
                Width = 30
                Height = 30
                Center = True
                Picture.Data = {
                  0954506E67496D61676589504E470D0A1A0A0000000D49484452000002000000
                  02000806000000F478D4FA000000097048597300000B1300000B1301009A9C18
                  000000B46558496649492A000800000006001201030001000000010000001A01
                  050001000000560000001B010500010000005E00000028010300010000000200
                  0000130203000100000001000000698704000100000066000000000000004800
                  0000010000004800000001000000060000900700040000003032313001910700
                  040000000102030000A00700040000003031303001A0030001000000FFFF0000
                  02A00400010000000002000003A00400010000000002000000000000915FF1DA
                  00000E164944415478DAEDD84DAA5CD715866119F7051983879096461008B89B
                  99791499802160703ACA400CEE07627753B2742CE9DE5BB7FECE3E7BAFF53D0F
                  2C8AEAEDDEF772BE790300C4F966F6030080E309000008240000209000008040
                  0200000209000008240000209000008040020000020900000824000020900000
                  8040020000020900000824000020900000804002000002090000082400002090
                  0000804002000002090000082400002090000080400200000209000008240000
                  2090000080400200000209000008240000209000008040020000020900000824
                  0000209000008040020000020900000824000020900000804002000002090000
                  0824000020900000804002000002090000082400002090000080400200000209
                  0000082400002090000080400200000209000008240000209000008040020000
                  0209000008240000209000008040020000020900000824000020900000804002
                  0000020900000824000020900000804002000002090000082400002090000080
                  4002000002090000082400002090000080400200000209000008240000209000
                  0080400200000209000008240000209000008040020072BDFBF4FB7EF64380E3
                  0900C8F461FC7F3CDDB7A7FBFBE9FE3DFB41C0B10400E4D9C6FFEDA7FFFF7B23
                  02208E00802C4FC77F2302208C00801CE7C67F2302208800800C97C67F230220
                  840080FEAE1DFF8D08800002007ABB75FC3722009A1300D0D7BDE3BF1101D098
                  00809E1E1DFF8D0880A60400F4B3D7F86F4400342400A097BDC77F2302A01901
                  007D8C1AFF8D0880460400F4307AFC3722009A100050DF51E3BF1101D0800080
                  DA8E1EFF8D0880E20400D4356BFC3722000A130050D3ECF1DF8800284A00403D
                  AB8CFF4604404102006A596DFC3722008A110050C7AAE3BF1101508800801A56
                  1FFF8D0880220400ACAFCAF86F4400142000606DD5C67F230260710200D65575
                  FC372200162600604DD5C77F230260510200D6D365FC372200162400602DDDC6
                  7F230260310200D6D175FC372200162200600DDDC77F230260110200E64B19FF
                  CDAFA7FBEE74BFCF7E082413003057DAF8FF76BAEF4FF7D3EC87403A0100F318
                  7F601A010073187F602A0100C733FEC07402008E65FC81250800388EF1079621
                  00E018C61F588A0080F18C3FB01C010063197F60490200C631FEC0B204008C61
                  FC81A50900D89FF107962700605FC61F284100C07E8C3F508600807D187FA014
                  01008F33FE403902001E63FC81920400DCCFF803650900B88FF1074A1300703B
                  E30F942700E036C61F684100C0F58C3FD0860080EB187FA015010097197FA01D
                  0100AF33FE404B0200CE33FE405B02005E66FC81D604003C67FC81F604007CCD
                  F8031104007C66FC811802003E32FE40140100C61F0824004867FC8148028064
                  C61F8825004865FC8168028044C61F8827004863FC01DE0800B2187F804F0400
                  298C3FC0170400098C3FC0130280EE8C3FC00B04009D197F803304005D197F80
                  5708003A32FE00170800BA31FE005710007462FC01AE2400E8C2F803DC4000D0
                  81F107B89100A03AE30F7007014065C61FE04E0280AA8C3FC003040015197F80
                  070900AA31FE003B10005462FC01762200A8C2F803EC48005081F107D8990060
                  75C61F600001C0CA8C3FC020028055197F808104002B32FE008309005663FC01
                  0E20005889F1073888006015C61FE040028015187F808309006633FE00130800
                  6632FE009308006631FE001309006630FE009309008E66FC011620003892F107
                  588400E028C61F6021028023187F80C508004633FE000B12008C64FC01162500
                  18C5F8032C4C003082F107589C00606FC61FA00001C09E8C3F40110280BD187F
                  804204007B30FE00C508001E65FC010A12003CC2F803142500B897F107284C00
                  700FE30F509C00E056C61FA00101C02D8C3F401302806B197F80460400D730FE
                  00CD08002E31FE000D09005E63FC019A12009C63FC011A1300BCC4F803342700
                  78CAF8030410007CC9F8038410006C8C3F401001C007C61F208C00C0F8030412
                  00D98C3F40280190CBF803041300998C3F40380190C7F8032000C2187F00FE20
                  0072187F00FE240032187F00BE2200FA33FE003C23007A33FE00BC4800F465FC
                  01384B00F464FC01789500E8C7F803709100E8C5F803701501D087F107E06A02
                  A007E30FC04D04407DC61F809B0980DA8C3F0077110075197F00EE26006A32FE
                  003C4400D463FC01789800A8C5F803B00B015047DAF87FF0C3E97E9EFD0860BA
                  5F4EF77EF623BA110035248E3FC0E69FA7FBC7EC47742300D667FC8174026000
                  01B036E30F2000861000EB32FE001F09800104C09A8C3FC06702600001B01EE3
                  0FF03501308000588BF107784E000C2000D661FC015E26000610006B30FE00E7
                  09800104C07CC61FE075026000013097F107B84C000C2000E631FE00D7110003
                  0880398C3FC0F504C00002E078C61FE03602600001702CE30F703B0130800038
                  8EF107B88F001840001CC3F803DC4F000C2000C633FE008F1100030880B18C3F
                  C0E304C00002601CE30FB00F0130800018C3F803EC47000C2000C6F8EBE9FE75
                  BABFCC7E08400302600001308E0800D887001840008C2502001E2700061000E3
                  890080C708800104C0314400C0FD04C00002E0382200E03E02600001702C1100
                  703B01308000389E0800B88D00184000CC210200AE2700061000F3880080EB08
                  800104C05C2200E03201308000984F0400BC4E000C2000D6200200CE13000308
                  80758800809709800104C05A4400C07302600001B01E1100F035013080005893
                  0800F84C000C2000D62502003E1200030880B589000001308400589F0800D209
                  800104400D220048260006100075BC3BDD8FA77B3BFB2107FAE1743FCF7E0430
                  DD2FA77B3FFB11DD08805AD2BE04FC76BAEF4FF7D3EC8700742300EA1101003C
                  4C00D4240200788800A84B0400703701509B0800E02E02A03E1100C0CD04400F
                  2200809B08803E440000571300BD880000AE2200FA1101005C24007A120100BC
                  4A00F4250200384B00F4260200789100E84F0400F08C00C8200200F88A00C821
                  0200F89300C8220200F88300C82302001000A14400403801904B0400041300D9
                  4400402801800800082400F84004008411006C4400401001C0974400400801C0
                  532200208000E0252200A03901C0392200A03101C06B4400405302804B440040
                  4302806B880080660400D71201008D08006E2102009A1000DC4A0400342000B8
                  870800284E00702F1100509800E0112200A02801C0A34400404102803D880080
                  6204007B110100850800F62402008A1000EC4D0400142000184104002C4E0030
                  8A080058980060241100B02801C06822006041028023880080C508008E220200
                  16220038920800588400E068220060010280194400C0640280594400C0440280
                  994400C0240280D94400C004028015880080830900562102000E240058890800
                  38880060352200E000028015890080C10400AB12010003090056260200061100
                  AC4E04000C2000A8400400EC4C0050850800D89100A0121100B0130140352200
                  600702808A4400C0830400558900800708002A13010077120054270200EE2000
                  E8400400DC4800D0850800B88100A013110070250140372200E00A02808E4400
                  C0050280AE4400C02B04009D890080330400DD89008017080012880080270400
                  294400C0170400494400C0270280342200E08D0020930800E20900528900209A
                  0020990800620900D28900209200001100041200F0910800A20800F84C040031
                  04007C4D04001104003C270280F60400BC4C0400AD0900384F04006D0900789D
                  08005A120070990800DA1100701D1100B42200E07A2200684300C06D4400D082
                  0080DB8900A03C0100F7110140690200EE270280B204003C460400250900789C
                  0800CA1100B00F1100942200603F2200284300C0BE440050820080FD89006079
                  0200C61001C0D204008C230280650900184B04004B1200309E0800962300E018
                  2200588A0080E38800601902008E250280250800389E0800A6130030870800A6
                  1200308F0800A6110030970800A6100030DFBBD3FD78BAB7B31F72905F4FF7DD
                  E97E9FFD10482600600D295F02FE7BBABF9DEE3FB31F02E90400ACA37B04187F
                  58880080B5748D00E30F8B1100B09E6E1160FC61410200D6D425028C3F2C4A00
                  C0BAAA4780F187850900585BD50830FEB0380100EBAB1601C61F0A1000504395
                  0830FE508400803A568F00E30F850800A865D50830FE508C00807A568B00E30F
                  050900A869950830FE50940080BA664780F187C20400D4362B028C3F142700A0
                  BEA323C0F8430302007A382A028C3F342100A08FD11160FCA1110100BD8C8A00
                  E30FCD0800E867EF0830FED09000809EF68A00E30F4D0900E8EBD10830FED098
                  0080DEEE8D00E30FCD0900E8EFD60830FE10400040866B23C0F843080100392E
                  4580F187200200B29C8B00E30F610400E4791A01C61F020900C8B445C0B76F8C
                  3F44120090EBDDA7DFF7B31F021C4F0000402001000081040000041200001048
                  0000402001000081040000041200001048000040200100008104000004120000
                  1048000040200100008104000004120000104800004020010000810400000412
                  0000104800004020010000810400000412000010480000402001000081040000
                  0412000010480000402001000081040000041200001048000040200100008104
                  0000041200001048000040200100008104000004120000104800004020010000
                  8104000004120000104800004020010000810400000412000010480000402001
                  0000810400000412000010480000402001000081040000041200001048000040
                  2001000081040000041200001048000040200100008104000004120000104800
                  0040200100008104000004120000104800004020010000810400000412000010
                  4800004020010000810400000412000010480000402001000081040000041200
                  0010480000402001000081040000041200001048000040A0FF030801D62EB80B
                  0D7D0000000049454E44AE426082}
                Proportional = True
                OnClick = iButtonBackAlterarSenhaClick
              end
              object pButtonAlterarSenhaPagamentosE: TPanel
                Left = 302
                Top = 11
                Width = 86
                Height = 26
                BevelOuter = bvNone
                Caption = 'Alterar Senha'
                Color = clCoral
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentBackground = False
                ParentFont = False
                TabOrder = 0
              end
            end
          end
        end
      end
    end
    object tsPedidos: TTabSheet
      Caption = 'tsPedidos'
      ImageIndex = 3
      object scbxMainPedidos: TScrollBox
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 402
        Height = 614
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        TabOrder = 0
        UseWheelForScrolling = True
        object pHeaderPedidos: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 27
          Width = 398
          Height = 46
          Margins.Left = 0
          Margins.Top = 27
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object lblMeusPedidos: TLabel
            Left = 53
            Top = 13
            Width = 106
            Height = 21
            Caption = 'Meus Pedidos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object iButtonBackPedidos: TImage
            Left = 7
            Top = 8
            Width = 30
            Height = 30
            Center = True
            Picture.Data = {
              0954506E67496D61676589504E470D0A1A0A0000000D49484452000002000000
              02000806000000F478D4FA000000097048597300000B1300000B1301009A9C18
              000000B46558496649492A000800000006001201030001000000010000001A01
              050001000000560000001B010500010000005E00000028010300010000000200
              0000130203000100000001000000698704000100000066000000000000004800
              0000010000004800000001000000060000900700040000003032313001910700
              040000000102030000A00700040000003031303001A0030001000000FFFF0000
              02A00400010000000002000003A00400010000000002000000000000915FF1DA
              00000E164944415478DAEDD84DAA5CD715866119F7051983879096461008B89B
              99791499802160703ACA400CEE07627753B2742CE9DE5BB7FECE3E7BAFF53D0F
              2C8AEAEDDEF772BE790300C4F966F6030080E309000008240000209000008040
              0200000209000008240000209000008040020000020900000824000020900000
              8040020000020900000824000020900000804002000002090000082400002090
              0000804002000002090000082400002090000080400200000209000008240000
              2090000080400200000209000008240000209000008040020000020900000824
              0000209000008040020000020900000824000020900000804002000002090000
              0824000020900000804002000002090000082400002090000080400200000209
              0000082400002090000080400200000209000008240000209000008040020000
              0209000008240000209000008040020000020900000824000020900000804002
              0000020900000824000020900000804002000002090000082400002090000080
              4002000002090000082400002090000080400200000209000008240000209000
              0080400200000209000008240000209000008040020072BDFBF4FB7EF64380E3
              0900C8F461FC7F3CDDB7A7FBFBE9FE3DFB41C0B10400E4D9C6FFEDA7FFFF7B23
              02208E00802C4FC77F2302208C00801CE7C67F2302208800800C97C67F230220
              840080FEAE1DFF8D08800002007ABB75FC3722009A1300D0D7BDE3BF1101D098
              00809E1E1DFF8D0880A60400F4B3D7F86F4400342400A097BDC77F2302A01901
              007D8C1AFF8D0880460400F4307AFC3722009A100050DF51E3BF1101D0800080
              DA8E1EFF8D0880E20400D4356BFC3722000A130050D3ECF1DF8800284A00403D
              AB8CFF4604404102006A596DFC3722008A110050C7AAE3BF1101508800801A56
              1FFF8D0880220400ACAFCAF86F4400142000606DD5C67F230260710200D65575
              FC372200162600604DD5C77F230260510200D6D365FC372200162400602DDDC6
              7F230260310200D6D175FC372200162200600DDDC77F230260110200E64B19FF
              CDAFA7FBEE74BFCF7E082413003057DAF8FF76BAEF4FF7D3EC87403A0100F318
              7F601A010073187F602A0100C733FEC07402008E65FC81250800388EF1079621
              00E018C61F588A0080F18C3FB01C010063197F60490200C631FEC0B204008C61
              FC81A50900D89FF107962700605FC61F284100C07E8C3F508600807D187FA014
              01008F33FE403902001E63FC81920400DCCFF803650900B88FF1074A1300703B
              E30F942700E036C61F684100C0F58C3FD0860080EB187FA015010097197FA01D
              0100AF33FE404B0200CE33FE405B02005E66FC81D604003C67FC81F604007CCD
              F8031104007C66FC811802003E32FE40140100C61F0824004867FC8148028064
              C61F8825004865FC8168028044C61F8827004863FC01DE0800B2187F804F0400
              298C3FC0170400098C3FC0130280EE8C3FC00B04009D197F803304005D197F80
              5708003A32FE00170800BA31FE005710007462FC01AE2400E8C2F803DC4000D0
              81F107B89100A03AE30F7007014065C61FE04E0280AA8C3FC003040015197F80
              070900AA31FE003B10005462FC01762200A8C2F803EC48005081F107D8990060
              75C61F600001C0CA8C3FC020028055197F808104002B32FE008309005663FC01
              0E20005889F1073888006015C61FE040028015187F808309006633FE00130800
              6632FE009308006631FE001309006630FE009309008E66FC011620003892F107
              588400E028C61F6021028023187F80C508004633FE000B12008C64FC01162500
              18C5F8032C4C003082F107589C00606FC61FA00001C09E8C3F40110280BD187F
              804204007B30FE00C508001E65FC010A12003CC2F803142500B897F107284C00
              700FE30F509C00E056C61FA00101C02D8C3F401302806B197F80460400D730FE
              00CD08002E31FE000D09005E63FC019A12009C63FC011A1300BCC4F803342700
              78CAF8030410007CC9F8038410006C8C3F401001C007C61F208C00C0F8030412
              00D98C3F40280190CBF803041300998C3F40380190C7F8032000C2187F00FE20
              0072187F00FE240032187F00BE2200FA33FE003C23007A33FE00BC4800F465FC
              01384B00F464FC01789500E8C7F803709100E8C5F803701501D087F107E06A02
              A007E30FC04D04407DC61F809B0980DA8C3F0077110075197F00EE26006A32FE
              003C4400D463FC01789800A8C5F803B00B015047DAF87FF0C3E97E9EFD0860BA
              5F4EF77EF623BA110035248E3FC0E69FA7FBC7EC47742300D667FC8174026000
              01B036E30F2000861000EB32FE001F09800104C09A8C3FC06702600001B01EE3
              0FF03501308000588BF107784E000C2000D661FC015E26000610006B30FE00E7
              09800104C07CC61FE075026000013097F107B84C000C2000E631FE00D7110003
              0880398C3FC0F504C00002E078C61FE03602600001702CE30F703B0130800038
              8EF107B88F001840001CC3F803DC4F000C2000C633FE008F1100030880B18C3F
              C0E304C00002601CE30FB00F0130800018C3F803EC47000C2000C6F8EBE9FE75
              BABFCC7E08400302600001308E0800D887001840008C2502001E2700061000E3
              890080C708800104C0314400C0FD04C00002E0382200E03E02600001702C1100
              703B01308000389E0800B88D00184000CC210200AE2700061000F3880080EB08
              800104C05C2200E03201308000984F0400BC4E000C2000D6200200CE13000308
              80758800809709800104C05A4400C07302600001B01E1100F035013080005893
              0800F84C000C2000D62502003E1200030880B589000001308400589F0800D209
              800104400D220048260006100075BC3BDD8FA77B3BFB2107FAE1743FCF7E0430
              DD2FA77B3FFB11DD08805AD2BE04FC76BAEF4FF7D3EC8700742300EA1101003C
              4C00D4240200788800A84B0400703701509B0800E02E02A03E1100C0CD04400F
              2200809B08803E440000571300BD880000AE2200FA1101005C24007A120100BC
              4A00F4250200384B00F4260200789100E84F0400F08C00C8200200F88A00C821
              0200F89300C8220200F88300C82302001000A14400403801904B0400041300D9
              4400402801800800082400F84004008411006C4400401001C0974400400801C0
              532200208000E0252200A03901C0392200A03101C06B4400405302804B440040
              4302806B880080660400D71201008D08006E2102009A1000DC4A0400342000B8
              870800284E00702F1100509800E0112200A02801C0A34400404102803D880080
              6204007B110100850800F62402008A1000EC4D0400142000184104002C4E0030
              8A080058980060241100B02801C06822006041028023880080C508008E220200
              16220038920800588400E068220060010280194400C0640280594400C0440280
              994400C0240280D94400C004028015880080830900562102000E240058890800
              38880060352200E000028015890080C10400AB12010003090056260200061100
              AC4E04000C2000A8400400EC4C0050850800D89100A0121100B0130140352200
              600702808A4400C0830400558900800708002A13010077120054270200EE2000
              E8400400DC4800D0850800B88100A013110070250140372200E00A02808E4400
              C0050280AE4400C02B04009D890080330400DD89008017080012880080270400
              294400C0170400494400C0270280342200E08D0020930800E20900528900209A
              0020990800620900D28900209200001100041200F0910800A20800F84C040031
              04007C4D04001104003C270280F60400BC4C0400AD0900384F04006D0900789D
              08005A120070990800DA1100701D1100B42200E07A2200684300C06D4400D082
              0080DB8900A03C0100F7110140690200EE270280B204003C460400250900789C
              0800CA1100B00F1100942200603F2200284300C0BE440050820080FD89006079
              0200C61001C0D204008C230280650900184B04004B1200309E0800962300E018
              2200588A0080E38800601902008E250280250800389E0800A6130030870800A6
              1200308F0800A6110030970800A6100030DFBBD3FD78BAB7B31F72905F4FF7DD
              E97E9FFD10482600600D295F02FE7BBABF9DEE3FB31F02E90400ACA37B04187F
              58880080B5748D00E30F8B1100B09E6E1160FC61410200D6D425028C3F2C4A00
              C0BAAA4780F187850900585BD50830FEB0380100EBAB1601C61F0A1000504395
              0830FE508400803A568F00E30F850800A865D50830FE508C00807A568B00E30F
              050900A869950830FE50940080BA664780F187C20400D4362B028C3F142700A0
              BEA323C0F8430302007A382A028C3F342100A08FD11160FCA1110100BD8C8A00
              E30FCD0800E867EF0830FED09000809EF68A00E30F4D0900E8EBD10830FED098
              0080DEEE8D00E30FCD0900E8EFD60830FE10400040866B23C0F843080100392E
              4580F187200200B29C8B00E30F610400E4791A01C61F020900C8B445C0B76F8C
              3F44120090EBDDA7DFF7B31F021C4F0000402001000081040000041200001048
              0000402001000081040000041200001048000040200100008104000004120000
              1048000040200100008104000004120000104800004020010000810400000412
              0000104800004020010000810400000412000010480000402001000081040000
              0412000010480000402001000081040000041200001048000040200100008104
              0000041200001048000040200100008104000004120000104800004020010000
              8104000004120000104800004020010000810400000412000010480000402001
              0000810400000412000010480000402001000081040000041200001048000040
              2001000081040000041200001048000040200100008104000004120000104800
              0040200100008104000004120000104800004020010000810400000412000010
              4800004020010000810400000412000010480000402001000081040000041200
              0010480000402001000081040000041200001048000040A0FF030801D62EB80B
              0D7D0000000049454E44AE426082}
            Proportional = True
            OnClick = iButtonBackAlterarSenhaClick
          end
        end
        object pFiltrosPedidos: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 73
          Width = 398
          Height = 46
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
          object lblFiltrosPedidos: TLabel
            Left = 13
            Top = 13
            Width = 39
            Height = 17
            Caption = 'Filtros'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object pBTodosFiltrosPedidos: TPanel
            Left = 69
            Top = 10
            Width = 74
            Height = 25
            BevelOuter = bvNone
            Caption = 'Todos'
            TabOrder = 0
          end
          object pBCanceladosFiltrosPedidos: TPanel
            Left = 151
            Top = 10
            Width = 74
            Height = 25
            BevelOuter = bvNone
            Caption = 'Cancelados'
            TabOrder = 1
          end
          object pBPendentesPedidos: TPanel
            Left = 233
            Top = 10
            Width = 74
            Height = 25
            BevelOuter = bvNone
            Caption = 'Pendentes'
            TabOrder = 2
          end
          object pBConcluidosPedidos: TPanel
            Left = 316
            Top = 10
            Width = 74
            Height = 25
            BevelOuter = bvNone
            Caption = 'Conclu'#237'dos'
            TabOrder = 3
          end
        end
        object pMainPedidos: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 119
          Width = 398
          Height = 491
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          object scbxPedidos: TScrollBox
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 398
            Height = 491
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            TabOrder = 0
            UseWheelForScrolling = True
          end
        end
      end
    end
    object tsCarrinho: TTabSheet
      Caption = 'tsCarrinho'
      ImageIndex = 4
      object scbxMainCarrinho: TScrollBox
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 402
        Height = 614
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        TabOrder = 0
        UseWheelForScrolling = True
        object pEnderecoCarrinho: TPanel
          Left = 0
          Top = 73
          Width = 398
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          Color = clWindow
          ParentBackground = False
          TabOrder = 0
          object lblEnderecoDesc: TLabel
            Left = 7
            Top = 5
            Width = 88
            Height = 25
            Margins.Bottom = 80
            Caption = 'Endere'#231'o:'
            Color = clCoral
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object lblEnderecoAtualCarrinho: TLabel
            Left = 100
            Top = 6
            Width = 144
            Height = 25
            Caption = 'lblEnderecoAtual'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object pButtonAlterarEndereco: TPanel
            Left = 288
            Top = 2
            Width = 102
            Height = 32
            Caption = 'Alterar Endere'#231'o'
            Color = clCoral
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
          end
        end
        object pNumerosCarrinho: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 27
          Width = 398
          Height = 46
          Margins.Left = 0
          Margins.Top = 27
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
          object lblItensCartCarrinho: TLabel
            Left = 57
            Top = 17
            Width = 106
            Height = 15
            Caption = 'lblItensCartCarrinho'
          end
          object iButtonBackCarrinho: TImage
            Left = 7
            Top = 8
            Width = 30
            Height = 30
            Center = True
            Picture.Data = {
              0954506E67496D61676589504E470D0A1A0A0000000D49484452000002000000
              02000806000000F478D4FA000000097048597300000B1300000B1301009A9C18
              000000B46558496649492A000800000006001201030001000000010000001A01
              050001000000560000001B010500010000005E00000028010300010000000200
              0000130203000100000001000000698704000100000066000000000000004800
              0000010000004800000001000000060000900700040000003032313001910700
              040000000102030000A00700040000003031303001A0030001000000FFFF0000
              02A00400010000000002000003A00400010000000002000000000000915FF1DA
              00000E164944415478DAEDD84DAA5CD715866119F7051983879096461008B89B
              99791499802160703ACA400CEE07627753B2742CE9DE5BB7FECE3E7BAFF53D0F
              2C8AEAEDDEF772BE790300C4F966F6030080E309000008240000209000008040
              0200000209000008240000209000008040020000020900000824000020900000
              8040020000020900000824000020900000804002000002090000082400002090
              0000804002000002090000082400002090000080400200000209000008240000
              2090000080400200000209000008240000209000008040020000020900000824
              0000209000008040020000020900000824000020900000804002000002090000
              0824000020900000804002000002090000082400002090000080400200000209
              0000082400002090000080400200000209000008240000209000008040020000
              0209000008240000209000008040020000020900000824000020900000804002
              0000020900000824000020900000804002000002090000082400002090000080
              4002000002090000082400002090000080400200000209000008240000209000
              0080400200000209000008240000209000008040020072BDFBF4FB7EF64380E3
              0900C8F461FC7F3CDDB7A7FBFBE9FE3DFB41C0B10400E4D9C6FFEDA7FFFF7B23
              02208E00802C4FC77F2302208C00801CE7C67F2302208800800C97C67F230220
              840080FEAE1DFF8D08800002007ABB75FC3722009A1300D0D7BDE3BF1101D098
              00809E1E1DFF8D0880A60400F4B3D7F86F4400342400A097BDC77F2302A01901
              007D8C1AFF8D0880460400F4307AFC3722009A100050DF51E3BF1101D0800080
              DA8E1EFF8D0880E20400D4356BFC3722000A130050D3ECF1DF8800284A00403D
              AB8CFF4604404102006A596DFC3722008A110050C7AAE3BF1101508800801A56
              1FFF8D0880220400ACAFCAF86F4400142000606DD5C67F230260710200D65575
              FC372200162600604DD5C77F230260510200D6D365FC372200162400602DDDC6
              7F230260310200D6D175FC372200162200600DDDC77F230260110200E64B19FF
              CDAFA7FBEE74BFCF7E082413003057DAF8FF76BAEF4FF7D3EC87403A0100F318
              7F601A010073187F602A0100C733FEC07402008E65FC81250800388EF1079621
              00E018C61F588A0080F18C3FB01C010063197F60490200C631FEC0B204008C61
              FC81A50900D89FF107962700605FC61F284100C07E8C3F508600807D187FA014
              01008F33FE403902001E63FC81920400DCCFF803650900B88FF1074A1300703B
              E30F942700E036C61F684100C0F58C3FD0860080EB187FA015010097197FA01D
              0100AF33FE404B0200CE33FE405B02005E66FC81D604003C67FC81F604007CCD
              F8031104007C66FC811802003E32FE40140100C61F0824004867FC8148028064
              C61F8825004865FC8168028044C61F8827004863FC01DE0800B2187F804F0400
              298C3FC0170400098C3FC0130280EE8C3FC00B04009D197F803304005D197F80
              5708003A32FE00170800BA31FE005710007462FC01AE2400E8C2F803DC4000D0
              81F107B89100A03AE30F7007014065C61FE04E0280AA8C3FC003040015197F80
              070900AA31FE003B10005462FC01762200A8C2F803EC48005081F107D8990060
              75C61F600001C0CA8C3FC020028055197F808104002B32FE008309005663FC01
              0E20005889F1073888006015C61FE040028015187F808309006633FE00130800
              6632FE009308006631FE001309006630FE009309008E66FC011620003892F107
              588400E028C61F6021028023187F80C508004633FE000B12008C64FC01162500
              18C5F8032C4C003082F107589C00606FC61FA00001C09E8C3F40110280BD187F
              804204007B30FE00C508001E65FC010A12003CC2F803142500B897F107284C00
              700FE30F509C00E056C61FA00101C02D8C3F401302806B197F80460400D730FE
              00CD08002E31FE000D09005E63FC019A12009C63FC011A1300BCC4F803342700
              78CAF8030410007CC9F8038410006C8C3F401001C007C61F208C00C0F8030412
              00D98C3F40280190CBF803041300998C3F40380190C7F8032000C2187F00FE20
              0072187F00FE240032187F00BE2200FA33FE003C23007A33FE00BC4800F465FC
              01384B00F464FC01789500E8C7F803709100E8C5F803701501D087F107E06A02
              A007E30FC04D04407DC61F809B0980DA8C3F0077110075197F00EE26006A32FE
              003C4400D463FC01789800A8C5F803B00B015047DAF87FF0C3E97E9EFD0860BA
              5F4EF77EF623BA110035248E3FC0E69FA7FBC7EC47742300D667FC8174026000
              01B036E30F2000861000EB32FE001F09800104C09A8C3FC06702600001B01EE3
              0FF03501308000588BF107784E000C2000D661FC015E26000610006B30FE00E7
              09800104C07CC61FE075026000013097F107B84C000C2000E631FE00D7110003
              0880398C3FC0F504C00002E078C61FE03602600001702CE30F703B0130800038
              8EF107B88F001840001CC3F803DC4F000C2000C633FE008F1100030880B18C3F
              C0E304C00002601CE30FB00F0130800018C3F803EC47000C2000C6F8EBE9FE75
              BABFCC7E08400302600001308E0800D887001840008C2502001E2700061000E3
              890080C708800104C0314400C0FD04C00002E0382200E03E02600001702C1100
              703B01308000389E0800B88D00184000CC210200AE2700061000F3880080EB08
              800104C05C2200E03201308000984F0400BC4E000C2000D6200200CE13000308
              80758800809709800104C05A4400C07302600001B01E1100F035013080005893
              0800F84C000C2000D62502003E1200030880B589000001308400589F0800D209
              800104400D220048260006100075BC3BDD8FA77B3BFB2107FAE1743FCF7E0430
              DD2FA77B3FFB11DD08805AD2BE04FC76BAEF4FF7D3EC8700742300EA1101003C
              4C00D4240200788800A84B0400703701509B0800E02E02A03E1100C0CD04400F
              2200809B08803E440000571300BD880000AE2200FA1101005C24007A120100BC
              4A00F4250200384B00F4260200789100E84F0400F08C00C8200200F88A00C821
              0200F89300C8220200F88300C82302001000A14400403801904B0400041300D9
              4400402801800800082400F84004008411006C4400401001C0974400400801C0
              532200208000E0252200A03901C0392200A03101C06B4400405302804B440040
              4302806B880080660400D71201008D08006E2102009A1000DC4A0400342000B8
              870800284E00702F1100509800E0112200A02801C0A34400404102803D880080
              6204007B110100850800F62402008A1000EC4D0400142000184104002C4E0030
              8A080058980060241100B02801C06822006041028023880080C508008E220200
              16220038920800588400E068220060010280194400C0640280594400C0440280
              994400C0240280D94400C004028015880080830900562102000E240058890800
              38880060352200E000028015890080C10400AB12010003090056260200061100
              AC4E04000C2000A8400400EC4C0050850800D89100A0121100B0130140352200
              600702808A4400C0830400558900800708002A13010077120054270200EE2000
              E8400400DC4800D0850800B88100A013110070250140372200E00A02808E4400
              C0050280AE4400C02B04009D890080330400DD89008017080012880080270400
              294400C0170400494400C0270280342200E08D0020930800E20900528900209A
              0020990800620900D28900209200001100041200F0910800A20800F84C040031
              04007C4D04001104003C270280F60400BC4C0400AD0900384F04006D0900789D
              08005A120070990800DA1100701D1100B42200E07A2200684300C06D4400D082
              0080DB8900A03C0100F7110140690200EE270280B204003C460400250900789C
              0800CA1100B00F1100942200603F2200284300C0BE440050820080FD89006079
              0200C61001C0D204008C230280650900184B04004B1200309E0800962300E018
              2200588A0080E38800601902008E250280250800389E0800A6130030870800A6
              1200308F0800A6110030970800A6100030DFBBD3FD78BAB7B31F72905F4FF7DD
              E97E9FFD10482600600D295F02FE7BBABF9DEE3FB31F02E90400ACA37B04187F
              58880080B5748D00E30F8B1100B09E6E1160FC61410200D6D425028C3F2C4A00
              C0BAAA4780F187850900585BD50830FEB0380100EBAB1601C61F0A1000504395
              0830FE508400803A568F00E30F850800A865D50830FE508C00807A568B00E30F
              050900A869950830FE50940080BA664780F187C20400D4362B028C3F142700A0
              BEA323C0F8430302007A382A028C3F342100A08FD11160FCA1110100BD8C8A00
              E30FCD0800E867EF0830FED09000809EF68A00E30F4D0900E8EBD10830FED098
              0080DEEE8D00E30FCD0900E8EFD60830FE10400040866B23C0F843080100392E
              4580F187200200B29C8B00E30F610400E4791A01C61F020900C8B445C0B76F8C
              3F44120090EBDDA7DFF7B31F021C4F0000402001000081040000041200001048
              0000402001000081040000041200001048000040200100008104000004120000
              1048000040200100008104000004120000104800004020010000810400000412
              0000104800004020010000810400000412000010480000402001000081040000
              0412000010480000402001000081040000041200001048000040200100008104
              0000041200001048000040200100008104000004120000104800004020010000
              8104000004120000104800004020010000810400000412000010480000402001
              0000810400000412000010480000402001000081040000041200001048000040
              2001000081040000041200001048000040200100008104000004120000104800
              0040200100008104000004120000104800004020010000810400000412000010
              4800004020010000810400000412000010480000402001000081040000041200
              0010480000402001000081040000041200001048000040A0FF030801D62EB80B
              0D7D0000000049454E44AE426082}
            Proportional = True
            OnClick = iButtonBackAlterarSenhaClick
          end
        end
        object pItensCarrinho: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 114
          Width = 398
          Height = 350
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          object scbxCarrinhoItems: TScrollBox
            Left = 0
            Top = 0
            Width = 398
            Height = 350
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            TabOrder = 0
            UseWheelForScrolling = True
          end
        end
        object pResumoPedido: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 464
          Width = 398
          Height = 146
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 3
          object lblResumo: TLabel
            Left = 7
            Top = 6
            Width = 147
            Height = 21
            Caption = 'Resumo do Pedido:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblSubtotal: TLabel
            Left = 333
            Top = 35
            Width = 57
            Height = 15
            Caption = 'lblSubtotal'
          end
          object lblSubtotalDesc: TLabel
            Left = 7
            Top = 35
            Width = 47
            Height = 15
            Caption = 'Subtotal:'
          end
          object lblTaxa: TLabel
            Left = 333
            Top = 56
            Width = 36
            Height = 15
            Caption = 'lblTaxa'
          end
          object lblTaxadesc: TLabel
            Left = 7
            Top = 56
            Width = 85
            Height = 15
            Caption = 'Taxa de Entrega:'
          end
          object lblTotalDesc: TLabel
            Left = 7
            Top = 77
            Width = 29
            Height = 15
            Caption = 'Total:'
          end
          object lblTotal: TLabel
            Left = 333
            Top = 77
            Width = 39
            Height = 15
            Caption = 'lblTotal'
          end
          object lblFormaPDesc: TLabel
            Left = 7
            Top = 96
            Width = 120
            Height = 15
            Caption = 'Forma de Pagamento: '
          end
          object lblFormaPagamento: TLabel
            Left = 133
            Top = 96
            Width = 108
            Height = 15
            Caption = 'lblFormaPagamento'
          end
          object pButtonFinalizarPedido: TPanel
            Left = 288
            Top = 104
            Width = 102
            Height = 32
            Caption = 'Finalizar Pedido'
            Color = clCoral
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
          end
        end
      end
    end
    object tsCommSelec: TTabSheet
      Caption = 'tsCommSelec'
      ImageIndex = 5
      object scbxMainCommSelec: TScrollBox
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 402
        Height = 614
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        TabOrder = 0
        UseWheelForScrolling = True
        object pCarrinhoComm: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 572
          Width = 398
          Height = 38
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alBottom
          BevelOuter = bvNone
          Color = clCoral
          ParentBackground = False
          TabOrder = 0
          object lblItensCart: TLabel
            Left = 15
            Top = 12
            Width = 60
            Height = 15
            Caption = 'lblItensCart'
          end
          object lblTotalCart: TLabel
            Left = 99
            Top = 12
            Width = 61
            Height = 15
            Caption = 'lblTotalCart'
          end
          object pButtonCartComm: TPanel
            Left = 284
            Top = 6
            Width = 111
            Height = 28
            BevelOuter = bvNone
            Caption = 'Ver Carrinho >'
            Color = clCream
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
          end
        end
        object pCategoriasProdutosComm: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 138
          Width = 398
          Height = 113
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object scbxCategoriasProdutosComm: TScrollBox
            Left = 0
            Top = 0
            Width = 398
            Height = 113
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            TabOrder = 0
            UseWheelForScrolling = True
            object lblCategoriasProdutos: TLabel
              Left = 13
              Top = 16
              Width = 81
              Height = 21
              Caption = 'Categorias'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
        object pInfoComm: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 28
          Width = 398
          Height = 110
          Margins.Left = 0
          Margins.Top = 28
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object lblNomeComm: TLabel
            Left = 43
            Top = 14
            Width = 134
            Height = 25
            Caption = 'lblNomeComm'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object iButtonBackComm: TImage
            Left = 7
            Top = 12
            Width = 30
            Height = 30
            Center = True
            Picture.Data = {
              0954506E67496D61676589504E470D0A1A0A0000000D49484452000002000000
              02000806000000F478D4FA000000097048597300000B1300000B1301009A9C18
              000000B46558496649492A000800000006001201030001000000010000001A01
              050001000000560000001B010500010000005E00000028010300010000000200
              0000130203000100000001000000698704000100000066000000000000004800
              0000010000004800000001000000060000900700040000003032313001910700
              040000000102030000A00700040000003031303001A0030001000000FFFF0000
              02A00400010000000002000003A00400010000000002000000000000915FF1DA
              00000E164944415478DAEDD84DAA5CD715866119F7051983879096461008B89B
              99791499802160703ACA400CEE07627753B2742CE9DE5BB7FECE3E7BAFF53D0F
              2C8AEAEDDEF772BE790300C4F966F6030080E309000008240000209000008040
              0200000209000008240000209000008040020000020900000824000020900000
              8040020000020900000824000020900000804002000002090000082400002090
              0000804002000002090000082400002090000080400200000209000008240000
              2090000080400200000209000008240000209000008040020000020900000824
              0000209000008040020000020900000824000020900000804002000002090000
              0824000020900000804002000002090000082400002090000080400200000209
              0000082400002090000080400200000209000008240000209000008040020000
              0209000008240000209000008040020000020900000824000020900000804002
              0000020900000824000020900000804002000002090000082400002090000080
              4002000002090000082400002090000080400200000209000008240000209000
              0080400200000209000008240000209000008040020072BDFBF4FB7EF64380E3
              0900C8F461FC7F3CDDB7A7FBFBE9FE3DFB41C0B10400E4D9C6FFEDA7FFFF7B23
              02208E00802C4FC77F2302208C00801CE7C67F2302208800800C97C67F230220
              840080FEAE1DFF8D08800002007ABB75FC3722009A1300D0D7BDE3BF1101D098
              00809E1E1DFF8D0880A60400F4B3D7F86F4400342400A097BDC77F2302A01901
              007D8C1AFF8D0880460400F4307AFC3722009A100050DF51E3BF1101D0800080
              DA8E1EFF8D0880E20400D4356BFC3722000A130050D3ECF1DF8800284A00403D
              AB8CFF4604404102006A596DFC3722008A110050C7AAE3BF1101508800801A56
              1FFF8D0880220400ACAFCAF86F4400142000606DD5C67F230260710200D65575
              FC372200162600604DD5C77F230260510200D6D365FC372200162400602DDDC6
              7F230260310200D6D175FC372200162200600DDDC77F230260110200E64B19FF
              CDAFA7FBEE74BFCF7E082413003057DAF8FF76BAEF4FF7D3EC87403A0100F318
              7F601A010073187F602A0100C733FEC07402008E65FC81250800388EF1079621
              00E018C61F588A0080F18C3FB01C010063197F60490200C631FEC0B204008C61
              FC81A50900D89FF107962700605FC61F284100C07E8C3F508600807D187FA014
              01008F33FE403902001E63FC81920400DCCFF803650900B88FF1074A1300703B
              E30F942700E036C61F684100C0F58C3FD0860080EB187FA015010097197FA01D
              0100AF33FE404B0200CE33FE405B02005E66FC81D604003C67FC81F604007CCD
              F8031104007C66FC811802003E32FE40140100C61F0824004867FC8148028064
              C61F8825004865FC8168028044C61F8827004863FC01DE0800B2187F804F0400
              298C3FC0170400098C3FC0130280EE8C3FC00B04009D197F803304005D197F80
              5708003A32FE00170800BA31FE005710007462FC01AE2400E8C2F803DC4000D0
              81F107B89100A03AE30F7007014065C61FE04E0280AA8C3FC003040015197F80
              070900AA31FE003B10005462FC01762200A8C2F803EC48005081F107D8990060
              75C61F600001C0CA8C3FC020028055197F808104002B32FE008309005663FC01
              0E20005889F1073888006015C61FE040028015187F808309006633FE00130800
              6632FE009308006631FE001309006630FE009309008E66FC011620003892F107
              588400E028C61F6021028023187F80C508004633FE000B12008C64FC01162500
              18C5F8032C4C003082F107589C00606FC61FA00001C09E8C3F40110280BD187F
              804204007B30FE00C508001E65FC010A12003CC2F803142500B897F107284C00
              700FE30F509C00E056C61FA00101C02D8C3F401302806B197F80460400D730FE
              00CD08002E31FE000D09005E63FC019A12009C63FC011A1300BCC4F803342700
              78CAF8030410007CC9F8038410006C8C3F401001C007C61F208C00C0F8030412
              00D98C3F40280190CBF803041300998C3F40380190C7F8032000C2187F00FE20
              0072187F00FE240032187F00BE2200FA33FE003C23007A33FE00BC4800F465FC
              01384B00F464FC01789500E8C7F803709100E8C5F803701501D087F107E06A02
              A007E30FC04D04407DC61F809B0980DA8C3F0077110075197F00EE26006A32FE
              003C4400D463FC01789800A8C5F803B00B015047DAF87FF0C3E97E9EFD0860BA
              5F4EF77EF623BA110035248E3FC0E69FA7FBC7EC47742300D667FC8174026000
              01B036E30F2000861000EB32FE001F09800104C09A8C3FC06702600001B01EE3
              0FF03501308000588BF107784E000C2000D661FC015E26000610006B30FE00E7
              09800104C07CC61FE075026000013097F107B84C000C2000E631FE00D7110003
              0880398C3FC0F504C00002E078C61FE03602600001702CE30F703B0130800038
              8EF107B88F001840001CC3F803DC4F000C2000C633FE008F1100030880B18C3F
              C0E304C00002601CE30FB00F0130800018C3F803EC47000C2000C6F8EBE9FE75
              BABFCC7E08400302600001308E0800D887001840008C2502001E2700061000E3
              890080C708800104C0314400C0FD04C00002E0382200E03E02600001702C1100
              703B01308000389E0800B88D00184000CC210200AE2700061000F3880080EB08
              800104C05C2200E03201308000984F0400BC4E000C2000D6200200CE13000308
              80758800809709800104C05A4400C07302600001B01E1100F035013080005893
              0800F84C000C2000D62502003E1200030880B589000001308400589F0800D209
              800104400D220048260006100075BC3BDD8FA77B3BFB2107FAE1743FCF7E0430
              DD2FA77B3FFB11DD08805AD2BE04FC76BAEF4FF7D3EC8700742300EA1101003C
              4C00D4240200788800A84B0400703701509B0800E02E02A03E1100C0CD04400F
              2200809B08803E440000571300BD880000AE2200FA1101005C24007A120100BC
              4A00F4250200384B00F4260200789100E84F0400F08C00C8200200F88A00C821
              0200F89300C8220200F88300C82302001000A14400403801904B0400041300D9
              4400402801800800082400F84004008411006C4400401001C0974400400801C0
              532200208000E0252200A03901C0392200A03101C06B4400405302804B440040
              4302806B880080660400D71201008D08006E2102009A1000DC4A0400342000B8
              870800284E00702F1100509800E0112200A02801C0A34400404102803D880080
              6204007B110100850800F62402008A1000EC4D0400142000184104002C4E0030
              8A080058980060241100B02801C06822006041028023880080C508008E220200
              16220038920800588400E068220060010280194400C0640280594400C0440280
              994400C0240280D94400C004028015880080830900562102000E240058890800
              38880060352200E000028015890080C10400AB12010003090056260200061100
              AC4E04000C2000A8400400EC4C0050850800D89100A0121100B0130140352200
              600702808A4400C0830400558900800708002A13010077120054270200EE2000
              E8400400DC4800D0850800B88100A013110070250140372200E00A02808E4400
              C0050280AE4400C02B04009D890080330400DD89008017080012880080270400
              294400C0170400494400C0270280342200E08D0020930800E20900528900209A
              0020990800620900D28900209200001100041200F0910800A20800F84C040031
              04007C4D04001104003C270280F60400BC4C0400AD0900384F04006D0900789D
              08005A120070990800DA1100701D1100B42200E07A2200684300C06D4400D082
              0080DB8900A03C0100F7110140690200EE270280B204003C460400250900789C
              0800CA1100B00F1100942200603F2200284300C0BE440050820080FD89006079
              0200C61001C0D204008C230280650900184B04004B1200309E0800962300E018
              2200588A0080E38800601902008E250280250800389E0800A6130030870800A6
              1200308F0800A6110030970800A6100030DFBBD3FD78BAB7B31F72905F4FF7DD
              E97E9FFD10482600600D295F02FE7BBABF9DEE3FB31F02E90400ACA37B04187F
              58880080B5748D00E30F8B1100B09E6E1160FC61410200D6D425028C3F2C4A00
              C0BAAA4780F187850900585BD50830FEB0380100EBAB1601C61F0A1000504395
              0830FE508400803A568F00E30F850800A865D50830FE508C00807A568B00E30F
              050900A869950830FE50940080BA664780F187C20400D4362B028C3F142700A0
              BEA323C0F8430302007A382A028C3F342100A08FD11160FCA1110100BD8C8A00
              E30FCD0800E867EF0830FED09000809EF68A00E30F4D0900E8EBD10830FED098
              0080DEEE8D00E30FCD0900E8EFD60830FE10400040866B23C0F843080100392E
              4580F187200200B29C8B00E30F610400E4791A01C61F020900C8B445C0B76F8C
              3F44120090EBDDA7DFF7B31F021C4F0000402001000081040000041200001048
              0000402001000081040000041200001048000040200100008104000004120000
              1048000040200100008104000004120000104800004020010000810400000412
              0000104800004020010000810400000412000010480000402001000081040000
              0412000010480000402001000081040000041200001048000040200100008104
              0000041200001048000040200100008104000004120000104800004020010000
              8104000004120000104800004020010000810400000412000010480000402001
              0000810400000412000010480000402001000081040000041200001048000040
              2001000081040000041200001048000040200100008104000004120000104800
              0040200100008104000004120000104800004020010000810400000412000010
              4800004020010000810400000412000010480000402001000081040000041200
              0010480000402001000081040000041200001048000040A0FF030801D62EB80B
              0D7D0000000049454E44AE426082}
            Proportional = True
            OnClick = iButtonBackAlterarSenhaClick
          end
          object lblNota: TLabel
            Left = 7
            Top = 52
            Width = 39
            Height = 15
            Caption = 'lblNota'
          end
          object lblTaxaEntrega: TLabel
            Left = 7
            Top = 76
            Width = 76
            Height = 15
            Caption = 'lblTaxaEntrega'
          end
          object lblHorarioFunc: TLabel
            Left = 103
            Top = 76
            Width = 79
            Height = 15
            Caption = 'lblHorarioFunc'
          end
          object lblCategoria: TLabel
            Left = 103
            Top = 52
            Width = 64
            Height = 15
            Caption = 'lblCategoria'
          end
          object pButtonAvalienos: TPanel
            Left = 306
            Top = 14
            Width = 84
            Height = 28
            Caption = 'Avalie-nos'
            Color = clCoral
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
          end
        end
        object pProdutosComm: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 251
          Width = 398
          Height = 321
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 3
          object scbxProdutosComm: TScrollBox
            Left = 0
            Top = 0
            Width = 398
            Height = 321
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            TabOrder = 0
            UseWheelForScrolling = True
          end
        end
      end
    end
    object tsEnderecoNovo: TTabSheet
      Caption = 'tsEnderecoNovo'
      ImageIndex = 6
      object pEnderecoNovo: TPanel
        Left = 29
        Top = 96
        Width = 324
        Height = 253
        BevelOuter = bvNone
        Color = clCoral
        ParentBackground = False
        TabOrder = 0
        object lblEnderecoNovo: TLabel
          Left = 16
          Top = 12
          Width = 137
          Height = 25
          Caption = 'Endere'#231'o Novo'
          Color = clCream
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lblLogradouro: TLabel
          Left = 16
          Top = 80
          Width = 67
          Height = 15
          Caption = 'Logradouro:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCEP: TLabel
          Left = 16
          Top = 53
          Width = 23
          Height = 15
          Caption = 'CEP:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblEstado: TLabel
          Left = 16
          Top = 163
          Width = 39
          Height = 15
          Caption = 'Estado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblNumero: TLabel
          Left = 16
          Top = 136
          Width = 49
          Height = 15
          Caption = 'N'#250'mero:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCidade: TLabel
          Left = 16
          Top = 108
          Width = 40
          Height = 15
          Caption = 'Cidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblBairro: TLabel
          Left = 16
          Top = 190
          Width = 37
          Height = 15
          Caption = 'Bairro:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblComplemento: TLabel
          Left = 16
          Top = 217
          Width = 138
          Height = 15
          Caption = 'Complemento(Opcional):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object eLogradouroCommDE: TEdit
          Left = 89
          Top = 77
          Width = 208
          Height = 23
          TabOrder = 0
        end
        object eNumeroEnderecoCommDE: TEdit
          Left = 71
          Top = 133
          Width = 111
          Height = 23
          TabOrder = 1
        end
        object eCidadeCommDE: TEdit
          Left = 71
          Top = 105
          Width = 111
          Height = 23
          TabOrder = 2
        end
        object eBairroCommDE: TEdit
          Left = 71
          Top = 187
          Width = 111
          Height = 23
          TabOrder = 3
        end
        object eComplementoCommDE: TEdit
          Left = 160
          Top = 214
          Width = 133
          Height = 23
          TabOrder = 4
        end
        object meCEPCommDE: TMaskEdit
          Left = 71
          Top = 50
          Width = 111
          Height = 23
          EditMask = '99999-999;1;_'
          MaxLength = 9
          TabOrder = 5
          Text = '     -   '
        end
        object cbEstadoCommDE: TComboBox
          Left = 71
          Top = 160
          Width = 111
          Height = 23
          TabOrder = 6
        end
      end
      object pButtonSalvarDadosE: TPanel
        Left = 157
        Top = 415
        Width = 76
        Height = 44
        BevelOuter = bvNone
        Caption = 'Salvar dados'
        Color = clCoral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
      end
      object pHeaderEnderecoNovo: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 25
        Width = 402
        Height = 46
        Margins.Left = 0
        Margins.Top = 25
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
        object lblAddEndereco: TLabel
          Left = 51
          Top = 13
          Width = 149
          Height = 21
          Caption = 'Adicionar Endere'#231'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object iButtonBackEnderecoNovo: TImage
          Left = 7
          Top = 8
          Width = 30
          Height = 30
          Center = True
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000002000000
            02000806000000F478D4FA000000097048597300000B1300000B1301009A9C18
            000000B46558496649492A000800000006001201030001000000010000001A01
            050001000000560000001B010500010000005E00000028010300010000000200
            0000130203000100000001000000698704000100000066000000000000004800
            0000010000004800000001000000060000900700040000003032313001910700
            040000000102030000A00700040000003031303001A0030001000000FFFF0000
            02A00400010000000002000003A00400010000000002000000000000915FF1DA
            00000E164944415478DAEDD84DAA5CD715866119F7051983879096461008B89B
            99791499802160703ACA400CEE07627753B2742CE9DE5BB7FECE3E7BAFF53D0F
            2C8AEAEDDEF772BE790300C4F966F6030080E309000008240000209000008040
            0200000209000008240000209000008040020000020900000824000020900000
            8040020000020900000824000020900000804002000002090000082400002090
            0000804002000002090000082400002090000080400200000209000008240000
            2090000080400200000209000008240000209000008040020000020900000824
            0000209000008040020000020900000824000020900000804002000002090000
            0824000020900000804002000002090000082400002090000080400200000209
            0000082400002090000080400200000209000008240000209000008040020000
            0209000008240000209000008040020000020900000824000020900000804002
            0000020900000824000020900000804002000002090000082400002090000080
            4002000002090000082400002090000080400200000209000008240000209000
            0080400200000209000008240000209000008040020072BDFBF4FB7EF64380E3
            0900C8F461FC7F3CDDB7A7FBFBE9FE3DFB41C0B10400E4D9C6FFEDA7FFFF7B23
            02208E00802C4FC77F2302208C00801CE7C67F2302208800800C97C67F230220
            840080FEAE1DFF8D08800002007ABB75FC3722009A1300D0D7BDE3BF1101D098
            00809E1E1DFF8D0880A60400F4B3D7F86F4400342400A097BDC77F2302A01901
            007D8C1AFF8D0880460400F4307AFC3722009A100050DF51E3BF1101D0800080
            DA8E1EFF8D0880E20400D4356BFC3722000A130050D3ECF1DF8800284A00403D
            AB8CFF4604404102006A596DFC3722008A110050C7AAE3BF1101508800801A56
            1FFF8D0880220400ACAFCAF86F4400142000606DD5C67F230260710200D65575
            FC372200162600604DD5C77F230260510200D6D365FC372200162400602DDDC6
            7F230260310200D6D175FC372200162200600DDDC77F230260110200E64B19FF
            CDAFA7FBEE74BFCF7E082413003057DAF8FF76BAEF4FF7D3EC87403A0100F318
            7F601A010073187F602A0100C733FEC07402008E65FC81250800388EF1079621
            00E018C61F588A0080F18C3FB01C010063197F60490200C631FEC0B204008C61
            FC81A50900D89FF107962700605FC61F284100C07E8C3F508600807D187FA014
            01008F33FE403902001E63FC81920400DCCFF803650900B88FF1074A1300703B
            E30F942700E036C61F684100C0F58C3FD0860080EB187FA015010097197FA01D
            0100AF33FE404B0200CE33FE405B02005E66FC81D604003C67FC81F604007CCD
            F8031104007C66FC811802003E32FE40140100C61F0824004867FC8148028064
            C61F8825004865FC8168028044C61F8827004863FC01DE0800B2187F804F0400
            298C3FC0170400098C3FC0130280EE8C3FC00B04009D197F803304005D197F80
            5708003A32FE00170800BA31FE005710007462FC01AE2400E8C2F803DC4000D0
            81F107B89100A03AE30F7007014065C61FE04E0280AA8C3FC003040015197F80
            070900AA31FE003B10005462FC01762200A8C2F803EC48005081F107D8990060
            75C61F600001C0CA8C3FC020028055197F808104002B32FE008309005663FC01
            0E20005889F1073888006015C61FE040028015187F808309006633FE00130800
            6632FE009308006631FE001309006630FE009309008E66FC011620003892F107
            588400E028C61F6021028023187F80C508004633FE000B12008C64FC01162500
            18C5F8032C4C003082F107589C00606FC61FA00001C09E8C3F40110280BD187F
            804204007B30FE00C508001E65FC010A12003CC2F803142500B897F107284C00
            700FE30F509C00E056C61FA00101C02D8C3F401302806B197F80460400D730FE
            00CD08002E31FE000D09005E63FC019A12009C63FC011A1300BCC4F803342700
            78CAF8030410007CC9F8038410006C8C3F401001C007C61F208C00C0F8030412
            00D98C3F40280190CBF803041300998C3F40380190C7F8032000C2187F00FE20
            0072187F00FE240032187F00BE2200FA33FE003C23007A33FE00BC4800F465FC
            01384B00F464FC01789500E8C7F803709100E8C5F803701501D087F107E06A02
            A007E30FC04D04407DC61F809B0980DA8C3F0077110075197F00EE26006A32FE
            003C4400D463FC01789800A8C5F803B00B015047DAF87FF0C3E97E9EFD0860BA
            5F4EF77EF623BA110035248E3FC0E69FA7FBC7EC47742300D667FC8174026000
            01B036E30F2000861000EB32FE001F09800104C09A8C3FC06702600001B01EE3
            0FF03501308000588BF107784E000C2000D661FC015E26000610006B30FE00E7
            09800104C07CC61FE075026000013097F107B84C000C2000E631FE00D7110003
            0880398C3FC0F504C00002E078C61FE03602600001702CE30F703B0130800038
            8EF107B88F001840001CC3F803DC4F000C2000C633FE008F1100030880B18C3F
            C0E304C00002601CE30FB00F0130800018C3F803EC47000C2000C6F8EBE9FE75
            BABFCC7E08400302600001308E0800D887001840008C2502001E2700061000E3
            890080C708800104C0314400C0FD04C00002E0382200E03E02600001702C1100
            703B01308000389E0800B88D00184000CC210200AE2700061000F3880080EB08
            800104C05C2200E03201308000984F0400BC4E000C2000D6200200CE13000308
            80758800809709800104C05A4400C07302600001B01E1100F035013080005893
            0800F84C000C2000D62502003E1200030880B589000001308400589F0800D209
            800104400D220048260006100075BC3BDD8FA77B3BFB2107FAE1743FCF7E0430
            DD2FA77B3FFB11DD08805AD2BE04FC76BAEF4FF7D3EC8700742300EA1101003C
            4C00D4240200788800A84B0400703701509B0800E02E02A03E1100C0CD04400F
            2200809B08803E440000571300BD880000AE2200FA1101005C24007A120100BC
            4A00F4250200384B00F4260200789100E84F0400F08C00C8200200F88A00C821
            0200F89300C8220200F88300C82302001000A14400403801904B0400041300D9
            4400402801800800082400F84004008411006C4400401001C0974400400801C0
            532200208000E0252200A03901C0392200A03101C06B4400405302804B440040
            4302806B880080660400D71201008D08006E2102009A1000DC4A0400342000B8
            870800284E00702F1100509800E0112200A02801C0A34400404102803D880080
            6204007B110100850800F62402008A1000EC4D0400142000184104002C4E0030
            8A080058980060241100B02801C06822006041028023880080C508008E220200
            16220038920800588400E068220060010280194400C0640280594400C0440280
            994400C0240280D94400C004028015880080830900562102000E240058890800
            38880060352200E000028015890080C10400AB12010003090056260200061100
            AC4E04000C2000A8400400EC4C0050850800D89100A0121100B0130140352200
            600702808A4400C0830400558900800708002A13010077120054270200EE2000
            E8400400DC4800D0850800B88100A013110070250140372200E00A02808E4400
            C0050280AE4400C02B04009D890080330400DD89008017080012880080270400
            294400C0170400494400C0270280342200E08D0020930800E20900528900209A
            0020990800620900D28900209200001100041200F0910800A20800F84C040031
            04007C4D04001104003C270280F60400BC4C0400AD0900384F04006D0900789D
            08005A120070990800DA1100701D1100B42200E07A2200684300C06D4400D082
            0080DB8900A03C0100F7110140690200EE270280B204003C460400250900789C
            0800CA1100B00F1100942200603F2200284300C0BE440050820080FD89006079
            0200C61001C0D204008C230280650900184B04004B1200309E0800962300E018
            2200588A0080E38800601902008E250280250800389E0800A6130030870800A6
            1200308F0800A6110030970800A6100030DFBBD3FD78BAB7B31F72905F4FF7DD
            E97E9FFD10482600600D295F02FE7BBABF9DEE3FB31F02E90400ACA37B04187F
            58880080B5748D00E30F8B1100B09E6E1160FC61410200D6D425028C3F2C4A00
            C0BAAA4780F187850900585BD50830FEB0380100EBAB1601C61F0A1000504395
            0830FE508400803A568F00E30F850800A865D50830FE508C00807A568B00E30F
            050900A869950830FE50940080BA664780F187C20400D4362B028C3F142700A0
            BEA323C0F8430302007A382A028C3F342100A08FD11160FCA1110100BD8C8A00
            E30FCD0800E867EF0830FED09000809EF68A00E30F4D0900E8EBD10830FED098
            0080DEEE8D00E30FCD0900E8EFD60830FE10400040866B23C0F843080100392E
            4580F187200200B29C8B00E30F610400E4791A01C61F020900C8B445C0B76F8C
            3F44120090EBDDA7DFF7B31F021C4F0000402001000081040000041200001048
            0000402001000081040000041200001048000040200100008104000004120000
            1048000040200100008104000004120000104800004020010000810400000412
            0000104800004020010000810400000412000010480000402001000081040000
            0412000010480000402001000081040000041200001048000040200100008104
            0000041200001048000040200100008104000004120000104800004020010000
            8104000004120000104800004020010000810400000412000010480000402001
            0000810400000412000010480000402001000081040000041200001048000040
            2001000081040000041200001048000040200100008104000004120000104800
            0040200100008104000004120000104800004020010000810400000412000010
            4800004020010000810400000412000010480000402001000081040000041200
            0010480000402001000081040000041200001048000040A0FF030801D62EB80B
            0D7D0000000049454E44AE426082}
          Proportional = True
          OnClick = iButtonBackAlterarSenhaClick
        end
        object Panel2: TPanel
          Left = 302
          Top = 11
          Width = 86
          Height = 26
          BevelOuter = bvNone
          Caption = 'Alterar Senha'
          Color = clCoral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
        end
      end
    end
  end
  object pBusca: TPanel
    Left = 0
    Top = 0
    Width = 425
    Height = 55
    BevelOuter = bvNone
    Color = clCoral
    ParentBackground = False
    TabOrder = 2
    StyleName = 'Windows'
    object lblUserName: TLabel
      Left = 95
      Top = 15
      Width = 109
      Height = 25
      Caption = 'lblUserName'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblUserId: TLabel
      Left = 63
      Top = 15
      Width = 75
      Height = 25
      Caption = 'lblUserId'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object eBuscaMain: TEdit
      Left = 210
      Top = 17
      Width = 186
      Height = 23
      BevelInner = bvNone
      BevelOuter = bvNone
      TabOrder = 0
      TextHint = 'Pesquise um restaurante ou loja ...'
      StyleName = 'Windows'
    end
    object eBuscaProdutoComm: TEdit
      Left = 259
      Top = 17
      Width = 137
      Height = 23
      BevelInner = bvNone
      BevelOuter = bvNone
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TextHint = 'Pesquise um produto ...'
      Visible = False
      StyleName = 'Windows'
    end
  end
  object pBarraMenuLeft: TPanel
    AlignWithMargins = True
    Left = 0
    Top = 0
    Width = 55
    Height = 55
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    BevelOuter = bvNone
    Color = clCoral
    ParentBackground = False
    TabOrder = 0
    object iButton1: TImage
      Left = 6
      Top = 6
      Width = 44
      Height = 44
      Center = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000002000000
        02000806000000F478D4FA000000097048597300000B1300000B1301009A9C18
        000000B46558496649492A000800000006001201030001000000010000001A01
        050001000000560000001B010500010000005E00000028010300010000000200
        0000130203000100000001000000698704000100000066000000000000004800
        0000010000004800000001000000060000900700040000003032313001910700
        040000000102030000A00700040000003031303001A0030001000000FFFF0000
        02A00400010000000002000003A00400010000000002000000000000915FF1DA
        00000F924944415478DAEDDD7DC8B6757DC7F1237B9CB7366D8D329C909961CB
        D1C8B225E5B6ACB1466A661B4116F40445AB88AC609B454FAB818C56163D8DA8
        8D91DB58DE3D612DDA42D6CAD5D662EB41334B8A9E2D2DB44CEFBE3FCEFBA622
        288DFB38BFE7717C5E2FF8FCA17F7D2FFDE37A5FD7759CE779AB09008873ABEE
        030080ED13000010480000402001000081040000041200001048000040200100
        0081040000041200001048000040200100008104000004120000104800004020
        0100008104000004120000104800004020010000810400000412000010480000
        4020010000810400000412000010480000402001000081040000041200001048
        0000402001000081040000041200001048000040200100008104000004120000
        1048000040200100008104000004120000104800004020010000810400000412
        0000104800004020010000810400000412000010480000402001000081040000
        0412000010480000402001000081040000041200001048000040200100008104
        0000041200001048000040200100008104000004120000104800004020010000
        8104000004120000104800004020010000810400000412000010480000402001
        0000810400000412000010480000402001000081040000041200001048000040
        2001000081040000041200001048000040200100008104000004120000104800
        0040200100008104000004120000104800004020010000810400000412000010
        4800004020010000810400000412000010480000402001000081040000041200
        0010480000402001000081040000041200001048000040200100008104000004
        1200001048000040200100008104000004120000104800004020010000810400
        0004120000104800004020010000810400000412000010480000402001000081
        04000004120000104800004020010000810400000412000010480000402001B0
        F12BB5936AF7A8DDB976EBEE83003868AEAE7DA1F6F1DAD7BB8FD915C90170DB
        DA9FD41E55FB83DA9EEE830098D58DB5FFA85D547B4BED9BDD07754A0C80F135
        9F5D7B59ED9EDDC700D0E2BBB50BA6CDF7826BBB8FE9901600BF5AFB87DA1F76
        1F02C04EB8BC7646EDFFBB0FD9B6A40038AEB6B77642F72100EC946B6A8FADBD
        A7FB906D4A0980F160DF476AC7761F02C04EBA61DA3C0FF6C1EE43B6252100C6
        C37EEFAF9DDA7D08003B6D3C147872ED73DD876C434200BCA4F6E7DD4700B008
        97D41EDC7DC436AC3D008EAA5D3679891F0037DF7828706FF711735B7B00BCB6
        F6B4EE23005894F18A80FBD4F6751F32A73507C0F8DBFF576B47761F02C0E28C
        7787FD58F711735A73009C366D1EFE03805B6A3C3F765EF711735A73009C5F7B
        4EF711002CD2F8DC80FB751F31A73507C0C5B587771F01C0225D573BAC7653F7
        2173597300FC6FEDC4EE230058AC5FAB7DABFB88B9AC3900C6CBFF8EEB3E0280
        C53AA67655F711735973007C72DABC8C03007E19E36DE457FB91C16B0E80F7D5
        1ED67D04008B74FDB4791339CF002CD05FD79EDD7D04008BF43FB5DFEE3E624E
        6B0E80F1D3FFFBBA8F0060915E36ADFC7364D61C00DE0910805FD6036A97761F
        31A73507C0F0FADA53BB8F0060513E533B61F259008B76B769F372C043BB0F01
        6031CEAAFD4BF711735B7B000C7F597B41F711002CC2876BA74C2BFFE97F4808
        803BD43E587B60F72100ECB4F1AE7F27D72EEF3E641B120260B8EBB47998E3E8
        EE4300D84937D61E597B6FF721DB921200C378A063EFE4ED8101F869DFAB9D33
        05FCDDFF272505C070A7DA85B587761F02C04EB8B27666ED13DD876C5B5A001C
        F89ACFAEBDA2766CF73100B4183FF5BFA6F6F2DA35DDC774480C80036E3F6D7E
        E5335EEEF1FBFBFF1980F51A4FF6FF57ED1DB5374F9B378B8B951C003FE9F069
        F32A81E36B47ECFF670096EFBADAB5B52B6A1FAD7DB9FBA05D21000020900000
        8040020000020900000824000020900000804002000002090000082400002090
        0000804002000002090000082400002090000080400200000209000008240000
        2090000080400200000209000008240000209000008040020000020900000824
        0000209000008040020000020900000824000020900000804002000002090000
        0824000020900000804002000002090000082400002090000080400200000209
        0000082400002090000080400200000209000008240000209000008040020000
        0209000008240000209000008040020000020900000824000020900000804002
        0000020900000824000020900000804002000002090000082400002090000080
        4002000002090000082400002090000080400200000209000008240000209000
        0080400200000209000008240000209000008040020000020900000824000020
        9000008040020000020900000824000020900000804002E0C7F6D48EADFD7AED
        90EE63003868BE5DBBB2F68DEE4376497A00DCBBF6A8DA19B59326FF3D00D6EC
        F3B58BF6EF43B59BBA0FEA94FA0DEFF8DA4B6B6707FF370048F67FB517D4DED5
        7D4897B46F7EE357FB2FAE3DBF769BEE630068B7B7F6F8DA77BA0FD9B6A40038
        ACF6D669F32B7F0038E0B2DAE9B54F771FB24D290170FBDA076AA7741F02C04E
        1A0F083E60DA3C2710212500DE587B72F71100ECB44FD57E670AF9734042008C
        6FFC6FEC3E028045F8BBDA39DD476CC3DA0360BCB67FFC6DE7A8EE430058847D
        B507D5FEB3FB90B9AD3D00FE62DA3CF50F0037D77866ECB4EE23E6B6E600185F
        DB176ABFD17D08008B33DE2FE6B2EE23E6B4E60018EFEC7769F711002CD2736B
        E7771F31A73507C08B6A2FEC3E028045FAF7DAEF761F31A73507C078AFE7D3BB
        8F006091C64B018FE83E624E6B0E80FFAEDDB7FB080016EBC869F34982ABB4E6
        00F86CED9EDD4700B058C7D4AEEA3E622E6B0E80F1494FF7EE3E0280C5BA4BED
        6BDD47CC65CD01301EE07848F711002CD20F6B87D66EE83E642E6B0E80D7D79E
        DA7D04008B34FE8C7CAFEE23E6B4E600784CEDC2EE230058A40B6ACFE83E624E
        6B0E80C36A5FAFDDA1FB100016E7E1B5F7771F31A73507C0F08EDA19DD4700B0
        28E387C7A36B3FE83E644E6B0F80DF9A36EF077048F721002CC6336BAFEE3E62
        6E6B0F80E16DB5C7751F01C0227CBE7642EDFBDD87CC2D2100EE5AFBE8E45301
        01F8F9C64BFEC6DFFEFFADFB906D48088061BC25F025B53DDD8700B0B39E5E7B
        5DF711DB921200C3236A6F9F36AF0E008003F6D55E3C6D3E45364652000C274E
        9B4F09BC7BF72100EC84EBA7CD9BC6BDADFB906D4B0B80E14EB5F36A4FABDDAE
        FB1800DABCABF6BCDAA7BA0FE9901800071C5B3BB776E6B479501080F5FB5EED
        E2DAAB6A1FEA3EA65372001C30DE23E0E4DAA9B5E36B47D40EEF3E0A8083E2BA
        DAB5B5CF4D9B57847D60FFBF8B27000020900000804002000002090000082400
        0020900000804002000002090000082400002090000080400200000209000008
        2400002090000080400200000209000008240000209000008040020000020900
        0008240000209000008040020000020900000824000020900000804002000002
        0900000824000020900000804002000002090000082400002090000080400200
        0002090000082400002090000080400200000209000008240000209000008040
        0200000209000008240000209000008040020000020900000824000020900000
        8040020000020900000824000020900000804002000002090000082400002090
        0000804002000002090000082400002090000080400200000209000008240000
        2090000080400200000209000008240000209000008040020000020900000824
        0000209000008040020000020900000824000020900000804002000002090000
        0824000020900000804002E067DDB176EBEE23003868BE5DDBD77DC4AE490F80
        DBD57EAF7666ED21B5E3F6FF3B00D6E3A6DA176B97D62EAABDA77675F751DD52
        03E0D0DAB36AE7D68EEC3E0680ADBAA1F6D6DA0B6B5FEA3EA64B62009C557B75
        ED6EDD8700D0EABADA2B6A2F9D36BF2588921400E36B7D5EEDE5B543BA8F0160
        67BCB7F6D8DA77BA0FD9A6A4007853ED49DD4700B0933E316D9E05BBA6FB906D
        490980F193FF2BBB8F0060A75D5CFBA3DA8DDD876C4342009C366DFEA7FAB53F
        00BFC84B6AE7751FB10D6B0F80F17AFEF16B9DDFEC3E048045F841ED84DA15DD
        87CC6DED01F0C4DA9BBB8F006051C64B049FD07DC4DCD61E009FACDDA7FB0800
        16653C03305E2AFEB5EE43E6B4E600B847EDF2EE230058A4274F2BFF0DF29A03
        E039B5F3BB8F006091DE593BBDFB8839AD39002EAC3DA6FB08001669FCFAFF2E
        DD47CC69CD01303EF4E1A4EE230058ACC36BDFED3E622E6B0E80CFD48EEF3E02
        80C53A7A5AF18705AD39003E5DBB57F711002CD651B5AF741F31973507C0876B
        0FEC3E028045DA57DB336D3E317095D61C00E38D1CCEE93E028045BAAA764CF7
        11735A73003CA5F686EE230058A4BFAF3DAEFB8839AD3900C6CB37BE3CF91020
        006EB93FAEFD63F711735A73000C97D44EE93E028045197FF71F3F445EDB7DC8
        9CD61E008FA8BDBBFB080016E5AF6ACFEF3E626E6B0F80E15F6B0FED3E028045
        B8BA765CED5BDD87CC2D21004E9C362F09DCD37D08003BEF49B5BFED3E621B12
        026038ABF64F415F2F00B7DC6B6A7FDA7DC4B6247D433CB7F6CAB0AF19809B67
        6FEDD1B51F761FB22D69DF0CC7A703BEA57668F72100EC8CBF99361F217F63F7
        21DB941600C37DA7CDAF79BC3C1020DB95B5E7D6FEB9FB900E890170C019B53F
        ABDDBFFB1000B6EA8BB557D52EA87DBFFB982EC90170C078AFE7D36BA74E9B4F
        0F3CA27658F751001C14D7D7AEA95D51FB48ED9DB58F771FB50B040000041200
        0010480000402001000081040000041200001048000040200100008104000004
        1200001048000040200100008104000004120000104800004020010000810400
        0004120000104800004020010000810400000412000010480000402001000081
        0400000412000010480000402001000081040000041200001048000040200100
        0081040000041200001048000040200100008104000004120000104800004020
        0100008104000004120000104800004020010000810400000412000010480000
        4020010000810400000412000010480000402001000081040000041200001048
        0000402001000081040000041200001048000040200100008104000004120000
        1048000040200100008104000004120000104800004020010000810400000412
        0000104800004020010000810400000412000010480000402001000081040000
        0412000010480000402001000081040000041200001048000040200100008104
        0000041200001048000040200100008104000004120000104800004020010000
        8104000004120000104800004020010000810400000412000010480000402001
        0000810400000412000010480000402001000081040000041200001048000040
        2001000081040000041200001048000040200100008104000004120000104800
        00402001000081040000041200001048000040A01F01C51E0810809C2D5D0000
        000049454E44AE426082}
      Proportional = True
      OnClick = iButton1Click
    end
    object iButton2: TImage
      Left = 17
      Top = 91
      Width = 54
      Height = 55
      Center = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000002000000
        02000806000000F478D4FA000000097048597300000B1300000B1301009A9C18
        000000B46558496649492A000800000006001201030001000000010000001A01
        050001000000560000001B010500010000005E00000028010300010000000200
        0000130203000100000001000000698704000100000066000000000000004800
        0000010000004800000001000000060000900700040000003032313001910700
        040000000102030000A00700040000003031303001A0030001000000FFFF0000
        02A00400010000000002000003A00400010000000002000000000000915FF1DA
        0000328B4944415478DAEDDD07D46E6571E8F147292A1D6CA8518A4954C0885D
        140B88A288464D622CD78E8AA2221A63BC492C312B51A246B02262341A7B8941
        C482820D052B1CC59802476C880D10442C7867D69EB33CF72CCE39DFF7CEDE7B
        66DEE7FF5B6BD6CD4D387BCF37F33D7B9EEF2D7B5FAD010080EE5C2D3A010000
        303F3600000074880D0000001D620300004087D8000000D0213600000074880D
        0000001D620300004087D8000000D0213600000074880D0000001D6203000040
        87D8000000D0213600000074880D0000001D620300004087D8000000D0213600
        000074880D0000001D620300004087D8000000D0213600000074880D0000001D
        9A6303F0DBE81F3298B7C6D4CF87FAF9503F1FEAE743FDAA1EDCD0401FEAE743
        FD7CA89F0FF5F3A17E550F6E68A00FF5F3A17E3ED4CF87FAF950BFAA073734D0
        87FAF9503F1FEAE743FD7CA85FD5831B1AE843FD7CA89F0FF5F3A17E3ED4AFEA
        C10D0DF4A17E3ED4CF87FAF9503F1FEA57F5E08606FA503F1FEAE743FD7CA89F
        0FF5AB7A7043037DA89F0FF5F3A17E3ED4CF87FA553DB8A1813ED4CF87FAF950
        3F1FEAE743FDAA1EDCD0401FEAE743FD7CA89F0FF5F3A17E550F6E68A00FF5F3
        A17E3ED4CF87FAF950BFAA073734D087FAF9503F1FEAE743FD7CA85FD5831B1A
        E843FD7CA89F0FF5F3A17E3ED4AFEAC10D0DF4A17E3ED4CF87FAF9503F1FEA57
        F5E08606FA503F1FEAE743FD7CA89F0FF5AB7A7043037DA89F0FF5F3A17E3ED4
        CF87FA553DB8A1813ED4CF87FAF9503F1FEAE743FDAA1EDCD0401FEAE743FD7C
        A89F0FF5F3A17E550F6E68A00FF5F3A17E3ED4CF87FAF950BFAA073734D087FA
        F9503F1FEAE743FD7CA85FD5831B1AE843FD7CA89F0FF5F3A17E3ED4AFEAC10D
        0DF4A17E3ED4CF87FAF9503F1FEA57F5E08606FA503F1FEAE743FD7CA89F0FF5
        AB7A7043037DA89F0FF5F3A17E3ED4CF87FA553DB8A1813ED4CF87FAF9503F1F
        EAE743FDAA1EDCD0401FEAE743FD7CA89F0FF5F3A17E550F6E68A00FF5F3A17E
        3ED4CF87FAF950BFAA073734D087FAF9503F1FEAE743FD7CA85FD5831B1AE843
        FD7CA89F0FF5F3A17E3ED4AFEAC10D0DF4A17E3ED4CF87FAF9503F1FEA57F5E0
        8606FA503F1FEAE743FD7CA89F0FF5AB7A7043037DA89F0FF5F3A17E3ED4CF87
        FA553DB8A1813ED4CF87FAF9503F1FEAE743FDAA1EDCD0401FEAE743FD7CA89F
        0FF5F3A17E550F6E68A00FF5F3A17E3ED4CF87FAF950BFAA073734D087FAF950
        3F1FEAE743FD7CA85FD5831B1AE843FD7CA89F0FF5F3A17E3ED4AFEAC10D0DF4
        A17E3ED4CF87FAF9503F1FEA57F5E08606FA503F1FEAE743FD7CA89F0FF5AB7A
        7043037DA89F0FF5F3A17E3ED4CF87FA553DB8A1813ED4CF87FAF9503F1FEAE7
        43FDAA1EDCD0401FEAE743FD7CA89F0FF5F3A17E550F6E68A00FF5F3A17E3ED4
        CF87FAF950BFAA073734D087FAF9503F1FEAE743FD7CA85FD5831B1AE843FD7C
        A89F0FF5F3A17E3ED4AFEAC10D0DF4A17E3ED4CF87FAF9503F1FEA57F5E08606
        FA503F1FEAE743FD7CA89F0FF5AB7A7043037DA89F0FF5F3A17E3ED4CF87FA55
        3DB8A1813ED4CF87FAF9503F1FEAE743FDAA1EDCD0401FEAE743FD7CA89F0FF5
        F3A17E550F6E68A00FF5F3A17E3ED4CF87FAF950BFAA073734D087FAF9503F1F
        EAE743FD7CA85FD5831B1AE843FD7CA89F0FF5F3A17E3ED4AFEAC10D0DF4A17E
        3ED4CF87FAF9503F1FEA57F5E08606FA503F1FEAE743FD7CA89F0FF5AB7A7043
        037DA89F0FF5F3A17E3ED4CF87FA553DB8A1813ED4CF87FAF9503F1FEAE743FD
        AA1EDCD0401FEAE743FD7CA89F0FF5F3A17E550F6E68A00FF5F3A17E3ED4CF87
        FAF950BFAA073734D087FAF9503F1FEAE743FD7CA85FD5831B1AE843FD7CA89F
        0FF5F3A17E3ED4AFEAC10D0DF4A17E3ED4CF87FAF9503F1FEA57F5E08606FA50
        3F1FEAE743FD7CA89F0FF5AB7A7043037DA89F0FF5F3A17E3ED4CF87FA553DB8
        B94262EB19CE9391FEECD71CE118D4CF770CEAE73B06F5F31D83FAF98E41FD26
        32C706E0C712BBCC709E8C7E24715DE731A89F0FF5F3A17E3ED4CF87FA4D688E
        0DC05A89DD66384F46E749ECE93CC6DA46FD3CD636EAE7B1B6513F8FB58DFA79
        AC6DD46F32736C00BE2871DB19CE93D11724EEE03C06F5F3A17E3ED4CF87FAF9
        50BF09CDB101789BC4C366384F466F9578A4F318D4CF87FAF9503F1FEAE743FD
        2634C706E0F9122F98E13C19FDADC4DF3B8F41FD7CA89F0FF5F3A17E3ED46F42
        736C00FE44E23D339C27A3074BBCDF790CEAE743FD7CA89F0FF5F3A17E139A63
        03703D890B663A5726574A5CBF0D9FE4F4A07E3ED4CF87FAF9503F1FEA37A1B9
        8ABA46629F99CE95C557246E33D2B1A89F0FF5F3A17E3ED4CF87FA4D64AE0DC0
        CB258E9AE95C59FC93C45F8E742CEAE743FD7CA89F0FF5F3A17E13996B0370BB
        367CA5A127B796F8EA48C7A27E3ED4CF87FAF9503F1FEA379139DF57E9E9659C
        7324F61EF998D4CF87FAF9503F1FEAE743FD2630E706E02FDAF0B2460F9ED586
        97ADC644FD7CA89F0FF5F3A17E3ED46F02736E00B697F896C4CE339E33C24F24
        7697F8D9C8C7A57E3ED4CF87FAF9503F1FEA3781B9BF5AF14289E7CD7CCEB9E9
        CFF7A2898E4DFD7CA89F0FF5F3A17E3ED46F64736F0074F7F6CD36F1138E02FD
        40E26612174F747CEAE743FD7CA89F0FF5F3A17E238BB8B9C2E3244E0838EF1C
        1E25F19689CF41FD7CA89F0FF5F3A17E3ED46F44111B003DE7A725EE1270EE29
        7D4AE21E12BF9DF83CD4CF87FAF9503F1FEAE743FD4614757BC59B4A7C4962C7
        A0F38FEDA2363CB2F2DC99CE47FD7CA89F0FF5F3A17E3ED46F2491F757FE5389
        77079E7F4CFAC08AF7CD7C4EEAE743FD7CA89F0FF5F3A17E23887EC0C2CB249E
        199C83D7D112CF093A37F5F3A17E3ED4CF87FAF9503FA7E80D809EFF8D128F09
        CE63516F9378641B9EDC1481FAF9503F1FEAE743FD7CA89F53F406406D25F1EF
        12874427B24A1F6CC3F39A7F159C07F5F3A17E3ED4CF87FAF9503F870C1B00B5
        A5C4716DF88A47056FB55CA37FF9D7A17E3ED4CF87FAF9503F1FEAB7A02C1B80
        75B9E8FB217F119DC826E85734F47ED47FD566FEBAC60A503F1FEAE743FD7CA8
        9F0FF55B40A60DC03A0F6CC3FB3AD9EEF97C89C41324DE159DC866503F1FEAE7
        43FD7CA89F0FF55B858C1B00B5A7C49B24EE1A9D88D19B343C46E2BC918F7B83
        36EC042F18F9B8D4CF87FAF9503F9F9EEAA7BE3FF2717BA99F5BD60DC0BADCF4
        1392FA92C9F58272D027333D57E2F836FE4B365797F8B01DF73E131C7FD9EBA7
        3FDF896DF81010F55BECE7A37EBE9F8FFAF97E3EADDFB6120749FC6682E32F73
        FD46917903B0CE4E124F973852629799CEF9638963248E6DD33D98417F31FEC1
        FEE723ED5C5358D6FA1DD57EF7CC6CEAB77AD4CF87FAF9AC5F3F7D4FFC25139D
        6759EB378A0A1B8075B69378621B3E3DB9F744E7F85A1BDE3FD21DDBA513FE2C
        FB497CB20D7F3DA82B240E90F8DC84E75CA6FAE97DC03F21B1B5FDFFA9DFEA50
        3F1FEAE7B361FDF4D3F0FA72FD19139E7399EA379A4A1B80F5DD5AE2E112F792
        B8651B5E4E5F84DE80E16C898FB5E1A60C5F9D21F71BB5E117FD461BFCEFF57D
        C4DB4B7C67861C2AD74FDF37FCA2C40D37F8DF53BF95A17E3ED4CF6763F5D3CF
        01DC49E2FC1972A85CBF5155DD00ACEF3A127793D84BE216127FD886977AF4A5
        9FEDECBFD1DD983E7041DF93D1E749FFA7C4D7DBF054A91FCD98ABE6F499B6F1
        1DA82E8C03DABCBBC74AF5DB5EE2D4363C3883FA513FEAB75CF55B23B17F1B3E
        314FFD66B00C1B802AF4E5AE0F49DC7333FF9DEE260F95F86574C2C95C43E2A4
        46FD1645FD7CA89FCF4AEBF7D136D42FFC26393D6003300FFDE57F4F1B7EB157
        42FF5B7D898A4530D0CF4ABCA30DB7CE5C09EAF7FFA37E3ED4CF67B5F5FB80C4
        431A9BA8C9B101989E0E7F7D6CE5FD57F9EF74B7AC8FBCFC45F40F104C5F3979
        671B6EF0B11AD46F40FD7CA89FCFA2F5D3AF483FA851BF49B1019896BEE7F5FE
        B6F997BD36E6236DB88894F844E904B47EFAD7D4BD17FCF7D48FFA79503F1F6F
        FDF4ED803F69FDD66F726C00A673E336BC94756BE771F48331FAD6C11C9F8ECD
        44BF25F11F12B7711E87FAF9503F1FEAE7A3F5FBE396F02E7ACB800DC034F453
        A5EF6DC3274CC7F03D893F93383DFA079B897E1258DF36D975A4E3513F1FEAE7
        43FD7C7ED886CF0F7C26FA075B366C00C6A5DF27D5A751BDA8FDEE261763D10F
        14FDB5C44B5BD2DB4A8E407F1FFF52E2EFDBF088CF31513F1FEAE743FD7CF403
        817F23F1B2367CFF1E236003309EDD25FEB54DFF000A7D5F51EF68B56C2F29EE
        D6863B68DD6BE2F3503F1FEAE743FD7CF40EAA8F96F856F40FBC0CD800F86D21
        F124897F94D861A673EA8D3274A7AD0BAEFA6E585F35395CE2C56DF8D0D01CA8
        9F0FF5F3A17E3E7A7FFDE748BCA18DFF10A1AEB001F0B97B1B1EFA70ABA0F37F
        B90D0FB9A8FADE98DE3A551F9871A7A0F3533F1FEAE743FD7CF4D6BB5ABF4F45
        17A22A36008BD181FFBCB6F21B5B4C49DF4FD40FDCFC5D1B6E4F5981DE7F5BEB
        A75FF189FE1DA47E3ED4CF87FAF969FDF47307674727524D86E655A24FB1D2C7
        F81ED2F2D54E5F4AD46F1EE8878CCE8C4E6623F42F05FD90A4DEE063D107704C
        85FAF9503F1FEAE7A31B29BDF9923E627DCAA7322E956C432C237D28C443DBF0
        18C9DB4727B3427A0179751B2E289705E7A20FD4D0BF149E2A71BBE05C568AFA
        F9503F1FEAE7A34F5BFD9736DC7EF8E2E86432ABB001D0C72CEA0D75F4D69073
        3573C7367C9A556F5FA92FF35F2BBA080BFA791B6AF7AE363CA464AE8B895E34
        B47E7A3FEF07486C135D8805513F1FEAE743FD7C2E97785F1BEEC67A4A9B777E
        DCA70D37307A78741136A5C20660DD7766F57BA0FA1590D3DAB0C3FB421BEFB1
        91DA307D44E51D250E6EC34BFD637F8F35DA156DF8B08C2E047D89EC4B6DB8C0
        8C412F10FAD7C17E1207B5E1464863DF07211AF5F3A17E3ED4CF47EFC3F0D936
        7C0D53E787D66FACF9A1DFFED25787F52D927BB4E1C3E15BD9FF2DF58C4D9D9C
        D9D84D33F43DB36F589C67A1DF0DFD411B767EBA3874C7A7EF55E980D75F68DD
        D9EADDA9F43BAB3769C377F7F795F88322B518D3AFDB50BB75CFB73E57E24289
        EFB7E1D9D77AC1597781D10B843ED468E736D4EF7A123795B899C4CD2D966DC3
        B439D4CF87FAF9503F1F9D2BFF257196C4DA36DC9741E7C7056D78F680FEC1A9
        F343E78CCE0FADA1BE12BC6E7EECD186F9B1571BEAB7B1CF44A49E2BA99333CB
        7AD72C00C0724B3D63532767D80000002A4A3D63532767D80000002A4A3D6353
        2767D80000002A4A3D63532767D80000002A4A3D63532767D80000002A4A3D63
        532767D80000002A4A3D63532767D80000002A4A3D63532767D80000002A4A3D
        63532767D80000002A4A3D63532767D80000002A4A3D63532767D80000002A4A
        3D63532767D80000002A4A3D63532767D80000002A4A3D63532767D80000002A
        4A3D63532767D80000002A4A3D63532767D80000002A4A3D63532767D8000000
        2A4A3D63532767D80000002A4A3D63532767D80000002A4A3D63532767D80000
        002A4A3D63532767D80000002A4A3D63532767D80000002A4A3D63532767D800
        00002A4A3D63532767D80000002A4A3D63532767D80000002A4A3D63532767D8
        0000002A4A3D63532767D80000002A4A3D63532767D80000002A4A3D63532767
        D80000002A4A3D63532767D80000002A4A3D63532767D80000002A4A3D635327
        67D80000BFB346E204895324D64A5C169D1050D8B612BB4B1C247198C43E231F
        3FF58C4D9D9C610300B47685C45112C7495C199D0CB084B690385CE2E5125B8F
        74CCD433367572860D007AA7C3FFBE12A746270274E0408993DB389B80D43336
        7572860D007AF76489D745270174E4A912AF1CE138A9676CEAE40C1B00F44CDF
        F3DFB7F1B23F30277D3BE02C89BD9DC7493D63532767D800A067474A1C1B9D04
        D021FDCCCDCB9DC7483D63532767D800A067FA17C839D149001DD26F04AC711E
        23F58C4D9D9C6103809E6D2F71697412408774ED5DE23C46EA199B3A39C30600
        3DABB0468165E59D3FA9D76FEAE40C1B00F4ACC21A0596151B80606C00D0B30A
        6B1458566C0082B10140CF2AAC516059B10108C606003DABB0468165C5062018
        1B00F4ACC21A0596151B80606C00D0B30A6B1458566C0082B10140CF2AAC5160
        59B10108C606003DF3AE51D60F7A16BD7E52CFD8D4C9192E60E859F4050CA82C
        7AFDA49EB1A993335CC0D0B3E80B185059F4FA493D63532767B880A167D11730
        A0B2E8F5937AC6A64ECE700143CFA22F604065D1EB27F58C4D9D9CE102869E45
        5FC080CAA2D74FEA199B3A39C3050C3D8BBE80019545AF9FD433367572860B18
        7A167D01032A8B5E3FA9676CEAE40C1730F42CFA02065416BD7E52CFD8D4C919
        2E60E859F4050CA82C7AFDA49EB1A993335CC0D0B3E80B185059F4FA493D6353
        2767B880A167D11730A0B2E8F5937AC6A64ECE700143CFA22F604065D1EB27F5
        8C4D9D9CE102869E455FC080CAA2D74FEA199B3A39C3050C3D8BBE80019545AF
        9FD433367572860B187A167D01032A8B5E3FA9676CEAE4CCD817B0351227489C
        22B156E2B2E81F10A1B695D85DE22089C324F6894E6803D11730A0B2E8F5937A
        C6A64ECE8C7501BB42E22889E324AE8CFEA190D21612874BBC5C62EBE8644CF4
        050CA82C7AFDA49EB1A99333635CC074F8DF57E2D4E81F06251C287172CBB109
        88BE80019545AF9FD433367572668C0BD893255E17FD83A094A74ABC323A8916
        7F01032A8B5E3FA9676CEAE48CB701FA9EFFBE8D97FDB13AFA76C059127B07E7
        117D01032A8B5E3FA9676CEAE48CB701474A1C1BFD43A024FDCCC8CB837388BE
        80019545AF9FD433367572C6DB00FD0BEE9CE81F0225E93702D604E7107D0103
        2A8B5E3FA9676CEAE48CB701DB4B5C1AFD43A024FDDDB9243887E80B185059F4
        FA493D6353276796BA01482F7A80465FC080CAA2D74FEAF9933A39B3D40D407A
        D10334FA02065416BD7E52CF9FD4C999A56E00D28B1EA0D11730A0B2E8F5937A
        FEA44ECE2C7503905EF4008DBE80019545AF9FD4F327757266A91B80F4A20768
        F4050CA82C7AFDA49E3FA993334BDD00A4173D40A32F604065D1EB27F5FC499D
        9C59EA0620BDE8011A7D01032A8B5E3FA9E74FEAE4CC523700E9450FD0E80B18
        5059F4FA493D7F522767A21BC005B4B6EAFDAF9E3F10297AFDA49EB1A99333D1
        0DE0025A5BF5FE57CF1F8814BD7E52CFD8D4C999E8067001ADAD7AFFABE70F44
        8A5E3FA9676CEAE44C7403B880D656BDFFD5F3072245AF9FD43336757226BA01
        5C406BABDEFFEAF90391A2D74FEA199B3A3913DD002EA0B555EF7FF5FC8148D1
        EB27F58C4D9D9C896E0017D0DAAAF7BF7AFE40A4E8F5937AC6A64ECE4437800B
        686DD5FB5F3D7F2052F4FA493D63532767A21BC005B4B6EAFDAF9E3F10297AFD
        A49EB1A99333D10DE0025A5BF5FE57CF1F8814BD7E52CFD8D4C999E8067001AD
        AD7AFFABE70F448A5E3FA9676CEAE44C7403B880D656BDFFD5F3072245AF9FD4
        3336757226BA015C406BABDEFFEAF90391A2D74FEA199B3A3913DD002EA0B555
        EF7FF5FC8148D1EB27F58C4D9D9C896E0017D0DAAAF7BF7AFE40A4E8F5937AC6
        A64ECE4437800B686DD5FB5F3D7F2052F4FA493D63532767A21BC005B4B6EAFD
        AF9E3F10297AFDA49EB1A99333D10DE0025A5BF5FE57CF1F8814BD7E52CFD8D4
        C999E8067001ADAD7AFFABE70F448A5E3FA9676CEAE44C7403B880D656BDFFD5
        F3072245AF9FD43336757226BA015C406BABDEFFEAF90391A2D74FEA199B3A39
        13DD002EA0B555EF7FF5FC8148D1EB27F58C4D9D9C896E0017D0DAAAF7BF7AFE
        40A4E8F5937AC6A64ECE4437800B686DD5FB5F3D7F2052F4FA493D63532767A2
        1BC005B4B6EAFDAF9E3F10297AFDA49EB1A99333D10DE0025A5BF5FE57CF1F88
        14BD7E52CFD8D4C999E8067001ADAD7AFFABE70F448A5E3FA9676CEAE44C7403
        B880D656BDFFD5F3072245AF9FD43336757226BA015C406BABDEFFEAF90391A2
        D74FEA199B3A3913DD002EA0B555EF7FF5FC8148D1EB27F58C4D9D9C896E0017
        D0DAAAF7BF7AFE40A4E8F5937AC6A64ECE4437800B686DD5FB5F3D7F2052F4FA
        493D63532767A21BC005B4B6EAFDAF9E3F10297AFDA49EB1A99333D10DE0025A
        5BF5FE57CF1F8814BD7E52CFD8D4C999E8067001ADAD7AFFABE70F448A5E3FA9
        676CEAE44C7403B880D656BDFFD5F3072245AF9FD43336757226BA015C406BAB
        DEFFEAF90391A2D74FEA199B3A3913DD002EA0B555EF7FF5FC8148D1EB27F58C
        4D9D9C896E0017D0DAAAF7BF7AFE40A4E8F5937AC6A64ECE4437800B686DD5FB
        5F3D7F2052F4FA493D63532767A21BC005B4B6EAFDAF9E3F10297AFDA49EB1A9
        9333D10DE0025A5BF5FE57CF1F8814BD7E52CFD8D4C999E8067001ADAD7AFFAB
        E70F448A5E3FA9676CEAE44C7403B880D656BDFFD5F3072245AF9FD433367572
        26BA015C406BABDEFFEAF90391A2D74FEA199B3A3913DD002EA0B555EF7FF5FC
        8148D1EB27F58C4D9D9C896E0017D0DAAAF7BF7AFE40A4E8F5937AC6A64ECE44
        37800B686DD5FB5F3D7F2052F4FA493D63532767A21B50FDFCBDAB5EFFEAF903
        91A2D74FEA199B3A3913DD80EAE7EF5DF5FA57CF1F8814BD7E52CFD8D4C999E8
        06543F7FEFAAD7BF7AFE40A4E8F5937AC6A64ECE4437A0FAF97B57BDFED5F307
        2245AF9FD43336757226BA01D5CFDFBBEAF5AF9E3F10297AFDA49EB1A99333D1
        0DA87EFEDE55AF7FF5FC8148D1EB27F58C4D9D9C896E40F5F3F7AE7AFDABE70F
        448A5E3FA9676CEAE44C7403AA9FBF77D5EB5F3D7F2052F4FA493D63532767A2
        1B50FDFCBDAB5EFFEAF90391A2D74FEA199B3A3913DD80EAE7EF5DF5FA57CF1F
        8814BD7E52CFD8D4C999E806543F7FEFAAD7BF7AFE40A4E8F5937AC6A64ECE44
        37A0FAF97B57BDFED5F3072245AF9FD43336757226BA01D5CFDFBBEAF5AF9E3F
        10297AFDA49EB1A99333D10DA87EFEDE55AF7FF5FC8148D1EB27F58C4D9D9C89
        6E40F5F3F7AE7AFDABE70F448A5E3FA9676CEAE44C7403AA9FBF77D5EB5F3D7F
        2052F4FA493D63532767A21B50FDFCBDAB5EFFEAF90391A2D74FEA199B3A3913
        DD80EAE7EF5DF5FA57CF1F8814BD7E52CFD8D4C999E806543F7FEFAAD7BF7AFE
        40A4E8F5937AC6A64ECE4437A0FAF97B57BDFED5F3072245AF9FD43336757226
        BA01D5CFDFBBEAF5AF9E3F10297AFDA49EB1A99333D10DA87EFEDE55AF7FF5FC
        8148D1EB27F58C4D9D9C896E40F5F3F7AE7AFDABE70F448A5E3FA9676CEAE44C
        7403AA9FBF77D5EB5F3D7F2052F4FA493D63532767A21B50FDFCBDAB5EFFEAF9
        0391A2D74FEA199B3A3913DD80EAE7EF5DF5FA57CF1F8814BD7E52CFD8D4C999
        E806543F7FEFAAD7BF7AFECBE02289774B3C213A914EF3F7885E3FA9676CEAE4
        4C7403AA9FBF77D5EB5F3DFFEA2E963858E20C89E748BC383AA1CEF2F78A5E3F
        A9676CEAE44C7403AA9FBF77D5EB5F3DFFCA2E91B8771B86E73A958668F5FCC7
        10BD7E52CFD8D4C999E806543F7FEFAAD7BF7AFE55E9F0D4BF9C3F7F15FFB70A
        43B47AFE63895E3FA9676CEAE44C7403AA9FBF77D5EB5F3DFF8A2E933844E253
        9BF86F320FD1EAF98F297AFDA49EB1A99333D10DA87EFEDE55AF7FF5FCABD1E1
        793F894FAEE0BFCD3844ABE73FB6E8F5937AC6A64ECE4437A0FAF97B57BDFED5
        F3AF4487E7A112A7ADE2DF641AA2D5F39F42F4FA493D63532767A21B50FDFCBD
        AB5EFFEAF957F1F336FCE57CDA02FF36C310AD9EFF54A2D74FEA199B3A3913DD
        80EAE7EF5DF5FA57CFBF021D9EFA97F3A98E63440ED1EAF94F297AFDA49EB1A9
        9333D10DA87EFEDE55AF7FF5FCB3D3E1797F894F8C70AC88215A3DFFA945AF9F
        D43336757226BA01D5CFDFBBEAF5AF9E7F6697B7E16573CF5FCE1B7A81C4F3C9
        3F8DE8F5937AC6A64ECE4437A0FAF97B57BDFED5F3CFEAD7120F9638718263BF
        BE4D7FDBDDEAF9CF257AFDA49EB1A99333D10DA87EFEDE55AF7FF5FCB37AACC4
        9B2638EE1D243E22B113F9A710BD7E52CFD8D4C999E806543F7FEFAAD7BF7AFE
        19BD56E229131CF7B6121F95D885FCD3885E3FA9676CEAE44C7403AA9FBF77D5
        EB5F3DFF6CCE92B893C42F463EAE1EF3C3123B927F2AD1EB27F58C4D9D9C896E
        40F5F3F7AE7AFDABE79FC99512FB499C39F271F5983A3C7720FF74A2D74FEA19
        9B3A3913DD80EAE7EF5DF5FA57CF3F93295E3ABFB3C4C96D9EE1593DFF08D1EB
        27F58C4D9D9C896E40F5F3F7AE7AFDABE79F85DE26770F891F8E78CCFD253E24
        B13DF9A715BD7E52CFD8D4C999E806543F7FEFAAD7BF7AFE591C23F18C118F77
        9736FCE53CD7F0AC9E7F94E8F5937AC6A64ECE4437A0FAF97B57BDFED5F3CFE0
        37127B4A9C3FD2F1EE2EF14189EDC83FBDE8F5937AC6A64ECE4437A0FAF97B57
        BDFED5F3CF40BFDA76F048C7BA6B1B5E369F737856CF3F52F4FA493D63532767
        A21B50FDFCBDAB5EFFEAF967F02889B78C709CA8E1593DFF48D1EB27F58C4D9D
        9C896E0017D0DAAAF7BF7AFED1F4E5F3EB485CE43CCE2D254E6FF30FCFEAF947
        8B5E3FA9676CEAE44C74037ABF805657BDFFD5F38FF6E536DCE1CE43EF8CF7C5
        367C0A9FFC6B895E3FA9676CEAE44C74037ABF805657BDFFD5F38FF6CF12CF74
        1EE3A512CF22FF92A2D74FEA199B3A3913DD80DE2FA0D555EF7FF5FCA31D2671
        82E3DFDF40E27F25AE45FE2545AF9FD43336757226BA01BD5F40ABABDEFFEAF9
        47D30FBE7DC6F1EF9F2AF14AF22F2B7AFDA49EB1A99333D10DE8FD025A5DF5FE
        57CF3FDA4D24BEEDF8F727491C42FE6545AF9FD43336757226BA01BD5F40ABAB
        DEFFEAF947D3E7DA5FECF8F76B257623FFB2A2D74FEA199B3A3913DD80DE2FA0
        D555EF7FF5FCA36D25F16BC7BFBF5CE29AE45F56F4FA493D63532767A21BD0FB
        05B4BAEAFDAF9E7F34EF00FD798BFD005DF5FCA345AF9FD43336757226BA01BD
        5F40ABABDEFFEAF947F3BE847E9EC4EEE45F56F4FA493D63532767A21BD0FB05
        B4BAEAFDAF9E7FB4EA1FA2AB9E7FB4E8F5937AC6A64ECE4437A0F70B6875D5FB
        5F3DFF68DEAFD13D45E2D5E45F56F4FA493D63532767A21BD0FB05B4BAEAFDAF
        9E7F34EF8D74769538B7D5BD115074FED1A2D74FEA199B3A3913DD80DE2FA0D5
        55EF7FF5FCA3BD42E228E7318E967836F99714BD7E52CFD8D4C999E806F47E01
        ADAE7AFFABE71F6D8C87E9ECDC8687E9EC49FEE544AF9FD43336757226BA01BD
        5F40ABABDEFFEAF947BBB20D8FD3FDA9F338FB487CAECDFF38DDEAF9478B5E3F
        A9676CEAE44C74037ABF805657BDFF15D6E894C6A8FFA325FE7584E3E807F23E
        D4E61FA215F35F96DFDBE8F933A9D4C999E806440F00F854EF7F85353AA531EA
        FF51898347CA2762135031FF65F9BD8D9E3F934A9D9C896E40F400804FF5FE57
        58A3531AA3FEBF69C3FBDFE78F94D38112274A6C33530D2AE6BF2CBFB7D1F367
        52A99333D10D881E00F0A9DEFF0A6B744A63D5FF58892347CC6BEE5702AAE5BF
        2CBFB7D1F36752A99333D10D881E00F0A9DEFF0A6B744A63D55FEF89BF87C485
        23E6A67F497FB0CDF31DFB6AF92FCBEF6DF4FC9954EAE44C7403A207007CAAF7
        BFC21A9DD298F57FBDC49346CEEF5089F74B6C39432D2AE5BF2CBFB7D1F36752
        A99333D10D881E00F0A9DEFF0A6B744A63D65FBF52B79FC49923E7F8788937CC
        508B4AF92FCBEF6DF4FC9954EAE44C7403A207007CAAF7BFC21A9DD2D8F55F23
        714789CB473EEE71124F9CA11E55F25F96DFDBE8F933A9D4C999E806440F00F8
        54EFFF0E123F0BCE21D214F59FE2A5747D1FFD0C895B4E5E911AF957982D9BB3
        BDC425CB5C87D4C9193600F0A8DEFFBD25CE09CE21D254F5D797BDDF38F231F5
        2FF3D325AE3E69456AE45F61B66C8EDE3D71CD32D7217572860D003CAAF7FF19
        12C704E71069AAFAEB77EB1F22F1BE918F7B7C1B9EE037B5ECF957982D9BF34C
        89972D731D522767D800C0A37AFFBF26B16F1B2EF83D9AB2FEFA3EBA7E0AFE13
        231EF3FA12E7B579BE1A9839FF0AB36553B690385B62AF65AE43EAE40C1B0078
        2C43FF9F2AF1EAE824824C5D7FFD7EFDFDDBB843F4956DE8D91CB2E65F61B66C
        CAD3DB38AFBCA5AE43EAE40C1B00782C43FF7F297188C4C7A313093047FDC71E
        A2BB499CDBE6F92C40D6FC2BCC968D39A80D7749DC6A8463A5AE43EAE40C1B00
        782C4BFF7513F02C89D7B6BEDE0E98ABFE630FD15324EE3953EE19F3AF305B36
        A42FFB1F21F1D236CEF04F5F87D4C9193600F058B6FE7F5DE204898F49AC95B8
        343AA189CD59FF3187E863DBF89FD2AF947F85D9A2F45908BB4BDCBB0DDFACF0
        BEE75FAA0EA993336C00E041FFB11ABAA1D2BBED7DCD799C6BB7E1BEFD73BD0D
        B02CF92F9BD433367572860D003CE83F56EB7F256E277191F3385F95B815F977
        2DF58C4D9D9C6103000FFA8F451C2DF11CE731F453E44F27FFAEA59EB1A99333
        6C00E041FFB1087D3F7D4F891F388EF18436DCB697FCFB957AC6A64ECEB00180
        07FDC7A29E2CF13AC7BFBFBBC469E4DFB5D433367572860D003CE83F1675A2C4
        031CFFFE2612DF22FFAEA59EB1A993336C00E041FFB128BD19CE4D1DFF7E2789
        9F927FD752CFD8D4C9193600F0A0FF5894DE6B7F1BC7BFDF52E257E4DFB5D433
        367572860D003CE83F16A51FA4DBD6F1EFA30768F5FC9741EA199B3A39C30600
        1EF41F8BD2EFD3FFBEE3DFEF2CF113F2EF5AEA199B3A39C306001EF41F8BF27E
        884E1FAAB396FCBB967AC6A64ECEB0018007FDC7A29ED47CDF838FFE1A5DF5FC
        9741EA199B3A39C306001EF41F8BB8AC0D37D2B9D0718CC81BE954CF7F59A49E
        B1A993336C00E041FFB188174B3CD7798CC85BE956CF7F59A49EB1A993336C00
        E041FFB15AFF2371FBE67F98CE59127F44FE5D4B3D63532767D800C083FE6335
        C67A9CEE75DA701FFEAA8F038ECA7FD9A49EB1A993336C00E041FFB152FABD79
        FDD4FCC74738D6E3244E20FFEEA59EB1A993336C00E041FFB1123A3CEF2FF189
        918EA743F840F2EF5EEA199B3A39C306001EF41F9BA32F9B1F2AF1C9918EB77B
        1B6EC233D7CBE7D5F35F66A9676CEAE40C1B0078D07F6C8A7E5D4EFF723E75C4
        63BE4AE208F2474B3E63532767D800C083FE63637E267188C467463CE6AE6D78
        0ADFB5C81F2DF98C4D9D9C6103000FFA8FABA27F39DFAF8DF7B2F93A6F94782C
        F9C3A49EB1A993336C00E041FFB1A14B24EE23F1B9918FABDFBDFF7C9BFEBDF3
        EAF9F724F58C4D9D9C6103000FFA8FF55DDC86E1F9F9918FBB8DC499127B933F
        D6937AC6A64ECEB0018007FDC73A3A3C0F9638638263BF41E2F1E48F0DA49EB1
        A993336C00E041FFA1F4B6B83A3CCF9CE0D8733C34A77AFEBD4A3D63532767D8
        00C083FE431D2FF1C4098EAB77DE7BAFC496E48FAB907AC6A64ECEB0018007FD
        C73A2F9478C188C73B40E2A436DF57E6AAE7DFA3D433367572860D003CE83FD6
        F71289BF1AE138FB4B9C2CB11DF9631352CFD8D4C9193600F0A0FFD8907788DE
        45E2C32D6E7856CFBF27A9676CEAE40C1B0078D07F5C954587A80E4FFDCB797B
        F2C70AA49EB1A993336C00E041FFB131AB1DA2776EC35FCE598667F5FC7B907A
        C6A64ECEB0018007FDC7A6AC7488661D9ED5F35F76A9676CEAE40C1B0078D07F
        6CCEE686E87E6D189E3B4427BAA4F92FB3D433367572860D003CE83F56626343
        F4B6121F93D8393AC125CF7F59A59EB1A993336C00E041FFB1521B0ED1DB489C
        D2EA0CCFEAF92FA3D433367572860D003CE83F5663DD10D5E1A97F39EF129D50
        67F92F9BD433367572860D003CE83F564B6FBBFB67123B4527D269FECB24F58C
        4D9D9C6103000FFA0F204AEA199B3A39C306001EF41F4094D433367572860D00
        3CE83F8028A9676CEAE40C1B0078D07F005152CFD8D4C9193600F0A0FF00A2A4
        9EB1A993336C00E041FF0144493D63532767D800C083FE0388927AC6A64ECEB0
        018007FD071025F58C4D9D9C6103000FFA0F204AEA199B3A39C306001EF41F40
        94D433367572860D003CE87FACCB25BE22F105892F4A7C5BE227EB85DAD942EF
        5BFF7B12B7B3D0FBD96FE73CFF9512DF94F892E5A1E7FFA9C445166A270BCDE1
        C6765E8D9B495C9DF3BB5C2AF1E536F45EE33B6DE8FB4F2DD42E16D76E43FF6F
        DF86FEDF5AE25ACEF3474B3D63532767D800C083FECFEFBB12EFB2D08BFEAF17
        3CCE1612FB4A3C54E2CFDB309C56E2C712FF6EE73FBD0D436811BAF9B84B1BEE
        ABFFA0B6F207EBF47E7EDD64BC53E21D125F95F8CD82E7DFB20D9B818758DC70
        C1E3444A3D63532767D800C083FECF432FF26F977883C4A7DBF097E798F42F51
        1D4687493CA20D9B83F5E9F9DE277182C4C7257E35F2F9B7923848E2F16D1886
        1BFE65DCFBF97593F7B636F4FFB36D9AFEDF4DE2096DD80C6EE13BDC6C52CFD8
        D4C9193600F0A0FFD3D20BFD7B25FEB60D2F35CF618F363CF2F6716D180C1F92
        785E1B5EE29EC3DE12CF9178781B7EBF7A3FBFF6FF6F24FE6BA6F3AFDFFF2D67
        3AE7A252CFD8D4C9193600F0A0FFD33945E28836DF857F43376F437FBF1174FE
        5BD8FFDBF3F9757DFC67D0F9FF50E23512F70C3AFF4AA49EB1A993336C00E041
        FFC7F77389BF93F8A736FE4BBDC06AE8FAD6B7055E2AB17D74321BC92FADD4C9
        193600F0A0FFE3D2F777FF8FC4DAE84480F5E8DB026F95B87374221B483D6353
        2767D800C083FE8F47DFEB7D641BBEDA0764730D897F9178587422EB493D6353
        2767D800C083FE8FE35889A31A2FF923375DEFCFB7C820F58C4D9D9C6103000F
        FAEFA79FF83E3A3A096015F45B02FF189D444B3E63532767D800C083FEFBBC4E
        E2C9D149000B3846E2E9C139A49EB1A993336C00E041FF17F7418907B6C5EFE4
        0644D27B44BC5BE2C18139A49EB1A993336C00E041FF17A3F76FDFBFF1813FD4
        B64D1BBEB9B26FD0F953CFD8D4C9193600F0A0FFABF7CB363C8C654D7422C008
        F66AC3C390AE1970EED433367572860D003CE8FFEAFDB5C43F4427018C486F55
        FCA280F3A69EB1A993336C00E041FF5747EF277FC736FEC3648048FACC007D32
        E2ED673E6FEA199B3A39004B630789FB491C28712B89DDDBF00C7A7DBB419F11
        7F81C49912274B7CA68DBF01B99A9DF7DE127790B8BEC475EDFFF6433BFF1724
        3E2A71561B7FE3D7FBF9F56982FA9992FBDAF97795F83D89AD252E6AC39D25F5
        D1C19F903849E267239F1F57810D008029E9035BF43E020F6DC307B256420782
        DE78E815123F759E5F9F697FB8C433246EB4C27FF35D897F96384EE252CEEFB2
        8B9DFB696DD8F0AD843E6B421F2DFD1289FF769E1F9BC00600C014AED586F75C
        8F6C8B3FB2F5628917B66123B0C85FA44F69C3438BAEBDE0F97FD486C71CBF6E
        C17FDFF3F975B63CB30D8F29DE61C1F3EBAB40AFB063FC62C1636013D8000018
        DB1F48BC4F629F918E77A2C463247EB2C2FF7E678913241E34D2F9F56739ACAD
        FCD588DECFAF7FF5BF59E2D091CEFFF9367C97FFFB231D0F860D008031DD5AE2
        23ED77EF2F8FE55B6D781BE1F39BF9EFF66BC3CBC7BB71FEA53ABF7E4E443F43
        72F6C8C7ED1A1B000063D1BFFCF5A62B630FFF757EDD8647BEBEBA0D372A5AF7
        6022BDE3DB6D258E9078445BFC2D07CE9FFBFCBA09D04FF15F30D1F1BBC30600
        C018F43D7FFD14FF582FFB6F8EBE1CFD5DFB9FF5D3E42BFD8019E7AF7D7E7D05
        E21E1257CCFCF32E25360000C6F05289674527812EE8071BB33CEEB734360000
        BCF4AB7E5F6FD3BDF40BAC4FBF9AA86F37F15680131B00005EFA89F3C7452781
        AEBCB60D5F7384031B00001EFA1D6FFD7AD64A6FF2038CE132891B34EE18E8C2
        060080C7C324DE169D04BAA45F4B7C67741295B10100E0717C1B6E1203CCEDF5
        124F8A4EA2323600003CF4AB7F733F610D50FA95C0FDA293A88C0D00000F7D92
        DC75A29340972E6CC3530DB1203600003CF4862C5B4727812EE9EFDE35A393A8
        6C8E0DC0D8CF9506301EFDF4FEE58E7FCF060051BC1B00FDDDBF2CFA87D88C49
        67341B00A06F7A1BD7EF3AFE3D6F01208AF72D801B4B9C1FFD436C061B000093
        F92389358E7FCF870011C5FB21C05B497C35FA87D80C36000026730F894F3AFE
        BD7E15EB09D13F04BA749CC4E18E7F7FA0C4C7A37F88CD60030060328F92788B
        E3DFEBCD58DE1EFD43A04B0F9178B7E3DFEBEFFE9BA37F88CD6003006032C74A
        1CE9F8F7DBB5E1A12CDB46FF20E88A7E786FD7363C186851AF923822FA07D90C
        3600002633C6CD54DE20F1F8E81F045DD13B503ED1798C3324EE10FD836C061B
        000093F985C48E12BF741C431FCDAA8F03DE2AFA874117F477F51612E73A8EA1
        5F5DBD44E21AD13FCC66B0010030A9FD253EEB3CC6D112CF8EFE41D085174B3C
        D7790CFD9DFF74F40FB2026C00004C4ADF0B7D9AF3187A43965325EE14FDC360
        A97D4EE28036DC04C8E335124F8EFE6156800D008049E9CD7C6E24F12BE771F4
        43597A5F801B47FF40584ADF6BC37BF69E1B57A9ADEC58156E60C50600C0E40E
        91387984E3E88D854E6AC31D0681B17C5BE27ECD77D3AA750E953831FA075A21
        36000026F77E89078F74ACEB4ABC47E26ED13F149682BEECAFBF9B178C74BC0F
        483C20FA875A2136000026A7EBF48E125F18E978FAE9EAFF2BF1ACC63D02B018
        FDB4FFCB245ED8FCEFF9AF73DB36FC8E5779122E1B0000B3D097EE0F1DF998FA
        B980E7B5E1AE6B6C04B0127A939F7F937849F37DD5EFAAE8DB5CF789FE015781
        0D0080D9E8CBF6537C3D4AEF18A8EFE1EA27B8F795D84362A7C6A3847BA77FE5
        5F24719EC457DAF04D920F35DF1DFE36466F78757AF40FBC4AE5370000002019
        3600000074880D0000001D620300004087D8000000D0213600000074880D0000
        001D620300004087D8000000D0213600000074880D0000001D620300004087D8
        000000D0213600000074880D0000001D620300004087D80000CBED3A121736D6
        3AB01ABF95B89EC48FA2139912170560F9AD91D8273A09A090B3256E159DC4D4
        D80000CBEF55124744270114728CC433A293981A1B0060F93D50E2FDD1490085
        3C40E2C4E824A6C60600587ED794B84062C7E84480022E92D855E28AE844A6C6
        0600E8C39B241E1D9D0450C0091287452731073600401F0E96F87074124001F7
        9238253A8939B00100FAA06BFD1C899B47270224F64D89BD24AE8C4E640E6C00
        807E3C45E2D5D14900893D51E2F8E824E6C20600E8C7B612E74BEC129D0890D0
        0F257693B83C3A91B9B00100FAF26C89A3A3930012D2EFFD1F139DC49CD80000
        7DD9BA0D9F05B86974224022E749DCA275F0D5BFF5B10100FAF35089B7472701
        24F2E712EF8A4E626E6C00803E9D24714874124002BA160E8D4E22021B00A04F
        3794F89AC4CED1890081F4AE7FB794F84E742211D80000FD7A94C49BA3930002
        3D42E26DD14944610300F4EDB5128747270104D0A7643E2D3A89486C0080BE6D
        D586DB9EDE2D3A116046A74B1C20F1CBE84422B10100A04F3EFBB4C4EF472702
        CCE0BF25F697B8303A91686C0000A81BB76113B05B7422C084BEDD8657BBD646
        2792011B0000EBDC4CE2B436BC22002C9BEF49DC5DE27FA213C9820D0080F5ED
        2E7172E3A981582EDF90B8AFC4B7A213C9840D00800DE9C3823ED086F74981EA
        CE68C38D7E7E149D48366C00005C956BB4E1A1414F8F4E0470788BC4935A474F
        F85B0D36000036E541126F94D8293A1160152E69C3E07F47742299B10100B039
        7ADB607D4CEA9F462702ACC007258E90383F3A91ECD8000058A9074BBCA20D5F
        1904B2D10FF81DD986CFAF6005D80000588DAD251E23F1FC36BC320044FBA1C4
        CBDAF02AD52FA293A9840D0080456C23F17889A734BE328818E748BCA60D9F51
        E1437E0B600300C043AF21F790384CE27E123B462784A576711BDEE33F5EE293
        D1C954C70600C058F4ED017DC0CA1F4BDC55622F89AB472785D2AE94F87A1B6E
        53ADEFED9FD63A7F80CF98D80000988ABE1A7047895B4AEC21B1671BEE34B8AD
        C4F6165B46278950BF92B8B40D5FDBFB791BEED17FAEC4791267B7E1263E9744
        27B9ACD8000000D0213600000074880D0000001D620300004087D8000000D021
        3600000074880D0000001D620300004087D8000000D0213600000074880D0000
        001D620300004087D8000000D0213600000074880D0000001D620300004087D8
        000000D0213600000074880D0000001D620300004087D8000000D02136000000
        74880D0000001D620300004087FE1F5DB048C4B00DBD480000000049454E44AE
        426082}
      Proportional = True
      OnClick = iButton2Click
    end
    object iButton3: TImage
      Left = 17
      Top = 170
      Width = 54
      Height = 55
      Center = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000002000000
        02000806000000F478D4FA000000097048597300000B1300000B1301009A9C18
        000000B46558496649492A000800000006001201030001000000010000001A01
        050001000000560000001B010500010000005E00000028010300010000000200
        0000130203000100000001000000698704000100000066000000000000004800
        0000010000004800000001000000060000900700040000003032313001910700
        040000000102030000A00700040000003031303001A0030001000000FFFF0000
        02A00400010000000002000003A00400010000000002000000000000915FF1DA
        000025634944415478DAEDDD0DF066575918F0EB0286DD6C902FDB42A5A18071
        DC10C83810028D4D42B06D3030A39D42896DF3814DCC47852852A9D6D6192D20
        D8A0433249CA241BAC64A06A47A44446621AC0491399424A136B04DA50B41F7C
        28C6244484F639F3FE37ACEBBEBBFFFF7B3FCEBDCFF9FD669EC9CCCEFE6FCED9
        679FF33EFB9E7BCFFD860E0068CE37D41E0000303D0D000034480300000DD200
        004083340000D0200D000034480300000DD200004083340000D0200D00003448
        0300000DD200004083340000D0200D000034480300000DD200004083340000D0
        200D000034480300000DD200004083340000D0200D000034480300000DD20000
        4083340000D0200D000034480300000DD200004083340000D0200D0000344803
        00000DD200004083340000D0200D000034480300000DD200004083340000D020
        0D000034480300000DD200004083340000D0200D000034480300000DD2000040
        83340000D0200D000034480300000DD200004083340000D0200D000034480300
        000DD200004083340000D0200D000034480300000DD200004083340000D0200D
        000034480300000DD200004083340000D0200D000034480300000DD200004083
        340000D0200D000034480300000DD200004083340000D0200D00003448030000
        0DD200409B1E1DF1F4886F8D7856C49EAD5F7F7CC4E7233EB715F744DC577BB0
        C0F03400D08652EBA7447C57C48B235E18F1D86DFE6C69083E1AF1EB11EF8EF8
        DFB52703F4A70180DC9E1AF18F222E88386180EB7D35E28311BF18F1EF23FEA4
        F60481CD680020A76F8EF8E188D774DBFF97FE4EFD61C49B23DE16F170ED0903
        3BA301805C1E13F163113FD27D7D5F7F6C9F8CF8A711BF527BF2C0F66900208F
        9322DE197172A5FFFF6F469C1BF17F6AFF410047A701801C2E8CB83AE298CAE3
        F86CC4F774AB9B068119D300C0B2951AFE175B3117E57E804B226EA83D10603D
        0D002CD7AE881B23FE41ED81ACF1868837D51E0470781A0058AEAB222EAD3D88
        23F87FDDEAF1C31B6B0F04F88B3400B04CE52BFF7F597B10DBF095889777AB43
        848019D100C0F294D3FCCA07EAAEDA03D9A67258D077467CBCF64080AFD300C0
        B2FC956EF541FA976B0F6487CA989F1FF167B50702AC680060597E39E27B6B0F
        6243E5B0A09FA93D0860450300CB7166B73A6C67A91EEA5687157DAAF640000D
        002C45D9EFFFCF11CFAD3D909EDE1FF1DDB5070168006029CA9DF4BF3AC2751F
        88B83DE29E6EF59ADF6F8CF84BDDEA38E1B267FF9881FF7FE5D1C0F22DC0DDA3
        FD4901DBA2018065285FFD9F39E0F57E3BE2ADDDAAA958F726BF2747BC32E275
        114F1FF0FF7D4DB73A2910A8480300F3F79C88BB06BAD61F45FC60C4BFED56FF
        1ADF8EF23AE1D20494B3071E3DC018CAB70EDFB23516A0120D00CCDF4F75AB57
        FCF6556EBE7B69C4BD1BFEFC8B23FE5DC4130718CB15116F1BE44F07D8880600
        E6EFBF74AB7DF33ECA5BFAFE46C4677A5EE785111F8CD8D3F33AB744BC64903F
        1D60231A0098B7A747FCF79ED72887EFFCCD6E75B3DF10BEAF5B6D21F4F160C4
        E3BBD551C140051A0098B7BF1F7153CF6BFC7CC46B061ED77B235ED6F31AE5DB
        84FF34F0B8806DD200C0BCBD31E2477BFC7CB9C3FFE9DDEA11BF2195F308FA9E
        EDFFFA88B70C3C2E609B3400B0F2A86EF5C29AF2BC7DB9EBFE29114FED565F53
        2F59B969EF15235DFBC311A7D59E604F5F8AF8FD6ED5207DAC5B7DB3F15B115F
        AD3D30189B0680D63DA15BFD0BFBD5114FAA3D98119C17F1CE91AEFD235DCEB3
        FD3F1F717DC49B22FEB0F660602C1A005A559E672F8FA2BDA15B3501599DD8AD
        4EF91BC3A9DD703716CE51F9F02F5B305776DE6248421A005A549E637F4FC459
        B5073281C745DC3FD2B5CBAB89FF57ED094EE037BAD58988BE0D20150D00AD79
        56B77A21CDB7D61EC844C6ACF16322BE5C7B8213F9BD88B33B6F3224110D002D
        295FF5DFD1B5F3E15F8C5DE3DB3D4E3883DFED56DB1E8E3026050D00AD2877F9
        FF5AB7FA575C4B3400C32ADB01E53865F704B0781A005A519E397F73ED4154A0
        01185E7931D2CFD61E04F4A501A005E5ABFF4F76C3BCC466693400C32B370396
        7B49BE587B20D08706801694D3E65E577B10956800C651BE4DEA73422354A701
        20BBB2F75F4E797B72ED8154A20118C717BAD56390EE0560B1340064777AC47F
        AC3D888A3400E3296F58FC70ED41C0A6340064576ED6FAA1DA83A84803309EF2
        77ABD5AD2512D00090DDAD1167D41E44451A80F1944702FF56ED41C0A6340064
        F7DF22BEADF6202AD2008CE7EE8867D71E046C4A034076E575AF8FAB3D888A34
        00E3292702667E9114C96900D88E3D112FE856373D957FF13C33E269DDEA2CF8
        E36A0F6E64BBBAB63FE4322BEBDFD76A0F6264E545500F47FCCF6E751646F9D6
        E2B66E7524F643B507475D1A00D6298FCF9D13F17D5BFFDD5D7B4095A891DC5A
        6DEECA87FF7B23DE15F11F22BE5A7B404CCFE2C6A11E1BF1EA6E75E7FC336A0F
        6606D4486EAD360007FB74B77AA2E11D117F5A7B304CC7E2C6C15E12F1F311DF
        5E7B2033A24672D3007C5DD922786DB7FA46800658DC28CA3EFE5B232EAA3D90
        195223B96900FEA25F88B834E24F6A0F847159DC28FFDA2F7B81CFAA3D909952
        23B969000EEFDE88976DFD97A42C6E6D7B51B7FAF07F52ED81CC981AC94D03B0
        DEE7235E1E717BED81300E8B5BBB4E89F86097FF31BEBED4486E1A80237BB05B
        9D76F85BB507C2F02C6E6D3A31E243114FAC3D90055023B969008EAEBCF9F0B4
        6E75AA268958DCDAB337E2CECE9DFEDBA54672D3006C4FB917E0F9117F5C7B20
        0CC7E2D69E5F8C38B7F62016448DE4A601D8BE77469C577B100CC7E2D696BF13
        7173ED412C8C1AC94D03B033DF1DF1FEDA83601816B7769473FB7F27E2AFD71E
        C8C2A891DC34003B530E0BDA17F195DA03A13F8B5B3B2E89B8BAF62016488DE4
        A601D8B97260D8BFA93D08FAB3B8B5E1D1119F8AF86BB507B2406A24370DC0CE
        FD8F6E75709817082D9CC5AD0DE544AFF7D61EC442791D705E2DBC0E782C2FED
        DC4FB4781A8036FC72C4F70E74ADFF1B715DB77A61C87FEDE67F5EB80F6FC634
        F735B41CF4F5EC6EF54AEF7F1CF1CD035DF73D11AFAC3D39FA99FB5F5EFA2B37
        FF7D3162CF00D7BA2AE20D11F7D79ED40E947FE1F97BCE18CADFAD47D51EC40E
        3C2EE2CD113F30C0B54AE35F8E10F7FAE005B330E6F7E2885B06B8CE15116FAB
        3D990D94A34C77D71E042995BF5BC7D61EC4067E28E26707B8CE1911B7D59E0C
        9BD300E4F713113FD9F31AE5E981CB6A4F64439F8DF8ABB507414AE5EFD6D36A
        0F6243D7445CDCF31A3F1EF1D3B527C2E63400F9BD3BE2153D7EFE7311CFE8E6
        BFD7BFCEAF447C4FED4190D22F45FCBDDA83D850D90EF874D7EF4DA037754E15
        5D340D407E77453CA7C7CFFFAB881FAB3D891ECA9BCC3E507B10A4F4926E98ED
        B55ADE18F1A33D7EFE6311DF517B126C4E0390DF1F443CA5C7CFBFA85BF6FBC0
        1FD3AD5E60F2D8DA0321952F77AB3BECFFACF6407A286FF8FB708F9FFFFD886F
        A93D0936A701C8AFEF4D70DFD42DFF0D606F89785DED41904AF93BF5FADA83E8
        E909DDEA09A14D2DF52648B66800F2EBFB1C7C868370CA7E67F926C462C510CA
        63B04FED967B5FCC01431C84E43364C1242FBFBE1FDE59FE8E7C7FE7FC728671
        61C40DB5073110EB43C3242F3F05FE75EF887875ED41B068E5F1B94B6A0F6240
        D68786495E7E0AFCEBCA0D81BF11717AED81B048B776ABA74A967CE3DFA1AC0F
        0D93BCFC14F89F57DE8C586EE07A6DED81B028FBBBD56B70BF527B2003B33E34
        4CF2F253E08757B602CAD1C67B6B0F84592B37FCBDA6CBB3E77F28EB43C3242F
        3F05BE5E798EFB9F47FC93CE3901FC79E539FF9F8BF8A96EF977FB1F89F5A161
        92979F023FBAB22D7046B73A1BFDD4882776ABB3135A983BAB47E1CA07FE1722
        EE88B8B65BBDE426DBD7FD87637D6898E4E5A7C08175AC0F0D93BCFC1438B08E
        F5A16192979F0207D6B13E344CF2F253E0C03AD68786495E7E0A1C58C7FAD030
        C9CB4F8103EB581F1A2679F92970601DEB43C3242F3F050EAC637D6898E4E5D7
        5A819FD4ADCE6C3F2BE2F8AD5FBB2FE29688EB223E517B803023ADAD0F1C44F2
        F26BA5C08F89B8B25B9DE6B76BCDEF2927BE9553DEAE8878B8F68061065A591F
        380CC9CBAF85022F1FFE37479CB9CDDF5F5EEB7A76A7098016D607D690BCFC5A
        28F0EB232ED8E1CF5C1D7159ED8143652DAC0FAC2179F9652FF0F3BAD5BBDA77
        AA6C079CDCB92780B6655F1F3802C9CB2F7381EF8BB833E2D80D7FFEAA88CB6B
        4F022ACABC3E701492975FD6022F1FFAE5D5AD27F6B8C63D3D7F1E962EEBFAC0
        36485E7E590BFC8688F37B5EE3A1883DB5270215655D1FD806C9CB2F6381BF2A
        E25D035CE78188BDB5270315655C1FD826C9CB2F5B81F7DDF73F982D005A976D
        7D6007242FBF4C053EC4BEFFC1DC0448EB32AD0FEC90E4E597A9C087D8F73FC0
        6380906B7D6087242FBF2C05BEE9F3FEEB5C137149ED49416559D607362079F9
        6528F013223E1A71DC40D7BB3BE29488076B4F0C2ACBB03EB021C9CB6FE905BE
        3BE2F688E70E74BD72E77FF9F0BFA7F2BC600E96BE3ED083E4E5B7F4021F72DF
        BFDBBAD68D95E70473B1F4F5811E242FBF2517F850CFFB1F509A890B2BCE07E6
        66C9EB033D495E7E4B2D70FBFE30BEA5AE0F0C40F2F25B6281DBF787692C717D
        60209297DF120BDCBE3F4C6389EB030391BCFC9656E0F6FD613A4B5B1F1890E4
        E5B7A402B7EF0FD35AD2FAC0C0242FBFA514B87D7F98DE52D607462079F92DA5
        C0EDFBC3F496B23E3002C9CB6FEA023F29E2A288B3228EDFFAB5FB226E89B8AE
        3BFCCB77863EE7BF5CEB8201AF075969001A2679F94D55E0C7445C197171C4AE
        35BFA7BC81EFDA882B221EDEFAB57D117776AB57FD0EA17CE55FBEFA7F60A0EB
        41661A8086495E7E531478F9F0BF39E2CC6D5EF3B68873B6C67647C48903CDB5
        7CE8BFA05BDDFC071C9D06A0619297DF14057E55C4A53BBCEE47223E1371EE80
        732D5FFBEF1FF07A909D06A0619297DFD8055EF6FC3FDEADFFDA7F2AFB3BFBFE
        B0531A8086495E7E6317F8DB232EAB3C47FBFEB0190D40C3242FBFB10BBCECB7
        EFAB383FFBFEB0390D40C3242FBFB10BBC9CB2B7BBE2FCECFBC3E634000D93BC
        FCC62EF0F22FF03D95E6765337EC4D84C5A1E718D49A1B399406F968E760D4A4
        016898E4E597750B60E87DFFED9C63007D1CEE1C8CDA34000D93BCFC32DE0438
        F4BEFF4ECF31803E6E8D38BB9B4713A0016898E4E597F131C0A1F7FD3739C700
        FAB8BAABFFF44CA1016898E4E537D7838036555EF073FE80D79BCB3906B4A56C
        079CDCD5BF274003D030C9CB6FAAA3803F1071FAC87319E379FF399C63409B4A
        E37C79E53168001A2679F94D55E0E5653EEF8B3863A4797C39E2D488BB06BE6E
        ED730C68576968877A0FC6A634000D93BCFCA62CF0BDDDEA66BAD34698C758CF
        FBD73EC780763DD4D57FCC5403D030C9CB6FEA021FE39B80319EF73FA0E63906
        B4ADFCDDDB5B790C1A8086495E7E350A7CC826E0DE88E745DC3FEC1FCB236C01
        508B2D00AA92BCFC6A15F8104DC058FBFE07731320B5B80990AA242FBF9A05DE
        B70998E29C7F8F015283C700A94EF2F2AB5DE09B360163EEFB1FCA41404CCD41
        40542779F9CDA1C077DA048CBDEF7F28470133254701330B9297DF5C0A7CBB4D
        C014FBFE87E365408CCDCB809815C9CB6F4E05BE9D26608A7DFF23F13A6086E4
        75C0CC96E4E537B7023F521330E5BE3F30BFF58109495E7E732CF0C3350153EF
        FB03F35C1F9888E4E537D7023FB809A8B5EF0FAD9BEBFAC004242FBF3917F881
        26A0BCE277FF547F20C023E6BC3E3032C9CB6FEE055EEEBE9FCB1DD1D09AB9AF
        0F8C48F2F253E0C03AD68786495E7E0A1C58C7FAD030C9CB4F8103EB581F1A26
        79F92970601DEB43C3242F3F050EAC637D6898E4E5A7C08175AC0F0D93BCFC14
        38B08EF5A16192979F0207D6B13E344CF2F253E0C03AD68786495E7E0A1C58C7
        FAD030C9CB4F8103EB581F1A2679F9B556E027455C147156C4F15BBF765FC42D
        11D7457CA2F60061465A5B1F3888E4E5D74A8197970A5D197171C4AE35BFE76B
        11D7465CD179011114ADAC0F1C86E4E5D74281970FFF9B23CEDCE6EFBF35E2EC
        4E13002DAC0FAC2179F9B550E0D7475CB0C39FB93AE2B2DA0387CA5A581F5843
        F2F2CB5EE0E745ECDFE0E7CA76C0C99D7B02685BF6F5812390BCFC3217F8BE88
        3B238EDDF0E7AF8AB8BCF624A0A2CCEB03472179F9652DF0F2A17F47C4893DAE
        714FCF9F87A5CBBA3EB00D92975FD602BF21E2FC9ED77828624FED89404559D7
        07B641F2F2CB58E0AF8A78D700D77920626FEDC9404519D707B649F2F2CB56E0
        7DF7FD0F660B80D6655B1FD801C9CB2F53810FB1EF7F303701D2BA4CEB033B24
        79F9652AF021F6FD0FF01820E45A1FD821C9CB2F4B816FFABCFF3AD7445C527B
        52505996F5810D485E7E190AFC84888F461C37D0F5EE8E3825E2C1DA1383CA32
        AC0F6C48F2F25B7A81EF8EB83DE2B9035DAFDCF95F3EFCEFA93C2F9883A5AF0F
        F42079F92DBDC087DCF7EFB6AE7563E539C15C2C7D7DA007C9CB6FC9053ED4F3
        FE079466E2C28AF381B959F2FA404F9297DF520BDCBE3F8C6FA9EB030390BCFC
        9658E0F6FD611A4B5C1F1888E4E5B7C402B7EF0FD358E2FAC040242FBFA515B8
        7D7F98CED2D607062479F92DA9C0EDFBC3B496B43E3030C9CB6F29056EDF1FA6
        B794F58111485E7E4B2970FBFE30BDA5AC0F8C40F2F29BBAC04F8AB828E2AC88
        E3B77EEDBE885B22AEEB0EFFF29DA1CFF92FD7BA60C0EB41561A8086495E7E53
        15F8311157465C1CB16BCDEF296FE0BB36E28A8887B77E6D5FC49DDDEA55BF43
        285FF997AFFE1F18E87A909906A0619297DF14055E3EFC6F8E38739BD7BC2DE2
        9CADB1DD1171E240732D1FFA2FE85637FF0147A7016898E4E53745815F1571E9
        0EAFFB9188CF449C3BE05CCBD7FEFB07BC1E64A7016898E4E5377681973DFF8F
        77EBBFF69FCAFECEBE3FEC9406A0619297DFD805FEF688CB2ACFD1BE3F6C4603
        D030C9CB6FEC022FFBEDFB2ACECFBE3F6C4E03D030C9CB6FEC022FA7ECEDAE38
        3FFBFEB0390D40C3242FBFB10BBCFC0B7C4FA5B9DDD40D7B136171E83906B5E6
        460EA5413EDA39183569001A2679F965DD02187ADF7F3BE718401F873B07A336
        0D40C3242FBF8C37010EBDEFBFD3730CA08F5B23CEEEE6D10468001A2679F965
        7C0C70E87DFF4DCE31803EAEEEEA3F3D5368001A2679F9CDF520A04D9517FC9C
        3FE0F5E6728E016D29DB012777F5EF09D000344CF2F29BEA28E00F449C3EF25C
        C678DE7F0EE718D0A6D2385F5E790C1A8086495E7E5315787999CFFB22CE1869
        1E5F8E3835E2AE81AF5BFB1C03DA551ADAA1DE83B1290D40C3242FBF290B7C6F
        B7BA99EEB411E631D6F3FEB5CF31A05D0F75F51F33D500344CF2F29BBAC0C7F8
        26608CE7FD0FA8798E016D2B7FF7F6561E8306A06192975F8D021FB209B837E2
        7911F70FFBC7F2085B00D4620B80AA242FBF5A053E441330D6BEFFC1DC04482D
        6E02A42AC9CBAF6681F76D02A638E7DF6380D4E03140AA93BCFC6A17F8A64DC0
        98FBFE8772101053731010D5495E7E7328F09D360163EFFB1FCA51C04CC951C0
        CC82E4E5379702DF6E1330C5BEFFE178191063F332206645F2F29B53816FA709
        9862DFFF48BC0E9821791D30B32579F9CDADC08FD4044CB9EF0FCC6F7D604292
        97DF1C0BFC704DC0D4FBFEC03CD707262279F9CDB5C00F6E026AEDFB43EBE6BA
        3E3001C9CB6FCE057EA00928AFF8DD3FD51F08F08839AF0F8C4CF2F29B7B8197
        BBEFE7724734B466EEEB032392BCFC1438B08EF5A16192979F0207D6B13E344C
        F2F253E0C03AD68786495E7E0A1C58C7FAD030C9CB4F8103EB581F1A2679F929
        70601DEB43C3242F3F050EAC637D6898E4E5A7C08175AC0F0D93BCFC1438B08E
        F5A16192979F0207D6B13E344CF2F253E0C03AD68786495E7EAD15F849111745
        9C1571FCD6AFDD17714BC475119FA83D409891D6D6070E2279F9B552E0E5A542
        57465C1CB16BCDEFF95AC4B51157745E4004452BEB03872179F9B550E0E5C3FF
        E68833B7F9FB6F8D38BBD304400BEB036B485E7E2D14F8F51117ECF067AE8EB8
        ACF6C0A1B216D607D690BCFCB217F87911FB37F8B9B21D7072E79E00DA967D7D
        E008242FBFCC05BE2FE2CE886337FCF9AB222EAF3D09A828F3FAC051485E7E59
        0BBC7CE8DF1171628F6BDCD3F3E761E9B2AE0F6C83E4E597B5C06F8838BFE735
        1E8AD8537B225051D6F5816D90BCFC3216F8AB22DE35C0751E88D85B7B325051
        C6F5816D92BCFCB21578DF7DFF83D902A075D9D6077640F2F2CB54E043ECFB1F
        CC4D80B42ED3FAC00E495E7E990A7C887DFF033C0608B9D6077648F2F2CB52E0
        9B3EEFBFCE351197D49E145496657D600392975F86023F21E2A311C70D74BDBB
        234E8978B0F6C4A0B20CEB031B92BCFC965EE0BB236E8F78EE40D72B77FE970F
        FF7B2ACF0BE660E9EB033D485E7E4B2FF021F7FDBBAD6BDD58794E30174B5F1F
        E841F2F25B72810FF5BCFF01A599B8B0E27C606E96BC3ED093E4E5B7D402B7EF
        0FE35BEAFAC000242FBF2516B87D7F98C612D707062279F92DB1C0EDFBC33496
        B83E3010C9CB6F69056EDF1FA6B3B4F58101495E7E4B2A70FBFE30AD25AD0F0C
        4CF2F25B4A81DBF787E92D657D60049297DF520ADCBE3F4C6F29EB032390BCFC
        A62EF093222E8A382BE2F8AD5FBB2FE29688EBBAC3BF7C67E873FECBB52E18F0
        7A909506A0619297DF54057E4CC495111747EC5AF37BCA1BF8AE8DB822E2E1AD
        5FDB177167B77AD5EF10CA57FEE5ABFF0706BA1E64A6016898E4E5374581970F
        FF9B23CEDCE6356F8B38676B6C77449C38D05CCB87FE0BBAD5CD7FC0D169001A
        2679F94D51E057455CBAC3EB7E24E23311E70E38D7F2B5FFFE01AF07D969001A
        2679F98D5DE065CFFFE3DDFAAFFDA7B2BFB3EF0F3BA5016898E4E5377681BF3D
        E2B2CA73B4EF0F9BD100344CF2F21BBBC0CB7EFBBE8AF3B3EF0F9BD300344CF2
        F21BBBC0CB297BBB2BCECFBE3F6C4E03D030C9CB6FEC022FFF02DF53696E3775
        C3DE44581C7A8E41ADB9914369908F760E464D1A8086495E7E59B70086DEF7DF
        CE3906D0C7E1CEC1A84D03D030C9CB2FE34D8043EFFBEFF41C03E8E3D688B3BB
        7934011A8086495E7E191F031C7ADF7F93730CA08FABBBFA4FCF141A8086495E
        7E733D086853E5053FE70F78BDB99C63405BCA76C0C95DFD7B0234000D93BCFC
        A63A0AF80311A78F3C97319EF79FC33906B4A934CE97571E8306A0619297DF54
        055E5EE6F3BE8833469AC797234E8DB86BE0EBD63EC78076958676A8F7606C4A
        03D030C9CB6FCA02DFDBAD6EA63B6D84798CF5BC7FED730C68D7435DFDC74C35
        000D93BCFCA62EF031BE0918E379FF036A9E6340DBCADFBDBD95C7A0016898E4
        E557A3C0876C02EE8D785EC4FDC3FEB13CC21600B5D802A02AC9CBAF56810FD1
        048CB5EF7F303701528B9B00A94AF2F2AB59E07D9B8029CEF9F7182035780C90
        EA242FBFDA05BE691330E6BEFFA11C04C4D41C0444759297DF1C0A7CA74DC0D8
        FBFE8772143053721430B32079F9CDA5C0B7DB044CB1EF7F385E06C4D8BC0C88
        5991BCFCE654E0DB6902A6D8F73F12AF0366485E07CC6C495E7E732BF0233501
        53EEFB03F35B1F9890E4E537C7023F5C1330F5BE3F30CFF58189485E7E732DF0
        839B805AFBFED0BAB9AE0F4C40F2F29B73811F6802CA2B7EF74FF507023C62CE
        EB032393BCFCE65EE0E5EEFBB9DC110DAD99FBFAC088242F3F050EAC637D6898
        E4E5A7C08175AC0F0D93BCFC1438B08EF5A16192979F0207D6B13E344CF2F253
        E0C03AD68786495E7E0A1C58C7FAD030C9CB4F8103EB581F1A2679F92970601D
        EB43C3242F3F050EAC637D6898E4E5A7C08175AC0F0D93BCFC1438B08EF5A161
        92975F6B057E52C4451167451CBFF56BF745DC12715DC4276A0F1066A4B5F581
        83485E7EAD147879A9D095111747EC5AF37BBE16716DC4159D171041D1CAFAC0
        61485E7E2D1478F9F0BF39E2CC6DFEFE5B23CEEE3401D0C2FAC01A92975F0B05
        7E7DC4053BFC99AB232EAB3D70A8AC85F58135242FBFEC057E5EC4FE0D7EAE6C
        079CDCB92780B6655F1F3802C9CB2F7381EF8BB833E2D80D7FFEAA88CB6B4F02
        2ACABC3E701492975FD6022F1FFA77449CD8E31AF7F4FC7958BAACEB03DB2079
        F9652DF01B22CEEF798D8722F6D49E085494757D601B242FBF8C05FEAA88770D
        709D0722F6D69E0C5494717D609B242FBF6C05DE77DFFF60B600685DB6F5811D
        90BCFC3215F810FBFE07731320ADCBB43EB04392975FA6021F62DFFF008F0142
        AEF5811D92BCFCB214F8A6CFFBAF734DC425B527059565591FD880E4E597A1C0
        4F88F868C471035DEFEE8853221EAC3D31A82CC3FAC086242FBFA517F8EE88DB
        239E3BD0F5CA9DFFE5C3FF9ECAF3823958FAFA400F9297DFD20B7CC87DFF6EEB
        5A37569E13CCC5D2D7077A90BCFC965CE0433DEF7F4069262EAC381F989B25AF
        0FF42479F92DB5C0EDFBC3F896BA3E3000C9CB6F89056EDF1FA6B1C4F5818148
        5E7E4B2C70FBFE308D25AE0F0C44F2F25B5A81DBF787E92C6D7D60409297DF92
        0ADCBE3F4C6B49EB030393BCFC9652E0F6FD617A4B591F1881E4E5B79402B7EF
        0FD35BCAFAC008242FBFA90BFCA4888B22CE8A387EEBD7EE8BB825E2BAEEF02F
        DF19FA9CFF72AD0B06BC1E64A5016898E4E53755811F137165C4C511BBD6FC9E
        F206BE6B23AE887878EBD7F645DCD9AD5EF53B84F2957FF9EAFF8181AE079969
        001A2679F94D51E0E5C3FFE68833B779CDDB22CED91ADB1D11270E34D7F2A1FF
        826E75F31F70741A8086495E7E5314F8551197EEF0BA1F89F84CC4B903CEB57C
        EDBF7FC0EB41761A8086495E7E631778D9F3FF78B7FE6BFFA9ECEFECFBC34E69
        001A2679F98D5DE06F8FB8ACF21CEDFBC36634000D93BCFCC62EF0B2DFBEAFE2
        FCECFBC3E634000D93BCFCC62EF072CADEEE8AF3B3EF0F9BD300344CF2F21BBB
        C0CBBFC0F7549ADB4DDDB0371116879E63506B6EE4501AE4A39D83519306A061
        92975FD62D80A1F7FDB7738E01F471B873306AD300344CF2F2CB7813E0D0FBFE
        3B3DC700FAB835E2EC6E1E4D8006A06192975FC6C70087DEF7DFE41C03E8E3EA
        AEFED3338506A0619297DF5C0F02DA5479C1CFF9035E6F2EE718D096B21D7072
        57FF9E000D40C3242FBFA98E02FE40C4E923CF658CE7FDE7708E016D2A8DF3E5
        95C7A0016898E4E53755819797F9BC2FE28C91E6F1E5885323EE1AF8BAB5CF31
        A05DA5A11DEA3D189BD200344CF2F29BB2C0F776AB9BE94E1B611E633DEF5FFB
        1C03DAF55057FF31530D40C3242FBFA90B7C8C6F02C678DEFF809AE718D0B6F2
        776F6FE53168001A2679F9D528F0219B807B239E1771FFB07F2C8FB005402DB6
        00A84AF2F2AB55E043340163EDFB1FCC4D80D4E22640AA92BCFC6A1678DF2660
        8A73FE3D06480D1E03A43AC9CBAF76816FDA048CB9EF7F28070131350701519D
        E4E5378702DF691330F6BEFFA11C05CC941C05CC2C485E7E7329F0ED360153EC
        FB1F8E970131362F036256242FBF3915F8769A8029F6FD8FC4EB801992D70133
        5B9297DFDC0AFC484DC094FBFEC0FCD607262479F9CDB1C00FD7044CBDEF0FCC
        737D60229297DF5C0BFCE026A0D6BE3FB46EAEEB031390BCFCE65CE0079A80F2
        8ADFFD53FD81008F98F3FAC0C8242FBFB91778B9FB7E2E7744436BE6BE3E3022
        C9CB4F8103EB581F1A2679F92970601DEB43C3242F3F050EAC637D6898E4E5A7
        C08175AC0F0D93BCFC1438B08EF5A16192979F0207D6B13E344CF2F253E0C03A
        D68786495E7E0A1C58C7FAD030C9CB4F8103EB581F1A2679F92970601DEB43C3
        242F3F050EAC637D6898E4E5A7C08175AC0F0D93BCFC1438B08EF5A16192979F
        0207D6B13E344CF2F253E0C03AD68786495E7E0A1C58C7FAD030C9CB4F8103EB
        581F1A2679F92970601DEB43C3242FBFBE05BE6B806B00F353D6FFAF0D700D16
        4AF2F27B3062778F9F7F7CC4976A4F0218DC1322BED8E3E7CBDA726CED49B039
        0D407E7F10F1941E3FFFA288DB6B4F0218DC77467CA8C7CF7F36E269B527C1E6
        3400F9DD15F19C1E3FFFC6887F567B12C0E0DE1CF1FA1E3FFFB188EFA83D0936
        A701C8EFDD11AFE8F1F39F8B7866C4FDB527020CE69B223E15F1A41ED7B829E2
        DCDA1361731A80FC7E22E2277B5EE3DA881FA83D116030EF887875CF6BFC78C4
        4FD79E089BD300E47766C46F0E709D1F8EF8D7B52703F4F6BA88B70C709DD3BB
        7EF71050990620BF6322BED00D73B76EF926A0EC19FE71ED49013B56BEF67F6B
        C4F70F70ADB22558B60FBE527B526C4E03D0865F8AF8BB035DEBF3DDEAEBC3F7
        45DC1DF147B52707ACF5C4886F8F7859B7FAE0EFB3E77FB0F744BCB2F6E4E847
        03D08673227EADF6208034CE8EF8F5DA83A01F0D401B1E1DF17B114FAF3D1060
        F13E1D7142C4576B0F847E3400EDB8A85BEDE103F4519E1EB8BEF620E84F03D0
        8E6F8CF89D8867D41E08B058E59BC4133B37FFA5A00168CBDFEEECDB019BFBAE
        880FD61E04C3D000B4E79D11FFB0F62080C5D91F7141ED41301C0D407BCA7900
        7746ECAB3D1060317E37E2F99D23C153D100B4A93C17FCE16EB8678281BCCAD9
        1FA775AB2680443400ED3AA55BEDE51D577B20C06C957FF19F15F1DBB507C2F0
        34006D7B61C47B239E5C7B20C0EC943781961304EFA83D10C6A101A01CE8519A
        806FAB3D106036CA23C32F8FF864ED81301E0D00C5EE883745FC60ED8100D5FD
        42C425110FD41E08E3D20070B0B2D7F773DDEAA00FA02DE5909FD746BCBFF640
        98860680439513032FEC56EF0C7F66EDC100A32B5FF3BF25E286CE097F4DD100
        B0CEA3225E1A716EB7DA0BDC537B40C060CAD7FBBF1A7153C4CD9D17FB344903
        C0761CD3AD1E1B3C3DE2D9DDEA9B81A76DFDFAE36B0F0E58EB4B117F1A715FC4
        A7223E11F1A16E7518D8C3B507475D1A000068900600001AA401008006690000
        A0411A000068900600001AA401008006690000A0411A000068900600001AA401
        008006690000A0411A000068900600001AA401008006690000A0411A00006890
        0600001AA401008006690000A0411A000068900600001AA401008006690000A0
        411A000068900600001AA401008006690000A0411A000068900600001AA40100
        8006690000A0411A000068900600001AA401008006690000A0411A0000689006
        00001AA401008006690000A0411A000068900600001AA401008006690000A041
        1A000068900600001AA401008006690000A0411A000068900600001AA4010080
        06690000A0411A000068900600001AA401008006690000A0411A000068900600
        001AA401008006690000A0411A000068900600001AA401008006690000A0411A
        000068900600001AA401008006690000A0411A000068900600001AA401008006
        690000A041FF1FA1EEC55B2FFA86940000000049454E44AE426082}
      Proportional = True
      OnClick = iButton3Click
    end
    object iButton4: TImage
      Left = 17
      Top = 253
      Width = 54
      Height = 55
      Center = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000002000000
        02000806000000F478D4FA000000097048597300000B1300000B1301009A9C18
        000000B46558496649492A000800000006001201030001000000010000001A01
        050001000000560000001B010500010000005E00000028010300010000000200
        0000130203000100000001000000698704000100000066000000000000004800
        0000010000004800000001000000060000900700040000003032313001910700
        040000000102030000A00700040000003031303001A0030001000000FFFF0000
        02A00400010000000002000003A00400010000000002000000000000915FF1DA
        0000543B4944415478DAEDDD059865C5B107F07A0477F7C0E2EEEE1E5C8206CD
        129CE081242410361008EE6E014270824370777709B2B8BB2CCEABFFD6DD30BB
        CCECCC9D39D5754EF7FFF77DF5EDBEBCE476F7DD997BEB9CD35DF57F42444444
        C5F9BFE809101111517A4C008888880AC404808888A8404C008888880AC40480
        8888A8404C008888880AC404808888A8404C008888880AC404808888A8404C00
        8888880AC404808888A8404C008888880AC404808888A8404C008888880AC404
        808888A8404C008888880AC404808888A8404C008888880AC404808888A8404C
        008888880AC404808888A8404C008888880AC404808888A8404C008888880AC4
        04808888A8404C008888880AC404808888A8404C008888880AC404808888A840
        4C008888880AC404808888A8404C008888880AC404808888A8404C008888880A
        C404808888A8404C008888880AC404808888A8404C008888880AC404808888A8
        404C008888880AC404808888A8404C008888880AC404808888A8404C00888888
        0AC404808888A8404C008888880AC404808888A8404C008888880AC404808888
        A8404C008888880AC404808888A8404C00889A652C8D093526D298603831B2C6
        18ADFFCD981A23B5FE3E5EEBCF8EFFFFCF35BE6EFDFDC3D69F5FB7FEF38EFFFF
        F73B89F73AFC89F834FA0D22A29E610240541F23684CAED14F639A61FE444C21
        F6C55D6748145ED7784963602B5EEAF0E71B1A3F444F928898001045C055FC6C
        1A73B66246B12FF8A9A5FE5FF07DF595C6CB6209C1731A8FB5E2498DCFA22747
        5412260044BE70453F9FC6AC625FFAF8FBCC6257FB34B437351E144B069E6AFD
        FD198DEFA227469423260044D5C173F9453416D75854631E8DD1A327D570D87F
        F088C69DADB84B6CAF0111F5111300A2DE9B56ECCB1E57F58B69CC2BFC9D4AE1
        45B164007708EED07848B8AF80A86DFCB022EAB9993456D65856EC4A7FC2E809
        D160B823803B0337695C23B6B78088BAC10480A86BB87D8F5BF9CB6BACA1314B
        F484A84770DAE07A8D1B34AED5F8247A424475C404806868B8AD8F2FFCD53556
        D018257A42D427DF6ADCAB71855842C0C705442D4C00A874F81D5850637D8D75
        C48EE251BE066A5CA47181C6FDD193218AC404804A852379EB696CA43143F464
        28C42B1A976A5C28B6A9907706A8284C00A82443BEF47F25B6A18F6888811A97
        8B250377444F8628052600943B14E2D95C6313B1023C44DD4111A27F69FC43AC
        381151969800508E50650F47F5B6D6584B7E6C8443D48EEFC58E169EAC7189D8
        8642A26C3001A09CA0590EAEF4B7136EE6A36AE14EC05962C9C08BD19321AA02
        13006ABA9F692C2376B5BF76EBFF26F2D2F1AEC065F2631B65A2C66102404D85
        BEF6DB6AECA83159F464A848B82B70B4C6491A1F464F86A85D4C00A869A6D1D8
        46ECCB7F9CE8C91089B5313E47E3708D67A32743D4534C00A829D06867178D0D
        35468C9E0C5127F078E06A8DBF8BF52620AA3526005467D8CDBFAAC64E62E579
        899A029D0AF17800C709BF8B9E0C51679800501DE18B7F038D7D84057BA8D99E
        D6F8AB5881A1EFA32743D4111300AA13FC3CAEA6B1AFC6DCD19321AAD0936289
        00FA10B0E430D5021300AA0BDCE23F5063BEE88910397A5C633F61224035C004
        80A2E18B7F7FB18E7C44A5408B62FCDC5F113D112A1713008AB284D86EE9C5A2
        27D2401F6BBCADF17E27F16EEBCFF7343E6FFDF7714CED9BD6DF879C57FFBAC3
        FF7F0C8D915B7F1FAFF527CA278FD9FA3BFE9C4063C2564CD0494C223C96D91B
        B76BEC29D68D902829260094DA941A078895ECE5CF5FE7BED47843ACE4ECB0F1
        82C647D113ECC2A862CD97A6ED24A6D318377A823576A5D8699797A22742E5E0
        0730A582AB4C5CE9ECA6315AF4646AE20BB1CE738F8A3D1B463C2676F59EA389
        34E6E8107389B568E6CF8319A47188C6C1F2E3DD1922374C00C81B7EC670B58F
        DBFD53444F26106ECBA338CC23625FF2085CCD977E461CBD1B707700C9009282
        793416117BAC50AAD734FE28565D901B05C90D1300F2B480C6911A8B464F2400
        EAC4DF21F66C177F3E2C3C07DE0E3C36585C6C8F08FE9C45CAFBBC7A40636761
        55417252DA2F14A5810D61876A6C2C65FC8CE18BFD218D9BC5BEF0F181FD6EF4
        A43233B1582289846059B13B0525FC6CE10EC03F35F6D078277A329497127E81
        28ADF5348E17DB2D9E33DCD2475BD81B34AED2783D7A4285C17E82A5C58E91AE
        A13169F4849C61E3E71F344E113E16A08A3001A0AAA04BDF891ABF889E88135C
        E5E336FE0DADB8557E3C5A47B1503A1A7704900CAC2EB6876084E84939C1CFDD
        561AFF8D9E08351F1300EA2B6CE242973E94EF1D3D7A3215C397FE6D1A17685C
        2CBC05DB147804B58EC6FA62F526724B067042606FB16643A56F22A53E600240
        7D815DDBA74A5E55FCF0A57FB758F316C41BD113A23EC1A3A855343615DB3B90
        53328013255B8A751E246A1B1300EA0D147CC1150836268D143D990AE099EA3D
        6257FAF8D2E7F3FC3CA10815F6A8E0CEC0C2D193A9081E43A16E00FA0B7C153D
        196A162600D4AE59C57A9CE7D0AD0F6571F1857FAC58111E2AC78C1ABFD1D85C
        EC8441D3A1DB204EDD3C1A3D116A0E2600D453F859C1E6A323A4D9CFFA718B1F
        BBF771B40A5FFE83A22744A1D003614D8DCD345616DBD3D25428213D40AC9A20
        6B4E50B79800504FE00AE9348DD5A227D2076F699C29768CEA85E8C9502DE111
        01AEA2B7D7982A7A327D70BD467FE1FE15EA061300EA0E8E55E1CB7FA2E889F4
        12DAAE1EA67189C6B7D193A1461851EC14C1EFC4AA593611BA45E211C7D5D113
        A1FA6202405DC146BF83347694E6FD9CE0F6273EF88E123BB34FD45B28438C2E
        7D6B4B331F0FE051D776C2E642D489A67DB0531A38DE77BE58FDF526C1F37CDC
        E63F5C582885AA3593C6AE627B059AD6BD101B043768FD49F43F4C0068581B8A
        3D271F237A226D40FBDC63C44A10E7DA4A97EA018FC2B0470077C69AD4B1F033
        8D2DC48EBA120DC6048086C073CFBF89D51B6F8A4FC5BEF4D16AF8E3E8C95051
        C6D4F8ADD8EFCB78D19369C3C91A3B08CB589330012083AB9AF3C42AA53501AE
        668E13DBA3F061F464A8686389DD11D853639CE8C9F4D0ED62C590DE8A9E08C5
        620240F38BD5B96FC2B1276C64C2898403C4763913D5051E07E0B100F6098C1D
        3D991E40B54B5445BC3B7A2214870940D970E582C23E23474FA41B5F8BDDEA3F
        50F8C54FF586B6C47F14DB795FF7DF2B940E4623AF13A327423198009469148D
        93347E1D3D911EB84C63778DE7A32742D48619C4EA4FAC1E3D911E385D2C61F9
        3A7A2294161380F260C3128AE22C153D916E3CA3B19BC635D11321EA03ECABC1
        5DB639A327D28DBBC44A22F3144D41980094655A8DAB34668E9EC8707CA0B1AF
        D8263F56EEA31CA005F1266235FAEBDC780877D9D03A9935340AC104A01C0B69
        5C2EF5FD00C2B1A47F68FC5978154279C2DD371C1BC446C1BAEE0F785F632D8D
        3BA22742FE980094615D8DB3A4BE15CCEE11EB34F844F444881240A5CD533516
        8C9E4817BE10BB637149F444C8171380FCED2C561A7784E88974021F34B8DD7F
        A8C677D193214A08BF8F5B8AFDEC8F153D994EFC20F6BB39207A22E4870940BE
        D0B804CD707E1B3D912EFC47635B8D97A3274214A89FD831BC15A327D2059405
        C77161EEC7C91013803CE1F9E239622D4DEB0695FB704EFAE4E88910D5088AF2
        60E36B1DDB6E63EF102A077E153D11AA161380FCE0393F2AFBAD1C3D914E2029
        C123096EF223FA297CF9E3AEDD86D113E9044E0F612FD197D113A1EA3001C80B
        3AF85DAAB17CF44486F189D8A388B3A32742D400F8A245A1AEF1A327328C5BC5
        0A1B7D1A3D11AA0613807C8CAB71B5C622D11319066A8D6347F18BD113216A10
        F4E6C0C99DBA15ECBA5F6325B17A1DD4704C00F2802B056CAA5B207A221D60D3
        D0FE1AFB0977F813F5064E0AA0C1D0C152AFBA010F8B6D5A7C377A22D4374C00
        9A0FCD47AED7983D7A221DBC2476D57F57F444883280C4FE5F62FD05EA02A5BA
        F1A8F1F5E88950EF310168B6A9356ED4982E7A221DA05D2F36FA7D1E3D11A28C
        8CA9718C46FFE8897480D2C148027894B7A1980034D724629B72668A9E480B8E
        08ED2056E18C887C6C2AB641B02E553D5FD05852E38DE88950FB980034138E0B
        DDA2316BF4445A5E15DBB97C5FF444880A308FD851DF69A227D2F2ACD866C5B7
        A32742ED6102D03CE388DDF69F2F7A222DB7686CA0F14EF444880A3281585D8D
        5F444FA4E5518D65C40A7D5143300168169CF3C76EFFC5A32722562B1CBB93D1
        BD8FBBFC89D243B9EFBD5B51875E1F68EAB582C667D113A19E6102D01C78E687
        73FE4B474F44AC10C8E662B7218928168AF3A066C0B8D113513769AC2AAC18D8
        084C009A0167802F132BC0110D47FCF00BFE74F44488E87F66132BD73B75F444
        5AF3585BE3EBE889D0F03101A8BF11352ED0F865F444C436F9AD21DCEC435447
        A8097285C6FCD11351178AF534E0E3C11A6302507FC74A3D5AFAA2C7C0C61A5F
        444F8488BA847D42281AB466F444C48E2B6E1B3D09EA1A13807ADB436CA35DB4
        A33576D5F83E7A2244D42D6C0E3C5C63A7E889887D6E1C193D09EA1C1380FAC2
        B9FAF32576772F6EDFE117F898E8378388DA868A9C878925045170D1B09EC6BF
        A3DF0CFA292600F5848E7E38EB1F59ED0BB7FA7F25F64C91889A692DB17A01D1
        9F25A811C0426135C304A07E50DD0BE769270E9C03CEF1E219E24DD16F0611F5
        D9121A576A8C1D3887F7C42E6C9E8F7E33E8474C00EA056D7DD1412FB2BE3F2A
        79AD22968410511E5039F45AB10A82517074783161B5C0DA6002501F38EB7F8D
        C6B2817340395F94167D34FACD20A2CAA156005A874F163887DBC43E63BE8A7E
        338809409D9CA1F1EBC0F15F136BEDF96CF41B41446E66D6B841638AC039A065
        F896D16F043101A80B9CF33F3670FC81625FFE2F44BF1144E40ED50291044C1F
        38876D344E8E7E234AC704201E36C6DC22F6082002AEF897D3783DFA8D20A264
        A6144B02A2F61BE111C092C29301A19800C49A44E34189BB1DF78AD82FE1CBD1
        6F04112587CF1D3C939F3668FC57C5CA16B395781026007150E31F19F85241E3
        E38A1F5FFE2F46BF114414662AB12420AA89D0CD629B02BF8D7E234AC404200E
        CA63EE1C34F6BB6289073BFA11D10C6249C0A441E31FA2F1FBE837A1444C0062
        A04BD63941637F24F6CCFFA1E83781886A634EB1ABF1F103C6FE41ACEAE805D1
        6F42699800A43787C6DD625DBB52FB446305E1C61B22FAA985C4EA048C1530F6
        67ADF19F8A7E134AC20420ADD1351ED09825606CD4E35E49E3F6E83781886A0B
        8F0651902CA277C0131A0B687C19FD26948209405AC76B6C17302E3A72ADA371
        69F41B4044B5B79AD867454417C1A33476897E034AC104209D9535AE9298F71C
        9B0D8F8E7E0388A831D006FCF08071B11F6075B1CF4A72C604200D74F67B4CEC
        DC7F6A4768EC16FD061051E3E0A261C780715117009B12DF8E7E0372C704C01F
        DEE32B34560D181B2D40D10FFCBBE83781881A67048D8BC53E4352C33E047C66
        FE10FD26E48C0980BF9DC49E6BA586CD864B6B7C1EFD061051636133208E072E
        1430F6F61A2744BF01396302E06B56B12FE2D43B6A076A2C2CBC8546447D8702
        41F748FA6A81380DB0A0C6E3D16F40AE9800F81945ECBCFD9C89C7C5597F7CF9
        B3CA1F11556536B1FA25A96B043C22F679F655F41B902326007E0ED0D833F198
        785EB69ED8733B22A22AADA97189A4FFDEF8ABC680E8C5E78809800F5CF5E3D6
        FF4889C7DD5F63AFE8C51351B60E92F475FBBFD6984FAC501055880940F5503C
        03CFCBE64F3CEE8D1A2B0A77FC13911F9C0CB85AECB326253C4E5D54F8F95629
        2600D5DB5DACBB554AAF8865C8EF452F9E88B2878641B8C3394DE27159D0AC62
        4C00AAD54F6CC7EA9809C7C44ED925C47E218988529847E34E497BC209479AD1
        4CEDA5E8C5E7820940B5AE13EBB697D2161AA7472F9C888AB395C6C989C74481
        A055A2179E0B2600D5D95CD27F119FA6B165F4C2A916B0E1F4E76277A1706B76
        2AB112D413694CA83181D811AEB15BFF7D1C531DBDF577748A1C72CC0AC7483F
        D578BF15EFB4E265B1FA12885735BE895E30D5C2991A9B251E73638D73A2179E
        032600D5C007ECD3AD3F537941EC36DCA7D18BA7E4A6D3984BEC76E81CADBFE3
        4B3F55F7366CC47A51E351B1475ED89DFD48EB3FA3B2E071E7431A33241C137B
        9D5064EDDDE8C5371D13806AFC53639384E3E1EA0B3B62F9DC3F7FB8B2C78912
        FC7B2FAEB188C43495EA09549EBC4BE30EB1A231F76B7C1B3D297287423DB76B
        8C98704CDEFDAC001380BEC30F3F3EF452BE977FD2F87BF4C2C90DBEE071CC0A
        7DD9B1A764DCE809F512366D211140532A149079257A42E4661F495BACE77BB1
        CFDEFBA317DE644C00FA06EF1FCEFC2F98704C64DACB08CFC3E606B750D717AB
        E43857F4649CE031C1851A17683C1F3D19AA14EA03DCA4B154C23171E185BB62
        EC18D84B4C00FA069B5FCE4C38DE471A738B6DC8A2E69B4CEC676803B1FD1C25
        C173E3F3C41E9FBD153D19AA04F6A120C91BBBAF2FD4865F699C1FBDF0A66202
        D07BD841FD8CD8CEEB5436D238377AE1D427B8525A56636BB13EEBA9CB45D70D
        EE64A1DD2C8E93E13101F70C34DBA61A67251CEF358D99C44EB2509B9800F4DE
        7E92B6EE3E8EBD6C1CBD68EAB571C4BEF477103BA2473F853B5BC76A9CA2F171
        F464A8D77045BE7EC2F1B0FF60DFE84537111380DEC1553FAEFE47EFEB0BF510
        CE63E3D8CB3BD10BA7B6F5D3D856631B69EE66BED43E13ABA971B8F0715713A5
        3E163D486366E126D3B63101E81D6C625A2FE1783862F8AFE845535BF03C746F
        B15BA2298F47E5048F03703B1977DB06464F86DA92BA301A3E1F531EC5CE0213
        80F661D7E96D92EEBD63E9CB669952630FB12BFE51A2279309D4BDC08641DCEA
        651DF866C0E7234AA32F9F683C9C04584CECD829F5101380F6DDAAB164A2B170
        8E7A4E6185B5264099DD3F8B752C1B357A329942E3AB23340E107B4C40F5D64F
        AC4AE41889C6C311E9549FCD596002D01E1467F94FC2F1D8FEB2FEF03B84DBFC
        07694C1A3D9942BC29567406D5E0580FA3DE7037ECE084E3E184CDCDD18B6E0A
        2600ED41D19F85128D759F58F9577EC0D5D7BC62C7D7E68B9E48A150050E272B
        1E899E087509FD29EE9574BF23280EB458F4A29B820940CFADAE7179A2B1F0CC
        135F2E4F442F9A3A851EE87F102BC95CFA39FE68D82878BCD8BFC5E7D193A14E
        A1C81592B554CDAA5696B4776A1B8B0940CFE07D4216BB40A2F1F09C73B7E845
        53A750EAF4548DE9A3274243794EAC39CCEDD113A14E2149DB2ED1580F8A7D56
        B34470379800F4CC3A1A17251AEB03B1BAF01F442F9A8682A37C7BB522D5950C
        B5071FF8C7883D77FE3A7A323494F1C592B409128DB7A6A4BB63DB584C00BA87
        D2AD0F8BEDC64F0159F289D18BA6A1A0C808CE19CF1B3D11EA11B4C9C699F067
        A3274243C1A6E623138DF5B858DF94EFA3175D674C00BAB7A15819DE149E12EB
        04C77AE8F5D15FE3384957F591AA81FD0048A6FF193D11FA1FDC45C386CDD912
        8D87626DA9EEDC36121380E1C3D5FF9362578029A068C68DD18BA6C1F061F537
        B1CD7ED45C38A5B1A3F091405D6083DED589C6C267F71CC2BD005D6202307CBF
        D4F877A2B1D0096DEDE805D3605388F5AD5F247A2254893BC59AD3BC113D111A
        EC2A4957DD14A7B7AE8C5E705D310118BE3B24CD99525C9DCCAEF1DFE805D3E0
        BD1EF8809A327A225429140FC297C183D113A1C1276870753E7282B16ED15826
        7AC175C504A06B28F8734FA2B178ECAF1E50E9118D9EC68E9E08B9C0BE00ECE9
        B9227A2234B8EDF36F138D8523810F442FB88E9800740DB780D74D300E3E94A6
        D3783B7AC185DB416C87328FF8E50D9535B127E084E889146E328DE725CDE65A
        3492DA307AC175C404A07368E58ADBF129BE0C0ED4D8337AC1851B20D6692E07
        689883D3242F88B5D045BCAEF1BEC67BAD3F71CAE42B8D2F5AFF1B7C08A37321
        AA1A4ED021B01702BF0BFD34A6D59855F26974F417B136C314E7708D5D138C83
        A46F466153B59F6002D0391413D921C138E868860FD677A3175C28FCFCA351C9
        EED113E925948C7E48ACFE392A553E2A96B87AF58FC0C90814A9C23E8985C57A
        55A0CC6B53CB21A381D31FA32751B009C5BE94C74A3016EEEEA548361A8509C0
        4F8DA7F18AC69809C6DA57F2B9F26C1A1CF144A2B77DF444DAF4B4C63562B5CE
        B1497550F07C70F760718D95C48E78A53A325B15D478C023011E158B813BA029
        8EDAE251EB54C20AAB436102F053E8E9FEB704E37C2476F5FF61F4820B849F7B
        7CF0A7AA4DDE57B8B2C7E6C4F3C56EEDD719EE10ACDF8A54D533FB0A1BD2768C
        9E44A1F0A8097701526CBCC5DD9E83A2175C274C008686632903C536A878434D
        F9FDA3175CA843A4FEB7FDF1ACFE2CB1C6434F454FA69750F10D0D7A3613AB05
        5F677C1C10E7AF627B32BC612F0CF6B47C13BDE0BA60023034ECFABF30C138D8
        8C85ABFF4FA3175CA00152EFC72E38A78ECD51178B6DD4CB01360EE2770BCF60
        EBDC4F616F4973F78F8636AED85D80F1128C85626B97442FB82E98000CED5A8D
        5F2418871F3431B0B1F398E8497401C5870E152B5C92B365C5BAF5AD143D912E
        B019570CEC87DA3BC1382843BC6AF462EB8209C08FB0410459A8F7D13F1CBD9A
        5AEC2E00A583D2A39789ED64AF1394A9FD93C66DD113490CA708B0DF66B5E889
        0C0327287095C856B2694D2CF6F87534E771D01D10775F5F8E5E701D3001F811
        CE04EF95609CE3255D052C32F369DCAA3146F4443A405734547FBC397A22C196
        137BE451A70D83389EBBA4581B704AE714B13D23DE0688ED3B281E130083ABFE
        97347EEE3C0EB24F6C8C7A267AC10541319BFB25CDC6CE9E78472CD13C5DFCCE
        EB370D7EFFF0C18FC76213464FA6058D83161036104A6926B10DAF23388FF39A
        5871ABE27FFF98001834094971CBEF52B10E8394060AD4DC24764EBD0EB0C114
        7507F8F8A773D8048673E15B493D3E9BD00B6429612BE194D0A721C56321D4AC
        F84FF462A3D5E197AC0EF0E5BF7A827196102BDE4269A0DEFBB6D193102B2C85
        2BDCEBA327D21068CA84DBC1DE77E47A02F52252540525B3B4A4792C8636EFEB
        442F361A1300BB358C0F68EFCD61B80DBD60F4620BD25FE31FD193106B44829D
        E51F454FA4617037E0248DF5A2272256C7E09FD1932808EEBC2CE43C06FA6160
        E3F79BD18B8DC404C09EC7A6680AB281583537F2378B58FBCF149DC6BA82D2A3
        B8DD7F56F49BD1709B8B55EA8BFEB7C446D267A3DF8C42E0B3F2BC04E3145F19
        9009806D3A99C5798CB7C4B24D56A0F287E7FE385AB740E01CD0E61447C91E8F
        7E333231975861A4E902E780A64B8B08F703A480BBB138A637B9F3384F68CC11
        BDD848A52700F8607924C13807889D79267FC8E87F1F383E1AF56C24BCE55F35
        3C12C055618A425D5D61EBEE74FE2E694A33CFAEF164F462A3949E00E08BD9FB
        171A5DC6D08BFAF9E8C516003BB6B1EBDFFB18515750410E4D65BE8D7E233285
        2B43D4D1D82A687C1CE35D46CA2BDA1401C57AF099E9FD1D557447D6D21300F4
        4E9FDE790CECFC8EBC6A29052A883D26FEFF9E9D41928796A68744BF098540E5
        44D40C88F8FC7A4EECCEE197D16F420190CC2FE33C06F67534AD8575654A4E00
        B0A9E78104E3A02D6A8A0643A53B58ACC67C6AF8F2DF496CA31AA5B38DD8DD80
        88BB3D7CA497C6861AE72418676EB196DBC529390148F18581822F534A3E5DDD
        EA0AC91C8E0EA5AEF38F4A62FD35CE8E7E030AB5A9D8514FEFFE1DC3C2665E6C
        322DF24B2321B46747D5BE899CC72936A12B3501C0BAD1F8A79FF338E8EE1671
        555A125C01DE279604A484E7C1FD85E7C3A3E18C3E9280D47702F0338786463F
        44BF01993B426317E731F05D804787C5FD5B969A00A0C8C43D09C69955E3E9E8
        C5666E0B8D53138F890F0A9CF167DBD87AF88DD8CF40EACFB35F0BEB3C78C3F3
        791CD5F6FEB79D5FE3C1E8C5A6566A0270985827364F776B2C1ABDD0CC8D25B6
        296BD2C4E362C3DFC1D18BA7A1E034CF0189C744A32034B0F92C7AF199C3DD16
        EFBA1ED8C01B797C3844A909C0408DA99DC7D855E3C8E885662EE2CC3FAE34A3
        8EA1D1F06153E07689C72CF6F97142BB8BFF091B3C06882C3415A2C40400ED78
        9F701E03CF8751F9EFF5E8C5660C8D6270F53F6AC23151E4670DE139FFBAC226
        D0AB24EDB1DB411A33087FD73DE1771D9501BDBFAFF0B8A1A872CF252600BF13
        DB9CE7E9768D25A3179A39348AD93AE178284A82DB90ACF0576FA81888C65B29
        AFE6D831D0DF5D62A5983D61B3E151D10B4DA9C404E0068DE59CC7C087C171D1
        0BCD181EDFE0EA7FE444E3E12A6F318D87A3174E3D32A7D81E9C540D84D01F00
        578F2F452F3C63F8723EC2798C6B35568A5E684AA525006368BCAF318AE318B8
        FD8F5B566F442F366338F6D53FE178DCEDDD3C3819705AC2F1B837C417DAB6A3
        2680E7714F54779C40E38BE8C5A6525A0280E7B797398F71B3C6B2D10BCD583F
        B112CEA98AFEA001CD86D18BA65E41FBEDF5128D85E24078ECF06AF4A233861E
        0C4B388FB18AD85E9F22949600A4D8258CD7E7F9703F3859B173A2B170C581BA
        EF1F442F9A7A655CB16E9FDE277E8660E12F5F78B47A8CF318474BBACF9770A5
        250038EA318DE3EBE3F63F6E55BD13BDD04C8D2D76853576A2F156D4B82E7AD1
        D42778A69BEA8AEE53B1C77F1F472F3A53F86CC5690BCFEF2DDC5D9C317AA1A9
        94940060938E77553E14AC58287AA119C399FF83128D7586C6E6D10BA64AA05C
        F32689C6C299F5C3A2179C3154EB9BD7790C94057E217AA129949400A030CFE1
        CE63FC556340F4423385862FB883335582B1700707659CDF8F5E34556242B1E4
        7FC204630D14DB0BF07DF4A233B5BF583B684FC59CE22A2901B8426335E73170
        4E35458F81126173CE5589C6DA52D2EE20277FDB6A9C90682C3C76B8367AC199
        5A5CACCE8AA74B34D68E5E680AA524005827AEEA3CAF00B0516C62B116B1543D
        FC52AE95601C6C1A436310FE3BE60577901E12AB11E0ED224977FAA034F877C4
        67F9F88E63E0F527895E680AA52400B3887594F274AEC646D10BCD1436FFBC22
        698EFEE108E7CDD10B2617CB6B5C9F601C1C09C466C0B7A3179CA914C73B51DE
        F9F9E8857A2B2501C02DDD539CC7405F72F686F781EE7B072618075F0E29EBC8
        537A374A9A3A1DDC0CE8274591276C003E237AA1DE4A4900BC2BC761C3CFE4C2
        8CDF0B4AF0CE9D601CEEE1C81F5A74DF99601CF42358307AB1994A711CB088CA
        8EA52400A81B3F83E3EB3F20FEFDAA4B857FB7E7128C73B5C6AAD18BA524B041
        CFFB4ECF0F62C7C95E8C5E6CA6B057672EC7D7C7A99159A317E9AD8404001BFF
        DE715EEBC162B7A9A97A7B6BEC9B609CA5356E8D5E2C25816660372418E78F92
        AE6E456970A47B57C7D74702874DDDEF452FD453090900768E5FE23CC69A1A97
        472F34538F8AFFCE6D1417993F7AA194144E04CCE33C067FAEFCAC2376DAC2D3
        EA1A57462FD4530909C021621B72BC2053C4919177A3179A21ECA47E25C138A8
        12F7AFE8C552529B8A7F87477C364CA1F166F4623384CFDCB79CC7C0C6E33DA3
        17EAA98404E00EB15EEE5EF07C7AA6E845666A6B8D939CC740B5BF29C55A8152
        394615DB48E6799E1C8AD84D1E04C7F4A6737C7D141C5A327A919E724F005034
        E2138DD11DC7385D638BE88566EADF1ABF741E03CF127F17BD500A81CE6F3B3A
        8F8133EB1B442F3453678A1DBFF6F2B958E3B16CCB3AE79E00E0CAFC19E731F0
        E57F7AF442333492D8061CEFCE7FB3897F9128AA27EC2D79D4798C0FC536937D
        1BBDD80CA5B843987563A0DC1300548BBAC0790C74197C367AA119C299FCBB9C
        C7C05122EF8D60546F4F8825819E500FE0FEE8856608FF6E4F388F819E00DE9B
        C8C3E49E00E0F8D8DE8EAF8F2B5464F73F442F3443D8B87988F318E82AF6F7E8
        8552A8BF8875F1F484E36A47462F3443F8FEC267B0E73E8E01E2FFF31126F704
        C0BB810C8E88AC1EBDC84CA578FE5F44BD6F1A2EDCC17BDA790C3607F2830EA1
        AB38BEFEC51AEB462FD24BEE09009EDD4CEBF8FAC80C07442F3253383A35A9E3
        EB1751E98B7AE4BF62CF7ABDA044B8E7CF72C9F6D3D8CBF1F5B33EE595730230
        96C6C7CE6B44667871F4423384A4CD7BE30D77FFD3104769ECE43C067EA65F8A
        5E6886D6D738DFF1F57102001B913F8F5EA8879C1380144D3F6614BB7AA06AA5
        A8F2B582A429074BF5B7B2582F084F78147959F4423394A2D57BB69B38734E00
        B6D138D1F1F5BF10BBCB90ED19D1400334F6717C7DF46B1F57ECDF90680C8D8F
        3446741C039B0DF78B5E688650EBE5538DD11CC7C8F6A877CE09C0B11ABF757C
        7DB6FBF483C72A6B3BBE3E5AFE2E12BD48AA15FC3E7BD6EDBF50EC7635550F3D
        17E6757C7D9CE0F06C3C1426E704E03AB1DBBC5E8AE8171DC47B53D661E2DB1F
        829A071FF23B3BBE3E0A92CD12BDC84CFD43A3BFE3EB67DB2A3CE704C0FB4B04
        1F1647472F3243A8003848ECD69E179466F52E1045CDB2A1C6398EAF8FC74EB8
        4DFD5DF44233B49B5852EF25DB1343B9260023883DDF1DC5718C65346E895E68
        86529C0060F5461A568AAA72FD345E8E5E688670A7F73AC7D7C70509F6896457
        F02DD70400DDDD5E751E031500D902B87ACB89EFEE7CFC3263F326AFC4A8236C
        00FC4C7C2F1A96D6B8357AA1199A4CE30DE73126970CDB3AE79A002CA1719BE3
        EB63D7A977939A5261C7EDA98EAFFF90C67CD18BA45A426F88B91C5FFF3762CF
        ABA97A48DEC6707C7D6C1ABE277A9155CB3501D854E32CC7D74707B1B9A31799
        29EFFE0DDC8D4D5DF13E7DC2CAA17E9E14DFE7F41B699C1BBDC8AAE59A007837
        F840410FCF1E0325437BCFAD1D5FFF608D3F442F926A091BC976737CFD1334B6
        8F5E64A6D097C573A7FE9F350E885E64D5724D0050B46173C7D7CFF65C680D78
        5F85E103F884E845522DED28BE277B78F7C98F77DD9753C4F7C22444AE09C04D
        62BBF4BDB0BDA79F5B3496727C7D9664A5AE20F1F4ECED81CFA5E5A2179929F4
        F538D4F1F5B131D9B3AE4C885C130034DDE8E7F8FAFC12F183A358B339BEFEE2
        E2DF23829A6949F1DDA5FF98F86E322C9977FF101C4DF6AC2B1322C704006BFA
        526364C731B001F0D1E885660AC737A7747C7D54637B267A91544BD844F6A4E3
        EBBFA23175F422338552C00F3ABE3EBE533CFB0D84C831011847ACB187273492
        F9387AA1997A476322C7D7475FF6B7A31749B5E47D9E1C3F7793462F3253E369
        7CE03C06EA877C16BDD02AE598004CA3F1A2E3EB23B9182F7A9119C3FB3B8EE3
        EBE3B53F895E24D592F797C8871AE3472F3263B828F3ACCF82EF9681D18BAC52
        8E09003AF4DDEBF8FA28213B73F422338612CE9EB7DAF0DA5F462F926A69748D
        CF1D5F1F3FDB9EC56A4AE7DDFF05DD223D1F3324976302B0B258F7262F77692C
        16BDC88C7D2BBE8D80F0DADF472F926A093F1BDF3ABE3ECA4F8F18BDC88CA152
        DF428EAFBFA2F8F61C482EC70460138D7F3ABEFE151A6B442F32634C00280A13
        8066BB4A6315C7D7DF587C3B4626976302B08BC6118EAF8F5ADEBF895E64C6F8
        0880A2F01140B39DA9B199E3EBEFA4714CF422AB946302B09FC65E8EAF8F6213
        7B442F3263DC044851B809B0D90E17DF0AADD9F572C83101385E633BC7D7DF53
        E3C0E845660C47A526767CFD49C48E1A120D8BC7009B0DF5FAFFE6F8FA2837BC
        63F422AB9463027081C67A8EAF8F7AD0A7442F32632C0444515081F209C7D767
        21205FDB8A6F9F8FF334368C5E6495724C00B04BD3B366334A4EFE3B7A911943
        B9D4391C5F7F098D3BA21749B5841E14B738BE3EDB88FB5A57ACE192177CB7AC
        18BDC82AE59800DC2E56EFDDCBD2E25B2FBC74378BBDC75E7EA97169F422A996
        D80CA8D996D5B8D1F1F56F13DF4665C9E59800A008D0828EAF8FD7BE3F7A9119
        4306BFAEE3EBA365E8F1D18BA45AF26E077CBEC6AFA21799B18535EE767C7DD4
        1958247A9155CA310178447C3B6EB11190AF1335B6717CFD43347E1FBD48AA25
        EF5DE4483C3D7BD697CEBB21D0C3AD31B2916302F094D8462F2FE818F674F422
        33B6AFC6DE8EAF8F96A19E9B44A9B9B0B7E7978EAF9FDD31B29AF1DEC4894E91
        B3472FB24A392600E8DB3CADE3EB4F27BECD864A87224BA739BE7E76593C5506
        77F6E6747CFDCD35CE885E64C6D007E0BF8EAFFFBCC60CD18BAC528E0980F731
        B29F6BBC16BDC88C796FE4F94A634CF12DF94ACD339258ABD7911DC7585AB881
        D8D3541A2F3BBE7E76C738734C005848A6D970F7E605E731F8188786855BBB8F
        3B8FD14F7CBFA04A87CFE6B71C5F3FBB424E392600DEA564C715EB3B4D3E7025
        869AE99E4D53B013FBFCE88552ADA0C08B67A3976FC47A0DF0CE931F96726E53
        8E0980773319FC120F8A5E64E69ED598D1F1F5D12C6AB7E84552ADE0F89F6799
        57DC719A357A91996333A736E5980078B793C595E977D18BCC1C76EAAFE3F8FA
        F7896FDF706A1E1C1FF3DC1CCA1A00FED8CEB94D4C00DAC704C0DF3EE27B5C0A
        B763F128E78BE885522D6053286EEF7A7EB8A343E9FED10BCD1C138036E59800
        F01140F3E12CB677BF05D4F4BE2E7AA1540BAB6A5CE93CC69A1A97472F34737C
        04D0A61C13006E026CBE1427018E14DFAA6FD41CC768ECE03CC6341A03A3179A
        396E026C538E09008F01E6017DD927737C7DB404F6AC1849CD81E231D33BBE3E
        7E96A7885E6401780CB04D3926002C04940774655BDB790C9C34F0AC1C46F587
        24F029E731D0E06AFDE88516808580DA946302C052C079C031BDC39CC7E0C62C
        1A20B6E9D4D3CEE2DB65900C4B01B729C70480CD80F280637AF7388FF198F876
        8EA4FA438317EFF3F90B683C10BDD002B019509B724C00D80E380FA808F8AEF8
        6EE804FC423F19BD580A81CF89479CC7C0C6B18984478753F06E07FC90C67CD1
        8BAC528E09C0BD1A0B3ABE3E5EFBFEE8451622C53E009E0628578ADDFF2C0094
        CEC21A773BBE3EEE482E12BDC82AE59800DCAEB1B8E3EB2FA3714BF4220BB195
        C6C9CE63BC2FB669F4CBE8C55252A38AEDCE1FCF791CB6004EC7BB93E86D1A4B
        452FB24A39260028EEB282E3EBA344AD77911A32F8627E35C1389B6A9C1DBD58
        4A6A338D339DC7F841ECF8DF9BD18B2DC4BA62272EBC5CABB152F422AB946302
        709EC6068EAFBF8DF85F95D28FBCF7744076CFF6A85B297EAEB0F16F81E88516
        643B8DE31D5F1FDD22378E5E6495724C008ED3D8DEF1F5FFA4F1F7E8451604EF
        778AA37ACB69DC14BD584AE217625773DE7EAF7148F4620B8263BDFB39BE3EF6
        8CEC14BDC82AE59800ECABB1B7E3EBE36CFAEED18B2C88F7D9DE21FEA3B172F4
        622989EB3596771E03B7FF5133E4A5E8C516046DBE77717CFD011A7F8D5E6495
        724C005074E348C7D7C773C3FED18B2C8C77ABD6219614DB444AF95A4CE38E04
        E3E034D2C2D18B2DCC3F3536717CFD1D358E8D5E6495724C00F08CC6734317BA
        86AD1EBDC8C2ECA171708271B083D8FBCA9062DD22697672A392E511D18B2DCC
        D5E27B176F43B13D66D9C83101C02ECD6B1C5F1FE74C178D5E6461D0800375B8
        474A30161200CFA3441427D5B3FFAFC57A86B069585ADE3560F0F3737DF422AB
        94630230BFF816EAC1F3E819A31759201CBDFC658271501510D51EBF8D5E3055
        EA671A0F6BCC91602C36FF89E1DD07068F211F8E5E6495724C00D077DBB359CF
        47E25F3C847E0AB7F6AE4E34D6B61A27452F982A858A7FC7241A2BBB2BC586F8
        58636CC7D7EF27BEDD0693CB3101C00FC0C7CE638C9B600C1ADA0862895D8A76
        9CE841800631EF452F9A2A31B15803AFF1138C855DFF38B9F27DF4A20B837FDB
        F79DC71853E3F3E8855629C70400BED218D9F1F5E711FF2622F453A936030276
        146F16BD60AA040AB86C98682C6EFE8BE1DD0808A5C2478B5E64D5724D0070A5
        388DE3EBE359F4A5D18B2C10EEEE6033A07787C02170DAE3CAE845539F786F0A
        EEE8138DA984770723A044FB458EAFFFBCC60CD18BAC5AAE09002ABA2DE3F8FA
        E81EE7596B80BA86424CBB251AEB758D39353E885E34F50A1ED5A175F75489C6
        3B48E38FD18B2E148AB379565DBC417C7BCC84C83501384DE3378EAF7F94F856
        9CA2AE610F00B2F111138DC71DDDCD95A29DF410DF88ED407F2D7AD18542819E
        DF3ABEFE291A5B472FB26AB926002805BCAFE3EB5FAEB166F4220B76AAC61609
        C74332F98FE845535B52B492EE08636D13BDE8825DA5B18AE3EBFF59E380E845
        562DD70400ED5DCF727CFDC7C4BF9318750D77019E13DF8D9E1D6103104AC83E
        14BD70EA11FC6EDEA5317AA2F150F867268D81D10B2FD8531AB338BEFE461AE7
        462FB26AB926004B68DCE6F8FA9F8AEF7953EA1EDA7E6E97703C9CFF45CB60EF
        A346D437A8D18136BC9E056186955D97B886C1F7D867E29BF02DA2714FF442AB
        966B0230A5C6ABCE634C222CF519690AB1BD00A3261CF33A8D55855502EB0AA5
        A2512C2A653F8741625DFFDE8C5E7CC12617DBB0EB69328DB7A2175AB55C1300
        148DF9426314C731D83F3EDEFE1A7F4A3C2636986E19BD70EAD40962551C53C2
        5EA37DA2175EB815C5DA797B41923786588BE7ACE49A00006AF64FEFF8FA3C0A
        180F95B99E15BB02480949C7DFA3174F43F1DEF8DB195C75E2D97F56D5E11AC8
        FB0820AA48CE1ABD480F392700B85DEB796EF37449BB139D3AF76B8D33128F89
        2B011C393A217AF134D8F61AC7058C8BDEF3FF8A5E3CC999E25BB5138F95568D
        5EA4879C13006CCCD9C1F1F5B1D16881E845D2E0C73D68D1ECD906B433A8F5DE
        5FAC6430C5410288239AA93FCBF033879321D9DD166E209CCE99C7F1F571A777
        D7E8457AC8390140D106CF8E6E782E3496C677D10BA5C1C7BE9090A52A0E3404
        FEED3717260151FA8BD584F859E27151F40727421E8F7E0368F0EF3C4E65796E
        06CEB60E48CE09C0C26259BAA799C59E41533C3C938F28C38A2B4054853C3AFA
        0D280C36FBE1B6FF080163FF4D6CCF01C5C3B3F9279DC7C09DDE07A217EA21E7
        0400BB36D19CC3F3030225622F8C5E280D864E5DE8D03863C0D8480250298C1B
        03D388D8F037C43362B79BBF8C7E1368B05F896F811EDCE543CD972FA217EA21
        E70400704E7C3AC7D7DF4FE32FD18BA4FF5952E36689B92A04D40BC78634D609
        F08173FE278A6F9F8FE1C197C1D21A7744BF11F43FDE4781718777E6E8457AC9
        3D01F8B758EB5E2F6815BB7AF4226928518F0286B856ACF7FC87D16F446626D0
        385FACFE46147CD9EC15FD46D050BC7B00A0C5F07AD18BF4927B0230407C8B74
        E0437E42B11DE1540FD814842BB48502E7F08AC6BA1AF747BF1999985B2C999F
        26700E0F8A9583FD26FACDA0FFC1F7D77B1AE33B8E813BBCFB452FD44BEE09C0
        3A62199C276C42793A7AA134141467C107F6188173C033431C43CD72F77042A8
        BA8823BD294B3E0F0B75E6F1DCFFF9E837838632BBF89FC4584BE3B2E8857AC9
        3D019841AC6B9C27B41D3D357AA1F413DE1D217B0A9B44D126968F04DA83AB3A
        B4D85D277A22926927B80CE0248877312EEC217B317AA15E724F00B019EC63B1
        92B15ECE103B0B4EF5E35D0CAAA7D0980A75293CEB95E704CF7451C363CAE889
        48C645603280FA1B9B38BE3EEA0B8C2319177BCA3D0180DB3516777C7DF41C88
        387A46DDC3AEF11BC5DA43D701EE06A084F0BBD113A9295CF56313E7D6D11369
        B94B63198DAFA327429D7A417CDB3EA3A5FC52D18BF45442027090C6EF9DC7C8
        B2556426F06F83CD7853444FA4059B96708E1D47065945D260E3261E93FC556C
        B77F1DBC26560086BFD7F534A9F8B7603E40ACBE47B64A4800D610FF4D1C386A
        7869F442A94BD8458E6C7EACE8897480CD4BBB69DC103D9160BFD0385C63B6E8
        8974800262B86BF458F444A84B389A7781F31868007475F4423D959000E098DE
        3BCE6B3D54638FE885D270ADAC71B9A4EF17D09D3BC5EE08DC1C3D91C41615AB
        E61779AEBF33B82B839DDF57464F84860B7B3376767C7D3CF7C777C707D10BF5
        5442020028DF3993E3EBA31BD57CD18BA46EA5D835DC5B685F7DB0D89E859CA1
        45371EC92D1F3D912E60FFC129D193A06EE1EECC1C8EAF8FFE02B3472FD25B29
        09C069E25B3E14D9229E317B3F93A2BE4325B73A17F6403F8323C46E6FE6526F
        1E67F8D13703BBE9E78E9ECC70A0A42CFB39D41FF6F5BC2EBEDF5F3882BA4DF4
        42BD959200E0CBFF34E731D097BC0EE7CEA97B076AFC217A12DD40DD001C73C2
        CF6D539F45A34DF3166247B5C68B9E4C37F0C5EF59539EAA839F29EFDA2B457C
        9E979200E0F6FF33CE639C2756039E9AA12E35027A02B7232F6885F7CF715FCD
        2276B58F98357A323D74ACC68ED193A01EC371DA759DC7C8BA00D010A5240058
        E7DB1A13398EF161EBF579B4AB19F03371B4342709180275275050E81AB1930D
        9F07CF0745B6D085119B2C57D2983E783EEDC297FF4E9271B197CC60132FEA68
        8CEB3806BE2B268D5E680AA5240080A3806B388F819DCD77472F94DAD284C701
        5D41DB61EC19C049827BC48E163E2B7EED8851580945AFE6D458586331B1DBFC
        753B59D153BCEDDF3C389E799BF318683C558712D4EE4A4A007064E448E73170
        ACC9B3FB20F9A8FBC6C076A06A1D9A53E1F6E54BADC086A9F7C58A10BDDFFAEF
        A0ABDD67ADFF0DAEE2F1E53EB2D8D1A7095A8152BCFDC4BAF0A1E2DA2CADFF4E
        0EB8E1AF99D092D93B6943B5CEE3A3179A42490900AE5C9E751E0315E7168C5E
        28F50A8E08625F4053AF66A9677077647BE151BFA6C291EB799CC7C063AC17A2
        179A4249090078D78EFE5E6372B16748D43C38A38EF6D163474F845CE08EC7AF
        34AE8A9E08F50A3E5B51A2D9F37B0BDD633D6BC6D44A6909C07162D9BFA7626E
        1F650AC545F005F1F3E88950A5DED0584DE3E1E88950AF61B3E651CE63E0F577
        895E682AA52500F800B8C2798C5B35968E5E28F5094E739C2FD6098E9AEF0EB1
        63892CD4D56CD8ECBAA8F31838CD524CDBEED2128031C436428DEA38061E034C
        25B6F18A9A0B7B01FE26CD3D21400615DD70D4F39BE889509F6043EA2BE2FB9D
        35486C13EC17D18B4DA5B4040050737D05E73170E2E0E8E88552253615EB1F30
        46F444A82D78DE8FBAFEE7464F842A81CE9987398F81DA1AAB442F34A5121380
        143F48B855B578F442A932380677B6F8DF7EA46AE034CEC6624593280FF78AFF
        09ABE22EDC4A4C007096F929E7315055AC9FD82D2BCA031E09ECD58A9F454F86
        3A85C76FA8EC87D6DC5F474F862A83041C27B8BCBFAF7054BCA8A4B1C4040050
        1CA59FF318B8D37044F442A95223686C27B637C0B31429B5EF138D03C4EEEE79
        5542A418681F7D90F31848309A56C6BACF4A4D000ED1D8DD790CDCB25A387AA1
        54091C0D444749347B9A247A32345C6F699CA371BA5813256ABE0734E6731E03
        09C61FA3179A5AA909C0021AF725186736F17FDC403EC6D1D8406333B19AF7D4
        3C0F8AB554FE97D8E91F6A9ED9C57A5C789B570AAC11516A020078D6E37DCB07
        B723BDEF3450B5B0D108C7C6D613DFE3A294CE9762EDBA5108EC81E8C9505B50
        986727E7318ABCFD0F2527006804E27DCB078D57A6D0F82A7AB1345CA388758A
        C42E605EEDE70D7705501B00770606454F86860BBF9728FD3BA1F338D8D3B377
        F46223949C00A0A1C44309C6C16DE40BA2174B9D42C53F5CEDA33CB4F7870CD5
        CB3B6225BB7157808F07EA094739CF4E300EDA5BA778CC503B25270080B6A933
        3B8F7183F8171EA2F6E05811EA7D6FA9317AF4642814EECE2141C755E073D193
        A1A1DC2CFE65D59F113B1A5EA4D21300F480DFCB790CD404C0F9D2E7A3174B83
        77F3E3DF7B1DE1597E1A1A8E0EA2132412019E1E88379DD83E2DEFEFA8011A7F
        8D5E6C94D213007C213C96601C9C4FFE73F4620B36ABD87E8F8D845FFC347C28
        2674B5D833E147A22753B003254D1F8EA24F6A959E0000B2FD599DC7C0D96434
        08624392B4F0EFBA8FC6BA62457C887A0A89001E0DE0EAF099E8C91406553751
        457532E771F0DC7FCEE8C546620220F2278DFD138CC3CD80E94C2EF6C58FE23D
        23464F861A0D8900EA08E06A94ED84D3F895A469E284BB82DE15066B8D0980C8
        A462D9E648CEE3E0FCF102D18BCD1C3AF661573F1EB78C153D19CA0A5AC41E23
        F638EF93E8C9642E45E31FECF9C05DD9A2933A2600E6528D35138CB3A4C6EDD1
        8BCD106EEF6F25B6A973A2E8C950D6DE16DB488A52C3DF474F2643CB6ADC9860
        9C8BC51E0D168D09805955E3CA04E35CA6B156F4623333BFD89519FB2E504AA8
        21B2A3C65DD113C9CC551AAB241867658DFF442F361A1300832B4874089CCA79
        1C1C09C4AED3A7A3179C810934FE2276CB9F1BFC28027E9F51A806ED87DF8E9E
        4C066612DB91EFFDFBFCAA582D90EFA2171C8D09C08FB0DBF72F09C6394963DB
        E8C536187E6671BB1F9B77D89297EAE023B196B5A78A2505D43B78FFB648300E
        3608EF1BBDD83A6002F0A39F8BDD05F03E278EC624FD84570CBD81AA8DA8E3BE
        44F4446A04474C5FD678BDF5F7775B819F2F7C3161C3DAA71A9FB5425A7F0E7B
        24159B60C76CFD7DCC0E81AE88638B1DC99AA815F83B7A5C4C2D6C8FDCD1AD1A
        DB683C1B3D91069A58ECE7D8BB0117F66DE0EAFF95E805D7011380A15DA3B152
        82710648C1D5A77A6164B1233B38B2394AF46402E00B1DB7469FE910035BF165
        F0DC46134B681133770894572D714326FE3D70AC1877A858F7A3E750813145B1
        34EC31582D7AB175C104606828117B518271D025705AE171A29E40B5C6B334E6
        8E9E4822B80AC29151F4267FA8154DBD5B843B0568BA356FEB4F6CD8F4DE6753
        17F8F7DB545856B8277097E9458DF1138C854DD897452FB82E98000C0DB74107
        8A1592F186FD06FB452FB8C6F028E67762CFEA72BDEAC726247C51DC29B69B1C
        7FBE1E3D29677874B058874062976B7966DC0D4049E1C38547068707BFE329DA
        F1E277AB9F580D001226009DC1ADE6BF2718E763B1BB001F442FB886F0BE9CA9
        B178F4441CA0E3DC0DAD40B7B38FA227146C3C8D6534966FC50CD11372709B46
        7FB13D4634349CE6C1D5FFD809C6C246CD43A2175C274C007E0A1F48D8203266
        5F5FA807F0DC2B45E6DB241B6A9C28693E1052C073606C0EBBA215FC12183E24
        7FABB70285B3BC2B74A682841F1B04CF8F9E48CD60AFC4EF138C838DB078FC54
        7AC23D1426009D3B5263E704E3603736DA5EBE13BDE01A185DE36849730CC81B
        6EFDA2A31C7A3FA0D8C8C7D1136A281CF3445198F5C536E7E6F028E814B1CF96
        41D113A9016C12C5D57F8A8BADC334768F5E70DD3001E85C3FB15ED4291AC91C
        2C69DA5ED61936FA9D27FE5D193DE14AFF3AB12B3C6C32E206CF6A61A318CA75
        A3A9D62FA4D94D9E9E6CADA3F40D824768EC92601C3CF3C785168FFE0D830940
        D7F041BE7E82713E17FBE16CEA4EEFBEDA48ECAA68F4E889F4128EE49DD18A52
        FF0D5343032F7C816EAE3157F4647A097789B613FBB929114E88BC20768CD41B
        BA396E12BDE03A6202D03574A3BA37D15847499A4CB84EF06CF7508D9DA227D2
        0BB87D7B8E5851A2FBA2275338F480D85AAC856C8A2F93AAE171234A0997B633
        FD388DED138D359FD8715A1A061380E1C3E6AD25138CF3B5D86DF0E7A2179C08
        9EFDE196FFB2D11369139E57E24BFF348DF7A2274343C12382FE62CFD7A7899E
        4C9BD02114771BDF8A9E48222812F5A8A4D9E089CE82CB472FB8AE98000CDF1A
        92AE68C4E592A625713464E368BF3C65F444DA80F3F9383E845DFC3CCF5D6F68
        2483DF5B5C552F1A3D9936BC26F6FB5FC2956AAA8AABB04A6B3CEA041380E1C3
        87C91362196B0AD8DC747DF4A21DFD52E39F1A63444FA407F0458F9DFC078A25
        00D43C4836714700FB4C9A506C08FB81F0ACFAD2E889384AD57A1D1E132B34C5
        064D5D6002D03D6C363A2FD15868138C4D4D39D610C707312AA2D5BD752F3E2C
        502F1CF5191E899E0C5502A74B50E0AB0989007EFE50196F40F4441CE096FFE3
        626D7F53585BE392E845D7191380EEE13D42B9D654BB8DD1DFFEB8E8455708BF
        F46881BC79F444BA812BFE7F8B35697A227A32E4624EB156B0B81355F7CF3E9C
        8CC126B99C3607A2B4F7A189C6C2A314F49EE0D5FF70D4FD97A02EF081F1EF44
        637D28560EF5FDE8455700B7FAD15C29D5F3BEDEC26317D46278387A2294041E
        0DA002DD72D113E906EE446173E017D113A90036FE6293F3B889C643C7BFABA2
        175D774C007A06EF138E042E90683C54C44B5189D0134A2AE3595F9D3762A1C5
        EE008D0BA3274221B03B1C9B3BEBDC6912C74CF1DCBCE9A74E701770EB4463A1
        9B268E71F3EABF1B4C007A2EE5E615DCF6430BD5C7A317DD4BA8B98D12B8A936
        4FB60BA597F7142BC2C25DFD65C39E94DF681C2076955A47A81888BB68AF454F
        A49770C7051750A9F65FAC28569593BAC104A03D778B151E49E17E8D45C45AC6
        360936F8A0D35D1D8FF921B13A5EEC39309B825047B8358DCD77A8CE57C732C3
        28638B3B16FF8D9E489BF05EE2CB7FDE44E3E1C44E8E5D445D300168CF0A9236
        B3DC55AC525853CC26F6E53F69F4443A810F067CB837F5AE0AA581825C27682C
        163D914EBC2196043C1D3D9136606FCD8109C7436BE95BA217DD144C00DA778B
        C65289C6C2E61F7C20BD18BDE81EC07354244775BB8D8A4E7CB8E23F4678BB9F
        7A069F8B9B8A35AB193F7A32C3C0E32B5C883C163D911E40454624DCA9EA7EB0
        EA5F9B9800B40F570628DD99EABDBB56EABF8B7EFED63CEBF66189931B3B8A5D
        3911B56B728D63C54E01D5093604A268589D4FADE0F31177035395FBC6863F3C
        324DD5BF250B4C007AE75CB1E623A96C265641AF8EE6D1B849D21DEFE9890F34
        7E2BE90A3851DE50400889C078D113E9003FE3F8727D347A225DD842E3D484E3
        9DA5F1EBE845370D1380DEC10637B4814D756B0B350150CDEC9DE8850F031BFE
        D0306992E8897480C710F8F069EA8E69AA27EC6B41719ED5A227D2C1BB1A4B8B
        1D67AD137C1E609F42AA84098F4A67D678357AE14DC304A0F75031EE2F09C7C3
        5D878DA217DD018A15E1CB7FB2E889B4A0452F2A8D9D283CFF4B3EF07989EA7C
        A866376AF4645AF0780B1D4B5F889E48071768AC97703C94EDFE5BF4A29B8809
        40EFA1F738EE024C9570CC8DC5FAD0479B5AE3B6C46B1F1E5C01E1910C77F853
        0A280B8EC74B33474FA4E565B124E095E889883DAE3C33E178B8EAC7BF430ED5
        12936302D037F8423E3BE178D8D18EDDF60303D73C81C61D529F0F3FEC8DC0F1
        BECFA3274245C105008EB7ED143D9196E7C53628473E26C4AE7F34D01A3BE198
        B8D37051E09A1B8D0940DFE0FDC39570CAC213F8F25D5A620A048D2E76D42655
        31A4E1C12DFF6DA4BE9B23A90CA82288E65D7578247097D831B8410163A3E00F
        3E0B174938266A7B2C217CE4D76B4C00FA0E652E51AF3B659BDBBD34F64FBC4E
        94F144A6BD56E2713B83DB7EEB88554B248A8693303872DA2F7A2262E5CA716C
        317517C10162F53652414D0FD4FB7F30F13AB3C204A01A78E6B559C2F1BE11BB
        EB705FC23171A4678B84E37505678BF1BC3F876E89940F14C03A5FAC125DB493
        C5EE8EA582865FD8109CB284324E64A46A2E942D2600D598506C235ACA2A78A8
        0E88FD009F2618EB4F92FE8E4367F0C1B6835802445437B84B7694580D8A68BF
        17EB74E86D4C8D87C44E05A5824248B348F33B24866302509DD4BB5FE10C8DCD
        9DC7C0ED44DCFA4FF9886358D8EFF067B11EEE44758756DE8749BAEE779DC12D
        F2B5352E731E079BA0374EBCB60D8545BE2AC104A05A6881BB62E231B712BF8A
        5BB8C3804D87A90A1E7506773836D0B826700E44ED5A5DECC8EE988173C0EF0E
        1E157AF50DC0E99BE313AF099F03AB241E335B4C00AA85F3F14F48DA5FFAAFC4
        76C256BD210E95CF50573BF2AC3F9EF3A3F2DA3D817320EA2DF4C8B85A621B64
        A146C0421A6F57FCBA784D3CF71F25E15A90D0A0E3282BFE55840940F57613BB
        FD97127E21701AE1DD8A5E6F248D9B25B6252AF638E06ECAF3817320EA2B94CB
        46A3ACA903E780E379CB497527032616DB7D3F65E275A0B1D7B189C7CC1A1380
        EAE159396E9BA73C0F0B68C8832FCC2A7EC9B19129B2C0091A9CACACF166E01C
        88AA82AE824802660F9CC3E162A5B2FB0A3BFDAF17AB459212EE46E28224A2FE
        49B69800F898432C431E29F1B8D824F7C73EBE068ED89D9B78DE1D6147315A9D
        F2981FE5048D71B04768C1C039602FCD057D7C0DDCDDDC2DF1BCBFD69857E3C9
        C4E3668F09801F34A7F873E23151110BBFE417F6F27F8F2B143C6F8FDAF4F780
        D85D8C0F82C627F2348E5812105549F3B3D6D8BDFD22C589A08B25FDF7061AAF
        0D483C66119800F8C1E618DCB69A2BF1B8D82883C70FEDFE9263E322BE80674A
        3CDF216ED75855D2D435208A823AF9D81818B5BF066D7AB139B1DDE639B8AB89
        52C3A94F353C2C96B47C9D78DC223001F035ABD897EA6889C71D289604BCD5C6
        FFE61F1AFD13CF7308DC75C06D7F7EF9530970870D770252F610E9A8DD2A7A68
        F98DDFD1D42782BED45840EC6415396002E00F3B578F0E18177B1096929E75C9
        5B577AFFD8A0AFB0E10FE5533F0C1A9F28021E07A0B1D67C41E3F7B4980E1A80
        E14450C4DE05D419383160DC623001F087F7F872B1F3ECA95DA5B1A60C7FE7EC
        CFC5BE84C70B98DFB362494AD56794899A0025C46F113BDB9EDA47624D8C060E
        E7BF834A8678E6BF66C0FC50F0078F04D9E9CF11138034500804D5B8260D18FB
        248D6DBBF8FFE1171C6784170D98D74B62CF4179D48F4A862382686BDB2F60EC
        EE5A8B1F23D67B23B57734E6145E18B8630290CE4A629B7F22DEF35DC4CEF60F
        6B4F8D0302E683261E78FEF96CC0D8447533BD58123071C0D87FD038B893FF7C
        8F2EFE736FB8E2C7DDD2AB03C62E0E1380B450C52AA253181A83E039FF251DFE
        3374D3C299FB5113CF05BB8F97D7B83BE07D20AA2B6C76C3B3F6D44770514A1C
        A7023A6EB45B47AC5E404403B023247D9D81623101480B5FB6381A3867C0D883
        C49A68DC2256CD0BBB7A536F404295423C4F64764FF453682084243D7517C1FB
        C41EC7E1F77359B1BD43A92F0C00479791080D0A18BB484C00D2C3861F7CF946
        7409C331BB15C41E470C08181FE5858F091897A829227A89008A96E10EC47512
        F7D9849306CF048C5D2C260031A22A6A01AA81A14851EA32C538CEB35DC07A89
        9A06E7F4B74C3C260AEDE0CA7B9C80F5E2B9FFFA1A17058C5D342600710E956A
        9A7334014E1AE0CE03AB7911750FC9390A052D1B3D91440E14DB904C89310188
        83E77C38EBBA42F4449C0D14DB64C4E63E443D871A01A8221AD9463805743145
        155076F90BC0042056545FED5450CA73F1D61A89A83D738BD5DF4F5D4A3C9557
        C42E0EDE8D9E48A99800C443A38B5BC49ECBE7660B8DD3A32741D460A8D97F52
        F4241CE0E26009B1BB1C148409403DA052DF09D193A8D8A91A5B454F82280391
        8DBABC6093E369D193281D1380FAC095F2E6D193A8C85362E779DB6D394A443F
        85863CB8529E257A22153959639BE8491013803AC1CE5F6C0A5C2E7A227D84CA
        620B89351822A26ACCAE71BFC414E8A9D2AD1A2B8A7D4E50302600F58233B868
        D0317BF444FA00ED8F8F8D9E045186D0D3E388E849F401EE0C6253305B7FD704
        1380FAE92756297092E889F4024AFCA291075B7812550F9FD7F81D5B297A22BD
        F096D886E797A327423F6202504F288989B29CA3474FA40DE82F3E87C66BD113
        21CA18DA07A371CF78D11369C3E7626D87B9E3BF669800D417AEA42F95F48D41
        7A6B638D73A2274154805F6B9C113D891E4227527417BC347A22F4534C00EA2D
        AA3148BB2E17EBF2474469FC5BACA748DDEDAC7174F424A8734C00EA0FBF3C3B
        464F6238B0A107C793DE8E9E08514126D3785A629AF7F414362CEE163D09EA1A
        1380FAC323807335D68B9E481750C428C74A654475B7BDC671D193E8C279628F
        05BF8F9E08758D0940338C2C76CB6FD5E8890C0375CA51CE93BFE444E98D20F6
        3BB850F44486814782EB6A7C133D111A3E2600CD812400BF582B464FA405DDBB
        E6D1783C7A2244059B4BACD9565D360BDF28B681F9CBE88950F79800340B8E05
        A24FF812D11369C1FE84DD85993E51047CE9EFAFF187E889B4DC2DD6DAF7B3E8
        8950CF3001681E6CFA41963D5FF4445A6ED3D840ACD00711A531A1D8DEA0E5A3
        27D282D2DFCB08ABFC350A138066C22FFF2D1AB3454FA4E575B1677EF7444F84
        A80048FE2FD6983A7A222DCF6A2C253C09D4384C009A0BA582D15863A6E889B4
        A0B9076E451E153D11A28C6DAD718CD89EA03A785EECCBFF8DE88950FB980034
        1BAE006ED0983E7A221D9CA5B183C6A7D11321CAC8D86247FE36899E4807F8F2
        47F7D257A22742BDC304A0F97027E07AB13AFC7581861FF8A0BA237A224419C0
        31BFB3A55E893E8A10AD20F6F88F1A8A09401ED01804A703168C9E4807DF8A95
        31DE5B784A80A83746D4F89DC67E1A23454FA68387C48E23BF173D11EA1B2600
        F9C0E900B40A5D347A22C3B857EC6EC0F3D113216A103CDEFBA7D4E7C8EF10B8
        AB8773FE1F474F84FA8E09405EC6102B16B46CF44486F189C61E1A27474F84A8
        0150F61BBF2BE3464F6418B78B5523E5FE9E4C3001C8CFA81A776ACC1B3D914E
        5CA0B193F0B8105167B09F073BFCEBD8F7E3018DC5C54EFB50269800E409CF0B
        9F927A6D1A1AE223B1E382A768FC103D19A29AC097FEF162353EEAE6398DD985
        7B79B2C304205F38278CCD3A752916342C5410C499E667A3274214685A8D13C5
        76D4D7D13362FD06BE8E9E08558F0940DEF0EF8B2E826B454FA40B83340E16AB
        67CEAB0B2A0976F8FF56EC677F8CE8C974E1128D758477EAB2C504A00CDB8A3D
        5B1C317A225DC09D8A2D351E8E9E08510228E58B4760F3444FA40B38C28BE484
        9B7633C704A01C0B685CA53151F444BAF0BDC6BFC4BA0BBE133D192207E36BEC
        23F6E55A97F6BDC3C2EF1E76FA3F103D11F2C704A02CFDC4928059A327321CD8
        2478A0C691C21DC794076CCADD5CEC767F1D37F90DF1A4D897FFCBD113A13498
        009407678BB12F6099E88974033B8FF7D2B8307A22447D8076BD4866EBBA1977
        889BC49EF77F143D114A87094099704200478EB6889E480FA0BA21CAA13E133D
        11A236CCAC7184C64AD113E9013CEB47032F6EC42D0C1380B2E118DED11AA344
        4FA41BF860C287D401C2B6A3546F5368FC49632BA957FDFECE7C29F6C57F5AF4
        442806130042C5C08BC5F607D41DCE229FA13140E3CDE8C910758067FBD8C08A
        4A97A3454FA6075ED35857AC5707158A0900013EBCCE91FA162319D6E762572D
        B823C0B2C21469028D1D3576D5183B7A323D74ABC606C2DF9DE23101A021702C
        09BB947F2FCDF9B9F84CE338B15303DCBC44298DA5B1BDC69E629D389B00057D
        500F047B6ABE8D9E0CC56BCA073DA5839AE4A76B8C193D91367C209608207855
        439E2615BBE2C7977FDDBAF50D0F3AF8F5173B014434181300EA0CEA049C2FD6
        00A449B0A9093DD40F179E1AA06AE17762378D4DA4FE9B6687F598D82D7FFE4E
        D05098005057D0567880C61E1A23444FA64DB8D579A3D809872BA227438D8616
        B8E85E8902394DFBBCC4EF014A0E637FC217D193A1FA69DA0F34A58773CCFF10
        BBF5D94428697AA8D8AD4F9E73A69EC0F13D14C5C1AEFEF9A227D34B3825D35F
        E3BAE889507D3101A09E40FF805335D6889E481FBCA571666B1DCF474F866A69
        7AB15BFCBFD1F879F464FAE05AB12FFFB7A22742F5C60480DAB1995805C1BAB6
        2FEDA907C50A0B9D2DBC355A3A3CCF47628BA258CB49B33F13D15E1BA712F0E8
        8B2D7CA95B4DFE61A71828718AAE7DF3464FA402383A78815852F368F4642829
        FC1CF717BBDAAF6B87CC763CA1B191C6E3D113A1E6600240BD81AB26943BFDA3
        585F811CDC2F960C205E899E0CB9985A63FD56CC1F3D998AA03AE6DFC58A627D
        1D3D196A162600D417E8708667EA0B474FA4624F8975213C4BE3C5E8C9509FA0
        363F4ADEA2BEC5A292D767DEDD623D079E8C9E0835534EBF0C14034704D15004
        55049B543CA827BED7B853ECAE00FA25B0FF40334C2EB68B1F57FAF8D26FDA31
        D6EEA0A80FEEC0E1D1D5F7D193A1E662024055C1872E2AF1AD153D1147B83380
        BA023788D553E7B1C27A4019EBB93596D7585D6311C9EF4B7F08B4C7DE4EF898
        8A2AC00480AA865BADC76A4C1C3D1167E843708B5842708DC6ABD1132A0C7EBE
        9612FBC25F4D63BCE809397B47AC28D759D113A17C3001200FE82E7890D82EEB
        5CAFC43AC2912B9C22B859E30E8DBB8467B0AB3699C662AD585663CEE8092582
        5BFCE87C890DB71F444F86F2C204803CE1A8E0111A4B464F2400F60B2019B8B3
        F5E7C3C2E7B5ED9856AC0CEF62AD3F6791F23EAFEED5D8B9F52751E54AFB85A2
        F4F03386CD58076B4C153D99401F8ADD197844AC390BCE6BFF57D89675448D19
        C51A4FCD25F62C1FCFF073BFA53F3C03C5DA725F183D11CA1B13004A6534B167
        9868AC327AF4646A02DD0BB1B1F0F15620314041975C4F1B60A3288E8EE2F6FD
        1CADC0FFDDB4EE7A5E3E173BD38F6E9683A22743F9630240A9E14B601F8D2DA5
        8CFD01BDF195C6EB623508860D24076F444FB00B48F2F0AC7EDA4E0257F96345
        4FB0A6B087E422B1E643DCDD4FC93001A028281E84AB9DA5A327D24038078E4D
        86EF7711EF896D18FBB8F5DFC79D86215794F8CFB0170147183F6BFD67A8DF80
        0E7848C8C669FD67F8321FB5F5F771C56EC9A364EE045DC4A4925F1D88146E12
        ABDF7F5FF444A83C4C00281A3678EDABB14CF44488124215BFBD356E8C9E0895
        8B0900D5058AB8A09AE082D1132172841DFDF839BF227A22444C00A86E90081C
        A8315FF444882A84CD9DB8D38567FD6CD54BB5C00480EA083F97A8E58ECD82B3
        474F86A80F70BA6380C625C22F7EAA1926005467F8F95C4EAC18CA6AD193216A
        030A40A11AE695C22F7EAA292600D4142810B39BC6AFC476AC13D50D4E57A059
        CFDF84D5FBA801980050D3E09CF936627705C68D9E0C91D871CAD3C50AF8BC1C
        3D19A29E6202404D852F7F24023B6A4C113D192A128A351DAD7192FC587381A8
        31980050D3A1173C6A086CADF14BB1DAF2445E709B1FC57B4ED6B854ACA01251
        233101A09CA0CCF0A6627706A6899E0C650557FB676B9C28D6AC87A8F1980050
        8E50D2163DE37157602DE1A641EA9DEF346E16BBDAC731BED23B375266980050
        EE50A3BEBFC6C6C29A02D43338BB8FABFD3335DE8E9E0C9117260054925935D6
        6FC52CD193A15A7949E302B12FFDA7A32743940213002A15FAD0AF27565760A6
        E8C950081CD9BB4CE3428D3BA22743941A130022EB3BB08158F9E169A32743AE
        5E10ABC78FABFD87A2274314890900D1D090002CDF8A95853DEE9BEE4BB1ABFB
        1B5AF160F48488EA82090051D746D3584C7E4C08D8A1B0195E941FBFF0FFA3F1
        69F48488EA88090051CF4DAFB192D811C3453526899E100DF696C65D1A378A7D
        E1BF183D21A226600240D47B283C843B048BB7FE9C47AC0601F9C2173CBAEDDD
        D1FAF32961C73DA2B6310120AACE041A8B882503431202EE21E81B34DA7958EC
        CBFEAE567C103D29A21C300120F285BB04D83B801A04B3B5FE8E63873F8B9E58
        0DBD29B649EF49B1AB7AFC1D67F2BF8F9E18518E980010A537BA583230A7C61C
        1A338AF52EE8A7316AF4E49C6157FE4BAD784EACEADE63625FFA83A227475412
        260044F53299FC980C0CFBE7941AA3444FB01BF8827F4DAC61CE4B9DFCF956F4
        0489C83001206A16EC29C05E83095B31411781470CE3B6FE37B8AB305AEBEFE3
        886D541C497EDC9F80E7EC686B8B5BED43FADAE36AFCCBD6DF3F126B8CF37E17
        F16E87BF7F16FD061151CF30012022222A1013002222A20231012022222A1013
        002222A20231012022222A1013002222A20231012022222A1013002222A20231
        012022222A1013002222A20231012022222A1013002222A20231012022222A10
        13002222A20231012022222A1013002222A20231012022222A1013002222A202
        31012022222A1013002222A20231012022222A1013002222A20231012022222A
        1013002222A20231012022222A1013002222A20231012022222A1013002222A2
        0231012022222A1013002222A20231012022222A1013002222A2023101202222
        2A1013002222A20231012022222A1013002222A20231012022222A1013002222
        A20231012022222A1013002222A20231012022222A1013002222A20231012022
        222A1013002222A20231012022222A1013002222A20231012022222A10130022
        22A20231012022222A1013002222A20231012022222A1013002222A202FD3FBB
        5137C463C0FA390000000049454E44AE426082}
      Proportional = True
      OnClick = iButton4Click
    end
    object iButtonLeave: TImage
      AlignWithMargins = True
      Left = 8
      Top = 583
      Width = 54
      Height = 55
      Margins.Left = 15
      Margins.Right = 15
      Margins.Bottom = 15
      Center = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000002000000
        02000806000000F478D4FA000000097048597300000B1300000B1301009A9C18
        000000B46558496649492A000800000006001201030001000000010000001A01
        050001000000560000001B010500010000005E00000028010300010000000200
        0000130203000100000001000000698704000100000066000000000000004800
        0000010000004800000001000000060000900700040000003032313001910700
        040000000102030000A00700040000003031303001A0030001000000FFFF0000
        02A00400010000000002000003A00400010000000002000000000000915FF1DA
        000023BF4944415478DAEDDD79B4B5575918F0F33186322AD5825026055148A0
        6548ABFE510429205DAB16DA8AB6BA180C328430CB249303029A30872902B5B2
        4A4BAB6B5590420A6B5919C34C9242011B1005AB804D422181903E6FEEB91F97
        E4FBF67BEF3DE73DCF7B9EFDFBADF5AEBD167CF7663FEF7DF6B39F33ED736401
        0074E748F6040080CDD300004087340000D0210D000074480300001DD2000040
        87340000D0210D000074480300001DD200004087340000D0210D000074480300
        001DD200004087340000D0210D000074480300001DD200004087340000D0210D
        000074480300001DD200004087340000D0210D000074480300001DD200004087
        340000D0210D000074480300001DD200004087340000D0210D00007448030000
        1DD200004087340000D0210D000074480300001DD200004087340000D0210D00
        0074480300001DD200004087340000D0210D000074480300001DD20000408734
        0000D0210D000074480300001DD200004087340000D0210D000074480300001D
        D200004087340000D0210D00ACEE2671FDE49123474E8EF1F671DD26AE1BC775
        BDB8AE993D3928EC9B715D1CD797E3FAB3B83E79F9E597BF2FC677C5F5A5ECC9
        CD9D06000E67D8E07F3E36FD7F1BE35DB327035CC539D10CFC5E8C6F5CEC3408
        5C8906000EE6E6B1E93F31C65F8AEBEF644F0618F5B5B85E13CDC06FC7F817D9
        9399130D00ECCFF054FE1362F37F468CD7CD9E0C70605F8B26E0B9319EB1D879
        E9A07B1A0018F7C3B1F1BF29C63B654F0458D947A311F8D731FEAFEC8964D300
        40DB0362F37FFD62E70D7D400D174513F08B31FE41F644326900E0F87E3936FF
        97C578F5EC89006B775934018F8CF1D5D913C9A20180637B786CFEAFCC9E0430
        AD68021E13C34BB3E79141030057F580E56BFE1EF9437DC333010F8CF10FB327
        B2691A00F86EC31BFE3EB8F09A3FF464784FC05D62FC74F64436490300DF71AD
        D8FC3FB0F06E7FE8D147A209184EF3ECE623821A00F88EA74403F0BCEC490039
        A20178720C2FCC9EC7A6680060C7CD62F3FFD4C2213FD0B38BA309B85D8C5FCC
        9EC826680020C4E6FFA2184ECB9E0790EEF468029E903D894DD000C06271E368
        003EBF70B63FB07364F02D171D7C81900600168B53A3017849F62480798806E0
        D4185E963D8FA96900E85E6CFEE72CD6F795BE9F88E271568C67C775C162E79B
        C880713F126BF129313E68B1F3E55B993EB0FC4440691A007A77D3283AC35784
        AEBA162E8982F1B8185F15D7B7B383822D72E758838F8FF1E716F3397C2B96F3
        E5378DF1AFB22732250D00BD7B50149F37AEF83B86CDFFBE31BE2B3B18D8223F
        116BEF5762BC7FF6448E25D6F4CFC6F0A6EC794C490340D7A200BD3886C7ACF2
        3BA2503C2206DF1B00E3AE16D73F8B75F7D418E7FE14FB8B96CFEA95A501A06B
        5188FE5B0CF75EE1570CAFF9DF79E1697F681936FEE13B369E15E31DB227B34F
        7F1C6BFB7ED99398920680AE4541FA6C0CB739ECCF4781786C0C2FCE8E0366EA
        3A713D38D6D99362BC55F6640EE833B1BE6F9B3D89296900E85A14A6E1B3BEDF
        7BD89F8F02313C9A393F3B0E9899E1CBB41E1AEB6B385AF707B22773487F13EB
        FBFBB22731250D005D8B0275490CD73AECCF4781B87E0C1767C70133F177E37A
        74ACABE17D35DF933D99150D6FEE3D217B1253D200D0B5285497AFF2F35120AC
        21582C6E116BE989313E74319F1335BF15D73556F905D5D777E9E0608C060056
        F283CB47FB0F8FEBDAD99359BA34AE37C5DAFCF5E5177C1D5AF5F55D3A3818A3
        018043B953AC9DE10B73E67478CFF052DCEFC69A7C418CC3E15ED6F788D2C1C1
        1805020E64F7F09E9F5ECC67FF18DEACF7F21887EFF3F8CADEFFC3FA6E2B1D1C
        8C512060D490E3F75F1EDEF38FB327B3C7E763FD9D1EE36BE2FA7FC79CB8F5DD
        543A3818A340C0710D87F7FCF4F2F09EBB644F668FCFC6BA7BE962E7F4CD4B5A
        FFD0FA6E2B1D1C8C5120E02A868FC5FE6CAC8DA7C778BBECC9ECF1D1586F67C4
        F8FB715DB69F1FB0BEDB4A0707631408386AF7F09EE1D4BE9B654F668F77C73A
        7B7E8C7F14D781D6ABF5DD563A3818A340C0D1C37B4E5DAC702AE69A0DEBF22D
        B1BE7E33C6F71EF69758DF6DA58383310A041DBB49E4FFF05D16C3C63F97C37B
        862FD5FACFB1AE9E13E379ABFE32EBBBAD7470304681A043B789BC3F2DC653E2
        9ACB51B7C39BF9FE63ACA75F8BF1D3EBFAA5D6775BE9E0608C024147E67878CF
        4571BD6EF91AFF5FAEFB975BDF6DA58383310A041D98E3E13D7F1D6BE7158B9D
        AFD2FEEA54FF11EBBBAD7470304681A0B07B457E0FAFA5FF58F644F6F8DCF2A3
        7CC73DBC679DACEFB6D2C1C118058262E67A78CF6762ADBC30C6D7C5F5CD4DFD
        47ADEFB6D2C1C118058222CA1CDEB34ED6775BE9E0608C02C1969BFBE13DFF35
        7312D6775BE9E0608C02C1969AF3E13DBF11E3FBB22733B0BEDB4A0707631408
        B6CCDF8BEB1191B78F8BF106D993591A5ED3FF0FB1167E2BC6F3B327B397F5DD
        563A3818A340B025E67C78CF7363FC4CF6648EC5FA6E2B1D1C8C512098B99322
        479FB8E8E8F09E75B2BEDB4A070763140866AADBC37BD6C9FA6E2B1D1C8C5120
        9899E1F09E67C7F8E3D913D963A387F7AC93F5DD563A3818A3403003BB87F73C
        33C6BB664F668FF322BF5F10E31BE3FA56F6640EC3FA6E2B1D1C8C512048B47B
        78CFD362FCE1ECC9ECF191C8EB172D920EEF5927EBBBAD747030468120C1EEE1
        3DC39BFB6E9E3D993D667178CF3A59DF6DA58383310A041B74E3B84E9DD9E13D
        DF8EEBAD91C7BF1EE3FBB327B36ED6775BE9E0608C02C106EC1EDEF3D8186F98
        3D99A5DDC37B9E17E3FFCC9ECC54ACEFB6D2C1C118058209DD7AB9E9CFEDF09E
        372C8FEBFD7CF664A6667DB7950E0EC628104C60F7F09E07C5758DECC92CED1E
        DE331CD7FBC5ECC96C8AF5DD563A3818A340B046733CBCE7FF448E9E19E3F0AE
        FEBFCD9ECCA659DF6DA58383310A046BF013CBC37BEE993D913D2E587E94EFD5
        717D3D7B3259ACEFB6D2C1C118058243DA3DBCE75763BC5BF664F6383772F285
        8B2D3EBC679DACEFB6D2C1C1180582039AEBE13D1F5EBEBEFFE6B856CAE94AAC
        EFB6D2C1C11805827DBA6E5C0F7378CF76B1BEDB4A070763140846DC60B1F319
        FE272D760EF29983DDC37B7E2DC60F644F66CEACEFB6D2C1C1180582E370784F
        01D6775BE9E0608C02C195EC1EDEF34B715D277B324B5F8BEBACC8B5DF8EF1CF
        B327B34DACEFB6D2C1C1180582A513974FF3CFE9F09E0BE37AFDF211FF97B227
        B38DACEFB6D2C1C11805A27B3F1E39F09485C37B4AB2BEDB4A07076314886EED
        9EDA77FFEC89ECF1BF239F5EBCE8FCF09E75B2BEDB4A0707631488AECCF5F09E
        4F2C5FDF7778CF9A59DF6DA58383310A4417760FEF796A8CB7CF9ECC1EBB9FE1
        FFA385C37B26617DB7950E0EC62810A5ED1EDEF38418FF7EF664F67078CF8658
        DF6DA58383310A4449C3E13D0F5EBEB9EF26D99359DA3DBCE7B9319E933D995E
        58DF6DA58383310A4429DF1FD723677678CFA571BD29F2E43763FC64F6647A63
        7DB7950E0EC628102538BC8763B2BEDB4A0707631488AD36D7C37BCE5C7E25EF
        97B327D33BEBBBAD7470304681D84AFF70F9FAFE0317F3A9617F15B9F0CA18CF
        88EBFF664F861DD6775BE9E0608C02B1551CDEC38158DF6DA58383310AC4ECED
        1EDEF38C18EF9E3D993D1CDEB305ACEFB6D2C1C1180562B6AE19D783964FF5FF
        48F664F67078CF16B1BEDB4A0707631488D999F3E13DCF8EF1ECEC89B07FD677
        5BE9E0608C02311B0EEF61EDACEFB6D2C1C1180522DDEEE13DA7C578A3ECC92C
        ED1EDEF31B317E2A7B321C9EF5DD563A3818A340A4B955DCFBC72DE67578CFC5
        71FDEEF233FC5FC89E0CABB3BEDB4A07C7A1DC3516CD2931FE545C375BFE6F7F
        11D73B6231BC2AC60F654F709D14888DBB43DCF3A7C5F8AF16F339BCE7CBF177
        7C698CC3F595ECC9B03ED6775BE9E03890EBC4623933C65F581C3F2F86C5F486
        58148F5C14F9CCB302B131D78E7B3D3CB21E72E7EAD99359FA42FCFD4E5FEC7C
        86FF6BD99361FDACEFB6D2C1B16F378A85F2B6184FDEE7BF7F4F2C8C7B2D0A34
        010AC4469C10F779F8D8DC3DB327B2F4E9E547F97E6FB1F37A3F4559DF6DA583
        635F86CDFF1D31DEF5803F37BC56FAD0ECC9AF4A81985EDCE397C5F0A8EC7984
        8FC4DFEBB7627CF362E71DFE14677DB7950E8E51378C05F2F6C5E14E588BB571
        F9D0347C383B8855281093BB63DCE38F2D764EF4CBF227F1777A5E8C6FCBBE19
        6C96F5DD563A389A56D9FC77BD3216C823B20359850231ADB8BFC31BEB1E9DF0
        9F1EFEAE6F593EE27F77F67D2087F5DD563A388EEBB04FFB5FD9676381FC5076
        30AB5020A615F7F7FCC5668FF2BD6CB1F319FEE135FE8F67C74F2EEBBBAD7470
        1CD33A1EF9EFFA662C9013165BFC7AAA0231ADB8BFC31B454FD8C07FCAE13D5C
        85F5DD563A38AE629D9BFFE0D26503B0B55F8A12F7E3C218AE7FC81FBF30E2BF
        61760C73B66A01DE87DDC37B5EB0D839AF028ED200B4950E8EEFB2AEA7FDF7FA
        4C2C90DB6607B68AB827E7C5F0A387FCF17323FE13B36398B3091B80BF897BFF
        F2185FB270780FC7A101682B1D1C47ADFB91FFAE57C40299C3C7BB0E2DEECB8B
        6238ED903F7E7AC4FF84EC18E66C8206E04B71CF87BFD9F0D14287F7D0A40168
        2B1D1C57986AF31F3E067897183F921DE08A868FA97D7471F0D3E92E8BF84F8A
        F1FCEC00E66C8D0DC09FC5FD1E1EED0FC7517F233B2EB68306A0AD74704CF2B4
        FFAEB362713C2C3BC07538E441352F89F80FFBCC4137D6D0007C6C795CEFEF2F
        76DEE10FFBA601682B1D5CE7A6DCFCDF1F0BE39F2CEA3C12BB56DCABB72EF67F
        54EDD911FFFD62FC66F6C4E74E012693FC6B2B1D5CC7A67ADA7FF091E5F70054
        7BE3D5D004FC4E8CC3C146C77B39607804FAF288FF890B9BFFBE28C064927F6D
        A583EBD4949BFF8763410C5F135C6DF3DF6BF8BADAE13B0E86386FB5FCDF2E88
        EBED11FB590BAFF91F88024C26F9D7563AB80ED9FC991505984CF2AFAD74709D
        B1F9333B0A3099E45F5BE9E03A62F36796146032C9BFB6D2C175C2E6CF6C29C0
        64927F6DA583EB80CD9F595380C924FFDA4A07579CCD9FD95380C924FFDA4A07
        5798CD9FADA0009349FEB5950EAE289B3F5B43012693FC6B2B1D5C41367FB68A
        024C26F9D7563AB862A6DCFC3F14897EEF85CD9F355380C924FFDA4A0757C8D4
        9BFFF0C8FFABD941528F024C26F9D7563AB8226CFE6C2D05984CF2AFAD747005
        D8FCD96A0A3099E45F5BE9E0B69CCD9FADA7009349FEB5950E6E8BD9FC294101
        2693FC6B2B1DDC96B2F95386024C26F9D7563AB82D64F3A71405984CF2AFAD74
        705BC6E64F390A3099E45F5BE9E0B6C8949BFF7B2389EF13E385D941D21F0598
        4CF2AFAD74705BC2E64F590A3099E45F5BE9E0B680CD9FD2146032C9BFB6D2C1
        CD9CCD9FF2146032C9BFB6D2C1CD98CD9F2E28C064927F6DA5839B299B3FDD50
        80C924FFDA4A073743367FBAA2009349FEB5950E6E66A6DCFCDF13897ADF85CD
        9F995180C924FFDA4A073723367FBAA4009349FEB5950E6E266CFE744B012693
        FC6B2B1DDC0CD8FCE99A024C26F9D7563AB864367FBAA7009349FEB5950E2ED1
        D49BFFF06EFF8BB28384310A3099E45F5BE9E092D8FC6149012693FC6B2B1D5C
        029B3FECA1009349FEB5950E6EC36CFE70250A3099E45F5BE9E036C8E60FC7A0
        009349FEB5950E6E43A6DCFCDFBD7CB7BFCD9FADA4009349FEB5950E6E036CFE
        D0A0009349FEB5950E6E62367F18A1009349FEB5950E6E42367FD80705984CF2
        AFAD747013B1F9C33E29C064927F6DA5839B80CD1F0E40012693FC6B2B1DDC9A
        D9FCE180146032C9BFB6D2C1AD91CD1F0E41012693FC6B2B1DDC9AD8FCE19014
        6032C9BFB6D2C1AD81CD1F56A0009349FEB5950E6E45536EFE7F1A8975BF85CD
        9FE2146032C9BFB6D2C1ADC0E60F6BA0009349FEB5950EEE906CFEB0260A3099
        E45F5BE9E00EC1E60F6BA4009349FEB5950EEE806CFEB0660A3099E45F5BE9E0
        0E60EACD7F78B7FFC5D941C2A629C064927F6DA583DB279B3F4C44012693FC6B
        2B1DDC3ED8FC61420A3099E45F5BE9E046D8FC61620A3099E45F5BE9E01A6CFE
        B0010A3099E45F5BE9E08E63CACDFF7F2CDFED6FF38785024C2EF9D7563AB863
        9872F3870C5F8BEB82B8CE8E62F5DA18CFCD9ED05E0A3099E45F5BE9E0AEC4E6
        4F7597C5F5CA285A8F8FF1D2ECC90C146032C9BFB6D2C1ED719D488477C57872
        F6446003DEB97C1F4A7A13A0009349FEB5950EEE6890478EBC21865FC89E076C
        D0CBA2789D9A3D0905984CF2AFAD74704B778F24785F27B1C2AECBA278DD29C6
        F33227A1009349FEB5950EEE8A008F1C392B868764CF03129CB17C3F401A0598
        4CF2AFAD7470570478E4C8E762B845F63C20C1B951C04ECC9C80024C26F9D756
        3AB870F548804B86317B2290E0A2286037C89C80024C26F9D7563AB870B56503
        708DEC8940820BA380DD3073020A3099E45F5BE9E0AE08D04B00F4CB4B00744D
        FEB5950EEE8A008F1C794D0C0FCB9E0724383D0AD8133227A0009349FEB5950E
        6EE96E9104EFEF2456D8357C0CF0A418CFCF9C84024C26F9D7563AB8A3411E39
        F2FA187E317B1EB0412F89E2755AF624146032C9BFB6D2C1EDE128607A72F6F2
        5B29BF993D1105984CF2AFAD747057E2CB80A86EF832A09747D17AE262069BFF
        40012693FC6B2B1DDC316802A8E6E2C5CED701BF3D8AD570EA65EA6BFE57A600
        9349FEB5950EEE38A66C02FE74F92D6C1767070973A0009349FEB5950EAE4113
        001BA0009349FEB5950E6E84260026A6009349FEB5950E6E1FA66E028677625F
        941D24645180C924FFDA4A07B74F9A009888024C26F9D7563AB803D004C00414
        6032C9BFB6D2C11D902600D64C012693FC6B2B1DDC214CD904BC7BF9C6404D00
        DD5080C924FFDA4A0777489A00581305984CF2AFAD74702BD004C01A28C06492
        7F6DA5835B91260056A4009349FEB5950E6E0D3401B00205984CF2AFAD74706B
        A20980435280C924FFDA4A07B7469A00380405984CF2AFAD74706BA609800352
        80C924FFDA4A0737014D001C80024C26F9D7563AB8896802609F146032C9BFB6
        D2C14D68CA26E03D9174F75968022840012693FC6B2B1DDCC434013042012693
        FC6B2B1DDC066802A041012693FC6B2B1DDC866802E038146032C9BFB6D2C16D
        9026008E41012693FC6B2B1DDC866902E04A146032C9BFB6D2C12598BA09183E
        2278617690B05F0A3099E45F5BE9E09268026049012693FC6B2B1D5C224D002C
        146072C9BFB6D2C125D304D03D05984CF2AFAD747033306513F0DEE51B033501
        CC96024C26F9D7563AB899D004D02D05984CF2AFAD747033A209A04B0A3099E4
        5F5BE9E06646134077146032C9BFB6D2C1CD902680AE28C064927F6DA5839B29
        4D00DD5080C924FFDA4A0737639A00BAA0009349FEB5950E6EE6A66C023E1489
        FB53317E353B48FAA6009349FEB5950E6E0B6802284D012693FC6B2B1DDC96D0
        045096024C26F9D7563AB82DA209A02405984CF2AFAD74705B461340390A3099
        E45F5BE9E0B690268052146032C9BFB6D2C16D294D006528C064927F6DA583DB
        629A004A5080C924FFDA4A07B7E534016C3D05984CF2AFAD7470054CDD04DC3B
        C6AF6407495D0A3099E45F5BE9E08A98B209F8F0F299004D00935080C924FFDA
        4A0757882680ADA4009349FEB5950EAE184D005B47012693FC6B2B1D5C419A00
        B68A024C26F9D7563AB8A234016C0D05984CF2AFAD7470856902D80A0A3099E4
        5F5BE9E08AD304307B0A3099E45F5BE9E03AA00960D6146032C9BFB6D2C17542
        13C06C29C064927F6DA583EB882680595280C924FFDA4A07D799299B808FC442
        B8D74213C00129C064927F6DA583EB902680595180C924FFDA4A07D7294DC06A
        4E8CFBF7B018EF19D7AD96FFDB05719D1DB1BF36C673B327B84D146032C9BFB6
        D2C1754C137070D78E7B76468C0F8FEB6AC7F93797C5F5CA88FFF1315E9A3DE1
        6DA0009349FEB5950EAE73378AE47F478C779DE077BF3F16C63D62FC7A76906B
        326CFE7F1CE33DF6F9EFDF19F1DF77A10918A5009349FEB5950E8E499B80D7C7
        E278707680EB10F7E8CC187EF9803FF6B288FFD4ECB9CF9D024C26F9D7563A38
        AE305513106BE3F293633C273BC0150DAFF97F7471FCA7FD8FE7B288FF4E319E
        971DC09C29C064927F6DA583E3A8A9DE13F09A5820A76407B78AB82F2F8EE131
        87FCF13396EF07E038146032C9BFB6D2C1F15DA67826E0825820B7CE0E6C1571
        4F8647F03F7AC81F3F37E23F313B86395380C924FFDA4A07C755ACFB9980E169
        F06B2F76DE1DBF95E27E5C14C3F50EF9E31745FC37C88E61CE146032C9BFB6D2
        C1714CEB6C02BE150BE484C57637000AC484DC5F32C9BFB6D2C1715CEB7A39A0
        C24B000AC484DC5F32C9BFB6D2C1D1B48E67025E1D0BE4E1D981AC42819896FB
        4B26F9D7563A3846ADF24CC0F031C0A179F8607610AB5020A6E5FE9249FEB595
        0E8E7D396C13F0BA581C0FC99EFCAA148869B9BF64927F6DA58363DF8626E06D
        319EBCCF7FFF9EE5F7016CFD51C00AC4B4DC5F32C9BFB6D2C1712027C4627969
        8CC3A3FAE39D8AF7EDB85E1B8BE2B418BF913DE1755020A6E5FE9249FEB5950E
        8E433969CFD7E1DE72F9BF5DB0D8F9029CE1EB703F9E3DC1755220A6E5FE9249
        FEB5950E0EC62810D3727FC924FFDA4A070763148869B9BF64927F6DA5838331
        0AC4B4DC5F32C9BFB6D2C1C11805625AEE2F99E45F5BE9E0608C02312DF7974C
        F2AFAD74703046819896FB4B26F9D7563A3818A3404CCBFD2593FC6B2B1D1C8C
        5120A6E5FE9249FEB5950E0EC62810D3727FC924FFDA4A070763148869B9BF64
        927F6DA58383310AC4B4DC5F32C9BFB6D2C1C11805625AEE2F99E45F5BE9E060
        8C02312DF7974CF2AFAD74703046819896FB4B26F9D7563A3818A3404CCBFD25
        93FC6B2B1D1C8C5120A6E5FE9249FEB5950E0EC62810D3727FC924FFDA4A0707
        63148869B9BF64927F6DA58383310AC4B4DC5F32C9BFB6D2C1C11805625AEE2F
        99E45F5BE9E0608C02312DF7974CF2AFAD74703046819896FB4B26F9D7563A38
        18A3404CCBFD2593FC6B2B1D1C8C5120A6E5FE9249FEB5950E0EC62810D3727F
        C924FFDA4A070763148869B9BF64927F6DA58383310AC4B4DC5F32C9BFB6D2C1
        C11805625AEE2F99E45F5BE9E0608C02312DF7974CF2AFAD74703046819896FB
        4B26F9D7563A3818A3404CCBFD2593FC6B2B1D1C8C5120A6E5FE9249FEB5950E
        0EC62810D3727FC924FFDA4A070763148869B9BF64927F6DA58383310AC4B4DC
        5F32C9BFB6D2C1C11805625AEE2F99E45F5BE9E0608C02312DF7974CF2AFAD74
        703046819896FB4B26F9D7563A3818A3404CCBFD2593FC6B2B1D1C8C5120A6E5
        FE9249FEB5950E0EC62810D3727FC924FFDA4A070763148869B9BF64927F6DA5
        8383310AC4B4DC5F32C9BFB6D2C1C11805625AEE2F99E45F5BE9E0608C02312D
        F7974CF2AFAD74703046819896FB4B26F9D7563A3818A3404CCBFD2593FC6B2B
        1D1C8C5120A6E5FE9249FEB5950E0EC62810D3727FC924FFDA4A070763148869
        B9BF64927F6DA58383310AC4B4DC5F32C9BFB6D2C1C11805625AEE2F99E45F5B
        E9E0608C02312DF7974CF2AFAD74703046819896FB4B26F9D7563A3818A3404C
        CBFD2593FC6B2B1D1C8C5120A6E5FE9249FEB5950E0EC64481B824866B1DF6E7
        A340DC20868BB2E3982B05984CF2AFAD747030260AC49763F8DEC3FE7C14883B
        C4707E761C73A5009349FEB5950E0EC64481F84C0C3F78D89F8F02F1D8185E9C
        1DC75C29C064927F6DA58383315120DE16C33F5DE1579C1B45E2CE315E961DCB
        1C29C064927F6DA583833151208647EF8F59E577449178740C2FCF8E658E1460
        32C9BFB6D2C1C13E3C288AC41B57FC1D9746A1B85F8CFF3D3B98B95180C924FF
        DA4A0707FB709328127FB9587D2D0C4DC013623C73E1E580A31460129D10F9F7
        F5157EFE1B917FD7C90E624A1617DD8B22F18118EEB6A65F775E148DB3627C47
        5C17C47571767C99340024FAA1C8BF4FAFF0F35F8CFCFB81EC20A66471C16271
        6A148A97644F82ABD200B08287C4BA3E6B859F1F9AF93B660731258B0B168B1B
        47A1F85C8CD7CD9E08DF4D03C061C59A7E770C3FB6C2AF7867E4DF3DB3E39892
        C5058B2B8AC519313C367B1E7C370D0087F48058D36F5EF177BC30F2EFC9D981
        4CC9E2821D378B82F1A9856701664503C021DC31D6F29FC4F83DABFC92C8BD7F
        19C3AA4DC4AC595CF01D4F8EC2F1FCEC49F01D1A000EE83EB186FF7D8C375EF5
        1745EEDD22863FCF0E684A16177CC735A378BC3FC67F903D11766800D8A71363
        ED3E2BC607ACE9F77D2072EFE4ECA0A66671C177BB5D14920FC678FDEC89A001
        60D41D62BDFE4A8C3F17D7D5D7F54B23EF4E8DE165D9C14DCDE282ABFA99282A
        FF69B1C682C2E16800388EE111FF3363FC17715D6DCDBF7B38D4EBE631FE7576
        9053B3B8E0D84E8902F3AAEC49F44E03C0954CF288FF4A5E1179F7A8EC4037C1
        E282E31B9A80572C3C13904603C0D22636FEC170FCEF6D63FC4276C09B607141
        DB3F8FC2F3EF16DE13904203D0BD299FEA3F96E747CE3D253BE84DB1B860DC6D
        A308BD69E1D3011BA701E8D6A61EF1EF757EE4DB5D635CE50B84B68AC505FB73
        CDB81EBB7C3472BDECC9F44203D09D8C8D7F70C9F2637F1FCBBE019B6471C1C1
        DC340AD493623C65E1D4C0C96900BA71D29EA7FA37FD378F34BB7C58CFAFCDBE
        099B6671C1E10C278D3D288AD6BF89F1EE0B6B69121A80F2B21EF11FB57CCDBF
        CB13402D2E58DDF7C7758F2864FF28C6DBC775EBB8BE6FB1F352C1B5B227B7CD
        340065653EE2DFEBD722C79E997D33B2585CC064A2C85FBECACF6B00CA497FC4
        BF34BCE6FFE845874FFBEF65710193D100B0349747FC83CF475E3D30C673B26F
        4AB6EC3F04509806A07BC357F33E39C69F5F6CE673FC2DDF8CEBCCC8A95F8DF1
        C2EC1B3307161730190D40B74E5A7E3BDFCF2CE6B1CFBC2572E989317E327B22
        7332873F0C509406A03B737AC43F383B72E81931BE3F7B227364710193D10074
        C3C6BF852C2E60321A80F26CFC5BCCE20226A30128CBC65F80C5054C460350CE
        1C37FEA7C7F881EC896C238B0B988C06A00C1B7F41161730190DC0D6B3F11766
        710193D1006C2D1B7F072C2E60321A80AD63E3EF88C5054C4603B0356CFC1DB2
        B880C9680066CFC6DF318B0B988C0660B6EEB8FC76BEE15BF1E6708F6DFC09E6
        F087078AD200CC8E8D9FA3E6900040511A80D93831FE16C3D7E0DAF8396A0E89
        0014A5014867E3E7B8E6901040511A8034367E46CD213180A234001B67E367DF
        E6902040511A808DB1F17360734814A0280DC0E46CFC1CDA1C1206284A033099
        396EFC4F8BF19CEC89B07F73481CA0280DC0DAD9F8599B392410509406606D6C
        FCACDD1C1209284A03B0321B3F93994342014569000ECDC6CFE4E6905840511A
        8003B3F1B331734830A0280DC0BED9F8D9B839241A50940660948D9F34734838
        A0280DC071D9F8493787C4038AD2005C858D9FD9984302024569008E3A29EEC5
        3316367E66640E890814A501B0F1335F734848A0A88E1B001B3FB33787C4048A
        EAB001B0F1B335E690A040511D3500367EB6CE1C121528AA8306C0C6CFD69A43
        C20245156E006CFC6CBD39242E5054C106C0C64F19734860A0A8420D808D9F72
        E690C84051051A80396EFC4F8DF183D91361FBCD21A181A2B6B801B0F153DE1C
        121B286A0B1B001B3FDD98438203456D510360E3A73B734874A0A82D68006CFC
        746B0E090F1435E306C0C64FF7E690F84051336C006CFCB0348705001435A306
        E04E3197A72F6CFC70D41C160250D40C1A001B3F1CC71C16045054620360E387
        117358184051090D808D1FF6690E0B04286A830D808D1F0E680E0B05286A030D
        808D1F0E690E0B06286AC206C0C60F2B9AC3C2018A9AA001B0F1C39ACC610101
        45ADB10198D3C63FC4F49698DBB363FC50F25CE0D0B2171250D81A1A803BDBF8
        611AD90B0A286CD50660268618FE3036FEE7C4F8B1ECC9C0BA680080C96C7903
        E0113FA5690080C96C690360E3A70B1A0060325BD600D8F8E98A060098CC9634
        00367EBAA401002633F306C0C64FD73400C06466DA00D8F861A101002634B306
        C0C60F7B680080C9CCA401B0F1C331680080C9243700367E68D0000093496A00
        6CFCB00F1A0060321B6E006CFC70001A0060321B6A006CFC70081A006032D100
        FC6D0C379CE8D7EF6EFCCF8AF1C3D9B1C2B6D10000938906E0A331DC69CDBFD6
        C60F6BA0010026130DC019313C764DBFCEC60F6BA40100A674FB6802CE5FAC56
        6B868DFFBFC4C6FFDC183F9E1D1054A1010026150DC0EFC4F0F843FCA847FC30
        210D0030B56B4513F0D618EFB9CF7FFFEDB8FE2036FEE7C4F889ECC943551A00
        6013AE194DC0E9313E6A71FCBA336CFCBB4FF5DBF861621A006093EE1C8DC029
        31DE23AE5BC675495C17C4F5B6D8F85F1FE3A7B22708BDD000004087340000D0
        210D000074480300001DD200004087340000D0210D000074480300001DD20000
        4087340000D0210D000074480300001DD200004087340000D0210D0000744803
        00001DD200004087340000D0210D000074480300001DD200004087340000D021
        0D000074480300001DD200004087340000D0210D000074480300001DD2000040
        87340000D0210D000074480300001DD200004087340000D0210D000074480300
        001DD200004087340000D0210D000074480300001DD200004087340000D0210D
        000074480300001DD200004087340000D0210D000074480300001DD200004087
        340000D0210D000074480300001DD200004087340000D0210D00007448030000
        1DFAFFD01FFE1E60B6E11C0000000049454E44AE426082}
      Proportional = True
      OnClick = iButtonLeaveClick
    end
    object lblButton1: TLabel
      Left = 68
      Top = 16
      Width = 56
      Height = 30
      Caption = 'Menu'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblButton2: TLabel
      Left = 88
      Top = 104
      Width = 48
      Height = 30
      Caption = 'Lojas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = iButton2Click
    end
    object lblButton3: TLabel
      Left = 88
      Top = 182
      Width = 76
      Height = 30
      Caption = 'Pedidos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = iButton3Click
    end
    object lblButton4: TLabel
      Left = 88
      Top = 265
      Width = 48
      Height = 30
      Caption = 'Perfil'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = iButton4Click
    end
    object iCarrinho: TImage
      Left = 17
      Top = 336
      Width = 54
      Height = 49
      Center = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000002000000
        02000806000000F478D4FA000000097048597300000B1300000B1301009A9C18
        000000B46558496649492A000800000006001201030001000000010000001A01
        050001000000560000001B010500010000005E00000028010300010000000200
        0000130203000100000001000000698704000100000066000000000000004800
        0000010000004800000001000000060000900700040000003032313001910700
        040000000102030000A00700040000003031303001A0030001000000FFFF0000
        02A00400010000000002000003A00400010000000002000000000000915FF1DA
        00001DB54944415478DAEDDD09B02D757D27F006049710590224EE18C7155076
        4445D1299394662A226E18C0278B53333551232A68644F54D4C4499C9A14204B
        4490B88095929A311A171695C5802C8EA626F2A2E202E8A066120D03CCEF5FFD
        4EF978BC7BEFB9E79E3EBFEEFE7F3E55DF7A8894FC6E7BFB9EEF3DA77FDD5B34
        004075B6C81E0000583C0500002AA400004085140000A89002000015520000A0
        420A000054480100800A29000050210500002AA400004085140000A890020000
        15520000A0420A000054480100800A29000050210500002AA400004085140000
        A89002000015520000A0420A000054480100800A29000050210500002AA40000
        4085140000A89002000015520000A0420A000054480100800A29000050210500
        002AA400004085140000A89002000015520000A0420A000054480100800A2900
        0050210500002AA400004085140000A89002000015520000A0420A0000546835
        05E0E19117475E10794664D7C8F691ADB3BF880DFE25F2F3C8ED916F47D6476E
        8C5C1BB921F26FD90302405F4C53009E14393EF2AAC8C3B2079E5129079F8D7C
        2AF289C88FB30702804CCB158087464E8FBC21F2A0EC41E7A8BC4BF0C9C85F46
        2ECF1E0600322C55009E18B924B27BF6801DBB32725AE433D98300C0226DAE00
        EC15F97464E7ECE116E8B2C89B22FF903D08002CC2A605A0FCE67F5553D78BFF
        C42F222745DE17B9377B1800E8D2C605A07CE67F4D33FEB7FD5752AE0B28173C
        7E3F7B1000E8CAC605A0FCE67B5CF6403D715BE490A65D210480D1991480B2EA
        774B33AEABFDD7EA5F238746FE47F62000306F9302704EE4A8EC617AA8DC3CA8
        7C1C7069F62000304FA500943BFC95CFBB877A939FAEDD1DF9DDC8DF660F0200
        F3520AC061918BB207E9B99F460E6ADA5B0B03C0E095027076E498EC4106E01F
        23FB447E923D0800AC55290065F56FBFEC4106A2DC1DF1D0EC210060AD4A01B8
        23B253F62003F2FB8D8F4C0018B85200CA1DF0B6C91E6440EE8C3CAD698B1300
        0C9202309B0F445E9F3D0400CCCA4700B329F707784AE4D6EC41006016A5005C
        1DD93F7B9001FA60E4D8EC21006016A5009CD578219B45B955F0639BF69A0000
        18945200CAAD6E3F923DC8409D1039237B080058AD5200B68DFC20F22BD9C30C
        D04D91A7670F0100AB35791850F93CFBE8EC6106AAAC04FEAFEC210060352605
        E0894DFB38E0ADB3071AA07744FE247B0800588D2D36FAEBF744DE923DD0005D
        15794EF61000B01A1B178087443E1F7966F65003734F6497C88FB3070180696D
        B1C97FFE8DA67D38D063B2071B9857463E9A3D04004C6B8BCDFCBD7255FB6591
        47670F3720E7475E9B3D04004C6B8B25FEFECE918F479E9B3DE0409435CA4746
        EECB1E0400A6B1C532FFDD83236F8F1CD7B847C034F689FC7DF61000308D2DA6
        F867CA750127458E6C1481E55807046030A6290013E58E812F8E3C3FB267E4F1
        91ED1B8F129EB8327250F61000308DD514803E2BA5E473C9335807046030C652
        00CA1D0CEF886C973CC72B221FCB3E1800B092B11480E292C821C9339C17392A
        FB4000C04AC654008E8D9C953C8375400006614C05A0BCF07EB7075FD35E911B
        B20F06002C27FBC572DEBED6B47732CC54EE9DF0AEEC030100CB195B017877E4
        F8E419AE68DC4111809E1B5B01785EE40BC933580704A0F7C656001ED4B4EB80
        DB27CFF1F2A67D960200F4D2D80A4051F6F05F963CC3B991A3B30F04002C658C
        05A0ECE19F933CC3F7238F6AAC0302D053632C00E5E145DFEBC1D7661D1080DE
        CA7E91EC4A792CEF5EC933580704A0B7C65A00CA6379DF9E3C837540007A6BAC
        05E0394DFB029CE9FF45768EDC957D30006053632D005B457E18F9B5E439AC03
        02D04B632D00C5C5915726CF601D10805E1A7301784DE4FCE419AC0302D04B63
        2E00E5F3F7F278DE2D93E7D8B3691F520400BD31E602505C1BD9377986B735ED
        438A00A037C65E004E8B9C983CC3E54DFB902200E88DB1178003235F4A9EC13A
        2000BD33F602503EFF2FD701EC9C3C477938D127B20F06004C8CBD001417465E
        9D3C437938D131D9070200266A280087472E489EC13A2000BD524301D8A969EF
        0A98BD0EF88CC88DD90703008A1A0A40F195C801C9339C103923FB400040514B
        013839724AF20C5F8C1C9C7D2000A0A8A500EC1FB93A7986B20E583E8EF849F6
        C100805A0A40F9FCBF5C88B74BF21C87462EC93E1800504B01283E1439227986
        0F468ECD3E1000505301382C7251F20CDF8D3CB6B10E0840B29A0AC00E913B22
        5B25CFF1F4C84DD9070380BAD554008AAB22CF4A9EE1F8C87BB20F040075ABAD
        00BC23727AF20C5F883C3FFB400050B7DA0AC03E91EB9267B8BB691F4E641D10
        8034B51580F2F5DE167944F21C2F8D5C9A7D3000A8576D05A0382FB22E7986B3
        23AFCB3E1000D4ABC602F08AC85F27CF601D108054351680ED9A761D70EBE439
        F688DC9C7D3000A8538D05A0B83C7250F20C6F8DBC37FB400050A75A0BC0DB22
        EF4C9EE1F39117641F0800EA546B01D833727DF20CD6010148536B01285FF777
        228F4A9EE390C827B30F0600F5A9B50014E5C97C4727CF7056E43F661F0800EA
        5373013834F2F1E419CA3AE063B20F0400F5A9B9003C3C726793BF0EB87BE496
        EC8301405D6A2E0045B912FFE0E419AC0302B070B51780F2E27B46F6100074AE
        DC79F5AEC8F79AF65DD72B239F8ADC9A3D5896DA0B4079FBFDA6EC210048F3B9
        C8FB9BB60C54A5F602507CBB71211E40EDCA47C2FF39F28DEC41164501689A33
        1B4FE603A069FE6FE43F452EC81E64111480A67949E4D2EC2100E88D726DD809
        D943744D01689A6D9B761DF0C1D98300D01BAF8F7C207B882E2900ADCF46FE7D
        F61000F4C63D91DF8EFC5DF6205D51005AC745DE973D0400BDF24F913D223FCB
        1EA40B0A40EB698DBBF101F040A7454ECE1EA20B0AC02F959B41EC9A3D0400BD
        F2D3C8E39AF62642A3A200FCD27F6FDAF50F00D858796AEB59D943CC9B02F04B
        FF21F237D94300D03BE526412FC81E62DE14805FFA95A65D077C48F62000F4CA
        CF233B6CF873341480FBFB74E4B7B28700A077F68E5C9F3DC43C2900F7F7C6A6
        7D2804006CECA5CDC8EE1AAB00DCDF939B8A1E0401C0D4D645FE2A7B88795200
        1EE87F479E903D0400BD7274E4DCEC21E6490178A072EFE7FF923D0400BDF27B
        CDC836C51480077A51E4B2EC2100E8957D227F9F3DC43C29000FF4D0A65D077C
        58F62000F4C22F22DB6DF873341480CDFB4AE480EC2100E8852B2307650F316F
        0AC0E6BD37F2E6EC2100E8857744FE247B8879530036AFDCF271B4CF80066055
        46F7F97FA1006CDE364D7B1DC0AF660F0240AADB238F88DC9B3DC8BC29004B2B
        777C7A49F61000A42A37FF59973D44171480A5BD2E7266F61000A47A55E4AFB3
        87E88202B0B44747BE933D040069EE89FC7AE447D98374410158DECD91DDB287
        0020C55591E7640FD115056079D60101EA35CAF5BF09056079D60101EA35CAF5
        BF090560795B47EE68DA5B4002508FD1AEFF4D28002BB30E08509FD1AEFF4D28
        002BB30E08509FD1AEFF4D28002B2BEB80DF6E1C2B805A8C7AFD6FC28BDA746E
        8AEC9E3D04000B31EAF5BF0905603AEF89BC257B08001662D4EB7F130AC0749E
        1FF95CF610002CC4A8D7FF261480E9580704A8C3E8D7FF261480E95D1239247B
        08003A35FAF5BF0905607AC746CECA1E02804E8D7EFD6F4201989E75408071AB
        62FD6FC28BD9EA58070418AF2AD6FF261480D53923F2D6EC2100E84415EB7F13
        0AC0EA1C1CF97CF6100074A28AF5BF09056075AC03028C5335EB7F130AC0EA59
        0704189F6AD6FF261480D5B30E08303ED5ACFF4D2800AB671D10605CAA5AFF9B
        F022369B1B237B640F01C05C54B5FE37A100CCC63A20C07854B5FE37A100CCE6
        E0C63A20C05854B5FE37A100CCC63A20C03854B7FE37A100CCEE139197660F01
        C09A54B7FE37A100CCEE98C8D9D94300B026D5ADFF4D2800B37B64E4BB8D6308
        305455AEFF4D78F15A9BAF459E9E3D040033A972FD6F4201589B77478ECF1E02
        809954B9FE37A100ACCDF3225FC81E02809954B9FE37A100ACCD83227736D601
        0186A6DAF5BF090560EDAC03020C4FB5EB7F130AC0DA590704189E6AD7FF2614
        80B52B6F21DDD63896004351F5FADF8417ADF9B00E08301C55AFFF4D2800F361
        1D106038AA5EFF9B5000E6C33A20C07054BDFE37A100CC4759072C4F07DC3E7B
        10009655FDFADF8402303F1F8F1C9A3D0400CBAA7EFD6F4201989FA3231FCC1E
        02806555BFFE37A100CC8F7540807EB3FEB7112F56F37543E419D94300B059D6
        FF36A200CCD7BB2227640F01C06659FFDB8802305FCF8D7C317B080036CBFADF
        461480F9B20E08D04FD6FF36A100CCDFC7222FCB1E0280FBB1FEB7090560FE8E
        8A9C933D0400F763FD6F130AC0FC590704E817EB7F9BE145AA1BD60101FAC3FA
        DF662800DDB00E08D01FD6FF364301E886754080FEB0FEB7190A4037AC0302F4
        83F5BF252800DDB10E0890CFFADF121480EE580704C867FD6F090A4077AC0302
        E4B2FEB70C2F4EDDBA3EB267F6100095B2FEB70C05A05BEF8CBC2D7B08804A59
        FF5B8602D0AD832297670F015029EB7FCB5000BAB555D3AEA0EC983D084065AC
        FFAD4001E8DE47232FCF1E02A032D6FF56A00074EFB59173B38700A88CF5BF15
        2800DDFB8DC8F71AC71A6051ACFF4DC18BD262580704581CEB7F53500016A3AC
        A1BC3D7B08804A58FF9B8202B018A5895E913D044025ACFF4D4101580CEB8000
        8B61FD6F4A0AC0E2580704E89EF5BF2929008B631D10A07BD6FFA6A4002C8E75
        40806E59FF5B052F468B552E4AD92B7B088091B2FEB70A0AC062590704E88EF5
        BF55500016CB3A204077ACFFAD8202B058D60101BA61FD6F951480C52B57A7BE
        227B088091B1FEB74A0AC0E2AD8B9C973D04C0C858FF5B250560F1AC0302CC97
        F5BF197811CAF1D5C8DED943008C84F5BF19280039FE38F247D943008C84F5BF
        192800399E1DB9327B088091B0FE3703052087754080F9B0FE372305208F7540
        80B5B3FE37230520CFBAC63A20C05A59FF9B910290C73A20C0DA58FF5B032F3E
        B9AC0302CCCEFADF1A2800B9AC0302CCCEFADF1A2800B9AC0302CCCEFADF1A28
        00B9CA3AE00F23BF963D08C0C058FF5B230520DFC59157660F013030D6FFD648
        01C8F79AC8F9D943000C8CF5BF355200F2ED12F97E64CBEC410006C2FADF1C28
        00FD705DD35ECC02C0CAACFFCD8102D00FA737ED3A0B002BB3FE37070A403F3C
        AB691B2D002BB3FE37070A403F580704988EF5BF395100FAE3234D7B552B004B
        B3FE37270A407F1CD9B4DFD8002CCDFADF9C2800FDB173E4078D754080A558FF
        9B2305A05FAC03022CCDFADF1C2900FD621D106069D6FFE64801E817EB80004B
        B3FE37470A40BF580704D83CEB7F73A600F48F75408007B2FE37670A40FF5807
        047820EB7F73A600F48F754080FBB3FED70105A09FAE8DEC9B3D04404F58FFEB
        8002D04FA7454ECC1E02A027ACFF754001E8A703235FCA1E02A027ACFF754001
        E827EB8000AD724DD42323F7650F32360A407F5D14392C7B088064D6FF3AA200
        F4D711910F650F0190CCFA5F471480FEB20E08D4CEFA5F8714807EB30E08D4CC
        FA5F8714807E3B357252F6100049ACFF754801E8B76746BE9C3D044012EB7F1D
        5200FACD3A20502BEB7F1D5300FACF3A205023EB7F1D5300FACF3A205023EB7F
        1D5300FACF3A20501BEB7F0BA0000CC33591FDB287005810EB7F0BA0000C8375
        40A026D6FF1640011806EB80404DACFF2D8002300CE5F3FFEF4776C91E04A063
        D6FF164401188E0B23AFCE1E02A063D6FF164401188EC32317640F01D031EB7F
        0BA2000CC74E4D7B5740EB80C05859FF5B20056058AC03026366FD6F81148061
        39257272F610001DB1FEB7400AC0B01C10F94AF610001DB1FEB7400AC0B05807
        04C6CAFADF822900C3631D101823EB7F0BA6000C8F7540608CACFF2D9802303C
        D60181B1B1FE97400118A6AB23FB670F013027D6FF122800C3744A631D10180F
        EB7F09148061B20E088C89F5BF040AC030590704C6C2FA5F120560B83E1CF9FD
        EC2100D6C8FA5F120560B8CA8BFF87B387005823EB7F491480E1B20E080C9DF5
        BF440AC0B0950B010FC81E026046D6FF122900C35656014FC91E026046D6FF12
        2900C3566E067475F6100033B2FE9748011836EB80C05059FF4BA6000C5F7930
        D0E1D94300AC92F5BF640AC0F09547035F983D04C02A59FF4BA6000C5F59072C
        6FA56D953D08C094ACFFF58002300ED6018121B1FED7030AC03858070486C4FA
        5F0F2800E3601D101812EB7F3DA0008C8375406028ACFFF58402301ED6018121
        B0FED7130AC07858070486C0FA5F4F2800E3B163E4F6C63A20D05FD6FF7A4401
        18972F479E993D04C012ACFFF58802302E27454ECD1E026009D6FF7A44011897
        FD22D7640F01B004EB7F3DA2008C8B7540A0AFACFFF58C02303E1F8A1C913D04
        C026ACFFF58C02303E87452ECA1E026013D6FF7A4601181FEB8040DF58FFEB21
        05609CAC03027D62FDAF87148071B20E08F489F5BF1E5200C669DFC8B5D94300
        6C60FDAF871480712AEB80DF6BDACFDC003259FFEB290560BCAC03027D60FDAF
        A71480F1B20E08F481F5BF9E5200C6CB3A2090CDFA5F8F2900E3F6A5C881D943
        00D5B2FED7630AC0B89D18392D7B08A05AD6FF7A4C011837EB804026EB7F3DA6
        008C9B7540208BF5BF9E5300C6AFACE01C993D04501DEB7F3DA7008C5F59C1F9
        48F6104075ACFFF59C02307E3B44EE68AC03028B63FD6F0014803A58070416C9
        FADF00280075B00E082C92F5BF015000EA505671AECB1E02A886F5BF015000EA
        50FE7FFE4EE451D98300A3775BE4318DF5BFDE5300EAF15F236FC81E0218BDF7
        47DE943D042B5300EAF1ECC895D94300A3572E38FE4AF610AC4C01A847F9FF7A
        7DE4B1D98300A3553E6A7C5CE3EDFF415000EA727AD35E9D0BD0855322A7660F
        C1741480BA94FB72AF8F6C9D3D08303A77471EDFB4170132000A407D2E8EBC32
        7B0860742E8C1C9E3D04D35300EA532ED0F952F610C0E81C10B9267B08A6A700
        D4E9B2C88BB2870046E36F22BF973D04ABA300D4698FC80D912DB3070106EFDE
        C8DE91AF650FC2EA2800F5BA287258F610C0E07D28F29AEC21583D05A05E6557
        F7E6C8B6D9830083F5B3C8D322DFCD1E84D55300EAF6C6A6BD6D27C02CFE20F2
        DFB28760360A40DDCA3500E5F6C007660F020C4EB9E2FF59917BB20761360A00
        BB47AE8E3C2C7B106030FE25B27FE496EC41989D02407174E483D9430083F1DA
        C8F9D943B0360A0013E745D6650F01F4DE399163B28760ED140026CA47005734
        ED3E2FC0E65C1B795EE45FB30761ED140036B673E4AAC813B307017AE75B4D7B
        D1DF0FB307613E140036F584A67D56C02ED98300BD7167E4D9917FC81E84F951
        00D89C7D239F8EEC983D0890EE4791DF8E7C357B10E64B016029E5EE5E9F8D3C
        227B10204D79BBFFB72237660FC2FC29002CE7A991CF441E953D08B070DF89BC
        30F2CDEC41E88602C04A1E19B9B4696FFA01D4E1FAC84B22DFCE1E84EE28004C
        E3C191331B4FFC821A5C1C39AAB1EA377A0A00ABF1FAC8199187640F02CC5D79
        C13F3EF281EC41580C0580D52AD7055C10D9277B10606ECA457E47342EF6AB8A
        02C02CB68EFC51E4AD9187660F03CCACFCD6FFEEC8BB2277670FC3622900ACC5
        A323EF6CDADF1C8061F954D37EAC776BF620E450009887E7474E8D1C943D08B0
        A22F464EDEF02715530098A7E734ED45442F6E7C6F41DF94E77C9417FEBFCB1E
        847EF0439A2EEC16393A7278D33E6008C8717BD35EB47B6EE4EBD9C3D02F0A00
        5DDA26F2BB914323BFD378B6002C42B9777F7996C7279AF673FE7FCB1E887E52
        005894AD2207366D11287F96070E3D3C7B2818819F46AE8B7C39F23F37FC794F
        F650F49F0240962D234F89EC19797C64D70D29CF1D28371ADABE69570CDD7488
        9AFDBC6957F5EEDAF0D7B745D66FC8B7223734EDBDFAEFCD1E94E1510000A042
        0A000054480100800A29000050210500002AA400004085140000A89002000015
        520000A0420A000054480100800A29000050210500002AA400004085140000A8
        9002000015520000A0420A000054480100800A29000050210500002AA4000040
        85140000A89002000015520000A0420A000054480100800A2900005021050000
        2AA400004085140000A890020000155200E8DA2E91E746768B3C25F2A4C80E91
        ED23DB6EF867FE397257E4FF44BE19F946E496C81591DBB3BF0048E4FCA1330A
        005DD82F7258E4854DFB836BD6EFB3FB9AF607D9DF463E12B92EFB0B830570FE
        B0100A00F3F2F0C8EB2247459EDAD1BFE3EB91F32267467E96FD05C31C397F58
        380580B5DA31F286C81F34ED5B938B50DEEAFC8BC89F6FF86B182AE70F691400
        6655BE778E88BC2FB273D20C3F8E9C16F940E4DEEC0302ABE0FC219D02C02CFE
        5DE4AF22CFCA1E6483AB22AF89FC63F6203005E70FBDA000B05A8744CE6DDAAB
        90FBA47CA6593E43BD387B105886F387DE500098D696913F8DBC317B9015FC59
        E42D8DB734E917E70FBDA300308D6D22E737ED6AD2105C145917B93B7B10689C
        3FF49402C04ACA0FAF4B232FCA1E64952E6BDAB75BFD102393F387DE5200584E
        F9FE383F7264F620332A373F39BCF17626399C3FF49A02C072DEDFF4FF33CB95
        9435ABB7640F41959C3FF49A02C0525E1EF968F61073F2EAA6FD6D0616C5F943
        EF29006CCE13225F8D6C973DC89CFC24B277E45BD9835005E70F83A000B0A9F2
        3D7165D39F9B94CC4B7932DAF39AF60129D015E70F83A100B0A9632267670FD1
        91754D7B0736E88AF387C15000D858793049799EF84ED98374A43C1BFDC94DFB
        EC749837E70F83A200B0B1F2609013B387E8D8C91BBE4E9837E70F83A2003051
        9E47BEBE59DC2349B39427A0EDDA781E3AF3E5FC6170140026DE1C796FF6100B
        725CD3DEF31CE6C5F9C3E028004CDC14D93D7B8805F97A64B7EC211815E70F83
        A30050EC17B9267B88052B7BCDD7670FC128387F18240580A2BC9DF787D9432C
        985B9C322FCE1F064901A0B8B9A9EF2DBD1B227B650FC128387F182405805D22
        3F68EAFB5EB86FC3D77E67F6200C9AF387C1AAED9B96077A59E463D943243934
        7249F6100C9AF387C1520038A5696FEE51A39322A7670FC1A09DD2387F182805
        80F298CF57650F91E4C2C8E1D9433068CE1F064B01E0BAC83ED94324B936B27F
        F6100C9AF387C15200581F795CF610496E8DFC66F6100CDAFAC6F9C3402900FC
        A8699F6256A37205F3CED9433068CE1F064B01E017916DB28748FCDA1F923D04
        83E6FC61B01400FC0083D9397F182C05006F61C2EC9C3F0C9602C0FAC6454C30
        ABF58DF387815200B0C604B373FE30580A0017450ECB1E22C9872347640FC1A0
        397F182C0580721BD353B287487262E48FB38760D09C3F0C96024079A0C7C7B3
        8748F2D2C8A5D9433068CE1F064B01A0D6C799DE1BF9F5C6E34C591BE70F8355
        DB372D9B775364F7EC2116ECFAC8DED943300ACE1F064901A0F8B3C81F660FB1
        60EF8DBC357B0846C1F9C320290014FB36ED4A4F4DF68ADC903D04A3E0FC6190
        1400266A7A1BF3EB91DDB28760549C3F0C8E02C0C49B9BF66DBD1A1CD7B46FDB
        C2BC387F181C0580895F8DFC536487EC413AF6E3C8AE919F650FC2A8387F181C
        05808D9D1A39297B888E95AFEFF4EC211825E70F83A200B0B1F2DBCB379BF13E
        E1EB879127477E923D08A3E4FC61501400367554E49CEC213A7264E482EC2118
        35E70F83A100B0A9F23D7145E4D9D983CCD9E5918323F7650FC2A8397F180C05
        80CD7942E4AB91EDB2079993BB9AF691ADDFCA1E842A387F18040580A5BC2CF2
        B1EC21E6A43CB0E592EC21A88AF387DE530058CE9F46DE943DC41ABD27727CF6
        1054C9F943AF29002CA77C7F9C1B59973DC88C2E8A1CD1B44F2E834573FED06B
        0A002BD93AF2C9C88BB20759A54F35EDF3CAEFCE1E84AA397FE82D0580693C28
        7266D3AE380DC18737CCEA87177DE0FCA1971400A655BE57CAE7816FCE1E6419
        6545A9DC8FFD84C6BA12FDE2FCA177140056EB254DFBB966DFEE79FED3C8B191
        8F660F02CB70FED01B0A00B3F8CDC8F99183B207D9A0DCA4645DE4D6EC41600A
        CE1F7A41016056E57BA75C215CDE32DC256986F264B2B745CE6EBC65C9B0387F
        48A700B056DB475E1F794364C705FD3B7F14F9F3C85F341E4CC2B0397F48A300
        302FDB465ED7B4570FEFD6D1BFE3E6A6FDFCB4FCC6F2CFD95F30CC91F3878553
        00E8C25E9157475E18D923B2E58CFF3BE5062437463ED3B43725B921FB0B8305
        70FEB0100A005DDB29F2DCC8D3224F8D3CA969DFEA2C6F7D6EBBE19F29BF8D94
        078E94CF24CBF3D4BF11B9A5699FAA7667F61700899C3F74460100800A290000
        50210500002AA400004085140000A89002000015520000A0420A000054480100
        800A29000050210500002AA400004085140000A89002000015520000A0420A00
        0054480100800A29000050210500002AA400004085140000A890020000155200
        00A0420A000054480100800A29000050210500002AA400004085140000A89002
        000015520000A0420A000054480100800A29000050210500002AA40000408514
        0000A89002000015520000A0420A000054480100800A29000050210500002AA4
        00004085140000A89002000015520000A0420A000054E8FF0311D37E3DC96A69
        AA0000000049454E44AE426082}
      Proportional = True
      OnClick = iCarrinhoClick
    end
    object lblButton5: TLabel
      Left = 88
      Top = 345
      Width = 83
      Height = 30
      Caption = 'Carrinho'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = iCarrinhoClick
    end
    object lblQuantidadeCarrinho: TLabel
      Left = 177
      Top = 345
      Width = 38
      Height = 30
      Caption = '( 0 )'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblSair: TLabel
      Left = 80
      Top = 593
      Width = 36
      Height = 30
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = iButtonLeaveClick
    end
  end
end
