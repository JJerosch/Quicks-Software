unit ProdutoController;

interface

uses
  System.SysUtils, System.Generics.Collections,
  ProdutoModel, ProdutoService;

type
  TProdutoController = class
  private
    FService: TProdutoService;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarProdutos(IdDono: Integer; ApenasDisponiveis: Boolean = False): TObjectList<TProduto>;
    function ObterProduto(IdProduto: Integer): TProduto;
    function CadastrarProduto(Produto: TProduto): Boolean;
    function AtualizarProduto(Produto: TProduto): Boolean;
    function DesativarProduto(IdProduto: Integer; const NomeProduto: string): Boolean;
    function ReativarProduto(IdProduto: Integer; const NomeProduto: string): Boolean;
    function ExcluirProduto(IdProduto: Integer; const NomeProduto: string): Boolean;
  end;

implementation

{ TProdutoController }

constructor TProdutoController.Create;
begin
  inherited;
  FService := TProdutoService.Create;
end;

destructor TProdutoController.Destroy;
begin
  FService.Free;
  inherited;
end;

function TProdutoController.ListarProdutos(IdDono: Integer;
  ApenasDisponiveis: Boolean): TObjectList<TProduto>;
begin
  Result := FService.ListarProdutosPorDono(IdDono, ApenasDisponiveis);
end;

function TProdutoController.ObterProduto(IdProduto: Integer): TProduto;
begin
  Result := FService.ObterProduto(IdProduto);
end;

function TProdutoController.CadastrarProduto(Produto: TProduto): Boolean;
begin
  Result := FService.CadastrarProduto(Produto);
end;

function TProdutoController.AtualizarProduto(Produto: TProduto): Boolean;
begin
  Result := FService.AtualizarProduto(Produto);
end;

function TProdutoController.DesativarProduto(IdProduto: Integer;
  const NomeProduto: string): Boolean;
begin
  Result := FService.DesativarProduto(IdProduto, NomeProduto);
end;

function TProdutoController.ReativarProduto(IdProduto: Integer;
  const NomeProduto: string): Boolean;
begin
  Result := FService.ReativarProduto(IdProduto, NomeProduto);
end;

function TProdutoController.ExcluirProduto(IdProduto: Integer;
  const NomeProduto: string): Boolean;
begin
  Result := FService.ExcluirProduto(IdProduto, NomeProduto);
end;

end.
