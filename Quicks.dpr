program Quicks;

uses
  Vcl.Forms,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.PG,
  FireDAC.Phys.PGDef,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  Vcl.Dialogs,
  FormLoginMain in 'Src\View\FormLoginMain.pas' {FormLogin},
  FormCadastroMain in 'Src\View\FormCadastroMain.pas' {FormCadastro},
  uConn in 'Src\Model\uConn.pas' {DM: TDataModule},
  LoginModel in 'Src\Model\LoginModel.pas',
  LoginService in 'Src\Service\LoginService.pas',
  LoginController in 'Src\Controller\LoginController.pas',
  LoginRepository in 'Src\Repository\LoginRepository.pas',
  CadastroModel in 'Src\Model\CadastroModel.pas',
  CadastroService in 'Src\Service\CadastroService.pas',
  CadastroRepository in 'Src\Repository\CadastroRepository.pas',
  CadastroController in 'Src\Controller\CadastroController.pas',
  FormHomeClientes in 'Src\View\FormHomeClientes.pas' {FormHomeC},
  FormHomeDono in 'Src\View\FormHomeDono.pas' {FormHomeD},
  FormHomeEntregador in 'Src\View\FormHomeEntregador.pas' {FormHomeE},
  FormHomeAdmin in 'Src\View\FormHomeAdmin.pas' {FormHomeA},
  UsuarioModelCRUDAdmin in 'Src\Model\UsuarioModelCRUDAdmin.pas',
  CargosModelCRUDAdmin in 'Src\Model\CargosModelCRUDAdmin.pas',
  UsuarioRepositoryCRUDAdmin in 'Src\Repository\UsuarioRepositoryCRUDAdmin.pas',
  CargosRepositoryCRUDAdmin in 'Src\Repository\CargosRepositoryCRUDAdmin.pas',
  UsuarioServiceCRUDAdmin in 'Src\Service\UsuarioServiceCRUDAdmin.pas',
  CargosServiceCRUDAdmin in 'Src\Service\CargosServiceCRUDAdmin.pas',
  UsuarioControllerCRUDAdmin in 'Src\Controller\UsuarioControllerCRUDAdmin.pas',
  RedirectController in 'Src\Controller\RedirectController.pas',
  UsuarioDataSetHelperCRUDAdmin in 'Src\Utils\UsuarioDataSetHelperCRUDAdmin.pas',
  PasswordHelper in 'Src\Utils\PasswordHelper.pas',
  UsuarioViewHelperCRUDAdmin in 'Src\Utils\UsuarioViewHelperCRUDAdmin.pas',
  ProdutoModel in 'Src\Model\ProdutoModel.pas',
  ProdutoService in 'Src\Service\ProdutoService.pas',
  ProdutoRepository in 'Src\Repository\ProdutoRepository.pas',
  ProdutoController in 'Src\Controller\ProdutoController.pas',
  ProdutoViewHelper in 'Src\Utils\ProdutoViewHelper.pas',
  ComercioModel in 'Src\Model\ComercioModel.pas',
  ComercioRepository in 'Src\Repository\ComercioRepository.pas',
  ComercioService in 'Src\Service\ComercioService.pas',
  ComercioViewHelper in 'Src\Utils\ComercioViewHelper.pas',
  ComercioController in 'Src\Controller\ComercioController.pas',
  ClienteController in 'Src\Controller\ClienteController.pas',
  ClienteRepository in 'Src\Repository\ClienteRepository.pas';

{$R *.res}

var
  Controller: TLoginController;
begin
  Application.Initialize;
  RegisterClass(TFDQuery);
  RegisterClass(TFDMemTable);
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormHomeD, FormHomeD);
  Application.CreateForm(TFormHomeA, FormHomeA);
  Application.CreateForm(TFormCadastro, FormCadastro);
  Application.CreateForm(TFormHomeC, FormHomeC);
  Application.CreateForm(TFormHomeE, FormHomeE);
  Application.Run;
end.
