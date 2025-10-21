unit FormLoginMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, Vcl.Mask, Vcl.Buttons, LoginModel, RedirectController;

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
    FRedirectController: TRedirectController;
    FTipoUsuario: String;
    FIdUsuario: Integer;
    FNomeUsuario: String;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property TipoUsuario: String read FTipoUsuario;
    property IdUsuario: Integer read FIdUsuario;
    property NomeUsuario: String read FNomeUsuario;
  end;

var
  FormLogin: TFormLogin;

implementation
uses
  FormCadastroMain;
{$R *.dfm}

procedure TFormLogin.bFormLoginSairClick(Sender: TObject);
begin
  FormLogin.Close;
end;

constructor TFormLogin.Create(AOwner: TComponent);
begin
  inherited;
  FRedirectController := TRedirectController.Create;
  FTipoUsuario := '';
  FIdUsuario := 0;
  FNomeUsuario := '';
end;

destructor TFormLogin.Destroy;
begin
  FRedirectController.Free;
  inherited;
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

procedure TFormLogin.sbConfirmarClick(Sender: TObject);
var
  LoginResponse: TLoginResponse;
  Email, Senha: String;
begin
  // Obtém os dados dos campos
  Email := Trim(eEmail.Text);
  Senha := Trim(meSenha.Text);

  // Desabilita o botão durante o processo
  sbConfirmar.Enabled := False;
  try
    // Realiza o login através do controller
    FRedirectController.RealizarLoginERedirecionamento(Email, Senha, LoginResponse);

    try
      if LoginResponse.Autenticado then
      begin
        // Sucesso - armazena os dados do usuário no form
        FTipoUsuario := LoginResponse.TipoUsuarioToString;
        FIdUsuario := LoginResponse.IdUsuario;
        FNomeUsuario := LoginResponse.NomeUsuario;

        // Fecha o form com sucesso
        ModalResult := mrOk;
      end
      else
      begin
        // Falha no login - exibe mensagem de erro
        ShowMessage(LoginResponse.Mensagem);
        meSenha.Clear;
        meSenha.SetFocus;
        ModalResult := mrNone; // Mantém o form aberto
      end;
    finally
      LoginResponse.Free;
    end;

  finally
    sbConfirmar.Enabled := True;
  end;
end;

end.
