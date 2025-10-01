unit FormHomeAdmin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, uConn;

type
  TFormHomeA = class(TForm)
    pHomeBackground: TPanel;
    pListViewMain: TPanel;
    pcMain: TPageControl;
    pctab1Selecione: TTabSheet;
    pText: TPanel;
    lblText: TLabel;
    pctab2Relatorios: TTabSheet;
    pBarraMenuLeft: TPanel;
    iButton1: TImage;
    iButton3: TImage;
    iButton2: TImage;
    iButton6: TImage;
    lblButton1: TLabel;
    lblButton2: TLabel;
    lblButton3: TLabel;
    lblButton4: TLabel;
    iButton5: TImage;
    lblButton5: TLabel;
    iButton4: TImage;
    pctab3Pedidos: TTabSheet;
    pctab4Usuarios: TTabSheet;
    pctab5Perfil: TTabSheet;
    pHeader: TPanel;
    pMainUsuarios: TPanel;
    pMainGrid: TPanel;
    pBusca: TPanel;
    DBGridUsuarios: TDBGrid;
    pButton2Excluir: TPanel;
    pButton3Atualizar: TPanel;
    pButton4Restaurar: TPanel;
    pButton5Pesquisar: TPanel;
    pButton1Adicionar: TPanel;
    pButton6Cancelar: TPanel;
    pcButtons: TPageControl;
    pctab0Clique: TTabSheet;
    pMainPTab0: TPanel;
    lblClique: TLabel;
    pctab1Add: TTabSheet;
    pctab2Ex: TTabSheet;
    pctab3Up: TTabSheet;
    pctab4Res: TTabSheet;
    pctab5Pesq: TTabSheet;
    pctab6Canc: TTabSheet;
    eBuscaMain: TEdit;
    pHideTSbar: TPanel;
    procedure iButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pButton1AdicionarClick(Sender: TObject);
    procedure pButton2ExcluirClick(Sender: TObject);
    procedure pButton3AtualizarClick(Sender: TObject);
    procedure pButton4RestaurarClick(Sender: TObject);
    procedure pButton5PesquisarClick(Sender: TObject);
    procedure pButton6CancelarClick(Sender: TObject);

  private
    procedure AtualizarGrid;
  public

  end;
var
  FormHomeA: TFormHomeA;

implementation

{$R *.dfm}

procedure TFormHomeA.AtualizarGrid;
begin
  if Assigned(DM) and Assigned(DM.FDQr) then
  begin
    if Assigned(DBGridUsuarios) and Assigned(DM) then
    begin
      DM.DS.DataSet := DM.FDQr;
      DBGridUsuarios.DataSource := DM.DS;
    end;
    with DM.FDQr do
    begin
      try
        DisableControls;
        DBGridUsuarios.Columns.Clear;
        if Active then
          Close;
        SQL.Text := 'SELECT * FROM usuarios ORDER BY id_user';
        Open;
        Filtered := False;
        Filter := '';
        First;
        DBGridUsuarios.Invalidate;
      finally
        EnableControls;
      end;
    end;
    eBuscaMain.Clear;
  end
  else
  begin
    ShowMessage('ERRO: Fonte de dados (DM.FDQr) ou Grid não estão acessíveis/conectados.');
  end;
end;

procedure TFormHomeA.FormCreate(Sender: TObject);
begin
  eBuscaMain.Clear;
  eBuscaMain.TextHint := 'Para digitar clique no botão "Pesquisar"';
  try
    if Assigned(DM) and Assigned(DM.FDQr) then
      AtualizarGrid;
  except
    on E: Exception do
      ShowMessage('Erro ao inicializar grid: ' + E.Message);
  end;
end;

procedure TFormHomeA.iButton1Click(Sender: TObject);
begin
 if pBarraMenuLeft.Width = 89 then begin
    pBarraMenuLeft.Width := 200;
  end else begin
    pBarraMenuLeft.Width := 89;
  end;
end;

procedure TFormHomeA.pButton1AdicionarClick(Sender: TObject);
begin
AtualizarGrid;
end;

procedure TFormHomeA.pButton2ExcluirClick(Sender: TObject);
begin
  AtualizarGrid;
end;

procedure TFormHomeA.pButton3AtualizarClick(Sender: TObject);
begin
  AtualizarGrid;
end;

procedure TFormHomeA.pButton4RestaurarClick(Sender: TObject);
begin
  AtualizarGrid;
end;

procedure TFormHomeA.pButton5PesquisarClick(Sender: TObject);
begin
  AtualizarGrid;
end;

procedure TFormHomeA.pButton6CancelarClick(Sender: TObject);
begin
  AtualizarGrid;
end;

end.
