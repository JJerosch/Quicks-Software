unit FormHomeClientes;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.StrUtils, System.Variants, System.Classes, System.Types,
  System.Generics.Collections, System.DateUtils, RestauranteHelper,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ComCtrls, Vcl.Mask,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Stan.Param, FireDAC.Stan.Intf,
  uConn, ComercioModel, ClienteController, CategoriaHelper, ClientePerfilController, ClienteModel,
  ViaCepHelper, EnderecoCardHelper, EnderecoClienteModel, EnderecoClienteController, EnderecoCardPanel,
  ProdutoModel, ProdutoViewHelper,
  FormaPagamentoClienteModel, FormaPagamentoClienteController, PagamentoCardPanel;

type
  TRestauranteClickEvent = procedure(IdComercio: Integer; const NomeComercio: string) of object;
  TCardComercioPanel = class(TPanel)
  private
    FIdComercio: Integer;
    FNomeComercio: String;
    FCategoria: String;
    FTaxa: String;
    FHorario: String;
    FEstaAberto: Boolean;
    FDescricao: String;
    FOnRestauranteClick: TRestauranteClickEvent;
    procedure PanelClick(Sender: TObject);
    procedure PanelMouseEnter(Sender: TObject);
    procedure PanelMouseLeave(Sender: TObject);
  public
    constructor CreateCard(AOwner: TComponent; IdComercio: Integer; CardWidth: Integer;
      const Nome, Categoria, Taxa, Horario, Descricao: String; EstaAberto: Boolean);
    property OnRestauranteClick: TRestauranteClickEvent read FOnRestauranteClick write FOnRestauranteClick;
  end;

  TFormHomeC = class(TForm)
    pBarraMenuLeft: TPanel;
    iButton1: TImage;
    iButton2: TImage;
    iButton3: TImage;
    iButton4: TImage;
    iButtonLeave: TImage;
    lblButton1: TLabel;
    lblButton2: TLabel;
    lblButton3: TLabel;
    lblButton4: TLabel;
    iCarrinho: TImage;
    lblButton5: TLabel;
    lblQuantidadeCarrinho: TLabel;
    lblSair: TLabel;
    pcMain: TPageControl;
    tsMain: TTabSheet;
    pHomeBackground: TPanel;
    scbxMain: TScrollBox;
    pCategorias: TPanel;
    pEndereco: TPanel;
    lblEnderecoTitle: TLabel;
    pButtonAddEndereco: TPanel;
    cbEnderecos: TComboBox;
    tsLojas: TTabSheet;
    tsPerfil: TTabSheet;
    tsPedidos: TTabSheet;
    tsCarrinho: TTabSheet;
    pBusca: TPanel;
    eBuscaMain: TEdit;
    tsCommSelec: TTabSheet;
    scbxMainCommSelec: TScrollBox;
    pCarrinhoComm: TPanel;
    lblItensCart: TLabel;
    lblTotalCart: TLabel;
    pButtonCartComm: TPanel;
    pCategoriasProdutosComm: TPanel;
    pInfoComm: TPanel;
    lblNomeComm: TLabel;
    iButtonBackComm: TImage;
    lblNota: TLabel;
    lblTaxaEntrega: TLabel;
    lblHorarioFunc: TLabel;
    lblCategoria: TLabel;
    pButtonAvalienos: TPanel;
    pProdutosComm: TPanel;
    scbxMainLojas: TScrollBox;
    pCategoriasL: TPanel;
    scbxCategoriasL: TScrollBox;
    lblCategoriasL: TLabel;
    scbxComerciosL: TScrollBox;
    lblComerciosL: TLabel;
    scbxMainCarrinho: TScrollBox;
    pEnderecoCarrinho: TPanel;
    lblEnderecoDesc: TLabel;
    lblEnderecoAtualCarrinho: TLabel;
    pButtonAlterarEndereco: TPanel;
    pNumerosCarrinho: TPanel;
    lblItensCartCarrinho: TLabel;
    iButtonBackCarrinho: TImage;
    pItensCarrinho: TPanel;
    pResumoPedido: TPanel;
    scbxCarrinhoItems: TScrollBox;
    lblResumo: TLabel;
    lblSubtotal: TLabel;
    lblSubtotalDesc: TLabel;
    lblTaxa: TLabel;
    lblTaxadesc: TLabel;
    lblTotalDesc: TLabel;
    lblTotal: TLabel;
    lblFormaPDesc: TLabel;
    lblFormaPagamento: TLabel;
    pButtonFinalizarPedido: TPanel;
    scbxMainPedidos: TScrollBox;
    pHeaderPedidos: TPanel;
    lblMeusPedidos: TLabel;
    iButtonBackPedidos: TImage;
    pFiltrosPedidos: TPanel;
    lblFiltrosPedidos: TLabel;
    pBTodosFiltrosPedidos: TPanel;
    pBCanceladosFiltrosPedidos: TPanel;
    pBPendentesPedidos: TPanel;
    pBConcluidosPedidos: TPanel;
    pMainPedidos: TPanel;
    scbxPedidos: TScrollBox;
    pHeaderMenuPrincipal: TPanel;
    lblMenuPrincipal: TLabel;
    pHeaderLojas: TPanel;
    lblRestaurantesLojas: TLabel;
    iButtonBackLojas: TImage;
    pcPerfil: TPageControl;
    tsVisualizarPefil: TTabSheet;
    tsPerfilE: TTabSheet;
    tsAtualizarSenhaPerfil: TTabSheet;
    scbxMainPerfil: TScrollBox;
    pEnderecos: TPanel;
    scbxEnderecos: TScrollBox;
    pHeaderPerfil: TPanel;
    lblHeaderPerfil: TLabel;
    iButtonBackPerfil: TImage;
    pInfoVisualizar: TPanel;
    scbxInfoVisualizar: TScrollBox;
    pPagamentos: TPanel;
    scbxPagamentos: TScrollBox;
    pButtonAlterarSenhaV: TPanel;
    lblDados: TLabel;
    lblNomeV: TLabel;
    lblNomeDV: TLabel;
    lblCPFV: TLabel;
    lblTelefoneV: TLabel;
    lblCPFDV: TLabel;
    lblTelefoneDV: TLabel;
    lblEmailV: TLabel;
    lblEmailDV: TLabel;
    pButtonEditarDados: TPanel;
    scbxMainPerfilE: TScrollBox;
    pHeaderPerfilE: TPanel;
    lblPerfilTitlePerfilE: TLabel;
    iButtonBackEditarPerfil: TImage;
    pButtonAlterarSenhaPerfilE: TPanel;
    pInfoE: TPanel;
    ScrollBox3: TScrollBox;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    pSalvar: TPanel;
    eNomeDE: TEdit;
    eEmailDE: TEdit;
    meCPFDE: TMaskEdit;
    meTelefoneDE: TMaskEdit;
    pAlterarSenha: TPanel;
    lblAlterarSenha: TLabel;
    lblSenhaAtual: TLabel;
    lblNovaSenha: TLabel;
    lblDigiteNovamente: TLabel;
    eSenhaAtual: TEdit;
    eSenhaNova: TEdit;
    eSenhaConfirmacao: TEdit;
    pButtonConfirmarAlterarSenha: TPanel;
    pButtonCancelarAlterarSenha: TPanel;
    pDicas: TPanel;
    lblDicasTitle: TLabel;
    lblDicas: TLabel;
    tsEnderecoNovo: TTabSheet;
    pEnderecoNovo: TPanel;
    lblEnderecoNovo: TLabel;
    lblLogradouro: TLabel;
    lblCEP: TLabel;
    lblEstado: TLabel;
    lblNumero: TLabel;
    lblCidade: TLabel;
    lblBairro: TLabel;
    lblComplemento: TLabel;
    eLogradouroNovoD: TEdit;
    eNumeroEnderecoNovoD: TEdit;
    eCidadeNovoD: TEdit;
    eBairroNovoD: TEdit;
    eComplementoNovoD: TEdit;
    meCEPNovoD: TMaskEdit;
    cbEstadoNovoD: TComboBox;
    pButtonSalvarDadosE: TPanel;
    pHeaderEnderecoNovo: TPanel;
    lblAddEndereco: TLabel;
    iButtonBackEnderecoNovo: TImage;
    tsEnderecosE: TTabSheet;
    tsPagamentosE: TTabSheet;
    scbxMainEnderecosE: TScrollBox;
    pEnderecosE: TPanel;
    scbxEnderecosE: TScrollBox;
    pHeaderEnderecosE: TPanel;
    lblPerfilTitleEnderecosE: TLabel;
    iButtonBackEnderecosE: TImage;
    scbxMainPagamentosE: TScrollBox;
    pPagamentosE: TPanel;
    scbxPagamentosE: TScrollBox;
    lblPagamentosTitle: TLabel;
    pHeaderPagamentosE: TPanel;
    lblPerfilTitlePagamentosE: TLabel;
    iButtonBackPagamentosE: TImage;
    pButtonAlterarSenhaPagamentosE: TPanel;
    lblAlterarSenhaTitle: TLabel;
    iButtonBackAlterarSenha: TImage;
    lblCategorias: TLabel;
    scbxCategorias: TScrollBox;
    pRestaurantes: TPanel;
    lblRestaurantes: TLabel;
    scbxRestaurantes: TScrollBox;
    lblEnderecosTitle: TLabel;
    pButtonCancelarE: TPanel;
    pButtonSalvarEndereco: TPanel;
    pInfoRestauranteLE: TPanel;
    Label26: TLabel;
    Label27: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    eLogradouroDE: TEdit;
    eBairroDE: TEdit;
    eCidadeDE: TEdit;
    eNumeroEnderecoDe: TEdit;
    eComplementoDE: TEdit;
    meCEPDE: TMaskEdit;
    cbEstadoDE: TComboBox;
    Panel1: TPanel;
    lblUserId: TLabel;
    lblUserName: TLabel;
    lblCategoriasProdutos: TLabel;
    scbxCategoriasProdutosComm: TScrollBox;
    lblProdutosComm: TLabel;
    scbxProdutosComm: TScrollBox;
    Label1: TLabel;
    eApelidoDE: TEdit;
    Label2: TLabel;
    eApelidoNovoD: TEdit;
    lblFormasPagamento: TLabel;
    lblEnderecos: TLabel;

    procedure iButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure eBuscaMainChange(Sender: TObject);
    procedure eBuscaMainKeyPress(Sender: TObject; var Key: Char);
    procedure iButton2Click(Sender: TObject);
    procedure iButton3Click(Sender: TObject);
    procedure iButton4Click(Sender: TObject);
    procedure iCarrinhoClick(Sender: TObject);
    procedure iButtonLeaveClick(Sender: TObject);
    procedure pButtonAlterarSenhaVClick(Sender: TObject);
    procedure iButtonBackAlterarSenhaClick(Sender: TObject);
    procedure pButtonEditarDadosClick(Sender: TObject);
    procedure pButtonEditarEnderecoClick(Sender: TObject);
    procedure pButtonEditarPagamentosClick(Sender: TObject);
    procedure pButtonSalvarEnderecoClick(Sender: TObject);
    procedure pButtonCancelarEClick(Sender: TObject);
    procedure iButtonBackEnderecosEClick(Sender: TObject);
    procedure pButtonSalvarDadosEClick(Sender: TObject);
    procedure meCEPNovoDExit(Sender: TObject);
    procedure pButtonAddEnderecoClick(Sender: TObject);
    procedure lblButton1Click(Sender: TObject);
    procedure iButtonBackPerfilClick(Sender: TObject);
    procedure iButtonBackCommClick(Sender: TObject);

  private
    FIdUsuario: Integer;
    FNomeUsuario: String;
    FController: TClienteController;
    FEnderecoController: TEnderecoClienteController;  // ⭐ VERIFICAR
    FIdEnderecoSelecionado: Integer;
    FPerfilController: TClientePerfilController;
    FInicializado: Boolean;
    FBuscaTimer: TTimer;
    FUltimaBusca: String;
    FCategoriaSelecionada: String;
    FIdComercioSelecionado: Integer;
    FNomeComercioSelecionado: String;
    FCategoriaProdutoSelecionada: String;
    FCardHeight: Integer;
    FCardSpacing: Integer;
    FMargemLateral: Integer;
    FPagamentoController: TFormaPagamentoClienteController;
    FIdPagamentoSelecionado: Integer;

    procedure SalvarDadosPessoais;

    procedure CarregarPagamentos;
    procedure OnPagamentoCardEditar(Sender: TObject);
    procedure OnPagamentoCardExcluir(Sender: TObject);
    procedure OnPagamentoCardDefinirPrincipal(Sender: TObject);
    procedure ExcluirPagamento(IdPagamento: Integer);
    procedure DefinirPagamentoPrincipal(IdPagamento: Integer);
    procedure ExibirMensagemSemPagamentos;
    procedure AtualizarCardsPagamentoPrincipal;
    procedure pButtonAdicionarPagamentoClick(Sender: TObject);

    procedure InicializarController;
    procedure PopularCategorias;
    procedure PopularRestaurantes(const Categoria: String = '');
    procedure OnCategoriaClick(const Categoria: string);
    procedure OnRestauranteClick(IdComercio: Integer; const NomeComercio: string);
    procedure OnBuscaTimer(Sender: TObject);
    procedure ConfigurarLayout;
    procedure AbrirCardapio(IdComercio: Integer; const NomeComercio: String);
    procedure AdicionarCardComercio(Comercio: TComercio; EstaAberto: Boolean; Index: Integer);
    procedure BuscarComercios(const Termo: string);
    function ComercioEstaAberto(HorarioAbertura, HorarioFechamento: TTime): Boolean;
    procedure ExibirMensagemNenhumResultado;
    procedure LimparBusca;
    procedure LimparCardsRestaurantes;
    procedure CarregarProdutosComercio(const Categoria: String = '');
    procedure OnCategoriaProdutoClick(Sender: TObject);
    procedure OnProdutoCardClick(IdProduto: Integer; const NomeProduto: string; Preco: Currency);
    procedure VoltarParaLojas;

    procedure CarregarDadosPerfil;
    procedure ExibirDadosPerfilVisualizacao(Cliente: TCliente);
    procedure CarregarDadosPerfilEdicao(Cliente: TCliente);
    procedure LimparCamposAlterarSenha;

    procedure CarregarEnderecos;
    procedure OnEnderecoCardClick(IdEndereco: Integer);
    procedure CarregarDadosEnderecoParaEdicao(IdEndereco: Integer);
    procedure LimparCamposEndereco;
    procedure SalvarEndereco;
    procedure CancelarEdicaoEndereco;
    procedure ExibirMensagemSemEnderecos;

    procedure CadastrarNovoEndereco;
    procedure LimparCamposNovoEndereco;
    procedure BuscarCEPNovoEndereco;

    procedure CarregarEnderecosNoComboBox;
    procedure OnComboBoxEnderecosChange(Sender: TObject);
    procedure DefinirEnderecoPrincipal(IdEndereco: Integer);
    procedure ExcluirEndereco(IdEndereco: Integer);
    procedure AtualizarCardsPrincipal;
    procedure OnCardEditarClick(Sender: TObject);
    procedure OnCardExcluirClick(Sender: TObject);
  public
    property IdUsuario: Integer read FIdUsuario write FIdUsuario;
    property NomeUsuario: String read FNomeUsuario write FNomeUsuario;
  end;

var
  FormHomeC: TFormHomeC;

implementation

{$R *.dfm}

{ TCardComercioPanel }

constructor TCardComercioPanel.CreateCard(AOwner: TComponent; IdComercio: Integer; CardWidth: Integer;
  const Nome, Categoria, Taxa, Horario, Descricao: String; EstaAberto: Boolean);
var
  lblNome, lblCategoria, lblTaxa, lblHorario, lblDescricao: TLabel;
  pStatus: TPanel;
  Y: Integer;
begin
  inherited Create(AOwner);

  FIdComercio := IdComercio;
  FNomeComercio := Nome;
  FCategoria := Categoria;
  FTaxa := Taxa;
  FHorario := Horario;
  FEstaAberto := EstaAberto;
  FDescricao := Descricao;

  // ⭐ CRÍTICO: Definir Width ANTES de usar Self.Width
  Self.Width := CardWidth;
  Self.Height := 100;
  Self.ParentBackground := False;
  Self.Align := alLeft;
  Self.BevelOuter := bvNone;
  Self.Color := clWhite;
  Self.Cursor := crHandPoint;
  Self.ShowHint := True;
  Self.Hint := 'Clique para ver o cardápio';
  Self.OnClick := PanelClick;
  Self.OnMouseEnter := PanelMouseEnter;
  Self.OnMouseLeave := PanelMouseLeave;
  Self.BorderStyle := bsSingle;
  Self.Ctl3D := True;
  Self.ParentColor := False;

  Y := 15;

  // Nome
  lblNome := TLabel.Create(Self);
  lblNome.Parent := Self;
  lblNome.Left := 20;
  lblNome.Top := Y;
  lblNome.Caption := Nome;
  lblNome.Font.Name := 'Segoe UI';
  lblNome.Font.Size := 12;
  lblNome.Font.Style := [fsBold];
  lblNome.Font.Color := $00517CFF;
  lblNome.Cursor := crHandPoint;
  lblNome.OnClick := PanelClick;
  lblNome.Transparent := True;
  Inc(Y, 28);

  // Categoria
  lblCategoria := TLabel.Create(Self);
  lblCategoria.Parent := Self;
  lblCategoria.Left := 20;
  lblCategoria.Top := Y;
  lblCategoria.Caption := '📍 ' + Categoria;
  lblCategoria.Font.Name := 'Segoe UI';
  lblCategoria.Font.Size := 9;
  lblCategoria.Font.Color := clBlack;
  lblCategoria.Cursor := crHandPoint;
  lblCategoria.OnClick := PanelClick;
  lblCategoria.Transparent := True;
  Inc(Y, 22);

  // Taxa
  lblTaxa := TLabel.Create(Self);
  lblTaxa.Parent := Self;
  lblTaxa.Left := 20;
  lblTaxa.Top := Y;
  lblTaxa.Caption := '💰 Entrega: ' + Taxa;
  lblTaxa.Font.Name := 'Segoe UI';
  lblTaxa.Font.Size := 9;
  lblTaxa.Font.Style := [fsBold];
  lblTaxa.Font.Color := clBlack;
  lblTaxa.Cursor := crHandPoint;
  lblTaxa.OnClick := PanelClick;
  lblTaxa.Transparent := True;
  Inc(Y, 22);

  // Horário
  lblHorario := TLabel.Create(Self);
  lblHorario.Parent := Self;
  lblHorario.Left := 20;
  lblHorario.Top := Y;
  lblHorario.Caption := '🕐 ' + Horario;
  lblHorario.Font.Name := 'Segoe UI';
  lblHorario.Font.Size := 8;
  lblHorario.Font.Color := clBlack;
  lblHorario.Cursor := crHandPoint;
  lblHorario.OnClick := PanelClick;
  lblHorario.Transparent := True;
  Inc(Y, 20);

  // Badge Status - ⭐ AGORA Self.Width já está definido!
  pStatus := TPanel.Create(Self);
  pStatus.Parent := Self;
  pStatus.Width := 85;
  pStatus.Height := 28;
  pStatus.Top := 12;
  pStatus.Left := Self.Width - pStatus.Width - 15;
  pStatus.Anchors := [akTop, akRight];
  pStatus.BevelOuter := bvNone;
  pStatus.Font.Name := 'Segoe UI';
  pStatus.Font.Size := 9;
  pStatus.Font.Style := [fsBold];
  pStatus.Cursor := crHandPoint;
  pStatus.OnClick := PanelClick;
  pStatus.Caption := IfThen(EstaAberto, 'ABERTO', 'FECHADO');

  if EstaAberto then
  begin
    pStatus.Color := clGreen;
    pStatus.Font.Color := clWhite;
  end
  else
  begin
    pStatus.Color := clRed;
    pStatus.Font.Color := clWhite;
  end;

  // Descrição
  lblDescricao := TLabel.Create(Self);
  lblDescricao.Parent := Self;
  lblDescricao.Left := 20;
  lblDescricao.Top := Y;
  if Length(Descricao) > 90 then
    lblDescricao.Caption := Copy(Descricao, 1, 90) + '...'
  else
    lblDescricao.Caption := Descricao;
  lblDescricao.Font.Name := 'Segoe UI';
  lblDescricao.Font.Size := 8;
  lblDescricao.Font.Color := clBlack;
  lblDescricao.Cursor := crHandPoint;
  lblDescricao.OnClick := PanelClick;
  lblDescricao.AutoSize := False;
  lblDescricao.Width := Self.Width - 130;
  lblDescricao.WordWrap := True;
  lblDescricao.Transparent := True;
end;

procedure TCardComercioPanel.PanelClick(Sender: TObject);
begin
  if Assigned(FOnRestauranteClick) then
    FOnRestauranteClick(FIdComercio, FNomeComercio);
end;

procedure TCardComercioPanel.PanelMouseEnter(Sender: TObject);
begin
  Self.Color := clSilver;
  Self.Font.Color := clWhite;
end;

procedure TCardComercioPanel.PanelMouseLeave(Sender: TObject);
begin
  Self.Color := clWhite;
  Self.Font.Color := clBlack;
end;

{ TFormHomeC }

procedure TFormHomeC.FormCreate(Sender: TObject);
begin
  FInicializado := False;
  FIdEnderecoSelecionado := 0;
  FIdPagamentoSelecionado := 0;
  FUltimaBusca := '';
  FCategoriaSelecionada := 'Todos';

  FIdComercioSelecionado := 0;
  FNomeComercioSelecionado := '';
  FCategoriaProdutoSelecionada := 'Todos';

  // ⭐ CRIAR CONTROLLERS
  FController := nil;
  FPerfilController := nil;
  FEnderecoController := nil;
  FPagamentoController := nil;

  // Timer de busca
  FBuscaTimer := TTimer.Create(Self);
  FBuscaTimer.Enabled := False;
  FBuscaTimer.Interval := 500;
  FBuscaTimer.OnTimer := OnBuscaTimer;

  // Configurar edit de busca
  eBuscaMain.TextHint := '🔍 Pesquise restaurantes, lojas, categorias...';
  eBuscaMain.Text := '';
  eBuscaMain.Font.Size := 10;

  // Configurar layout
  ConfigurarLayout;

  // Configurações de cards
  FCardHeight := 120;
  FCardSpacing := 10;
  FMargemLateral := 20;
end;
procedure TFormHomeC.ConfigurarLayout;
begin
  // Configurar hierarquia e alinhamentos
  if Assigned(pHomeBackground) then
  begin
    pHomeBackground.Align := alClient;
    pHomeBackground.Color := $00517CFF;
    pHomeBackground.BevelOuter := bvNone;
  end;

  if Assigned(scbxMain) then
  begin
    scbxMain.Align := alClient;
    scbxMain.VertScrollBar.Tracking := True;
    scbxMain.HorzScrollBar.Visible := False;
    scbxMain.BorderStyle := bsNone;
    scbxMain.Color := $00517CFF;
  end;

  // Ordem dos painéis (de cima para baixo)
  if Assigned(pBusca) then
    pBusca.Align := alTop;

  if Assigned(pEndereco) then
    pEndereco.Align := alTop;

  if Assigned(pCategorias) then
  begin
    pCategorias.Align := alTop;
    pCategorias.Height := 70;
  end;

  if Assigned(scbxCategorias) then
  begin
    scbxCategorias.Align := alClient;
    scbxCategorias.HorzScrollBar.Visible := True;
    scbxCategorias.VertScrollBar.Visible := False;
  end;

  // pRestaurantes ocupa o RESTO
  if Assigned(pRestaurantes) then
  begin
    pRestaurantes.Align := alClient;
    pRestaurantes.Color := $00517CFF;
    pRestaurantes.BevelOuter := bvNone;
  end;

  if Assigned(lblRestaurantes) then
  begin
    lblRestaurantes.Align := alTop;
    lblRestaurantes.Height := 35;
    lblRestaurantes.Caption := '  Restaurantes e Comércios';
  end;

  // ⭐ scbxRestaurantes HORIZONTAL (igual categorias)
  if Assigned(scbxRestaurantes) then
  begin
    scbxRestaurantes.Align := alClient;
    scbxRestaurantes.VertScrollBar.Visible := False;    // ⭐ SEM scroll vertical
    scbxRestaurantes.HorzScrollBar.Visible := True;     // ⭐ COM scroll horizontal
    scbxRestaurantes.HorzScrollBar.Tracking := True;
    scbxRestaurantes.BorderStyle := bsNone;
    scbxRestaurantes.Color := $00517CFF;
  end;
end;

procedure TFormHomeC.DefinirEnderecoPrincipal(IdEndereco: Integer);
var
  Qr: TFDQuery;
  IdCliente: Integer;
begin
  // Buscar id_clie
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text := 'SELECT id_clie FROM clientes WHERE id_user = :id_user';
    Qr.ParamByName('id_user').AsInteger := FIdUsuario;
    Qr.Open;

    if Qr.IsEmpty then Exit;
    IdCliente := Qr.FieldByName('id_clie').AsInteger;
  finally
    Qr.Free;
  end;

  try
    // ⭐ CHAMA O CONTROLLER QUE CHAMA SERVICE QUE CHAMA REPOSITORY
    if FEnderecoController.DefinirComoPrincipal(IdEndereco, IdCliente) then
    begin
      // Atualiza visual dos cards
      AtualizarCardsPrincipal;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao definir principal: ' + E.Message);
  end;
end;

procedure TFormHomeC.DefinirPagamentoPrincipal(IdPagamento: Integer);
var
  Qr: TFDQuery;
  IdCliente: Integer;
begin
  // Buscar id_clie
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text := 'SELECT id_clie FROM clientes WHERE id_user = :id_user';
    Qr.ParamByName('id_user').AsInteger := FIdUsuario;
    Qr.Open;

    if Qr.IsEmpty then
    begin
      ShowMessage('Cliente não encontrado!');
      Exit;
    end;

    IdCliente := Qr.FieldByName('id_clie').AsInteger;
  finally
    Qr.Free;
  end;

  try
    if FPagamentoController.DefinirComoPrincipal(IdPagamento, IdCliente) then
    begin
      ShowMessage('✅ Forma de pagamento definida como PRINCIPAL!');
      AtualizarCardsPagamentoPrincipal; // Atualizar visual
    end
    else
      ShowMessage('❌ Não foi possível definir como principal!');
  except
    on E: Exception do
      ShowMessage('Erro ao definir principal: ' + E.Message);
  end;
end;


procedure TFormHomeC.InicializarController;
begin
  if FInicializado then
    Exit;

  try
    if not Assigned(DM) then
    begin
      ShowMessage('Erro crítico: DataModule não inicializado!');
      Application.Terminate;
      Exit;
    end;

    if not DM.FDConn.Connected then
      DM.FDConn.Connected := True;

    if not Assigned(FController) then
      FController := TClienteController.Create;

    if not Assigned(FPerfilController) then
      FPerfilController := TClientePerfilController.Create;

    if not Assigned(FEnderecoController) then
      FEnderecoController := TEnderecoClienteController.Create;

    if not Assigned(FPagamentoController) then // ⭐ ADICIONAR
      FPagamentoController := TFormaPagamentoClienteController.Create;

    FInicializado := True;

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao inicializar: ' + E.Message);
      FInicializado := False;
    end;
  end;
end;

procedure TFormHomeC.lblButton1Click(Sender: TObject);
begin
  pcMain.ActivePageIndex:=0;
end;

procedure TFormHomeC.FormDestroy(Sender: TObject);
begin
  if Assigned(FBuscaTimer) then
    FreeAndNil(FBuscaTimer);

  if Assigned(FPagamentoController) then  // ⭐ ADICIONAR
    FreeAndNil(FPagamentoController);

  if Assigned(FEnderecoController) then
    FreeAndNil(FEnderecoController);

  if Assigned(FPerfilController) then
    FreeAndNil(FPerfilController);

  if Assigned(FController) then
    FreeAndNil(FController);
end;

procedure TFormHomeC.FormShow(Sender: TObject);
begin
  InicializarController;

  if not FInicializado then
  begin
    ShowMessage('Não foi possível inicializar o sistema.');
    Exit;
  end;

  try
    if FIdUsuario > 0 then
    begin
      lblUserName.Caption := FNomeUsuario;
      lblUserId.Caption := 'ID: ' + IntToStr(FIdUsuario);

      CarregarEnderecos;
      CarregarEnderecosNoComboBox;
      CarregarPagamentos; // ⭐ ADICIONAR
    end
    else
    begin
      lblUserName.Caption := 'Visitante';
      lblUserId.Caption := '';
    end;

    PopularCategorias;
    PopularRestaurantes('Todos');
    Application.ProcessMessages;

  except
    on E: Exception do
      ShowMessage('Erro ao carregar dados: ' + E.Message);
  end;
end;

procedure TFormHomeC.PopularCategorias;
begin
  if not Assigned(scbxCategorias) then
    Exit;

  try
    TCategoriaHelper.PopularScrollBoxCategorias(scbxCategorias, OnCategoriaClick);
  except
    on E: Exception do
      ShowMessage('Erro ao carregar categorias: ' + E.Message);
  end;
end;

procedure TFormHomeC.OnCardEditarClick(Sender: TObject);
var
  Card: TEnderecoCardPanel;
begin
  if Sender is TEnderecoCardPanel then
  begin
    Card := TEnderecoCardPanel(Sender);
    FIdEnderecoSelecionado := Card.IdEndereco;
    CarregarDadosEnderecoParaEdicao(Card.IdEndereco);
    pcPerfil.ActivePageIndex := 3; // tsEnderecosE
  end;
end;

procedure TFormHomeC.OnCardExcluirClick(Sender: TObject);
var
  Card: TEnderecoCardPanel;
begin
  if Sender is TEnderecoCardPanel then
  begin
    Card := TEnderecoCardPanel(Sender);

    if MessageDlg('Deseja realmente excluir este endereço?',
                  mtConfirmation,
                  [mbYes, mbNo],
                  0) = mrYes then
    begin
      ExcluirEndereco(Card.IdEndereco);
    end;
  end;
end;

procedure TFormHomeC.OnCategoriaClick(const Categoria: string);
begin
  FCategoriaSelecionada := Categoria;
  TCategoriaHelper.DeselecionarTodas(scbxCategorias);
  TCategoriaHelper.SelecionarCategoria(scbxCategorias, Categoria);
  PopularRestaurantes(Categoria);
end;


procedure TFormHomeC.OnCategoriaProdutoClick(Sender: TObject);
var
  Panel: TPanel;
  i: Integer;
  Categoria: String;
begin
  if not (Sender is TPanel) then
    Exit;

  Panel := TPanel(Sender);

  // Obter categoria clicada
  if Panel.Tag = 0 then
    Categoria := 'Todos'
  else
    Categoria := Panel.Caption;

  FCategoriaProdutoSelecionada := Categoria;

  // Atualizar visual de todos os painéis (desselecionar todos)
  for i := 0 to scbxCategoriasProdutosComm.ControlCount - 1 do
  begin
    if scbxCategoriasProdutosComm.Controls[i] is TPanel then
    begin
      if scbxCategoriasProdutosComm.Controls[i] = Panel then
      begin
        // Selecionado - Laranja
        TPanel(scbxCategoriasProdutosComm.Controls[i]).Color := $00517CFF;
        TPanel(scbxCategoriasProdutosComm.Controls[i]).Font.Color := clWhite;
      end
      else
      begin
        // Não selecionado - Branco
        TPanel(scbxCategoriasProdutosComm.Controls[i]).Color := clWhite;
        TPanel(scbxCategoriasProdutosComm.Controls[i]).Font.Color := $00517CFF;
      end;
    end;
  end;

  // Recarregar produtos da categoria selecionada
  CarregarProdutosComercio(Categoria);
end;

procedure TFormHomeC.OnComboBoxEnderecosChange(Sender: TObject);
var
  IdEndereco: Integer;
begin
  if cbEnderecos.ItemIndex < 0 then
    Exit;

  // Pega o ID do endereço selecionado
  IdEndereco := Integer(cbEnderecos.Items.Objects[cbEnderecos.ItemIndex]);

  // ⭐ CHAMA AQUI!
  DefinirEnderecoPrincipal(IdEndereco);
end;

procedure TFormHomeC.OnEnderecoCardClick(IdEndereco: Integer);
begin
  cbEnderecos.OnChange := Self.OnComboBoxEnderecosChange;
end;

procedure TFormHomeC.OnPagamentoCardDefinirPrincipal(Sender: TObject);
begin

end;

procedure TFormHomeC.OnPagamentoCardEditar(Sender: TObject);
var
  Card: TPagamentoCardPanel;
begin
  if Sender is TPagamentoCardPanel then
  begin
    Card := TPagamentoCardPanel(Sender);
    FIdPagamentoSelecionado := Card.IdPagamento;

    // TODO: Implementar tela de edição
    ShowMessage('Editar pagamento ID: ' + IntToStr(Card.IdPagamento) + #13#10 +
                'Em desenvolvimento...');

    // Quando implementar:
    // CarregarDadosPagamentoParaEdicao(Card.IdPagamento);
    // pcPerfil.ActivePageIndex := 5; // Tab de edição de pagamento
  end;
end;

procedure TFormHomeC.OnPagamentoCardExcluir(Sender: TObject);
var
  Card: TPagamentoCardPanel;
begin
  if Sender is TPagamentoCardPanel then
  begin
    Card := TPagamentoCardPanel(Sender);

    // Verificar se é o principal
    if Card.Principal then
    begin
      if MessageDlg(
        'Este é o pagamento PRINCIPAL!' + #13#10 +
        'Se excluí-lo, você precisará definir outro como principal.' + #13#10#13#10 +
        'Deseja realmente excluir?',
        mtWarning,
        [mbYes, mbNo],
        0) = mrNo then
        Exit;
    end
    else
    begin
      if MessageDlg(
        'Deseja realmente excluir esta forma de pagamento?',
        mtConfirmation,
        [mbYes, mbNo],
        0) = mrNo then
        Exit;
    end;

    ExcluirPagamento(Card.IdPagamento);
  end;
end;

procedure TFormHomeC.OnProdutoCardClick(IdProduto: Integer;
  const NomeProduto: string; Preco: Currency);
var
  Quantidade: String;
  QtdInt: Integer;
begin
  // Perguntar quantidade
  Quantidade := InputBox('Adicionar ao Carrinho',
                         'Quantas unidades de "' + NomeProduto + '"?' + #13#10 +
                         'Preço unitário: R$ ' + FormatFloat('#,##0.00', Preco),
                         '1');

  // Validar quantidade
  if not TryStrToInt(Quantidade, QtdInt) or (QtdInt <= 0) then
  begin
    ShowMessage('Quantidade inválida!');
    Exit;
  end;

  // ⭐ AQUI você implementa a lógica de adicionar ao carrinho
  ShowMessage(
    'Produto adicionado ao carrinho:' + #13#10#13#10 +
    'Nome: ' + NomeProduto + #13#10 +
    'Quantidade: ' + IntToStr(QtdInt) + #13#10 +
    'Preço unitário: R$ ' + FormatFloat('#,##0.00', Preco) + #13#10 +
    'Subtotal: R$ ' + FormatFloat('#,##0.00', Preco * QtdInt) + #13#10#13#10 +
    '✅ Item adicionado com sucesso!'
  );

  // TODO: Implementar lógica real de carrinho
  // - Criar TObjectList<TItemCarrinho>
  // - Incrementar contador lblItensCart
  // - Atualizar lblTotalCart
  // - Persistir na memória

  // Exemplo básico:
  // if not Assigned(FCarrinho) then
  //   FCarrinho := TObjectList<TItemCarrinho>.Create(True);
  //
  // Item := TItemCarrinho.Create;
  // Item.IdProduto := IdProduto;
  // Item.NomeProduto := NomeProduto;
  // Item.Preco := Preco;
  // Item.Quantidade := QtdInt;
  // FCarrinho.Add(Item);
  //
  // AtualizarResumoCarrinho;
end;

procedure TFormHomeC.OnRestauranteClick(IdComercio: Integer;
  const NomeComercio: string);
begin
  AbrirCardapio(IdComercio, NomeComercio);
end;

procedure TFormHomeC.pButtonAddEnderecoClick(Sender: TObject);
begin
  pcMain.ActivePageIndex:=6; // tsEnderecoNovo (verifique o índice!)
  if pcMain.ActivePageIndex=6 then begin
    LimparCamposNovoEndereco;
  end;
end;

procedure TFormHomeC.pButtonAdicionarPagamentoClick(Sender: TObject);
begin
  // TODO: Implementar tela de seleção de tipo de pagamento
  ShowMessage(
    'Escolha o tipo de pagamento:' + #13#10#13#10 +
    '1. 💳 Cartão (Crédito/Débito)' + #13#10 +
    '2. 🔄 Pix' + #13#10 +
    '3. 🏦 Transferência Bancária' + #13#10#13#10 +
    'Em desenvolvimento...'
  );

  // Quando implementar:
  // pcPerfil.ActivePageIndex := 6; // Tab "Adicionar Pagamento"
  // LimparCamposNovoPagamento;
end;

procedure TFormHomeC.pButtonAlterarSenhaVClick(Sender: TObject);
begin
  pcPerfil.ActivePageIndex:=2;
end;

procedure TFormHomeC.pButtonCancelarEClick(Sender: TObject);
begin
  // Limpar campos
  LimparCamposEndereco;

  // Resetar ID selecionado
  FIdEnderecoSelecionado := 0;

  // Voltar para visualização
  pcPerfil.ActivePageIndex := 0; // tsVisualizarPefil
end;

procedure TFormHomeC.pButtonEditarDadosClick(Sender: TObject);
begin
  pcPerfil.ActivePageIndex:=1;
end;

procedure TFormHomeC.pButtonEditarEnderecoClick(Sender: TObject);
begin
  // Verificar se há um endereço selecionado
  if FIdEnderecoSelecionado = 0 then
  begin
    ShowMessage('Selecione um endereço primeiro!');
    Exit;
  end;

  // Carregar dados do endereço selecionado
  CarregarDadosEnderecoParaEdicao(FIdEnderecoSelecionado);

  // Ir para tela de edição
  pcPerfil.ActivePageIndex := 3; // tsEnderecosE
end;

procedure TFormHomeC.pButtonEditarPagamentosClick(Sender: TObject);
begin
  pcPerfil.ActivePageIndex:=4;
end;

procedure TFormHomeC.pButtonSalvarDadosEClick(Sender: TObject);
begin
  CadastrarNovoEndereco;
end;

procedure TFormHomeC.pButtonSalvarEnderecoClick(Sender: TObject);
begin
  SalvarEndereco;
end;

procedure TFormHomeC.PopularRestaurantes(const Categoria: String = '');
var
  Comercios: TObjectList<TComercio>;
  Comercio: TComercio;
  EstaAberto: Boolean;
  Index: Integer;
begin
  if not FInicializado or not Assigned(FController) then
  begin
    InicializarController;
    if not FInicializado then
      Exit;
  end;

  try
    LimparCardsRestaurantes;
    Screen.Cursor := crHourGlass;
    try
      // ⭐ MUDANÇA: Chamar com False para retornar TODOS
      Comercios := FController.ListarComerciosDisponiveis(False);

      if not Assigned(Comercios) then
        Exit;

      try
        if Comercios.Count = 0 then
        begin
          ExibirMensagemNenhumResultado;
          Exit;
        end;

        Index := 0;
        for Comercio in Comercios do
        begin
          if Assigned(Comercio) then
          begin
            if (Categoria = 'Todos') or (Categoria = '') or
               (AnsiUpperCase(Comercio.Categoria) = AnsiUpperCase(Categoria)) then
            begin
              EstaAberto := ComercioEstaAberto(Comercio.HorarioAbertura, Comercio.HorarioFechamento);
              AdicionarCardComercio(Comercio, EstaAberto, Index);
              Inc(Index);
            end;
          end;
        end;

        if Index = 0 then
          ExibirMensagemNenhumResultado
        else
        begin
          scbxRestaurantes.Invalidate;
          Application.ProcessMessages;
        end;

      finally
        Comercios.Free;
      end;

    finally
      Screen.Cursor := crDefault;
    end;

  except
    on E: Exception do
    begin
      Screen.Cursor := crDefault;
      ShowMessage('Erro ao popular lista: ' + E.Message);
    end;
  end;
end;

procedure TFormHomeC.CadastrarNovoEndereco;
var
  Endereco: TEnderecoCliente;
  MarcarPrincipal: Boolean;
  Qr: TFDQuery;
  IdCliente: Integer;
begin
  // ========== VERIFICAR CONTROLLER LOGO NO INÍCIO ==========

  if not Assigned(FEnderecoController) then
  begin
    ShowMessage('Erro: Controller não existe!' + #13#10 +
                'Tentando criar...');
    try
      FEnderecoController := TEnderecoClienteController.Create;
      ShowMessage('Controller criado com sucesso!');
    except
      on E: Exception do
      begin
        ShowMessage('ERRO ao criar controller: ' + E.Message);
        Exit;
      end;
    end;
  end;

  // ========== BUSCAR id_clie ==========

  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text := 'SELECT id_clie FROM clientes WHERE id_user = :id_user';
    Qr.ParamByName('id_user').AsInteger := FIdUsuario;
    Qr.Open;

    if Qr.IsEmpty then
    begin
      ShowMessage('Cliente não encontrado!');
      Exit;
    end;

    IdCliente := Qr.FieldByName('id_clie').AsInteger;

  finally
    Qr.Free;
  end;

  // ========== VERIFICAR DataModule ==========

  if not Assigned(DM) or not DM.FDConn.Connected then
  begin
    ShowMessage('Erro: Banco não conectado!');
    Exit;
  end;

  // ========== VALIDAÇÕES ==========
  if Trim(eApelidoNovoD.Text) = '' then
  begin
    ShowMessage('Informe um apelido para o endereço!' + #13#10 +
                '(Ex: Casa, Trabalho, Apartamento)');
    eApelidoNovoD.SetFocus;
    Exit;
  end;

  if Trim(meCEPNovoD.Text) = '' then
  begin
    ShowMessage('Informe o CEP!');
    Exit;
  end;

  if Trim(eLogradouroNovoD.Text) = '' then
  begin
    ShowMessage('Informe o logradouro!');
    Exit;
  end;

  if Trim(eNumeroEnderecoNovoD.Text) = '' then
  begin
    ShowMessage('Informe o número!');
    Exit;
  end;

  if Trim(eBairroNovoD.Text) = '' then
  begin
    ShowMessage('Informe o bairro!');
    Exit;
  end;

  if Trim(eCidadeNovoD.Text) = '' then
  begin
    ShowMessage('Informe a cidade!');
    Exit;
  end;

  if Trim(cbEstadoNovoD.Text) = '' then
  begin
    ShowMessage('Selecione o estado!');
    Exit;
  end;

  // ========== PERGUNTAR SE É PRINCIPAL ==========

  MarcarPrincipal := MessageDlg('Marcar como principal?',
                                mtConfirmation,
                                [mbYes, mbNo],
                                0) = mrYes;

  // ========== CRIAR E PREENCHER ENDERECO ==========

  Endereco := TEnderecoCliente.Create;
  try
    Endereco.IdCliente := IdCliente;
    Endereco.Apelido := Trim(eApelidoNovoD.Text);
    Endereco.Logradouro := Trim(eLogradouroNovoD.Text);
    Endereco.CEP := Trim(meCEPNovoD.Text);
    Endereco.Numero := Trim(eNumeroEnderecoNovoD.Text);
    Endereco.Complemento := Trim(eComplementoNovoD.Text);
    Endereco.Bairro := Trim(eBairroNovoD.Text);
    Endereco.Cidade := Trim(eCidadeNovoD.Text);
    Endereco.UF := Trim(cbEstadoNovoD.Text);
    Endereco.Principal := MarcarPrincipal;

    // ========== SALVAR ==========

    if FEnderecoController.CadastrarEndereco(Endereco) then
    begin
      ShowMessage('✅ Endereço "' + Trim(eApelidoNovoD.Text) + '" cadastrado com sucesso!');
      LimparCamposNovoEndereco;
      pcMain.ActivePageIndex := 2; // Voltar para Perfil
      pcPerfil.ActivePageIndex := 0; // Tab Visualizar
      CarregarEnderecos;
      CarregarEnderecosNoComboBox;
    end
    else
    begin
      ShowMessage('❌ Erro ao cadastrar!');
    end;

  finally
    Endereco.Free;
  end;
end;
procedure TFormHomeC.CancelarEdicaoEndereco;
begin
  // Limpar campos
  LimparCamposEndereco;

  // Resetar ID selecionado
  FIdEnderecoSelecionado := 0;

  // Voltar para visualização
  pcPerfil.ActivePageIndex := 0; // tsVisualizarPefil
end;

procedure TFormHomeC.CarregarDadosEnderecoParaEdicao(IdEndereco: Integer);
var
  Endereco: TEnderecoCliente;
begin
  try
    Endereco := FEnderecoController.ObterEndereco(IdEndereco);

    if Assigned(Endereco) then
    begin
      try
        // Preencher campos de edição
        eLogradouroDE.Text := Endereco.Logradouro;
        meCEPDE.Text := Endereco.CEP;
        eNumeroEnderecoDe.Text := Endereco.Numero;
        eComplementoDE.Text := Endereco.Complemento;
        eBairroDE.Text := Endereco.Bairro;
        eCidadeDE.Text := Endereco.Cidade;
        cbEstadoDE.Text := Endereco.UF;
        eApelidoDE.Text := Endereco.Apelido;
      finally
        Endereco.Free;
      end;
    end;

  except
    on E: Exception do
      ShowMessage('Erro ao carregar dados do endereço: ' + E.Message);
  end;
end;

procedure TFormHomeC.SalvarDadosPessoais;
begin

end;

procedure TFormHomeC.SalvarEndereco;
var
  Endereco: TEnderecoCliente;
  Qr: TFDQuery;
  IdCliente: Integer;
begin
  if Trim(eApelidoDE.Text) = '' then
  begin
    ShowMessage('Informe um apelido para o endereço!' + #13#10 +
                '(Ex: Casa, Trabalho, Apartamento)');
    eApelidoDE.SetFocus;
    Exit;
  end;
  // Validar campos obrigatórios
  if Trim(eLogradouroDE.Text) = '' then
  begin
    ShowMessage('Informe o logradouro!');
    eLogradouroDE.SetFocus;
    Exit;
  end;

  if Trim(meCEPDE.Text) = '' then
  begin
    ShowMessage('Informe o CEP!');
    meCEPDE.SetFocus;
    Exit;
  end;

  if Trim(eNumeroEnderecoDe.Text) = '' then
  begin
    ShowMessage('Informe o número!');
    eNumeroEnderecoDe.SetFocus;
    Exit;
  end;

  if Trim(eCidadeDE.Text) = '' then
  begin
    ShowMessage('Informe a cidade!');
    eCidadeDE.SetFocus;
    Exit;
  end;

  if Trim(cbEstadoDE.Text) = '' then
  begin
    ShowMessage('Selecione o estado!');
    cbEstadoDE.SetFocus;
    Exit;
  end;

   if Trim(eApelidoDE.Text) = '' then
  begin
    ShowMessage('Informe um apelido para o endereço!' + #13#10 +
                '(Ex: Casa, Trabalho, Apartamento)');
    eApelidoDE.SetFocus;
    Exit;
  end;
  // Buscar id_clie
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text := 'SELECT id_clie FROM clientes WHERE id_user = :id_user';
    Qr.ParamByName('id_user').AsInteger := FIdUsuario;
    Qr.Open;

    if Qr.IsEmpty then
    begin
      ShowMessage('Cliente não encontrado!');
      Exit;
    end;

    IdCliente := Qr.FieldByName('id_clie').AsInteger;
  finally
    Qr.Free;
  end;

  try
    // Criar objeto de endereço
    Endereco := TEnderecoCliente.Create;
    try
      Endereco.IdEndereco := FIdEnderecoSelecionado;
      Endereco.IdCliente := IdCliente;
      Endereco.Logradouro := Trim(eLogradouroDE.Text);
      Endereco.CEP := Trim(meCEPDE.Text);
      Endereco.Numero := Trim(eNumeroEnderecoDe.Text);
      Endereco.Complemento := Trim(eComplementoDE.Text);
      Endereco.Bairro := Trim(eBairroDE.Text);
      Endereco.Cidade := Trim(eCidadeDE.Text);
      Endereco.UF := Trim(cbEstadoDE.Text);
      Endereco.Apelido := Trim(eApelidoDE.Text);
      // Salvar no banco
      if FEnderecoController.AtualizarEndereco(Endereco) then
      begin
        ShowMessage('Endereço atualizado com sucesso!');

        // Limpar campos
        LimparCamposEndereco;

        // Recarregar cards
        CarregarEnderecos;
        CarregarEnderecosNoComboBox;

        // Voltar para visualização
        pcPerfil.ActivePageIndex := 0; // tsVisualizarPefil
      end
      else
        ShowMessage('Erro ao atualizar endereço!');

    finally
      Endereco.Free;
    end;

  except
    on E: Exception do
      ShowMessage('Erro ao salvar endereço: ' + E.Message);
  end;
end;

procedure TFormHomeC.VoltarParaLojas;
begin
  // Limpar dados do comércio selecionado
  FIdComercioSelecionado := 0;
  FNomeComercioSelecionado := '';
  FCategoriaProdutoSelecionada := '';

  // Limpar scrollboxes
  scbxCategoriasProdutosComm.DestroyComponents;
  scbxProdutosComm.DestroyComponents;

  // Voltar para tsLojas
  pcMain.ActivePage := tsLojas;
end;

procedure TFormHomeC.CarregarDadosPerfil;
var
  Cliente: TCliente;
begin
  try
    Cliente := FPerfilController.ObterPerfil(FIdUsuario);
    if Assigned(Cliente) then
    begin
      try
        ExibirDadosPerfilVisualizacao(Cliente);
      finally
        Cliente.Free;
      end;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao carregar dados do perfil: ' + E.Message);
  end;
end;

procedure TFormHomeC.CarregarDadosPerfilEdicao(Cliente: TCliente);
begin
  // Dados pessoais
  eNomeDE.Text := Cliente.NomeUser;
  eEmailDE.Text := Cliente.EmailUser;
  meCPFDE.Text := Cliente.CpfUser;
  meTelefoneDE.Text := Cliente.NPhoneUser;

  // Endereço
  eLogradouroDE.Text := Cliente.Logradouro;
  meCEPDE.Text := Cliente.CEP;
  eNumeroEnderecoDE.Text := Cliente.Numero;
  eComplementoDE.Text := Cliente.Complemento;
  eBairroDE.Text := Cliente.Bairro;
  eCidadeDE.Text := Cliente.Cidade;
  cbEstadoDE.Text := Cliente.UF;

  // Tornar campos somente leitura
  meCPFDE.ReadOnly := True;
end;

procedure TFormHomeC.CarregarEnderecos;
var
  Enderecos: TObjectList<TEnderecoCliente>;
  Endereco: TEnderecoCliente;
  Card: TEnderecoCardPanel;
  Y, CardHeight, Spacing: Integer;
  Qr: TFDQuery;
  IdCliente: Integer;
begin
  // ⭐ PROTEÇÃO 1: Verificar se controller existe
  if not Assigned(FEnderecoController) then
  begin
    ShowMessage('Erro: Controller de endereços não foi criado!');
    Exit;
  end;

  // ⭐ PROTEÇÃO 2: Verificar se DataModule existe
  if not Assigned(DM) or not DM.FDConn.Connected then
  begin
    ShowMessage('Erro: Banco de dados não conectado!');
    Exit;
  end;

  // ⭐ PROTEÇÃO 3: Verificar se scbxEnderecos existe
  if not Assigned(scbxEnderecos) then
  begin
    ShowMessage('Erro: ScrollBox de endereços não existe!');
    Exit;
  end;

  // Buscar id_clie
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text := 'SELECT id_clie FROM clientes WHERE id_user = :id_user';
    Qr.ParamByName('id_user').AsInteger := FIdUsuario;
    Qr.Open;

    if Qr.IsEmpty then
    begin
      ShowMessage('Cliente não encontrado no banco!');
      Exit;
    end;

    IdCliente := Qr.FieldByName('id_clie').AsInteger;
  finally
    Qr.Free;
  end;

  // Limpar cards existentes
  for Y := scbxEnderecos.ControlCount - 1 downto 0 do
  begin
    if scbxEnderecos.Controls[Y] is TEnderecoCardPanel then
      scbxEnderecos.Controls[Y].Free;
  end;

  try
    Enderecos := FEnderecoController.ListarEnderecos(IdCliente);

    if not Assigned(Enderecos) then
    begin
      ShowMessage('Erro: Lista de endereços retornou nil!');
      Exit;
    end;

    try
      if Enderecos.Count = 0 then
      begin
        ExibirMensagemSemEnderecos;
        Exit;
      end;

      CardHeight := 130;
      Spacing := 10;
      Y := Spacing;

      for Endereco in Enderecos do
      begin
        if Assigned(Endereco) then
        begin
          Card := TEnderecoCardPanel.CreateCard(
            Self,
            Endereco.IdEndereco,
            Endereco.Apelido,
            Endereco.Logradouro,
            Endereco.Numero,
            Endereco.Bairro,
            Endereco.Cidade,
            Endereco.UF,
            Endereco.CEP,
            Endereco.Principal
          );

          Card.Parent := scbxEnderecos;
          Card.Top := Y;
          Card.Left := 10;
          Card.Width := scbxEnderecos.ClientWidth - 20;
          Card.Anchors := [akLeft, akTop, akRight];
          Card.OnEditar := OnCardEditarClick;
          Card.OnExcluir := OnCardExcluirClick;

          Inc(Y, CardHeight + Spacing);
        end;
      end;

    finally
      Enderecos.Free;
    end;

  except
    on E: Exception do
      ShowMessage('Erro ao carregar endereços: ' + E.Message);
  end;
end;

procedure TFormHomeC.CarregarEnderecosNoComboBox;
var
  Enderecos: TObjectList<TEnderecoCliente>;
  Endereco: TEnderecoCliente;
  Qr: TFDQuery;
  IdCliente: Integer;
  IdxPrincipal: Integer;
begin
  // ⭐ PROTEÇÃO 1: Verificar se controller existe
  if not Assigned(FEnderecoController) then
  begin
    ShowMessage('Erro: Controller de endereços não foi criado!');
    Exit;
  end;

  // ⭐ PROTEÇÃO 2: Verificar se cbEnderecos existe
  if not Assigned(cbEnderecos) then
  begin
    ShowMessage('Erro: ComboBox de endereços não existe!');
    Exit;
  end;

  // ⭐ PROTEÇÃO 3: Verificar se DataModule existe
  if not Assigned(DM) or not DM.FDConn.Connected then
  begin
    ShowMessage('Erro: Banco de dados não conectado!');
    Exit;
  end;

  // Buscar id_clie
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text := 'SELECT id_clie FROM clientes WHERE id_user = :id_user';
    Qr.ParamByName('id_user').AsInteger := FIdUsuario;
    Qr.Open;

    if Qr.IsEmpty then
      Exit;

    IdCliente := Qr.FieldByName('id_clie').AsInteger;
  finally
    Qr.Free;
  end;

  cbEnderecos.Clear;
  cbEnderecos.OnChange := nil;

  try
    Enderecos := FEnderecoController.ListarEnderecos(IdCliente);

    if not Assigned(Enderecos) or (Enderecos.Count = 0) then
    begin
      cbEnderecos.Enabled := False;
      Exit;
    end;

    try
      IdxPrincipal := -1;

      for Endereco in Enderecos do
      begin
        if Assigned(Endereco) then
        begin
          cbEnderecos.Items.AddObject(
            Format('%s - %s, %s', [Endereco.Apelido, Endereco.Logradouro, Endereco.Numero]),
            TObject(Endereco.IdEndereco)
          );

          if Endereco.Principal then
            IdxPrincipal := cbEnderecos.Items.Count - 1;
        end;
      end;

      if IdxPrincipal >= 0 then
        cbEnderecos.ItemIndex := IdxPrincipal
      else if cbEnderecos.Items.Count > 0 then
        cbEnderecos.ItemIndex := 0;

      cbEnderecos.Enabled := True;

    finally
      Enderecos.Free;
    end;

  except
    on E: Exception do
      ShowMessage('Erro ao carregar combo: ' + E.Message);
  end;

  cbEnderecos.OnChange := OnComboBoxEnderecosChange;
end;

procedure TFormHomeC.CarregarPagamentos;
var
  Pagamentos: TObjectList<TFormaPagamentoCliente>;
  Pagamento: TFormaPagamentoCliente;
  Card: TPagamentoCardPanel;
  Y, CardHeight, Spacing: Integer;
  Qr: TFDQuery;
  IdCliente: Integer;
begin
  // ⭐ PROTEÇÃO 1: Verificar se controller existe
  if not Assigned(FPagamentoController) then
  begin
    ShowMessage('Erro: Controller de pagamentos não foi criado!');
    Exit;
  end;

  // ⭐ PROTEÇÃO 2: Verificar se DataModule existe
  if not Assigned(DM) or not DM.FDConn.Connected then
  begin
    ShowMessage('Erro: Banco de dados não conectado!');
    Exit;
  end;

  // ⭐ PROTEÇÃO 3: Verificar se scbxPagamentosE existe
  if not Assigned(scbxPagamentosE) then
  begin
    ShowMessage('Erro: ScrollBox de pagamentos não existe!');
    Exit;
  end;

  // Buscar id_clie
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text := 'SELECT id_clie FROM clientes WHERE id_user = :id_user';
    Qr.ParamByName('id_user').AsInteger := FIdUsuario;
    Qr.Open;

    if Qr.IsEmpty then
    begin
      ShowMessage('Cliente não encontrado no banco!');
      Exit;
    end;

    IdCliente := Qr.FieldByName('id_clie').AsInteger;
  finally
    Qr.Free;
  end;

  // Limpar cards existentes
  for Y := scbxPagamentosE.ControlCount - 1 downto 0 do
  begin
    if scbxPagamentosE.Controls[Y] is TPagamentoCardPanel then
      scbxPagamentosE.Controls[Y].Free;
  end;

  try
    Pagamentos := FPagamentoController.ListarPagamentos(IdCliente);

    if not Assigned(Pagamentos) then
    begin
      ShowMessage('Erro: Lista de pagamentos retornou nil!');
      Exit;
    end;

    try
      if Pagamentos.Count = 0 then
      begin
        ExibirMensagemSemPagamentos;
        Exit;
      end;

      CardHeight := 120;
      Spacing := 10;
      Y := Spacing;

      for Pagamento in Pagamentos do
      begin
        if Assigned(Pagamento) then
        begin
          // ⭐ USAR O NOVO CONSTRUTOR
          Card := TPagamentoCardPanel.CreateCardFromModel(Self, Pagamento);

          Card.Parent := scbxPagamentosE;
          Card.Top := Y;
          Card.Left := 10;
          Card.Width := scbxPagamentosE.ClientWidth - 20;
          Card.Anchors := [akLeft, akTop, akRight];
          Card.OnEditar := OnPagamentoCardEditar;
          Card.OnExcluir := OnPagamentoCardExcluir;
          Card.OnDefinirPrincipal := OnPagamentoCardDefinirPrincipal; // ⭐ NOVO

          Inc(Y, CardHeight + Spacing);
        end;
      end;

    finally
      Pagamentos.Free;
    end;

  except
    on E: Exception do
      ShowMessage('Erro ao carregar formas de pagamento: ' + E.Message);
  end;
end;

procedure TFormHomeC.CarregarProdutosComercio(const Categoria: String);
begin
  if FIdComercioSelecionado <= 0 then
  begin
    ShowMessage('Nenhum comércio selecionado!');
    Exit;
  end;

  try
    Screen.Cursor := crHourGlass;

    TProdutoViewHelper.PopularScrollBoxProdutos(
      scbxProdutosComm,
      FIdComercioSelecionado,
      Categoria,
      OnProdutoCardClick
    );

  except
    on E: Exception do
    begin
      Screen.Cursor := crDefault;
      ShowMessage('Erro ao carregar produtos: ' + E.Message);
    end;
  end;

  Screen.Cursor := crDefault;
end;
function TFormHomeC.ComercioEstaAberto(HorarioAbertura, HorarioFechamento: TTime): Boolean;
var
  HoraAtual: TTime;
begin
  HoraAtual := Time;

  if HorarioFechamento > HorarioAbertura then
    Result := (HoraAtual >= HorarioAbertura) and (HoraAtual <= HorarioFechamento)
  else
    Result := (HoraAtual >= HorarioAbertura) or (HoraAtual <= HorarioFechamento);
end;

procedure TFormHomeC.LimparCamposAlterarSenha;
begin
  eSenhaAtual.Clear;
  eSenhaNova.Clear;
  eSenhaConfirmacao.Clear;
end;

procedure TFormHomeC.LimparCamposEndereco;
begin
  eLogradouroDE.Clear;
  meCEPDE.Clear;
  eNumeroEnderecoDe.Clear;
  eComplementoDE.Clear;
  eBairroDE.Clear;
  eCidadeDE.Clear;
  cbEstadoDE.ItemIndex := -1;
  eApelidoDE.Clear;
end;

procedure TFormHomeC.LimparCamposNovoEndereco;
begin  // ⭐ CAMPO RENOMEADO
  meCEPNovoD.SetFocus;
  eLogradouroNovoD.Clear;
  eCidadeNovoD.Clear;
  eNumeroEnderecoNovoD.Clear;
  cbEstadoNovoD.ItemIndex := -1;
  eBairroNovoD.Clear;
  eComplementoNovoD.Clear;
  eApelidoNovoD.Clear;
end;

procedure TFormHomeC.LimparCardsRestaurantes;
var
  I: Integer;
begin
  for I := scbxRestaurantes.ControlCount - 1 downto 0 do
  begin
    if scbxRestaurantes.Controls[I] is TCardComercioPanel then
      scbxRestaurantes.Controls[I].Free;
  end;

  if Assigned(scbxRestaurantes) then
    scbxRestaurantes.VertScrollBar.Position := 0;
end;

procedure TFormHomeC.meCEPNovoDExit(Sender: TObject);
begin
  if Trim(meCEPNovoD.Text) <> '' then
    BuscarCEPNovoEndereco;
end;

procedure TFormHomeC.AdicionarCardComercio(Comercio: TComercio; EstaAberto: Boolean; Index: Integer);
var
  Card: TCardComercioPanel;
  Horario, Taxa: String;
  PosY: Integer;
  LarguraCard: Integer;
begin
  if not Assigned(Comercio) then
    Exit;

  LarguraCard := scbxRestaurantes.ClientWidth - (FMargemLateral * 2);
  if LarguraCard < 200 then
    LarguraCard := 200;

  PosY := FCardSpacing + (Index * (FCardHeight + FCardSpacing));

  Horario := FormatDateTime('hh:nn', Comercio.HorarioAbertura) + ' - ' +
             FormatDateTime('hh:nn', Comercio.HorarioFechamento);
  Taxa := FormatFloat('R$ #,##0.00', Comercio.TaxaEntregaBase);

  // ⭐ MUDANÇA: Passar largura no construtor
  Card := TCardComercioPanel.CreateCard(
    Self,
    Comercio.IdComercio,
    LarguraCard,  // ⭐ NOVO PARÂMETRO
    Comercio.NomeComercio,
    Comercio.Categoria,
    Taxa,
    Horario,
    Comercio.Descricao,
    EstaAberto
  );
  Card.OnRestauranteClick := OnRestauranteClick;
  Card.Left := FMargemLateral;
  Card.Top := PosY;
  Card.Parent := scbxRestaurantes;
  Card.Visible := True;
end;

procedure TFormHomeC.AtualizarCardsPagamentoPrincipal;
var
  I: Integer;
  Card: TPagamentoCardPanel;
  Pagamentos: TObjectList<TFormaPagamentoCliente>;
  Pagamento: TFormaPagamentoCliente;
  Qr: TFDQuery;
  IdCliente: Integer;
  IdPrincipal: Integer;
begin
  // Buscar id_clie
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text := 'SELECT id_clie FROM clientes WHERE id_user = :id_user';
    Qr.ParamByName('id_user').AsInteger := FIdUsuario;
    Qr.Open;

    if Qr.IsEmpty then Exit;
    IdCliente := Qr.FieldByName('id_clie').AsInteger;
  finally
    Qr.Free;
  end;

  try
    // Buscar pagamentos atualizados do banco
    Pagamentos := FPagamentoController.ListarPagamentos(IdCliente);

    if not Assigned(Pagamentos) then
      Exit;

    try
      // Encontrar qual é o principal
      IdPrincipal := 0;
      for Pagamento in Pagamentos do
      begin
        if Pagamento.Principal then
        begin
          IdPrincipal := Pagamento.IdPagamento;
          Break;
        end;
      end;

      // Atualizar visual de todos os cards
      for I := 0 to scbxPagamentosE.ControlCount - 1 do
      begin
        if scbxPagamentosE.Controls[I] is TPagamentoCardPanel then
        begin
          Card := TPagamentoCardPanel(scbxPagamentosE.Controls[I]);

          // Define se este card é o principal
          Card.Principal := (Card.IdPagamento = IdPrincipal);
        end;
      end;

    finally
      Pagamentos.Free;
    end;

  except
    on E: Exception do
      ShowMessage('Erro ao atualizar visual dos cards: ' + E.Message);
  end;
end;

procedure TFormHomeC.AtualizarCardsPrincipal;
var
  I: Integer;
  Card: TEnderecoCardPanel;
  IdPrincipal: Integer;
begin
  if cbEnderecos.ItemIndex < 0 then
    Exit;

  IdPrincipal := Integer(cbEnderecos.Items.Objects[cbEnderecos.ItemIndex]);

  for I := 0 to scbxEnderecos.ControlCount - 1 do
  begin
    if scbxEnderecos.Controls[I] is TEnderecoCardPanel then
    begin
      Card := TEnderecoCardPanel(scbxEnderecos.Controls[I]);
      Card.Principal := (Card.IdEndereco = IdPrincipal);
    end;
  end;
end;

procedure TFormHomeC.AbrirCardapio(IdComercio: Integer; const NomeComercio: String);
var
  Qr: TFDQuery;
begin
  FIdComercioSelecionado := IdComercio;
  FNomeComercioSelecionado := NomeComercio;
  FCategoriaProdutoSelecionada := 'Todos';

  // Buscar dados do comércio
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text :=
      'SELECT taxa_entrega_base, avaliacao_media, ' +
      '       horario_abertura, horario_fechamento, categoria ' +
      'FROM comercios ' +
      'WHERE id_comercio = :id_comercio';
    Qr.ParamByName('id_comercio').AsInteger := IdComercio;
    Qr.Open;

    if not Qr.IsEmpty then
    begin
      // Atualizar labels com informações do comércio
      lblNomeComm.Caption := NomeComercio;

      lblTaxaEntrega.Caption := 'Taxa: R$ ' +
        FormatFloat('0.00', Qr.FieldByName('taxa_entrega_base').AsFloat);

      // Verificar se o campo avaliacao_media existe
      if Qr.FindField('avaliacao_media') <> nil then
        lblNota.Caption := 'Avaliação: ' +
          FormatFloat('0.0', Qr.FieldByName('avaliacao_media').AsFloat) + ' ⭐'
      else
        lblNota.Caption := 'Avaliação: --';

      lblHorarioFunc.Caption := 'Horário: ' +
        FormatDateTime('hh:nn', Frac(Qr.FieldByName('horario_abertura').AsDateTime)) + ' - ' +
        FormatDateTime('hh:nn', Frac(Qr.FieldByName('horario_fechamento').AsDateTime));

      lblCategoria.Caption := '📍 ' + Qr.FieldByName('categoria').AsString;
    end;
  finally
    Qr.Free;
  end;

  // Popular categorias de produtos
  TProdutoViewHelper.PopularScrollBoxCategoriasProduto(
    scbxCategoriasProdutosComm,
    IdComercio,
    OnCategoriaProdutoClick
  );

  // Carregar todos os produtos inicialmente
  CarregarProdutosComercio('Todos');

  // Mudar para a aba tsCommSelec
  pcMain.ActivePage := tsCommSelec;
end;

procedure TFormHomeC.eBuscaMainChange(Sender: TObject);
begin
  if not FInicializado then
    Exit;

  FBuscaTimer.Enabled := False;

  if Trim(eBuscaMain.Text) = '' then
  begin
    FUltimaBusca := '';
    PopularRestaurantes(FCategoriaSelecionada);
  end
  else
  begin
    FBuscaTimer.Enabled := True;
  end;
end;

procedure TFormHomeC.OnBuscaTimer(Sender: TObject);
var
  TermoBusca: String;
begin
  FBuscaTimer.Enabled := False;
  TermoBusca := Trim(eBuscaMain.Text);

  if TermoBusca = FUltimaBusca then
    Exit;

  FUltimaBusca := TermoBusca;

  if TermoBusca <> '' then
    BuscarComercios(TermoBusca);
end;

procedure TFormHomeC.eBuscaMainKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    FBuscaTimer.Enabled := False;
    if Trim(eBuscaMain.Text) <> '' then
      BuscarComercios(Trim(eBuscaMain.Text));
  end;
end;

procedure TFormHomeC.BuscarCEPNovoEndereco;
var
  CEP: string;
  Endereco: TEndereco;
begin
  CEP := Trim(meCEPNovoD.Text);  // ⭐ CAMPO RENOMEADO
  CEP := Trim(meCEPNovoD.Text);

  // Remover formatação
  CEP := StringReplace(CEP, '-', '', [rfReplaceAll]);
  CEP := StringReplace(CEP, '.', '', [rfReplaceAll]);
  CEP := StringReplace(CEP, ' ', '', [rfReplaceAll]);

  if Length(CEP) <> 8 then
  begin
    ShowMessage('CEP inválido! Digite 8 dígitos.');
    meCEPNovoD.SetFocus;
    Exit;
  end;

  try
    Screen.Cursor := crHourGlass;

    Endereco := TViaCEPHelper.BuscarEnderecoPorCEP(CEP);

    if not Endereco.Erro then
    begin
      eLogradouroNovoD.Text := Endereco.Logradouro;  // ⭐ CAMPO RENOMEADO
      eBairroNovoD.Text := Endereco.Bairro;          // ⭐ CAMPO RENOMEADO
      eCidadeNovoD.Text := Endereco.Localidade;      // ⭐ CAMPO RENOMEADO
      cbEstadoNovoD.Text := Endereco.UF;             // ⭐ CAMPO RENOMEADO
      eNumeroEnderecoNovoD.SetFocus;
    end
    else
    begin
      ShowMessage('CEP não encontrado!');
      meCEPNovoD.SetFocus;
    end;

  finally
    Screen.Cursor := crDefault;
  end;
end;


procedure TFormHomeC.BuscarComercios(const Termo: string);
var
  Comercios: TObjectList<TComercio>;
  Comercio: TComercio;
  EstaAberto: Boolean;
  Index: Integer;
begin
  if not FInicializado or not Assigned(FController) then
    Exit;

  if Trim(Termo) = '' then
  begin
    PopularRestaurantes(FCategoriaSelecionada);
    Exit;
  end;

  try
    LimparCardsRestaurantes;
    Screen.Cursor := crHourGlass;
    try
      Comercios := FController.BuscarComercios(Termo);

      if Assigned(Comercios) then
      try
        if Comercios.Count = 0 then
        begin
          ExibirMensagemNenhumResultado;
        end
        else
        begin
          Index := 0;
          for Comercio in Comercios do
          begin
            if Assigned(Comercio) then
            begin
              EstaAberto := ComercioEstaAberto(Comercio.HorarioAbertura, Comercio.HorarioFechamento);
              AdicionarCardComercio(Comercio, EstaAberto, Index);
              Inc(Index);
            end;
          end;
        end;
      finally
        Comercios.Free;
      end;

    finally
      Screen.Cursor := crDefault;
    end;

  except
    on E: Exception do
    begin
      Screen.Cursor := crDefault;
      ShowMessage('Erro ao buscar: ' + E.Message);
    end;
  end;
end;

procedure TFormHomeC.LimparBusca;
begin
  eBuscaMain.Text := '';
  FUltimaBusca := '';
  FBuscaTimer.Enabled := False;
  eBuscaMain.SetFocus;
  PopularRestaurantes(FCategoriaSelecionada);
end;

procedure TFormHomeC.ExcluirEndereco(IdEndereco: Integer);
begin
  try
    if FEnderecoController.ExcluirEndereco(IdEndereco) then
    begin
      ShowMessage('Endereço excluído com sucesso!');
      CarregarEnderecos;
      CarregarEnderecosNoComboBox;
    end
    else
      ShowMessage('Erro ao excluir endereço!');
  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message);
  end;
end;


procedure TFormHomeC.ExcluirPagamento(IdPagamento: Integer);
begin
  try
    if FPagamentoController.ExcluirPagamento(IdPagamento) then
    begin
      ShowMessage('✅ Forma de pagamento excluída com sucesso!');
      CarregarPagamentos; // Recarregar lista
    end
    else
      ShowMessage('❌ Não foi possível excluir a forma de pagamento!');
  except
    on E: Exception do
      ShowMessage('Erro ao excluir: ' + E.Message);
  end;
end;

procedure TFormHomeC.ExibirDadosPerfilVisualizacao(Cliente: TCliente);
begin
  // Dados pessoais
  lblNomeDV.Caption := Cliente.NomeUser;
  lblEmailDV.Caption := Cliente.EmailUser;
  lblCPFDV.Caption := Cliente.CpfUser;
  lblTelefoneDV.Caption := Cliente.NPhoneUser;
  CarregarEnderecos;
end;

procedure TFormHomeC.ExibirMensagemNenhumResultado;
var
  pMensagem: TPanel;
  lblMensagem, lblDica: TLabel;
  LarguraCard: Integer;
begin
  LarguraCard := scbxRestaurantes.ClientWidth - (FMargemLateral * 2);
  if LarguraCard < 200 then
    LarguraCard := 200;

  pMensagem := TPanel.Create(scbxRestaurantes);
  pMensagem.Parent := scbxRestaurantes;
  pMensagem.Left := FMargemLateral;
  pMensagem.Top := FCardSpacing;
  pMensagem.Width := LarguraCard;
  pMensagem.Height := 180;
  pMensagem.BevelOuter := bvNone;
  pMensagem.Color := clWhite;
  pMensagem.BorderStyle := bsSingle;

  lblMensagem := TLabel.Create(pMensagem);
  lblMensagem.Parent := pMensagem;
  lblMensagem.Caption := '😕 Nenhum resultado encontrado';
  lblMensagem.Font.Name := 'Segoe UI';
  lblMensagem.Font.Size := 13;
  lblMensagem.Font.Style := [fsBold];
  lblMensagem.Font.Color := clBlack;
  lblMensagem.Alignment := taCenter;
  lblMensagem.Left := 0;
  lblMensagem.Top := 50;
  lblMensagem.Width := pMensagem.Width;

  lblDica := TLabel.Create(pMensagem);
  lblDica.Parent := pMensagem;
  lblDica.Caption := 'Tente buscar por outro termo ou categoria';
  lblDica.Font.Name := 'Segoe UI';
  lblDica.Font.Size := 10;
  lblDica.Font.Color := clBlack;
  lblDica.Alignment := taCenter;
  lblDica.Left := 0;
  lblDica.Top := 85;
  lblDica.Width := pMensagem.Width;
end;

procedure TFormHomeC.ExibirMensagemSemEnderecos;
var
  pMensagem: TPanel;
  lblMensagem: TLabel;
begin
  pMensagem := TPanel.Create(scbxEnderecos);
  pMensagem.Parent := scbxEnderecos;
  pMensagem.Left := 10;
  pMensagem.Top := 10;
  pMensagem.Width := scbxEnderecos.ClientWidth - 20;
  pMensagem.Height := 100;
  pMensagem.BevelOuter := bvNone;
  pMensagem.Color := clBlack;
  pMensagem.Anchors := [akLeft, akTop, akRight];

  lblMensagem := TLabel.Create(pMensagem);
  lblMensagem.Parent := pMensagem;
  lblMensagem.Caption := '📍 Nenhum endereço cadastrado' + #13#10 +
                         'Clique em "Adicionar Endereço" para cadastrar';
  lblMensagem.Font.Name := 'Segoe UI';
  lblMensagem.Font.Size := 10;
  lblMensagem.Font.Color := clBlack;
  lblMensagem.Alignment := taCenter;
  lblMensagem.Layout := tlCenter;
  lblMensagem.WordWrap := True;
  lblMensagem.Align := alClient;
end;

procedure TFormHomeC.ExibirMensagemSemPagamentos;
var
  pMensagem: TPanel;
  lblMensagem: TLabel;
begin
  pMensagem := TPanel.Create(scbxPagamentosE);
  pMensagem.Parent := scbxPagamentosE;
  pMensagem.Left := 10;
  pMensagem.Top := 10;
  pMensagem.Width := scbxPagamentosE.ClientWidth - 20;
  pMensagem.Height := 100;
  pMensagem.BevelOuter := bvNone;
  pMensagem.Color := $00F5F5F5;
  pMensagem.Anchors := [akLeft, akTop, akRight];

  lblMensagem := TLabel.Create(pMensagem);
  lblMensagem.Parent := pMensagem;
  lblMensagem.Caption :=
    '💳 Nenhuma forma de pagamento cadastrada' + #13#10#13#10 +
    'Clique em "Adicionar Forma de Pagamento" para cadastrar';
  lblMensagem.Font.Name := 'Segoe UI';
  lblMensagem.Font.Size := 10;
  lblMensagem.Font.Color := $00808080;
  lblMensagem.Alignment := taCenter;
  lblMensagem.Layout := tlCenter;
  lblMensagem.WordWrap := True;
  lblMensagem.Align := alClient;
end;

procedure TFormHomeC.iButton1Click(Sender: TObject);
begin
  if pBarraMenuLeft.Width = 57 then
  begin
    pBarraMenuLeft.Width := 300;
    pBarraMenuLeft.Height := 1000;
  end
  else
  begin
    pBarraMenuLeft.Width := 57;
    pBarraMenuLeft.Height := 57;
  end;
end;

procedure TFormHomeC.iButton2Click(Sender: TObject);
begin
  pcMain.ActivePageIndex:=1;
end;

procedure TFormHomeC.iButton3Click(Sender: TObject);
begin
  pcMain.ActivePageIndex:=3;
end;

procedure TFormHomeC.iButton4Click(Sender: TObject);
begin
  pcMain.ActivePageIndex:=2;
  pcperfil.ActivePageIndex:=0;
end;

procedure TFormHomeC.iButtonBackAlterarSenhaClick(Sender: TObject);
begin
  VoltarParaLojas;
end;

procedure TFormHomeC.iButtonBackCommClick(Sender: TObject);
begin
  if MessageDlg('Deseja voltar? Os itens no carrinho serão mantidos.',
                mtConfirmation,
                [mbYes, mbNo],
                0) = mrYes then
  begin
    VoltarParaLojas;
  end;
end;

procedure TFormHomeC.iButtonBackEnderecosEClick(Sender: TObject);
begin
  CancelarEdicaoEndereco;
end;

procedure TFormHomeC.iButtonBackPerfilClick(Sender: TObject);
begin
  pcPerfil.ActivePageIndex:=0;
  LimparCamposAlterarSenha;
end;

procedure TFormHomeC.iButtonLeaveClick(Sender: TObject);
begin
  ShowMessage('Encerrando aplicação ...');
  Close;
end;

procedure TFormHomeC.iCarrinhoClick(Sender: TObject);
begin
pcMain.ActivePageIndex:=4;
end;

end.
