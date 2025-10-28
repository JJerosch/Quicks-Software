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
    class function FormatPreco(const Preco: Currency): string;
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
  FS: TFormatSettings;
  ValorFloat: Double;
begin
  Result := 0;

  // Verificar se está vazio
  if Trim(PrecoTexto) = '' then
    Exit;

  try
    // Remover formatação (R$, espaços)
    PrecoLimpo := StringReplace(PrecoTexto, 'R$', '', [rfReplaceAll]);
    PrecoLimpo := StringReplace(PrecoLimpo, ' ', '', [rfReplaceAll]);
    PrecoLimpo := Trim(PrecoLimpo);

    // Se estiver vazio após limpeza, retornar 0
    if PrecoLimpo = '' then
      Exit;

    // Criar FormatSettings personalizados para garantir parse correto
    FS := TFormatSettings.Create;
    FS.DecimalSeparator := '.';
    FS.ThousandSeparator := ',';

    // Detectar formato brasileiro (vírgula como decimal)
    if Pos(',', PrecoLimpo) > 0 then
    begin
      // Formato: 1.234,56 (brasileiro)
      // Remover pontos (separador de milhares)
      PrecoLimpo := StringReplace(PrecoLimpo, '.', '', [rfReplaceAll]);
      // Trocar vírgula por ponto (separador decimal)
      PrecoLimpo := StringReplace(PrecoLimpo, ',', '.', [rfReplaceAll]);
    end
    else
    begin
      // Formato: 1,234.56 (americano) ou apenas 1234.56
      // Remover vírgulas (separador de milhares)
      PrecoLimpo := StringReplace(PrecoLimpo, ',', '', [rfReplaceAll]);
      // O ponto já está correto como separador decimal
    end;

    // Converter para Double primeiro (mais tolerante) e depois para Currency
    if TryStrToFloat(PrecoLimpo, ValorFloat, FS) then
      Result := ValorFloat
    else
      Result := 0;

  except
    on E: Exception do
    begin
      // Em caso de erro, retornar 0
      Result := 0;
    end;
  end;
end;

class function TProdutoViewHelper.FormatPreco(const Preco: Currency): string;
var
  FS: TFormatSettings;
begin
  // Criar FormatSettings para formato brasileiro
  FS := TFormatSettings.Create;
  FS.DecimalSeparator := ',';
  FS.ThousandSeparator := '.';

  // Formatar o valor usando FormatFloat com configurações brasileiras
  Result := FormatFloat('#,##0.00', Preco, FS);
end;

end.

{
  NOTA IMPORTANTE PARA O FormHomeDono.pas:

  No método CarregarDadosParaAtualizar, ALTERE a linha:

  ANTES:
    ePrecoUp.Text := FormatCurr('0.00', Produto.PrecoProd);

  DEPOIS:
    ePrecoUp.Text := TProdutoViewHelper.FormatPreco(Produto.PrecoProd);
}
