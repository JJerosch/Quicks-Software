unit CarrinhoModel;

interface

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
  public
    property IdProduto: Integer read FIdProduto write FIdProduto;
    property NomeProduto: String read FNomeProduto write FNomeProduto;
    property Preco: Currency read FPreco write FPreco;
    property Quantidade: Integer read FQuantidade write FQuantidade;
    property IdComercio: Integer read FIdComercio write FIdComercio;
    property NomeComercio: String read FNomeComercio write FNomeComercio;
    property Observacao: String read FObservacao write FObservacao;

    constructor Create;
    function Subtotal: Currency;
  end;

implementation

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

end.
