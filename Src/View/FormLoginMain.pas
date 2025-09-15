unit FormLoginMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, Vcl.Mask;

type
  TFormLogin = class(TForm)
    pRight: TPanel;
    lblLogin: TLabel;
    Panel1: TPanel;
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
    shConfirmar: TShape;
    lblConfirmar: TLabel;
    pSair: TPanel;
    shSair: TShape;
    lblSair: TLabel;
    meSenha: TMaskEdit;
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
  private
    { Private declarations }
  public
    { Public declarations }
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

procedure TFormLogin.FormCreate(Sender: TObject);
  begin
  iLoginLeft.Stretch:=True;
  iLoginLeft.Proportional:=True;
  iLoginLeft.Center:=True;
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
  shConfirmar.Brush.Color:=$00003AD5;
  lblConfirmar.Font.Color:=clwhite;
  lblConfirmar.Font.Style := [fsBold];
end;

procedure TFormLogin.lblSairMouseEnter(Sender: TObject);
begin
  shSair.Brush.Color:=$00A7A7A7;
  lblSair.Font.Color:=$00FFF4F4;
  lblsair.Font.Style := [fsBold];
end;

procedure TFormLogin.lblSairMouseLeave(Sender: TObject);
begin
  shSair.Brush.Color:=clwhite;
  lblSair.Font.Color:=clblack;
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

procedure TFormLogin.lblConfirmarMouseLeave(Sender: TObject);
begin
  shConfirmar.Brush.Color:=$005383FF;
  lblConfirmar.Font.Color:=clblack;
  lblConfirmar.Font.Style := [];
end;

end.
