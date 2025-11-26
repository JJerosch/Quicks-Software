object DM: TDM
  OnCreate = DataModuleCreate
  Height = 745
  Width = 967
  PixelsPerInch = 120
  object FDConn: TFDConnection
    Params.Strings = (
      'Database=quicks'
      'User_Name=postgres'
      'Password=root'
      'DriverID=PG')
    Connected = True
    Left = 540
    Top = 52
  end
  object FDQr: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from usuarios')
    Left = 378
    Top = 48
  end
  object DS: TDataSource
    DataSet = FDQr
    Left = 226
    Top = 52
  end
  object DL: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\jpjer\Documents\Embarcadero\Studio\Projects\Quicks-Soft' +
      'ware\lib\libpq.dll'
    Left = 676
    Top = 56
  end
  object qAdminPedidosDetalhe: TFDQuery
    Active = True
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      '  p.id_pedido,'
      '  p.data_pedido,'
      '  c.nome_comercio,'
      '  fp.nome_estado AS status_pedido,'
      '  p.valor_total_pedido,'
      '  p.taxa_entrega,'
      '  p.endereco_entrega'
      'FROM pedidos p'
      'INNER JOIN comercios c ON p.id_comercio = c.id_comercio'
      
        'INNER JOIN filtros_pedidos fp ON p.id_status_pedido = fp.id_esta' +
        'do'
      'WHERE p.data_pedido >= :DataInicio'
      '  AND p.data_pedido < :DataFim + INTERVAL '#39'1 day'#39
      '  AND (:IdComercio = 0 OR p.id_comercio = :IdComercio)'
      'ORDER BY p.data_pedido DESC;'
      '')
    Left = 296
    Top = 168
    ParamData = <
      item
        Name = 'DATAINICIO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATAFIM'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDCOMERCIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object frxDOnoRelatorioVendas: TfrxReport
    Version = '2026.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45986.564322939800000000
    ReportOptions.LastChange = 45987.129449421300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 496
    Top = 330
    Datasets = <
      item
        DataSet = frxDSDono
        DataSetName = 'frxDSDono'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    Watermarks = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 75.590600000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 238.229275660000000000
          Top = 26.456709340000000000
          Width = 479.983026460000000000
          Height = 49.133889770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clCoral
          Memo.UTF8W = (
            'Relat'#243'rio de Vendas')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Width = 718.093416460000000000
          Height = 30.236239770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Fill.BackColor = clCoral
          Memo.UTF8W = (
            ' ')
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Top = 30.236240000000000000
          Width = 241.872636460000000000
          Height = 45.354359770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Fill.BackColor = clCoral
          Memo.UTF8W = (
            ' ')
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 117.165430000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          IndexTag = 2
          AllowVectorExport = True
          Left = 302.362400000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSDono
          DataSetName = 'frxDSDono'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'Endere'#231'o de Entrega')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          IndexTag = 3
          AllowVectorExport = True
          Left = 226.771800000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSDono
          DataSetName = 'frxDSDono'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'Taxa Entrega')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          IndexTag = 4
          AllowVectorExport = True
          Left = 75.590600000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSDono
          DataSetName = 'frxDSDono'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'Valor Total')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          IndexTag = 5
          AllowVectorExport = True
          Left = 151.181200000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSDono
          DataSetName = 'frxDSDono'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'Status')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          IndexTag = 7
          AllowVectorExport = True
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSDono
          DataSetName = 'frxDSDono'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'ID Pedido')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          IndexTag = 6
          AllowVectorExport = True
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSDono
          DataSetName = 'frxDSDono'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Fill.BackColor = clWhite
        Fill.ForeColor = clSilver
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 196.535560000000000000
        Width = 718.110700000000000000
        DataSet = frxDSDono
        DataSetName = 'frxDSDono'
        RowCount = 0
        object MemofrxDSDonoendereco_entrega: TfrxMemoView
          IndexTag = 2
          AllowVectorExport = True
          Left = 302.362400000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'endereco_entrega'
          DataSet = frxDSDono
          DataSetName = 'frxDSDono'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSDono."endereco_entrega"]')
        end
        object MemofrxDSDonotaxa_entrega: TfrxMemoView
          IndexTag = 3
          AllowVectorExport = True
          Left = 226.771800000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSDono
          DataSetName = 'frxDSDono'
          Frame.Typ = []
          Memo.UTF8W = (
            'R$[frxDSDono."taxa_entrega"]')
        end
        object MemofrxDSDonovalor_total_pedido: TfrxMemoView
          IndexTag = 4
          AllowVectorExport = True
          Left = 75.590600000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSDono
          DataSetName = 'frxDSDono'
          Frame.Typ = []
          Memo.UTF8W = (
            'R$[frxDSDono."valor_total_pedido"]')
        end
        object MemofrxDSDonostatus_pedido: TfrxMemoView
          IndexTag = 5
          AllowVectorExport = True
          Left = 151.181200000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'status_pedido'
          DataSet = frxDSDono
          DataSetName = 'frxDSDono'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSDono."status_pedido"]')
        end
        object MemofrxDSDonoid_pedido: TfrxMemoView
          IndexTag = 7
          AllowVectorExport = True
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'id_pedido'
          DataSet = frxDSDono
          DataSetName = 'frxDSDono'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSDono."id_pedido"]')
        end
        object MemofrxDSDonodata_pedido: TfrxMemoView
          IndexTag = 6
          AllowVectorExport = True
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'data_pedido'
          DataSet = frxDSDono
          DataSetName = 'frxDSDono'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSDono."data_pedido"]')
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 279.685220000000000000
        Width = 718.110700000000000000
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110698170000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clSilver
          Memo.UTF8W = (
            'P'#225'gina [Page] de [TotalPages]')
          ParentFont = False
        end
      end
    end
  end
  object frxAdminRelatorioGeral: TfrxReport
    Version = '2026.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45986.561155393500000000
    ReportOptions.LastChange = 45987.224720219910000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 496
    Top = 169
    Datasets = <
      item
        DataSet = frxDSAdmin
        DataSetName = 'frxDSAdmin'
      end>
    Variables = <>
    Style = <>
    Watermarks = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 75.590600000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 230.670215660000000000
          Top = 26.456709340000000000
          Width = 487.542086460000000000
          Height = 49.133889770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clCoral
          Memo.UTF8W = (
            'Relat'#243'rio Geral Pedidos')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Width = 718.093416460000000000
          Height = 30.236239770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Fill.BackColor = clCoral
          Memo.UTF8W = (
            ' ')
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Top = 30.236240000000000000
          Width = 230.534046460000000000
          Height = 45.354359770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Fill.BackColor = clCoral
          Memo.UTF8W = (
            ' ')
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 117.165430000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 453.543600000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSAdmin
          DataSetName = 'frxDSAdmin'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'Endere'#231'o da Entrega')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          IndexTag = 2
          AllowVectorExport = True
          Left = 264.567100000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSAdmin
          DataSetName = 'frxDSAdmin'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'Taxa de Entrega')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          IndexTag = 3
          AllowVectorExport = True
          Left = 188.976500000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSAdmin
          DataSetName = 'frxDSAdmin'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'Valor Total')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          IndexTag = 4
          AllowVectorExport = True
          Left = 377.953000000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSAdmin
          DataSetName = 'frxDSAdmin'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'Status')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          IndexTag = 5
          AllowVectorExport = True
          Left = 75.590600000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSAdmin
          DataSetName = 'frxDSAdmin'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'Nome Com'#233'rcio')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          IndexTag = 6
          AllowVectorExport = True
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSAdmin
          DataSetName = 'frxDSAdmin'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          IndexTag = 7
          AllowVectorExport = True
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSAdmin
          DataSetName = 'frxDSAdmin'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'ID Pedido')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Fill.BackColor = clWhite
        Fill.ForeColor = clSilver
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 196.535560000000000000
        Width = 718.110700000000000000
        DataSet = frxDSAdmin
        DataSetName = 'frxDSAdmin'
        RowCount = 0
        object MemofrxDSAdminendereco_entrega: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 453.543600000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'endereco_entrega'
          DataSet = frxDSAdmin
          DataSetName = 'frxDSAdmin'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSAdmin."endereco_entrega"]')
        end
        object MemofrxDSAdmintaxa_entrega: TfrxMemoView
          IndexTag = 2
          AllowVectorExport = True
          Left = 264.567100000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSAdmin
          DataSetName = 'frxDSAdmin'
          Frame.Typ = []
          Memo.UTF8W = (
            'R$[frxDSAdmin."taxa_entrega"]')
        end
        object MemofrxDSAdminvalor_total_pedido: TfrxMemoView
          IndexTag = 3
          AllowVectorExport = True
          Left = 188.976500000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSAdmin
          DataSetName = 'frxDSAdmin'
          Frame.Typ = []
          Memo.UTF8W = (
            'R$[frxDSAdmin."valor_total_pedido"]')
        end
        object MemofrxDSAdminstatus_pedido: TfrxMemoView
          IndexTag = 4
          AllowVectorExport = True
          Left = 377.953000000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSAdmin
          DataSetName = 'frxDSAdmin'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSAdmin."status_pedido"]')
        end
        object MemofrxDSAdminnome_comercio: TfrxMemoView
          IndexTag = 5
          AllowVectorExport = True
          Left = 75.590600000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'nome_comercio'
          DataSet = frxDSAdmin
          DataSetName = 'frxDSAdmin'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSAdmin."nome_comercio"]')
        end
        object MemofrxDSAdmindata_pedido: TfrxMemoView
          IndexTag = 6
          AllowVectorExport = True
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'data_pedido'
          DataSet = frxDSAdmin
          DataSetName = 'frxDSAdmin'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSAdmin."data_pedido"]')
        end
        object MemofrxDSAdminid_pedido: TfrxMemoView
          IndexTag = 7
          AllowVectorExport = True
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'id_pedido'
          DataSet = frxDSAdmin
          DataSetName = 'frxDSAdmin'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSAdmin."id_pedido"]')
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 279.685220000000000000
        Width = 718.110700000000000000
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110698170000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clSilver
          Memo.UTF8W = (
            'P'#225'gina [Page] de [TotalPages]')
          ParentFont = False
        end
      end
    end
  end
  object frxDSAdmin: TfrxDBDataset
    UserName = 'frxDSAdmin'
    CloseDataSource = False
    DataSet = qAdminPedidosDetalhe
    BCDToCurrency = False
    DataSetOptions = []
    Left = 648
    Top = 168
    FieldDefs = <
      item
        FieldName = 'id_pedido'
      end
      item
        FieldName = 'data_pedido'
      end
      item
        FieldName = 'nome_comercio'
        FieldType = fftString
        Size = 255
      end
      item
        FieldName = 'status_pedido'
        FieldType = fftString
        Size = 30
      end
      item
        FieldName = 'valor_total_pedido'
      end
      item
        FieldName = 'taxa_entrega'
      end
      item
        FieldName = 'endereco_entrega'
      end>
  end
  object frxEntregadorExtrato: TfrxReport
    Version = '2026.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45986.561155393500000000
    ReportOptions.LastChange = 45987.044574571800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 496
    Top = 552
    Datasets = <
      item
        DataSet = frxDSEntregador
        DataSetName = 'frxDSEntregador'
      end>
    Variables = <>
    Style = <>
    Watermarks = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Color = clWhite
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 75.590600000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 238.229275660000000000
          Top = 26.456709340000000000
          Width = 479.983026460000000000
          Height = 49.133889770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clCoral
          Memo.UTF8W = (
            'Extrato de Entregas')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Width = 718.093416460000000000
          Height = 30.236239770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Fill.BackColor = clCoral
          Memo.UTF8W = (
            ' ')
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Top = 30.236240000000000000
          Width = 241.872636460000000000
          Height = 45.354359770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Fill.BackColor = clCoral
          Memo.UTF8W = (
            ' ')
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456719300000000000
        Top = 117.165430000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 113.385900730000000000
          Height = 18.897659300000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 3.779530000000000000
          Width = 113.385900730000000000
          Height = 18.897659300000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'Com'#233'rcio')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 226.771800000000000000
          Top = 3.779530000000000000
          Width = 264.567100730000000000
          Height = 18.897659300000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'Endere'#231'o')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 491.338900000000000000
          Top = 3.779530000000000000
          Width = 113.385900730000000000
          Height = 18.897659300000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'Taxa')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 604.724800000000000000
          Top = 3.779530000000000000
          Width = 113.385900730000000000
          Height = 18.897659300000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'Status')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Fill.BackColor = clWhite
        Fill.ForeColor = 15000804
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        DataSet = frxDSEntregador
        DataSetName = 'frxDSEntregador'
        RowCount = 0
        object MemofrxDSEntregadordata_pedido: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'data_pedido'
          DataSet = frxDSEntregador
          DataSetName = 'frxDSEntregador'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSEntregador."data_pedido"]')
        end
        object MemofrxDSEntregadornome_comercio: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 3.779530000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'nome_comercio'
          DataSet = frxDSEntregador
          DataSetName = 'frxDSEntregador'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSEntregador."nome_comercio"]')
        end
        object MemofrxDSEntregadorendereco_entrega: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 226.771800000000000000
          Top = 3.779530000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'endereco_entrega'
          DataSet = frxDSEntregador
          DataSetName = 'frxDSEntregador'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSEntregador."endereco_entrega"]')
        end
        object MemofrxDSEntregadortaxa_entrega: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 491.338900000000000000
          Top = 3.779530000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'taxa_entrega'
          DataSet = frxDSEntregador
          DataSetName = 'frxDSEntregador'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSEntregador."taxa_entrega"]')
        end
        object MemofrxDSEntregadorstatus_pedido: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 604.724800000000000000
          Top = 3.779530000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'status_pedido'
          DataSet = frxDSEntregador
          DataSetName = 'frxDSEntregador'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSEntregador."status_pedido"]')
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 287.244280000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Top = -0.000006289999999992
          Width = 154.960728830000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clSilver
          Memo.UTF8W = (
            'Total de taxas recebidas: ')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 154.960730000000000000
          Width = 563.149968830000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clSilver
          Memo.UTF8W = (
            'R$[SUM(<frxDSEntregador."taxa_entrega">)]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 332.598640000000000000
        Width = 718.110700000000000000
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Top = 3.779544840000000000
          Width = 718.110698170000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clSilver
          Memo.UTF8W = (
            'P'#225'gina [Page] de [TotalPages]')
          ParentFont = False
        end
      end
    end
  end
  object frxDSDono: TfrxDBDataset
    UserName = 'frxDSDono'
    CloseDataSource = False
    DataSet = qDonoPedidosDetalhe
    BCDToCurrency = False
    DataSetOptions = []
    Left = 648
    Top = 328
    FieldDefs = <
      item
        FieldName = 'id_pedido'
      end
      item
        FieldName = 'data_pedido'
      end
      item
        FieldName = 'status_pedido'
        FieldType = fftString
        Size = 30
      end
      item
        FieldName = 'valor_total_pedido'
      end
      item
        FieldName = 'taxa_entrega'
      end
      item
        FieldName = 'endereco_entrega'
      end
      item
        FieldName = 'entregue'
      end>
  end
  object frxDSEntregador: TfrxDBDataset
    UserName = 'frxDSEntregador'
    CloseDataSource = False
    DataSet = qEntregadorExtrato
    BCDToCurrency = False
    DataSetOptions = []
    Left = 648
    Top = 552
    FieldDefs = <
      item
        FieldName = 'id_pedido'
      end
      item
        FieldName = 'data_pedido'
      end
      item
        FieldName = 'nome_comercio'
        FieldType = fftString
        Size = 255
      end
      item
        FieldName = 'endereco_entrega'
      end
      item
        FieldName = 'taxa_entrega'
      end
      item
        FieldName = 'status_pedido'
        FieldType = fftString
        Size = 30
      end>
  end
  object qEntregadorExtrato: TFDQuery
    Active = True
    Connection = FDConn
    SQL.Strings = (
      'SELECT '
      '  p.id_pedido,'
      '  p.data_pedido,'
      '  c.nome_comercio,'
      '  p.endereco_entrega,'
      '  p.taxa_entrega,'
      '  fp.nome_estado AS status_pedido'
      'FROM pedidos p'
      'INNER JOIN comercios c ON p.id_comercio = c.id_comercio'
      
        'INNER JOIN filtros_pedidos fp ON p.id_status_pedido = fp.id_esta' +
        'do'
      'WHERE 1=0')
    Left = 296
    Top = 552
    object qEntregadorExtratoid_pedido: TLargeintField
      FieldName = 'id_pedido'
      Origin = 'id_pedido'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qEntregadorExtratodata_pedido: TSQLTimeStampField
      FieldName = 'data_pedido'
      Origin = 'data_pedido'
      ProviderFlags = [pfInUpdate]
    end
    object qEntregadorExtratonome_comercio: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome_comercio'
      Origin = 'nome_comercio'
      Size = 255
    end
    object qEntregadorExtratoendereco_entrega: TWideMemoField
      FieldName = 'endereco_entrega'
      Origin = 'endereco_entrega'
      BlobType = ftWideMemo
    end
    object qEntregadorExtratotaxa_entrega: TBCDField
      FieldName = 'taxa_entrega'
      Origin = 'taxa_entrega'
      Precision = 10
      Size = 2
    end
    object qEntregadorExtratostatus_pedido: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'status_pedido'
      Origin = 'status_pedido'
      Size = 30
    end
  end
  object qAdminKPI: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      '  COUNT(p.id_pedido) AS TotalPedidos,'
      '  COALESCE(SUM(p.valor_total_pedido), 0) AS Faturamento'
      'FROM pedidos p'
      'WHERE p.data_pedido >= :DataInicio'
      '  AND p.data_pedido < :DataFim + INTERVAL '#39'1 day'#39
      '  AND p.id_status_pedido = 5'
      '  AND (:IdComercio = 0 OR p.id_comercio = :IdComercio);'
      '')
    Left = 72
    Top = 168
    ParamData = <
      item
        Name = 'DATAINICIO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATAFIM'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDCOMERCIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qAdminFaturamentoPorLoja: TFDQuery
    Active = True
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      '    c.id_comercio,'
      '    c.nome_comercio,'
      '    COUNT(p.id_pedido) AS qtd_pedidos,'
      '    COALESCE(SUM(p.valor_total_pedido), 0) AS faturamento_loja,'
      '    COALESCE(SUM(p.taxa_entrega), 0) AS total_taxas'
      'FROM comercios c'
      'LEFT JOIN pedidos p ON c.id_comercio = p.id_comercio'
      '    AND p.data_pedido >= :DataInicio'
      '    AND p.data_pedido < :DataFim + INTERVAL '#39'1 day'#39
      '    AND p.id_status_pedido = 5'
      'WHERE c.ativo = TRUE'
      'GROUP BY c.id_comercio, c.nome_comercio'
      'ORDER BY faturamento_loja DESC;'
      '')
    Left = 296
    Top = 240
    ParamData = <
      item
        Name = 'DATAINICIO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATAFIM'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
  end
  object qDonoKPI: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      '             SELECT'
      '  COUNT(p.id_pedido) AS TotalPedidos,'
      '  COALESCE(SUM(p.valor_total_pedido), 0) AS Faturamento'
      'FROM pedidos p'
      'WHERE p.id_comercio = :IdComercio'
      '  AND p.data_pedido >= :DataInicio'
      '  AND p.data_pedido < :DataFim + INTERVAL '#39'1 day'#39
      '  AND p.id_status_pedido = 5;'
      '')
    Left = 64
    Top = 336
    ParamData = <
      item
        Name = 'IDCOMERCIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATAINICIO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATAFIM'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
  end
  object qDonoPedidosDetalhe: TFDQuery
    Active = True
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      '  p.id_pedido,'
      '  p.data_pedido,'
      '  fp.nome_estado AS status_pedido,'
      '  p.valor_total_pedido,'
      '  p.taxa_entrega,'
      '  p.endereco_entrega,'
      
        '  CASE WHEN p.recebeu_entrega THEN '#39'Sim'#39' ELSE '#39'N'#227'o'#39' END AS entre' +
        'gue'
      'FROM pedidos p'
      
        'INNER JOIN filtros_pedidos fp ON p.id_status_pedido = fp.id_esta' +
        'do'
      'WHERE p.id_comercio = :IdComercio'
      '  AND p.data_pedido >= :DataInicio'
      '  AND p.data_pedido < :DataFim + INTERVAL '#39'1 day'#39
      'ORDER BY p.data_pedido DESC;'
      '')
    Left = 296
    Top = 336
    ParamData = <
      item
        Name = 'IDCOMERCIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATAINICIO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATAFIM'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
  end
  object qEntregadorKPI: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      '')
    Left = 72
    Top = 552
  end
  object frxDOnoRElatorioProdutos: TfrxReport
    Version = '2026.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45986.564322939800000000
    ReportOptions.LastChange = 45987.136593784720000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 496
    Top = 400
    Datasets = <
      item
        DataSet = frxDSDonoProdutos
        DataSetName = 'frxDSDono'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    Watermarks = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 75.590600000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 238.229275660000000000
          Top = 26.456709340000000000
          Width = 479.983026460000000000
          Height = 49.133889770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clCoral
          Memo.UTF8W = (
            'Relat'#243'rio de Produtos')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Width = 718.093416460000000000
          Height = 30.236239770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Fill.BackColor = clCoral
          Memo.UTF8W = (
            ' ')
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Top = 30.236240000000000000
          Width = 241.872636460000000000
          Height = 45.354359770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Fill.BackColor = clCoral
          Memo.UTF8W = (
            ' ')
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 117.165430000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          IndexTag = 2
          AllowVectorExport = True
          Left = 340.157700000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSDonoProdutos
          DataSetName = 'frxDSDono'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'Pre'#231'o')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          IndexTag = 3
          AllowVectorExport = True
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSDonoProdutos
          DataSetName = 'frxDSDono'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'ID Produto')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          IndexTag = 4
          AllowVectorExport = True
          Left = 75.590600000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSDonoProdutos
          DataSetName = 'frxDSDono'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'Nome Produto')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          IndexTag = 5
          AllowVectorExport = True
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSDonoProdutos
          DataSetName = 'frxDSDono'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'Total vendido')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 453.543600000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSDonoProdutos
          DataSetName = 'frxDSDono'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'Quantidade vendida')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Fill.BackColor = clWhite
        Fill.ForeColor = clSilver
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 196.535560000000000000
        Width = 718.110700000000000000
        DataSet = frxDSDonoProdutos
        DataSetName = 'frxDSDono'
        RowCount = 0
        object MemofrxDSDonoqtd_vendida: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 453.543600000000000000
          Top = 3.779530000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'qtd_vendida'
          DataSet = frxDSDonoProdutos
          DataSetName = 'frxDSDono'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSDono."qtd_vendida"]')
        end
        object MemofrxDSDonopreco_prod: TfrxMemoView
          IndexTag = 2
          AllowVectorExport = True
          Left = 340.157700000000000000
          Top = 3.779530000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSDonoProdutos
          DataSetName = 'frxDSDono'
          Frame.Typ = []
          Memo.UTF8W = (
            'R$[frxDSDono."preco_prod"]')
        end
        object MemofrxDSDonoid_produto: TfrxMemoView
          IndexTag = 3
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'id_produto'
          DataSet = frxDSDonoProdutos
          DataSetName = 'frxDSDono'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSDono."id_produto"]')
        end
        object MemofrxDSDononome_prod: TfrxMemoView
          IndexTag = 4
          AllowVectorExport = True
          Left = 75.590600000000000000
          Top = 3.779530000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'nome_prod'
          DataSet = frxDSDonoProdutos
          DataSetName = 'frxDSDono'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSDono."nome_prod"]')
        end
        object MemofrxDSDonototal_vendido: TfrxMemoView
          IndexTag = 5
          AllowVectorExport = True
          Left = 604.724800000000000000
          Top = 3.779530000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSDonoProdutos
          DataSetName = 'frxDSDono'
          Frame.Typ = []
          Memo.UTF8W = (
            'R$[frxDSDono."total_vendido"]')
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 283.464750000000000000
        Width = 718.110700000000000000
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110698170000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clSilver
          Memo.UTF8W = (
            'P'#225'gina [Page] de [TotalPages]')
          ParentFont = False
        end
      end
    end
  end
  object frxAdminRElatorioLojas: TfrxReport
    Version = '2026.1.3'
    DataSet = frxDSAdminLojas
    DataSetName = 'frxDSAdmin'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45986.561155393500000000
    ReportOptions.LastChange = 45986.561155393500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 496
    Top = 240
    Datasets = <
      item
        DataSet = frxDSAdminLojas
        DataSetName = 'frxDSAdmin'
      end>
    Variables = <>
    Style = <>
    Watermarks = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 75.590600000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 230.670215660000000000
          Top = 26.456709340000000000
          Width = 487.542086460000000000
          Height = 49.133889770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clCoral
          Memo.UTF8W = (
            'Relat'#243'rio Geral Pedidos')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Width = 718.093416460000000000
          Height = 30.236239770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Fill.BackColor = clCoral
          Memo.UTF8W = (
            ' ')
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Top = 30.236240000000000000
          Width = 230.534046460000000000
          Height = 45.354359770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Fill.BackColor = clCoral
          Memo.UTF8W = (
            ' ')
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 117.165430000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSAdminLojas
          DataSetName = 'frxDSAdmin'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'ID Com'#233'rcio')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          IndexTag = 2
          AllowVectorExport = True
          Left = 113.385900000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSAdminLojas
          DataSetName = 'frxDSAdmin'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'Nome Com'#233'rcio')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          IndexTag = 3
          AllowVectorExport = True
          Left = 264.567100000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSAdminLojas
          DataSetName = 'frxDSAdmin'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'Quantidade de Pedidos')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          IndexTag = 4
          AllowVectorExport = True
          Left = 415.748300000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSAdminLojas
          DataSetName = 'frxDSAdmin'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'Faturamento Com'#233'rcio')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          IndexTag = 5
          AllowVectorExport = True
          Left = 566.929500000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDSAdminLojas
          DataSetName = 'frxDSAdmin'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'Total Taxas Entrega')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Fill.BackColor = clWhite
        Fill.ForeColor = clSilver
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 196.535560000000000000
        Width = 718.110700000000000000
        DataSet = frxDSAdmin
        DataSetName = 'frxDSAdmin'
        RowCount = 0
        object MemofrxDSAdminid_comercio: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'id_comercio'
          DataSet = frxDSAdminLojas
          DataSetName = 'frxDSAdmin'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSAdmin."id_comercio"]')
        end
        object MemofrxDSAdminnome_comercio: TfrxMemoView
          IndexTag = 2
          AllowVectorExport = True
          Left = 113.385900000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'nome_comercio'
          DataSet = frxDSAdminLojas
          DataSetName = 'frxDSAdmin'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSAdmin."nome_comercio"]')
        end
        object MemofrxDSAdminqtd_pedidos: TfrxMemoView
          IndexTag = 3
          AllowVectorExport = True
          Left = 264.567100000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'qtd_pedidos'
          DataSet = frxDSAdminLojas
          DataSetName = 'frxDSAdmin'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSAdmin."qtd_pedidos"]')
        end
        object MemofrxDSAdminfaturamento_loja: TfrxMemoView
          IndexTag = 4
          AllowVectorExport = True
          Left = 419.527830000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'faturamento_loja'
          DataSet = frxDSAdminLojas
          DataSetName = 'frxDSAdmin'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSAdmin."faturamento_loja"]')
        end
        object MemofrxDSAdmintotal_taxas: TfrxMemoView
          IndexTag = 5
          AllowVectorExport = True
          Left = 566.929500000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'total_taxas'
          DataSet = frxDSAdminLojas
          DataSetName = 'frxDSAdmin'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSAdmin."total_taxas"]')
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 279.685220000000000000
        Width = 718.110700000000000000
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110698170000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clSilver
          Memo.UTF8W = (
            'P'#225'gina [Page] de [TotalPages]')
          ParentFont = False
        end
      end
    end
  end
  object qDonoProdutosMaisVendidos: TFDQuery
    Active = True
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      '  pr.id_produto,'
      '  pr.nome_prod,'
      '  pr.preco_prod,'
      '  SUM(ip.quantidade_item) AS qtd_vendida,'
      '  SUM(ip.valor_total) AS total_vendido'
      'FROM produtos pr'
      'INNER JOIN itens_pedido ip ON pr.id_produto = ip.id_produto'
      'INNER JOIN pedidos p ON ip.id_pedido = p.id_pedido'
      'WHERE pr.id_comercio = :IdComercio'
      '  AND p.data_pedido >= :DataInicio'
      '  AND p.data_pedido < :DataFim + INTERVAL '#39'1 day'#39
      '  AND p.id_status_pedido = 5'
      'GROUP BY pr.id_produto, pr.nome_prod, pr.preco_prod'
      'ORDER BY qtd_vendida DESC;'
      '')
    Left = 296
    Top = 400
    ParamData = <
      item
        Name = 'IDCOMERCIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATAINICIO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATAFIM'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
  end
  object frxDSDonoProdutos: TfrxDBDataset
    UserName = 'frxDSDono'
    CloseDataSource = False
    DataSet = qDonoProdutosMaisVendidos
    BCDToCurrency = False
    DataSetOptions = []
    Left = 648
    Top = 400
    FieldDefs = <
      item
        FieldName = 'id_produto'
      end
      item
        FieldName = 'nome_prod'
        FieldType = fftString
        Size = 255
      end
      item
        FieldName = 'preco_prod'
      end
      item
        FieldName = 'qtd_vendida'
        Size = 64
      end
      item
        FieldName = 'total_vendido'
        Size = 64
      end>
  end
  object frxDSAdminLojas: TfrxDBDataset
    UserName = 'frxDSAdmin'
    CloseDataSource = False
    DataSet = qAdminFaturamentoPorLoja
    BCDToCurrency = False
    DataSetOptions = []
    Left = 648
    Top = 240
    FieldDefs = <
      item
        FieldName = 'id_comercio'
      end
      item
        FieldName = 'nome_comercio'
        FieldType = fftString
        Size = 255
      end
      item
        FieldName = 'qtd_pedidos'
      end
      item
        FieldName = 'faturamento_loja'
        Size = 64
      end
      item
        FieldName = 'total_taxas'
        Size = 64
      end>
  end
end
