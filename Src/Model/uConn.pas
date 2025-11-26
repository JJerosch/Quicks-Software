unit uConn;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Dialogs, frxSmartMemo, frxClass, frxDBSet,
  frCoreClasses;

type
  TDM = class(TDataModule)
    FDConn: TFDConnection;
    FDQr: TFDQuery;
    DS: TDataSource;
    DL: TFDPhysPgDriverLink;
    qAdminPedidosDetalhe: TFDQuery;
    frxDOnoRelatorioVendas: TfrxReport;
    frxAdminRelatorioGeral: TfrxReport;
    frxDSAdmin: TfrxDBDataset;
    frxEntregadorExtrato: TfrxReport;
    frxDSDono: TfrxDBDataset;
    frxDSEntregador: TfrxDBDataset;
    qEntregadorExtrato: TFDQuery;
    qAdminKPI: TFDQuery;
    qAdminFaturamentoPorLoja: TFDQuery;
    qDonoKPI: TFDQuery;
    qDonoPedidosDetalhe: TFDQuery;
    qEntregadorKPI: TFDQuery;
    frxDOnoRElatorioProdutos: TfrxReport;
    frxAdminRElatorioLojas: TfrxReport;
    qDonoProdutosMaisVendidos: TFDQuery;
    qEntregadorExtratoid_pedido: TLargeintField;
    qEntregadorExtratodata_pedido: TSQLTimeStampField;
    qEntregadorExtratonome_comercio: TWideStringField;
    qEntregadorExtratoendereco_entrega: TWideMemoField;
    qEntregadorExtratotaxa_entrega: TBCDField;
    qEntregadorExtratostatus_pedido: TWideStringField;
    frxDSDonoProdutos: TfrxDBDataset;
    frxDSAdminLojas: TfrxDBDataset;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CarregarAdminKPI(DataInicio, DataFim: TDate; IdComercio: Integer);
    procedure GerarAdminRelatorioGeral(DataInicio, DataFim: TDate; IdComercio: Integer);
    procedure GerarAdminRelatorioLojas(DataInicio, DataFim: TDate);

    procedure CarregarDonoKPI(DataInicio, DataFim: TDate; IdComercio: Integer);
    procedure GerarDonoRelatorioVendas(DataInicio, DataFim: TDate; IdComercio: Integer);
    procedure GerarDonoRelatorioProdutos(DataInicio, DataFim: TDate; IdComercio: Integer);

    procedure CarregarEntregadorKPI(DataInicio, DataFim: TDate; IdEntregador: Integer);
    procedure GerarEntregadorExtrato(DataInicio, DataFim: TDate; IdEntregador: Integer);
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

// ============================================
// ADMIN
// ============================================

procedure TDM.CarregarAdminKPI(DataInicio, DataFim: TDate; IdComercio: Integer);
begin
  with qAdminKPI do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ');
    SQL.Add('  COUNT(p.id_pedido) AS TotalPedidos,');
    SQL.Add('  COALESCE(SUM(p.valor_total_pedido), 0) AS Faturamento');
    SQL.Add('FROM pedidos p');
    SQL.Add('WHERE p.data_pedido >= :DataInicio');
    SQL.Add('  AND p.data_pedido < :DataFim + INTERVAL ''1 day''');
    SQL.Add('  AND p.id_status_pedido = 5');
    SQL.Add('  AND (:IdComercio = 0 OR p.id_comercio = :IdComercio)');
    ParamByName('DataInicio').AsDate := DataInicio;
    ParamByName('DataFim').AsDate := DataFim;
    ParamByName('IdComercio').AsInteger := IdComercio;
    Open;
  end;
end;

procedure TDM.GerarAdminRelatorioGeral(DataInicio, DataFim: TDate; IdComercio: Integer);
begin
  with qAdminPedidosDetalhe do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ');
    SQL.Add('  p.id_pedido,');
    SQL.Add('  p.data_pedido,');
    SQL.Add('  c.nome_comercio,');
    SQL.Add('  fp.nome_estado AS status_pedido,');
    SQL.Add('  p.valor_total_pedido,');
    SQL.Add('  p.taxa_entrega,');
    SQL.Add('  p.endereco_entrega');
    SQL.Add('FROM pedidos p');
    SQL.Add('INNER JOIN comercios c ON p.id_comercio = c.id_comercio');
    SQL.Add('INNER JOIN filtros_pedidos fp ON p.id_status_pedido = fp.id_estado');
    SQL.Add('WHERE p.data_pedido >= :DataInicio');
    SQL.Add('  AND p.data_pedido < :DataFim + INTERVAL ''1 day''');
    SQL.Add('  AND (:IdComercio = 0 OR p.id_comercio = :IdComercio)');
    SQL.Add('ORDER BY p.data_pedido DESC');
    ParamByName('DataInicio').AsDate := DataInicio;
    ParamByName('DataFim').AsDate := DataFim;
    ParamByName('IdComercio').AsInteger := IdComercio;
    Open;
  end;

  frxDSAdmin.DataSet := qAdminPedidosDetalhe;
  frxAdminRelatorioGeral.ShowReport();
end;

procedure TDM.GerarAdminRelatorioLojas(DataInicio, DataFim: TDate);
begin
  with qAdminFaturamentoPorLoja do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ');
    SQL.Add('  c.id_comercio,');
    SQL.Add('  c.nome_comercio,');
    SQL.Add('  COUNT(p.id_pedido) AS qtd_pedidos,');
    SQL.Add('  COALESCE(SUM(p.valor_total_pedido), 0) AS faturamento_loja,');
    SQL.Add('  COALESCE(SUM(p.taxa_entrega), 0) AS total_taxas');
    SQL.Add('FROM comercios c');
    SQL.Add('LEFT JOIN pedidos p ON c.id_comercio = p.id_comercio');
    SQL.Add('  AND p.data_pedido >= :DataInicio');
    SQL.Add('  AND p.data_pedido < :DataFim + INTERVAL ''1 day''');
    SQL.Add('  AND p.id_status_pedido = 5');
    SQL.Add('WHERE c.ativo = true');
    SQL.Add('GROUP BY c.id_comercio, c.nome_comercio');
    SQL.Add('ORDER BY faturamento_loja DESC');
    ParamByName('DataInicio').AsDate := DataInicio;
    ParamByName('DataFim').AsDate := DataFim;
    Open;
  end;

  frxDSAdmin.DataSet := qAdminFaturamentoPorLoja;
  frxAdminRelatorioLojas.ShowReport();
end;

// ============================================
// DONO
// ============================================

procedure TDM.CarregarDonoKPI(DataInicio, DataFim: TDate; IdComercio: Integer);
begin
  with qDonoKPI do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ');
    SQL.Add('  COUNT(p.id_pedido) AS TotalPedidos,');
    SQL.Add('  COALESCE(SUM(p.valor_total_pedido), 0) AS Faturamento');
    SQL.Add('FROM pedidos p');
    SQL.Add('WHERE p.id_comercio = :IdComercio');
    SQL.Add('  AND p.data_pedido >= :DataInicio');
    SQL.Add('  AND p.data_pedido < :DataFim + INTERVAL ''1 day''');
    SQL.Add('  AND p.id_status_pedido = 5');
    ParamByName('DataInicio').AsDate := DataInicio;
    ParamByName('DataFim').AsDate := DataFim;
    ParamByName('IdComercio').AsInteger := IdComercio;
    Open;
  end;
end;

procedure TDM.GerarDonoRelatorioVendas(DataInicio, DataFim: TDate; IdComercio: Integer);
begin
  with qDonoPedidosDetalhe do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ');
    SQL.Add('  p.id_pedido,');
    SQL.Add('  p.data_pedido,');
    SQL.Add('  fp.nome_estado AS status_pedido,');
    SQL.Add('  p.valor_total_pedido,');
    SQL.Add('  p.taxa_entrega,');
    SQL.Add('  p.endereco_entrega,');
    SQL.Add('  CASE WHEN p.recebeu_entrega THEN ''Sim'' ELSE ''Não'' END AS entregue');
    SQL.Add('FROM pedidos p');
    SQL.Add('INNER JOIN filtros_pedidos fp ON p.id_status_pedido = fp.id_estado');
    SQL.Add('WHERE p.id_comercio = :IdComercio');
    SQL.Add('  AND p.data_pedido >= :DataInicio');
    SQL.Add('  AND p.data_pedido < :DataFim + INTERVAL ''1 day''');
    SQL.Add('ORDER BY p.data_pedido DESC');
    ParamByName('DataInicio').AsDate := DataInicio;
    ParamByName('DataFim').AsDate := DataFim;
    ParamByName('IdComercio').AsInteger := IdComercio;
    Open;
  end;

  frxDSDono.DataSet := qDonoPedidosDetalhe;
  frxDonoRelatorioVendas.ShowReport();
end;

procedure TDM.GerarDonoRelatorioProdutos(DataInicio, DataFim: TDate; IdComercio: Integer);
begin
  with qDonoProdutosMaisVendidos do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ');
    SQL.Add('  pr.id_produto,');
    SQL.Add('  pr.nome_prod,');
    SQL.Add('  pr.preco_prod,');
    SQL.Add('  SUM(ip.quantidade_item) AS qtd_vendida,');
    SQL.Add('  SUM(ip.valor_total) AS total_vendido');
    SQL.Add('FROM produtos pr');
    SQL.Add('INNER JOIN itens_pedido ip ON pr.id_produto = ip.id_produto');
    SQL.Add('INNER JOIN pedidos p ON ip.id_pedido = p.id_pedido');
    SQL.Add('WHERE pr.id_comercio = :IdComercio');
    SQL.Add('  AND p.data_pedido >= :DataInicio');
    SQL.Add('  AND p.data_pedido < :DataFim + INTERVAL ''1 day''');
    SQL.Add('  AND p.id_status_pedido = 5');
    SQL.Add('GROUP BY pr.id_produto, pr.nome_prod, pr.preco_prod');
    SQL.Add('ORDER BY qtd_vendida DESC');
    ParamByName('DataInicio').AsDate := DataInicio;
    ParamByName('DataFim').AsDate := DataFim;
    ParamByName('IdComercio').AsInteger := IdComercio;
    Open;
  end;

  frxDSDono.DataSet := qDonoProdutosMaisVendidos;
  frxDonoRelatorioProdutos.ShowReport();
end;

// ============================================
// ENTREGADOR
// ============================================

procedure TDM.CarregarEntregadorKPI(DataInicio, DataFim: TDate; IdEntregador: Integer);
begin
  with qEntregadorKPI do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ');
    SQL.Add('  COUNT(p.id_pedido) AS TotalEntregas,');
    SQL.Add('  COALESCE(SUM(p.taxa_entrega), 0) AS FaturamentoTaxas');
    SQL.Add('FROM pedidos p');
    SQL.Add('WHERE p.id_entregador = :IdEntregador');
    SQL.Add('  AND p.data_pedido >= :DataInicio');
    SQL.Add('  AND p.data_pedido < :DataFim + INTERVAL ''1 day''');
    SQL.Add('  AND p.id_status_pedido = 5');
    SQL.Add('  AND p.recebeu_entrega = true');
    ParamByName('DataInicio').AsDate := DataInicio;
    ParamByName('DataFim').AsDate := DataFim;
    ParamByName('IdEntregador').AsInteger := IdEntregador;
    Open;
  end;
end;

procedure TDM.GerarEntregadorExtrato(DataInicio, DataFim: TDate; IdEntregador: Integer);
begin
  // 1. PRIMEIRO: Executa a query com os parâmetros
  with qEntregadorExtrato do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ');
    SQL.Add('  p.id_pedido,');
    SQL.Add('  p.data_pedido,');
    SQL.Add('  c.nome_comercio,');
    SQL.Add('  p.endereco_entrega,');
    SQL.Add('  p.taxa_entrega,');
    SQL.Add('  fp.nome_estado AS status_pedido');
    SQL.Add('FROM pedidos p');
    SQL.Add('INNER JOIN comercios c ON p.id_comercio = c.id_comercio');
    SQL.Add('INNER JOIN filtros_pedidos fp ON p.id_status_pedido = fp.id_estado');
    SQL.Add('WHERE p.id_entregador = :IdEntregador');
    SQL.Add('  AND p.data_pedido >= :DataInicio');
    SQL.Add('  AND p.data_pedido < :DataFim + INTERVAL ''1 day''');
    SQL.Add('ORDER BY p.data_pedido DESC');
    ParamByName('DataInicio').AsDate := DataInicio;
    ParamByName('DataFim').AsDate := DataFim;
    ParamByName('IdEntregador').AsInteger := IdEntregador;
    Open;
  end;

  // 2. Vincula o dataset
  frxDSEntregador.DataSet := qEntregadorExtrato;

  // 3. Carrega o template com o CAMINHO COMPLETO
  frxEntregadorExtrato.LoadFromFile('C:\Users\jpjer\Documents\Embarcadero\Studio\Projects\Quicks-Software\Relatórios\EntregadorExtrato.fr3');

  // 4. Passa parâmetros para o relatório (opcional - para exibir no cabeçalho)
  frxEntregadorExtrato.Variables['DataInicio'] := QuotedStr(DateToStr(DataInicio));
  frxEntregadorExtrato.Variables['DataFim'] := QuotedStr(DateToStr(DataFim));

  // 5. Mostra o relatório
  frxEntregadorExtrato.ShowReport();
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  qAdminKPI.SQL.Clear;
  qAdminPedidosDetalhe.SQL.Clear;
  qAdminFaturamentoPorLoja.SQL.Clear;

  qDonoKPI.SQL.Clear;
  qDonoPedidosDetalhe.SQL.Clear;
  qDonoProdutosMaisVendidos.SQL.Clear;

  qEntregadorKPI.SQL.Clear;
  qEntregadorExtrato.SQL.Clear;

  frxDSAdmin.FieldAliases.Clear;
  frxDSDono.FieldAliases.Clear;
  frxDSEntregador.FieldAliases.Clear;

  FDConn.Params.Add('CharacterSet=UTF8');
  try
      if not FDConn.Connected then
      begin
        FDConn.Connected := True;
      end;
    except
      on E: Exception do
        ShowMessage('Erro na conexão: ' + E.Message);
    end;
  end;
end.
