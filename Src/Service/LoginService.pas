unit LoginService;

interface
  uses
    LoginModel,LoginRepository, vcl.Dialogs;
  Type TLoginService = class
    private
      FRepository: TLoginRepository;
    public
      constructor Create;
      destructor Destroy; override;

      procedure SalvarLogin(const ALoginCfg: TLoginCfg);
    end;
implementation
{ TLoginService }
constructor TLoginService.Create;
  begin
    FRepository := TloginRepository.Create;
  end;

destructor TLoginService.Destroy;
  begin
    Frepository.Free;
  end;
procedure TLoginService.SalvarLogin(const ALoginCfg: TLoginCfg);
  begin
    if FRepository.VerificarUser(ALoginCfg.Email, ALoginCfg.Senha) then
    begin
      MessageDlg('Login realizado com sucesso!', mtInformation, [mbOK], 0);
    end else begin
      MessageDlg('Usuário ou senha inválidos.', mtInformation, [mbOK], 0);
    end;

  end;
end.
