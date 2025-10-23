unit FormLoginMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, Vcl.Mask, Vcl.Buttons, LoginModel, LoginController,
  RedirectController, FormCadastroMain, FormHomeAdmin, FormHomeClientes, FormHomeDono, FormHomeEntregador, uConn;

type
  TFormLogin = class(TForm)
    pRight: TPanel;
    lblLogin: TLabel;
    pLeft: TPanel;
    iLoginLeft: TImage;
    pLR: TPanel;
    bLogin: TPanel;
    lblTituloMain: TLabel;
    eEmail: TEdit;
    lblSenha: TLabel;
    lblEmail: TLabel;
    lblAntesTroca: TLabel;
    lblTroca: TLabel;
    shpLR: TShape;
    lblConfirmar: TLabel;
    pSair: TPanel;
    shSair: TShape;
    lblSair: TLabel;
    meSenha: TMaskEdit;
    shConfirmar: TShape;
    sbConfirmar: TSpeedButton;
    procedure bFormLoginSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pSairClick(Sender: TObject);
    procedure lblTrocaClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure pSairResize(Sender: TObject);
    procedure lblConfirmarMouseEnter(Sender: TObject);
    procedure lblSairMouseEnter(Sender: TObject);
    procedure lblSairMouseLeave(Sender: TObject);
    procedure lblConfirmarMouseLeave(Sender: TObject);
    procedure lblTrocaMouseLeave(Sender: TObject);
    procedure lblTrocaMouseEnter(Sender: TObject);
    procedure sbConfirmarClick(Sender: TObject);
  private
    FTipoUsuario: String;
    FIdUsuario: Integer;
    FNomeUsuario: String;
  public
    function DeterminarTela(ATipoUsuario: TTipoUsuario): String;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property TipoUsuario: String read FTipoUsuario;
    property IdUsuario: Integer read FIdUsuario;
    property NomeUsuario: String read FNomeUsuario;
    procedure RealizarProcessoRedirecionamento(LoginResponse: TLoginResponse);
    procedure RedirecionarParaTela(ATipoUsuario: TTipoUsuario; AIdUsuario: Integer; ANomeUsuario: String);
  end;

var
  FormLogin: TFormLogin;
  ATipoUsuario: TTIpoUsuario;
implementation

{$R *.dfm}

procedure TFormLogin.bFormLoginSairClick(Sender: TObject);
begin
  FormLogin.Close;
end;

constructor TFormLogin.Create(AOwner: TComponent);
begin
  inherited;
  FTipoUsuario := '';
  FIdUsuario := 0;
  FNomeUsuario := '';
end;

destructor TFormLogin.Destroy;
begin
  inherited;
end;

function TFormLogin.DeterminarTela(ATipoUsuario: TTipoUsuario): String;
begin
  case ATipoUsuario of
    tuCliente:    Result := 'do Cliente';
    tuComercio:   Result := 'do Comércio';
    tuEntregador: Result := 'do Entregador';
    tuAdmin:      Result := 'do Administrador';
  else
    Result := '';
  end;
end;

procedure TFormLogin.FormCreate(Sender: TObject);
begin
  iLoginLeft.Stretch := True;
  iLoginLeft.Proportional := True;
  iLoginLeft.Center := True;
  if WindowState = wsMaximized then begin
    iLoginLeft.Width := 1800;
    lblLogin.Margins.Top := 250;
  end else begin
    iLoginLeft.Width := 800;
    lblLogin.Margins.Top := 50;
  end;
end;

procedure TFormLogin.FormResize(Sender: TObject);
begin
  if WindowState = wsMaximized then begin
    lblLogin.Margins.Top := 250;
  end else begin
    lblLogin.Margins.Top := 50;
  end;
end;

procedure TFormLogin.lblConfirmarMouseEnter(Sender: TObject);
begin
  shConfirmar.Brush.Color := $00003AD5;
  lblConfirmar.Font.Color := clWhite;
  lblConfirmar.Font.Style := [fsBold];
end;

procedure TFormLogin.lblConfirmarMouseLeave(Sender: TObject);
begin
  shConfirmar.Brush.Color := $005383FF;
  lblConfirmar.Font.Color := clBlack;
  lblConfirmar.Font.Style := [];
end;

procedure TFormLogin.lblSairMouseEnter(Sender: TObject);
begin
  shSair.Brush.Color := $00A7A7A7;
  lblSair.Font.Color := $00FFF4F4;
  lblSair.Font.Style := [fsBold];
end;

procedure TFormLogin.lblSairMouseLeave(Sender: TObject);
begin
  shSair.Brush.Color := clWhite;
  lblSair.Font.Color := clBlack;
  lblSair.Font.Style := [];
end;

procedure TFormLogin.lblTrocaClick(Sender: TObject);
begin
  Self.Hide;
  FormCadastro.ShowModal;
  Self.Show;
end;

procedure TFormLogin.lblTrocaMouseEnter(Sender: TObject);
begin
  lblTroca.Font.Style := [fsUnderline];
end;

procedure TFormLogin.lblTrocaMouseLeave(Sender: TObject);
begin
  lblTroca.Font.Style := [];
end;

procedure TFormLogin.pSairClick(Sender: TObject);
begin
  FormLogin.Close;
end;

procedure TFormLogin.pSairResize(Sender: TObject);
begin
  if WindowState = wsMaximized then begin
    lblLogin.Margins.Top := 250;
  end else begin
    lblLogin.Margins.Top := 50;
  end;
end;

procedure TFormLogin.RealizarProcessoRedirecionamento(LoginResponse: TLoginResponse);
var
  NomeTela: String;
begin
  NomeTela := DeterminarTela(LoginResponse.TipoUsuario);
  if NomeTela <> '' then
  begin
    // Passa o TipoUsuario do LoginResponse
    RedirecionarParaTela(LoginResponse.TipoUsuario, LoginResponse.IdUsuario, LoginResponse.NomeUsuario);
  end
  else
  begin
    LoginResponse.Autenticado := False;
    LoginResponse.Mensagem := 'Tipo de usuário não reconhecido!';
    ShowMessage(LoginResponse.Mensagem);
  end;
end;

procedure TFormLogin.RedirecionarParaTela(ATipoUsuario: TTipoUsuario; AIdUsuario: Integer; ANomeUsuario: String);
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
    ShowMessage('Tipo de usuário inválido!');
  end;

  ShowMessage('Redirecionando para menu: ' +
              DeterminarTela(ATipoUsuario) + sLineBreak +
              'Usuário ID: ' + IntToStr(AIdUsuario) + sLineBreak +
              'Nome: ' + ANomeUsuario);
end;
procedure TFormLogin.sbConfirmarClick(Sender: TObject);
var
  LocalLoginRequest: TLoginRequest;
  LocalLoginResponse: TLoginResponse;
  LocalLoginController: TLoginController;
begin
  // Verificar se DM existe
  if not Assigned(DM) then
  begin
    ShowMessage('Erro: Sistema não inicializado corretamente');
    Exit;
  end;

  // Validar campos
  if Trim(eEmail.Text) = '' then
  begin
    ShowMessage('Por favor, informe o e-mail.');
    eEmail.SetFocus;
    Exit;
  end;

  if Trim(meSenha.Text) = '' then
  begin
    ShowMessage('Por favor, informe a senha.');
    meSenha.SetFocus;
    Exit;
  end;

  LocalLoginRequest := nil;
  LocalLoginResponse := nil;
  LocalLoginController := nil;

  try
    LocalLoginRequest := TLoginRequest.Create;
    LocalLoginController := TLoginController.Create;
    LocalLoginRequest.Email := Trim(eEmail.Text);
    LocalLoginRequest.Senha := Trim(meSenha.Text);
    sbConfirmar.Enabled := False;
    LocalLoginResponse := LocalLoginController.VerificarLogin(LocalLoginRequest);
    if Assigned(LocalLoginResponse) and LocalLoginResponse.Autenticado then
    begin
      FTipoUsuario := LocalLoginResponse.TipoUsuarioToString;
      FIdUsuario := LocalLoginResponse.IdUsuario;
      FNomeUsuario := LocalLoginResponse.NomeUsuario;
      RealizarProcessoRedirecionamento(LocalLoginResponse);
      Self.Hide;
    end
    else
    begin
      if Assigned(LocalLoginResponse) then
        ShowMessage(LocalLoginResponse.Mensagem)
      else
        ShowMessage('Erro ao processar login.');

      meSenha.Clear;
      eEmail.SetFocus;
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao processar login: ' + E.Message);
    end;
  end;
  if Assigned(LocalLoginResponse) then
    LocalLoginResponse.Free;
  if Assigned(LocalLoginRequest) then
    LocalLoginRequest.Free;
  if Assigned(LocalLoginController) then
    LocalLoginController.Free;

  sbConfirmar.Enabled := True;
end;

end.
