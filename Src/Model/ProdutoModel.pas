unit ProdutoModel;

interface

type
  TProduto = class
  private
    FIdProduto: Integer;
    FIdComercio: Integer;          // ⭐ MUDOU DE IdDono PARA IdComercio
    FNomeProd: string;
    FDescProd: string;
    FPrecoProd: Currency;
    FDisponivelVenda: Boolean;

    // Campos extras (quando busca com JOIN)
    FNomeComercio: string;         // ⭐ NOVO
  public
    property IdProduto: Integer read FIdProduto write FIdProduto;
    property IdComercio: Integer read FIdComercio write FIdComercio;  // ⭐ MUDOU
    property NomeProd: string read FNomeProd write FNomeProd;
    property DescProd: string read FDescProd write FDescProd;
    property PrecoProd: Currency read FPrecoProd write FPrecoProd;
    property DisponivelVenda: Boolean read FDisponivelVenda write FDisponivelVenda;

    // Extras
    property NomeComercio: string read FNomeComercio write FNomeComercio;  // ⭐ NOVO

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TProduto }

constructor TProduto.Create;
begin
  inherited Create;
  FIdProduto := 0;
  FIdComercio := 0;              // ⭐ MUDOU
  FNomeProd := '';
  FDescProd := '';
  FPrecoProd := 0;
  FDisponivelVenda := True;
  FNomeComercio := '';           // ⭐ NOVO
end;

destructor TProduto.Destroy;
begin
  inherited;
end;

end.
