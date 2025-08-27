unit FormLoginMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormLogin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    bFormLoginSair: TButton;
    Panel4: TPanel;
    Panel5: TPanel;
    procedure bFormLoginSairClick(Sender: TObject);
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

end.
