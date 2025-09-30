unit LoginController;

interface
uses LoginModel, LoginService;
Type TLoginController = class
  private
    FService: TLoginService;
  public
    constructor Create;
    procedure VerificarLogin(const ALoginCfg: TLoginCfg);
end;

implementation
  constructor TLoginController.Create;
    begin
      FService := TLoginService.Create;
    end;
  procedure TLoginController.VerificarLogin(const ALoginCfg: TLoginCfg);
    begin
      FService.VerificarLogin(ALoginCfg);
    end;
end.
