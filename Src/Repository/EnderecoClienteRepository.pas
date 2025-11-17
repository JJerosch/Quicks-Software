unit EnderecoClienteRepository;

interface

uses
  System.SysUtils, System.Generics.Collections,
  FireDAC.Comp.Client, FireDAC.Stan.Param, Data.DB,
  EnderecoClienteModel, uConn;

type
  TEnderecoClienteRepository = class
  private
    function DataSetToEndereco(DataSet: TDataSet): TEnderecoCliente;
  public
    function ListarEnderecos(IdCliente: Integer): TObjectList<TEnderecoCliente>;
    function ObterEndereco(IdEndereco: Integer): TEnderecoCliente;
    function CadastrarEndereco(Endereco: TEnderecoCliente): Boolean;
    function AtualizarEndereco(Endereco: TEnderecoCliente): Boolean;
    function ExcluirEndereco(IdEndereco: Integer): Boolean;
    function DefinirComoPrincipal(IdEndereco: Integer; IdCliente: Integer): Boolean;
  end;

implementation

{ TEnderecoClienteRepository }

function TEnderecoClienteRepository.DataSetToEndereco(DataSet: TDataSet): TEnderecoCliente;
begin
  Result := TEnderecoCliente.Create;

  Result.IdEndereco := DataSet.FieldByName('id_endereco').AsInteger;
  Result.IdCliente := DataSet.FieldByName('id_cliente').AsInteger;
  Result.Apelido := DataSet.FieldByName('apelido').AsString;
  Result.Logradouro := DataSet.FieldByName('logradouro').AsString;
  Result.CEP := DataSet.FieldByName('cep').AsString;
  Result.Numero := DataSet.FieldByName('numero').AsString;
  Result.Complemento := DataSet.FieldByName('complemento').AsString;
  Result.Bairro := DataSet.FieldByName('bairro').AsString;
  Result.Cidade := DataSet.FieldByName('cidade').AsString;
  Result.UF := DataSet.FieldByName('uf').AsString;
  Result.Principal := DataSet.FieldByName('principal').AsBoolean;
end;

function TEnderecoClienteRepository.ListarEnderecos(IdCliente: Integer): TObjectList<TEnderecoCliente>;
var
  Qr: TFDQuery;
  Endereco: TEnderecoCliente;
begin
  Result := TObjectList<TEnderecoCliente>.Create(True);
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;

    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT id_endereco, id_cliente, apelido, logradouro, cep,');
    Qr.SQL.Add('       numero, complemento, bairro, cidade, uf, principal');
    Qr.SQL.Add('FROM enderecos_clientes');
    Qr.SQL.Add('WHERE id_cliente = :id_cliente');
    Qr.SQL.Add('ORDER BY principal DESC, apelido');
    Qr.ParamByName('id_cliente').AsInteger := IdCliente;
    Qr.Open;

    while not Qr.Eof do
    begin
      Endereco := DataSetToEndereco(Qr);
      Result.Add(Endereco);
      Qr.Next;
    end;

  finally
    Qr.Free;
  end;
end;

function TEnderecoClienteRepository.ObterEndereco(IdEndereco: Integer): TEnderecoCliente;
var
  Qr: TFDQuery;
begin
  Result := nil;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;

    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT id_endereco, id_cliente, apelido, logradouro, cep,');
    Qr.SQL.Add('       numero, complemento, bairro, cidade, uf, principal');
    Qr.SQL.Add('FROM enderecos_clientes');
    Qr.SQL.Add('WHERE id_endereco = :id_endereco');
    Qr.ParamByName('id_endereco').AsInteger := IdEndereco;
    Qr.Open;

    if not Qr.IsEmpty then
      Result := DataSetToEndereco(Qr);

  finally
    Qr.Free;
  end;
end;

function TEnderecoClienteRepository.CadastrarEndereco(Endereco: TEnderecoCliente): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;

    // Se for marcado como principal, desmarcar outros
    if Endereco.Principal then
    begin
      Qr.SQL.Clear;
      Qr.SQL.Add('UPDATE enderecos_clientes');
      Qr.SQL.Add('SET principal = FALSE');
      Qr.SQL.Add('WHERE id_cliente = :id_cliente');
      Qr.ParamByName('id_cliente').AsInteger := Endereco.IdCliente;
      Qr.ExecSQL;
    end;

    // Inserir novo endereço
    Qr.SQL.Clear;
    Qr.SQL.Add('INSERT INTO enderecos_clientes (');
    Qr.SQL.Add('  id_cliente, apelido, logradouro, cep, numero,');
    Qr.SQL.Add('  complemento, bairro, cidade, uf, principal');
    Qr.SQL.Add(') VALUES (');
    Qr.SQL.Add('  :id_cliente, :apelido, :logradouro, :cep, :numero,');
    Qr.SQL.Add('  :complemento, :bairro, :cidade, :uf, :principal');
    Qr.SQL.Add(')');

    Qr.ParamByName('id_cliente').AsInteger := Endereco.IdCliente;
    Qr.ParamByName('apelido').AsString := Endereco.Apelido;
    Qr.ParamByName('logradouro').AsString := Endereco.Logradouro;
    Qr.ParamByName('cep').AsString := Endereco.CEP;
    Qr.ParamByName('numero').AsString := Endereco.Numero;
    Qr.ParamByName('complemento').AsString := Endereco.Complemento;
    Qr.ParamByName('bairro').AsString := Endereco.Bairro;
    Qr.ParamByName('cidade').AsString := Endereco.Cidade;
    Qr.ParamByName('uf').AsString := Endereco.UF;
    Qr.ParamByName('principal').AsBoolean := Endereco.Principal;

    Qr.ExecSQL;
    Result := True;

  finally
    Qr.Free;
  end;
end;

function TEnderecoClienteRepository.AtualizarEndereco(Endereco: TEnderecoCliente): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;

    // Se for marcado como principal, desmarcar outros
    if Endereco.Principal then
    begin
      Qr.SQL.Clear;
      Qr.SQL.Add('UPDATE enderecos_clientes');
      Qr.SQL.Add('SET principal = FALSE');
      Qr.SQL.Add('WHERE id_cliente = :id_cliente');
      Qr.SQL.Add('  AND id_endereco <> :id_endereco');
      Qr.ParamByName('id_cliente').AsInteger := Endereco.IdCliente;
      Qr.ParamByName('id_endereco').AsInteger := Endereco.IdEndereco;
      Qr.ExecSQL;
    end;

    // Atualizar endereço
    Qr.SQL.Clear;
    Qr.SQL.Add('UPDATE enderecos_clientes SET');
    Qr.SQL.Add('  apelido = :apelido,');
    Qr.SQL.Add('  logradouro = :logradouro,');
    Qr.SQL.Add('  cep = :cep,');
    Qr.SQL.Add('  numero = :numero,');
    Qr.SQL.Add('  complemento = :complemento,');
    Qr.SQL.Add('  bairro = :bairro,');
    Qr.SQL.Add('  cidade = :cidade,');
    Qr.SQL.Add('  uf = :uf,');
    Qr.SQL.Add('  principal = :principal');
    Qr.SQL.Add('WHERE id_endereco = :id_endereco');

    Qr.ParamByName('apelido').AsString := Endereco.Apelido;
    Qr.ParamByName('logradouro').AsString := Endereco.Logradouro;
    Qr.ParamByName('cep').AsString := Endereco.CEP;
    Qr.ParamByName('numero').AsString := Endereco.Numero;
    Qr.ParamByName('complemento').AsString := Endereco.Complemento;
    Qr.ParamByName('bairro').AsString := Endereco.Bairro;
    Qr.ParamByName('cidade').AsString := Endereco.Cidade;
    Qr.ParamByName('uf').AsString := Endereco.UF;
    Qr.ParamByName('principal').AsBoolean := Endereco.Principal;
    Qr.ParamByName('id_endereco').AsInteger := Endereco.IdEndereco;

    Qr.ExecSQL;
    Result := True;

  finally
    Qr.Free;
  end;
end;

function TEnderecoClienteRepository.ExcluirEndereco(IdEndereco: Integer): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;

    Qr.SQL.Clear;
    Qr.SQL.Add('DELETE FROM enderecos_clientes');
    Qr.SQL.Add('WHERE id_endereco = :id_endereco');
    Qr.ParamByName('id_endereco').AsInteger := IdEndereco;
    Qr.ExecSQL;

    Result := True;

  finally
    Qr.Free;
  end;
end;

function TEnderecoClienteRepository.DefinirComoPrincipal(IdEndereco: Integer; IdCliente: Integer): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;

    // Desmarcar todos como principal
    Qr.SQL.Clear;
    Qr.SQL.Add('UPDATE enderecos_clientes');
    Qr.SQL.Add('SET principal = FALSE');
    Qr.SQL.Add('WHERE id_cliente = :id_cliente');
    Qr.ParamByName('id_cliente').AsInteger := IdCliente;
    Qr.ExecSQL;

    // Marcar o selecionado como principal
    Qr.SQL.Clear;
    Qr.SQL.Add('UPDATE enderecos_clientes');
    Qr.SQL.Add('SET principal = TRUE');
    Qr.SQL.Add('WHERE id_endereco = :id_endereco');
    Qr.ParamByName('id_endereco').AsInteger := IdEndereco;
    Qr.ExecSQL;

    Result := True;

  finally
    Qr.Free;
  end;
end;

end.
