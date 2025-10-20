unit LoginController;

interface
uses LoginModel, LoginService, Vcl.Forms, Vcl.Dialogs,
  FormLoginMain,         // TFormLogin
  FormHomeAdmin,         // TFormHomeA
  FormHomeClientes,      // TFormHomeC
  FormHomeDono,          // TFormHomeD
  FormHomeEntregador;;
Type TLoginController = class
  private
    FService: TLoginService;
  public
    constructor Create;
    destructor Destroy; override;
    procedure IniciarAplicacao;
    procedure VerificarLogin(const ALoginCfg: TLoginCfg);
end;

implementation


  constructor TLoginController.Create;
    begin
      FService := TLoginService.Create;
    end;
  destructor TLoginController.Destroy;
    begin
      FService.Free;
      inherited;
    end;

procedure TLoginController.IniciarAplicacao;
var
  FormLogin: TFormLogin;
  TipoUsuario: string;
begin
  FormLogin := TFormLogin.Create(nil);
  try
    if FormLogin.ShowModal <> mrOK then
    begin
      Application.Terminate;
      Exit;
    end;
    TipoUsuario := FormLogin.GetTipoUsuario;
    if TipoUsuario = 'Administrador' then
      Application.CreateForm(TFormHomeA, FormHomeA)
    else if TipoUsuario = 'Cliente' then
      Application.CreateForm(TFormHomeC, FormHomeC)
    else if TipoUsuario = 'Dono de Comércio' then
      Application.CreateForm(TFormHomeD, FormHomeD)
    else if TipoUsuario = 'Entregador' then
      Application.CreateForm(TFormHomeE, FormHomeE)
    else
    begin
      ShowMessage('Tipo de usuário desconhecido. Encerrando.');
      Application.Terminate;
      Exit;
    end;
    Application.Run;
  finally
    FormLogin.Free;
  end;
end;

procedure TLoginController.VerificarLogin(const ALoginCfg: TLoginCfg);
    begin
      FService.VerificarLogin(ALoginCfg);
    end;
end.
