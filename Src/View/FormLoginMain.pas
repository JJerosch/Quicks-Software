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
    bSair: TPanel;
    bRegister: TPanel;
    bLogin: TPanel;
    Panel1: TPanel;
    iLoginLeft: TImage;
    Shape1: TShape;
    pEmailLogin: TPanel;
    eEmail: TEdit;
    procedure bFormLoginSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

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
end.
