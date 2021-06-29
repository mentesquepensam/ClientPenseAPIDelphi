object Main: TMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cliente Pense API'
  ClientHeight = 522
  ClientWidth = 476
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    AlignWithMargins = True
    Left = 8
    Top = 8
    Width = 460
    Height = 506
    Hint = 'Abrir Qr Code no navegador'
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    ActivePage = TSConfiguracoes
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 3
    ExplicitTop = 3
    object TSConfiguracoes: TTabSheet
      Caption = 'Configura'#231#245'es'
      object GBServidor: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 446
        Height = 430
        Align = alTop
        Caption = 'Servidor'
        TabOrder = 0
        ExplicitTop = 0
        object LBBaseURLConfiguracao: TLabel
          Left = 44
          Top = 23
          Width = 49
          Height = 13
          Caption = 'Base URL:'
        end
        object LBClientIDConfiguracao: TLabel
          Left = 48
          Top = 53
          Width = 45
          Height = 13
          Caption = 'Client ID:'
        end
        object LBAccessKeyConfiguracao: TLabel
          Left = 38
          Top = 83
          Width = 55
          Height = 13
          Caption = 'AccessKey:'
        end
        object LBAPITokenConfiguracao: TLabel
          Left = 40
          Top = 112
          Width = 53
          Height = 13
          Caption = 'API Token:'
        end
        object BTAutenticarClienteConfiguracao: TButton
          Left = 352
          Top = 107
          Width = 69
          Height = 25
          Caption = 'Conectar'
          TabOrder = 4
          OnClick = BTAutenticarClienteConfiguracaoClick
        end
        object MMApiTokenConfiguracao: TMemo
          Left = 99
          Top = 107
          Width = 247
          Height = 288
          ReadOnly = True
          TabOrder = 3
        end
        object MEBaseURLConfiguracao: TEdit
          Left = 99
          Top = 23
          Width = 322
          Height = 21
          TabOrder = 0
          Text = 'http://54.207.251.35:5000'
        end
        object MEClientIDConfiguracao: TEdit
          Left = 99
          Top = 50
          Width = 322
          Height = 21
          TabOrder = 1
        end
        object MEAccessKeyConfiguracao: TEdit
          Left = 99
          Top = 80
          Width = 322
          Height = 21
          TabOrder = 2
        end
      end
    end
    object TSCadastros: TTabSheet
      Caption = 'Cadastros'
      Enabled = False
      ImageIndex = 2
      object GBLoja: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 446
        Height = 246
        Align = alTop
        Caption = 'Loja'
        TabOrder = 0
        object LBNomeLoja: TLabel
          Left = 62
          Top = 32
          Width = 31
          Height = 13
          Caption = 'Nome:'
        end
        object LBIdentificadorLoja: TLabel
          Left = 28
          Top = 63
          Width = 65
          Height = 13
          Caption = 'Identificador:'
        end
        object LBLatitudeLoja: TLabel
          Left = 50
          Top = 182
          Width = 43
          Height = 13
          Caption = 'Latitude:'
        end
        object LBLongitudeLoja: TLabel
          Left = 42
          Top = 209
          Width = 51
          Height = 13
          Caption = 'Longitude:'
        end
        object LBLogradouroLoja: TLabel
          Left = 34
          Top = 93
          Width = 59
          Height = 13
          Caption = 'Logradouro:'
        end
        object LBCidadeLoja: TLabel
          Left = 56
          Top = 147
          Width = 37
          Height = 13
          Caption = 'Cidade:'
        end
        object LBNomeEstadoLoja: TLabel
          Left = 227
          Top = 147
          Width = 67
          Height = 13
          Caption = 'Nome Estado:'
        end
        object LBNumeroLoja: TLabel
          Left = 52
          Top = 120
          Width = 41
          Height = 13
          Caption = 'Numero:'
        end
        object LBReferenciaLoja: TLabel
          Left = 178
          Top = 120
          Width = 56
          Height = 13
          Caption = 'Referencia:'
        end
        object BTEnviarLoja: TButton
          Left = 346
          Top = 204
          Width = 75
          Height = 25
          Caption = 'Enviar'
          TabOrder = 9
          OnClick = BTEnviarLojaClick
        end
        object MENomeLoja: TEdit
          Left = 99
          Top = 29
          Width = 322
          Height = 21
          TabOrder = 0
        end
        object MEIdentificadorLoja: TEdit
          Left = 99
          Top = 56
          Width = 322
          Height = 21
          TabOrder = 1
        end
        object MELogradouroLoja: TEdit
          Left = 99
          Top = 90
          Width = 322
          Height = 21
          TabOrder = 2
        end
        object MERefernciaLoja: TEdit
          Left = 240
          Top = 117
          Width = 181
          Height = 21
          TabOrder = 4
        end
        object MENomeEstadoLoja: TEdit
          Left = 300
          Top = 144
          Width = 121
          Height = 21
          TabOrder = 6
        end
        object MECidadeLoja: TEdit
          Left = 99
          Top = 144
          Width = 121
          Height = 21
          TabOrder = 5
        end
        object MENumeroLoja: TEdit
          Left = 99
          Top = 117
          Width = 62
          Height = 21
          NumbersOnly = True
          TabOrder = 3
        end
        object MELatitude: TSpinEdit
          Left = 99
          Top = 179
          Width = 226
          Height = 22
          MaxValue = 180
          MinValue = -180
          TabOrder = 7
          Value = 0
        end
        object MELongitude: TSpinEdit
          Left = 99
          Top = 206
          Width = 226
          Height = 22
          MaxValue = 180
          MinValue = -180
          TabOrder = 8
          Value = 0
        end
      end
      object GBTerminal: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 255
        Width = 446
        Height = 154
        Align = alTop
        Caption = 'Terminal'
        TabOrder = 1
        object LBTerminalNome: TLabel
          Left = 65
          Top = 28
          Width = 31
          Height = 13
          Caption = 'Nome:'
        end
        object LBTerminalIdentificador: TLabel
          Left = 31
          Top = 63
          Width = 65
          Height = 13
          Caption = 'Identificador:'
        end
        object LBTerminalIdentificadorLoja: TLabel
          Left = 8
          Top = 95
          Width = 88
          Height = 13
          Caption = 'Identificador Loja:'
        end
        object BTEnviarTerminal: TButton
          Left = 349
          Top = 118
          Width = 75
          Height = 25
          Caption = 'Enviar'
          TabOrder = 3
          OnClick = BTEnviarTerminalClick
        end
        object METerminalNome: TEdit
          Left = 102
          Top = 25
          Width = 322
          Height = 21
          TabOrder = 0
        end
        object METerminalIdentificador: TEdit
          Left = 102
          Top = 60
          Width = 322
          Height = 21
          TabOrder = 1
        end
        object METerminalIdentificadorLoja: TEdit
          Left = 102
          Top = 92
          Width = 322
          Height = 21
          TabOrder = 2
        end
      end
    end
    object TSPagamentosDigitais: TTabSheet
      Caption = 'Pagamentos Digitais'
      Enabled = False
      ImageIndex = 2
      object GBRequisicaoPagamento: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 446
        Height = 308
        Align = alTop
        Caption = 'Requisi'#231#227'o Pagamento'
        TabOrder = 0
        object LBCodigoTerminalPagamento: TLabel
          Left = 292
          Top = 64
          Width = 80
          Height = 13
          Caption = 'C'#243'digo Terminal:'
        end
        object LBDescricaoPagamento: TLabel
          Left = 69
          Top = 32
          Width = 50
          Height = 13
          Caption = 'Descri'#231#227'o:'
        end
        object LBCodigoLojaPagamento: TLabel
          Left = 178
          Top = 64
          Width = 60
          Height = 13
          Caption = 'C'#243'digo Loja:'
        end
        object LBCodigoPagamentoERP: TLabel
          Left = 3
          Top = 64
          Width = 116
          Height = 13
          Caption = 'Codigo Pagamento ERP:'
        end
        object LBValorPagamento: TLabel
          Left = 90
          Top = 274
          Width = 28
          Height = 13
          Caption = 'Valor:'
        end
        object LBCarteiraDigitalPagamento: TLabel
          Left = 43
          Top = 244
          Width = 75
          Height = 13
          Caption = 'Carteira Digital:'
        end
        object CBCarteiraDigitalPagamento: TComboBox
          Left = 124
          Top = 241
          Width = 145
          Height = 21
          Style = csDropDownList
          TabOrder = 5
        end
        object BTListarCarteiras: TButton
          Left = 311
          Top = 238
          Width = 105
          Height = 28
          Caption = 'Listar Carteiras'
          TabOrder = 6
          OnClick = BTListarCarteirasClick
        end
        object GBItensPagamento: TGroupBox
          Left = 69
          Top = 88
          Width = 347
          Height = 134
          Caption = 'Itens Pagamento'
          TabOrder = 4
          object LBDescricaoItemPagamento: TLabel
            Left = 30
            Top = 24
            Width = 50
            Height = 13
            Caption = 'Descri'#231#227'o:'
          end
          object LBValorItemPagamento: TLabel
            Left = 172
            Top = 51
            Width = 28
            Height = 13
            Caption = 'Valor:'
          end
          object LBQuantidadeItemPagamento: TLabel
            Left = 20
            Top = 51
            Width = 60
            Height = 13
            Caption = 'Quantidade:'
          end
          object LBTotalItensPagamento: TLabel
            Left = 26
            Top = 106
            Width = 83
            Height = 13
            Caption = 'Valor Total Itens:'
          end
          object BTAdicionarItemPagamento: TButton
            Left = 120
            Top = 75
            Width = 103
            Height = 22
            Caption = 'Adicionar Item'
            TabOrder = 2
            OnClick = BTAdicionarItemPagamentoClick
          end
          object BTLimparItensPagamento: TButton
            Left = 269
            Top = 106
            Width = 75
            Height = 25
            Caption = 'Limpar Itens'
            TabOrder = 4
            OnClick = BTLimparItensPagamentoClick
          end
          object MEQuantidadeItemPagamento: TSpinEdit
            Left = 86
            Top = 48
            Width = 58
            Height = 22
            MaxValue = 10000000
            MinValue = 0
            TabOrder = 0
            Value = 0
          end
          object MEValorItemPagamento: TSpinEdit
            Left = 207
            Top = 48
            Width = 83
            Height = 22
            MaxValue = 10000000
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
          object METotalItensPagamento: TSpinEdit
            Left = 115
            Top = 103
            Width = 118
            Height = 22
            MaxValue = 10000000
            MinValue = 0
            ReadOnly = True
            TabOrder = 3
            Value = 0
          end
          object MEDescricaoItemPagamento: TEdit
            Left = 86
            Top = 21
            Width = 203
            Height = 21
            TabOrder = 5
          end
        end
        object BTEnviarPagamento: TButton
          Left = 311
          Top = 268
          Width = 105
          Height = 28
          Caption = 'Enviar Pagamento'
          TabOrder = 8
          OnClick = BTEnviarPagamentoClick
        end
        object MEDescricaoPagamento: TEdit
          Left = 125
          Top = 29
          Width = 291
          Height = 21
          TabOrder = 0
        end
        object MECodigoPagamentoERP: TEdit
          Left = 125
          Top = 61
          Width = 39
          Height = 21
          TabOrder = 1
        end
        object MECodigoLojaPagamento: TEdit
          Left = 244
          Top = 61
          Width = 39
          Height = 21
          TabOrder = 2
        end
        object MECodigoTerminalPagamento: TEdit
          Left = 378
          Top = 61
          Width = 39
          Height = 21
          TabOrder = 3
        end
        object MEValorPagamento: TSpinEdit
          Left = 124
          Top = 271
          Width = 145
          Height = 22
          MaxValue = 10000000
          MinValue = 0
          TabOrder = 7
          Value = 0
        end
      end
      object GBRespotaPagamento: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 317
        Width = 446
        Height = 316
        Align = alTop
        Caption = 'Resposta Pagamento'
        TabOrder = 1
        object LBCodigoPagamentoAPIRespostaPagamento: TLabel
          Left = 5
          Top = 30
          Width = 114
          Height = 13
          Caption = 'C'#243'digo Pagamento API:'
        end
        object LBQrCodeURLRespostaPagamento: TLabel
          Left = 49
          Top = 57
          Width = 69
          Height = 13
          Caption = 'URL QR Code:'
        end
        object LBUltimaAtualizacaoPagamentoResposta: TLabel
          Left = 28
          Top = 92
          Width = 91
          Height = 13
          Caption = 'Ultima Atualiza'#231#227'o:'
        end
        object LBStatusPagamentoRepostaPagamento: TLabel
          Left = 253
          Top = 92
          Width = 107
          Height = 13
          Caption = 'Status do Pagamento:'
        end
        object LBUltimaAtualizacaoPagamentoRespostaData: TLabel
          Left = 125
          Top = 92
          Width = 3
          Height = 13
        end
        object LBCodigoPagamentoRespostaPagamento: TLabel
          Left = 220
          Top = 30
          Width = 116
          Height = 13
          Caption = 'Codigo Pagamento ERP:'
        end
        object MEStatusPagamentoRespostaPagamento: TEdit
          Left = 366
          Top = 89
          Width = 51
          Height = 21
          ReadOnly = True
          TabOrder = 4
        end
        object BTAtualizarStatusRespostaPagamento: TBitBtn
          Left = 178
          Top = 128
          Width = 117
          Height = 25
          Caption = 'Atualizar Status'
          Kind = bkRetry
          NumGlyphs = 2
          TabOrder = 5
          OnClick = BTAtualizarStatusRespostaPagamentoClick
        end
        object BTAbrirQRCodeRespostaPagamentosNavegador: TBitBtn
          AlignWithMargins = True
          Left = 392
          Top = 54
          Width = 26
          Height = 21
          Hint = 'Abrir Qr Code no navegador'
          Margins.Top = 0
          Margins.Bottom = 0
          Glyph.Data = {
            42040000424D4204000000000000420000002800000010000000100000000100
            20000300000000040000130B0000130B000000000000000000000000FF0000FF
            0000FF000000000000000000000000000010000000C8000000FC000000F90000
            00FA000000CF0000002D00000000000000000000000000000000000000000000
            0000000000000000000000000000000000010000003800000048000000470000
            0050000000CF0000008500000000000000000000000000000000000000000000
            000000000000000000220000006F000000840000008000000080000000750000
            0014000000A400000098000000180000007B0000008400000084000000840000
            007000000022000000C3000000D9000000B9000000B9000000BA000000AB0000
            0021000000A50000009700000023000000AE000000BA000000B9000000B90000
            00D9000000C3000000FA00000056000000020000000600000006000000030000
            0000000000A70000009900000000000000040000000600000006000000020000
            0056000000FA000000F90000004A000000000000000000000000000000210000
            0031000000A600000099000000320000001D0000000000000000000000000000
            004A000000F9000000F90000004B000000000000000000000000000000720000
            00D8000000D5000000D1000000DA000000650000000000000000000000000000
            004B000000F9000000F90000004B000000000000000000000000000000120000
            009D000000FF000000FE000000930000000E0000000000000000000000000000
            004B000000F9000000F90000004B000000000000000000000000000000000000
            00100000009A000000910000000C000000000000000000000000000000000000
            004B000000F9000000F800000049000000000000000000000000000000000000
            0000000000080000000600000000000000000000000000000000000000000000
            0049000000F8000000F9000000610000001B0000001F0000001F0000001F0000
            001F0000001E0000001E0000001F0000001F0000001F0000001F0000001B0000
            0061000000F9000000FE000000E5000000D8000000DA000000D9000000D90000
            00DB000000DB000000DB000000DB000000DB000000DB000000DB000000DA0000
            00E5000000FE000000FA00000080000000640000005A00000061000000610000
            004B0000004B0000004B0000004B0000004B0000004B0000004B000000480000
            0080000000FA000000F90000004900000087000000490000006A0000006E0000
            0000000000000000000000000000000000000000000000000000000000000000
            0045000000F9000000EE00000090000000640000005900000060000000600000
            004A0000004B0000004B0000004B0000004B0000004B0000004B000000480000
            0090000000EE0000007F000000EE000000F7000000F8000000F7000000F70000
            00F9000000F9000000F9000000F9000000F9000000F9000000F9000000F90000
            00EE0000007F}
          TabOrder = 3
          TabStop = False
          OnClick = BTAbrirQRCodeRespostaPagamentosNavegadorClick
        end
        object MECodigoPagamentoAPIRespostaPagamento: TEdit
          Left = 125
          Top = 27
          Width = 76
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object MECodigoPagamentoERPRespostaPagamento: TEdit
          Left = 342
          Top = 27
          Width = 76
          Height = 21
          ReadOnly = True
          TabOrder = 1
        end
        object MEQrCodeURLRespostaPagamento: TEdit
          Left = 124
          Top = 54
          Width = 261
          Height = 21
          ReadOnly = True
          TabOrder = 2
        end
      end
    end
    object TSConsultaPagamentos: TTabSheet
      Caption = 'Consulta de Pagamentos'
      Enabled = False
      ImageIndex = 3
      object GBConsultarPagamento: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 446
        Height = 150
        Align = alTop
        Caption = 'Consultar Pagamento'
        TabOrder = 0
        object LBCodigoPagamentoAPIConsultaPagamentos: TLabel
          Left = 5
          Top = 30
          Width = 114
          Height = 13
          Caption = 'C'#243'digo Pagamento API:'
        end
        object LBURLQrCodeConsultaPagamentos: TLabel
          Left = 49
          Top = 59
          Width = 69
          Height = 13
          Caption = 'URL QR Code:'
        end
        object LBUltimaAtualizacaoConsultaPagamentos: TLabel
          Left = 28
          Top = 92
          Width = 91
          Height = 13
          Caption = 'Ultima Atualiza'#231#227'o:'
        end
        object LBStatusPagamentoConsultaPagamentos: TLabel
          Left = 245
          Top = 92
          Width = 107
          Height = 13
          Caption = 'Status do Pagamento:'
        end
        object LBUltimaAtualizacaoDataConsultaPagamentos: TLabel
          Left = 125
          Top = 92
          Width = 3
          Height = 13
        end
        object LBCodigoPagamentoERPConsultaPagamentos: TLabel
          Left = 244
          Top = 30
          Width = 116
          Height = 13
          Caption = 'Codigo Pagamento ERP:'
        end
        object BTConsultarPagamentoCodigoAPI: TBitBtn
          AlignWithMargins = True
          Left = 180
          Top = 23
          Width = 26
          Height = 28
          Hint = 'Consultar pagamento utilizando o c'#243'digo do pagamento da API'
          Margins.Top = 0
          Margins.Bottom = 0
          Glyph.Data = {
            F6040000424DF604000000000000360000002800000015000000130000000100
            180000000000C004000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            E3CEB7776D7C7B6A6CDEC5ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            7C6C6F537EB4546EB07A6969DCC3AAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            A8D9FF4CAFFF3C85DF546EB0726A76DDC5ACFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            E4F3FFA8D9FF4CAFFF3C85DF546EB07A6969E5D2BFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFE4F3FFA8D9FF4CAFFF3C85DF636E93726B79FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFE4F3FFA8D9FF4CAFFF4879C7726D7DB5A391D9C5BCC8AA9DBE9A
            8AC8AA9DD9C5BCEFE7E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFE4F3FFA8D9FF726E7E9F876D876D51E2BA98F3D6AAFDF2
            C1F3EAC1E2D1B2C6A699E7D9D4FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB39F8D8D7256F0C69BFFDBA9FFEDBBFFFD
            CEFFFFE1FFFFEBF0E7CDC4A498EFE6E2FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7C1BADFC59CFFD4A1FFDDABFFF0BFFFFF
            D3FFFFEBFFFFFEFFFFEBE0CFB0D7C1BAFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3A399F0DCA6FFD4A1FFDBA9FFEDBBFFFD
            CEFFFFE1FFFFEBFFFFE1F2E9C0C3A399FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB68F83FBEBADFED8A1FFD6A4FFE4B2FFF4
            C2FFFDCEFFFFD3FFFDCEFDF2C0B68F83FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC09F97F0DBA6FEF3D4FFD4A1FFD9A7FFE4
            B2FFEDBBFFF0BFFFEDBBF1D4A9C09F97FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3BCB6DCC199FEF6D7FFF7E9FFD4A1FFD6
            A4FFDBA9FFDDABFFDBA9DDB494D3BCB6FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE2E0BB9891F5EBD1FFFDF5FEF3D4FED8
            A1FFD4A1FFD4A1EDC299BB9891ECE2E0FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D2D0BA9790DABF98EFDAA5FBEB
            ADEFDAA5DABF98BA9790E2D2D0FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBE1E0D0B8B5BB9893AE84
            7EBB9893D0B8B5EBE1E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
          TabOrder = 1
          TabStop = False
          OnClick = BTConsultarPagamentoCodigoAPIClick
        end
        object BTConsultarPagamentoCodigoERP: TBitBtn
          AlignWithMargins = True
          Left = 415
          Top = 23
          Width = 26
          Height = 28
          Hint = 'Consultar pagamento utilizando o c'#243'digo do pagamento ERP'
          Margins.Top = 0
          Margins.Bottom = 0
          Glyph.Data = {
            F6040000424DF604000000000000360000002800000015000000130000000100
            180000000000C004000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            E3CEB7776D7C7B6A6CDEC5ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            7C6C6F537EB4546EB07A6969DCC3AAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            A8D9FF4CAFFF3C85DF546EB0726A76DDC5ACFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            E4F3FFA8D9FF4CAFFF3C85DF546EB07A6969E5D2BFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFE4F3FFA8D9FF4CAFFF3C85DF636E93726B79FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFE4F3FFA8D9FF4CAFFF4879C7726D7DB5A391D9C5BCC8AA9DBE9A
            8AC8AA9DD9C5BCEFE7E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFE4F3FFA8D9FF726E7E9F876D876D51E2BA98F3D6AAFDF2
            C1F3EAC1E2D1B2C6A699E7D9D4FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB39F8D8D7256F0C69BFFDBA9FFEDBBFFFD
            CEFFFFE1FFFFEBF0E7CDC4A498EFE6E2FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7C1BADFC59CFFD4A1FFDDABFFF0BFFFFF
            D3FFFFEBFFFFFEFFFFEBE0CFB0D7C1BAFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3A399F0DCA6FFD4A1FFDBA9FFEDBBFFFD
            CEFFFFE1FFFFEBFFFFE1F2E9C0C3A399FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB68F83FBEBADFED8A1FFD6A4FFE4B2FFF4
            C2FFFDCEFFFFD3FFFDCEFDF2C0B68F83FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC09F97F0DBA6FEF3D4FFD4A1FFD9A7FFE4
            B2FFEDBBFFF0BFFFEDBBF1D4A9C09F97FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3BCB6DCC199FEF6D7FFF7E9FFD4A1FFD6
            A4FFDBA9FFDDABFFDBA9DDB494D3BCB6FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE2E0BB9891F5EBD1FFFDF5FEF3D4FED8
            A1FFD4A1FFD4A1EDC299BB9891ECE2E0FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D2D0BA9790DABF98EFDAA5FBEB
            ADEFDAA5DABF98BA9790E2D2D0FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBE1E0D0B8B5BB9893AE84
            7EBB9893D0B8B5EBE1E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
          TabOrder = 4
          TabStop = False
          OnClick = BTConsultarPagamentoCodigoERPClick
        end
        object BTAbrirQRCodeConsultaPagamentosNavegador: TBitBtn
          AlignWithMargins = True
          Left = 415
          Top = 56
          Width = 26
          Height = 21
          Hint = 'Abrir Qr Code no navegador'
          Margins.Top = 0
          Margins.Bottom = 0
          Glyph.Data = {
            42040000424D4204000000000000420000002800000010000000100000000100
            20000300000000040000130B0000130B000000000000000000000000FF0000FF
            0000FF000000000000000000000000000010000000C8000000FC000000F90000
            00FA000000CF0000002D00000000000000000000000000000000000000000000
            0000000000000000000000000000000000010000003800000048000000470000
            0050000000CF0000008500000000000000000000000000000000000000000000
            000000000000000000220000006F000000840000008000000080000000750000
            0014000000A400000098000000180000007B0000008400000084000000840000
            007000000022000000C3000000D9000000B9000000B9000000BA000000AB0000
            0021000000A50000009700000023000000AE000000BA000000B9000000B90000
            00D9000000C3000000FA00000056000000020000000600000006000000030000
            0000000000A70000009900000000000000040000000600000006000000020000
            0056000000FA000000F90000004A000000000000000000000000000000210000
            0031000000A600000099000000320000001D0000000000000000000000000000
            004A000000F9000000F90000004B000000000000000000000000000000720000
            00D8000000D5000000D1000000DA000000650000000000000000000000000000
            004B000000F9000000F90000004B000000000000000000000000000000120000
            009D000000FF000000FE000000930000000E0000000000000000000000000000
            004B000000F9000000F90000004B000000000000000000000000000000000000
            00100000009A000000910000000C000000000000000000000000000000000000
            004B000000F9000000F800000049000000000000000000000000000000000000
            0000000000080000000600000000000000000000000000000000000000000000
            0049000000F8000000F9000000610000001B0000001F0000001F0000001F0000
            001F0000001E0000001E0000001F0000001F0000001F0000001F0000001B0000
            0061000000F9000000FE000000E5000000D8000000DA000000D9000000D90000
            00DB000000DB000000DB000000DB000000DB000000DB000000DB000000DA0000
            00E5000000FE000000FA00000080000000640000005A00000061000000610000
            004B0000004B0000004B0000004B0000004B0000004B0000004B000000480000
            0080000000FA000000F90000004900000087000000490000006A0000006E0000
            0000000000000000000000000000000000000000000000000000000000000000
            0045000000F9000000EE00000090000000640000005900000060000000600000
            004A0000004B0000004B0000004B0000004B0000004B0000004B000000480000
            0090000000EE0000007F000000EE000000F7000000F8000000F7000000F70000
            00F9000000F9000000F9000000F9000000F9000000F9000000F9000000F90000
            00EE0000007F}
          TabOrder = 5
          TabStop = False
          OnClick = BTAbrirQRCodeConsultaPagamentosNavegadorClick
        end
        object BTDeletarPagamento: TBitBtn
          AlignWithMargins = True
          Left = 210
          Top = 23
          Width = 28
          Height = 29
          Hint = 'Deletar Pagamento'
          Margins.Top = 0
          Margins.Bottom = 0
          Cancel = True
          Glyph.Data = {
            42090000424D4209000000000000420000002800000018000000180000000100
            20000300000000090000B1000000B100000000000000000000000000FF0000FF
            0000FF0000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000232BAA24252AAB8B242BAAB6242BAAA8242CA95C0055AA030000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000232CAA57242BAAF8242BAAFF242BAAFF242BAAFF242BAAFF242CAAC12B2B
            AA0C000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000002B32
            BD422D37BFFC535AC9FF9DA1DCFF2F38BFFF525AC9FF9B9ED8FF262DABFF242B
            AA9C000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000002F3A
            C6CA3440D2FFA0A5E4FFF2F2F2FFB6B9E8FFE5E6F0FFE5E6F0FF434ABCFF242B
            AAFA2030AF10000000000000000000000000D5D5D506D8D8D83BD6D6D644D6D6
            D644D6D6D644D6D6D644D6D6D644D6D6D644D6D6D644D6D6D644D6D6D644343F
            CAF03440D2FF3641D2FFB5B9E8FFF2F2F2FFEFEFF1FF5A64D8FF2A33B9FF242B
            AAFF252AAC37000000000000000000000000D6D6D6BBD6D6D6FFD6D6D6FFD6D6
            D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FF424C
            C9FF3440D2FF5962D8FFE5E6F0FFEFEFF1FFF2F2F2FFA9AEE6FF2C35BAFF242B
            AAFF262DAC28000000000000000000000000E1E1E1FEDEDEDEFFC9C9C9FFC9C9
            C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFD5D5D5FF7178
            CBFF3440D2FFA0A5E4FFE5E6F0FF5A64D8FFA9AEE6FFE5E6F0FF444CC0FF3138
            ADED0000FF01DBDBDB07D6D6D6BAD6D6D6FEF2F2F2FFEFEFEFFFD4D4D4FFD4D4
            D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFE2E2E2FFDEDE
            E2FF3944CAFF3641D2FF4D57D6FF3440D2FF3641D2FF4D57D6FF2C34BAFF8689
            C2A400000000D7D7D73AD6D6D6FFD6D6D6FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2
            F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2
            F2FFA7A7B6FF4B55CDFF3440D1FF3440D2FF3440D2FF3540CCFF8E92CBFFD5D5
            D58000000000D7D7D740D6D6D6FFD6D6D6FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2
            F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2
            F2FFCDCDCDFFF0F0F0FFD8DAEBFFA6AADFFFB2B5D9FFD3D3D6FFD6D6D6FFD5D5
            D58000000000D7D7D740D6D6D6FFD6D6D6FFF2F2F2FFF2F2F2FFE5EDF2FFC3DE
            F2FFCEE4F4FFC3DEF2FFE5EDF2FFF2F2F2FFDFDFDFFFBFBFBFFFBFBFBFFFBFBF
            BFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFDBDBDBFFC1C1C1FFD6D6D6FFD5D5
            D58000000000D7D7D740D6D6D6FFD6D6D6FFF2F2F2FFF2F2F2FF70C4F1FF61C0
            F1FFD7EFFCFF4FB5F1FF79BEF3FFF2F2F2FFECECECFFDFDFDFFFDFDFDFFFDFDF
            DFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDBDBDBFFCFCFCFFFD6D6D6FFD5D5
            D58000000000D7D7D740D6D6D6FFD6D6D6FFF2F2F2FFF2F2F2FF65C8EFFF9FE0
            F5FFE4F6FCFF61CCEEFF71BBF3FFF2F2F2FFDFDFDFFFBFBFBFFFBFBFBFFFBFBF
            BFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBABABAFFC1C1C1FFD6D6D6FFD5D5
            D58000000000CDCDCD4CC8C8C8FFC8C8C8FFF2F2F2FFF2F2F2FF65C8EFFF61CC
            EEFFE4F6FCFF9FE0F5FF71BBF3FFF2F2F2FFDFDFDFFFBFBFBFFFBFBFBFFFBFBF
            BFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBABABAFFC1C1C1FFD6D6D6FFD5D5
            D58000000000B6B6B670A1A1A1FFA1A1A1FFF2F2F2FFF2F2F2FF69C7EFFF61CC
            EEFFDAF3FBFF6DD0EFFF79BEF3FFF2F2F2FFECECECFFDFDFDFFFDFDFDFFFDFDF
            DFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFD4D4D4FFCFCFCFFFD6D6D6FFD5D5
            D58000000000B6B6B670A1A1A1FFA1A1A1FFF2F2F2FFF2F2F2FFDBEAF2FFA9D9
            F0FFB9E0F3FFA9D9F0FFE5EDF2FFF2F2F2FFDFDFDFFFBFBFBFFFBFBFBFFFBFBF
            BFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBABABAFFC1C1C1FFD6D6D6FFD5D5
            D58000000000D7D7D740D6D6D6FFD6D6D6FFEEEEEEFFF2F2F2FFF2F2F2FFF2F2
            F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2
            F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFE4E4E4FFD6D6D6FFD6D6D6FFD5D5
            D55B00000000D7D7D740D6D6D6FFD6D6D6FFDADADAFFE3E3E3FFE3E3E3FFE3E3
            E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3
            E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFDDDDDDFFD7D7D799D5D5D55CFFFF
            FF0200000000D5D5D530D6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6
            D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6
            D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD4D4D42F000000000000
            00000000000000000000D6D6D67CD6D6D6BBD6D6D6BBD6D6D6BBD6D6D6BBD6D6
            D6BBD6D6D6BBD6D6D6BBD6D6D6BBD6D6D6BBD6D6D6BBD6D6D6BBD6D6D6BBD6D6
            D6BBD6D6D6BBD6D6D6BBD6D6D6BBD6D6D6BBD6D6D67B00000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000}
          ModalResult = 7
          TabOrder = 2
          TabStop = False
          OnClick = BTDeletarPagamentoClick
        end
        object MECodigoPagamentoAPIConsultaPagamentos: TEdit
          Left = 125
          Top = 27
          Width = 52
          Height = 21
          TabOrder = 0
        end
        object MECodigoPagamentoERPConsultaPagamentos: TEdit
          Left = 361
          Top = 27
          Width = 48
          Height = 21
          TabOrder = 3
        end
        object MEQRCodeConsultaPagamentos: TEdit
          Left = 125
          Top = 55
          Width = 284
          Height = 21
          ReadOnly = True
          TabOrder = 6
        end
        object MEStatusPagamentoConsultaPagamentos: TEdit
          Left = 358
          Top = 89
          Width = 51
          Height = 21
          ReadOnly = True
          TabOrder = 7
        end
      end
      object GbQrCode: TGroupBox
        Left = 3
        Top = 159
        Width = 446
        Height = 307
        Caption = 'Exibe GbQrCode Tela'
        TabOrder = 1
        object PnlQrCode: TPanel
          Left = 107
          Top = 42
          Width = 252
          Height = 252
          TabOrder = 0
          object WebBrowserQrCode: TWebBrowser
            Left = 1
            Top = 1
            Width = 250
            Height = 250
            TabOrder = 0
            OnDocumentComplete = WebBrowserQrCodeDocumentComplete
            ControlData = {
              4C000000D7190000D71900000000000000000000000000000000000000000000
              000000004C000000000000000000000001000000E0D057007335CF11AE690800
              2B2E126208000000000000004C0000000114020000000000C000000000000046
              8000000000000000000000000000000000000000000000000000000000000000
              00000000000000000100000000000000000000000000000000000000}
          end
        end
        object BtExibeQrCode: TBitBtn
          AlignWithMargins = True
          Left = 112
          Top = 11
          Width = 107
          Height = 28
          Hint = 'Exibe o QrCode'
          Margins.Top = 0
          Margins.Bottom = 0
          Caption = 'Exibe o QrCode'
          Glyph.Data = {
            42040000424D4204000000000000420000002800000010000000100000000100
            20000300000000040000130B0000130B000000000000000000000000FF0000FF
            0000FF000000000000000000000000000010000000C8000000FC000000F90000
            00FA000000CF0000002D00000000000000000000000000000000000000000000
            0000000000000000000000000000000000010000003800000048000000470000
            0050000000CF0000008500000000000000000000000000000000000000000000
            000000000000000000220000006F000000840000008000000080000000750000
            0014000000A400000098000000180000007B0000008400000084000000840000
            007000000022000000C3000000D9000000B9000000B9000000BA000000AB0000
            0021000000A50000009700000023000000AE000000BA000000B9000000B90000
            00D9000000C3000000FA00000056000000020000000600000006000000030000
            0000000000A70000009900000000000000040000000600000006000000020000
            0056000000FA000000F90000004A000000000000000000000000000000210000
            0031000000A600000099000000320000001D0000000000000000000000000000
            004A000000F9000000F90000004B000000000000000000000000000000720000
            00D8000000D5000000D1000000DA000000650000000000000000000000000000
            004B000000F9000000F90000004B000000000000000000000000000000120000
            009D000000FF000000FE000000930000000E0000000000000000000000000000
            004B000000F9000000F90000004B000000000000000000000000000000000000
            00100000009A000000910000000C000000000000000000000000000000000000
            004B000000F9000000F800000049000000000000000000000000000000000000
            0000000000080000000600000000000000000000000000000000000000000000
            0049000000F8000000F9000000610000001B0000001F0000001F0000001F0000
            001F0000001E0000001E0000001F0000001F0000001F0000001F0000001B0000
            0061000000F9000000FE000000E5000000D8000000DA000000D9000000D90000
            00DB000000DB000000DB000000DB000000DB000000DB000000DB000000DA0000
            00E5000000FE000000FA00000080000000640000005A00000061000000610000
            004B0000004B0000004B0000004B0000004B0000004B0000004B000000480000
            0080000000FA000000F90000004900000087000000490000006A0000006E0000
            0000000000000000000000000000000000000000000000000000000000000000
            0045000000F9000000EE00000090000000640000005900000060000000600000
            004A0000004B0000004B0000004B0000004B0000004B0000004B000000480000
            0090000000EE0000007F000000EE000000F7000000F8000000F7000000F70000
            00F9000000F9000000F9000000F9000000F9000000F9000000F9000000F90000
            00EE0000007F}
          TabOrder = 1
          TabStop = False
          OnClick = BtExibeQrCodeClick
        end
        object BtLimpaQrcodeTela: TBitBtn
          AlignWithMargins = True
          Left = 244
          Top = 11
          Width = 105
          Height = 28
          Hint = 'Limpa Qr Code da tela'
          Margins.Top = 0
          Margins.Bottom = 0
          Cancel = True
          Caption = 'Limpa QrCode'
          Glyph.Data = {
            42090000424D4209000000000000420000002800000018000000180000000100
            20000300000000090000B1000000B100000000000000000000000000FF0000FF
            0000FF0000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000232BAA24252AAB8B242BAAB6242BAAA8242CA95C0055AA030000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000232CAA57242BAAF8242BAAFF242BAAFF242BAAFF242BAAFF242CAAC12B2B
            AA0C000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000002B32
            BD422D37BFFC535AC9FF9DA1DCFF2F38BFFF525AC9FF9B9ED8FF262DABFF242B
            AA9C000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000002F3A
            C6CA3440D2FFA0A5E4FFF2F2F2FFB6B9E8FFE5E6F0FFE5E6F0FF434ABCFF242B
            AAFA2030AF10000000000000000000000000D5D5D506D8D8D83BD6D6D644D6D6
            D644D6D6D644D6D6D644D6D6D644D6D6D644D6D6D644D6D6D644D6D6D644343F
            CAF03440D2FF3641D2FFB5B9E8FFF2F2F2FFEFEFF1FF5A64D8FF2A33B9FF242B
            AAFF252AAC37000000000000000000000000D6D6D6BBD6D6D6FFD6D6D6FFD6D6
            D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FF424C
            C9FF3440D2FF5962D8FFE5E6F0FFEFEFF1FFF2F2F2FFA9AEE6FF2C35BAFF242B
            AAFF262DAC28000000000000000000000000E1E1E1FEDEDEDEFFC9C9C9FFC9C9
            C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFD5D5D5FF7178
            CBFF3440D2FFA0A5E4FFE5E6F0FF5A64D8FFA9AEE6FFE5E6F0FF444CC0FF3138
            ADED0000FF01DBDBDB07D6D6D6BAD6D6D6FEF2F2F2FFEFEFEFFFD4D4D4FFD4D4
            D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFE2E2E2FFDEDE
            E2FF3944CAFF3641D2FF4D57D6FF3440D2FF3641D2FF4D57D6FF2C34BAFF8689
            C2A400000000D7D7D73AD6D6D6FFD6D6D6FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2
            F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2
            F2FFA7A7B6FF4B55CDFF3440D1FF3440D2FF3440D2FF3540CCFF8E92CBFFD5D5
            D58000000000D7D7D740D6D6D6FFD6D6D6FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2
            F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2
            F2FFCDCDCDFFF0F0F0FFD8DAEBFFA6AADFFFB2B5D9FFD3D3D6FFD6D6D6FFD5D5
            D58000000000D7D7D740D6D6D6FFD6D6D6FFF2F2F2FFF2F2F2FFE5EDF2FFC3DE
            F2FFCEE4F4FFC3DEF2FFE5EDF2FFF2F2F2FFDFDFDFFFBFBFBFFFBFBFBFFFBFBF
            BFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFDBDBDBFFC1C1C1FFD6D6D6FFD5D5
            D58000000000D7D7D740D6D6D6FFD6D6D6FFF2F2F2FFF2F2F2FF70C4F1FF61C0
            F1FFD7EFFCFF4FB5F1FF79BEF3FFF2F2F2FFECECECFFDFDFDFFFDFDFDFFFDFDF
            DFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDBDBDBFFCFCFCFFFD6D6D6FFD5D5
            D58000000000D7D7D740D6D6D6FFD6D6D6FFF2F2F2FFF2F2F2FF65C8EFFF9FE0
            F5FFE4F6FCFF61CCEEFF71BBF3FFF2F2F2FFDFDFDFFFBFBFBFFFBFBFBFFFBFBF
            BFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBABABAFFC1C1C1FFD6D6D6FFD5D5
            D58000000000CDCDCD4CC8C8C8FFC8C8C8FFF2F2F2FFF2F2F2FF65C8EFFF61CC
            EEFFE4F6FCFF9FE0F5FF71BBF3FFF2F2F2FFDFDFDFFFBFBFBFFFBFBFBFFFBFBF
            BFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBABABAFFC1C1C1FFD6D6D6FFD5D5
            D58000000000B6B6B670A1A1A1FFA1A1A1FFF2F2F2FFF2F2F2FF69C7EFFF61CC
            EEFFDAF3FBFF6DD0EFFF79BEF3FFF2F2F2FFECECECFFDFDFDFFFDFDFDFFFDFDF
            DFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFD4D4D4FFCFCFCFFFD6D6D6FFD5D5
            D58000000000B6B6B670A1A1A1FFA1A1A1FFF2F2F2FFF2F2F2FFDBEAF2FFA9D9
            F0FFB9E0F3FFA9D9F0FFE5EDF2FFF2F2F2FFDFDFDFFFBFBFBFFFBFBFBFFFBFBF
            BFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBABABAFFC1C1C1FFD6D6D6FFD5D5
            D58000000000D7D7D740D6D6D6FFD6D6D6FFEEEEEEFFF2F2F2FFF2F2F2FFF2F2
            F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2
            F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFE4E4E4FFD6D6D6FFD6D6D6FFD5D5
            D55B00000000D7D7D740D6D6D6FFD6D6D6FFDADADAFFE3E3E3FFE3E3E3FFE3E3
            E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3
            E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFDDDDDDFFD7D7D799D5D5D55CFFFF
            FF0200000000D5D5D530D6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6
            D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6
            D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD4D4D42F000000000000
            00000000000000000000D6D6D67CD6D6D6BBD6D6D6BBD6D6D6BBD6D6D6BBD6D6
            D6BBD6D6D6BBD6D6D6BBD6D6D6BBD6D6D6BBD6D6D6BBD6D6D6BBD6D6D6BBD6D6
            D6BBD6D6D6BBD6D6D6BBD6D6D6BBD6D6D6BBD6D6D67B00000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000}
          ModalResult = 7
          TabOrder = 2
          TabStop = False
          OnClick = BtLimpaQrcodeTelaClick
        end
      end
    end
  end
end
