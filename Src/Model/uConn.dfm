object DM: TDM
  OnCreate = DataModuleCreate
  Height = 600
  Width = 799
  PixelsPerInch = 120
  object FDConn: TFDConnection
    Params.Strings = (
      'Database=quicks'
      'User_Name=postgres'
      'Password=root'
      'DriverID=PG')
    Left = 540
    Top = 180
  end
  object FDQr: TFDQuery
    Connection = FDConn
    Left = 210
    Top = 360
  end
  object DS: TDataSource
    DataSet = FDQr
    Left = 210
    Top = 180
  end
  object DL: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\jpjer\Documents\Embarcadero\Studio\Projects\Quicks-Soft' +
      'ware\lib\libpq.dll'
    Left = 540
    Top = 360
  end
end
