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
  FormHomeClientes in 'Src\View\FormHomeClientes.pas' {FormHomeC},
  FormHomeDono in 'Src\View\FormHomeDono.pas' {FormHomeD},
  FormHomeEntregador in 'Src\View\FormHomeEntregador.pas' {FormHomeE},
  FormHomeAdmin in 'Src\View\FormHomeAdmin.pas' {FormHomeA};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormHomeA, FormHomeA);
  Application.CreateForm(TFormCadastro, FormCadastro);
  Application.CreateForm(TFormHomeD, FormHomeD);
  Application.CreateForm(TFormHomeC, FormHomeC);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormHomeE, FormHomeE);
  Application.Run;
end.
