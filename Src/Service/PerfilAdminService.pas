unit PerfilAdminService;

interface

uses
  System.SysUtils, PerfilAdminRepository, PasswordHelper;

type
  TPerfilAdminService = class
  private
    FRepository: TPerfilAdminRepository;
  public
    constructor Create;
    destructor Destroy; override;

    // Operações de perfil
    function ObterDadosPerfil(IdUsuario: Integer;
      out Nome, Email, CPF, Telefone: String): Boolean;

    function AtualizarPerfil(IdUsuario: Integer;
      const Nome, Email, CPF, Telefone: String): Boolean;

    // Operações de senha
    function AlterarSenha(IdUsuario: Integer;
      const SenhaAtual, NovaSenha: String;
      out MsgErro: String): Boolean;

    function ValidarSenhaAtual(IdUsuario: Integer;
      const Senha: String): Boolean;
  end;

implementation

uses
  Vcl.Dialogs;

{ TPerfilAdminService }

constructor TPerfilAdminService.Create;
begin
  inherited;
  FRepository := TPerfilAdminRepository.Create;
end;

destructor TPerfilAdminService.Destroy;
begin
  FRepository.Free;
  inherited;
end;

function TPerfilAdminService.ObterDadosPerfil(IdUsuario: Integer;
  out Nome, Email, CPF, Telefone: String): Boolean;
begin
  try
    Result := FRepository.ObterDadosPerfil(IdUsuario, Nome, Email, CPF, Telefone);
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao obter dados do perfil: ' + E.Message);
      Result := False;
    end;
  end;
end;

function TPerfilAdminService.AtualizarPerfil(IdUsuario: Integer;
  const Nome, Email, CPF, Telefone: String): Boolean;
begin
  Result := False;

  // Validações básicas
  if IdUsuario <= 0 then
  begin
    ShowMessage('ID de usuário inválido.');
    Exit;
  end;

  if Trim(Nome) = '' then
  begin
    ShowMessage('O nome não pode estar vazio.');
    Exit;
  end;

  if Length(Trim(Nome)) < 3 then
  begin
    ShowMessage('O nome deve ter no mínimo 3 caracteres.');
    Exit;
  end;

  if Trim(Email) = '' then
  begin
    ShowMessage('O email não pode estar vazio.');
    Exit;
  end;

  // Validar formato do email
  if (Pos('@', Email) = 0) or (Pos('.', Email) = 0) then
  begin
    ShowMessage('Email inválido.');
    Exit;
  end;

  if Trim(CPF) = '' then
  begin
    ShowMessage('O CPF não pode estar vazio.');
    Exit;
  end;

  try
    // Verificar duplicidade de email
    if FRepository.EmailJaExiste(Email, IdUsuario) then
    begin
      ShowMessage('Este email já está sendo usado por outro usuário.');
      Exit;
    end;

    // Verificar duplicidade de CPF
    if FRepository.CPFJaExiste(CPF, IdUsuario) then
    begin
      ShowMessage('Este CPF já está sendo usado por outro usuário.');
      Exit;
    end;

    // Atualizar no banco
    Result := FRepository.AtualizarPerfil(IdUsuario, Nome, Email, CPF, Telefone);

    if Result then
      ShowMessage('Perfil atualizado com sucesso!');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao atualizar perfil: ' + E.Message);
      Result := False;
    end;
  end;
end;

function TPerfilAdminService.ValidarSenhaAtual(IdUsuario: Integer;
  const Senha: String): Boolean;
var
  HashBanco: String;
begin
  Result := False;

  try
    HashBanco := FRepository.ObterHashSenha(IdUsuario);

    if HashBanco <> '' then
      Result := TPasswordHelper.VerifyPassword(Senha, HashBanco);

  except
    on E: Exception do
    begin
      Result := False;
    end;
  end;
end;

function TPerfilAdminService.AlterarSenha(IdUsuario: Integer;
  const SenhaAtual, NovaSenha: String; out MsgErro: String): Boolean;
var
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

  try
    // Validar senha atual
    if not ValidarSenhaAtual(IdUsuario, SenhaAtual) then
    begin
      MsgErro := 'Senha atual incorreta.';
      Exit;
    end;

    // Gerar novo hash
    NovoHash := TPasswordHelper.HashPassword(NovaSenha);

    // Atualizar no banco
    Result := FRepository.AtualizarSenha(IdUsuario, NovoHash);

    if not Result then
      MsgErro := 'Erro ao atualizar senha no banco de dados.';

  except
    on E: Exception do
    begin
      MsgErro := 'Erro ao alterar senha: ' + E.Message;
      Result := False;
    end;
  end;
end;

end.
