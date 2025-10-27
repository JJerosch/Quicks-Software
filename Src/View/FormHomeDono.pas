unit FormHomeDono;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Imaging.pngimage;

type
  TFormHomeD = class(TForm)
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
    iButton4: TImage;
    iButton5: TImage;
    lblButton5: TLabel;
    pListViewMain: TPanel;
    pcMain: TPageControl;
    ts1Selecione: TTabSheet;
    pText: TPanel;
    lblText: TLabel;
    pBusca: TPanel;
    ts2Relatorios: TTabSheet;
    lblUserNameHeader: TLabel;
    lblUserIdHeader: TLabel;
    lblButton6: TLabel;
    ts3Pedidos: TTabSheet;
    ts4Produtos: TTabSheet;
    ts5Perfil: TTabSheet;
    procedure iButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure iButton4Click(Sender: TObject);
    procedure iButton3Click(Sender: TObject);
    procedure iButton2Click(Sender: TObject);
    procedure iButton5Click(Sender: TObject);
    procedure iButton6Click(Sender: TObject);
  private
    FIdUsuario: Integer;
    FNomeUsuario: String;
  public
    property IdUsuario: Integer read FIdUsuario write FIdUsuario;
    property NomeUsuario: String read FNomeUsuario write FNomeUsuario;
  end;

var
  FormHomeD: TFormHomeD;

implementation

{$R *.dfm}

procedure TFormHomeD.FormShow(Sender: TObject);
begin
    lblUserNameHeader.Caption := NomeUsuario;
    lblUserIdHeader.Caption := IdUsuario.ToString;
end;

procedure TFormHomeD.iButton1Click(Sender: TObject);
begin
   if pBarraMenuLeft.Width = 89 then begin
    pBarraMenuLeft.Width := 200;
  end else begin
    pBarraMenuLeft.Width := 89;
  end;
end;

procedure TFormHomeD.iButton2Click(Sender: TObject);
begin
  pcMain.ActivePageIndex := 2;
end;

procedure TFormHomeD.iButton3Click(Sender: TObject);
begin
  pcMain.ActivePageIndex := 3;
end;

procedure TFormHomeD.iButton4Click(Sender: TObject);
begin
  pcMain.ActivePageIndex := 4;
end;

procedure TFormHomeD.iButton5Click(Sender: TObject);
begin
  pcMain.ActivePageIndex := 5;
end;

procedure TFormHomeD.iButton6Click(Sender: TObject);
begin
  ShowMessage('Encerrando aplicação...');
  FormHomeD.Close;
end;

end.
