unit RedirectController;

interface
uses
  System.SysUtils, LoginModel, LoginService, Vcl.Forms, Vcl.Dialogs,
  FormHomeAdmin, FormHomeClientes, FormHomeDono, FormHomeEntregador;

type
  TRedirectController = class
  private
    FLoginService: TLoginService;
    function DeterminarTela(ATipoUsuario: TTipoUsuario): String;
  public
    constructor Create;
    destructor Destroy; override;
    procedure RealizarProcessoRedirecionamento(out AResultado: TLoginResponse);
    procedure RedirecionarParaTela(const ANomeTela: String; AIdUsuario: Integer; ANomeUsuario: String);
  end;
  var
  ATIpoUsuario: TTipoUsuario;
implementation

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
  case ATipoUsuario of
    tuCliente:    Result := 'do Cliente';
    tuComercio:   Result := 'do Com�rcio';
    tuEntregador: Result := 'do Entregador';
    tuAdmin:      Result := 'do Administrador';
  else
    Result := '';
  end;
end;

procedure TRedirectController.RealizarProcessoRedirecionamento(out AResultado: TLoginResponse);
var
  NomeTela: String;
begin
    NomeTela := DeterminarTela(AResultado.TipoUsuario);
    if NomeTela <> '' then
    begin
      RedirecionarParaTela(NomeTela, AResultado.IdUsuario, AResultado.NomeUsuario);
    end
    else
    begin
      AResultado.Autenticado := False;
      AResultado.Mensagem := 'Tipo de usu�rio n�o reconhecido!';
    end;
end;

procedure TRedirectController.RedirecionarParaTela(const ANomeTela: String;
  AIdUsuario: Integer; ANomeUsuario: String);
begin
case ATipoUsuario of
    tuCliente:
      begin
        if not Assigned(FormHomeC) then
          FormHomeC := TFormHomeC.Create(Application);
        FormHomeC.IdUsuario := AIdUsuario;
        FormHomeC.NomeUsuario := ANomeUsuario;
        FormHomeC.Show;
      end;

    tuComercio:
      begin
        if not Assigned(FormHomeD) then
          FormHomeD := TFormHomeD.Create(Application);
        FormHomeD.IdUsuario := AIdUsuario;
        FormHomeD.NomeUsuario := ANomeUsuario;
        FormHomeD.Show;
      end;

    tuEntregador:
      begin
        if not Assigned(FormHomeE) then
          FormHomeE := TFormHomeE.Create(Application);
        FormHomeE.IdUsuario := AIdUsuario;
        FormHomeE.NomeUsuario := ANomeUsuario;
        FormHomeE.Show;
      end;

    tuAdmin:
      begin
        if not Assigned(FormHomeA) then
          FormHomeA := TFormHomeA.Create(Application);
        FormHomeA.IdUsuario := AIdUsuario;
        FormHomeA.NomeUsuario := ANomeUsuario;
        FormHomeA.Show;
      end;
  else
    ShowMessage('Tipo de usu�rio inv�lido!');
  end;

  ShowMessage('Redirecionando para menu: ' +
              DeterminarTela(ATipoUsuario) + sLineBreak +
              'Usu�rio ID: ' + IntToStr(AIdUsuario) + sLineBreak +
              'Nome: ' + ANomeUsuario);
end;
end.
