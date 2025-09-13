unit FormLoginMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg;

type
  TFormLogin = class(TForm)
    pRight: TPanel;
    lblLogin: TLabel;
    Panel1: TPanel;
    iLoginLeft: TImage;
    pLR: TPanel;
    bLogin: TPanel;
    lblTituloMain: TLabel;
    eSenha: TEdit;
    eEmail: TEdit;
    lblSenha: TLabel;
    lblEmail: TLabel;
    lblAntesTroca: TLabel;
    lblTroca: TLabel;
    shpLR: TShape;
    Shape1: TShape;
    Label1: TLabel;
    pSair: TPanel;
    shSair: TShape;
    lblSair: TLabel;
    procedure bFormLoginSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pSairClick(Sender: TObject);
    procedure lblTrocaClick(Sender: TObject);
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




end else begin


  iLoginLeft.Width := 800;
end;



end;
procedure TFormLogin.lblTrocaClick(Sender: TObject);
begin
Self.Hide;
FormCadastro.ShowModal;
Self.Show;
end;

procedure TFormLogin.pSairClick(Sender: TObject);
begin
FormLogin.Close;
end;

end.
