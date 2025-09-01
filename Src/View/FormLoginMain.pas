unit FormLoginMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TFormLogin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
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

Image1.Stretch:=True;
Image1.Proportional:=True;
Image1.Center:=True;


if WindowState = wsMaximized then begin
  Image1.Width := 1000
end else begin
  Image1.Width := 800;
end;



end;
end.
