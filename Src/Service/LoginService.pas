unit LoginService;

interface

uses
  LoginModel, LoginRepository, System.SysUtils, LogSistema;

type
  TLoginService = class
  private
    FRepository: TLoginRepository;
  public
    constructor Create;
    destructor Destroy; override;
    function VerificarLogin(LoginRequest: TLoginRequest): TLoginResponse;
  end;

implementation

uses
  PasswordHelper, Vcl.Dialogs;

constructor TLoginService.Create;
begin
  inherited;
  FRepository := TLoginRepository.Create;
end;

destructor TLoginService.Destroy;
begin
  FRepository.Free;
  inherited;
end;

function TLoginService.VerificarLogin(LoginRequest: TLoginRequest): TLoginResponse;
begin
  Result := TLoginResponse.Create;

  try
    // Validar campos vazios
    if Trim(LoginRequest.Email) = '' then
    begin
      Result.Autenticado := False;
      Result.Mensagem := 'Por favor, preencha o email.';
      Exit;
    end;

    if Trim(LoginRequest.Senha) = '' then
    begin
      Result.Autenticado := False;
      Result.Mensagem := 'Por favor, preencha a senha.';
      Exit;
    end;

    // ✅ Buscar usuário no banco
    Result := FRepository.BuscarUsuarioPorEmail(LoginRequest.Email);

    if not Result.UsuarioEncontrado then
    begin
      Result.Autenticado := False;
      Result.Mensagem := 'Email ou senha incorretos.';
      Exit;
    end;

    // ✅ Verificar se está ativo
    if not Result.Ativo then
    begin
      Result.Autenticado := False;
      Result.Mensagem := 'Usuário inativo. Contate o administrador.';
      Exit;
    end;

    // ✅ VERIFICAR O HASH DA SENHA
    if TPasswordHelper.VerifyPassword(LoginRequest.Senha, Result.SenhaHash) then
    begin
      Result.Autenticado := True;
      Result.Mensagem := 'Login realizado com sucesso!';
      TLogSistema.RegistrarLogin(Result.NomeUsuario);
    end
    else
    begin
      Result.Autenticado := False;
      Result.Mensagem := 'Email ou senha incorretos.';
      TLogSistema.RegistrarErro(
      LoginRequest.Email,
      'Falha no Login',
      Result.Mensagem
    );
    end;

  except
    on E: Exception do
    begin
      Result.Autenticado := False;
      Result.Mensagem := 'Erro ao realizar login: ' + E.Message;
    end;
  end;
end;

end.
