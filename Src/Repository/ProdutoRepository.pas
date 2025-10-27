unit ProdutoRepository;

interface

uses
  System.SysUtils, System.Generics.Collections, FireDAC.Comp.Client,
  ProdutoModel;

type
  TProdutoRepository = class
  private
    function DataSetToProduto(DataSet: TFDQuery): TProduto;
  public
    function BuscarTodosPorDono(IdDono: Integer; ApenasDisponiveis: Boolean = False): TObjectList<TProduto>;
    function BuscarPorId(IdProduto: Integer): TProduto;
    function Inserir(Produto: TProduto): Boolean;
    function Atualizar(Produto: TProduto): Boolean;
    function AlterarDisponibilidade(IdProduto: Integer; NovoStatus: Boolean): Boolean;
    function Excluir(IdProduto: Integer): Boolean;
    function NomeJaExiste(const Nome: string; IdDono: Integer; IdProdutoIgnorar: Integer = 0): Boolean;
  end;

implementation

uses
  uConn;

{ TProdutoRepository }

function TProdutoRepository.DataSetToProduto(DataSet: TFDQuery): TProduto;
begin
  Result := TProduto.Create;
  Result.IdProduto := DataSet.FieldByName('id_produto').AsInteger;
  Result.NomeProd := DataSet.FieldByName('nome_prod').AsString;
  Result.DescProd := DataSet.FieldByName('desc_prod').AsString;
  Result.PrecoProd := DataSet.FieldByName('preco_prod').AsCurrency;
  Result.DisponivelVenda := DataSet.FieldByName('disponivel_venda').AsBoolean;
  Result.IdDono := DataSet.FieldByName('id_dono').AsInteger;

  // Nome do dono (se houver join)
  if DataSet.FindField('nome_user') <> nil then
    Result.NomeDono := DataSet.FieldByName('nome_user').AsString;
end;

function TProdutoRepository.BuscarTodosPorDono(IdDono: Integer;
  ApenasDisponiveis: Boolean): TObjectList<TProduto>;
var
  Qr: TFDQuery;
begin
  Result := TObjectList<TProduto>.Create(True);
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT p.id_produto, p.nome_prod, p.desc_prod, p.preco_prod,');
    Qr.SQL.Add('       p.disponivel_venda, p.id_dono, u.nome_user');
    Qr.SQL.Add('FROM produtos p');
    Qr.SQL.Add('INNER JOIN usuarios u ON p.id_dono = u.id_user');
    Qr.SQL.Add('WHERE p.id_dono = :id_dono');

    if ApenasDisponiveis then
      Qr.SQL.Add('AND p.disponivel_venda = TRUE');

    Qr.SQL.Add('ORDER BY p.id_produto');
    Qr.ParamByName('id_dono').AsInteger := IdDono;
    Qr.Open;

    while not Qr.Eof do
    begin
      Result.Add(DataSetToProduto(Qr));
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
    Qr.SQL.Add('SELECT p.id_produto, p.nome_prod, p.desc_prod, p.preco_prod,');
    Qr.SQL.Add('       p.disponivel_venda, p.id_dono, u.nome_user');
    Qr.SQL.Add('FROM produtos p');
    Qr.SQL.Add('INNER JOIN usuarios u ON p.id_dono = u.id_user');
    Qr.SQL.Add('WHERE p.id_produto = :id_produto');
    Qr.ParamByName('id_produto').AsInteger := IdProduto;
    Qr.Open;

    if not Qr.IsEmpty then
      Result := DataSetToProduto(Qr);
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
    Qr.SQL.Add('INSERT INTO produtos (nome_prod, desc_prod, preco_prod,');
    Qr.SQL.Add('                      disponivel_venda, id_dono)');
    Qr.SQL.Add('VALUES (:nome, :descricao, :preco, :disponivel, :id_dono)');

    Qr.ParamByName('nome').AsString := Produto.NomeProd;
    Qr.ParamByName('descricao').AsString := Produto.DescProd;
    Qr.ParamByName('preco').AsCurrency := Produto.PrecoProd;
    Qr.ParamByName('disponivel').AsBoolean := Produto.DisponivelVenda;
    Qr.ParamByName('id_dono').AsInteger := Produto.IdDono;

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
    Qr.SQL.Add('  nome_prod = :nome,');
    Qr.SQL.Add('  desc_prod = :descricao,');
    Qr.SQL.Add('  preco_prod = :preco,');
    Qr.SQL.Add('  disponivel_venda = :disponivel');
    Qr.SQL.Add('WHERE id_produto = :id_produto');

    Qr.ParamByName('nome').AsString := Produto.NomeProd;
    Qr.ParamByName('descricao').AsString := Produto.DescProd;
    Qr.ParamByName('preco').AsCurrency := Produto.PrecoProd;
    Qr.ParamByName('disponivel').AsBoolean := Produto.DisponivelVenda;
    Qr.ParamByName('id_produto').AsInteger := Produto.IdProduto;

    Qr.ExecSQL;
    Result := True;
  finally
    Qr.Free;
  end;
end;

function TProdutoRepository.AlterarDisponibilidade(IdProduto: Integer;
  NovoStatus: Boolean): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('UPDATE produtos SET disponivel_venda = :status');
    Qr.SQL.Add('WHERE id_produto = :id_produto');
    Qr.ParamByName('status').AsBoolean := NovoStatus;
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
    Qr.SQL.Clear;
    Qr.SQL.Add('DELETE FROM produtos WHERE id_produto = :id_produto');
    Qr.ParamByName('id_produto').AsInteger := IdProduto;
    Qr.ExecSQL;
    Result := True;
  finally
    Qr.Free;
  end;
end;

function TProdutoRepository.NomeJaExiste(const Nome: string; IdDono: Integer;
  IdProdutoIgnorar: Integer): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT 1 FROM produtos');
    Qr.SQL.Add('WHERE nome_prod = :nome AND id_dono = :id_dono');

    if IdProdutoIgnorar > 0 then
      Qr.SQL.Add('AND id_produto <> :id_produto');

    Qr.ParamByName('nome').AsString := Nome;
    Qr.ParamByName('id_dono').AsInteger := IdDono;

    if IdProdutoIgnorar > 0 then
      Qr.ParamByName('id_produto').AsInteger := IdProdutoIgnorar;

    Qr.Open;
    Result := not Qr.IsEmpty;
  finally
    Qr.Free;
  end;
end;

end.
