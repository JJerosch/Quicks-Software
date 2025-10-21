unit LoginService;

interface
uses
  System.SysUtils, LoginModel, LoginRepository;

type
  TLoginService = class
  private
    FRepository: TLoginRepository;
  public
    constructor Create;
    destructor Destroy; override;
    function VerificarLogin(const AEmail, ASenha: String): TLoginResponse;
    function ValidarDados(const AEmail, ASenha: String; out AMensagem: String): Boolean;
  end;

implementation

{ TLoginService }

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

function TLoginService.ValidarDados(const AEmail, ASenha: String; out AMensagem: String): Boolean;
begin
  Result := True;
  AMensagem := '';

  // Validação de email vazio
  if Trim(AEmail) = '' then
  begin
    Result := False;
    AMensagem := 'Email não pode estar vazio!';
    Exit;
  end;

  // Validação de senha vazia
  if Trim(ASenha) = '' then
  begin
    Result := False;
    AMensagem := 'Senha não pode estar vazia!';
    Exit;
  end;

  // Validação básica de formato de email
  if Pos('@', AEmail) = 0 then
  begin
    Result := False;
    AMensagem := 'Email inválido!';
    Exit;
  end;
end;

function TLoginService.VerificarLogin(const AEmail, ASenha: String): TLoginResponse;
var
  MensagemValidacao: String;
begin
  Result := TLoginResponse.Create;

  // Valida os dados antes de consultar o banco
  if not ValidarDados(AEmail, ASenha, MensagemValidacao) then
  begin
    Result.Autenticado := False;
    Result.Mensagem := MensagemValidacao;
    Exit;
  end;

  // Busca o usuário no banco de dados
  try
    Result := FRepository.BuscarUsuarioPorCredenciais(AEmail, ASenha);
  except
    on E: Exception do
    begin
      Result.Autenticado := False;
      Result.Mensagem := 'Erro ao realizar login: ' + E.Message;
    end;
  end;
end;

end.
