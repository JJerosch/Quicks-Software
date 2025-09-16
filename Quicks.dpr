program Quicks;

uses
  Vcl.Forms,
  FormLoginMain in 'Src\View\FormLoginMain.pas' {FormLogin},
  FormCadastroMain in 'Src\View\FormCadastroMain.pas' {FormCadastro},
  uConn in 'Src\Model\uConn.pas' {DM: TDataModule},
  uDTMDL in 'Src\Model\uDTMDL.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormCadastro, FormCadastro);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
