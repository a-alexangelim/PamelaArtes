object frmParametro: TfrmParametro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'P'#226'mela Artes -> Parametriza'#231#245'es'
  ClientHeight = 313
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 16
    Width = 113
    Height = 52
    Caption = 'Valor da Hora'
    TabOrder = 0
    DesignSize = (
      113
      52)
    object edtValorHora: TEdit
      Left = 11
      Top = 20
      Width = 93
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      NumbersOnly = True
      TabOrder = 0
      ExplicitWidth = 126
    end
  end
  object GBInternet: TGroupBox
    Left = 140
    Top = 16
    Width = 141
    Height = 52
    Caption = '        Considerar Internet'
    TabOrder = 1
    DesignSize = (
      141
      52)
    object edtValorInternet: TEdit
      Left = 11
      Top = 20
      Width = 121
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      NumbersOnly = True
      TabOrder = 0
      ExplicitWidth = 93
    end
  end
  object chkInternet: TCheckBox
    Left = 153
    Top = 15
    Width = 16
    Height = 17
    TabOrder = 2
    OnClick = chkInternetClick
  end
end
