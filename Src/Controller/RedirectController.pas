unit RedirectController;

interface
uses
  System.SysUtils, LoginModel, LoginService, Vcl.Forms, Vcl.Dialogs;

type
  TRedirectController = class
  private
    FLoginService: TLoginService;
    function DeterminarTela(ATipoUsuario: TTipoUsuario): String;
  public
    constructor Create;
    destructor Destroy; override;
    procedure RealizarLoginERedirecionamento(const AEmail, ASenha: String; out AResultado: TLoginResponse);
    procedure RedirecionarParaTela(const ANomeTela: String; AIdUsuario: Integer; ANomeUsuario: String);
  end;

implementation

uses
  FormHomeAdmin, FormHomeClientes, FormHomeDono, FormHomeEntregador;

{ TRedirectController }

constructor TRedirectController.Create;
begin
  inherited;
  FLoginService := TLoginService.Create;
end;

destructor TRedirectController.Destroy;
begin
  FLoginService.Free;
  inherited;
end;

function TRedirectController.DeterminarTela(ATipoUsuario: TTipoUsuario): String;
begin
  // Define para qual tela redirecionar baseado no tipo de usuário
  case ATipoUsuario of
    tuCliente:    Result := 'do Cliente';
    tuComercio:   Result := 'do Comércio';
    tuEntregador: Result := 'do Entregador';
    tuAdmin:      Result := 'do Administrador';
  else
    Result := '';
  end;
end;

procedure TRedirectController.RealizarLoginERedirecionamento(
  const AEmail, ASenha: String; out AResultado: TLoginResponse);
var
  NomeTela: String;
begin
  // Realiza o login através do service
  AResultado := FLoginService.VerificarLogin(AEmail, ASenha);

  // Se autenticado, determina para qual tela redirecionar
  if AResultado.Autenticado then
  begin
    NomeTela := DeterminarTela(AResultado.TipoUsuario);

    if NomeTela <> '' then
    begin
      // Realiza o redirecionamento
      RedirecionarParaTela(NomeTela, AResultado.IdUsuario, AResultado.NomeUsuario);
    end
    else
    begin
      AResultado.Autenticado := False;
      AResultado.Mensagem := 'Tipo de usuário não reconhecido!';
    end;
  end;
end;

procedure TRedirectController.RedirecionarParaTela(const ANomeTela: String;
  AIdUsuario: Integer; ANomeUsuario: String);
begin
  {
  if Assigned(Application.FormLoginMain) then
    Application.FormLogin.Hide;
  // Criar e exibir o form de destino
  case ANomeTela of
    'do Cliente':
    begin
      if not Assigned(FormHomeCliente) then
        FormHomeCliente := TFormHomeCliente.Create(Application);
      FormHomeCliente.IdUsuario := AIdUsuario;
      FormHomeCliente.NomeUsuario := ANomeUsuario;
      FormHomeCliente.Show;
    end;
    'do Comércio':
    begin
      if not Assigned(FormHomeDono) then
        FormHomeDono := TFormHomeDono.Create(Application);
      FormHomeDono.IdUsuario := AIdUsuario;
      FormHomeDono.NomeUsuario := ANomeUsuario;
      FormHomeDono.Show;
    end;
    'do Entregador':
    begin
      if not Assigned(FormHomeEntregador) then
        FormHomeEntregador := TFormHomeEntregador.Create(Application);
      FormHomeEntregador.IdUsuario := AIdUsuario;
      FormHomeEntregador.NomeUsuario := ANomeUsuario;
      FormHomeEntregador.Show;
    end;
    'do Administrador':
    begin
      if not Assigned(FormHomeAdmin) then
        FormHomeAdmin := TFormHomeAdmin.Create(Application);
      FormHomeAdmin.IdUsuario := AIdUsuario;
      FormHomeAdmin.NomeUsuario := ANomeUsuario;
      FormHomeAdmin.Show;
    end;
  end;
  }
  ShowMessage('Redirecionando para menu ' + ANomeTela +
              #13#10 + 'Usuário ID: ' + IntToStr(AIdUsuario) +
              #13#10 + 'Nome: ' + ANomeUsuario);
end;

end.
