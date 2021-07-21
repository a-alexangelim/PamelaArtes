object dmDados: TdmDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 255
  Width = 354
  object FDPrincipal: TFDConnection
    Params.Strings = (
      'Database=teste'
      'User_Name=postgres'
      'Password=postgres'
      'DriverID=PG')
    LoginPrompt = False
    Left = 72
    Top = 48
  end
  object FDQlogin: TFDQuery
    Connection = FDPrincipal
    SQL.Strings = (
      'SELECT *'
      '  FROM USUARIO'
      'WHERE USUARIO = :usuario'
      '    AND SENHA = :senha')
    Left = 72
    Top = 128
    ParamData = <
      item
        Name = 'USUARIO'
        ParamType = ptInput
      end
      item
        Name = 'SENHA'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    Left = 160
    Top = 48
  end
end
