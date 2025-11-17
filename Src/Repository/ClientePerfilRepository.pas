unit ClientePerfilRepository;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, ClienteModel;

type
  TClientePerfilRepository = class
  public
    function BuscarPorIdUsuario(IdUsuario: Integer): TCliente;
    function Atualizar(Cliente: TCliente): Boolean;
    function ObterSenhaHash(IdUsuario: Integer): string;
    function AlterarSenha(IdUsuario: Integer; const NovaSenhaHash: string): Boolean;
  end;

implementation

uses
  uConn;

{ TClientePerfilRepository }

function TClientePerfilRepository.BuscarPorIdUsuario(IdUsuario: Integer): TCliente;
var
  Qr: TFDQuery;
begin
  Result := nil;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT ');
    Qr.SQL.Add('  c.id_clie, c.id_user,');
    Qr.SQL.Add('  u.nome_user, u.email_user, u.cpf_user, u.nphone_user');
    Qr.SQL.Add('FROM clientes c');
    Qr.SQL.Add('INNER JOIN usuarios u ON c.id_user = u.id_user');
    Qr.SQL.Add('WHERE c.id_user = :id_user');
    Qr.ParamByName('id_user').AsInteger := IdUsuario;
    Qr.Open;

    if not Qr.IsEmpty then
    begin
      Result := TCliente.Create;
      Result.IdCliente := Qr.FieldByName('id_clie').AsInteger;
      Result.IdUser := Qr.FieldByName('id_user').AsInteger;
      Result.NomeUser := Qr.FieldByName('nome_user').AsString;
      Result.EmailUser := Qr.FieldByName('email_user').AsString;
      Result.CpfUser := Qr.FieldByName('cpf_user').AsString;
      Result.NPhoneUser := Qr.FieldByName('nphone_user').AsString;
      // Endereço NÃO está mais na tabela clientes
    end;
  finally
    Qr.Free;
  end;
end;

function TClientePerfilRepository.Atualizar(Cliente: TCliente): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;

    // Atualizar apenas dados do usuário
    // Endereço agora está na tabela enderecos_clientes
    Qr.SQL.Clear;
    Qr.SQL.Add('UPDATE usuarios SET');
    Qr.SQL.Add('  nome_user = :nome,');
    Qr.SQL.Add('  email_user = :email,');
    Qr.SQL.Add('  nphone_user = :nphone');
    Qr.SQL.Add('WHERE id_user = :id_user');

    Qr.ParamByName('nome').AsString := Cliente.NomeUser;
    Qr.ParamByName('email').AsString := Cliente.EmailUser;
    Qr.ParamByName('nphone').AsString := Cliente.NPhoneUser;
    Qr.ParamByName('id_user').AsInteger := Cliente.IdUser;
    Qr.ExecSQL;

    Result := True;
  finally
    Qr.Free;
  end;
end;

function TClientePerfilRepository.ObterSenhaHash(IdUsuario: Integer): string;
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

function TClientePerfilRepository.AlterarSenha(IdUsuario: Integer; const NovaSenhaHash: string): Boolean;
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
