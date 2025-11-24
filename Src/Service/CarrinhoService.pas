unit CarrinhoService;

interface

uses
  System.SysUtils, System.Generics.Collections,
  CarrinhoModel, FireDAC.Comp.Client;

type
  TCarrinhoService = class
  private
    FCarrinho: TObjectList<TItemCarrinho>;
    FTaxaEntrega: Currency;
    FIdComercioAtual: Integer;
    FNomeComercioAtual: String;

    function ObterItemCarrinho(IdProduto: Integer; const Observacao: String): TItemCarrinho;
    function ValidarComercio(IdComercio: Integer; const NomeComercio: String): Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    // Operações básicas do carrinho
    procedure AdicionarItem(IdProduto: Integer; const NomeProduto: string;
      Preco: Currency; Quantidade: Integer; IdComercio: Integer;
      const NomeComercio: string; const Observacao: string = '');
    procedure RemoverItem(IdProduto: Integer; const Observacao: String = '');
    procedure AtualizarQuantidade(IdProduto: Integer; const Observacao: String; NovaQuantidade: Integer);
    procedure LimparCarrinho;

    // Validações e cálculos
    function ValidarAdicao(IdComercio: Integer; const NomeComercio: String): Boolean;
    function CalcularSubtotal: Currency;
    function CalcularTotal: Currency;
    function ObterQuantidadeItens: Integer;
    function CarrinhoVazio: Boolean;

    // Getters
    function ObterItens: TObjectList<TItemCarrinho>;
    function ObterIdComercio: Integer;
    function ObterNomeComercio: String;
    function ObterTaxaEntrega: Currency;

    // Setters
    procedure DefinirTaxaEntrega(Valor: Currency);
    procedure DefinirComercio(IdComercio: Integer; const NomeComercio: String);
  end;

implementation

{ TCarrinhoService }

constructor TCarrinhoService.Create;
begin
  FCarrinho := TObjectList<TItemCarrinho>.Create(True); // True = possui os objetos
  FTaxaEntrega := 0;
  FIdComercioAtual := 0;
  FNomeComercioAtual := '';
end;

destructor TCarrinhoService.Destroy;
begin
  FCarrinho.Free;
  inherited;
end;

function TCarrinhoService.ObterItemCarrinho(IdProduto: Integer; const Observacao: String): TItemCarrinho;
var
  Item: TItemCarrinho;
begin
  Result := nil;

  for Item in FCarrinho do
  begin
    if Item.EhMesmoItem(IdProduto, Observacao) then
    begin
      Result := Item;
      Break;
    end;
  end;
end;

function TCarrinhoService.ValidarComercio(IdComercio: Integer; const NomeComercio: String): Boolean;
begin
  // Se carrinho está vazio, aceita qualquer comércio
  if FCarrinho.Count = 0 then
  begin
    FIdComercioAtual := IdComercio;
    FNomeComercioAtual := NomeComercio;
    Result := True;
    Exit;
  end;

  // Se já tem itens, valida se é do mesmo comércio
  Result := (FIdComercioAtual = IdComercio);
end;

procedure TCarrinhoService.AdicionarItem(IdProduto: Integer; const NomeProduto: string;
  Preco: Currency; Quantidade: Integer; IdComercio: Integer;
  const NomeComercio: string; const Observacao: string);
var
  ItemExistente: TItemCarrinho;
  NovoItem: TItemCarrinho;
begin
  // Valida se pode adicionar (mesmo comércio)
  if not ValidarComercio(IdComercio, NomeComercio) then
    raise Exception.CreateFmt('Você já possui itens de "%s" no carrinho. ' +
      'Limpe o carrinho para adicionar itens de outro estabelecimento.',
      [FNomeComercioAtual]);

  // Verifica se item já existe (mesmo produto + mesma observação)
  ItemExistente := ObterItemCarrinho(IdProduto, Observacao);

  if Assigned(ItemExistente) then
  begin
    // Incrementa quantidade do item existente
    ItemExistente.Quantidade := ItemExistente.Quantidade + Quantidade;
  end
  else
  begin
    // Cria novo item
    NovoItem := TItemCarrinho.Create;
    NovoItem.IdProduto := IdProduto;
    NovoItem.NomeProduto := NomeProduto;
    NovoItem.Preco := Preco;
    NovoItem.Quantidade := Quantidade;
    NovoItem.IdComercio := IdComercio;
    NovoItem.NomeComercio := NomeComercio;
    NovoItem.Observacao := Observacao;

    FCarrinho.Add(NovoItem);
  end;
end;

procedure TCarrinhoService.RemoverItem(IdProduto: Integer; const Observacao: String);
var
  Item: TItemCarrinho;
begin
  Item := ObterItemCarrinho(IdProduto, Observacao);

  if Assigned(Item) then
  begin
    FCarrinho.Remove(Item);

    // Se carrinho ficou vazio, limpa dados do comércio
    if FCarrinho.Count = 0 then
    begin
      FIdComercioAtual := 0;
      FNomeComercioAtual := '';
      FTaxaEntrega := 0;
    end;
  end;
end;

procedure TCarrinhoService.AtualizarQuantidade(IdProduto: Integer;
  const Observacao: String; NovaQuantidade: Integer);
var
  Item: TItemCarrinho;
begin
  if NovaQuantidade <= 0 then
  begin
    RemoverItem(IdProduto, Observacao);
    Exit;
  end;

  Item := ObterItemCarrinho(IdProduto, Observacao);

  if Assigned(Item) then
    Item.Quantidade := NovaQuantidade;
end;

procedure TCarrinhoService.LimparCarrinho;
begin
  FCarrinho.Clear;
  FIdComercioAtual := 0;
  FNomeComercioAtual := '';
  FTaxaEntrega := 0;
end;

function TCarrinhoService.ValidarAdicao(IdComercio: Integer;
  const NomeComercio: String): Boolean;
begin
  Result := ValidarComercio(IdComercio, NomeComercio);
end;

function TCarrinhoService.CalcularSubtotal: Currency;
var
  Item: TItemCarrinho;
begin
  Result := 0;

  for Item in FCarrinho do
    Result := Result + Item.Subtotal;
end;

function TCarrinhoService.CalcularTotal: Currency;
begin
  Result := CalcularSubtotal + FTaxaEntrega;
end;

function TCarrinhoService.ObterQuantidadeItens: Integer;
var
  Item: TItemCarrinho;
begin
  Result := 0;

  for Item in FCarrinho do
    Result := Result + Item.Quantidade;
end;

function TCarrinhoService.CarrinhoVazio: Boolean;
begin
  Result := (FCarrinho.Count = 0);
end;

function TCarrinhoService.ObterItens: TObjectList<TItemCarrinho>;
begin
  Result := FCarrinho;
end;

function TCarrinhoService.ObterIdComercio: Integer;
begin
  Result := FIdComercioAtual;
end;

function TCarrinhoService.ObterNomeComercio: String;
begin
  Result := FNomeComercioAtual;
end;

function TCarrinhoService.ObterTaxaEntrega: Currency;
begin
  Result := FTaxaEntrega;
end;

procedure TCarrinhoService.DefinirTaxaEntrega(Valor: Currency);
begin
  FTaxaEntrega := Valor;
end;

procedure TCarrinhoService.DefinirComercio(IdComercio: Integer; const NomeComercio: String);
begin
  FIdComercioAtual := IdComercio;
  FNomeComercioAtual := NomeComercio;
end;

end.
