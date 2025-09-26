object DM: TDM
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
    Top = 136
  end
  object DL: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\pinto.7979\Documents\GitHub\Quicks-Software\lib\libpq.d' +
      'll'
    Left = 424
    Top = 280
  end
end
