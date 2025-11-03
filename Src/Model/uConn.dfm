object DM: TDM
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object FDConn: TFDConnection
    Params.Strings = (
      'Database=quicks'
      'User_Name=postgres'
      'Password=root'
      'DriverID=PG')
    Left = 432
    Top = 144
  end
  object FDQr: TFDQuery
    Connection = FDConn
    Left = 168
    Top = 288
  end
  object DS: TDataSource
    DataSet = FDQr
    Left = 168
    Top = 144
  end
  object DL: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\Jo'#227'o Jerosch\OneDrive\Documentos\Embarcadero\Studio\Pro' +
      'jects\Quicks\lib\libpq.dll'
    Left = 432
    Top = 288
  end
end
