unit PedidoRepository;

interface

uses
  System.SysUtils, System.Generics.Collections, FireDAC.Comp.Client,
  FireDAC.Stan.Param, Data.DB, PedidoModel, uConn;

type
  TPedidoRepository = class
  private
    function CriarQueryPedido: TFDQuery;
    function CriarQueryItens: TFDQuery;
  public
    // ⭐ CRIAR PEDIDO
    function InserirPedido(Pedido: TPedido; out IdPedido: Integer): Boolean;
    function InserirItensPedido(IdPedido: Integer; Itens: TObjectList<TItemPedido>): Boolean;

    // ⭐ CONSULTAR PEDIDOS
    function ObterPedido(IdPedido: Integer): TPedido;
    function ListarPedidosCliente(IdCliente: Integer): TObjectList<TPedido>;
    function ListarPedidosComercio(IdComercio: Integer): TObjectList<TPedido>;

    // ⭐ ENTREGADORES
    function ListarPedidosDisponiveis: TObjectList<TPedido>; // Status 3, sem entregador
    function ListarPedidosEntregador(IdEntregador: Integer): TObjectList<TPedido>;
    function AceitarEntrega(IdPedido: Integer; IdEntregador: Integer): Boolean;

    // ⭐ ATUALIZAR STATUS
    function AtualizarStatus(IdPedido: Integer; NovoStatus: Integer): Boolean;
    function MarcarComoEntregue(IdPedido: Integer): Boolean;

    // ⭐ CANCELAR
    function CancelarPedido(IdPedido: Integer): Boolean;
  end;

implementation

{ TPedidoRepository }

function TPedidoRepository.CriarQueryPedido: TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := DM.FDConn;
end;

function TPedidoRepository.CriarQueryItens: TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := DM.FDConn;
end;

// ========================================
// ⭐ INSERIR PEDIDO NO BANCO
// ========================================

function TPedidoRepository.InserirPedido(Pedido: TPedido; out IdPedido: Integer): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;
  IdPedido := 0;

  if not Assigned(Pedido) then
    Exit;

  Qr := CriarQueryPedido;
  try
    try
      Qr.SQL.Text :=
        'INSERT INTO pedidos ( ' +
        '  id_clie, ' +
        '  id_comercio, ' +
        '  id_status_pedido, ' +
        '  id_tipo_pagamento, ' +
        '  id_entregador, ' +          // ⭐ NOVO CAMPO
        '  valor_total_pedido, ' +
        '  taxa_entrega, ' +
        '  endereco_entrega, ' +
        '  data_pedido, ' +
        '  entregado ' +
        ') VALUES ( ' +
        '  :id_clie, ' +
        '  :id_comercio, ' +
        '  :id_status_pedido, ' +
        '  :id_tipo_pagamento, ' +
        '  :id_entregador, ' +          // ⭐ NOVO
        '  :valor_total_pedido, ' +
        '  :taxa_entrega, ' +
        '  :endereco_entrega, ' +
        '  CURRENT_TIMESTAMP, ' +
        '  :entregado ' +
        ') RETURNING id_pedido';

      Qr.ParamByName('id_clie').AsInteger := Pedido.IdClie;
      Qr.ParamByName('id_comercio').AsInteger := Pedido.IdComercio;
      Qr.ParamByName('id_status_pedido').AsInteger := 0; // ⭐ SEMPRE começa em Pendente
      Qr.ParamByName('id_tipo_pagamento').AsInteger := Pedido.IdTipoPagamento;

      // ⭐ ENTREGADOR SEMPRE NULL NO INÍCIO
      if Pedido.IdEntregador > 0 then
        Qr.ParamByName('id_entregador').AsInteger := Pedido.IdEntregador
      else
      begin
        Qr.ParamByName('id_entregador').DataType := ftInteger;
        Qr.ParamByName('id_entregador').Clear;
      end;

      Qr.ParamByName('valor_total_pedido').AsCurrency := Pedido.ValorTotalPedido;
      Qr.ParamByName('taxa_entrega').AsCurrency := Pedido.TaxaEntrega;
      Qr.ParamByName('endereco_entrega').AsString := Pedido.EnderecoEntrega;
      Qr.ParamByName('entregado').AsBoolean := False; // ⭐ SEMPRE False no início

      Qr.Open;

      if not Qr.IsEmpty then
      begin
        IdPedido := Qr.FieldByName('id_pedido').AsInteger;
        Result := True;
      end;

    except
      on E: Exception do
      begin
        Result := False;
        raise Exception.Create('Erro ao inserir pedido: ' + E.Message);
      end;
    end;
  finally
    Qr.Free;
  end;
end;

// ========================================
// ⭐ INSERIR ITENS DO PEDIDO
// ========================================

function TPedidoRepository.InserirItensPedido(IdPedido: Integer;
  Itens: TObjectList<TItemPedido>): Boolean;
var
  Qr: TFDQuery;
  Item: TItemPedido;
begin
  Result := False;

  if (IdPedido <= 0) or not Assigned(Itens) or (Itens.Count = 0) then
    Exit;

  Qr := CriarQueryItens;
  try
    try
      for Item in Itens do
      begin
        Qr.SQL.Text :=
          'INSERT INTO itens_pedido ( ' +
          '  id_pedido, ' +
          '  id_produto, ' +
          '  quantidade_item, ' +
          '  preco_prod, ' +
          '  valor_total, ' +
          '  observacoes ' +
          ') VALUES ( ' +
          '  :id_pedido, ' +
          '  :id_produto, ' +
          '  :quantidade_item, ' +
          '  :preco_prod, ' +
          '  :valor_total, ' +
          '  :observacoes ' +
          ')';

        Qr.ParamByName('id_pedido').AsInteger := IdPedido;
        Qr.ParamByName('id_produto').AsInteger := Item.IdProduto;
        Qr.ParamByName('quantidade_item').AsInteger := Item.QuantidadeItem;
        Qr.ParamByName('preco_prod').AsCurrency := Item.PrecoProd;
        Qr.ParamByName('valor_total').AsCurrency := Item.CalcularSubtotal;
        Qr.ParamByName('observacoes').AsString := Item.Observacoes;

        Qr.ExecSQL;
      end;

      Result := True;

    except
      on E: Exception do
      begin
        Result := False;
        raise Exception.Create('Erro ao inserir itens: ' + E.Message);
      end;
    end;
  finally
    Qr.Free;
  end;
end;

// ========================================
// ⭐ OBTER PEDIDO POR ID
// ========================================

function TPedidoRepository.ObterPedido(IdPedido: Integer): TPedido;
var
  Qr, QrItens: TFDQuery;
  Item: TItemPedido;
begin
  Result := nil;

  if IdPedido <= 0 then
    Exit;

  Qr := CriarQueryPedido;
  QrItens := CriarQueryItens;
  try
    // Buscar pedido
    Qr.SQL.Text :=
      'SELECT * FROM pedidos WHERE id_pedido = :id_pedido';
    Qr.ParamByName('id_pedido').AsInteger := IdPedido;
    Qr.Open;

    if Qr.IsEmpty then
      Exit;

    Result := TPedido.Create;
    Result.IdPedido := Qr.FieldByName('id_pedido').AsInteger;
    Result.IdClie := Qr.FieldByName('id_clie').AsInteger;
    Result.IdComercio := Qr.FieldByName('id_comercio').AsInteger;
    Result.IdStatusPedido := Qr.FieldByName('id_status_pedido').AsInteger;
    Result.IdTipoPagamento := Qr.FieldByName('id_tipo_pagamento').AsInteger;

    // ⭐ ENTREGADOR (pode ser NULL)
    if not Qr.FieldByName('id_entregador').IsNull then
      Result.IdEntregador := Qr.FieldByName('id_entregador').AsInteger
    else
      Result.IdEntregador := 0;

    Result.ValorTotalPedido := Qr.FieldByName('valor_total_pedido').AsCurrency;
    Result.TaxaEntrega := Qr.FieldByName('taxa_entrega').AsCurrency;
    Result.EnderecoEntrega := Qr.FieldByName('endereco_entrega').AsString;
    Result.DataPedido := Qr.FieldByName('data_pedido').AsDateTime;
    Result.Entregado := Qr.FieldByName('entregado').AsBoolean;

    // Buscar itens
    QrItens.SQL.Text :=
      'SELECT * FROM itens_pedido WHERE id_pedido = :id_pedido';
    QrItens.ParamByName('id_pedido').AsInteger := IdPedido;
    QrItens.Open;

    while not QrItens.Eof do
    begin
      Item := TItemPedido.Create;
      Item.IdItemPedido := QrItens.FieldByName('id_item_pedido').AsInteger;
      Item.IdPedido := IdPedido;
      Item.IdProduto := QrItens.FieldByName('id_produto').AsInteger;
      Item.QuantidadeItem := QrItens.FieldByName('quantidade_item').AsInteger;
      Item.PrecoProd := QrItens.FieldByName('preco_prod').AsCurrency;
      Item.ValorTotal := QrItens.FieldByName('valor_total').AsCurrency;

      // ⭐ LER OBSERVAÇÕES DO ITEM
      if not QrItens.FieldByName('observacoes').IsNull then
        Item.Observacoes := QrItens.FieldByName('observacoes').AsString
      else
        Item.Observacoes := '';

      Result.AdicionarItem(Item);
      QrItens.Next;
    end;

  finally
    Qr.Free;
    QrItens.Free;
  end;
end;

// ========================================
// ⭐ LISTAR PEDIDOS DO CLIENTE
// ========================================

function TPedidoRepository.ListarPedidosCliente(IdCliente: Integer): TObjectList<TPedido>;
var
  Qr: TFDQuery;
  Pedido: TPedido;
begin
  Result := TObjectList<TPedido>.Create(True);

  if IdCliente <= 0 then
    Exit;

  Qr := CriarQueryPedido;
  try
    Qr.SQL.Text :=
      'SELECT * FROM pedidos ' +
      'WHERE id_clie = :id_clie ' +
      'ORDER BY data_pedido DESC';
    Qr.ParamByName('id_clie').AsInteger := IdCliente;
    Qr.Open;

    while not Qr.Eof do
    begin
      Pedido := TPedido.Create;
      Pedido.IdPedido := Qr.FieldByName('id_pedido').AsInteger;
      Pedido.IdClie := Qr.FieldByName('id_clie').AsInteger;
      Pedido.IdComercio := Qr.FieldByName('id_comercio').AsInteger;
      Pedido.IdStatusPedido := Qr.FieldByName('id_status_pedido').AsInteger;
      Pedido.ValorTotalPedido := Qr.FieldByName('valor_total_pedido').AsCurrency;
      Pedido.DataPedido := Qr.FieldByName('data_pedido').AsDateTime;
      Pedido.Entregado := Qr.FieldByName('entregado').AsBoolean;

      // ⭐ ENTREGADOR (pode ser NULL)
      if not Qr.FieldByName('id_entregador').IsNull then
        Pedido.IdEntregador := Qr.FieldByName('id_entregador').AsInteger;

      Result.Add(Pedido);
      Qr.Next;
    end;

  finally
    Qr.Free;
  end;
end;

// ========================================
// ⭐ LISTAR PEDIDOS DISPONÍVEIS (para entregadores)
// ========================================

function TPedidoRepository.ListarPedidosDisponiveis: TObjectList<TPedido>;
var
  Qr: TFDQuery;
  Pedido: TPedido;
begin
  Result := TObjectList<TPedido>.Create(True);

  Qr := CriarQueryPedido;
  try
    Qr.SQL.Text :=
      'SELECT p.*, c.nome_comercio ' +
      'FROM pedidos p ' +
      'INNER JOIN comercios c ON p.id_comercio = c.id_comercio ' +
      'WHERE p.id_entregador IS NULL ' +        // ⭐ SEM ENTREGADOR
      '  AND p.id_status_pedido = 3 ' +        // Status "Pronto p/Entrega"
      '  AND p.entregado = FALSE ' +
      'ORDER BY p.data_pedido ASC';            // Mais antigos primeiro
    Qr.Open;

    while not Qr.Eof do
    begin
      Pedido := TPedido.Create;
      Pedido.IdPedido := Qr.FieldByName('id_pedido').AsInteger;
      Pedido.IdComercio := Qr.FieldByName('id_comercio').AsInteger;
      Pedido.ValorTotalPedido := Qr.FieldByName('valor_total_pedido').AsCurrency;
      Pedido.TaxaEntrega := Qr.FieldByName('taxa_entrega').AsCurrency;
      Pedido.EnderecoEntrega := Qr.FieldByName('endereco_entrega').AsString;
      Pedido.DataPedido := Qr.FieldByName('data_pedido').AsDateTime;
      Pedido.IdEntregador := 0; // NULL

      Result.Add(Pedido);
      Qr.Next;
    end;

  finally
    Qr.Free;
  end;
end;

// ========================================
// ⭐ ACEITAR ENTREGA (entregador aceita o pedido)
// ========================================

function TPedidoRepository.AceitarEntrega(IdPedido: Integer; IdEntregador: Integer): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;

  if (IdPedido <= 0) or (IdEntregador <= 0) then
    Exit;

  Qr := CriarQueryPedido;
  try
    try
      Qr.SQL.Text :=
        'UPDATE pedidos ' +
        'SET id_entregador = :id_entregador, ' +
        '    id_status_pedido = 4 ' +
        'WHERE id_pedido = :id_pedido ' +
        '  AND id_entregador IS NULL ' +
        '  AND id_status_pedido = 3';

      Qr.ParamByName('id_entregador').AsInteger := IdEntregador;
      Qr.ParamByName('id_pedido').AsInteger := IdPedido;

      Qr.ExecSQL;

      Result := (Qr.RowsAffected > 0);

    except
      on E: Exception do
      begin
        Result := False;
        raise Exception.Create('Erro ao aceitar entrega: ' + E.Message);
      end;
    end;
  finally
    Qr.Free;
  end;
end;

// ========================================
// ⭐ ATUALIZAR STATUS DO PEDIDO
// ========================================

function TPedidoRepository.AtualizarStatus(IdPedido: Integer; NovoStatus: Integer): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;

  if (IdPedido <= 0) or (NovoStatus < 0) or (NovoStatus > 6) then
    Exit;

  Qr := CriarQueryPedido;
  try
    try
      Qr.SQL.Text :=
        'UPDATE pedidos ' +
        'SET id_status_pedido = :status ' +
        'WHERE id_pedido = :id_pedido';

      Qr.ParamByName('status').AsInteger := NovoStatus;
      Qr.ParamByName('id_pedido').AsInteger := IdPedido;

      Qr.ExecSQL;
      Result := True;

    except
      on E: Exception do
      begin
        Result := False;
        raise Exception.Create('Erro ao atualizar status: ' + E.Message);
      end;
    end;
  finally
    Qr.Free;
  end;
end;

// ========================================
// ⭐ MARCAR COMO ENTREGUE
// ========================================

function TPedidoRepository.MarcarComoEntregue(IdPedido: Integer): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;

  if IdPedido <= 0 then
    Exit;

  Qr := CriarQueryPedido;
  try
    try
      Qr.SQL.Text :=
        'UPDATE pedidos ' +
        'SET id_status_pedido = 5, ' +         // Status "Entregue"
        '    entregado = TRUE ' +
        'WHERE id_pedido = :id_pedido';

      Qr.ParamByName('id_pedido').AsInteger := IdPedido;
      Qr.ExecSQL;
      Result := True;

    except
      on E: Exception do
      begin
        Result := False;
        raise Exception.Create('Erro ao marcar como entregue: ' + E.Message);
      end;
    end;
  finally
    Qr.Free;
  end;
end;

// ========================================
// ⭐ CANCELAR PEDIDO
// ========================================

function TPedidoRepository.CancelarPedido(IdPedido: Integer): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;

  if IdPedido <= 0 then
    Exit;

  Qr := CriarQueryPedido;
  try
    try
      Qr.SQL.Text :=
        'UPDATE pedidos ' +
        'SET id_status_pedido = 6 ' +          // Status "Cancelado"
        'WHERE id_pedido = :id_pedido ' +
        '  AND entregado = FALSE';             // Não cancela se já entregue

      Qr.ParamByName('id_pedido').AsInteger := IdPedido;
      Qr.ExecSQL;
      Result := True;

    except
      on E: Exception do
      begin
        Result := False;
        raise Exception.Create('Erro ao cancelar pedido: ' + E.Message);
      end;
    end;
  finally
    Qr.Free;
  end;
end;

// ========================================
// ⭐ LISTAR PEDIDOS DO COMÉRCIO
// ========================================

function TPedidoRepository.ListarPedidosComercio(IdComercio: Integer): TObjectList<TPedido>;
var
  Qr: TFDQuery;
  Pedido: TPedido;
begin
  Result := TObjectList<TPedido>.Create(True);

  if IdComercio <= 0 then
    Exit;

  Qr := CriarQueryPedido;
  try
    Qr.SQL.Text :=
      'SELECT * FROM pedidos ' +
      'WHERE id_comercio = :id_comercio ' +
      'ORDER BY data_pedido DESC';
    Qr.ParamByName('id_comercio').AsInteger := IdComercio;
    Qr.Open;

    while not Qr.Eof do
    begin
      Pedido := TPedido.Create;
      Pedido.IdPedido := Qr.FieldByName('id_pedido').AsInteger;
      Pedido.IdClie := Qr.FieldByName('id_clie').AsInteger;
      Pedido.IdComercio := Qr.FieldByName('id_comercio').AsInteger;
      Pedido.IdStatusPedido := Qr.FieldByName('id_status_pedido').AsInteger;
      Pedido.ValorTotalPedido := Qr.FieldByName('valor_total_pedido').AsCurrency;
      Pedido.DataPedido := Qr.FieldByName('data_pedido').AsDateTime;

      Result.Add(Pedido);
      Qr.Next;
    end;

  finally
    Qr.Free;
  end;
end;

// ========================================
// ⭐ LISTAR PEDIDOS DO ENTREGADOR
// ========================================

function TPedidoRepository.ListarPedidosEntregador(IdEntregador: Integer): TObjectList<TPedido>;
var
  Qr: TFDQuery;
  Pedido: TPedido;
begin
  Result := TObjectList<TPedido>.Create(True);

  if IdEntregador <= 0 then
    Exit;

  Qr := CriarQueryPedido;
  try
    Qr.SQL.Text :=
      'SELECT * FROM pedidos ' +
      'WHERE id_entregador = :id_entregador ' +
      '  AND entregado = FALSE ' +             // Apenas não entregues
      'ORDER BY data_pedido DESC';
    Qr.ParamByName('id_entregador').AsInteger := IdEntregador;
    Qr.Open;

    while not Qr.Eof do
    begin
      Pedido := TPedido.Create;
      Pedido.IdPedido := Qr.FieldByName('id_pedido').AsInteger;
      Pedido.IdComercio := Qr.FieldByName('id_comercio').AsInteger;
      Pedido.IdStatusPedido := Qr.FieldByName('id_status_pedido').AsInteger;
      Pedido.IdEntregador := IdEntregador;
      Pedido.ValorTotalPedido := Qr.FieldByName('valor_total_pedido').AsCurrency;
      Pedido.EnderecoEntrega := Qr.FieldByName('endereco_entrega').AsString;
      Pedido.DataPedido := Qr.FieldByName('data_pedido').AsDateTime;

      Result.Add(Pedido);
      Qr.Next;
    end;

  finally
    Qr.Free;
  end;
end;

end.
