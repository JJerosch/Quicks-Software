unit FormHomeDono;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Imaging.pngimage, Data.DB, Vcl.Mask, Vcl.Grids, Vcl.DBGrids,
  uConn, FireDAC.Comp.Client, System.Generics.Collections,
  ProdutoModel, ProdutoController, ProdutoViewHelper,
  ComercioModel, ComercioController, ComercioViewHelper, Vcl.WinXPickers;

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
    pInfoRestauranteP: TPanel;
    lblProprietario: TLabel;
    lblNPComm: TLabel;
    lblEPComm: TLabel;
    lblCPFPComm: TLabel;
    lblNPCommD: TLabel;
    lblEPCommD: TLabel;
    lblCPFPCommD: TLabel;
    tsEditar: TTabSheet;
    tsAlterarSenha: TTabSheet;
    pMainPerfilEditar: TPanel;
    pInfoRestauranteNCDE: TPanel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    mDCommDE: TMemo;
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
    pInfoRestaurantePE: TPanel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    pButtonCancelarE: TPanel;
    eNCommDE: TEdit;
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
    eSenhaAtual: TEdit;
    Panel2: TPanel;
    Label34: TLabel;
    Label35: TLabel;
    eSenhaNova: TEdit;
    Label23: TLabel;
    eSenhaConfirmacao: TEdit;
    pButtonConfirmarAlterarSenha: TPanel;
    Panel4: TPanel;
    Image1: TImage;
    Label28: TLabel;
    tpHACommDE: TTimePicker;
    tpHFCommDE: TTimePicker;

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
    procedure pButtonEditarClick(Sender: TObject);
    procedure pButtonAlterarSenhaEClick(Sender: TObject);
    procedure pButtonSalvarDadosEClick(Sender: TObject);
    procedure pButtonCancelarEClick(Sender: TObject);
    procedure pButtonConfirmarAlterarSenhaClick(Sender: TObject);
    procedure eTECommDEExit(Sender: TObject);

  private
    FIdUsuario: Integer;
    FNomeUsuario: String;
    FIdComercio: Integer;
    FNomeComercio: String;
    FProdutoController: TProdutoController;
    FComercioController: TComercioController;
    FIdProdutoSelecionado: Integer;
    FMemTable: TFDMemTable;
    FDataSource: TDataSource;

    procedure CarregarGrid(ApenasDisponiveis: Boolean);
    procedure OrganizarGrid;
    procedure FiltrarGrid(const TextoBusca: string);
    procedure LimparCamposAdicionar;
    procedure LimparCamposAtualizar;
    procedure CarregarDadosParaAtualizar(IdProduto: Integer);

    // Perfil
    procedure CarregarDadosPerfil;
    procedure ExibirDadosPerfilVisualizacao(Comercio: TComercio);
    procedure CarregarDadosPerfilEdicao(Comercio: TComercio);
    procedure LimparCamposAlterarSenha;

  public
    property IdUsuario: Integer read FIdUsuario write FIdUsuario;
    property NomeUsuario: String read FNomeUsuario write FNomeUsuario;
    property IdComercio: Integer read FIdComercio write FIdComercio;
    property NomeComercio: String read FNomeComercio write FNomeComercio;
  end;

var
  FormHomeD: TFormHomeD;

implementation

{$R *.dfm}

procedure TFormHomeD.FormCreate(Sender: TObject);
begin
  meTCommDE.EditMask := '!\(99\)00000-0000;1;_';
  meCEPCommDE.EditMask := '00000-000;1;_';
  meCPFPCommDE.EditMask := '000\.000\.000\-00;1;_';
  // Criar controllers
  FProdutoController := TProdutoController.Create;
  FComercioController := TComercioController.Create;
  FIdProdutoSelecionado := 0;

  // Criar MemTable e DataSource
  FMemTable := TFDMemTable.Create(Self);
  FDataSource := TDataSource.Create(Self);
  FDataSource.DataSet := FMemTable;
  DBGridProdutos.DataSource := FDataSource;

  // Configurar páginas iniciais
  if Assigned(pcMain) then
    pcMain.ActivePageIndex := 3;

  if Assigned(pcButtons) then
    pcButtons.ActivePageIndex := 0;

  if Assigned(pcPerfil) then
    pcPerfil.ActivePageIndex := 0;

  // Configurar busca
  eBuscaMain.Clear;
  eBuscaMain.TextHint := 'Digite aqui para pesquisar produtos...';
  eBuscaMain.Enabled := False;

  // Popular ComboBox de categorias
  TComercioViewHelper.PopularCategoriasComercio(cbCcommDE);

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
  FProdutoController.Free;
  FComercioController.Free;
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

// ============ PRODUTOS (MANTIDO IGUAL) ============

procedure TFormHomeD.CarregarGrid(ApenasDisponiveis: Boolean);
var
  Produtos: TObjectList<TProduto>;
begin
  try
    if FIdComercio <= 0 then
    begin
      ShowMessage('ID do comércio não definido.');
      Exit;
    end;

    Produtos := FProdutoController.ListarProdutos(FIdComercio, ApenasDisponiveis);
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
    DBGridProdutos.Columns[0].Width := 50;
    DBGridProdutos.Columns[1].Width := 200;
    DBGridProdutos.Columns[2].Width := 300;
    DBGridProdutos.Columns[3].Width := 100;
    DBGridProdutos.Columns[4].Width := 80;

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
    Produto := FProdutoController.ObterProduto(IdProduto);
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
    Produto.IdComercio := FIdComercio;

    if FProdutoController.CadastrarProduto(Produto) then
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

  if FProdutoController.DesativarProduto(IdProduto, NomeProduto) then
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
    Produto.IdComercio := FIdComercio;

    if FProdutoController.AtualizarProduto(Produto) then
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

  if FProdutoController.ReativarProduto(IdProduto, NomeProduto) then
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

// ============ PERFIL ============

procedure TFormHomeD.CarregarDadosPerfil;
var
  Comercio: TComercio;
begin
  try
    Comercio := FComercioController.ObterComercioPorUsuario(FIdUsuario);
    if Assigned(Comercio) then
    begin
      try
        ExibirDadosPerfilVisualizacao(Comercio);
      finally
        Comercio.Free;
      end;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao carregar dados do perfil: ' + E.Message);
  end;
end;

procedure TFormHomeD.ExibirDadosPerfilVisualizacao(Comercio: TComercio);
begin
  // Dados do Comércio
  lblNCommD.Caption := Comercio.NomeComercio;
  lblCACommD.Caption := Comercio.Categoria;
  mDCommD.Text := Comercio.Descricao;

  // Horários e Taxa - USAR TimeToStr ao invés de DateToStr
  lblHFCommD.Caption := FormatDateTime('hh:nn', Comercio.HorarioAbertura) + ' - ' +
                        FormatDateTime('hh:nn', Comercio.HorarioFechamento);
  lblTPCommD.Caption := IntToStr(Comercio.TempoPreparoMedio) + ' minutos';
  lblTECommD.Caption := TComercioViewHelper.FormatarMoeda(Comercio.TaxaEntregaBase);

  // Contato
  lblECommD.Caption := Comercio.EmailComercio;
  lblTCommD.Caption := TComercioViewHelper.FormatarTelefone(Comercio.NPhoneComercio);

  // Localização
  if Trim(Comercio.EnderecoCompleto) <> '' then
    lblENCommD.Caption := Comercio.EnderecoCompleto
  else
    lblENCommD.Caption := Comercio.Bairro + ', ' + Comercio.Cidade + '/' + Comercio.Estado;

  if Trim(Comercio.Numero) <> '' then
    lblENCommD.Caption := lblENCommD.Caption + ', Nº ' + Comercio.Numero;
  if Trim(Comercio.Complemento) <> '' then
    lblENCommD.Caption := lblENCommD.Caption + ' (' + Comercio.Complemento + ')';
  lblCEPCommD.Caption := TComercioViewHelper.FormatarCEP(Comercio.CEP);

  // Proprietário
  lblNPCommD.Caption := Comercio.NomeProprietario;
  lblEPCommD.Caption := Comercio.EmailProprietario;
  lblCPFPCommD.Caption := TComercioViewHelper.FormatarCPF(Comercio.CPFProprietario);
end;

procedure TFormHomeD.CarregarDadosPerfilEdicao(Comercio: TComercio);
begin
  // Dados do Comércio
  eNCommDE.Text := Comercio.NomeComercio;
  cbCcommDE.Text := Comercio.Categoria;
  mDCommDE.Text := Comercio.Descricao;

  // Horários - USAR FormatDateTime com hh:nn
  tpHACommDE.Time := Comercio.HorarioAbertura;
  tpHFCommDE.Time := Comercio.HorarioFechamento;
  eTPCommDE.Text := IntToStr(Comercio.TempoPreparoMedio);
  eTECommDE.Text := TComercioViewHelper.FormatarMoeda(Comercio.TaxaEntregaBase);

  // Contato
  eECommDE.Text := Comercio.EmailComercio;
  meTCommDE.Text := TComercioViewHelper.FormatarTelefone(Comercio.NPhoneComercio);

  // Localização
  meCEPCommDE.Text := TComercioViewHelper.FormatarCEP(Comercio.CEP);
  eEstadoCOmmDE.Text := Comercio.Estado;
  eCidadeCommDE.Text := Comercio.Cidade;
  eRuaCommDE.Text := Comercio.EnderecoCompleto;
  eNumeroEnderecoCommDE.Text := Comercio.Numero;
  eBairroCommDE.Text := Comercio.Bairro;
  eComplementoCommDE.Text := Comercio.Complemento;

  // Proprietário
  eNPCommDE.Text := Comercio.NomeProprietario;
  eEPCommDE.Text := Comercio.EmailProprietario;
  meCPFPCommDE.Text := TComercioViewHelper.FormatarCPF(Comercio.CPFProprietario);

  eNPCommDE.ReadOnly := True;
  eEPCommDE.ReadOnly := True;
  meCPFPCommDE.ReadOnly := True;
end;

procedure TFormHomeD.pButtonEditarClick(Sender: TObject);
var
  Comercio: TComercio;
begin
  try
    // Buscar dados do comércio
    Comercio := FComercioController.ObterComercioPorUsuario(FIdUsuario);
    if Assigned(Comercio) then
    begin
      try
        // Carregar dados nos campos de edição
        CarregarDadosPerfilEdicao(Comercio);

        // Mudar para a aba de edição
        pcPerfil.ActivePageIndex := 1;
      finally
        Comercio.Free;
      end;
    end
    else
    begin
      ShowMessage('Não foi possível carregar os dados do comércio.');
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao carregar dados para edição: ' + E.Message);
  end;
end;

procedure TFormHomeD.pButtonSalvarDadosEClick(Sender: TObject);
var
  Comercio: TComercio;
begin
  try
    // Validações básicas
    if Trim(eNCommDE.Text) = '' then
    begin
      ShowMessage('Informe o nome do comércio.');
      eNCommDE.SetFocus;
      Exit;
    end;

    if Trim(cbCcommDE.Text) = '' then
    begin
      ShowMessage('Selecione a categoria do comércio.');
      cbCcommDE.SetFocus;
      Exit;
    end;

    // Validar se os horários foram preenchidos (TTime = 0 significa não preenchido)
    if tpHACommDE.Time = 0 then
    begin
      ShowMessage('Informe o horário de abertura.');
      tpHACommDE.SetFocus;
      Exit;
    end;

    if tpHFCommDE.Time = 0 then
    begin
      ShowMessage('Informe o horário de fechamento.');
      tpHFCommDE.SetFocus;
      Exit;
    end;

    // Validar se o horário de fechamento é depois da abertura
    if tpHFCommDE.Time <= tpHACommDE.Time then
    begin
      ShowMessage('O horário de fechamento deve ser posterior ao horário de abertura.');
      tpHFCommDE.SetFocus;
      Exit;
    end;

    if Trim(eECommDE.Text) = '' then
    begin
      ShowMessage('Informe o email do comércio.');
      eECommDE.SetFocus;
      Exit;
    end;

    if Trim(meCEPCommDE.Text) = '     -   ' then
    begin
      ShowMessage('Informe o CEP.');
      meCEPCommDE.SetFocus;
      Exit;
    end;

    // Criar objeto Comercio e preencher com os dados do formulário
    Comercio := TComercio.Create;
    try
      // IDs
      Comercio.IdComercio := FIdComercio;
      Comercio.IdUser := FIdUsuario;

      // Dados do Comércio
      Comercio.NomeComercio := Trim(eNCommDE.Text);
      Comercio.Categoria := Trim(cbCcommDE.Text);
      Comercio.Descricao := Trim(mDCommDE.Text);

      // Horários - usar diretamente a propriedade Time dos TimePickers
      Comercio.HorarioAbertura := tpHACommDE.Time;
      Comercio.HorarioFechamento := tpHFCommDE.Time;
      Comercio.TempoPreparoMedio := StrToIntDef(Trim(eTPCommDE.Text), 30);
      Comercio.TaxaEntregaBase := TComercioViewHelper.ParseMoeda(eTECommDE.Text);

      // Contato
      Comercio.EmailComercio := Trim(eECommDE.Text);
      Comercio.NPhoneComercio := TComercioViewHelper.RemoverMascaraTelefone(meTCommDE.Text);
      Comercio.CpfCnpjComercio := ''; // Não temos esse campo no formulário

      // Localização
      Comercio.CEP := TComercioViewHelper.RemoverMascaraCEP(meCEPCommDE.Text);
      Comercio.Estado := Trim(eEstadoCOmmDE.Text);
      Comercio.Cidade := Trim(eCidadeCommDE.Text);
      Comercio.EnderecoCompleto := Trim(eRuaCommDE.Text);
      Comercio.Numero := Trim(eNumeroEnderecoCommDE.Text);
      Comercio.Bairro := Trim(eBairroCommDE.Text);
      Comercio.Complemento := Trim(eComplementoCommDE.Text);

      // Atualizar no banco
      if FComercioController.AtualizarComercio(Comercio) then
      begin
        ShowMessage('Dados atualizados com sucesso!');

        // Recarregar dados na visualização
        CarregarDadosPerfil;

        // Voltar para a aba de visualização
        pcPerfil.ActivePageIndex := 0;

        // Atualizar nome no header se foi alterado
        FNomeComercio := Comercio.NomeComercio;
        if Assigned(lblNomeComercio) then
          lblNomeComercio.Caption := FNomeComercio;
      end;
    finally
      Comercio.Free;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao salvar dados: ' + E.Message);
  end;
end;

procedure TFormHomeD.pButtonCancelarEClick(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar as alterações?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    pcPerfil.ActivePageIndex := 0; // Voltar para visualização
  end;
end;

procedure TFormHomeD.pButtonAlterarSenhaEClick(Sender: TObject);
begin
  LimparCamposAlterarSenha;
  pcPerfil.ActivePageIndex := 2; // Tab Alterar Senha
end;

procedure TFormHomeD.pButtonConfirmarAlterarSenhaClick(Sender: TObject);
var
  Request: TAlterarSenhaRequest;
begin
  try
    // Validações
    if Trim(eSenhaAtual.Text) = '' then
    begin
      ShowMessage('Informe a senha atual.');
      eSenhaAtual.SetFocus;
      Exit;
    end;

    if Trim(eSenhaNova.Text) = '' then
    begin
      ShowMessage('Informe a nova senha.');
      eSenhaNova.SetFocus;
      Exit;
    end;

    if Length(Trim(eSenhaNova.Text)) < 6 then
    begin
      ShowMessage('A nova senha deve ter no mínimo 6 caracteres.');
      eSenhaNova.SetFocus;
      Exit;
    end;

    if Trim(eSenhaConfirmacao.Text) = '' then
    begin
      ShowMessage('Confirme a nova senha.');
      eSenhaConfirmacao.SetFocus;
      Exit;
    end;

    if eSenhaNova.Text <> eSenhaConfirmacao.Text then
    begin
      ShowMessage('A nova senha e a confirmação não coincidem.');
      eSenhaConfirmacao.SetFocus;
      Exit;
    end;

    Request := TAlterarSenhaRequest.Create;
    try
      Request.IdUsuario := FIdUsuario;
      Request.SenhaAtual := Trim(eSenhaAtual.Text);
      Request.SenhaNova := Trim(eSenhaNova.Text);
      Request.SenhaConfirmacao := Trim(eSenhaConfirmacao.Text);

      if FComercioController.AlterarSenha(Request) then
      begin
        ShowMessage('Senha alterada com sucesso!');
        LimparCamposAlterarSenha;
        pcPerfil.ActivePageIndex := 0; // Voltar para visualização
      end;
    finally
      Request.Free;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao alterar senha: ' + E.Message);
  end;
end;

procedure TFormHomeD.LimparCamposAlterarSenha;
begin
  eSenhaAtual.Clear;
  eSenhaNova.Clear;
  eSenhaConfirmacao.Clear;
end;

procedure TFormHomeD.eTECommDEExit(Sender: TObject);
var
  Valor: Currency;
begin
  // Parse do valor digitado
  Valor := TComercioViewHelper.ParseMoeda(eTECommDE.Text);

  // Formata sempre, mesmo que seja 0
  eTECommDE.Text := TComercioViewHelper.FormatarMoeda(Valor);
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
  pcPerfil.ActivePageIndex := 0; // Tab Visualizar
  CarregarDadosPerfil; // Carregar dados ao abrir perfil
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
