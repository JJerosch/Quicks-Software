object DM: TDM
  OnCreate = DataModuleCreate
  Height = 485
  Width = 647
  PixelsPerInch = 97
  object FDConn: TFDConnection
    Params.Strings = (
      'Database=quicks'
      'User_Name=postgres'
      'Password=root'
      'DriverID=PG')
    Left = 437
    Top = 146
  end
  object FDQr: TFDQuery
    Connection = FDConn
    Left = 170
    Top = 291
  end
  object DS: TDataSource
    DataSet = FDQr
    Left = 170
    Top = 146
  end
  object DL: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\jpjer\OneDrive\Documentos\GitHub\Quicks-Software\lib\li' +
      'bpq.dll'
    Left = 437
    Top = 291
  end
end
