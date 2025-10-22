unit FormHomeEntregador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Imaging.pngimage;

type
  TFormHomeE = class(TForm)
    pHomeBackground: TPanel;
    pBarraMenuLeft: TPanel;
    iButton1Menu: TImage;
    iButton3Pedidos: TImage;
    iButton4Perfil: TImage;
    iButtonLeave: TImage;
    lblButton1: TLabel;
    lblButton3: TLabel;
    lblButton4: TLabel;
    pListViewMain: TPanel;
    scbxMain: TScrollBox;
    lvMain: TListView;
    pTextCarrinho: TPanel;
    lblText: TLabel;
    pHeader: TPanel;
    pBusca: TPanel;
    procedure iButton1MenuClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FIdUsuario: Integer;
    FNomeUsuario: String;
  public
    property IdUsuario: Integer read FIdUsuario write FIdUsuario;
    property NomeUsuario: String read FNomeUsuario write FNomeUsuario;
  end;

var
  FormHomeE: TFormHomeE;

implementation

{$R *.dfm}

procedure TFormHomeE.iButton1MenuClick(Sender: TObject);
begin
   if pBarraMenuLeft.Width = 89 then begin
    pBarraMenuLeft.Width := 190;
  end else begin
    pBarraMenuLeft.Width := 89;
  end;
end;
procedure TFormHomeE.FormShow(Sender: TObject);
begin
// Usar os dados do usuário quando o form for exibido
  Caption := 'Home Entregador - ' + FNomeUsuario;
  lblText.Caption := 'Bem-vindo, ' + FNomeUsuario + '!';
end;

end.
