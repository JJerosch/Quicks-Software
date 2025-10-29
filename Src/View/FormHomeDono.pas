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
    pButtonConfirmarUp: TPanel;
    eNomeUp: TEdit;
    cbDisponivelUp: TCheckBox;
    mDescAdd: TMemo;
    ePrecoAdd: TEdit;
    lblNomeComercio: TLabel;
    mDescUp: TMemo;
    ePrecoUp: TEdit;
    pcPerfil: TPageControl;
    tsVisualizar: TTabSheet;
    pMainPerfilVisualizar: TPanel;
    pInfoRestauranteNCD: TPanel;
    lblDadosComercio: TLabel;
    lblNComm: TLabel;
    lblCAComm: TLabel;
    lblDComm: TLabel;
    lblNCommD: TLabel;
    lblCACommD: TLabel;
    mDCommD: TMemo;
    pButtonEditar: TPanel;
    pInfoRestauranteH: TPanel;
    lblHorariosTaxaEntregaComm: TLabel;
    lblHFComm: TLabel;
    lblTPComm: TLabel;
    lblTEComm: TLabel;
    lblHFCommD: TLabel;
    lblTPCommD: TLabel;
    lblTECommD: TLabel;
    pButtonSalvarDados: TPanel;
    pInfoRestauranteC: TPanel;
    lblContatoComm: TLabel;
    lblEComm: TLabel;
    lblTComm: TLabel;
    lblECommD: TLabel;
    lblTCommD: TLabel;
    pInfoRestauranteL: TPanel;
    lblLComm: TLabel;
    lblENComm: TLabel;
    lblCEPComm: TLabel;
    lblENCommD: TLabel;
    lblCEPCommD: TLabel;
    pButtonAlterarSenha: TPanel;
    pButtonSalvarSenha: TPanel;
    pInfoRestauranteP: TPanel;
    lblProprietario: TLabel;
    lblNPComm: TLabel;
    lblEPComm: TLabel;
    lblCPFPComm: TLabel;
    lblNPCommD: TLabel;
    lblEPCommD: TLabel;
    lblCPFPCommD: TLabel;
    pButtonCancelar: TPanel;
    tsEditar: TTabSheet;
    tsAlterarSenha: TTabSheet;
    pMainPerfilEditar: TPanel;
    pInfoRestauranteNCDE: TPanel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    mDCommDE: TMemo;
    pButtonEditarE: TPanel;
    pInfoRestauranteHE: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    pButtonSalvarDadosE: TPanel;
    pInfoRestauranteCE: TPanel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    pInfoRestauranteLE: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    pButtonAlterarSenhaE: TPanel;
    pButtonSalvarSenhaE: TPanel;
    pInfoRestaurantePE: TPanel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    pButtonCancelarE: TPanel;
    eNCommDE: TEdit;
    eHFCommDE: TEdit;
    eTPCommDE: TEdit;
    eTECommDE: TEdit;
    eRuaCommDE: TEdit;
    eECommDE: TEdit;
    eNPCommDE: TEdit;
    eEPCommDE: TEdit;
    cbCcommDE: TComboBox;
    meTCommDE: TMaskEdit;
    Label11: TLabel;
    Label12: TLabel;
    eEstadoCOmmDE: TEdit;
    eNumeroEnderecoCommDE: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    eCidadeCommDE: TEdit;
    eBairroCommDE: TEdit;
    Label19: TLabel;
    eComplementoCommDE: TEdit;
    meCEPCommDE: TMaskEdit;
    meCPFPCommDE: TMaskEdit;
    Panel1: TPanel;
    lblAlterarSenha: TLabel;
    Label24: TLabel;
    Label29: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    Label34: TLabel;
    Label35: TLabel;
    Edit2: TEdit;
    Label23: TLabel;
    Edit3: TEdit;
    pButtonConfirmarAlterarSenha: TPanel;
    Panel4: TPanel;

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
    procedure ePrecoUpExit(Sender: TObject);
    procedure ePrecoAddExit(Sender: TObject);

  private
    FIdUsuario: Integer;
    FNomeUsuario: String;
    FIdComercio: Integer;        // ⭐ ADICIONAR
    FNomeComercio: String;       // ⭐ ADICIONAR
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
    property IdComercio: Integer read FIdComercio write FIdComercio;         // ⭐ ADICIONAR
    property NomeComercio: String read FNomeComercio write FNomeComercio;   // ⭐ ADICIONAR
  end;

var
  FormHomeD: TFormHomeD;

implementation

{$R *.dfm}

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
    pcMain.ActivePageIndex := 3; // Tab Produtos

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
var
  Qr: TFDQuery;
begin
  try
    // Buscar informações do comércio do dono logado
    Qr := TFDQuery.Create(nil);
    try
      Qr.Connection := DM.FDConn;
      Qr.SQL.Text := 'SELECT id_comercio, nome_comercio FROM comercios WHERE id_user = :id_user';
      Qr.ParamByName('id_user').AsInteger := FIdUsuario;
      Qr.Open;

      if not Qr.IsEmpty then
      begin
        FIdComercio := Qr.FieldByName('id_comercio').AsInteger;
        FNomeComercio := Qr.FieldByName('nome_comercio').AsString;

        // Atualizar header com informações
        lblUserNameHeader.Caption := FNomeUsuario;
        lblUserIdHeader.Caption := 'ID: ' + IntToStr(FIdUsuario);

        // Se você tiver um label para o nome do comércio:
        if Assigned(lblNomeComercio) then
          lblNomeComercio.Caption := FNomeComercio;
      end
      else
      begin
        ShowMessage('Comércio não encontrado para este usuário. Entre em contato com o administrador.');
        FIdComercio := 0;
      end;
    finally
      Qr.Free;
    end;

    // Carregar produtos se encontrou o comércio
    if FIdComercio > 0 then
      CarregarGrid(True);

  except
    on E: Exception do
      ShowMessage('Erro ao carregar informações: ' + E.Message);
  end;
end;

procedure TFormHomeD.CarregarGrid(ApenasDisponiveis: Boolean);
var
  Produtos: TObjectList<TProduto>;
begin
  try
    // ⚠️ IMPORTANTE: Usar FIdComercio ao invés de FIdUsuario
    if FIdComercio <= 0 then
    begin
      ShowMessage('ID do comércio não definido.');
      Exit;
    end;

    // Buscar produtos do comércio
    Produtos := FController.ListarProdutos(FIdComercio, ApenasDisponiveis);
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

procedure TFormHomeD.OrganizarGrid;
begin
  if DBGridProdutos.Columns.Count > 0 then
  begin
    DBGridProdutos.Columns[0].Width := 50;   // id_produto
    DBGridProdutos.Columns[1].Width := 200;  // nome_prod
    DBGridProdutos.Columns[2].Width := 300;  // desc_prod
    DBGridProdutos.Columns[3].Width := 100;  // preco_prod
    DBGridProdutos.Columns[4].Width := 80;   // disponivel_venda

    // Ocultar id_comercio
    if DBGridProdutos.Columns.Count > 5 then
      DBGridProdutos.Columns[5].Visible := False;

    DBGridProdutos.Columns[0].Title.Caption := 'ID';
    DBGridProdutos.Columns[1].Title.Caption := 'Nome do Produto';
    DBGridProdutos.Columns[2].Title.Caption := 'Descrição';
    DBGridProdutos.Columns[3].Title.Caption := 'Preço';
    DBGridProdutos.Columns[4].Title.Caption := 'Disponível';
  end;
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

procedure TFormHomeD.LimparCamposAdicionar;
begin
  eNomeAdd.Clear;
  mDescAdd.Clear;
  ePrecoAdd.Clear;
  cbDisponivelAdd.Checked := True;
end;

procedure TFormHomeD.LimparCamposAtualizar;
begin
  eNomeUp.Clear;
  mDescUp.Clear;
  ePrecoUp.Clear;
  cbDisponivelUp.Checked := True;
  FIdProdutoSelecionado := 0;
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
        eNomeUp.Text := Produto.NomeProd;
        mDescUp.Text := Produto.DescProd;
        ePrecoUp.Text := TProdutoViewHelper.FormatPreco(Produto.PrecoProd);
        cbDisponivelUp.Checked := Produto.DisponivelVenda;
      finally
        Produto.Free;
      end;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao carregar dados para atualização: ' + E.Message);
  end;
end;

// ============ EVENTOS DOS BOTÕES ============

procedure TFormHomeD.pButton1AdicionarClick(Sender: TObject);
begin
  pcButtons.ActivePageIndex := 1;
  LimparCamposAdicionar;
end;

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
    Produto.IdComercio := FIdComercio; // ⭐ USAR ID DO COMÉRCIO

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

procedure TFormHomeD.pButton2ExcluirClick(Sender: TObject);
begin
  pcButtons.ActivePageIndex := 2;
  CarregarGrid(True);

  if not FMemTable.IsEmpty then
    lblProdSelectDesativar.Caption := FMemTable.FieldByName('nome_prod').AsString;
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
    Produto.NomeProd := Trim(eNomeUp.Text);
    Produto.DescProd := Trim(mDescUp.Text);
    Produto.PrecoProd := TProdutoViewHelper.ParsePreco(ePrecoUp.Text);
    Produto.DisponivelVenda := cbDisponivelUp.Checked;
    Produto.IdComercio := FIdComercio; // ⭐ USAR ID DO COMÉRCIO

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

procedure TFormHomeD.pButton4RestaurarClick(Sender: TObject);
begin
  pcButtons.ActivePageIndex := 4;
  CarregarGrid(False);

  if not FMemTable.IsEmpty then
    lblProdSelectReativar.Caption := FMemTable.FieldByName('nome_prod').AsString;
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

procedure TFormHomeD.eBuscaMainChange(Sender: TObject);
begin
  if FMemTable.Active then
    FiltrarGrid(eBuscaMain.Text);
end;

procedure TFormHomeD.ePrecoAddExit(Sender: TObject);
var
  Valor: Currency;
begin
  Valor := TProdutoViewHelper.ParsePreco(ePrecoAdd.Text);
  if Valor > 0 then
    ePrecoAdd.Text := TProdutoViewHelper.FormatPreco(Valor);
end;

procedure TFormHomeD.ePrecoUpExit(Sender: TObject);
var
  Valor: Currency;
begin
  Valor := TProdutoViewHelper.ParsePreco(ePrecoUp.Text);
  if Valor > 0 then
    ePrecoUp.Text := TProdutoViewHelper.FormatPreco(Valor);
end;

procedure TFormHomeD.DBGridProdutosCellClick(Column: TColumn);
begin
  if not FMemTable.IsEmpty then
  begin
    lblProdSelectDesativar.Caption := FMemTable.FieldByName('nome_prod').AsString;
    lblProdSelectReativar.Caption := FMemTable.FieldByName('nome_prod').AsString;
  end;
end;

// ============ NAVEGAÇÃO MENU LATERAL ============

procedure TFormHomeD.iButton1Click(Sender: TObject);
begin
  if pBarraMenuLeft.Width = 89 then
    pBarraMenuLeft.Width := 200
  else
    pBarraMenuLeft.Width := 89;
end;

procedure TFormHomeD.iButton2Click(Sender: TObject);
begin
  pcMain.ActivePageIndex := 1; // Relatórios
end;

procedure TFormHomeD.iButton3Click(Sender: TObject);
begin
  pcMain.ActivePageIndex := 2; // Pedidos
end;

procedure TFormHomeD.iButton4Click(Sender: TObject);
begin
  pcMain.ActivePageIndex := 3; // Produtos
end;

procedure TFormHomeD.iButton5Click(Sender: TObject);
begin
  pcMain.ActivePageIndex := 4; // Perfil
end;

procedure TFormHomeD.iButton6Click(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja sair?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Close;
  end;
end;

procedure TFormHomeD.lblButton1Click(Sender: TObject);
begin
  pcMain.ActivePageIndex := 1;
end;

end.
