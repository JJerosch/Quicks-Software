unit PedidoModel;

interface

uses
  System.SysUtils, System.Generics.Collections;

type
  // ⭐ Model para um item do pedido
  TItemPedido = class
  private
    FIdItemPedido: Integer;
    FIdPedido: Integer;
    FIdProduto: Integer;
    FQuantidadeItem: Integer;
    FPrecoProd: Currency;
    FValorTotal: Currency;
    FObservacoes: String;
  public
    property IdItemPedido: Integer read FIdItemPedido write FIdItemPedido;
    property IdPedido: Integer read FIdPedido write FIdPedido;
    property IdProduto: Integer read FIdProduto write FIdProduto;
    property QuantidadeItem: Integer read FQuantidadeItem write FQuantidadeItem;
    property PrecoProd: Currency read FPrecoProd write FPrecoProd;
    property ValorTotal: Currency read FValorTotal write FValorTotal;
    property Observacoes: String read FObservacoes write FObservacoes;

    constructor Create;
    function CalcularSubtotal: Currency;
  end;

  // ⭐ Model principal do Pedido
  TPedido = class
  private
    FIdPedido: Integer;
    FIdClie: Integer;
    FIdComercio: Integer;
    FIdStatusPedido: Integer;
    FIdTipoPagamento: Integer;
    FIdEntregador: Integer; // ⭐ NOVO CAMPO - Pode ser NULL (0 = sem entregador)
    FValorTotalPedido: Currency;
    FDataPedido: TDateTime;
    FEntregado: Boolean;
    FEnderecoEntrega: String;
    FTaxaEntrega: Currency;
    FItens: TObjectList<TItemPedido>;
  public
    property IdPedido: Integer read FIdPedido write FIdPedido;
    property IdClie: Integer read FIdClie write FIdClie;
    property IdComercio: Integer read FIdComercio write FIdComercio;
    property IdStatusPedido: Integer read FIdStatusPedido write FIdStatusPedido;
    property IdTipoPagamento: Integer read FIdTipoPagamento write FIdTipoPagamento;
    property IdEntregador: Integer read FIdEntregador write FIdEntregador; // ⭐ NOVO
    property ValorTotalPedido: Currency read FValorTotalPedido write FValorTotalPedido;
    property DataPedido: TDateTime read FDataPedido write FDataPedido;
    property Entregado: Boolean read FEntregado write FEntregado;
    property EnderecoEntrega: String read FEnderecoEntrega write FEnderecoEntrega;
    property TaxaEntrega: Currency read FTaxaEntrega write FTaxaEntrega;
    property Itens: TObjectList<TItemPedido> read FItens;

    constructor Create;
    destructor Destroy; override;

    procedure AdicionarItem(Item: TItemPedido);
    function CalcularTotalItens: Currency;
    function CalcularValorTotal: Currency;
  end;

implementation

{ TItemPedido }

constructor TItemPedido.Create;
begin
  inherited Create;
  FIdItemPedido := 0;
  FIdPedido := 0;
  FIdProduto := 0;
  FQuantidadeItem := 0;
  FPrecoProd := 0;
  FValorTotal := 0;
  FObservacoes := '';
end;

function TItemPedido.CalcularSubtotal: Currency;
begin
  Result := FPrecoProd * FQuantidadeItem;
  FValorTotal := Result;
end;

{ TPedido }

constructor TPedido.Create;
begin
  inherited Create;
  FIdPedido := 0;
  FIdClie := 0;
  FIdComercio := 0;
  FIdStatusPedido := 0; // Pendente por padrão
  FIdTipoPagamento := 0;
  FIdEntregador := 0; // ⭐ 0 indica NULL (sem entregador)
  FValorTotalPedido := 0;
  FDataPedido := Now;
  FEntregado := False;
  FEnderecoEntrega := '';
  FTaxaEntrega := 0;
  FItens := TObjectList<TItemPedido>.Create(True); // True = libera automaticamente
end;

destructor TPedido.Destroy;
begin
  FItens.Free;
  inherited;
end;

procedure TPedido.AdicionarItem(Item: TItemPedido);
begin
  if Assigned(Item) then
    FItens.Add(Item);
end;

function TPedido.CalcularTotalItens: Currency;
var
  Item: TItemPedido;
  Total: Currency;
begin
  Total := 0;

  for Item in FItens do
    Total := Total + Item.CalcularSubtotal;

  Result := Total;
end;

function TPedido.CalcularValorTotal: Currency;
begin
  Result := CalcularTotalItens + FTaxaEntrega;
  FValorTotalPedido := Result;
end;

end.
