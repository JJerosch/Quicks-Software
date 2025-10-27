unit ProdutoModel;

interface

type
  TProduto = class
  private
    FIdProduto: Integer;
    FNomeProd: string;
    FDescProd: string;
    FPrecoProd: Currency;
    FDisponivelVenda: Boolean;
    FIdDono: Integer;
    FNomeDono: string; // Para exibição
  public
    property IdProduto: Integer read FIdProduto write FIdProduto;
    property NomeProd: string read FNomeProd write FNomeProd;
    property DescProd: string read FDescProd write FDescProd;
    property PrecoProd: Currency read FPrecoProd write FPrecoProd;
    property DisponivelVenda: Boolean read FDisponivelVenda write FDisponivelVenda;
    property IdDono: Integer read FIdDono write FIdDono;
    property NomeDono: string read FNomeDono write FNomeDono;

    constructor Create; overload;
    constructor Create(AId: Integer; ANome, ADesc: string; APreco: Currency;
                      ADisponivel: Boolean; AIdDono: Integer; ANomeDono: string = ''); overload;
    destructor Destroy; override;
  end;

implementation

{ TProduto }

constructor TProduto.Create;
begin
  inherited Create;
  FIdProduto := 0;
  FNomeProd := '';
  FDescProd := '';
  FPrecoProd := 0;
  FDisponivelVenda := True;
  FIdDono := 0;
  FNomeDono := '';
end;

constructor TProduto.Create(AId: Integer; ANome, ADesc: string; APreco: Currency;
  ADisponivel: Boolean; AIdDono: Integer; ANomeDono: string);
begin
  FIdProduto := AId;
  FNomeProd := ANome;
  FDescProd := ADesc;
  FPrecoProd := APreco;
  FDisponivelVenda := ADisponivel;
  FIdDono := AIdDono;
  FNomeDono := ANomeDono;
end;

destructor TProduto.Destroy;
begin
  inherited;
end;

end.
