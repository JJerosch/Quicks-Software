unit EntregadorPerfilService;

interface

uses
  System.SysUtils, EntregadorModel, EntregadorPerfilRepository, PasswordHelper;

type
  TEntregadorPerfilService = class
  private
    FRepository: TEntregadorPerfilRepository;
  public
    constructor Create;
    destructor Destroy; override;

    function ObterPerfilPorUsuario(IdUsuario: Integer): TEntregador;
    function AtualizarPerfil(Entregador: TEntregador): Boolean;
    function AlterarSenha(Request: TAlterarSenhaEntregadorRequest): Boolean;
  end;

implementation

uses
  Vcl.Dialogs;

{ TEntregadorPerfilService }

constructor TEntregadorPerfilService.Create;
begin
  inherited;
  FRepository := TEntregadorPerfilRepository.Create;
end;

destructor TEntregadorPerfilService.Destroy;
begin
  FRepository.Free;
  inherited;
end;

function TEntregadorPerfilService.ObterPerfilPorUsuario(IdUsuario: Integer): TEntregador;
begin
  try
    Result := FRepository.BuscarPorIdUsuario(IdUsuario);

    if not Assigned(Result) then
      ShowMessage('Perfil não encontrado para este usuário.');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao buscar perfil: ' + E.Message);
      Result := nil;
    end;
  end;
end;

function TEntregadorPerfilService.AtualizarPerfil(Entregador: TEntregador): Boolean;
begin
  Result := False;

  try
    // Validações
    if Trim(Entregador.NomeUser) = '' then
    begin
      ShowMessage('O nome não pode estar vazio.');
      Exit;
    end;

    if Trim(Entregador.EmailUser) = '' then
    begin
      ShowMessage('O email não pode estar vazio.');
      Exit;
    end;

    if Trim(Entregador.NPhoneUser) = '' then
    begin
      ShowMessage('O telefone não pode estar vazio.');
      Exit;
    end;

    // Atualizar
    Result := FRepository.Atualizar(Entregador);

    if Result then
      ShowMessage('Perfil atualizado com sucesso!')
    else
      ShowMessage('Erro ao atualizar perfil.');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao atualizar perfil: ' + E.Message);
      Result := False;
    end;
  end;
end;

function TEntregadorPerfilService.AlterarSenha(Request: TAlterarSenhaEntregadorRequest): Boolean;
var
  SenhaHashAtual: string;
  NovaSenhaHash: string;
begin
  Result := False;

  try
    // Validações
    if Trim(Request.SenhaAtual) = '' then
    begin
      ShowMessage('Informe a senha atual.');
      Exit;
    end;

    if Trim(Request.SenhaNova) = '' then
    begin
      ShowMessage('Informe a nova senha.');
      Exit;
    end;

    if Length(Trim(Request.SenhaNova)) < 6 then
    begin
      ShowMessage('A nova senha deve ter no mínimo 6 caracteres.');
      Exit;
    end;

    if Request.SenhaNova <> Request.SenhaConfirmacao then
    begin
      ShowMessage('A nova senha e a confirmação não coincidem.');
      Exit;
    end;

    // Verificar senha atual
    SenhaHashAtual := FRepository.ObterSenhaHash(Request.IdUsuario);

    if not TPasswordHelper.VerifyPassword(Request.SenhaAtual, SenhaHashAtual) then
    begin
      ShowMessage('Senha atual incorreta.');
      Exit;
    end;

    // Gerar hash da nova senha
    NovaSenhaHash := TPasswordHelper.HashPassword(Request.SenhaNova);

    // Atualizar senha
    Result := FRepository.AlterarSenha(Request.IdUsuario, NovaSenhaHash);

    if Result then
      ShowMessage('Senha alterada com sucesso!')
    else
      ShowMessage('Erro ao alterar senha.');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao alterar senha: ' + E.Message);
      Result := False;
    end;
  end;
end;

end.
