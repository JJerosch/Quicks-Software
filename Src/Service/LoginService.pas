unit LoginService;

interface
  uses
    LoginModel,LoginRepository, vcl.Dialogs;
  Type TLoginService = class
    public
      procedure SalvarLogin(const ALoginCfg: TLoginCfg);
    end;
implementation
{ TLoginService }

procedure TLoginService.SalvarLogin(const ALoginCfg: TLoginCfg);
  begin
    if ALoginCfg.Email = '' then
      begin
        MessageDlg('Preencha o campo Email e tente novamente.',mtWarning,[mbOk],0);
      end else if ALoginCfg.Senha = '' then
      begin
        MessageDlg('Preencha o campo Senha e tente novamente.',mtWarning,[mbOk],0);
      end else begin
        TLoginRepository.Create;
    end;
  end;
end.
