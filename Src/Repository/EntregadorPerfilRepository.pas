unit EntregadorPerfilRepository;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, EntregadorModel;

type
  TEntregadorPerfilRepository = class
  public
    function BuscarPorIdUsuario(IdUsuario: Integer): TEntregador;
    function Atualizar(Entregador: TEntregador): Boolean;
    function ObterSenhaHash(IdUsuario: Integer): string;
    function AlterarSenha(IdUsuario: Integer; const NovaSenhaHash: string): Boolean;
  end;

implementation

uses
  uConn;

{ TEntregadorPerfilRepository }

function TEntregadorPerfilRepository.BuscarPorIdUsuario(IdUsuario: Integer): TEntregador;
var
  Qr: TFDQuery;
begin
  Result := nil;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT ');
    Qr.SQL.Add('  e.id_entregador, e.id_user,');
    Qr.SQL.Add('  e.logradouro, e.cep, e.numero, e.complemento,');
    Qr.SQL.Add('  e.bairro, e.cidade, e.uf,');
    Qr.SQL.Add('  u.nome_user, u.email_user, u.cpf_user, u.nphone_user');
    Qr.SQL.Add('FROM entregadores e');
    Qr.SQL.Add('INNER JOIN usuarios u ON e.id_user = u.id_user');
    Qr.SQL.Add('WHERE e.id_user = :id_user');
    Qr.ParamByName('id_user').AsInteger := IdUsuario;
    Qr.Open;

    if not Qr.IsEmpty then
    begin
      Result := TEntregador.Create;
      Result.IdEntregador := Qr.FieldByName('id_entregador').AsInteger;
      Result.IdUser := Qr.FieldByName('id_user').AsInteger;
      Result.NomeUser := Qr.FieldByName('nome_user').AsString;
      Result.EmailUser := Qr.FieldByName('email_user').AsString;
      Result.CpfUser := Qr.FieldByName('cpf_user').AsString;
      Result.NPhoneUser := Qr.FieldByName('nphone_user').AsString;
      Result.Logradouro := Qr.FieldByName('logradouro').AsString;
      Result.CEP := Qr.FieldByName('cep').AsString;
      Result.Numero := Qr.FieldByName('numero').AsString;
      Result.Complemento := Qr.FieldByName('complemento').AsString;
      Result.Bairro := Qr.FieldByName('bairro').AsString;
      Result.Cidade := Qr.FieldByName('cidade').AsString;
      Result.UF := Qr.FieldByName('uf').AsString;
    end;
  finally
    Qr.Free;
  end;
end;

function TEntregadorPerfilRepository.Atualizar(Entregador: TEntregador): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;

    // Atualizar dados do usuário
    Qr.SQL.Clear;
    Qr.SQL.Add('UPDATE usuarios SET');
    Qr.SQL.Add('  nome_user = :nome,');
    Qr.SQL.Add('  email_user = :email,');
    Qr.SQL.Add('  nphone_user = :nphone');
    Qr.SQL.Add('WHERE id_user = :id_user');

    Qr.ParamByName('nome').AsString := Entregador.NomeUser;
    Qr.ParamByName('email').AsString := Entregador.EmailUser;
    Qr.ParamByName('nphone').AsString := Entregador.NPhoneUser;
    Qr.ParamByName('id_user').AsInteger := Entregador.IdUser;
    Qr.ExecSQL;

    // Atualizar endereço do entregador
    Qr.SQL.Clear;
    Qr.SQL.Add('UPDATE entregadores SET');
    Qr.SQL.Add('  logradouro = :logradouro,');
    Qr.SQL.Add('  cep = :cep,');
    Qr.SQL.Add('  numero = :numero,');
    Qr.SQL.Add('  complemento = :complemento,');
    Qr.SQL.Add('  bairro = :bairro,');
    Qr.SQL.Add('  cidade = :cidade,');
    Qr.SQL.Add('  uf = :uf');
    Qr.SQL.Add('WHERE id_user = :id_user');

    Qr.ParamByName('logradouro').AsString := Entregador.Logradouro;
    Qr.ParamByName('cep').AsString := Entregador.CEP;
    Qr.ParamByName('numero').AsString := Entregador.Numero;
    Qr.ParamByName('complemento').AsString := Entregador.Complemento;
    Qr.ParamByName('bairro').AsString := Entregador.Bairro;
    Qr.ParamByName('cidade').AsString := Entregador.Cidade;
    Qr.ParamByName('uf').AsString := Entregador.UF;
    Qr.ParamByName('id_user').AsInteger := Entregador.IdUser;
    Qr.ExecSQL;

    Result := True;
  finally
    Qr.Free;
  end;
end;

function TEntregadorPerfilRepository.ObterSenhaHash(IdUsuario: Integer): string;
var
  Qr: TFDQuery;
begin
  Result := '';
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT senha_user FROM usuarios WHERE id_user = :id_user');
    Qr.ParamByName('id_user').AsInteger := IdUsuario;
    Qr.Open;

    if not Qr.IsEmpty then
      Result := Qr.FieldByName('senha_user').AsString;
  finally
    Qr.Free;
  end;
end;

function TEntregadorPerfilRepository.AlterarSenha(IdUsuario: Integer; const NovaSenhaHash: string): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('UPDATE usuarios SET senha_user = :senha WHERE id_user = :id_user');
    Qr.ParamByName('senha').AsString := NovaSenhaHash;
    Qr.ParamByName('id_user').AsInteger := IdUsuario;
    Qr.ExecSQL;
    Result := True;
  finally
    Qr.Free;
  end;
end;

end.
