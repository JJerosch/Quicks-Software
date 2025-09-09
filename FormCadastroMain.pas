unit FormCadastroMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
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
    eSenha: TEdit;
    eEmail: TEdit;
    pSair: TPanel;
    lblSair: TLabel;
    shSair: TShape;
    shConfirmar: TShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
