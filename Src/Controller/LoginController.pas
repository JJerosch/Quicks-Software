unit LoginController;

interface
uses LoginModel, LoginService;
Type TLoginController = class
  private
    FService: TLoginService;
  public
    constructor Create;
    procedure SalvarLogin(const ALoginCfg: TLoginCfg);
end;

implementation
  constructor TLoginController.Create;
    begin
      FService := TLoginService.Create;
    end;
procedure TLoginController.SalvarLogin(const ALoginCfg: TLoginCfg);
begin
  FService.SalvarLogin(ALoginCfg);
end;
end.
