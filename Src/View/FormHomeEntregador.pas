unit FormHomeEntregador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Imaging.pngimage;

type
  TForm2 = class(TForm)
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.iButton1MenuClick(Sender: TObject);
begin
   if pBarraMenuLeft.Width = 89 then begin
    pBarraMenuLeft.Width := 190;
  end else begin
    pBarraMenuLeft.Width := 89;
  end;
end;

end.
