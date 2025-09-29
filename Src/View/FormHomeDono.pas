unit FormHomeDono;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    pHomeBackground: TPanel;
    pBarraMenuLeft: TPanel;
    iButton1: TImage;
    iButton3: TImage;
    iButton2: TImage;
    iButton6: TImage;
    lblButton1: TLabel;
    lblButton2: TLabel;
    lblButton3: TLabel;
    lblButton4: TLabel;
    pListViewMain: TPanel;
    pExploreCarrinho: TPanel;
    pBusca: TPanel;
    pText: TPanel;
    lblText: TLabel;
    iBUtton4: TImage;
    iButton5: TImage;
    lblButton5: TLabel;
    pNomeUser: TPanel;
    lblNomeUserNome: TLabel;
    lblNomeUserOlá: TLabel;
    procedure iButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.iButton1Click(Sender: TObject);
begin
   if pBarraMenuLeft.Width = 89 then begin
    pBarraMenuLeft.Width := 200;
  end else begin
    pBarraMenuLeft.Width := 89;
  end;
end;

end.
