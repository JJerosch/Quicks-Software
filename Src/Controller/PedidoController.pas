unit PedidoController;

interface

uses
  System.SysUtils, System.Generics.Collections, PedidoModel, PedidoService;

type
  TPedidoController = class
  private
    FService: TPedidoService;
  public
    constructor Create;
    destructor Destroy; override;

    // ⭐ CRIAR PEDIDO (chamado pelo botão "Finalizar Pedido")
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

{ TPedidoController }

constructor TPedidoController.Create;
begin
  inherited Create;
  FService := TPedidoService.Create;
end;

destructor TPedidoController.Destroy;
begin
  FService.Free;
  inherited;
end;

// ========================================
// ⭐ CRIAR PEDIDO
// ========================================

function TPedidoController.CriarPedido(Pedido: TPedido; out IdPedido: Integer;
  out MsgErro: String): Boolean;
begin
  try
    Result := FService.CriarPedido(Pedido, IdPedido, MsgErro);
  except
    on E: Exception do
    begin
      Result := False;
      MsgErro := 'Erro no controller: ' + E.Message;
    end;
  end;
end;

// ========================================
// ⭐ OBTER PEDIDO
// ========================================

function TPedidoController.ObterPedido(IdPedido: Integer): TPedido;
begin
  Result := FService.ObterPedido(IdPedido);
end;

// ========================================
// ⭐ LISTAR PEDIDOS DO CLIENTE
// ========================================

function TPedidoController.ListarPedidosCliente(IdCliente: Integer): TObjectList<TPedido>;
begin
  Result := FService.ListarPedidosCliente(IdCliente);
end;

// ========================================
// ⭐ LISTAR PEDIDOS DO COMÉRCIO
// ========================================

function TPedidoController.ListarPedidosComercio(IdComercio: Integer): TObjectList<TPedido>;
begin
  Result := FService.ListarPedidosComercio(IdComercio);
end;

// ========================================
// ⭐ LISTAR PEDIDOS DISPONÍVEIS
// ========================================

function TPedidoController.ListarPedidosDisponiveis: TObjectList<TPedido>;
begin
  Result := FService.ListarPedidosDisponiveis;
end;

// ========================================
// ⭐ LISTAR PEDIDOS DO ENTREGADOR
// ========================================

function TPedidoController.ListarPedidosEntregador(IdEntregador: Integer): TObjectList<TPedido>;
begin
  Result := FService.ListarPedidosEntregador(IdEntregador);
end;

// ========================================
// ⭐ ACEITAR ENTREGA
// ========================================

function TPedidoController.AceitarEntrega(IdPedido: Integer; IdEntregador: Integer;
  out MsgErro: String): Boolean;
begin
  Result := FService.AceitarEntrega(IdPedido, IdEntregador, MsgErro);
end;

// ========================================
// ⭐ ATUALIZAR STATUS
// ========================================

function TPedidoController.AtualizarStatus(IdPedido: Integer; NovoStatus: Integer): Boolean;
begin
  Result := FService.AtualizarStatus(IdPedido, NovoStatus);
end;

// ========================================
// ⭐ MARCAR COMO ENTREGUE
// ========================================

function TPedidoController.MarcarComoEntregue(IdPedido: Integer): Boolean;
begin
  Result := FService.MarcarComoEntregue(IdPedido);
end;

// ========================================
// ⭐ CANCELAR PEDIDO
// ========================================

function TPedidoController.CancelarPedido(IdPedido: Integer; out MsgErro: String): Boolean;
begin
  Result := FService.CancelarPedido(IdPedido, MsgErro);
end;

end.
