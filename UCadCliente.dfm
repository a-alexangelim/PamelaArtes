object frmCadCliente: TfrmCadCliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'P'#226'mela Artes -> Cadastro de Clientes'
  ClientHeight = 498
  ClientWidth = 904
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 129
    Width = 904
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitTop = 179
    ExplicitWidth = 117
  end
  object Panel1: TPanel
    Left = 0
    Top = 459
    Width = 904
    Height = 39
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      904
      39)
    object SpeedButton1: TSpeedButton
      Left = 7
      Top = 4
      Width = 75
      Height = 30
      Hint = 'Salvar'
      Caption = 'Salvar'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000562D
        4580AB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB59
        89FFAB5989FFAB5989FFAB5989FFAB5989FF562D45800000000000000000AB59
        89FFAB5989FFAB5989FFFFFFFEFFFFFFFEFFAB5989FFAB5989FFFFFFFEFFFFFF
        FEFFFFFFFEFFFFFFFEFFAB5989FFAB5989FFAB5989FF0000000000000000AB59
        89FFAB5989FFAB5989FFFFFFFEFFFFFFFEFFAB5989FFAB5989FFFFFFFEFFFFFF
        FEFFFFFFFEFFFFFFFEFFAB5989FFAB5989FFAB5989FF0000000000000000AB59
        89FFAB5989FFAB5989FFFFFFFEFFFFFFFEFFAB5989FFAB5989FFFFFFFEFFFFFF
        FEFFFFFFFEFFFFFFFEFFAB5989FFAB5989FFAB5989FF0000000000000000AB59
        89FFAB5989FFAB5989FFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFF
        FEFFFFFFFEFFFFFFFEFFAB5989FFAB5989FFAB5989FF0000000000000000AB59
        89FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB59
        89FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FF0000000000000000AB59
        89FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB59
        89FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FF0000000000000000AB59
        89FFAB5989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFAB5989FFAB5989FF0000000000000000AB59
        89FFAB5989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFAB5989FFAB5989FF0000000000000000AB59
        89FFAB5989FFFFFFFFFFFFFFFFFFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1
        C1FFC1C1C1FFFFFFFFFFFFFFFFFFAB5989FFAB5989FF0000000000000000AB59
        89FFAB5989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFAB5989FFAB5989FF0000000000000000AB59
        89FFAB5989FFFFFFFFFFFFFFFFFFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1
        C1FFC1C1C1FFFFFFFFFFFFFFFFFFAB5989FFAB5989FF0000000000000000AB59
        89FFAB5989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFAB5989FFAB5989FF0000000000000000AB59
        89FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB59
        89FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FF00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 819
      Top = 4
      Width = 75
      Height = 30
      Hint = 'Retornar'
      Anchors = [akTop, akRight]
      Caption = 'Retornar'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000060442885B882
        4DFFB8824DFF7B5734AB04030206000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000005F43
        2883B8824DFFB8824DFF825C36B4060503090000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00005D422781B8824DFFB8824DFF8A613ABF0907040D00000000000000000000
        00000A07040E4D37206B845D37B7A47445E3B17D4AF5B8824DFFB8824DFFB882
        4DFFB8824DFFB8824DFFB8824DFFB8824DFF91663DC90C090511000000002C1F
        123DA87746E9B8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
        4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFF7B5733AA19120B23AF7C
        49F3B8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
        4DFFB8824DFFB8824DFFB8824DFFB8824DFF986C40D3110C07187251309EB882
        4DFFB8824DFF8F653CC6302214420D0905120000000000000000000000000000
        0000523A2272B7814DFEB8824DFF95693ECE0E0A061400000000A27344E1B882
        4DFFB8824DFF17100A200000000000000000000000000000000000000000543B
        2374B8824DFFB8824DFF90663CC80C0805100000000000000000AD7A48F0B882
        4DFFB6804CFC0000000000000000000000000000000000000000573D2478B882
        4DFFB8824DFF8C633BC20A07040E0000000000000000000000009F7042DCB882
        4DFFB8824DFF20170E2D00000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000006D4D2E97B882
        4DFFB8824DFF9A6D41D63626174B110C07170302010400000000000000000000
        0000000000000000000000000000000000000000000000000000130D081AAC79
        48EEB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFF000000000000
        000000000000000000000000000000000000000000000000000000000000251A
        0F33A27244E0B8824DFFB8824DFFB8824DFFB8824DFFB8824DFF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000605030947321E63815B36B3A37344E2B27D4AF6B8824DFF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 904
    Height = 129
    Align = alTop
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 6
      Top = 8
      Width = 92
      Height = 52
      Caption = 'C'#243'digo'
      TabOrder = 0
      DesignSize = (
        92
        52)
      object edtCodigo: TEdit
        Left = 9
        Top = 19
        Width = 72
        Height = 21
        Anchors = [akLeft, akTop, akRight, akBottom]
        Enabled = False
        NumbersOnly = True
        TabOrder = 0
      end
    end
    object GroupBox3: TGroupBox
      Left = 106
      Top = 8
      Width = 593
      Height = 52
      Caption = 'Nome:'
      TabOrder = 1
      DesignSize = (
        593
        52)
      object edtNome: TEdit
        Left = 10
        Top = 19
        Width = 573
        Height = 21
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 707
      Top = 8
      Width = 187
      Height = 52
      Caption = 'Telefone:'
      TabOrder = 2
      object edtTelefone: TMaskEdit
        Left = 11
        Top = 19
        Width = 165
        Height = 21
        EditMask = '(99)0000-0000;0;_'
        MaxLength = 13
        TabOrder = 0
        Text = ''
      end
    end
    object GroupBox4: TGroupBox
      Left = 6
      Top = 62
      Width = 187
      Height = 52
      Caption = 'Celular:'
      TabOrder = 3
      object edtCelular: TMaskEdit
        Left = 11
        Top = 19
        Width = 161
        Height = 21
        EditMask = '(99)00000-0000;0;_'
        MaxLength = 14
        TabOrder = 0
        Text = ''
      end
    end
    object GroupBox5: TGroupBox
      Left = 202
      Top = 62
      Width = 692
      Height = 52
      Caption = 'E-mail:'
      TabOrder = 4
      DesignSize = (
        692
        52)
      object edtEmail: TEdit
        Left = 9
        Top = 19
        Width = 672
        Height = 21
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 132
    Width = 904
    Height = 327
    ActivePage = tabEndereco
    Align = alClient
    TabOrder = 2
    object tabEndereco: TTabSheet
      Caption = 'Endere'#231'os'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 39
        Width = 896
        Height = 260
        Align = alClient
        DataSource = DSEndereco
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 896
        Height = 39
        Align = alTop
        TabOrder = 1
        DesignSize = (
          896
          39)
        object SpeedButton3: TSpeedButton
          Left = 5
          Top = 3
          Width = 38
          Height = 30
          Hint = 'Incluir novo'
          Anchors = [akTop, akRight]
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000097A776FF97A776FF00000000000000000000000000000000000000000000
            0000848484FF848484FF848484FF848484FF848484FF848484FF848484FFFFFF
            FFFF97A776FF97A776FF00000000000000000000000000000000000000000000
            0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF97A776FF97A776FF00000000000000000000000000000000000000000000
            0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF97A776FF97A776FF97A7
            76FF97A776FF97A776FF97A776FF97A776FF97A776FF00000000000000000000
            0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF97A776FF97A776FF97A7
            76FF97A776FF97A776FF97A776FF97A776FF97A776FF00000000000000000000
            0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF97A776FF97A776FFFFFFFFFFFFFFFFFF0000000000000000000000000000
            0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF97A776FF97A776FFFFFFFFFF848484FF0000000000000000000000000000
            0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF97A776FF97A776FFFFFFFFFF848484FF0000000000000000000000000000
            0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF0000000000000000000000000000
            0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF0000000000000000000000000000
            0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF838383FE0000000000000000000000000000
            0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF848484FF848484FF848484FF848484FF0000000000000000000000000000
            0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF848484FFFAFAFAFA7B7B7BDD1A1A1A330000000000000000000000000000
            0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF848484FF7B7B7BDD1A1A1A33000000000000000000000000000000000000
            0000848484FF848484FF848484FF848484FF848484FF848484FF848484FF8383
            83FE848484FF1A1A1A3300000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton3Click
        end
      end
    end
    object tabHistorico: TTabSheet
      Caption = 'Hist'#243'rico de Encomendas'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 896
        Height = 39
        Align = alTop
        TabOrder = 0
        object ckFinalizadas: TCheckBox
          Left = 5
          Top = 11
          Width = 142
          Height = 17
          Caption = 'Exibir apenas finalizadas'
          TabOrder = 0
        end
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 39
        Width = 896
        Height = 221
        Align = alClient
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object Panel5: TPanel
        Left = 0
        Top = 260
        Width = 896
        Height = 39
        Align = alBottom
        TabOrder = 2
        object Shape1: TShape
          Left = 7
          Top = 14
          Width = 15
          Height = 15
          Brush.Color = 16167679
          Pen.Style = psClear
          Shape = stRoundRect
        end
        object Label1: TLabel
          Left = 26
          Top = 15
          Width = 51
          Height = 13
          Caption = 'Pendentes'
        end
        object Label2: TLabel
          Left = 116
          Top = 15
          Width = 52
          Height = 13
          Caption = 'Finalizados'
        end
        object Shape2: TShape
          Left = 97
          Top = 14
          Width = 15
          Height = 15
          Brush.Color = 11599792
          Pen.Style = psClear
          Shape = stRoundRect
        end
      end
    end
  end
  object FDQCadCliente: TFDQuery
    Connection = dmDados.FDPrincipal
    Left = 420
    Top = 252
    ParamData = <
      item
        Name = 'id'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'nome'
        DataType = ftString
        ParamType = ptInput
        Size = 75
      end
      item
        Name = 'telefone'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Name = 'celular'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Name = 'email'
        DataType = ftString
        ParamType = ptInput
        Size = 45
      end>
  end
  object FDQEndereco: TFDQuery
    Connection = dmDados.FDPrincipal
    SQL.Strings = (
      'SELECT E.RUA, E.NUMERO, E.BAIRRO'
      '  FROM ENDERECO_CLIENTE EC'
      ' LEFT JOIN ENDERECO E ON EC.ID_ENDERECO = E.ID'
      ' LEFT JOIN CLIENTE C ON C.ID = EC.ID_CLIENTE'
      ' WHERE C.ID = :cliente')
    Left = 332
    Top = 252
    ParamData = <
      item
        Name = 'CLIENTE'
        ParamType = ptInput
      end>
    object FDQEnderecorua: TWideStringField
      DisplayWidth = 35
      FieldName = 'rua'
      Origin = 'rua'
      FixedChar = True
      Size = 50
    end
    object FDQEndereconumero: TIntegerField
      DisplayWidth = 15
      FieldName = 'numero'
      Origin = 'numero'
    end
    object FDQEnderecobairro: TWideStringField
      DisplayWidth = 25
      FieldName = 'bairro'
      Origin = 'bairro'
      FixedChar = True
      Size = 35
    end
  end
  object DSEndereco: TDataSource
    DataSet = FDQEndereco
    Left = 292
    Top = 252
  end
  object DSEncomenda: TDataSource
    Left = 292
    Top = 308
  end
  object FDQEncomenda: TFDQuery
    Connection = dmDados.FDPrincipal
    Left = 332
    Top = 308
  end
end
