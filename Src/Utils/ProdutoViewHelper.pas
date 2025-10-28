unit ProdutoViewHelper;

interface

uses
  System.SysUtils, System.Generics.Collections, FireDAC.Comp.Client,
  Data.DB, Vcl.StdCtrls, ProdutoModel;

type
  TProdutoViewHelper = class
  public
    class procedure PreencherMemTableProdutos(MemTable: TFDMemTable; Produtos: TObjectList<TProduto>);
    class function ParsePreco(const PrecoTexto: string): Currency;
  end;

implementation

{ TProdutoViewHelper }

class procedure TProdutoViewHelper.PreencherMemTableProdutos(
  MemTable: TFDMemTable; Produtos: TObjectList<TProduto>);
var
  Produto: TProduto;
begin
  // Fechar e limpar
  MemTable.Close;
  MemTable.FieldDefs.Clear;

  // Definir estrutura
  MemTable.FieldDefs.Add('id_produto', ftInteger);
  MemTable.FieldDefs.Add('nome_prod', ftString, 255);
  MemTable.FieldDefs.Add('desc_prod', ftString, 500);
  MemTable.FieldDefs.Add('preco_prod', ftCurrency);
  MemTable.FieldDefs.Add('disponivel_venda', ftBoolean);
  MemTable.FieldDefs.Add('id_comercio', ftInteger);

  // Criar dataset
  MemTable.CreateDataSet;
  MemTable.Open;

  // Preencher dados
  for Produto in Produtos do
  begin
    MemTable.Append;
    MemTable.FieldByName('id_produto').AsInteger := Produto.IdProduto;
    MemTable.FieldByName('nome_prod').AsString := Produto.NomeProd;
    MemTable.FieldByName('desc_prod').AsString := Produto.DescProd;
    MemTable.FieldByName('preco_prod').AsCurrency := Produto.PrecoProd;
    MemTable.FieldByName('disponivel_venda').AsBoolean := Produto.DisponivelVenda;
    MemTable.FieldByName('id_comercio').AsInteger := Produto.IdComercio;
    MemTable.Post;
  end;

  // Voltar para o primeiro registro
  if not MemTable.IsEmpty then
    MemTable.First;
end;

class function TProdutoViewHelper.ParsePreco(const PrecoTexto: string): Currency;
var
  PrecoLimpo: string;
begin
  // Remover formatação (R$, espaços, pontos)
  PrecoLimpo := StringReplace(PrecoTexto, 'R$', '', [rfReplaceAll]);
  PrecoLimpo := StringReplace(PrecoLimpo, ' ', '', [rfReplaceAll]);
  PrecoLimpo := StringReplace(PrecoLimpo, '.', '', [rfReplaceAll]);
  PrecoLimpo := StringReplace(PrecoLimpo, ',', '.', [rfReplaceAll]);
  PrecoLimpo := Trim(PrecoLimpo);

  // Converter para Currency
  try
    Result := StrToCurr(PrecoLimpo);
  except
    Result := 0;
  end;
end;

end.
