unit FormCadastroMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TFormCadastro = class(TForm)
    Panel1: TPanel;
    iLoginLeft: TImage;
    pRight: TPanel;
    lblLogin: TLabel;
    pLR: TPanel;
    shpLR: TShape;
    lblTituloMain: TLabel;
    lblSenha: TLabel;
    lblEmail: TLabel;
    lblAntesTroca: TLabel;
    lblTroca: TLabel;
    bLogin: TPanel;
    lblConfirmar: TLabel;
    eEmail: TEdit;
    eNome: TEdit;
    pSair: TPanel;
    lblSair: TLabel;
    shSair: TShape;
    lblCPF: TLabel;
    eCPF: TEdit;
    lblNome: TLabel;
    Edit1: TEdit;
    cbComercio: TCheckBox;
    cbEntregador: TCheckBox;
    cbConsumidor: TCheckBox;
    lblTipoConta: TLabel;
    shConfirmar: TShape;
    procedure pSairClick(Sender: TObject);
    procedure lblTrocaClick(Sender: TObject);
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

procedure TFormCadastro.lblTrocaClick(Sender: TObject);
begin
FormCadastro.Close;
end;

procedure TFormCadastro.pSairClick(Sender: TObject);
begin
FormCadastro.Close;
end;

end.
