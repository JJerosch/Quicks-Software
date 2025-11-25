unit CarrinhoModel;

interface
uses
ProdutoModel;
type
  TItemCarrinho = class
  private
    FIdProduto: Integer;
    FNomeProduto: String;
    FPreco: Currency;
    FQuantidade: Integer;
    FIdComercio: Integer;
    FNomeComercio: String;
    FObservacao: String;
    FProduto: TProduto;
  public
    property IdProduto: Integer read FIdProduto write FIdProduto;
    property NomeProduto: String read FNomeProduto write FNomeProduto;
    property Preco: Currency read FPreco write FPreco;
    property Quantidade: Integer read FQuantidade write FQuantidade;
    property IdComercio: Integer read FIdComercio write FIdComercio;
    property NomeComercio: String read FNomeComercio write FNomeComercio;
    property Observacao: String read FObservacao write FObservacao;
    property Produto: TProduto read FProduto write FProduto;
    constructor Create;
    function Subtotal: Currency;

    // ⭐ NOVO: Verificar se é o mesmo item (produto + observação)
    function MesmoItem(IdProduto: Integer; const Observacao: String): Boolean;
  end;

implementation
uses
SysUtils;
{ TItemCarrinho }

constructor TItemCarrinho.Create;
begin
  inherited Create;
  FIdProduto := 0;
  FNomeProduto := '';
  FPreco := 0;
  FQuantidade := 0;
  FIdComercio := 0;
  FNomeComercio := '';
  FObservacao := '';
end;

function TItemCarrinho.Subtotal: Currency;
begin
  Result := FPreco * FQuantidade;
end;

function TItemCarrinho.MesmoItem(IdProduto: Integer; const Observacao: String): Boolean;
begin
  // Compara ID do produto E observação (case-insensitive e trim)
  Result := (FIdProduto = IdProduto) and
            (AnsiUpperCase(Trim(FObservacao)) = AnsiUpperCase(Trim(Observacao)));
end;

end.
