unit FormHomeClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  TFormHomeClie = class(TForm)
    pHomeBackground: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    eBuscaMain: TEdit;
    pBarraMenuLeft: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHomeClie: TFormHomeClie;

implementation

{$R *.dfm}

end.
