unit FormHomeDono;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Imaging.pngimage, Data.DB, Vcl.Mask, Vcl.Grids, Vcl.DBGrids,
  uConn, FireDAC.Comp.Client, System.Generics.Collections,
  ProdutoModel, ProdutoController, ProdutoViewHelper;

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
    ts3Pedidos: TTabSheet;
    ts4Produtos: TTabSheet;
    ts5Perfil: TTabSheet;
    pDadosHeader: TPanel;
    lblUserIdHeader: TLabel;
    lblButton6: TLabel;
    lblUserNameHeader: TLabel;
    pMainProdutos: TPanel;
    pMainGrid: TPanel;
    DBGridProdutos: TDBGrid;
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
    pBackgroundAdicionar: TPanel;
    lblDisponívelVenda: TLabel;
    lblPreco: TLabel;
    lblNome: TLabel;
    lblDesc: TLabel;
    lblTituloMain: TLabel;
    pButtonConfirmarAdd: TPanel;
    eNomeAdd: TEdit;
    pctab2Ex: TTabSheet;
    pBackgroundExcluir: TPanel;
    pButtonConfirmarDesativar: TPanel;
    pUserSelectionEx: TPanel;
    lblDescUserSelectEx: TLabel;
    lblProdSelectDesativar: TLabel;
    pctab3Up: TTabSheet;
    pctab4Res: TTabSheet;
    pConfirmarRestore: TPanel;
    pButtonConfirmarReativar: TPanel;
    pUserSelectionRestore: TPanel;
    lblDescUserSelectRes: TLabel;
    lblProdSelectReativar: TLabel;
    pctab5Pesq: TTabSheet;
    Panel3: TPanel;
    Label7: TLabel;
    eBuscaMain: TEdit;
    pHideTSbar: TPanel;
    cbDisponivelAdd: TCheckBox;
    pBackgroundUpdate: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ePrecoUpdate: TMaskEdit;
    Panel2: TPanel;
    eNomeUpdate: TEdit;
    cbDisponivelUpdate: TCheckBox;
    mDescUpdate: TEdit;
    mDescAdd: TMemo;
    ePrecoAdd: TEdit;
    procedure iButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure iButton4Click(Sender: TObject);
    procedure iButton3Click(Sender: TObject);
    procedure iButton2Click(Sender: TObject);
    procedure iButton5Click(Sender: TObject);
    procedure iButton6Click(Sender: TObject);
    procedure lblButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGridProdutosCellClick(Column: TColumn);
    procedure pButton1AdicionarClick(Sender: TObject);
    procedure pButton2ExcluirClick(Sender: TObject);
    procedure pButton3AtualizarClick(Sender: TObject);
    procedure pButton4RestaurarClick(Sender: TObject);
    procedure pButton5PesquisarClick(Sender: TObject);
    procedure pButton6CancelarClick(Sender: TObject);
    procedure eBuscaMainChange(Sender: TObject);
    procedure pButtonConfirmarAddClick(Sender: TObject);
    procedure pButtonConfirmarDesativarClick(Sender: TObject);
    procedure pButtonConfirmarUpdateClick(Sender: TObject);
    procedure pButtonConfirmarReativarClick(Sender: TObject);
  private
    FIdUsuario: Integer;
    FNomeUsuario: String;
    FController: TProdutoController;
    FIdProdutoSelecionado: Integer;
    FMemTable: TFDMemTable;
    FDataSource: TDataSource;

    procedure CarregarGrid(ApenasDisponiveis: Boolean);
    procedure OrganizarGrid;
    procedure FiltrarGrid(const TextoBusca: string);
    procedure LimparCamposAdicionar;
    procedure LimparCamposAtualizar;
    procedure CarregarDadosParaAtualizar(IdProduto: Integer);

  public
    property IdUsuario: Integer read FIdUsuario write FIdUsuario;
    property NomeUsuario: String read FNomeUsuario write FNomeUsuario;
  end;

var
  FormHomeD: TFormHomeD;

implementation

{$R *.dfm}

procedure TFormHomeD.pButtonConfirmarAddClick(Sender: TObject);
var
  Produto: TProduto;
begin
  Produto := TProduto.Create;
  try
    Produto.NomeProd := Trim(eNomeAdd.Text);
    Produto.DescProd := Trim(mDescAdd.Text);
    Produto.PrecoProd := TProdutoViewHelper.ParsePreco(ePrecoAdd.Text);
    Produto.DisponivelVenda := cbDisponivelAdd.Checked;
    Produto.IdDono := FIdUsuario; // ID do usuário logado

    if FController.CadastrarProduto(Produto) then
    begin
      LimparCamposAdicionar;
      CarregarGrid(True);
      pcButtons.ActivePageIndex := 0;
    end;
  finally
    Produto.Free;
  end;
end;

procedure TFormHomeD.pButtonConfirmarDesativarClick(Sender: TObject);
var
  IdProduto: Integer;
  NomeProduto: string;
begin
  if FMemTable.IsEmpty then
  begin
    ShowMessage('Selecione um produto para desativar.');
    Exit;
  end;

  IdProduto := FMemTable.FieldByName('id_produto').AsInteger;
  NomeProduto := FMemTable.FieldByName('nome_prod').AsString;

  if FController.DesativarProduto(IdProduto, NomeProduto) then
  begin
    CarregarGrid(True);
    pcButtons.ActivePageIndex := 0;
  end;
end;

procedure TFormHomeD.pButtonConfirmarReativarClick(Sender: TObject);
var
  IdProduto: Integer;
  NomeProduto: string;
begin
  if FMemTable.IsEmpty then
  begin
    ShowMessage('Selecione um produto para reativar.');
    Exit;
  end;

  IdProduto := FMemTable.FieldByName('id_produto').AsInteger;
  NomeProduto := FMemTable.FieldByName('nome_prod').AsString;

  if FController.ReativarProduto(IdProduto, NomeProduto) then
  begin
    CarregarGrid(True);
    pcButtons.ActivePageIndex := 0;
  end;
end;


procedure TFormHomeD.pButtonConfirmarUpdateClick(Sender: TObject);
var
  Produto: TProduto;
begin
  if FIdProdutoSelecionado <= 0 then
  begin
    ShowMessage('Nenhum produto selecionado.');
    Exit;
  end;

  Produto := TProduto.Create;
  try
    Produto.IdProduto := FIdProdutoSelecionado;
    Produto.NomeProd := Trim(eNomeUpdate.Text);
    Produto.DescProd := Trim(mDescUpdate.Text);
    Produto.PrecoProd := TProdutoViewHelper.ParsePreco(ePrecoUpdate.Text);
    Produto.DisponivelVenda := cbDisponivelUpdate.Checked;
    Produto.IdDono := FIdUsuario;

    if FController.AtualizarProduto(Produto) then
    begin
      LimparCamposAtualizar;
      CarregarGrid(True);
      pcButtons.ActivePageIndex := 0;
    end;
  finally
    Produto.Free;
  end;
end;


procedure TFormHomeD.CarregarDadosParaAtualizar(IdProduto: Integer);
var
  Produto: TProduto;
begin
  try
    Produto := FController.ObterProduto(IdProduto);
    if Assigned(Produto) then
    begin
      try
        eNomeUpdate.Text := Produto.NomeProd;
        mDescUpdate.Text := Produto.DescProd;
        ePrecoUpdate.Text := FormatCurr('0.00', Produto.PrecoProd);
        cbDisponivelUpdate.Checked := Produto.DisponivelVenda;
      finally
        Produto.Free;
      end;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao carregar dados para atualização: ' + E.Message);
  end;
end;

procedure TFormHomeD.CarregarGrid(ApenasDisponiveis: Boolean);
var
  Produtos: TObjectList<TProduto>;
begin
  try
    // Buscar produtos do dono logado
    Produtos := FController.ListarProdutos(FIdUsuario, ApenasDisponiveis);
    try
      TProdutoViewHelper.PreencherMemTableProdutos(FMemTable, Produtos);
      OrganizarGrid;
    finally
      Produtos.Free;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao carregar grid: ' + E.Message);
  end;
end;

procedure TFormHomeD.DBGridProdutosCellClick(Column: TColumn);
begin
  if not FMemTable.IsEmpty then
  begin
    lblProdSelectDesativar.Caption := FMemTable.FieldByName('nome_prod').AsString;
    lblProdSelectReativar.Caption := FMemTable.FieldByName('nome_prod').AsString;
  end;
end;

procedure TFormHomeD.eBuscaMainChange(Sender: TObject);
begin
  if FMemTable.Active then
    FiltrarGrid(eBuscaMain.Text);
end;

procedure TFormHomeD.FiltrarGrid(const TextoBusca: string);
var
  Filtro: string;
  TextoBuscaUpper: string;
begin
  try
    if not FMemTable.Active then
      Exit;

    FMemTable.Filtered := False;
    FMemTable.Filter := '';

    if Trim(TextoBusca) <> '' then
    begin
      TextoBuscaUpper := UpperCase(TextoBusca);
      Filtro := Format(
        '(UPPER(nome_prod) LIKE ''%%%s%%'') OR ' +
        '(UPPER(desc_prod) LIKE ''%%%s%%'')',
        [TextoBuscaUpper, TextoBuscaUpper]
      );
      FMemTable.Filter := Filtro;
      FMemTable.Filtered := True;
    end;

    if not FMemTable.IsEmpty then
      FMemTable.First;
  except
    on E: Exception do
      ShowMessage('Erro ao filtrar: ' + E.Message);
  end;
end;

procedure TFormHomeD.FormCreate(Sender: TObject);
begin
// Criar controller
  FController := TProdutoController.Create;
  FIdProdutoSelecionado := 0;

  // Criar MemTable e DataSource
  FMemTable := TFDMemTable.Create(Self);
  FDataSource := TDataSource.Create(Self);
  FDataSource.DataSet := FMemTable;
  DBGridProdutos.DataSource := FDataSource;

  // Configurar páginas iniciais
  if Assigned(pcMain) then
    pcMain.ActivePageIndex := 1; // Tab Produtos

  if Assigned(pcButtons) then
    pcButtons.ActivePageIndex := 0;

  // Configurar busca
  eBuscaMain.Clear;
  eBuscaMain.TextHint := 'Digite aqui para pesquisar produtos...';
  eBuscaMain.Enabled := False;

  // Configurar constraints da janela
  Constraints.MinWidth := 1248;
  Constraints.MinHeight := 683;
  Constraints.MaxWidth := 1920;
  Constraints.MaxHeight := 1080;

  Self.BorderStyle := bsSingle;
  Self.WindowState := wsNormal;
end;


procedure TFormHomeD.FormDestroy(Sender: TObject);
begin
  FController.Free;
  FMemTable.Free;
  FDataSource.Free;
end;

procedure TFormHomeD.FormShow(Sender: TObject);
begin
    try
      // Carregar apenas produtos disponíveis do dono logado
      CarregarGrid(True);

      // Exibir informações do usuário logado
      lblUserNameHeader.Caption := NomeUsuario;
      lblUserIdHeader.Caption := IdUsuario.ToString;

      // Configurar hint de busca
      eBuscaMain.TextHint := 'Digite aqui para pesquisar produtos...';
      eBuscaMain.Clear;
      pcMain.ActivePageIndex := 0;
    except
      on E: Exception do
        ShowMessage('Erro ao carregar dados: ' + E.Message);
    end;
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
  pcMain.ActivePageIndex := 1;
end;

procedure TFormHomeD.iButton3Click(Sender: TObject);
begin
  pcMain.ActivePageIndex := 2;
end;

procedure TFormHomeD.iButton4Click(Sender: TObject);
begin
  pcMain.ActivePageIndex := 3;
end;

procedure TFormHomeD.iButton5Click(Sender: TObject);
begin
  pcMain.ActivePageIndex := 4;
end;

procedure TFormHomeD.iButton6Click(Sender: TObject);
begin
  ShowMessage('Encerrando aplicação...');
  FormHomeD.Close;
end;

procedure TFormHomeD.lblButton1Click(Sender: TObject);
begin
  pcMain.ActivePageIndex := 1;
end;

procedure TFormHomeD.LimparCamposAdicionar;
begin
  eNomeAdd.Clear;
  mDescAdd.Clear;
  ePrecoAdd.Clear;
  cbDisponivelAdd.Checked := True;
end;

procedure TFormHomeD.LimparCamposAtualizar;
begin
  eNomeUpdate.Clear;
  mDescUpdate.Clear;
  ePrecoUpdate.Clear;
  cbDisponivelUpdate.Checked := True;
  FIdProdutoSelecionado := 0;
end;

procedure TFormHomeD.OrganizarGrid;
begin
  if DBGridProdutos.Columns.Count > 0 then
  begin
    DBGridProdutos.Columns[0].Width := 50;   // id_produto
    DBGridProdutos.Columns[1].Width := 200;  // nome_prod
    DBGridProdutos.Columns[2].Width := 300;  // desc_prod
    DBGridProdutos.Columns[3].Width := 100;  // preco_prod
    DBGridProdutos.Columns[4].Width := 80;   // disponivel_venda
    DBGridProdutos.Columns[5].Visible := False; // id_dono (ocultar)

    DBGridProdutos.Columns[0].Title.Caption := 'ID';
    DBGridProdutos.Columns[1].Title.Caption := 'Nome do Produto';
    DBGridProdutos.Columns[2].Title.Caption := 'Descrição';
    DBGridProdutos.Columns[3].Title.Caption := 'Preço';
    DBGridProdutos.Columns[4].Title.Caption := 'Disponível';
  end;
end;

procedure TFormHomeD.pButton1AdicionarClick(Sender: TObject);
begin
  pcButtons.ActivePageIndex := 1;
  LimparCamposAdicionar;
end;

procedure TFormHomeD.pButton2ExcluirClick(Sender: TObject);
begin
  pcButtons.ActivePageIndex := 2;
  CarregarGrid(True); // Mostrar apenas disponíveis

  if not FMemTable.IsEmpty then
    lblProdSelectDesativar.Caption := FMemTable.FieldByName('nome_prod').AsString;
end;

procedure TFormHomeD.pButton3AtualizarClick(Sender: TObject);
begin
  if FMemTable.IsEmpty then
  begin
    ShowMessage('Selecione um produto para editar.');
    Exit;
  end;

  FIdProdutoSelecionado := FMemTable.FieldByName('id_produto').AsInteger;
  pcButtons.ActivePageIndex := 3;
  CarregarDadosParaAtualizar(FIdProdutoSelecionado);
end;

procedure TFormHomeD.pButton4RestaurarClick(Sender: TObject);
begin
  pcButtons.ActivePageIndex := 4;
  CarregarGrid(False); // Mostrar todos, incluindo desativados

  if not FMemTable.IsEmpty then
    lblProdSelectReativar.Caption := FMemTable.FieldByName('nome_prod').AsString;
end;

procedure TFormHomeD.pButton5PesquisarClick(Sender: TObject);
begin
  pcButtons.ActivePageIndex := 5;

  if not FMemTable.Active then
    CarregarGrid(True);

  eBuscaMain.Enabled := True;
  eBuscaMain.SetFocus;
end;

procedure TFormHomeD.pButton6CancelarClick(Sender: TObject);
begin
  eBuscaMain.Clear;
  eBuscaMain.Enabled := False;
  LimparCamposAdicionar;
  LimparCamposAtualizar;
  CarregarGrid(True);
  pcButtons.ActivePageIndex := 0;
end;

end.
