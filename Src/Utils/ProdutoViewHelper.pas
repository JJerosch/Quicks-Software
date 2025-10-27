unit ProdutoViewHelper;

interface

uses
  System.SysUtils, System.Generics.Collections, FireDAC.Comp.Client,
  ProdutoModel, Data.DB;

type
  TProdutoViewHelper = class
  public
    class procedure PreencherMemTableProdutos(MemTable: TFDMemTable;
      Produtos: TObjectList<TProduto>);
    class function FormatarPreco(Preco: Currency): string;
    class function ParsePreco(const PrecoStr: string): Currency;
  end;

implementation

{ TProdutoViewHelper }

class procedure TProdutoViewHelper.PreencherMemTableProdutos(
  MemTable: TFDMemTable; Produtos: TObjectList<TProduto>);
var
  Produto: TProduto;
begin
  if not Assigned(MemTable) then
    Exit;

  // Fechar e limpar
  MemTable.Close;
  MemTable.FieldDefs.Clear;
  MemTable.Fields.Clear;

  // Definir campos
  MemTable.FieldDefs.Add('id_produto', ftInteger);
  MemTable.FieldDefs.Add('nome_prod', ftString, 255);
  MemTable.FieldDefs.Add('desc_prod', ftString, 500);
  MemTable.FieldDefs.Add('preco_prod', ftCurrency);
  MemTable.FieldDefs.Add('disponivel_venda', ftBoolean);
  MemTable.FieldDefs.Add('id_dono', ftInteger);

  // Criar dataset
  MemTable.CreateDataSet;

  // Preencher dados
  if Assigned(Produtos) then
  begin
    for Produto in Produtos do
    begin
      MemTable.Append;
      MemTable.FieldByName('id_produto').AsInteger := Produto.IdProduto;
      MemTable.FieldByName('nome_prod').AsString := Produto.NomeProd;
      MemTable.FieldByName('desc_prod').AsString := Produto.DescProd;
      MemTable.FieldByName('preco_prod').AsCurrency := Produto.PrecoProd;
      MemTable.FieldByName('disponivel_venda').AsBoolean := Produto.DisponivelVenda;
      MemTable.FieldByName('id_dono').AsInteger := Produto.IdDono;
      MemTable.Post;
    end;
  end;

  // Ir para o primeiro registro
  if not MemTable.IsEmpty then
    MemTable.First;
end;

class function TProdutoViewHelper.FormatarPreco(Preco: Currency): string;
begin
  Result := FormatCurr('R$ #,##0.00', Preco);
end;

class function TProdutoViewHelper.ParsePreco(const PrecoStr: string): Currency;
var
  Temp: string;
  i: Integer;
begin
  // Remove tudo exceto números, vírgula e ponto
  Temp := '';
  for i := 1 to Length(PrecoStr) do
  begin
    if CharInSet(PrecoStr[i], ['0'..'9', ',', '.']) then
      Temp := Temp + PrecoStr[i];
  end;

  // Substitui vírgula por ponto para conversão
  Temp := StringReplace(Temp, ',', '.', [rfReplaceAll]);

  try
    Result := StrToCurr(Temp);
  except
    Result := 0;
  end;
end;

end.
