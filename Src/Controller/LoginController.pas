unit LoginController;

interface
uses
  LoginModel, LoginService, Vcl.Forms, Vcl.Dialogs;

type
  TLoginController = class
  private
    FService: TLoginService;
  public
    constructor Create;
    destructor Destroy; override;
    function VerificarLogin(const ALoginRequest: TLoginRequest): TLoginResponse; overload;
    function VerificarLogin(const AEmail, ASenha: String): TLoginResponse; overload;
  end;

implementation

constructor TLoginController.Create;
begin
  inherited;
  FService := TLoginService.Create;
end;

destructor TLoginController.Destroy;
begin
  FService.Free;
  inherited;
end;

function TLoginController.VerificarLogin(const ALoginRequest: TLoginRequest): TLoginResponse;
begin
  // Chama o Service passando email e senha
  Result := FService.VerificarLogin(ALoginRequest.Email, ALoginRequest.Senha);
end;

function TLoginController.VerificarLogin(const AEmail, ASenha: String): TLoginResponse;
begin
  // Chama o Service diretamente
  Result := FService.VerificarLogin(AEmail, ASenha);
end;

end.
