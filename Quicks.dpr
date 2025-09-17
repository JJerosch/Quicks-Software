program Quicks;

uses
  Vcl.Forms,
  FormLoginMain in 'Src\View\FormLoginMain.pas' {FormLogin},
  FormCadastroMain in 'Src\View\FormCadastroMain.pas' {FormCadastro},
  uConn in 'Src\Model\uConn.pas' {DM: TDataModule},
  LoginModel in 'Src\Model\LoginModel.pas',
  LoginService in 'Src\Service\LoginService.pas',
  LoginController in 'Src\Controller\LoginController.pas',
  LoginRepository in 'Src\Repository\LoginRepository.pas',
  DTOLC in 'Src\DTO\DTOLC.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormCadastro, FormCadastro);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
