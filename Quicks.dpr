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
  DTOLC in 'Src\DTO\DTOLC.pas',
  CadastroModel in 'Src\Model\CadastroModel.pas',
  CadastroService in 'Src\Service\CadastroService.pas',
  CadastroRepository in 'Src\Repository\CadastroRepository.pas',
  CadastroController in 'Src\Controller\CadastroController.pas',
  FormHomeClientes in 'Src\View\FormHomeClientes.pas' {FormHomeClie},
  FormHomeDono in 'Src\View\FormHomeDono.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormHomeClie, FormHomeClie);
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormCadastro, FormCadastro);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
