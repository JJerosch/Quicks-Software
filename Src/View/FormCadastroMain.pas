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
    shConfirmar: TShape;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastro: TFormCadastro;

implementation

{$R *.dfm}

end.
