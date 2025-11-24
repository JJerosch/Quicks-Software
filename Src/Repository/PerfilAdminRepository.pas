unit PerfilAdminRepository;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TPerfilAdminRepository = class
  public
    // Buscar dados do perfil
    function ObterDadosPerfil(IdUsuario: Integer;
      out Nome, Email, CPF, Telefone: String): Boolean;

    // Atualizar dados do perfil
    function AtualizarPerfil(IdUsuario: Integer;
      const Nome, Email, CPF, Telefone: String): Boolean;

    // Validações de duplicidade
    function EmailJaExiste(const Email: String; IdUsuarioIgnorar: Integer = 0): Boolean;
    function CPFJaExiste(const CPF: String; IdUsuarioIgnorar: Integer = 0): Boolean;

    // Gerenciamento de senha
    function ObterHashSenha(IdUsuario: Integer): String;
    function AtualizarSenha(IdUsuario: Integer; const NovoHash: String): Boolean;
  end;

implementation

uses
  uConn;

{ TPerfilAdminRepository }

function TPerfilAdminRepository.ObterDadosPerfil(IdUsuario: Integer;
  out Nome, Email, CPF, Telefone: String): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;
  Nome := '';
  Email := '';
  CPF := '';
  Telefone := '';

  if IdUsuario <= 0 then
    Exit;

  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text :=
      'SELECT nome_user, email_user, cpf_user, nphone_user ' +
      'FROM usuarios ' +
      'WHERE id_user = :id_user';

    Qr.ParamByName('id_user').AsInteger := IdUsuario;
    Qr.Open;

    if not Qr.IsEmpty then
    begin
      Nome := Qr.FieldByName('nome_user').AsString;
      Email := Qr.FieldByName('email_user').AsString;
      CPF := Qr.FieldByName('cpf_user').AsString;
      Telefone := Qr.FieldByName('nphone_user').AsString;
      Result := True;
    end;
  finally
    Qr.Free;
  end;
end;

function TPerfilAdminRepository.AtualizarPerfil(IdUsuario: Integer;
  const Nome, Email, CPF, Telefone: String): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;

  if IdUsuario <= 0 then
    Exit;

  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text :=
      'UPDATE usuarios SET ' +
      '  nome_user = :nome, ' +
      '  email_user = :email, ' +
      '  cpf_user = :cpf, ' +
      '  nphone_user = :telefone ' +
      'WHERE id_user = :id_user';

    Qr.ParamByName('nome').AsString := Nome;
    Qr.ParamByName('email').AsString := Email;
    Qr.ParamByName('cpf').AsString := CPF;
    Qr.ParamByName('telefone').AsString := Telefone;
    Qr.ParamByName('id_user').AsInteger := IdUsuario;

    Qr.ExecSQL;
    Result := True;
  except
    on E: Exception do
    begin
      Result := False;
      raise;
    end;
  end;

  Qr.Free;
end;

function TPerfilAdminRepository.EmailJaExiste(const Email: String;
  IdUsuarioIgnorar: Integer): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;

  if Trim(Email) = '' then
    Exit;

  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text :=
      'SELECT COUNT(*) as total FROM usuarios ' +
      'WHERE UPPER(email_user) = UPPER(:email) ' +
      'AND id_user <> :id_user';

    Qr.ParamByName('email').AsString := Trim(Email);
    Qr.ParamByName('id_user').AsInteger := IdUsuarioIgnorar;
    Qr.Open;

    Result := (Qr.FieldByName('total').AsInteger > 0);
  finally
    Qr.Free;
  end;
end;

function TPerfilAdminRepository.CPFJaExiste(const CPF: String;
  IdUsuarioIgnorar: Integer): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;

  if Trim(CPF) = '' then
    Exit;

  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text :=
      'SELECT COUNT(*) as total FROM usuarios ' +
      'WHERE cpf_user = :cpf ' +
      'AND id_user <> :id_user';

    Qr.ParamByName('cpf').AsString := CPF;
    Qr.ParamByName('id_user').AsInteger := IdUsuarioIgnorar;
    Qr.Open;

    Result := (Qr.FieldByName('total').AsInteger > 0);
  finally
    Qr.Free;
  end;
end;

function TPerfilAdminRepository.ObterHashSenha(IdUsuario: Integer): String;
var
  Qr: TFDQuery;
begin
  Result := '';

  if IdUsuario <= 0 then
    Exit;

  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text :=
      'SELECT senha_user FROM usuarios WHERE id_user = :id_user';

    Qr.ParamByName('id_user').AsInteger := IdUsuario;
    Qr.Open;

    if not Qr.IsEmpty then
      Result := Qr.FieldByName('senha_user').AsString;
  finally
    Qr.Free;
  end;
end;

function TPerfilAdminRepository.AtualizarSenha(IdUsuario: Integer;
  const NovoHash: String): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;

  if IdUsuario <= 0 then
    Exit;

  if Trim(NovoHash) = '' then
    Exit;

  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text :=
      'UPDATE usuarios SET senha_user = :senha WHERE id_user = :id_user';

    Qr.ParamByName('senha').AsString := NovoHash;
    Qr.ParamByName('id_user').AsInteger := IdUsuario;

    Qr.ExecSQL;
    Result := True;
  except
    on E: Exception do
    begin
      Result := False;
      raise;
    end;
  end;

  Qr.Free;
end;

end.
