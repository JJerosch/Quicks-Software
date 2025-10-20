unit LoginService;

interface
  uses
    LoginModel,LoginRepository, vcl.Dialogs, System.SysUtils;
  Type TLoginService = class
    private
      FRepository: TLoginRepository;
    public
      constructor Create;
      destructor Destroy; override;
      procedure VerificarLogin(const ALoginCfg: TLoginCfg);
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
procedure TLoginService.VerificarLogin(const ALoginCfg: TLoginCfg);
  begin
     if Trim(ALoginCfg.Email) = '' then
  begin
    MessageDlg('O campo Email n�o pode estar vazio.', mtWarning, [mbOK], 0);
    Exit;
  end;

  if Trim(ALoginCfg.Senha) = '' then
  begin
    MessageDlg('O campo Senha n�o pode estar vazio.', mtWarning, [mbOK], 0);
    Exit;
  end;


    if FRepository.VerificarUser(ALoginCfg.Email, ALoginCfg.Senha) then
    begin
      MessageDlg('Login realizado com sucesso!', mtInformation, [mbOK], 0);

    end else begin
      MessageDlg('Usu�rio ou senha inv�lidos.', mtInformation, [mbOK], 0);
    end;

  end;
end.
