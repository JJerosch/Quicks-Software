unit PerfilAdminService;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, PasswordHelper;

type
  TPerfilAdminService = class
  public
    class function ObterDadosPerfil(IdUsuario: Integer; out Nome, Email, CPF, Telefone: String): Boolean;
    class function AtualizarPerfil(IdUsuario: Integer; const Nome, Email, CPF, Telefone: String): Boolean;
    class function AlterarSenha(IdUsuario: Integer; const SenhaAtual, NovaSenha: String; out MsgErro: String): Boolean;
    class function ValidarSenhaAtual(IdUsuario: Integer; const Senha: String): Boolean;
  end;

implementation

uses
  uConn, Vcl.Dialogs;

{ TPerfilAdminService }

class function TPerfilAdminService.ObterDadosPerfil(IdUsuario: Integer;
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
      'FROM usuarios WHERE id_user = :id_user';
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

class function TPerfilAdminService.AtualizarPerfil(IdUsuario: Integer;
  const Nome, Email, CPF, Telefone: String): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;

  if IdUsuario <= 0 then
  begin
    ShowMessage('ID de usuário inválido.');
    Exit;
  end;

  // Validações básicas
  if Trim(Nome) = '' then
  begin
    ShowMessage('O nome não pode estar vazio.');
    Exit;
  end;

  if Trim(Email) = '' then
  begin
    ShowMessage('O email não pode estar vazio.');
    Exit;
  end;

  if Trim(CPF) = '' then
  begin
    ShowMessage('O CPF não pode estar vazio.');
    Exit;
  end;

  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;

    // Verificar se email já existe (para outro usuário)
    Qr.SQL.Text :=
      'SELECT id_user FROM usuarios ' +
      'WHERE email_user = :email AND id_user <> :id_user';
    Qr.ParamByName('email').AsString := Trim(Email);
    Qr.ParamByName('id_user').AsInteger := IdUsuario;
    Qr.Open;

    if not Qr.IsEmpty then
    begin
      ShowMessage('Este email já está sendo usado por outro usuário.');
      Exit;
    end;

    Qr.Close;

    // Verificar se CPF já existe (para outro usuário)
    Qr.SQL.Text :=
      'SELECT id_user FROM usuarios ' +
      'WHERE cpf_user = :cpf AND id_user <> :id_user';
    Qr.ParamByName('cpf').AsString := CPF;
    Qr.ParamByName('id_user').AsInteger := IdUsuario;
    Qr.Open;

    if not Qr.IsEmpty then
    begin
      ShowMessage('Este CPF já está sendo usado por outro usuário.');
      Exit;
    end;

    Qr.Close;

    // Atualizar dados
    Qr.SQL.Text :=
      'UPDATE usuarios SET ' +
      '  nome_user = :nome, ' +
      '  email_user = :email, ' +
      '  cpf_user = :cpf, ' +
      '  nphone_user = :telefone ' +
      'WHERE id_user = :id_user';

    Qr.ParamByName('nome').AsString := Trim(Nome);
    Qr.ParamByName('email').AsString := Trim(Email);
    Qr.ParamByName('cpf').AsString := CPF;
    Qr.ParamByName('telefone').AsString := Telefone;
    Qr.ParamByName('id_user').AsInteger := IdUsuario;

    Qr.ExecSQL;

    ShowMessage('Perfil atualizado com sucesso!');
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao atualizar perfil: ' + E.Message);
      Result := False;
    end;
  end;

  Qr.Free;
end;

class function TPerfilAdminService.ValidarSenhaAtual(IdUsuario: Integer;
  const Senha: String): Boolean;
var
  Qr: TFDQuery;
  SenhaHash: String;
begin
  Result := False;

  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text := 'SELECT senha_user FROM usuarios WHERE id_user = :id_user';
    Qr.ParamByName('id_user').AsInteger := IdUsuario;
    Qr.Open;

    if not Qr.IsEmpty then
    begin
      SenhaHash := Qr.FieldByName('senha_user').AsString;
      Result := TPasswordHelper.VerifyPassword(Senha, SenhaHash);
    end;
  finally
    Qr.Free;
  end;
end;

class function TPerfilAdminService.AlterarSenha(IdUsuario: Integer;
  const SenhaAtual, NovaSenha: String; out MsgErro: String): Boolean;
var
  Qr: TFDQuery;
  NovoHash: String;
begin
  Result := False;
  MsgErro := '';

  // Validações
  if Trim(SenhaAtual) = '' then
  begin
    MsgErro := 'Digite a senha atual.';
    Exit;
  end;

  if Trim(NovaSenha) = '' then
  begin
    MsgErro := 'Digite a nova senha.';
    Exit;
  end;

  if Length(NovaSenha) < 6 then
  begin
    MsgErro := 'A nova senha deve ter no mínimo 6 caracteres.';
    Exit;
  end;

  // Validar senha atual
  if not ValidarSenhaAtual(IdUsuario, SenhaAtual) then
  begin
    MsgErro := 'Senha atual incorreta.';
    Exit;
  end;

  // Gerar hash da nova senha
  NovoHash := TPasswordHelper.HashPassword(NovaSenha);

  // Atualizar no banco
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
      MsgErro := 'Erro ao alterar senha: ' + E.Message;
      Result := False;
    end;
  end;

  Qr.Free;
end;

end.
