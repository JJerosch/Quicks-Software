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
    function VerificarLogin(LoginRequest: TLoginRequest): TLoginResponse; overload;
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

function TLoginController.VerificarLogin(LoginRequest: TLoginRequest): TLoginResponse;
begin
  // Chama o Service passando email e senha
  Result := FService.VerificarLogin(LoginRequest);
end;

end.
