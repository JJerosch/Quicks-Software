unit FormCadastroMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,Vcl.StdCtrls,
  Vcl.Mask, CadastroModel, CadastroController, LogSistema;

type
  TFormCadastro = class(TForm)
    pLeft: TPanel;
    iCadastroLeft: TImage;
    pRight: TPanel;
    lblQuicks: TLabel;
    pLR: TPanel;
    shpLR: TShape;
    lblTituloMain: TLabel;
    lblSenha: TLabel;
    lblEmail: TLabel;
    lblAntesTroca: TLabel;
    lblTroca: TLabel;
    bCadastro: TPanel;
    eEmail: TEdit;
    eNome: TEdit;
    lblCPF: TLabel;
    eCPF: TEdit;
    lblNome: TLabel;
    pSair: TPanel;
    shSair: TShape;
    lblSair: TLabel;
    meCPF: TMaskEdit;
    lblConfirmar: TLabel;
    meSenha: TMaskEdit;
    lblNPhone: TLabel;
    meNPhone: TMaskEdit;
    eNPhone: TEdit;
    shConfirmar: TShape;
    cbOpcoes: TComboBox;
    procedure pSairClick(Sender: TObject);
    procedure lblTrocaClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure shConfirmarMouseEnter(Sender: TObject);
    procedure shConfirmarMouseLeave(Sender: TObject);
    procedure eCPFChange(Sender: TObject);
    procedure lblSairMouseEnter(Sender: TObject);
    procedure lblSairMouseLeave(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lblTrocaMouseEnter(Sender: TObject);
    procedure lblTrocaMouseLeave(Sender: TObject);
    procedure eNPhoneChange(Sender: TObject);
    procedure lblConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastro: TFormCadastro;

implementation

{$R *.dfm}

uses FormLoginMain;

procedure TFormCadastro.shConfirmarMouseEnter(Sender: TObject);
begin
  shConfirmar.Brush.Color:=$00003AD5;
  lblConfirmar.Font.Color:=clwhite;
  lblConfirmar.Font.Style := [fsBold];
end;

procedure TFormCadastro.lblConfirmarClick(Sender: TObject);
var
  Cadastro: TCadastroCfg;
  Controller: TCadastroController;
begin
  Cadastro := TCadastroCfg.Create;
  Controller := TCadastroController.Create;
  try
    Cadastro.Nome := eNome.Text;
    Cadastro.Email := eEmail.Text;
    Cadastro.CPF := meCPF.Text;
    Cadastro.Senha := meSenha.Text;
    Cadastro.NPhone := meNPhone.Text;
    Cadastro.TipoUsuario := cbOpcoes.Text;

    if Controller.ProcessoCadastro(Cadastro) then
    begin
      // ✅ REMOVIDO: Não registra aqui, deixa o Controller fazer isso
      // TLogSistema.RegistrarAcaoUsuario(...);

      // Limpar campos
      eNome.Clear;
      eEmail.Clear;
      meCPF.Clear;
      meSenha.Clear;
      meNPhone.Clear;
      cbOpcoes.ItemIndex := 0;
    end;
    // ✅ REMOVIDO: else com registro de erro

  finally
    Cadastro.Free;
    Controller.Free;
  end;
end;

procedure TFormCadastro.lblSairMouseEnter(Sender: TObject);
begin
  shSair.Brush.Color:=$00A7A7A7;
  lblSair.Font.Color:=$00FFF4F4;
  lblsair.Font.Style := [fsBold];
end;

procedure TFormCadastro.lblSairMouseLeave(Sender: TObject);
begin
  shSair.Brush.Color:=clwhite;
  lblSair.Font.Color:=clblack;
  lblSair.Font.Style := [];
end;

procedure TFormCadastro.lblTrocaClick(Sender: TObject);
begin
  FormCadastro.Close;
end;

procedure TFormCadastro.lblTrocaMouseEnter(Sender: TObject);
begin
  lblTroca.Font.Style := [fsUnderline];
end;

procedure TFormCadastro.lblTrocaMouseLeave(Sender: TObject);
begin
  lblTroca.Font.Style := [];
end;

procedure TFormCadastro.pSairClick(Sender: TObject);
begin
  FormCadastro.Close;
end;

procedure TFormCadastro.shConfirmarMouseLeave(Sender: TObject);
begin
  shConfirmar.Brush.Color:=$005383FF;
  lblConfirmar.Font.Color:=clblack;
  lblConfirmar.Font.Style := [];
end;

procedure TFormCadastro.eCPFChange(Sender: TObject);
begin
  eCPF.Hide;
  meCPF.SetFocus;
end;

procedure TFormCadastro.eNPhoneChange(Sender: TObject);
begin
  eNPhone.Hide;
  meNPhone.SetFocus;
end;

procedure TFormCadastro.FormCreate(Sender: TObject);
begin
  iCadastroLeft.Stretch:=True;
  iCadastroLeft.Proportional:=True;
  iCadastroLeft.Center:=True;
  if WindowState = wsMaximized then begin
    iCadastroLeft.Width := 1800;
  end else begin
    iCadastroLeft.Width := 800;
  end;
end;

procedure TFormCadastro.FormResize(Sender: TObject);
begin
  if WindowState = wsMaximized then begin
    lblQuicks.Margins.Top := 250;
  end else begin
    lblQuicks.Margins.Top := 50;
  end;
end;

end.
