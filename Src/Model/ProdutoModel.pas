unit ProdutoModel;

interface

type
  TProduto = class
  private
    FIdProduto: Integer;
    FIdComercio: Integer;
    FIdCategoria: Integer;           // ⭐ NOVO - FK para categorias_produtos
    FNomeProd: string;
    FDescProd: string;
    FCategoria: string;              // ⭐ NOVO - Nome da categoria (JOIN)
    FPrecoCusto: Currency;           // ⭐ NOVO
    FPrecoVenda: Currency;           // ⭐ RENOMEADO (era PrecoProd)
    FDisponivelVenda: Boolean;

    // Campos extras (quando busca com JOIN)
    FNomeComercio: string;
  public
    property IdProduto: Integer read FIdProduto write FIdProduto;
    property IdComercio: Integer read FIdComercio write FIdComercio;
    property IdCategoria: Integer read FIdCategoria write FIdCategoria;        // ⭐ NOVO
    property NomeProd: string read FNomeProd write FNomeProd;
    property DescProd: string read FDescProd write FDescProd;
    property Categoria: string read FCategoria write FCategoria;                // ⭐ NOVO
    property PrecoCusto: Currency read FPrecoCusto write FPrecoCusto;          // ⭐ NOVO
    property PrecoVenda: Currency read FPrecoVenda write FPrecoVenda;          // ⭐ NOVO (era PrecoProd)
    property DisponivelVenda: Boolean read FDisponivelVenda write FDisponivelVenda;

    // Extras
    property NomeComercio: string read FNomeComercio write FNomeComercio;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TProduto }

constructor TProduto.Create;
begin
  inherited Create;
  FIdProduto := 0;
  FIdComercio := 0;
  FIdCategoria := 0;                 // ⭐ NOVO
  FNomeProd := '';
  FDescProd := '';
  FCategoria := '';                  // ⭐ NOVO
  FPrecoCusto := 0;                  // ⭐ NOVO
  FPrecoVenda := 0;                  // ⭐ NOVO
  FDisponivelVenda := True;
  FNomeComercio := '';
end;

destructor TProduto.Destroy;
begin
  inherited;
end;

end.
