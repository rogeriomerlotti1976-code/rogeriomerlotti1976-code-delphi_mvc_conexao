object FrmLogin: TFrmLogin
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'RMSYS - Login'
  ClientHeight = 565
  ClientWidth = 990
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 17
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 990
    Height = 565
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 409
      Height = 565
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object pnlLogo: TShape
        Left = 48
        Top = 40
        Width = 28
        Height = 28
        Brush.Color = 12000086
        Pen.Style = psClear
        Shape = stRoundRect
      end
      object lblLogoLetra: TLabel
        Left = 48
        Top = 46
        Width = 28
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'R'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblMarca: TLabel
        Left = 84
        Top = 46
        Width = 42
        Height = 17
        Caption = 'RMSYS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5774125
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTitulo: TLabel
        Left = 48
        Top = 100
        Width = 311
        Height = 36
        Caption = 'Bem-vindo de volta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12000086
        Font.Height = -24
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSubtitulo: TLabel
        Left = 48
        Top = 140
        Width = 311
        Height = 17
        Caption = 'Entre com sua conta para continuar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7892590
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblUsuario: TLabel
        Left = 48
        Top = 186
        Width = 46
        Height = 17
        Caption = 'Usu'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5774125
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSenha: TLabel
        Left = 48
        Top = 258
        Width = 37
        Height = 17
        Caption = 'Senha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5774125
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblEsqueceu: TLabel
        Left = 242
        Top = 328
        Width = 117
        Height = 15
        Caption = 'Esqueceu sua senha?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12000086
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Cursor = crHandPoint
      end
      object lblRodape: TLabel
        Left = 48
        Top = 456
        Width = 311
        Height = 32
        Alignment = taCenter
        AutoSize = False
        Caption = 
          'Acesso restrito. Problemas para entrar? Contate o administrado' +
          'r.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7892590
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object pnlUsuario: TPanel
        Left = 48
        Top = 206
        Width = 311
        Height = 40
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object shpAccentUsuario: TShape
          Left = 0
          Top = 0
          Width = 4
          Height = 38
          Align = alLeft
          Brush.Color = 15132390
          Pen.Style = psClear
        end
        object edtLogin: TEdit
          Left = 16
          Top = 9
          Width = 285
          Height = 22
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5774125
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TextHint = 'seu.usuario'
          OnEnter = edtLoginEnter
          OnExit = edtLoginExit
        end
      end
      object pnlSenha: TPanel
        Left = 48
        Top = 278
        Width = 311
        Height = 40
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        object shpAccentSenha: TShape
          Left = 0
          Top = 0
          Width = 4
          Height = 38
          Align = alLeft
          Brush.Color = 15132390
          Pen.Style = psClear
        end
        object lblToggleSenha: TLabel
          Left = 254
          Top = 12
          Width = 45
          Height = 15
          Caption = 'Mostrar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12000086
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Cursor = crHandPoint
          OnClick = lblToggleSenhaClick
        end
        object edtSenha: TEdit
          Left = 16
          Top = 9
          Width = 230
          Height = 22
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5774125
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 0
          TextHint = 'Digite sua senha'
          OnEnter = edtSenhaEnter
          OnExit = edtSenhaExit
        end
      end
      object pnlEntrar: TPanel
        Left = 48
        Top = 358
        Width = 311
        Height = 44
        BevelOuter = bvNone
        Color = 12000086
        ParentBackground = False
        TabOrder = 2
        Cursor = crHandPoint
        OnClick = pnlEntrarClick
        OnMouseEnter = pnlEntrarMouseEnter
        OnMouseLeave = pnlEntrarMouseLeave
        object lblEntrarTexto: TLabel
          Left = 128
          Top = 14
          Width = 39
          Height = 17
          Caption = 'Entrar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentFont = False
          Cursor = crHandPoint
        end
        object lblEntrarSeta: TLabel
          Left = 175
          Top = 13
          Width = 14
          Height = 19
          Caption = #8594
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Cursor = crHandPoint
        end
      end
      object pnlDivEsq: TPanel
        Left = 48
        Top = 422
        Width = 110
        Height = 1
        BevelOuter = bvNone
        Color = 16578552
        ParentBackground = False
        TabOrder = 3
      end
      object pnlDivDir: TPanel
        Left = 236
        Top = 422
        Width = 123
        Height = 1
        BevelOuter = bvNone
        Color = 16578552
        ParentBackground = False
        TabOrder = 4
      end
      object lblVersaoMeio: TLabel
        Left = 168
        Top = 416
        Width = 64
        Height = 15
        Alignment = taCenter
        AutoSize = False
        Caption = 'v1.0.0.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6710886
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
    end
    object Panel2: TPanel
      Left = 409
      Top = 0
      Width = 581
      Height = 565
      Align = alClient
      BevelOuter = bvNone
      Color = 12000086
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        581
        565)
      object shpCirculo1: TShape
        Left = 420
        Top = -60
        Width = 220
        Height = 220
        Anchors = [akTop, akRight]
        Brush.Color = 13783160
        Pen.Style = psClear
        Shape = stCircle
      end
      object shpCirculo2: TShape
        Left = -50
        Top = 380
        Width = 140
        Height = 140
        Brush.Color = 13783160
        Pen.Style = psClear
        Shape = stCircle
      end
      object shpCloseHover: TShape
        Left = 530
        Top = 10
        Width = 44
        Height = 44
        Anchors = [akTop, akRight]
        Brush.Color = 13783160
        Pen.Style = psClear
        Shape = stCircle
        Visible = False
      end
      object pnlLogoDestaque: TPanel
        Left = 58
        Top = 210
        Width = 44
        Height = 44
        BevelOuter = bvNone
        Color = 13783160
        ParentBackground = False
        TabOrder = 0
        object lblLogoDestaqueLetra: TLabel
          Left = 0
          Top = 12
          Width = 44
          Height = 20
          Alignment = taCenter
          AutoSize = False
          Caption = 'R'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object lblBemVindo: TLabel
        Left = 58
        Top = 270
        Width = 460
        Height = 34
        Caption = 'Gest'#227'o completa, em um s'#243' lugar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDescricao: TLabel
        Left = 58
        Top = 312
        Width = 460
        Height = 42
        Caption = 
          'Controle financeiro, estoque e vendas com uma plataforma moder' +
          'na feita para o seu neg'#243'cio crescer.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 15790320
        Font.Height = -14
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object lblCheck1: TLabel
        Left = 58
        Top = 392
        Width = 14
        Height = 15
        Caption = #10003
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblFeature1: TLabel
        Left = 80
        Top = 391
        Width = 152
        Height = 15
        Caption = 'Relat'#243'rios em tempo real'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 15790320
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblCheck2: TLabel
        Left = 58
        Top = 420
        Width = 14
        Height = 15
        Caption = #10003
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblFeature2: TLabel
        Left = 80
        Top = 419
        Width = 176
        Height = 15
        Caption = 'Multiusu'#225'rio com permiss'#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 15790320
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblCheck3: TLabel
        Left = 58
        Top = 448
        Width = 14
        Height = 15
        Caption = #10003
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblFeature3: TLabel
        Left = 80
        Top = 447
        Width = 176
        Height = 15
        Caption = 'Backup autom'#225'tico na nuvem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 15790320
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object SpeedButton1: TSpeedButton
        Left = 536
        Top = 16
        Width = 33
        Height = 33
        Anchors = [akTop, akRight]
        Caption = 'X'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -20
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Cursor = crHandPoint
        OnClick = SpeedButton1Click
        OnMouseEnter = SpeedButton1MouseEnter
        OnMouseLeave = SpeedButton1MouseLeave
      end
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=RMSYSDB'
      'User_Name=root'
      'Password=123456'
      'Server=LOCALHOST'
      'DriverID=MySQL')
    Left = 489
    Top = 56
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Program Files\MySQL\MySQL Server 8.0\lib\libmysql.dll'
    Left = 593
    Top = 64
  end
end
