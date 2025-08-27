program Quicks;

uses
  Vcl.Forms,
  FormLoginMain in 'Src\View\FormLoginMain.pas' {FormLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.Run;
end.
