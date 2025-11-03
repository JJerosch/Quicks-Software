unit ProdutoViewHelper;

interface

uses
  System.SysUtils, System.Generics.Collections, Vcl.StdCtrls,
  FireDAC.Comp.Client, ProdutoModel, uConn, Data.DB;

type
  TProdutoViewHelper = class
  public
    // Formatação de preços
    class function FormatPreco(Valor: Currency): string;
    class function ParsePreco(const Texto: string): Currency;

    // Popular ComboBox de categorias
    class procedure PopularCategoriasProduto(ComboBox: TComboBox);

    // Preencher MemTable
    class procedure PreencherMemTableProdutos(MemTable: TFDMemTable; Produtos: TObjectList<TProduto>);
  end;

implementation

{ TProdutoViewHelper }

class function TProdutoViewHelper.FormatPreco(Valor: Currency): string;
begin
  Result := FormatFloat('#,##0.00', Valor);
end;

class function TProdutoViewHelper.ParsePreco(const Texto: string): Currency;
var
  TextoLimpo: string;
begin
  // Remove o separador de milhar (ponto no BR)
  TextoLimpo := StringReplace(Texto, '.', '', [rfReplaceAll]);

  // [LINHA REMOVIDA]
  // TextoLimpo := StringReplace(TextoLimpo, ',', '.', [rfReplaceAll]); // <-- REMOVA OU COMENTE ESTA LINHA

  // Remove o símbolo da moeda
  TextoLimpo := StringReplace(TextoLimpo, 'R$', '', [rfReplaceAll]);
  TextoLimpo := Trim(TextoLimpo);

  if TextoLimpo = '' then
    Result := 0
  else
  begin
    try
      // Agora StrToCurr receberá "100,00" (ou "1500,75"), o que é válido.
      Result  := StrToCurr(TextoLimpo);
    except
      Result := 0;
    end;
  end;
end;
class procedure TProdutoViewHelper.PopularCategoriasProduto(ComboBox: TComboBox);
var
  Qr: TFDQuery;
begin
  ComboBox.Clear;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text := 'SELECT id_categoria, nome_categoria FROM categorias_produtos ORDER BY nome_categoria';
    Qr.Open;

    while not Qr.Eof do
    begin
      // Adiciona o nome da categoria no ComboBox
      // O ID fica armazenado no Objects[]
      ComboBox.Items.AddObject(
        Qr.FieldByName('nome_categoria').AsString,
        TObject(Qr.FieldByName('id_categoria').AsInteger)
      );
      Qr.Next;
    end;

    if ComboBox.Items.Count > 0 then
      ComboBox.ItemIndex := 0;
  finally
    Qr.Free;
  end;
end;

class procedure TProdutoViewHelper.PreencherMemTableProdutos(
  MemTable: TFDMemTable; Produtos: TObjectList<TProduto>);
var
  Produto: TProduto;
begin
  MemTable.Close;
  MemTable.FieldDefs.Clear;

  // Definir estrutura da MemTable
  MemTable.FieldDefs.Add('id_produto', ftInteger);
  MemTable.FieldDefs.Add('nome_prod', ftString, 255);
  MemTable.FieldDefs.Add('desc_prod', ftString, 500);
  MemTable.FieldDefs.Add('categoria', ftString, 100);           // ⭐ NOVO
  MemTable.FieldDefs.Add('preco_custo', ftCurrency);            // ⭐ NOVO
  MemTable.FieldDefs.Add('preco_venda', ftCurrency);            // ⭐ NOVO (era preco_prod)
  MemTable.FieldDefs.Add('disponivel_venda', ftBoolean);
  MemTable.FieldDefs.Add('id_comercio', ftInteger);

  MemTable.CreateDataSet;

  // Preencher com dados
  for Produto in Produtos do
  begin
    MemTable.Append;
    MemTable.FieldByName('id_produto').AsInteger := Produto.IdProduto;
    MemTable.FieldByName('nome_prod').AsString := Produto.NomeProd;
    MemTable.FieldByName('desc_prod').AsString := Produto.DescProd;
    MemTable.FieldByName('categoria').AsString := Produto.Categoria;                    // ⭐ NOVO
    MemTable.FieldByName('preco_custo').AsCurrency := Produto.PrecoCusto;              // ⭐ NOVO
    MemTable.FieldByName('preco_venda').AsCurrency := Produto.PrecoVenda;              // ⭐ NOVO
    MemTable.FieldByName('disponivel_venda').AsBoolean := Produto.DisponivelVenda;
    MemTable.FieldByName('id_comercio').AsInteger := Produto.IdComercio;
    MemTable.Post;
  end;

  MemTable.First;
end;

end.
