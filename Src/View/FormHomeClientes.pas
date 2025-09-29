unit FormHomeClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ComCtrls;

type
  TFormHomeClie = class(TForm)
    pHomeBackground: TPanel;
    pBarraMenuLeft: TPanel;
    iButton1: TImage;
    iButton2: TImage;
    iButton3: TImage;
    iButton4: TImage;
    iButtonLeave: TImage;
    pListViewMain: TPanel;
    scbxMain: TScrollBox;
    lvMain: TListView;
    pExploreCarrinho: TPanel;
    pBusca: TPanel;
    Image1: TImage;
    eBuscaMain: TEdit;
    pTextCarrinho: TPanel;
    lblText: TLabel;
    pButtonCarrinho: TPanel;
    shButtonCarrinho: TShape;
    lblButtonCarrinho: TLabel;
    pBanner: TPanel;
    iCarrinho: TImage;
    lblButton1: TLabel;
    lblButton2: TLabel;
    lblButton3: TLabel;
    lblButton4: TLabel;
    procedure iButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHomeClie: TFormHomeClie;

implementation

{$R *.dfm}

procedure TFormHomeClie.iButton1Click(Sender: TObject);
begin
  if pBarraMenuLeft.Width = 89 then begin
    pBarraMenuLeft.Width := 190;
  end else begin
    pBarraMenuLeft.Width := 89;
  end;

end;

end.
