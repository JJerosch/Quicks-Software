unit PedidoService;

interface

uses
  System.SysUtils, System.Generics.Collections, PedidoModel, PedidoRepository;

type
  TPedidoService = class
  private
    FRepository: TPedidoRepository;

    function ValidarPedido(Pedido: TPedido; out MsgErro: String): Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    // ⭐ CRIAR PEDIDO (usado pelo cliente no botão "Finalizar Pedido")
    function CriarPedido(Pedido: TPedido; out IdPedido: Integer; out MsgErro: String): Boolean;

    // ⭐ CONSULTAR
    function ObterPedido(IdPedido: Integer): TPedido;
    function ListarPedidosCliente(IdCliente: Integer): TObjectList<TPedido>;
    function ListarPedidosComercio(IdComercio: Integer): TObjectList<TPedido>;

    // ⭐ ENTREGADORES
    function ListarPedidosDisponiveis: TObjectList<TPedido>;
    function ListarPedidosEntregador(IdEntregador: Integer): TObjectList<TPedido>;
    function AceitarEntrega(IdPedido: Integer; IdEntregador: Integer; out MsgErro: String): Boolean;

    // ⭐ ATUALIZAR
    function AtualizarStatus(IdPedido: Integer; NovoStatus: Integer): Boolean;
    function MarcarComoEntregue(IdPedido: Integer): Boolean;
    function CancelarPedido(IdPedido: Integer; out MsgErro: String): Boolean;
  end;

implementation

{ TPedidoService }

constructor TPedidoService.Create;
begin
  inherited Create;
  FRepository := TPedidoRepository.Create;
end;

destructor TPedidoService.Destroy;
begin
  FRepository.Free;
  inherited;
end;

// ========================================
// ⭐ VALIDAR PEDIDO ANTES DE CRIAR
// ========================================

function TPedidoService.ValidarPedido(Pedido: TPedido; out MsgErro: String): Boolean;
begin
  Result := False;
  MsgErro := '';

  if not Assigned(Pedido) then
  begin
    MsgErro := 'Pedido inválido!';
    Exit;
  end;

  if Pedido.IdClie <= 0 then
  begin
    MsgErro := 'Cliente não informado!';
    Exit;
  end;

  if Pedido.IdComercio <= 0 then
  begin
    MsgErro := 'Comércio não informado!';
    Exit;
  end;

  if Pedido.IdTipoPagamento <= 0 then
  begin
    MsgErro := 'Forma de pagamento não informada!';
    Exit;
  end;

  if Trim(Pedido.EnderecoEntrega) = '' then
  begin
    MsgErro := 'Endereço de entrega não informado!';
    Exit;
  end;

  if not Assigned(Pedido.Itens) or (Pedido.Itens.Count = 0) then
  begin
    MsgErro := 'O pedido deve ter pelo menos 1 item!';
    Exit;
  end;

  if Pedido.ValorTotalPedido <= 0 then
  begin
    MsgErro := 'Valor total do pedido inválido!';
    Exit;
  end;

  Result := True;
end;

// ========================================
// ⭐ CRIAR PEDIDO COMPLETO (Pedido + Itens)
// ========================================

function TPedidoService.CriarPedido(Pedido: TPedido; out IdPedido: Integer;
  out MsgErro: String): Boolean;
begin
  Result := False;
  IdPedido := 0;
  MsgErro := '';

  // Validar pedido
  if not ValidarPedido(Pedido, MsgErro) then
    Exit;

  try
    // ⭐ Calcular valor total (garante que está correto)
    Pedido.CalcularValorTotal;

    // ⭐ Garantir que começa sem entregador
    Pedido.IdEntregador := 0;

    // ⭐ Garantir que começa com status Pendente
    Pedido.IdStatusPedido := 0;

    // ⭐ Garantir que começa como não entregue
    Pedido.Entregado := False;

    // Inserir pedido no banco
    if not FRepository.InserirPedido(Pedido, IdPedido) then
    begin
      MsgErro := 'Erro ao inserir pedido no banco de dados!';
      Exit;
    end;

    // Inserir itens do pedido
    if not FRepository.InserirItensPedido(IdPedido, Pedido.Itens) then
    begin
      MsgErro := 'Erro ao inserir itens do pedido!';
      // TODO: Aqui poderia fazer um rollback do pedido
      Exit;
    end;

    Result := True;

  except
    on E: Exception do
    begin
      Result := False;
      MsgErro := 'Erro ao criar pedido: ' + E.Message;
    end;
  end;
end;

// ========================================
// ⭐ OBTER PEDIDO POR ID
// ========================================

function TPedidoService.ObterPedido(IdPedido: Integer): TPedido;
begin
  try
    Result := FRepository.ObterPedido(IdPedido);
  except
    on E: Exception do
    begin
      Result := nil;
      raise Exception.Create('Erro ao obter pedido: ' + E.Message);
    end;
  end;
end;

// ========================================
// ⭐ LISTAR PEDIDOS DO CLIENTE
// ========================================

function TPedidoService.ListarPedidosCliente(IdCliente: Integer): TObjectList<TPedido>;
begin
  try
    Result := FRepository.ListarPedidosCliente(IdCliente);
  except
    on E: Exception do
    begin
      Result := TObjectList<TPedido>.Create(True);
      raise Exception.Create('Erro ao listar pedidos do cliente: ' + E.Message);
    end;
  end;
end;

// ========================================
// ⭐ LISTAR PEDIDOS DO COMÉRCIO
// ========================================

function TPedidoService.ListarPedidosComercio(IdComercio: Integer): TObjectList<TPedido>;
begin
  try
    Result := FRepository.ListarPedidosComercio(IdComercio);
  except
    on E: Exception do
    begin
      Result := TObjectList<TPedido>.Create(True);
      raise Exception.Create('Erro ao listar pedidos do comércio: ' + E.Message);
    end;
  end;
end;

// ========================================
// ⭐ LISTAR PEDIDOS DISPONÍVEIS (para entregadores)
// ========================================

function TPedidoService.ListarPedidosDisponiveis: TObjectList<TPedido>;
begin
  try
    Result := FRepository.ListarPedidosDisponiveis;
  except
    on E: Exception do
    begin
      Result := TObjectList<TPedido>.Create(True);
      raise Exception.Create('Erro ao listar pedidos disponíveis: ' + E.Message);
    end;
  end;
end;

// ========================================
// ⭐ LISTAR PEDIDOS DO ENTREGADOR
// ========================================

function TPedidoService.ListarPedidosEntregador(IdEntregador: Integer): TObjectList<TPedido>;
begin
  try
    Result := FRepository.ListarPedidosEntregador(IdEntregador);
  except
    on E: Exception do
    begin
      Result := TObjectList<TPedido>.Create(True);
      raise Exception.Create('Erro ao listar pedidos do entregador: ' + E.Message);
    end;
  end;
end;

// ========================================
// ⭐ ACEITAR ENTREGA (com validações)
// ========================================

function TPedidoService.AceitarEntrega(IdPedido: Integer; IdEntregador: Integer;
  out MsgErro: String): Boolean;
var
  Pedido: TPedido;
begin
  Result := False;
  MsgErro := '';

  if IdPedido <= 0 then
  begin
    MsgErro := 'ID do pedido inválido!';
    Exit;
  end;

  if IdEntregador <= 0 then
  begin
    MsgErro := 'ID do entregador inválido!';
    Exit;
  end;

  try
    // Verificar se o pedido existe e está disponível
    Pedido := FRepository.ObterPedido(IdPedido);
    try
      if not Assigned(Pedido) then
      begin
        MsgErro := 'Pedido não encontrado!';
        Exit;
      end;

      if Pedido.IdEntregador > 0 then
      begin
        MsgErro := 'Este pedido já foi aceito por outro entregador!';
        Exit;
      end;

      if Pedido.IdStatusPedido <> 3 then
      begin
        MsgErro := 'Este pedido não está disponível para entrega!';
        Exit;
      end;

    finally
      Pedido.Free;
    end;

    // Tentar aceitar a entrega
    Result := FRepository.AceitarEntrega(IdPedido, IdEntregador);

    if not Result then
      MsgErro := 'Não foi possível aceitar a entrega. Pode ter sido aceita por outro entregador.';

  except
    on E: Exception do
    begin
      Result := False;
      MsgErro := 'Erro ao aceitar entrega: ' + E.Message;
    end;
  end;
end;

// ========================================
// ⭐ ATUALIZAR STATUS
// ========================================

function TPedidoService.AtualizarStatus(IdPedido: Integer; NovoStatus: Integer): Boolean;
begin
  try
    Result := FRepository.AtualizarStatus(IdPedido, NovoStatus);
  except
    on E: Exception do
    begin
      Result := False;
      raise Exception.Create('Erro ao atualizar status: ' + E.Message);
    end;
  end;
end;

// ========================================
// ⭐ MARCAR COMO ENTREGUE
// ========================================

function TPedidoService.MarcarComoEntregue(IdPedido: Integer): Boolean;
begin
  try
    Result := FRepository.MarcarComoEntregue(IdPedido);
  except
    on E: Exception do
    begin
      Result := False;
      raise Exception.Create('Erro ao marcar como entregue: ' + E.Message);
    end;
  end;
end;

// ========================================
// ⭐ CANCELAR PEDIDO (com validações)
// ========================================

function TPedidoService.CancelarPedido(IdPedido: Integer; out MsgErro: String): Boolean;
var
  Pedido: TPedido;
begin
  Result := False;
  MsgErro := '';

  if IdPedido <= 0 then
  begin
    MsgErro := 'ID do pedido inválido!';
    Exit;
  end;

  try
    // Verificar se pode cancelar
    Pedido := FRepository.ObterPedido(IdPedido);
    try
      if not Assigned(Pedido) then
      begin
        MsgErro := 'Pedido não encontrado!';
        Exit;
      end;

      if Pedido.Entregado then
      begin
        MsgErro := 'Não é possível cancelar um pedido já entregue!';
        Exit;
      end;

      if Pedido.IdStatusPedido = 5 then
      begin
        MsgErro := 'Este pedido já foi entregue!';
        Exit;
      end;

    finally
      Pedido.Free;
    end;

    // Cancelar
    Result := FRepository.CancelarPedido(IdPedido);

    if not Result then
      MsgErro := 'Não foi possível cancelar o pedido.';

  except
    on E: Exception do
    begin
      Result := False;
      MsgErro := 'Erro ao cancelar pedido: ' + E.Message;
    end;
  end;
end;

end.
