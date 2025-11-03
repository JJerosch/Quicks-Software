unit ProdutoRepository;

interface

uses
  System.SysUtils, System.Generics.Collections,
  FireDAC.Comp.Client, ProdutoModel;

type
  TProdutoRepository = class
  public
    function ListarPorComercio(IdComercio: Integer; ApenasDisponiveis: Boolean): TObjectList<TProduto>;
    function BuscarPorId(IdProduto: Integer): TProduto;
    function Inserir(Produto: TProduto): Boolean;
    function Atualizar(Produto: TProduto): Boolean;
    function AlterarDisponibilidade(IdProduto: Integer; Disponivel: Boolean): Boolean;
    function Excluir(IdProduto: Integer): Boolean;
  end;

implementation

uses
  uConn;

{ TProdutoRepository }

function TProdutoRepository.ListarPorComercio(IdComercio: Integer;
  ApenasDisponiveis: Boolean): TObjectList<TProduto>;
var
  Qr: TFDQuery;
  Produto: TProduto;
begin
  Result := TObjectList<TProduto>.Create;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT ');
    Qr.SQL.Add('  p.id_produto, p.id_comercio, p.id_categoria,');
    Qr.SQL.Add('  p.nome_prod, p.desc_prod,');
    Qr.SQL.Add('  p.preco_custo, p.preco_prod AS preco_venda,');
    Qr.SQL.Add('  p.disponivel_venda,');
    Qr.SQL.Add('  c.nome_comercio,');
    Qr.SQL.Add('  cat.nome_categoria');
    Qr.SQL.Add('FROM produtos p');
    Qr.SQL.Add('INNER JOIN comercios c ON p.id_comercio = c.id_comercio');
    Qr.SQL.Add('LEFT JOIN categorias_produtos cat ON p.id_categoria = cat.id_categoria');
    Qr.SQL.Add('WHERE p.id_comercio = :id_comercio');

    if ApenasDisponiveis then
      Qr.SQL.Add('AND p.disponivel_venda = TRUE');

    Qr.SQL.Add('ORDER BY p.nome_prod');
    Qr.ParamByName('id_comercio').AsInteger := IdComercio;
    Qr.Open;

    while not Qr.Eof do
    begin
      Produto := TProduto.Create;
      Produto.IdProduto := Qr.FieldByName('id_produto').AsInteger;
      Produto.IdComercio := Qr.FieldByName('id_comercio').AsInteger;
      Produto.IdCategoria := Qr.FieldByName('id_categoria').AsInteger;
      Produto.NomeProd := Qr.FieldByName('nome_prod').AsString;
      Produto.DescProd := Qr.FieldByName('desc_prod').AsString;
      Produto.Categoria := Qr.FieldByName('nome_categoria').AsString;
      Produto.PrecoCusto := Qr.FieldByName('preco_custo').AsCurrency;
      Produto.PrecoVenda := Qr.FieldByName('preco_venda').AsCurrency;
      Produto.DisponivelVenda := Qr.FieldByName('disponivel_venda').AsBoolean;
      Produto.NomeComercio := Qr.FieldByName('nome_comercio').AsString;

      Result.Add(Produto);
      Qr.Next;
    end;
  finally
    Qr.Free;
  end;
end;

function TProdutoRepository.BuscarPorId(IdProduto: Integer): TProduto;
var
  Qr: TFDQuery;
begin
  Result := nil;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT ');
    Qr.SQL.Add('  p.id_produto, p.id_comercio, p.id_categoria,');
    Qr.SQL.Add('  p.nome_prod, p.desc_prod,');
    Qr.SQL.Add('  p.preco_custo, p.preco_prod AS preco_venda,');
    Qr.SQL.Add('  p.disponivel_venda,');
    Qr.SQL.Add('  cat.nome_categoria');
    Qr.SQL.Add('FROM produtos p');
    Qr.SQL.Add('LEFT JOIN categorias_produtos cat ON p.id_categoria = cat.id_categoria');
    Qr.SQL.Add('WHERE p.id_produto = :id_produto');
    Qr.ParamByName('id_produto').AsInteger := IdProduto;
    Qr.Open;

    if not Qr.IsEmpty then
    begin
      Result := TProduto.Create;
      Result.IdProduto := Qr.FieldByName('id_produto').AsInteger;
      Result.IdComercio := Qr.FieldByName('id_comercio').AsInteger;
      Result.IdCategoria := Qr.FieldByName('id_categoria').AsInteger;
      Result.NomeProd := Qr.FieldByName('nome_prod').AsString;
      Result.DescProd := Qr.FieldByName('desc_prod').AsString;
      Result.Categoria := Qr.FieldByName('nome_categoria').AsString;
      Result.PrecoCusto := Qr.FieldByName('preco_custo').AsCurrency;
      Result.PrecoVenda := Qr.FieldByName('preco_venda').AsCurrency;
      Result.DisponivelVenda := Qr.FieldByName('disponivel_venda').AsBoolean;
    end;
  finally
    Qr.Free;
  end;
end;

function TProdutoRepository.Inserir(Produto: TProduto): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('INSERT INTO produtos (');
    Qr.SQL.Add('  id_comercio, id_categoria, nome_prod, desc_prod,');
    Qr.SQL.Add('  preco_custo, preco_prod, disponivel_venda');
    Qr.SQL.Add(') VALUES (');
    Qr.SQL.Add('  :id_comercio, :id_categoria, :nome_prod, :desc_prod,');
    Qr.SQL.Add('  :preco_custo, :preco_venda, :disponivel_venda');
    Qr.SQL.Add(')');

    Qr.ParamByName('id_comercio').AsInteger := Produto.IdComercio;
    Qr.ParamByName('id_categoria').AsInteger := Produto.IdCategoria;
    Qr.ParamByName('nome_prod').AsString := Produto.NomeProd;
    Qr.ParamByName('desc_prod').AsString := Produto.DescProd;
    Qr.ParamByName('preco_custo').AsCurrency := Produto.PrecoCusto;
    Qr.ParamByName('preco_venda').AsCurrency := Produto.PrecoVenda;
    Qr.ParamByName('disponivel_venda').AsBoolean := Produto.DisponivelVenda;

    Qr.ExecSQL;
    Result := True;
  finally
    Qr.Free;
  end;
end;

function TProdutoRepository.Atualizar(Produto: TProduto): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('UPDATE produtos SET');
    Qr.SQL.Add('  id_categoria = :id_categoria,');
    Qr.SQL.Add('  nome_prod = :nome_prod,');
    Qr.SQL.Add('  desc_prod = :desc_prod,');
    Qr.SQL.Add('  preco_custo = :preco_custo,');
    Qr.SQL.Add('  preco_prod = :preco_venda,');
    Qr.SQL.Add('  disponivel_venda = :disponivel_venda');
    Qr.SQL.Add('WHERE id_produto = :id_produto');

    Qr.ParamByName('id_categoria').AsInteger := Produto.IdCategoria;
    Qr.ParamByName('nome_prod').AsString := Produto.NomeProd;
    Qr.ParamByName('desc_prod').AsString := Produto.DescProd;
    Qr.ParamByName('preco_custo').AsCurrency := Produto.PrecoCusto;
    Qr.ParamByName('preco_venda').AsCurrency := Produto.PrecoVenda;
    Qr.ParamByName('disponivel_venda').AsBoolean := Produto.DisponivelVenda;
    Qr.ParamByName('id_produto').AsInteger := Produto.IdProduto;

    Qr.ExecSQL;
    Result := True;
  finally
    Qr.Free;
  end;
end;

function TProdutoRepository.AlterarDisponibilidade(IdProduto: Integer;
  Disponivel: Boolean): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text := 'UPDATE produtos SET disponivel_venda = :disponivel WHERE id_produto = :id_produto';
    Qr.ParamByName('disponivel').AsBoolean := Disponivel;
    Qr.ParamByName('id_produto').AsInteger := IdProduto;
    Qr.ExecSQL;
    Result := True;
  finally
    Qr.Free;
  end;
end;

function TProdutoRepository.Excluir(IdProduto: Integer): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text := 'DELETE FROM produtos WHERE id_produto = :id_produto';
    Qr.ParamByName('id_produto').AsInteger := IdProduto;
    Qr.ExecSQL;
    Result := True;
  finally
    Qr.Free;
  end;
end;

end.
