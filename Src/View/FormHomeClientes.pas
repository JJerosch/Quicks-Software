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
  ProdutoModel, ProdutoViewHelper, BCrypt, CarrinhoModel, CarrinhoHelper,
  FormaPagamentoClienteModel, FormaPagamentoClienteController, PagamentoCardPanel;

type
TCardEventHandler = class
  private
    FFormSelecao: TForm;
    FTipoSelecionado: Integer;
  public
    constructor Create(AFormSelecao: TForm);
    procedure OnCardClick(Sender: TObject);
    procedure OnCardMouseEnter(Sender: TObject);
    procedure OnCardMouseLeave(Sender: TObject);
    property TipoSelecionado: Integer read FTipoSelecionado write FTipoSelecionado;
  end;

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
    scbxMainCarrinho: TScrollBox;
    pEnderecoCarrinho: TPanel;
    lblEnderecoDesc: TLabel;
    lblEnderecoAtualCarrinho: TLabel;
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
    lblTaxaDesc: TLabel;
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
    scbxMainEnderecosE: TScrollBox;
    pEnderecosE: TPanel;
    scbxEnderecosE: TScrollBox;
    pHeaderEnderecosE: TPanel;
    lblPerfilTitleEnderecosE: TLabel;
    iButtonBackEnderecosE: TImage;
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
    pUserHeader: TPanel;
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
    pEnderecoPerfil: TPanel;
    lblEndereco: TLabel;
    pButtonEnderecoNovoPerfil: TPanel;
    cbEnderecosPerfil: TComboBox;
    pPagamentosPerfil: TPanel;
    lblPagamentos: TLabel;
    pButtonAdicionarPagamento: TPanel;
    cbPagamentosPerfil: TComboBox;
    lblCategoriasL: TLabel;
    pComerciosL: TPanel;
    scbxComerciosL: TScrollBox;
    lblComerciosL: TLabel;
    tsProdutoSelec: TTabSheet;
    scbxProdutoSelec: TScrollBox;
    pProdutoSelecInfo: TPanel;
    pHeaderProdutoSelec: TPanel;
    lblNomeProdutoSelec: TLabel;
    iButtonBackProdutoSelec: TImage;
    lblPrecoProdutoSelec: TLabel;
    lblCategoriaProdutoSelec: TLabel;
    lblDescricaoProdutoSelec: TLabel;
    pControlesQuantidade: TPanel;
    btnMenosQtd: TPanel;
    mObservacaoProdutoSelec: TMemo;
    btnMaisQtd: TPanel;
    eQuantidadeProdutoSelec: TEdit;
    lblSubtotalProdutoSelec: TLabel;
    Panel1: TPanel;
    lblSubtotalProdutoSelecD: TLabel;
    pButtonLimparCarrinho: TPanel;

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
    procedure pButtonAdicionarPagamentoClick(Sender: TObject);
    procedure lblButton5Click(Sender: TObject);
    procedure cbPagamentosPerfilChange(Sender: TObject);
    procedure cbEnderecosPerfilChange(Sender: TObject);
    procedure cbEnderecosChange(Sender: TObject);
    procedure pSalvarClick(Sender: TObject);
    procedure pButtonConfirmarAlterarSenhaClick(Sender: TObject);
    procedure pButtonCancelarAlterarSenhaClick(Sender: TObject);
    procedure iButtonBackLojasClick(Sender: TObject);
    procedure btnMenosQtdClick(Sender: TObject);
    procedure btnMaisQtdClick(Sender: TObject);
    procedure eQuantidadeProdutoSelecChange(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure pButtonLimparCarrinhoClick(Sender: TObject);

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
    FCategoriaSelecionadaLojas: String;
    FProdutoSelecionado: TProduto;
    FCarrinho: TObjectList<TItemCarrinho>;
    FTaxaEntregaAtual: Currency;

    procedure SalvarDadosPessoais;
    procedure AlterarSenha;

    procedure AbrirCadastroCartao(IdCliente: Integer);
    procedure AbrirCadastroPix(IdCliente: Integer);
    procedure AbrirCadastroTransferencia(IdCliente: Integer);

    procedure CarregarPagamentos;
    procedure OnPagamentoCardEditar(Sender: TObject);
    procedure EditarCartao(Cartao: TPagamentoCartao);
    procedure CarregarPagamentosNoComboBox;
    procedure EditarPix(Pix: TPagamentoPix);
    procedure EditarTransferencia(Transferencia: TPagamentoTransferencia);
    procedure OnPagamentoCardExcluir(Sender: TObject);
    procedure OnPagamentoCardDefinirPrincipal(Sender: TObject);
    procedure ExcluirPagamento(IdPagamento: Integer);
    procedure DefinirPagamentoPrincipal(IdPagamento: Integer);
    procedure ExibirMensagemSemPagamentos;
    procedure AtualizarCardsPagamentoPrincipal;

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
    procedure PopularCategoriasLojas;
    procedure PopularRestaurantesLojas(const Categoria: String = '');
    procedure OnCategoriaClickLojas(const Categoria: string);
    procedure OnRestauranteClickLojas(IdComercio: Integer; const NomeComercio: string);
    procedure LimparCardsRestaurantesLojas;
    procedure ExibirMensagemNenhumResultadoLojas;
    procedure AdicionarCardComercioLojas(Comercio: TComercio; EstaAberto: Boolean; Index: Integer; CardWidth: Integer);
    procedure ConfigurarLayoutLojas;

    procedure CarregarDadosPerfil;
    procedure ExibirDadosPerfilVisualizacao(Cliente: TCliente);
    procedure CarregarDadosPerfilEdicao;
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

    procedure AbrirTelaProduto(IdProduto: Integer; const NomeProduto: string; Preco: Currency);
    procedure FecharTelaProduto;
    procedure AtualizarSubtotalProduto;
    procedure ValidarEstabelecimentoCarrinho(IdComercio: Integer; const NomeComercio: string);

    procedure InicializarCarrinho;
    procedure AdicionarAoCarrinho(IdProduto: Integer; const NomeProduto: string; Preco: Currency; Quantidade: Integer; const Observacao: string = '');
    procedure RemoverDoCarrinho(IdProduto: Integer; const Observacao: String = '');
    procedure AtualizarQuantidadeCarrinho(IdProduto: Integer; const Observacao: String; NovaQuantidade: Integer);
    procedure OnCarrinhoItemChange(IdProduto: Integer; const Observacao: String; NovaQuantidade: Integer);
    procedure OnCarrinhoItemRemover(IdProduto: Integer; const Observacao: String);
    function ObterItemCarrinho(IdProduto: Integer; const Observacao: String = ''): TItemCarrinho;
    procedure AtualizarCardCarrinho;
    procedure AtualizarResumoCarrinho;
    procedure CarregarItensCarrinho;
    procedure LimparCarrinho;
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

procedure TFormHomeC.FecharTelaProduto;
begin
  if Assigned(FProdutoSelecionado) then
    FreeAndNil(FProdutoSelecionado);

  // Voltar para tela do comércio
  pcMain.ActivePage := tsCommSelec;
end;

procedure TFormHomeC.FormCreate(Sender: TObject);
begin
  FInicializado := False;
  FIdEnderecoSelecionado := 0;
  FIdPagamentoSelecionado := 0;
  FUltimaBusca := '';
  FCategoriaSelecionada := 'Todos';
  FCategoriaSelecionadaLojas := 'Todos';
  FIdComercioSelecionado := 0;
  FNomeComercioSelecionado := '';
  FCategoriaProdutoSelecionada := 'Todos';
  FProdutoSelecionado := nil;
  FCarrinho := nil;
  FTaxaEntregaAtual := 0;
  InicializarCarrinho;
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

procedure TFormHomeC.ConfigurarLayoutLojas;
begin
  // ⭐ Configurar scbxMainLojas
  if Assigned(scbxMainLojas) then
  begin
    scbxMainLojas.Align := alClient;
    scbxMainLojas.VertScrollBar.Tracking := True;
    scbxMainLojas.HorzScrollBar.Visible := False;
    scbxMainLojas.BorderStyle := bsNone;
    scbxMainLojas.Color := $00517CFF;
  end;

  // ⭐ Ordem dos painéis em Lojas
  if Assigned(pHeaderLojas) then
    pHeaderLojas.Align := alTop;

  if Assigned(pCategoriasL) then
  begin
    pCategoriasL.Align := alTop;
    pCategoriasL.Height := 70;
  end;

  if Assigned(scbxCategoriasL) then
  begin
    scbxCategoriasL.Align := alClient;
    scbxCategoriasL.HorzScrollBar.Visible := True;
    scbxCategoriasL.VertScrollBar.Visible := False;
  end;

  // ⭐ scbxComerciosL - Scroll VERTICAL (diferente do Main)
  if Assigned(scbxComerciosL) then
  begin
    scbxComerciosL.Align := alClient;
    scbxComerciosL.VertScrollBar.Visible := True;     // ⭐ COM scroll vertical
    scbxComerciosL.HorzScrollBar.Visible := False;    // ⭐ SEM scroll horizontal
    scbxComerciosL.VertScrollBar.Tracking := True;
    scbxComerciosL.BorderStyle := bsNone;
    scbxComerciosL.Color := $00517CFF;
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


procedure TFormHomeC.InicializarCarrinho;
begin
  if not Assigned(FCarrinho) then
    FCarrinho := TObjectList<TItemCarrinho>.Create(True);

  FTaxaEntregaAtual := 0;
  AtualizarResumoCarrinho;
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

procedure TFormHomeC.lblButton5Click(Sender: TObject);
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

  if Assigned(FProdutoSelecionado) then
    FreeAndNil(FProdutoSelecionado);

  if Assigned(FCarrinho) then
    FreeAndNil(FCarrinho);
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
      CarregarPagamentos;
      CarregarPagamentosNoComboBox;

      // ⭐ Se houver itens no carrinho, carregá-los
      if Assigned(FCarrinho) and (FCarrinho.Count > 0) then
      begin
        CarregarItensCarrinho; // Cards completos
        AtualizarResumoCarrinho;
      end;
    end
    else
    begin
      lblUserName.Caption := 'Visitante';
      lblUserId.Caption := '';
    end;

    PopularCategorias;
    PopularRestaurantes('Todos');
    PopularCategoriasLojas;
    PopularRestaurantesLojas('Todos');
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

procedure TFormHomeC.PopularCategoriasLojas;
begin
  if not Assigned(scbxCategoriasL) then
    Exit;

  try
    TCategoriaHelper.PopularScrollBoxCategorias(scbxCategoriasL, OnCategoriaClickLojas);
  except
    on E: Exception do
      ShowMessage('Erro ao carregar categorias em Lojas: ' + E.Message);
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

procedure TFormHomeC.OnCarrinhoItemChange(IdProduto: Integer; const Observacao: String; NovaQuantidade: Integer);
begin
  AtualizarQuantidadeCarrinho(IdProduto, Observacao, NovaQuantidade);
end;

procedure TFormHomeC.OnCarrinhoItemRemover(IdProduto: Integer; const Observacao: String);
begin
  RemoverDoCarrinho(IdProduto, Observacao);
end;

procedure TFormHomeC.OnCategoriaClick(const Categoria: string);
begin
  FCategoriaSelecionada := Categoria;
  TCategoriaHelper.DeselecionarTodas(scbxCategorias);
  TCategoriaHelper.SelecionarCategoria(scbxCategorias, Categoria);
  PopularRestaurantes(Categoria);
end;


procedure TFormHomeC.OnCategoriaClickLojas(const Categoria: string);
begin
  FCategoriaSelecionadaLojas := Categoria;
  TCategoriaHelper.DeselecionarTodas(scbxCategoriasL);
  TCategoriaHelper.SelecionarCategoria(scbxCategoriasL, Categoria);
  PopularRestaurantesLojas(Categoria);
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
var
  Card: TPagamentoCardPanel;
begin
  if not (Sender is TPagamentoCardPanel) then
    Exit;

  Card := TPagamentoCardPanel(Sender);

  // Confirmar com o usuário
  if MessageDlg(
    'Deseja definir esta forma de pagamento como PRINCIPAL?',
    mtConfirmation,
    [mbYes, mbNo],
    0) = mrYes then
  begin
    DefinirPagamentoPrincipal(Card.IdPagamento);
  end;
end;

procedure TFormHomeC.OnPagamentoCardEditar(Sender: TObject);
var
  Card: TPagamentoCardPanel;
  Pagamento: TFormaPagamentoCliente;
begin
  if not (Sender is TPagamentoCardPanel) then
    Exit;

  Card := TPagamentoCardPanel(Sender);

  try
    // Buscar o pagamento completo do banco
    Pagamento := FPagamentoController.ObterPagamento(Card.IdPagamento);

    if not Assigned(Pagamento) then
    begin
      ShowMessage('Erro ao carregar dados do pagamento!');
      Exit;
    end;

    try
      // ⭐ IDENTIFICAR O TIPO E ABRIR O FORMULÁRIO CORRETO
      case Pagamento.TipoPagamento of
        tpCartao:
          begin
            if Pagamento is TPagamentoCartao then
              EditarCartao(TPagamentoCartao(Pagamento))
            else
              ShowMessage('Erro: Tipo de pagamento incompatível!');
          end;

        tpPix:
          begin
            if Pagamento is TPagamentoPix then
              EditarPix(TPagamentoPix(Pagamento))
            else
              ShowMessage('Erro: Tipo de pagamento incompatível!');
          end;

        tpTransferencia:
          begin
            if Pagamento is TPagamentoTransferencia then
              EditarTransferencia(TPagamentoTransferencia(Pagamento))
            else
              ShowMessage('Erro: Tipo de pagamento incompatível!');
          end;
      else
        ShowMessage('Tipo de pagamento não suportado para edição!');
      end;

    finally
      Pagamento.Free;
    end;

  except
    on E: Exception do
      ShowMessage('Erro ao editar: ' + E.Message);
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
begin
  AbrirTelaProduto(IdProduto, NomeProduto, Preco);
end;

procedure TFormHomeC.OnRestauranteClick(IdComercio: Integer;
  const NomeComercio: string);
begin
  AbrirCardapio(IdComercio, NomeComercio);
end;

procedure TFormHomeC.OnRestauranteClickLojas(IdComercio: Integer;
  const NomeComercio: string);
begin
  AbrirCardapio(IdComercio, NomeComercio);
end;

procedure TFormHomeC.Panel1Click(Sender: TObject);
var
  Quantidade: Integer;
  Observacao: String;
begin
  if not Assigned(FProdutoSelecionado) then
  begin
    ShowMessage('❌ Erro: Produto não carregado!');
    Exit;
  end;

  // Validar quantidade
  if not TryStrToInt(eQuantidadeProdutoSelec.Text, Quantidade) or (Quantidade < 1) then
  begin
    ShowMessage('⚠️ Quantidade inválida!');
    eQuantidadeProdutoSelec.SetFocus;
    Exit;
  end;

  Observacao := Trim(mObservacaoProdutoSelec.Text);

  try
    // Validar se pode adicionar (mesmo estabelecimento)
    ValidarEstabelecimentoCarrinho(
      FProdutoSelecionado.IdComercio,
      FNomeComercioSelecionado
    );

    // Adicionar ao carrinho
    AdicionarAoCarrinho(
      FProdutoSelecionado.IdProduto,
      FProdutoSelecionado.NomeProd,
      FProdutoSelecionado.PrecoVenda,
      Quantidade,
      Observacao
    );

    // Fechar tela do produto
    FecharTelaProduto;

  except
    on E: Exception do
    begin
      if E.Message <> 'CANCELADO' then
        ShowMessage('❌ Erro ao adicionar: ' + E.Message);
      // Se for CANCELADO, apenas não faz nada
    end;
  end;
end;

procedure TFormHomeC.pButtonAddEnderecoClick(Sender: TObject);
begin
  pcMain.ActivePageIndex:=6; // tsEnderecoNovo (verifique o índice!)
  if pcMain.ActivePageIndex=6 then begin
    LimparCamposNovoEndereco;
  end;
end;

procedure TFormHomeC.pButtonAdicionarPagamentoClick(Sender: TObject);
var
  FormSelecao: TForm;
  pFundo, pCartao, pPix, pTransferencia, pBotoes: TPanel;
  lblTitulo, lblSubtitulo: TLabel;
  btnCancelar: TButton;
  EventHandler: TCardEventHandler;
  Qr: TFDQuery;
  IdCliente: Integer;

  function CriarCardOpcao(Parent: TWinControl; Top: Integer;
    const Icone, Titulo, Descricao: String; Tag: Integer): TPanel;
  var
    lblTitulo, lblDesc, lblIcone: TLabel;
  begin
    Result := TPanel.Create(Parent);
    Result.Parent := Parent;
    Result.Left := 30;
    Result.Top := Top;
    Result.Width := 540;
    Result.Height := 85;
    Result.BevelOuter := bvNone;
    Result.Color := clWhite;
    Result.Cursor := crHandPoint;
    Result.Tag := Tag;
    Result.ParentBackground := False;
    Result.BorderStyle := bsSingle;
    Result.BorderWidth := 1;

    Result.OnClick := EventHandler.OnCardClick;
    Result.OnMouseEnter := EventHandler.OnCardMouseEnter;
    Result.OnMouseLeave := EventHandler.OnCardMouseLeave;

    // Ícone
    lblIcone := TLabel.Create(Result);
    lblIcone.Parent := Result;
    lblIcone.Caption := Icone;
    lblIcone.Font.Name := 'Segoe UI';
    lblIcone.Font.Size := 24;
    lblIcone.Left := 20;
    lblIcone.Top := 20;
    lblIcone.Cursor := crHandPoint;
    lblIcone.Transparent := True;
    lblIcone.OnClick := EventHandler.OnCardClick;

    // Título
    lblTitulo := TLabel.Create(Result);
    lblTitulo.Parent := Result;
    lblTitulo.Caption := Titulo;
    lblTitulo.Font.Name := 'Segoe UI';
    lblTitulo.Font.Size := 12;
    lblTitulo.Font.Style := [fsBold];
    lblTitulo.Font.Color := $00333333;
    lblTitulo.Left := 75;
    lblTitulo.Top := 20;
    lblTitulo.Cursor := crHandPoint;
    lblTitulo.Transparent := True;
    lblTitulo.OnClick := EventHandler.OnCardClick;

    // Descrição
    lblDesc := TLabel.Create(Result);
    lblDesc.Parent := Result;
    lblDesc.Caption := Descricao;
    lblDesc.Font.Name := 'Segoe UI';
    lblDesc.Font.Size := 9;
    lblDesc.Font.Color := $00808080;
    lblDesc.Left := 75;
    lblDesc.Top := 48;
    lblDesc.Cursor := crHandPoint;
    lblDesc.Transparent := True;
    lblDesc.OnClick := EventHandler.OnCardClick;
  end;

begin
  // ⭐ BUSCAR id_clie PRIMEIRO
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

  FormSelecao := TForm.Create(nil);
  EventHandler := TCardEventHandler.Create(FormSelecao);
  try
    FormSelecao.BorderStyle := bsDialog;
    FormSelecao.Position := poScreenCenter;
    FormSelecao.Width := 600;
    FormSelecao.Height := 520;
    FormSelecao.Caption := 'Adicionar Forma de Pagamento';
    FormSelecao.Color := $00F5F5F5;
    FormSelecao.Font.Name := 'Segoe UI';

    // Painel de fundo
    pFundo := TPanel.Create(FormSelecao);
    pFundo.Parent := FormSelecao;
    pFundo.Align := alClient;
    pFundo.BevelOuter := bvNone;
    pFundo.Color := $00F5F5F5;
    pFundo.ParentBackground := False;

    // Título
    lblTitulo := TLabel.Create(pFundo);
    lblTitulo.Parent := pFundo;
    lblTitulo.Caption := '💰 Adicionar Forma de Pagamento';
    lblTitulo.Font.Name := 'Segoe UI';
    lblTitulo.Font.Size := 16;
    lblTitulo.Font.Style := [fsBold];
    lblTitulo.Font.Color := $00517CFF;
    lblTitulo.Left := 30;
    lblTitulo.Top := 25;
    lblTitulo.Transparent := True;

    // Subtítulo
    lblSubtitulo := TLabel.Create(pFundo);
    lblSubtitulo.Parent := pFundo;
    lblSubtitulo.Caption := 'Escolha o tipo de pagamento que deseja cadastrar:';
    lblSubtitulo.Font.Name := 'Segoe UI';
    lblSubtitulo.Font.Size := 10;
    lblSubtitulo.Font.Color := $00666666;
    lblSubtitulo.Left := 30;
    lblSubtitulo.Top := 60;
    lblSubtitulo.Transparent := True;

    // Cards de opções
    pCartao := CriarCardOpcao(pFundo, 100,
      '💳',
      'Cartão de Crédito ou Débito',
      'Visa, Mastercard, Elo, Amex, Hipercard e outros',
      1
    );

    pPix := CriarCardOpcao(pFundo, 195,
      '🔄',
      'Pix',
      'CPF, CNPJ, Email, Telefone ou Chave Aleatória',
      2
    );

    pTransferencia := CriarCardOpcao(pFundo, 290,
      '🏦',
      'Transferência Bancária',
      'TED ou DOC - Conta Corrente ou Poupança',
      3
    );

    // Painel de botões
    pBotoes := TPanel.Create(pFundo);
    pBotoes.Parent := pFundo;
    pBotoes.Left := 0;
    pBotoes.Top := 400;
    pBotoes.Width := 600;
    pBotoes.Height := 80;
    pBotoes.BevelOuter := bvNone;
    pBotoes.Color := $00EEEEEE;
    pBotoes.Align := alBottom;

    // Botão Cancelar
    btnCancelar := TButton.Create(pBotoes);
    btnCancelar.Parent := pBotoes;
    btnCancelar.Caption := 'Cancelar';
    btnCancelar.Left := 430;
    btnCancelar.Top := 20;
    btnCancelar.Width := 140;
    btnCancelar.Height := 40;
    btnCancelar.Font.Name := 'Segoe UI';
    btnCancelar.Font.Size := 10;
    btnCancelar.Font.Style := [fsBold];
    btnCancelar.Cursor := crHandPoint;
    btnCancelar.ModalResult := mrCancel;

    // Exibir e processar
    if FormSelecao.ShowModal = mrOk then
    begin
      case EventHandler.TipoSelecionado of
        1: AbrirCadastroCartao(IdCliente);        // ⭐ PASSAR IdCliente
        2: AbrirCadastroPix(IdCliente);           // ⭐ PASSAR IdCliente
        3: AbrirCadastroTransferencia(IdCliente); // ⭐ PASSAR IdCliente
      else
        ShowMessage('Nenhuma opção foi selecionada.');
      end;
    end;

  finally
    EventHandler.Free;
    FormSelecao.Free;
  end;
end;

procedure TFormHomeC.pButtonAlterarSenhaVClick(Sender: TObject);
begin
  pcPerfil.ActivePageIndex:=2;
end;

procedure TFormHomeC.pButtonCancelarAlterarSenhaClick(Sender: TObject);
begin
  pcPerfil.ActivePageIndex := 0; // tsVisualizarPefil
  LimparCamposAlterarSenha;
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

procedure TFormHomeC.pButtonConfirmarAlterarSenhaClick(Sender: TObject);
begin
  AlterarSenha;
end;


procedure TFormHomeC.pButtonEditarDadosClick(Sender: TObject);
begin
  pcPerfil.ActivePageIndex:=1;
  CarregarDadosPerfilEdicao;
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

procedure TFormHomeC.pButtonLimparCarrinhoClick(Sender: TObject);
begin
  LimparCarrinho;
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

procedure TFormHomeC.PopularRestaurantesLojas(const Categoria: String);
var
  Comercios: TObjectList<TComercio>;
  Comercio: TComercio;
  EstaAberto: Boolean;
  Index: Integer;
  CardWidth: Integer;
begin
  if not FInicializado or not Assigned(FController) then
  begin
    InicializarController;
    if not FInicializado then
      Exit;
  end;

  try
    LimparCardsRestaurantesLojas;
    Screen.Cursor := crHourGlass;

    try
      Comercios := FController.ListarComerciosDisponiveis(False);

      if not Assigned(Comercios) then
        Exit;

      try
        if Comercios.Count = 0 then
        begin
          ExibirMensagemNenhumResultadoLojas;
          Exit;
        end;

        // Calcular largura do card
        CardWidth := scbxComerciosL.ClientWidth - (FMargemLateral * 2);
        if CardWidth < 200 then
          CardWidth := 200;

        Index := 0;
        for Comercio in Comercios do
        begin
          if Assigned(Comercio) then
          begin
            if (Categoria = 'Todos') or (Categoria = '') or
               (AnsiUpperCase(Comercio.Categoria) = AnsiUpperCase(Categoria)) then
            begin
              EstaAberto := ComercioEstaAberto(Comercio.HorarioAbertura, Comercio.HorarioFechamento);
              AdicionarCardComercioLojas(Comercio, EstaAberto, Index, CardWidth);
              Inc(Index);
            end;
          end;
        end;

        if Index = 0 then
          ExibirMensagemNenhumResultadoLojas
        else
        begin
          scbxComerciosL.Invalidate;
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
      ShowMessage('Erro ao popular lojas: ' + E.Message);
    end;
  end;
end;


procedure TFormHomeC.pSalvarClick(Sender: TObject);
begin
  SalvarDadosPessoais;
  pcPerfil.ActivePageIndex:=0;
end;

procedure TFormHomeC.RemoverDoCarrinho(IdProduto: Integer; const Observacao: String = '');
var
  I: Integer;
begin
  if not Assigned(FCarrinho) then
    Exit;

  // ⭐ MUDANÇA: Remover considerando observação também
  for I := FCarrinho.Count - 1 downto 0 do
  begin
    if FCarrinho[I].EhMesmoItem(IdProduto, Observacao) then
    begin
      FCarrinho.Delete(I);
      Break;
    end;
  end;

  // Recarregar visualização
  CarregarItensCarrinho;
  AtualizarResumoCarrinho;
  AtualizarCardCarrinho;

  ShowMessage('✅ Item removido do carrinho!');
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
var
  Cliente: TCliente;
begin
  // Validações
  if Trim(eNomeDE.Text) = '' then
  begin
    ShowMessage('⚠️ Nome não pode estar vazio!');
    eNomeDE.SetFocus;
    Exit;
  end;

  if Trim(eEmailDE.Text) = '' then
  begin
    ShowMessage('⚠️ Email não pode estar vazio!');
    eEmailDE.SetFocus;
    Exit;
  end;

  // Validar formato de email
  if not (Pos('@', eEmailDE.Text) > 0) then
  begin
    ShowMessage('⚠️ Email inválido!');
    eEmailDE.SetFocus;
    Exit;
  end;

  if Trim(meTelefoneDE.Text) = '' then
  begin
    ShowMessage('⚠️ Telefone não pode estar vazio!');
    meTelefoneDE.SetFocus;
    Exit;
  end;

  try
    Cliente := TCliente.Create;
    try
      Cliente.IdUser := FIdUsuario;
      Cliente.NomeUser := Trim(eNomeDE.Text);
      Cliente.EmailUser := Trim(eEmailDE.Text);
      Cliente.CpfUser := Trim(meCPFDE.Text);
      Cliente.NPhoneUser := Trim(meTelefoneDE.Text);

      // Atualizar no banco
      if FPerfilController.AtualizarPerfil(Cliente) then
      begin
        ShowMessage('✅ Dados atualizados com sucesso!');

        // Atualizar nome no header
        FNomeUsuario := Cliente.NomeUser;
        lblUserName.Caption := FNomeUsuario;

        // Voltar para visualização
        pcPerfil.ActivePageIndex := 0; // tsVisualizarPefil

        // Recarregar dados na visualização
        ExibirDadosPerfilVisualizacao(Cliente);
      end
      else
      begin
        ShowMessage('❌ Erro ao atualizar dados!');
      end;

    finally
      Cliente.Free;
    end;

  except
    on E: Exception do
      ShowMessage('Erro ao salvar: ' + E.Message);
  end;
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

procedure TFormHomeC.ValidarEstabelecimentoCarrinho(IdComercio: Integer;
  const NomeComercio: string);
var
  Item: TItemCarrinho;
begin
  // Se o carrinho estiver vazio, pode adicionar
  if not Assigned(FCarrinho) or (FCarrinho.Count = 0) then
  begin
    FIdComercioSelecionado := IdComercio;
    FNomeComercioSelecionado := NomeComercio;
    Exit;
  end;

  // Se já tem itens, verificar se são do mesmo comércio
  Item := FCarrinho.First;

  if Item.IdComercio <> IdComercio then
  begin
    // Comércios diferentes - perguntar se quer limpar
    if MessageDlg(
      '⚠️ Seu carrinho possui itens de outro estabelecimento!' + #13#10#13#10 +
      'Estabelecimento atual: ' + Item.NomeComercio + #13#10 +
      'Novo estabelecimento: ' + NomeComercio + #13#10#13#10 +
      '⚠️ Se continuar, o carrinho será esvaziado.' + #13#10#13#10 +
      'Deseja limpar o carrinho e adicionar este produto?',
      mtWarning,
      [mbYes, mbNo],
      0) = mrYes then
    begin
      // Limpar carrinho e permitir adicionar
      LimparCarrinho;
      FIdComercioSelecionado := IdComercio;
      FNomeComercioSelecionado := NomeComercio;
    end
    else
    begin
      // Cancelar operação
      raise Exception.Create('CANCELADO');
    end;
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

procedure TFormHomeC.CarregarDadosPerfilEdicao;
var
  Cliente: TCliente;
begin
  try
    Cliente := FPerfilController.ObterPerfil(FIdUsuario);

    if Assigned(Cliente) then
    begin
      try
        // Preencher campos de edição
        eNomeDE.Text := Cliente.NomeUser;
        eEmailDE.Text := Cliente.EmailUser;
        meCPFDE.Text := Cliente.CpfUser;
        meTelefoneDE.Text := Cliente.NPhoneUser;

        // CPF não pode ser editado
        meCPFDE.ReadOnly := True;
        meCPFDE.Color := clBtnFace;

      finally
        Cliente.Free;
      end;
    end
    else
    begin
      ShowMessage('Erro ao carregar dados do perfil!');
    end;

  except
    on E: Exception do
      ShowMessage('Erro ao carregar dados: ' + E.Message);
  end;
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
  // Verificações de segurança
  if not Assigned(FEnderecoController) then
  begin
    ShowMessage('Erro: Controller de endereços não foi criado!');
    Exit;
  end;

  // ⭐ Verificar se PELO MENOS UM dos ComboBoxes existe
  if not Assigned(cbEnderecosPerfil) and not Assigned(cbEnderecos) then
  begin
    ShowMessage('Erro: Nenhum ComboBox de endereços existe!');
    Exit;
  end;

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

  // ⭐ Limpar AMBOS os ComboBoxes (se existirem)
  if Assigned(cbEnderecosPerfil) then
  begin
    cbEnderecosPerfil.Clear;
    cbEnderecosPerfil.OnChange := nil;
  end;

  if Assigned(cbEnderecos) then
  begin
    cbEnderecos.Clear;
    cbEnderecos.OnChange := nil;
  end;

  try
    Enderecos := FEnderecoController.ListarEnderecos(IdCliente);

    if not Assigned(Enderecos) or (Enderecos.Count = 0) then
    begin
      // Desabilitar AMBOS se não houver endereços
      if Assigned(cbEnderecosPerfil) then
        cbEnderecosPerfil.Enabled := False;

      if Assigned(cbEnderecos) then
        cbEnderecos.Enabled := False;

      Exit;
    end;

    try
      IdxPrincipal := -1;

      for Endereco in Enderecos do
      begin
        if Assigned(Endereco) then
        begin
          // ⭐ Adicionar em cbEnderecosPerfil (Perfil)
          if Assigned(cbEnderecosPerfil) then
          begin
            cbEnderecosPerfil.Items.AddObject(
              Format('%s - %s, %s', [Endereco.Apelido, Endereco.Logradouro, Endereco.Numero]),
              TObject(Endereco.IdEndereco)
            );
          end;

          // ⭐ Adicionar em cbEnderecos (Menu/Carrinho)
          if Assigned(cbEnderecos) then
          begin
            cbEnderecos.Items.AddObject(
              Format('%s - %s, %s', [Endereco.Apelido, Endereco.Logradouro, Endereco.Numero]),
              TObject(Endereco.IdEndereco)
            );
          end;

          // Encontrar índice do principal
          if Endereco.Principal then
          begin
            if Assigned(cbEnderecosPerfil) then
              IdxPrincipal := cbEnderecosPerfil.Items.Count - 1;
            // cbEnderecos terá o mesmo índice
          end;
        end;
      end;

      // ⭐ Selecionar principal em AMBOS
      if Assigned(cbEnderecosPerfil) then
      begin
        if IdxPrincipal >= 0 then
          cbEnderecosPerfil.ItemIndex := IdxPrincipal
        else if cbEnderecosPerfil.Items.Count > 0 then
          cbEnderecosPerfil.ItemIndex := 0;

        cbEnderecosPerfil.Enabled := True;
      end;

      if Assigned(cbEnderecos) then
      begin
        if IdxPrincipal >= 0 then
          cbEnderecos.ItemIndex := IdxPrincipal
        else if cbEnderecos.Items.Count > 0 then
          cbEnderecos.ItemIndex := 0;

        cbEnderecos.Enabled := True;
      end;

    finally
      Enderecos.Free;
    end;

  except
    on E: Exception do
      ShowMessage('Erro ao carregar combo: ' + E.Message);
  end;

  // ⭐ Conectar OnChange de AMBOS
  if Assigned(cbEnderecosPerfil) then
    cbEnderecosPerfil.OnChange := cbEnderecosPerfilChange;

  if Assigned(cbEnderecos) then
    cbEnderecos.OnChange := cbEnderecosChange;
end;

procedure TFormHomeC.CarregarItensCarrinho;
var
  Item: TItemCarrinho;
  Card: TCarrinhoItemCard;
  Y, CardHeight, Spacing: Integer;
  FormOwner: TComponent;
begin
  if not Assigned(scbxCarrinhoItems) then
    Exit;

  // Limpar cards existentes
  TCarrinhoHelper.LimparCards(scbxCarrinhoItems);

  if not Assigned(FCarrinho) or (FCarrinho.Count = 0) then
  begin
    // Painel de mensagem "carrinho vazio"
    Exit;
  end;

  // Pegar Form como owner
  FormOwner := Self;

  CardHeight := 140; // ⭐ Aumentado para caber os botões
  Spacing := 10;
  Y := Spacing;

  // ⭐ CRIAR CARDS COM BOTÕES +/-
  for Item in FCarrinho do
  begin
    Card := TCarrinhoItemCard.CreateCard(FormOwner, Item);
    Card.Parent := scbxCarrinhoItems;
    Card.ConfigurarVisual; // ⭐ IMPORTANTE: Chamar DEPOIS de definir Parent
    Card.Top := Y;
    Card.Left := 10;
    Card.Width := scbxCarrinhoItems.ClientWidth - 20;
    Card.Anchors := [akLeft, akTop, akRight];

    // ⭐ Conectar eventos
    Card.OnQuantidadeChange := OnCarrinhoItemChange;
    Card.OnRemover := OnCarrinhoItemRemover;

    Inc(Y, Card.Height + Spacing);
  end;
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
  if not Assigned(FPagamentoController) then
  begin
    ShowMessage('Erro: Controller de pagamentos não foi criado!');
    Exit;
  end;

  if not Assigned(DM) or not DM.FDConn.Connected then
  begin
    ShowMessage('Erro: Banco de dados não conectado!');
    Exit;
  end;

  if not Assigned(scbxPagamentos) then
  begin
    ShowMessage('Erro: ScrollBox de pagamentos não existe!');
    Exit;
  end;

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

  for Y := scbxPagamentos.ControlCount - 1 downto 0 do
  begin
    if scbxPagamentos.Controls[Y] is TPagamentoCardPanel then
      scbxPagamentos.Controls[Y].Free;
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
          Card := TPagamentoCardPanel.CreateCardFromModel(Self, Pagamento);
          Card.Parent := scbxPagamentos;
          Card.Top := Y;
          Card.Left := 10;
          Card.Width := scbxPagamentos.ClientWidth - 20;
          Card.Anchors := [akLeft, akTop, akRight];
          Card.OnEditar := OnPagamentoCardEditar;
          Card.OnExcluir := OnPagamentoCardExcluir;
          Card.OnDefinirPrincipal := OnPagamentoCardDefinirPrincipal;

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

procedure TFormHomeC.CarregarPagamentosNoComboBox;
var
  Pagamentos: TObjectList<TFormaPagamentoCliente>;
  Pagamento: TFormaPagamentoCliente;
  Qr: TFDQuery;
  IdCliente: Integer;
  IdxPrincipal: Integer;
  Descricao: String;
begin
  // Verificações de segurança
  if not Assigned(FPagamentoController) then
  begin
    ShowMessage('Erro: Controller de pagamentos não foi criado!');
    Exit;
  end;

  if not Assigned(cbPagamentosPerfil) then
  begin
    ShowMessage('Erro: ComboBox de pagamentos não existe!');
    Exit;
  end;

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

  cbPagamentosPerfil.Clear;
  cbPagamentosPerfil.OnChange := nil;

  try
    Pagamentos := FPagamentoController.ListarPagamentos(IdCliente);

    if not Assigned(Pagamentos) or (Pagamentos.Count = 0) then
    begin
      cbPagamentosPerfil.Enabled := False;

      // Esconder botão se não houver pagamentos
      if Assigned(pEnderecoPerfil) then
        pEnderecoPerfil.Visible := False;

      Exit;
    end;

    try
      IdxPrincipal := -1;

      for Pagamento in Pagamentos do
      begin
        if Assigned(Pagamento) then
        begin
          // Criar descrição amigável
          if Pagamento is TPagamentoCartao then
            Descricao := Format('%s - %s **** %s',
              [Pagamento.Apelido,
               TPagamentoCartao(Pagamento).Bandeira,
               TPagamentoCartao(Pagamento).NumeroCartao])
          else if Pagamento is TPagamentoPix then
            Descricao := Format('%s - Pix: %s',
              [Pagamento.Apelido,
               TPagamentoPix(Pagamento).ChavePix])
          else if Pagamento is TPagamentoTransferencia then
            Descricao := Format('%s - %s',
              [Pagamento.Apelido,
               TPagamentoTransferencia(Pagamento).Banco])
          else
            Descricao := Pagamento.Apelido;

          cbPagamentosPerfil.Items.AddObject(
            Descricao,
            TObject(Pagamento.IdPagamento)
          );

          if Pagamento.Principal then
            IdxPrincipal := cbPagamentosPerfil.Items.Count - 1;
        end;
      end;

      if IdxPrincipal >= 0 then
        cbPagamentosPerfil.ItemIndex := IdxPrincipal
      else if cbPagamentosPerfil.Items.Count > 0 then
        cbPagamentosPerfil.ItemIndex := 0;

      cbPagamentosPerfil.Enabled := True;

      // Mostrar botão se houver pagamentos
      if Assigned(pEnderecoPerfil) then
        pEnderecoPerfil.Visible := True;

    finally
      Pagamentos.Free;
    end;

  except
    on E: Exception do
      ShowMessage('Erro ao carregar pagamentos no combo: ' + E.Message);
  end;

  cbPagamentosPerfil.OnChange := cbPagamentosPerfilChange;
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
procedure TFormHomeC.cbEnderecosChange(Sender: TObject);
var
  IdEndereco: Integer;
begin
  if cbEnderecos.ItemIndex < 0 then
    Exit;

  IdEndereco := Integer(cbEnderecos.Items.Objects[cbEnderecos.ItemIndex]);
  DefinirEnderecoPrincipal(IdEndereco);

  // ⭐ Sincronizar com cbEnderecosPerfil (Perfil)
  if Assigned(cbEnderecosPerfil) then
    cbEnderecosPerfil.ItemIndex := cbEnderecos.ItemIndex;
end;

procedure TFormHomeC.cbEnderecosPerfilChange(Sender: TObject);
var
  IdEndereco: Integer;
begin
  if cbEnderecosPerfil.ItemIndex < 0 then
    Exit;

  IdEndereco := Integer(cbEnderecosPerfil.Items.Objects[cbEnderecosPerfil.ItemIndex]);
  DefinirEnderecoPrincipal(IdEndereco);

  // ⭐ Sincronizar com cbEnderecos (Menu)
  if Assigned(cbEnderecos) then
    cbEnderecos.ItemIndex := cbEnderecosPerfil.ItemIndex;
end;


procedure TFormHomeC.cbPagamentosPerfilChange(Sender: TObject);
var
  IdPagamento: Integer;
begin
  if cbPagamentosPerfil.ItemIndex < 0 then
    Exit;

  IdPagamento := Integer(cbPagamentosPerfil.Items.Objects[cbPagamentosPerfil.ItemIndex]);
  DefinirPagamentoPrincipal(IdPagamento);
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

procedure TFormHomeC.LimparCardsRestaurantesLojas;
var
  I: Integer;
begin
  if not Assigned(scbxComerciosL) then
    Exit;

  for I := scbxComerciosL.ControlCount - 1 downto 0 do
  begin
    if scbxComerciosL.Controls[I] is TCardComercioPanel then
      scbxComerciosL.Controls[I].Free;
  end;

  scbxComerciosL.VertScrollBar.Position := 0;
end;

procedure TFormHomeC.LimparCarrinho;
begin
  if not Assigned(FCarrinho) then
    Exit;

  // Perguntar confirmação se houver itens
  if FCarrinho.Count > 0 then
  begin
    if MessageDlg(
      '🗑️ Deseja realmente limpar o carrinho?' + #13#10#13#10 +
      'Todos os ' + IntToStr(FCarrinho.Count) + ' itens serão removidos.',
      mtConfirmation,
      [mbYes, mbNo],
      0) = mrNo then
      Exit;
  end;

  // Limpar lista
  FCarrinho.Clear;

  // Resetar informações do comércio
  FTaxaEntregaAtual := 0;
  FIdComercioSelecionado := 0;
  FNomeComercioSelecionado := '';

  // Atualizar visualizações
  CarregarItensCarrinho;
  AtualizarResumoCarrinho;
  AtualizarCardCarrinho;

  ShowMessage('✅ Carrinho limpo com sucesso!');
end;


procedure TFormHomeC.meCEPNovoDExit(Sender: TObject);
begin
  if Trim(meCEPNovoD.Text) <> '' then
    BuscarCEPNovoEndereco;
end;

procedure TFormHomeC.AdicionarAoCarrinho(IdProduto: Integer; const NomeProduto: string;
    Preco: Currency; Quantidade: Integer; const Observacao: string = '');
var
  ItemExistente: TItemCarrinho;
  NovoItem: TItemCarrinho;
  Qr: TFDQuery;
  ObservacaoTrimmed: String;
begin
  if not Assigned(FCarrinho) then
    InicializarCarrinho;

  ObservacaoTrimmed := Trim(Observacao);

  // ⭐ MUDANÇA: Buscar considerando observação também
  ItemExistente := ObterItemCarrinho(IdProduto, ObservacaoTrimmed);

  if Assigned(ItemExistente) then
  begin
    // ⭐ Item já existe (mesmo produto + mesma observação) - SOMAR quantidade
    ItemExistente.Quantidade := ItemExistente.Quantidade + Quantidade;

    ShowMessage(
      '✅ Quantidade atualizada!' + #13#10#13#10 +
      '📦 ' + NomeProduto + #13#10 +
      '🔢 Nova quantidade: ' + IntToStr(ItemExistente.Quantidade) + #13#10 +
      '💰 Subtotal: R$ ' + FormatFloat('#,##0.00', ItemExistente.Subtotal)
    );
  end
  else
  begin
    // ⭐ Item novo (produto diferente OU observação diferente) - CRIAR novo

    // Buscar informações do comércio (se ainda não tem)
    if FIdComercioSelecionado > 0 then
    begin
      Qr := TFDQuery.Create(nil);
      try
        Qr.Connection := DM.FDConn;
        Qr.SQL.Text :=
          'SELECT nome_comercio, taxa_entrega_base ' +
          'FROM comercios WHERE id_comercio = :id';
        Qr.ParamByName('id').AsInteger := FIdComercioSelecionado;
        Qr.Open;

        if not Qr.IsEmpty then
        begin
          FTaxaEntregaAtual := Qr.FieldByName('taxa_entrega_base').AsCurrency;

          // Atualizar nome do comércio se ainda não tiver
          if Trim(FNomeComercioSelecionado) = '' then
            FNomeComercioSelecionado := Qr.FieldByName('nome_comercio').AsString;
        end;
      finally
        Qr.Free;
      end;
    end;

    // Criar novo item
    NovoItem := TItemCarrinho.Create;
    NovoItem.IdProduto := IdProduto;
    NovoItem.NomeProduto := NomeProduto;
    NovoItem.Preco := Preco;
    NovoItem.Quantidade := Quantidade;
    NovoItem.IdComercio := FIdComercioSelecionado;
    NovoItem.NomeComercio := FNomeComercioSelecionado;
    NovoItem.Observacao := ObservacaoTrimmed;

    FCarrinho.Add(NovoItem);

    ShowMessage(
      '✅ Item adicionado ao carrinho!' + #13#10#13#10 +
      '📦 ' + NomeProduto + #13#10 +
      '🔢 Quantidade: ' + IntToStr(Quantidade) + #13#10 +
      '💰 Subtotal: R$ ' + FormatFloat('#,##0.00', NovoItem.Subtotal)
    );
  end;

  // Atualizar resumo
  AtualizarResumoCarrinho;
  AtualizarCardCarrinho;
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

procedure TFormHomeC.AdicionarCardComercioLojas(Comercio: TComercio; EstaAberto: Boolean; Index: Integer; CardWidth: Integer);
var
  Card: TCardComercioPanel;
  Horario, Taxa: String;
  PosY: Integer;
begin
  if not Assigned(Comercio) then
    Exit;

  PosY := FCardSpacing + (Index * (FCardHeight + FCardSpacing));

  Horario := FormatDateTime('hh:nn', Comercio.HorarioAbertura) + ' - ' +
             FormatDateTime('hh:nn', Comercio.HorarioFechamento);
  Taxa := FormatFloat('R$ #,##0.00', Comercio.TaxaEntregaBase);

  Card := TCardComercioPanel.CreateCard(
    Self,
    Comercio.IdComercio,
    CardWidth,
    Comercio.NomeComercio,
    Comercio.Categoria,
    Taxa,
    Horario,
    Comercio.Descricao,
    EstaAberto
  );

  Card.OnRestauranteClick := OnRestauranteClickLojas; // ⭐ USAR EVENTO DE LOJAS
  Card.Left := FMargemLateral;
  Card.Top := PosY;
  Card.Parent := scbxComerciosL; // ⭐ PARENT É scbxComerciosL
  Card.Visible := True;
end;


procedure TFormHomeC.AlterarSenha;
var
  SenhaAtual, SenhaNova, SenhaConfirmacao: String;
  SenhaHashArmazenadaBanco: String;
  SenhaNovaHash: String;
  Qr: TFDQuery;
  PasswordRehashNeeded: Boolean;
begin
  // ========== OBTER VALORES DOS CAMPOS ==========

  SenhaAtual := Trim(eSenhaAtual.Text);
  SenhaNova := Trim(eSenhaNova.Text);
  SenhaConfirmacao := Trim(eSenhaConfirmacao.Text);

  // ========== VALIDAÇÕES BÁSICAS ==========

  if SenhaAtual = '' then
  begin
    ShowMessage('⚠️ Digite a senha atual!');
    eSenhaAtual.SetFocus;
    Exit;
  end;

  if SenhaNova = '' then
  begin
    ShowMessage('⚠️ Digite a nova senha!');
    eSenhaNova.SetFocus;
    Exit;
  end;

  if SenhaConfirmacao = '' then
  begin
    ShowMessage('⚠️ Confirme a nova senha!');
    eSenhaConfirmacao.SetFocus;
    Exit;
  end;

  if SenhaAtual = SenhaNova then
  begin
    ShowMessage('⚠️ A nova senha deve ser diferente da senha atual!');
    eSenhaNova.SetFocus;
    Exit;
  end;

  if SenhaNova <> SenhaConfirmacao then
  begin
    ShowMessage('⚠️ A nova senha e a confirmação não conferem!');
    eSenhaConfirmacao.SetFocus;
    Exit;
  end;

  if Length(SenhaNova) < 6 then
  begin
    ShowMessage('⚠️ A senha deve ter no mínimo 6 caracteres!');
    eSenhaNova.SetFocus;
    Exit;
  end;

  // ========== BUSCAR HASH DA SENHA NO BANCO ==========

  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;

    // ⭐ TABELA CORRETA: usuarios
    Qr.SQL.Text := 'SELECT senha_user FROM usuarios WHERE id_user = :id_user';
    Qr.ParamByName('id_user').AsInteger := FIdUsuario;
    Qr.Open;

    if Qr.IsEmpty then
    begin
      ShowMessage('❌ Usuário não encontrado!');
      Exit;
    end;

    // Obter hash armazenado no banco
    SenhaHashArmazenadaBanco := Qr.FieldByName('senha_user').AsString;

  finally
    Qr.Free;
  end;

  // ========== VERIFICAR SENHA ATUAL COM BCRYPT ==========

  try
    // ⭐ SINTAXE CORRETA: TBCrypt.CheckPassword
    // Retorna TRUE se a senha estiver correta
    if not TBCrypt.CheckPassword(SenhaAtual, SenhaHashArmazenadaBanco, {out}PasswordRehashNeeded) then
    begin
      ShowMessage('❌ Senha atual incorreta!');
      eSenhaAtual.SetFocus;
      eSenhaAtual.SelectAll;
      Exit;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('❌ Erro ao verificar senha: ' + E.Message);
      Exit;
    end;
  end;

  // ========== GERAR HASH DA NOVA SENHA ==========

  try
    // ⭐ SINTAXE CORRETA: TBCrypt.HashPassword
    // Gera automaticamente o salt e retorna o hash completo no formato $2a$...
    SenhaNovaHash := TBCrypt.HashPassword(SenhaNova);
  except
    on E: Exception do
    begin
      ShowMessage('❌ Erro ao gerar hash da nova senha: ' + E.Message);
      Exit;
    end;
  end;

  // ========== ATUALIZAR SENHA NO BANCO ==========

  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;

    // ⭐ TABELA CORRETA: usuarios
    Qr.SQL.Text :=
      'UPDATE usuarios ' +
      'SET senha_user = :senha_nova ' +
      'WHERE id_user = :id_user';

    Qr.ParamByName('senha_nova').AsString := SenhaNovaHash;  // ⭐ HASH COMPLETO ($2a$12$...)
    Qr.ParamByName('id_user').AsInteger := FIdUsuario;

    Qr.ExecSQL;

    ShowMessage('✅ Senha alterada com sucesso!');

    // Limpar campos
    LimparCamposAlterarSenha;

    // Voltar para visualização
    pcPerfil.ActivePageIndex := 0; // tsVisualizarPefil

  except
    on E: Exception do
    begin
      ShowMessage('❌ Erro ao atualizar senha no banco: ' + E.Message);
    end;
  end;

  if Assigned(Qr) then
    Qr.Free;
end;

procedure TFormHomeC.AtualizarCardCarrinho;
begin
  if not Assigned(pCarrinhoComm) then
    Exit;

  // ⭐ Card flutuante - pode usar resumo simples
  TCarrinhoHelper.PopularResumoSimples(scbxCarrinhoItems, FCarrinho);

  // Atualizar total no card flutuante
  TCarrinhoHelper.AtualizarResumo(
    lblItensCart,
    nil,
    nil,
    lblTotalCart,
    FTaxaEntregaAtual,
    FCarrinho
  );

  // Mostrar/Ocultar card baseado no carrinho
  pCarrinhoComm.Visible := Assigned(FCarrinho) and (FCarrinho.Count > 0);

  // ⭐ IMPORTANTE: Se estiver na tela do carrinho, recarregar com cards completos
  if pcMain.ActivePage = tsCarrinho then
    CarregarItensCarrinho; // Recria os cards com botões
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
      for I := 0 to scbxPagamentos.ControlCount - 1 do
      begin
        if scbxPagamentos.Controls[I] is TPagamentoCardPanel then
        begin
          Card := TPagamentoCardPanel(scbxPagamentos.Controls[I]);

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

procedure TFormHomeC.AtualizarQuantidadeCarrinho(IdProduto: Integer; const Observacao: String; NovaQuantidade: Integer);
var
  Item: TItemCarrinho;
begin
  // ⭐ Buscar considerando observação
  Item := ObterItemCarrinho(IdProduto, Observacao);

  if Assigned(Item) then
  begin
    Item.Quantidade := NovaQuantidade;
    AtualizarResumoCarrinho;
    AtualizarCardCarrinho;
  end;
end;

procedure TFormHomeC.AtualizarResumoCarrinho;
var
  Pagamentos: TObjectList<TFormaPagamentoCliente>;
  Pagamento: TFormaPagamentoCliente;
  Enderecos: TObjectList<TEnderecoCliente>;
  Endereco: TEnderecoCliente;
  Qr: TFDQuery;
  IdCliente: Integer;
  DescricaoPagamento, DescricaoEndereco: String;
begin
  // Atualizar contador no ícone do carrinho
  if Assigned(lblQuantidadeCarrinho) and Assigned(FCarrinho) then
  begin
    if FCarrinho.Count > 0 then
    begin
      lblQuantidadeCarrinho.Caption := IntToStr(FCarrinho.Count);
      lblQuantidadeCarrinho.Visible := True;
    end
    else
    begin
      lblQuantidadeCarrinho.Visible := False;
    end;
  end;

  // Atualizar resumo na tela do carrinho
  TCarrinhoHelper.AtualizarResumo(
    lblItensCartCarrinho,
    lblSubtotal,
    lblTaxa,
    lblTotal,
    FTaxaEntregaAtual,
    FCarrinho
  );

  // ⭐ Buscar id_clie (usado tanto para pagamento quanto endereço)
  try
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

    // ⭐ BUSCAR E EXIBIR FORMA DE PAGAMENTO PRINCIPAL
    if Assigned(lblFormaPagamento) and Assigned(FPagamentoController) then
    begin
      try
        Pagamentos := FPagamentoController.ListarPagamentos(IdCliente);
        try
          if Assigned(Pagamentos) and (Pagamentos.Count > 0) then
          begin
            DescricaoPagamento := '';

            // Procurar o principal
            for Pagamento in Pagamentos do
            begin
              if Pagamento.Principal then
              begin
                // Criar descrição baseada no tipo
                if Pagamento is TPagamentoCartao then
                  DescricaoPagamento := Format('%s - %s **** %s',
                    [Pagamento.Apelido,
                     TPagamentoCartao(Pagamento).Bandeira,
                     TPagamentoCartao(Pagamento).NumeroCartao])
                else if Pagamento is TPagamentoPix then
                  DescricaoPagamento := Format('%s - Pix: %s',
                    [Pagamento.Apelido,
                     Copy(TPagamentoPix(Pagamento).ChavePix, 1, 20)])
                else if Pagamento is TPagamentoTransferencia then
                  DescricaoPagamento := Format('%s - %s',
                    [Pagamento.Apelido,
                     TPagamentoTransferencia(Pagamento).Banco])
                else
                  DescricaoPagamento := Pagamento.Apelido;

                Break;
              end;
            end;

            // Se não encontrou principal, pega o primeiro
            if DescricaoPagamento = '' then
            begin
              Pagamento := Pagamentos[0];
              if Pagamento is TPagamentoCartao then
                DescricaoPagamento := Format('%s - %s **** %s',
                  [Pagamento.Apelido,
                   TPagamentoCartao(Pagamento).Bandeira,
                   TPagamentoCartao(Pagamento).NumeroCartao])
              else if Pagamento is TPagamentoPix then
                DescricaoPagamento := Format('%s - Pix',
                  [Pagamento.Apelido])
              else if Pagamento is TPagamentoTransferencia then
                DescricaoPagamento := Format('%s - %s',
                  [Pagamento.Apelido,
                   TPagamentoTransferencia(Pagamento).Banco])
              else
                DescricaoPagamento := Pagamento.Apelido;
            end;

            lblFormaPagamento.Caption := DescricaoPagamento;
          end
          else
          begin
            lblFormaPagamento.Caption := '⚠️ Nenhuma forma cadastrada';
          end;
        finally
          Pagamentos.Free;
        end;
      except
        on E: Exception do
          lblFormaPagamento.Caption := 'Erro ao carregar';
      end;
    end;

    // ⭐ BUSCAR E EXIBIR ENDEREÇO PRINCIPAL
    if Assigned(lblEnderecoAtualCarrinho) and Assigned(FEnderecoController) then
    begin
      try
        Enderecos := FEnderecoController.ListarEnderecos(IdCliente);
        try
          if Assigned(Enderecos) and (Enderecos.Count > 0) then
          begin
            DescricaoEndereco := '';

            // Procurar o principal
            for Endereco in Enderecos do
            begin
              if Endereco.Principal then
              begin
                DescricaoEndereco := Format('%s - %s, %s',
                  [Endereco.Apelido,
                   Endereco.Logradouro,
                   Endereco.Numero]);
                Break;
              end;
            end;

            // Se não encontrou principal, pega o primeiro
            if DescricaoEndereco = '' then
            begin
              Endereco := Enderecos[0];
              DescricaoEndereco := Format('%s - %s, %s',
                [Endereco.Apelido,
                 Endereco.Logradouro,
                 Endereco.Numero]);
            end;

            lblEnderecoAtualCarrinho.Caption := DescricaoEndereco;
          end
          else
          begin
            lblEnderecoAtualCarrinho.Caption := '⚠️ Nenhum endereço cadastrado';
          end;
        finally
          Enderecos.Free;
        end;
      except
        on E: Exception do
          lblEnderecoAtualCarrinho.Caption := 'Erro ao carregar endereço';
      end;
    end;

  except
    on E: Exception do
    begin
      // Erro geral
      if Assigned(lblFormaPagamento) then
        lblFormaPagamento.Caption := 'Erro';
      if Assigned(lblEnderecoAtualCarrinho) then
        lblEnderecoAtualCarrinho.Caption := 'Erro';
    end;
  end;

  // Atualizar também no card flutuante (se existir)
  if Assigned(lblItensCart) and Assigned(lblTotalCart) then
  begin
    TCarrinhoHelper.AtualizarResumo(
      lblItensCart,
      nil,
      nil,
      lblTotalCart,
      FTaxaEntregaAtual,
      FCarrinho
    );
  end;
end;

procedure TFormHomeC.AtualizarSubtotalProduto;
var
  Quantidade: Integer;
  Subtotal: Currency;
begin
  if not Assigned(FProdutoSelecionado) then
    Exit;

  if not TryStrToInt(eQuantidadeProdutoSelec.Text, Quantidade) then
    Quantidade := 1;

  if Quantidade < 1 then
    Quantidade := 1;

  Subtotal := FProdutoSelecionado.PrecoVenda * Quantidade;

  lblSubtotalProdutoSelec.Caption := 'R$ ' + FormatFloat('#,##0.00', Subtotal);
end;


procedure TFormHomeC.btnMaisQtdClick(Sender: TObject);
var
  Qtd: Integer;
begin
  if TryStrToInt(eQuantidadeProdutoSelec.Text, Qtd) then
  begin
    if Qtd < 99 then // Limite máximo
    begin
      Inc(Qtd);
      eQuantidadeProdutoSelec.Text := IntToStr(Qtd);
      AtualizarSubtotalProduto;
    end;
  end;
end;

procedure TFormHomeC.btnMenosQtdClick(Sender: TObject);
var
  Qtd: Integer;
begin
  if TryStrToInt(eQuantidadeProdutoSelec.Text, Qtd) then
  begin
    if Qtd > 1 then
    begin
      Dec(Qtd);
      eQuantidadeProdutoSelec.Text := IntToStr(Qtd);
      AtualizarSubtotalProduto;
    end;
  end;
end;

procedure TFormHomeC.AbrirCadastroCartao(IdCliente: Integer);
var
  FormCadastro: TForm;
  pFundo, pHeader, pDados, pBotoes: TPanel;
  lblTitulo, lblNumero, lblNome, lblBandeira, lblTipo, lblValidade, lblApelido: TLabel;
  eNumeroCartao, eNomeTitular, eValidade, eApelido: TEdit;
  cbBandeira, cbTipoCartao: TComboBox;
  chkPrincipal: TCheckBox;
  btnSalvar, btnCancelar: TButton;
  Cartao: TPagamentoCartao;
  MsgErro: String;
begin
  FormCadastro := TForm.Create(nil);
  try
    FormCadastro.BorderStyle := bsDialog;
    FormCadastro.Position := poScreenCenter;
    FormCadastro.Width := 500;
    FormCadastro.Height := 550;
    FormCadastro.Caption := 'Cadastrar Cartão';
    FormCadastro.Color := $00F5F5F5;
    FormCadastro.Font.Name := 'Segoe UI';

    // ========== PAINEL DE FUNDO ==========
    pFundo := TPanel.Create(FormCadastro);
    pFundo.Parent := FormCadastro;
    pFundo.Align := alClient;
    pFundo.BevelOuter := bvNone;
    pFundo.Color := $00F5F5F5;
    pFundo.ParentBackground := False;

    // ========== HEADER ==========
    pHeader := TPanel.Create(pFundo);
    pHeader.Parent := pFundo;
    pHeader.Align := alTop;
    pHeader.Height := 60;
    pHeader.BevelOuter := bvNone;
    pHeader.Color := $00517CFF;
    pHeader.ParentBackground := False;

    lblTitulo := TLabel.Create(pHeader);
    lblTitulo.Parent := pHeader;
    lblTitulo.Caption := '💳 Cadastrar Cartão';
    lblTitulo.Font.Size := 14;
    lblTitulo.Font.Style := [fsBold];
    lblTitulo.Font.Color := clWhite;
    lblTitulo.Left := 20;
    lblTitulo.Top := 20;
    lblTitulo.Transparent := True;

    // ========== PAINEL DE DADOS ==========
    pDados := TPanel.Create(pFundo);
    pDados.Parent := pFundo;
    pDados.Align := alClient;
    pDados.BevelOuter := bvNone;
    pDados.Color := $00F5F5F5;
    pDados.ParentBackground := False;

    // Apelido
    lblApelido := TLabel.Create(pDados);
    lblApelido.Parent := pDados;
    lblApelido.Caption := 'Apelido (Ex: Meu Cartão, Cartão Principal):';
    lblApelido.Left := 30;
    lblApelido.Top := 20;
    lblApelido.Font.Size := 9;

    eApelido := TEdit.Create(pDados);
    eApelido.Parent := pDados;
    eApelido.Left := 30;
    eApelido.Top := 42;
    eApelido.Width := 430;
    eApelido.Height := 25;
    eApelido.Font.Size := 10;
    eApelido.TextHint := 'Digite um apelido';

    // Número do Cartão
    lblNumero := TLabel.Create(pDados);
    lblNumero.Parent := pDados;
    lblNumero.Caption := 'Número do Cartão (últimos 4 dígitos):';
    lblNumero.Left := 30;
    lblNumero.Top := 80;
    lblNumero.Font.Size := 9;

    eNumeroCartao := TEdit.Create(pDados);
    eNumeroCartao.Parent := pDados;
    eNumeroCartao.Left := 30;
    eNumeroCartao.Top := 102;
    eNumeroCartao.Width := 200;
    eNumeroCartao.Height := 25;
    eNumeroCartao.Font.Size := 10;
    eNumeroCartao.MaxLength := 4;
    eNumeroCartao.NumbersOnly := True;
    eNumeroCartao.TextHint := '0000';

    // Nome do Titular
    lblNome := TLabel.Create(pDados);
    lblNome.Parent := pDados;
    lblNome.Caption := 'Nome do Titular (como está no cartão):';
    lblNome.Left := 30;
    lblNome.Top := 140;
    lblNome.Font.Size := 9;

    eNomeTitular := TEdit.Create(pDados);
    eNomeTitular.Parent := pDados;
    eNomeTitular.Left := 30;
    eNomeTitular.Top := 162;
    eNomeTitular.Width := 430;
    eNomeTitular.Height := 25;
    eNomeTitular.Font.Size := 10;
    eNomeTitular.CharCase := ecUpperCase;
    eNomeTitular.TextHint := 'NOME COMPLETO';

    // Bandeira
    lblBandeira := TLabel.Create(pDados);
    lblBandeira.Parent := pDados;
    lblBandeira.Caption := 'Bandeira:';
    lblBandeira.Left := 30;
    lblBandeira.Top := 200;
    lblBandeira.Font.Size := 9;

    cbBandeira := TComboBox.Create(pDados);
    cbBandeira.Parent := pDados;
    cbBandeira.Left := 30;
    cbBandeira.Top := 222;
    cbBandeira.Width := 200;
    cbBandeira.Height := 25;
    cbBandeira.Style := csDropDownList;
    cbBandeira.Items.Add('Visa');
    cbBandeira.Items.Add('Mastercard');
    cbBandeira.Items.Add('Elo');
    cbBandeira.Items.Add('American Express');
    cbBandeira.Items.Add('Hipercard');
    cbBandeira.Items.Add('Diners Club');
    cbBandeira.Items.Add('Outra');

    // Tipo de Cartão
    lblTipo := TLabel.Create(pDados);
    lblTipo.Parent := pDados;
    lblTipo.Caption := 'Tipo:';
    lblTipo.Left := 260;
    lblTipo.Top := 200;
    lblTipo.Font.Size := 9;

    cbTipoCartao := TComboBox.Create(pDados);
    cbTipoCartao.Parent := pDados;
    cbTipoCartao.Left := 260;
    cbTipoCartao.Top := 222;
    cbTipoCartao.Width := 200;
    cbTipoCartao.Height := 25;
    cbTipoCartao.Style := csDropDownList;
    cbTipoCartao.Items.Add('Crédito');
    cbTipoCartao.Items.Add('Débito');
    cbTipoCartao.ItemIndex := 0;

    // Validade
    lblValidade := TLabel.Create(pDados);
    lblValidade.Parent := pDados;
    lblValidade.Caption := 'Validade (MM/AAAA):';
    lblValidade.Left := 30;
    lblValidade.Top := 260;
    lblValidade.Font.Size := 9;

    eValidade := TEdit.Create(pDados);
    eValidade.Parent := pDados;
    eValidade.Left := 30;
    eValidade.Top := 282;
    eValidade.Width := 120;
    eValidade.Height := 25;
    eValidade.Font.Size := 10;
    eValidade.MaxLength := 7;
    eValidade.TextHint := '12/2030';

    // CheckBox Principal
    chkPrincipal := TCheckBox.Create(pDados);
    chkPrincipal.Parent := pDados;
    chkPrincipal.Caption := 'Definir como forma de pagamento principal';
    chkPrincipal.Left := 30;
    chkPrincipal.Top := 330;
    chkPrincipal.Width := 350;
    chkPrincipal.Font.Size := 9;
    chkPrincipal.Font.Style := [fsBold];

    // ========== PAINEL DE BOTÕES ==========
    pBotoes := TPanel.Create(pFundo);
    pBotoes.Parent := pFundo;
    pBotoes.Align := alBottom;
    pBotoes.Height := 70;
    pBotoes.BevelOuter := bvNone;
    pBotoes.Color := $00EEEEEE;
    pBotoes.ParentBackground := False;

    // Botão Cancelar
    btnCancelar := TButton.Create(pBotoes);
    btnCancelar.Parent := pBotoes;
    btnCancelar.Caption := 'Cancelar';
    btnCancelar.Left := 250;
    btnCancelar.Top := 15;
    btnCancelar.Width := 110;
    btnCancelar.Height := 40;
    btnCancelar.Font.Size := 10;
    btnCancelar.Font.Style := [fsBold];
    btnCancelar.Cursor := crHandPoint;
    btnCancelar.ModalResult := mrCancel;

    // Botão Salvar
    btnSalvar := TButton.Create(pBotoes);
    btnSalvar.Parent := pBotoes;
    btnSalvar.Caption := 'Salvar';
    btnSalvar.Left := 370;
    btnSalvar.Top := 15;
    btnSalvar.Width := 110;
    btnSalvar.Height := 40;
    btnSalvar.Font.Size := 10;
    btnSalvar.Font.Style := [fsBold];
    btnSalvar.Cursor := crHandPoint;
    btnSalvar.ModalResult := mrOk;

    // ========== EXIBIR E PROCESSAR ==========
    if FormCadastro.ShowModal = mrOk then
    begin
      // Criar objeto Cartao
      Cartao := TPagamentoCartao.Create;
      try
        Cartao.IdCliente := IdCliente;
        Cartao.Apelido := Trim(eApelido.Text);
        Cartao.NumeroCartao := Trim(eNumeroCartao.Text);
        Cartao.NomeTitular := Trim(eNomeTitular.Text);
        Cartao.Bandeira := cbBandeira.Text;
        Cartao.TipoCartao := cbTipoCartao.Text;
        Cartao.Validade := Trim(eValidade.Text);
        Cartao.Principal := chkPrincipal.Checked;

        // Validar dados
        if not Cartao.ValidarDados(MsgErro) then
        begin
          ShowMessage('❌ ' + MsgErro);
          Exit;
        end;

        // Salvar no banco usando o Controller
        if FPagamentoController.CadastrarCartao(Cartao) then
        begin
          ShowMessage('✅ Cartão cadastrado com sucesso!');
          CarregarPagamentos; // Recarregar lista
        end
        else
          ShowMessage('❌ Erro ao cadastrar cartão!');

      finally
        Cartao.Free;
      end;
    end;

  finally
    FormCadastro.Free;
  end;
end;

procedure TFormHomeC.AbrirCadastroPix(IdCliente: Integer);
var
  FormCadastro: TForm;
  pFundo, pHeader, pDados, pBotoes: TPanel;
  lblTitulo, lblChave, lblTipo, lblApelido: TLabel;
  eChavePix, eApelido: TEdit;
  cbTipoChave: TComboBox;
  chkPrincipal: TCheckBox;
  btnSalvar, btnCancelar: TButton;
  Pix: TPagamentoPix;
  MsgErro: String;
begin
  FormCadastro := TForm.Create(nil);
  try
    FormCadastro.BorderStyle := bsDialog;
    FormCadastro.Position := poScreenCenter;
    FormCadastro.Width := 500;
    FormCadastro.Height := 420;
    FormCadastro.Caption := 'Cadastrar Pix';
    FormCadastro.Color := $00F5F5F5;
    FormCadastro.Font.Name := 'Segoe UI';

    // ========== PAINEL DE FUNDO ==========
    pFundo := TPanel.Create(FormCadastro);
    pFundo.Parent := FormCadastro;
    pFundo.Align := alClient;
    pFundo.BevelOuter := bvNone;
    pFundo.Color := $00F5F5F5;
    pFundo.ParentBackground := False;

    // ========== HEADER ==========
    pHeader := TPanel.Create(pFundo);
    pHeader.Parent := pFundo;
    pHeader.Align := alTop;
    pHeader.Height := 60;
    pHeader.BevelOuter := bvNone;
    pHeader.Color := $00517CFF;
    pHeader.ParentBackground := False;

    lblTitulo := TLabel.Create(pHeader);
    lblTitulo.Parent := pHeader;
    lblTitulo.Caption := '🔄 Cadastrar Pix';
    lblTitulo.Font.Size := 14;
    lblTitulo.Font.Style := [fsBold];
    lblTitulo.Font.Color := clWhite;
    lblTitulo.Left := 20;
    lblTitulo.Top := 20;
    lblTitulo.Transparent := True;

    // ========== PAINEL DE DADOS ==========
    pDados := TPanel.Create(pFundo);
    pDados.Parent := pFundo;
    pDados.Align := alClient;
    pDados.BevelOuter := bvNone;
    pDados.Color := $00F5F5F5;
    pDados.ParentBackground := False;

    // Apelido
    lblApelido := TLabel.Create(pDados);
    lblApelido.Parent := pDados;
    lblApelido.Caption := 'Apelido (Ex: Meu Pix, Pix Principal):';
    lblApelido.Left := 30;
    lblApelido.Top := 20;
    lblApelido.Font.Size := 9;

    eApelido := TEdit.Create(pDados);
    eApelido.Parent := pDados;
    eApelido.Left := 30;
    eApelido.Top := 42;
    eApelido.Width := 430;
    eApelido.Height := 25;
    eApelido.Font.Size := 10;
    eApelido.TextHint := 'Digite um apelido';

    // Tipo de Chave
    lblTipo := TLabel.Create(pDados);
    lblTipo.Parent := pDados;
    lblTipo.Caption := 'Tipo de Chave:';
    lblTipo.Left := 30;
    lblTipo.Top := 80;
    lblTipo.Font.Size := 9;

    cbTipoChave := TComboBox.Create(pDados);
    cbTipoChave.Parent := pDados;
    cbTipoChave.Left := 30;
    cbTipoChave.Top := 102;
    cbTipoChave.Width := 430;
    cbTipoChave.Height := 25;
    cbTipoChave.Style := csDropDownList;
    cbTipoChave.Items.Add('CPF');
    cbTipoChave.Items.Add('CNPJ');
    cbTipoChave.Items.Add('Email');
    cbTipoChave.Items.Add('Telefone');
    cbTipoChave.Items.Add('Aleatória');

    // Chave Pix
    lblChave := TLabel.Create(pDados);
    lblChave.Parent := pDados;
    lblChave.Caption := 'Chave Pix:';
    lblChave.Left := 30;
    lblChave.Top := 140;
    lblChave.Font.Size := 9;

    eChavePix := TEdit.Create(pDados);
    eChavePix.Parent := pDados;
    eChavePix.Left := 30;
    eChavePix.Top := 162;
    eChavePix.Width := 430;
    eChavePix.Height := 25;
    eChavePix.Font.Size := 10;
    eChavePix.TextHint := 'Digite sua chave Pix';

    // CheckBox Principal
    chkPrincipal := TCheckBox.Create(pDados);
    chkPrincipal.Parent := pDados;
    chkPrincipal.Caption := 'Definir como forma de pagamento principal';
    chkPrincipal.Left := 30;
    chkPrincipal.Top := 210;
    chkPrincipal.Width := 350;
    chkPrincipal.Font.Size := 9;
    chkPrincipal.Font.Style := [fsBold];

    // ========== PAINEL DE BOTÕES ==========
    pBotoes := TPanel.Create(pFundo);
    pBotoes.Parent := pFundo;
    pBotoes.Align := alBottom;
    pBotoes.Height := 70;
    pBotoes.BevelOuter := bvNone;
    pBotoes.Color := $00EEEEEE;
    pBotoes.ParentBackground := False;

    // Botão Cancelar
    btnCancelar := TButton.Create(pBotoes);
    btnCancelar.Parent := pBotoes;
    btnCancelar.Caption := 'Cancelar';
    btnCancelar.Left := 250;
    btnCancelar.Top := 15;
    btnCancelar.Width := 110;
    btnCancelar.Height := 40;
    btnCancelar.Font.Size := 10;
    btnCancelar.Font.Style := [fsBold];
    btnCancelar.Cursor := crHandPoint;
    btnCancelar.ModalResult := mrCancel;

    // Botão Salvar
    btnSalvar := TButton.Create(pBotoes);
    btnSalvar.Parent := pBotoes;
    btnSalvar.Caption := 'Salvar';
    btnSalvar.Left := 370;
    btnSalvar.Top := 15;
    btnSalvar.Width := 110;
    btnSalvar.Height := 40;
    btnSalvar.Font.Size := 10;
    btnSalvar.Font.Style := [fsBold];
    btnSalvar.Cursor := crHandPoint;
    btnSalvar.ModalResult := mrOk;

    // ========== EXIBIR E PROCESSAR ==========
    if FormCadastro.ShowModal = mrOk then
    begin
      // Criar objeto Pix
      Pix := TPagamentoPix.Create;
      try
        Pix.IdCliente := IdCliente;
        Pix.Apelido := Trim(eApelido.Text);
        Pix.ChavePix := Trim(eChavePix.Text);
        Pix.TipoChavePix := cbTipoChave.Text;
        Pix.Principal := chkPrincipal.Checked;

        // Validar dados
        if not Pix.ValidarDados(MsgErro) then
        begin
          ShowMessage('❌ ' + MsgErro);
          Exit;
        end;

        // Salvar no banco usando o Controller
        if FPagamentoController.CadastrarPix(Pix) then
        begin
          ShowMessage('✅ Chave Pix cadastrada com sucesso!');
          CarregarPagamentos; // Recarregar lista
        end
        else
          ShowMessage('❌ Erro ao cadastrar Pix!');

      finally
        Pix.Free;
      end;
    end;

  finally
    FormCadastro.Free;
  end;
end;

procedure TFormHomeC.AbrirCadastroTransferencia(IdCliente: Integer);
var
  FormCadastro: TForm;
  pFundo, pHeader, pDados, pBotoes: TPanel;
  lblTitulo, lblBanco, lblCodigo, lblAgencia, lblConta, lblDigito, lblTipo, lblApelido: TLabel;
  eBanco, eCodigoBanco, eAgencia, eConta, eDigitoConta, eApelido: TEdit;
  cbTipoConta: TComboBox;
  chkPrincipal: TCheckBox;
  btnSalvar, btnCancelar: TButton;
  Transferencia: TPagamentoTransferencia;
  MsgErro: String;
begin
  FormCadastro := TForm.Create(nil);
  try
    FormCadastro.BorderStyle := bsDialog;
    FormCadastro.Position := poScreenCenter;
    FormCadastro.Width := 500;
    FormCadastro.Height := 600;
    FormCadastro.Caption := 'Cadastrar Transferência Bancária';
    FormCadastro.Color := $00F5F5F5;
    FormCadastro.Font.Name := 'Segoe UI';

    // ========== PAINEL DE FUNDO ==========
    pFundo := TPanel.Create(FormCadastro);
    pFundo.Parent := FormCadastro;
    pFundo.Align := alClient;
    pFundo.BevelOuter := bvNone;
    pFundo.Color := $00F5F5F5;
    pFundo.ParentBackground := False;

    // ========== HEADER ==========
    pHeader := TPanel.Create(pFundo);
    pHeader.Parent := pFundo;
    pHeader.Align := alTop;
    pHeader.Height := 60;
    pHeader.BevelOuter := bvNone;
    pHeader.Color := $00517CFF;
    pHeader.ParentBackground := False;

    lblTitulo := TLabel.Create(pHeader);
    lblTitulo.Parent := pHeader;
    lblTitulo.Caption := '🏦 Cadastrar Transferência Bancária';
    lblTitulo.Font.Size := 14;
    lblTitulo.Font.Style := [fsBold];
    lblTitulo.Font.Color := clWhite;
    lblTitulo.Left := 20;
    lblTitulo.Top := 20;
    lblTitulo.Transparent := True;

    // ========== PAINEL DE DADOS ==========
    pDados := TPanel.Create(pFundo);
    pDados.Parent := pFundo;
    pDados.Align := alClient;
    pDados.BevelOuter := bvNone;
    pDados.Color := $00F5F5F5;
    pDados.ParentBackground := False;

    // Apelido
    lblApelido := TLabel.Create(pDados);
    lblApelido.Parent := pDados;
    lblApelido.Caption := 'Apelido (Ex: Conta Salário, Conta Investimento):';
    lblApelido.Left := 30;
    lblApelido.Top := 20;
    lblApelido.Font.Size := 9;

    eApelido := TEdit.Create(pDados);
    eApelido.Parent := pDados;
    eApelido.Left := 30;
    eApelido.Top := 42;
    eApelido.Width := 430;
    eApelido.Height := 25;
    eApelido.Font.Size := 10;
    eApelido.TextHint := 'Digite um apelido';

    // Banco
    lblBanco := TLabel.Create(pDados);
    lblBanco.Parent := pDados;
    lblBanco.Caption := 'Nome do Banco:';
    lblBanco.Left := 30;
    lblBanco.Top := 80;
    lblBanco.Font.Size := 9;

    eBanco := TEdit.Create(pDados);
    eBanco.Parent := pDados;
    eBanco.Left := 30;
    eBanco.Top := 102;
    eBanco.Width := 280;
    eBanco.Height := 25;
    eBanco.Font.Size := 10;
    eBanco.TextHint := 'Ex: Banco do Brasil';

    // Código do Banco
    lblCodigo := TLabel.Create(pDados);
    lblCodigo.Parent := pDados;
    lblCodigo.Caption := 'Código:';
    lblCodigo.Left := 330;
    lblCodigo.Top := 80;
    lblCodigo.Font.Size := 9;

    eCodigoBanco := TEdit.Create(pDados);
    eCodigoBanco.Parent := pDados;
    eCodigoBanco.Left := 330;
    eCodigoBanco.Top := 102;
    eCodigoBanco.Width := 130;
    eCodigoBanco.Height := 25;
    eCodigoBanco.Font.Size := 10;
    eCodigoBanco.MaxLength := 3;
    eCodigoBanco.NumbersOnly := True;
    eCodigoBanco.TextHint := '001';

    // Agência
    lblAgencia := TLabel.Create(pDados);
    lblAgencia.Parent := pDados;
    lblAgencia.Caption := 'Agência:';
    lblAgencia.Left := 30;
    lblAgencia.Top := 140;
    lblAgencia.Font.Size := 9;

    eAgencia := TEdit.Create(pDados);
    eAgencia.Parent := pDados;
    eAgencia.Left := 30;
    eAgencia.Top := 162;
    eAgencia.Width := 150;
    eAgencia.Height := 25;
    eAgencia.Font.Size := 10;
    eAgencia.NumbersOnly := True;
    eAgencia.TextHint := '0000';

    // Conta
    lblConta := TLabel.Create(pDados);
    lblConta.Parent := pDados;
    lblConta.Caption := 'Conta:';
    lblConta.Left := 200;
    lblConta.Top := 140;
    lblConta.Font.Size := 9;

    eConta := TEdit.Create(pDados);
    eConta.Parent := pDados;
    eConta.Left := 200;
    eConta.Top := 162;
    eConta.Width := 180;
    eConta.Height := 25;
    eConta.Font.Size := 10;
    eConta.NumbersOnly := True;
    eConta.TextHint := '00000000';

    // Dígito
    lblDigito := TLabel.Create(pDados);
    lblDigito.Parent := pDados;
    lblDigito.Caption := 'Dígito:';
    lblDigito.Left := 400;
    lblDigito.Top := 140;
    lblDigito.Font.Size := 9;

    eDigitoConta := TEdit.Create(pDados);
    eDigitoConta.Parent := pDados;
    eDigitoConta.Left := 400;
    eDigitoConta.Top := 162;
    eDigitoConta.Width := 60;
    eDigitoConta.Height := 25;
    eDigitoConta.Font.Size := 10;
    eDigitoConta.MaxLength := 1;
    eDigitoConta.TextHint := '0';

    // Tipo de Conta
    lblTipo := TLabel.Create(pDados);
    lblTipo.Parent := pDados;
    lblTipo.Caption := 'Tipo de Conta:';
    lblTipo.Left := 30;
    lblTipo.Top := 200;
    lblTipo.Font.Size := 9;

    cbTipoConta := TComboBox.Create(pDados);
    cbTipoConta.Parent := pDados;
    cbTipoConta.Left := 30;
    cbTipoConta.Top := 222;
    cbTipoConta.Width := 200;
    cbTipoConta.Height := 25;
    cbTipoConta.Style := csDropDownList;
    cbTipoConta.Items.Add('Corrente');
    cbTipoConta.Items.Add('Poupança');
    cbTipoConta.ItemIndex := 0;

    // CheckBox Principal
    chkPrincipal := TCheckBox.Create(pDados);
    chkPrincipal.Parent := pDados;
    chkPrincipal.Caption := 'Definir como forma de pagamento principal';
    chkPrincipal.Left := 30;
    chkPrincipal.Top := 270;
    chkPrincipal.Width := 350;
    chkPrincipal.Font.Size := 9;
    chkPrincipal.Font.Style := [fsBold];

    // ========== PAINEL DE BOTÕES ==========
    pBotoes := TPanel.Create(pFundo);
    pBotoes.Parent := pFundo;
    pBotoes.Align := alBottom;
    pBotoes.Height := 70;
    pBotoes.BevelOuter := bvNone;
    pBotoes.Color := $00EEEEEE;
    pBotoes.ParentBackground := False;

    // Botão Cancelar
    btnCancelar := TButton.Create(pBotoes);
    btnCancelar.Parent := pBotoes;
    btnCancelar.Caption := 'Cancelar';
    btnCancelar.Left := 250;
    btnCancelar.Top := 15;
    btnCancelar.Width := 110;
    btnCancelar.Height := 40;
    btnCancelar.Font.Size := 10;
    btnCancelar.Font.Style := [fsBold];
    btnCancelar.Cursor := crHandPoint;
    btnCancelar.ModalResult := mrCancel;

    // Botão Salvar
    btnSalvar := TButton.Create(pBotoes);
    btnSalvar.Parent := pBotoes;
    btnSalvar.Caption := 'Salvar';
    btnSalvar.Left := 370;
    btnSalvar.Top := 15;
    btnSalvar.Width := 110;
    btnSalvar.Height := 40;
    btnSalvar.Font.Size := 10;
    btnSalvar.Font.Style := [fsBold];
    btnSalvar.Cursor := crHandPoint;
    btnSalvar.ModalResult := mrOk;

    // ========== EXIBIR E PROCESSAR ==========
    if FormCadastro.ShowModal = mrOk then
    begin
      // Criar objeto Transferencia
      Transferencia := TPagamentoTransferencia.Create;
      try
        Transferencia.IdCliente := IdCliente;
        Transferencia.Apelido := Trim(eApelido.Text);
        Transferencia.Banco := Trim(eBanco.Text);
        Transferencia.CodigoBanco := Trim(eCodigoBanco.Text);
        Transferencia.Agencia := Trim(eAgencia.Text);
        Transferencia.Conta := Trim(eConta.Text);
        Transferencia.DigitoC := Trim(eDigitoConta.Text);
        Transferencia.TipoConta := cbTipoConta.Text;
        Transferencia.Principal := chkPrincipal.Checked;

        // Validar dados
        if not Transferencia.ValidarDados(MsgErro) then
        begin
          ShowMessage('❌ ' + MsgErro);
          Exit;
        end;

        // Salvar no banco usando o Controller
        if FPagamentoController.CadastrarTransferencia(Transferencia) then
        begin
          ShowMessage('✅ Transferência cadastrada com sucesso!');
          CarregarPagamentos; // Recarregar lista
        end
        else
          ShowMessage('❌ Erro ao cadastrar transferência!');

      finally
        Transferencia.Free;
      end;
    end;

  finally
    FormCadastro.Free;
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

procedure TFormHomeC.AbrirTelaProduto(IdProduto: Integer;
  const NomeProduto: string; Preco: Currency);
var
  Qr: TFDQuery;
begin
  // Buscar dados completos do produto
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text :=
      'SELECT p.id_produto, p.nome_prod, p.desc_prod, p.preco_prod, ' +
      '       cp.nome_categoria, p.id_comercio ' +
      'FROM produtos p ' +
      'LEFT JOIN categorias_produtos cp ON p.id_categoria = cp.id_categoria ' +
      'WHERE p.id_produto = :id_produto';
    Qr.ParamByName('id_produto').AsInteger := IdProduto;
    Qr.Open;

    if Qr.IsEmpty then
    begin
      ShowMessage('❌ Produto não encontrado!');
      Exit;
    end;

    // Criar objeto de produto
    if Assigned(FProdutoSelecionado) then
      FreeAndNil(FProdutoSelecionado);

    FProdutoSelecionado := TProduto.Create;
    FProdutoSelecionado.IdProduto := Qr.FieldByName('id_produto').AsInteger;
    FProdutoSelecionado.NomeProd := Qr.FieldByName('nome_prod').AsString;
    FProdutoSelecionado.DescProd := Qr.FieldByName('desc_prod').AsString;
    FProdutoSelecionado.PrecoVenda := Qr.FieldByName('preco_prod').AsCurrency;
    FProdutoSelecionado.Categoria := Qr.FieldByName('nome_categoria').AsString;
    FProdutoSelecionado.IdComercio := Qr.FieldByName('id_comercio').AsInteger;

  finally
    Qr.Free;
  end;

  // Preencher campos da tela
  lblNomeProdutoSelec.Caption := FProdutoSelecionado.NomeProd;
  lblDescricaoProdutoSelec.Caption := FProdutoSelecionado.DescProd;
  lblCategoriaProdutoSelec.Caption := '🏷️ ' + FProdutoSelecionado.Categoria;
  lblPrecoProdutoSelec.Caption := 'R$ ' + FormatFloat('#,##0.00', FProdutoSelecionado.PrecoVenda);

  // Resetar quantidade
  eQuantidadeProdutoSelec.Text := '1';
  mObservacaoProdutoSelec.Clear;

  // Atualizar subtotal
  AtualizarSubtotalProduto;

  // Ir para tela do produto
  pcMain.ActivePage := tsProdutoSelec;
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

function TFormHomeC.ObterItemCarrinho(IdProduto: Integer; const Observacao: String = ''): TItemCarrinho;
var
  Item: TItemCarrinho;
begin
  Result := nil;

  if not Assigned(FCarrinho) then
    Exit;

  for Item in FCarrinho do
  begin
    // ⭐ Usa o novo método que compara produto + observação
    if Item.EhMesmoItem(IdProduto, Observacao) then
    begin
      Result := Item;
      Break;
    end;
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

procedure TFormHomeC.EditarCartao(Cartao: TPagamentoCartao);
var
  FormEdicao: TForm;
  pFundo, pHeader, pDados, pBotoes: TPanel;
  lblTitulo, lblNumero, lblNome, lblBandeira, lblTipo, lblValidade, lblApelido: TLabel;
  eNumeroCartao, eNomeTitular, eValidade, eApelido: TEdit;
  cbBandeira, cbTipoCartao: TComboBox;
  chkPrincipal: TCheckBox;
  btnSalvar, btnCancelar: TButton;
  MsgErro: String;
begin
  FormEdicao := TForm.Create(nil);
  try
    FormEdicao.BorderStyle := bsDialog;
    FormEdicao.Position := poScreenCenter;
    FormEdicao.Width := 500;
    FormEdicao.Height := 550;
    FormEdicao.Caption := 'Editar Cartão';
    FormEdicao.Color := $00F5F5F5;
    FormEdicao.Font.Name := 'Segoe UI';

    // ========== PAINEL DE FUNDO ==========
    pFundo := TPanel.Create(FormEdicao);
    pFundo.Parent := FormEdicao;
    pFundo.Align := alClient;
    pFundo.BevelOuter := bvNone;
    pFundo.Color := $00F5F5F5;
    pFundo.ParentBackground := False;

    // ========== HEADER ==========
    pHeader := TPanel.Create(pFundo);
    pHeader.Parent := pFundo;
    pHeader.Align := alTop;
    pHeader.Height := 60;
    pHeader.BevelOuter := bvNone;
    pHeader.Color := $00517CFF;
    pHeader.ParentBackground := False;

    lblTitulo := TLabel.Create(pHeader);
    lblTitulo.Parent := pHeader;
    lblTitulo.Caption := '✏️ Editar Cartão';
    lblTitulo.Font.Size := 14;
    lblTitulo.Font.Style := [fsBold];
    lblTitulo.Font.Color := clWhite;
    lblTitulo.Left := 20;
    lblTitulo.Top := 20;
    lblTitulo.Transparent := True;

    // ========== PAINEL DE DADOS ==========
    pDados := TPanel.Create(pFundo);
    pDados.Parent := pFundo;
    pDados.Align := alClient;
    pDados.BevelOuter := bvNone;
    pDados.Color := $00F5F5F5;
    pDados.ParentBackground := False;

    // Apelido
    lblApelido := TLabel.Create(pDados);
    lblApelido.Parent := pDados;
    lblApelido.Caption := 'Apelido:';
    lblApelido.Left := 30;
    lblApelido.Top := 20;
    lblApelido.Font.Size := 9;

    eApelido := TEdit.Create(pDados);
    eApelido.Parent := pDados;
    eApelido.Left := 30;
    eApelido.Top := 42;
    eApelido.Width := 430;
    eApelido.Height := 25;
    eApelido.Font.Size := 10;
    eApelido.Text := Cartao.Apelido; // ⭐ PREENCHER COM DADOS ATUAIS

    // Número do Cartão
    lblNumero := TLabel.Create(pDados);
    lblNumero.Parent := pDados;
    lblNumero.Caption := 'Número do Cartão (últimos 4 dígitos):';
    lblNumero.Left := 30;
    lblNumero.Top := 80;
    lblNumero.Font.Size := 9;

    eNumeroCartao := TEdit.Create(pDados);
    eNumeroCartao.Parent := pDados;
    eNumeroCartao.Left := 30;
    eNumeroCartao.Top := 102;
    eNumeroCartao.Width := 200;
    eNumeroCartao.Height := 25;
    eNumeroCartao.Font.Size := 10;
    eNumeroCartao.MaxLength := 4;
    eNumeroCartao.NumbersOnly := True;
    eNumeroCartao.Text := Cartao.NumeroCartao; // ⭐ PREENCHER

    // Nome do Titular
    lblNome := TLabel.Create(pDados);
    lblNome.Parent := pDados;
    lblNome.Caption := 'Nome do Titular:';
    lblNome.Left := 30;
    lblNome.Top := 140;
    lblNome.Font.Size := 9;

    eNomeTitular := TEdit.Create(pDados);
    eNomeTitular.Parent := pDados;
    eNomeTitular.Left := 30;
    eNomeTitular.Top := 162;
    eNomeTitular.Width := 430;
    eNomeTitular.Height := 25;
    eNomeTitular.Font.Size := 10;
    eNomeTitular.CharCase := ecUpperCase;
    eNomeTitular.Text := Cartao.NomeTitular; // ⭐ PREENCHER

    // Bandeira
    lblBandeira := TLabel.Create(pDados);
    lblBandeira.Parent := pDados;
    lblBandeira.Caption := 'Bandeira:';
    lblBandeira.Left := 30;
    lblBandeira.Top := 200;
    lblBandeira.Font.Size := 9;

    cbBandeira := TComboBox.Create(pDados);
    cbBandeira.Parent := pDados;
    cbBandeira.Left := 30;
    cbBandeira.Top := 222;
    cbBandeira.Width := 200;
    cbBandeira.Height := 25;
    cbBandeira.Style := csDropDownList;
    cbBandeira.Items.Add('Visa');
    cbBandeira.Items.Add('Mastercard');
    cbBandeira.Items.Add('Elo');
    cbBandeira.Items.Add('American Express');
    cbBandeira.Items.Add('Hipercard');
    cbBandeira.Items.Add('Diners Club');
    cbBandeira.Items.Add('Outra');
    cbBandeira.Text := Cartao.Bandeira; // ⭐ PREENCHER

    // Tipo de Cartão
    lblTipo := TLabel.Create(pDados);
    lblTipo.Parent := pDados;
    lblTipo.Caption := 'Tipo:';
    lblTipo.Left := 260;
    lblTipo.Top := 200;
    lblTipo.Font.Size := 9;

    cbTipoCartao := TComboBox.Create(pDados);
    cbTipoCartao.Parent := pDados;
    cbTipoCartao.Left := 260;
    cbTipoCartao.Top := 222;
    cbTipoCartao.Width := 200;
    cbTipoCartao.Height := 25;
    cbTipoCartao.Style := csDropDownList;
    cbTipoCartao.Items.Add('Crédito');
    cbTipoCartao.Items.Add('Débito');
    cbTipoCartao.Text := Cartao.TipoCartao; // ⭐ PREENCHER

    // Validade
    lblValidade := TLabel.Create(pDados);
    lblValidade.Parent := pDados;
    lblValidade.Caption := 'Validade (MM/AAAA):';
    lblValidade.Left := 30;
    lblValidade.Top := 260;
    lblValidade.Font.Size := 9;

    eValidade := TEdit.Create(pDados);
    eValidade.Parent := pDados;
    eValidade.Left := 30;
    eValidade.Top := 282;
    eValidade.Width := 120;
    eValidade.Height := 25;
    eValidade.Font.Size := 10;
    eValidade.MaxLength := 7;
    eValidade.Text := Cartao.Validade; // ⭐ PREENCHER

    // CheckBox Principal
    chkPrincipal := TCheckBox.Create(pDados);
    chkPrincipal.Parent := pDados;
    chkPrincipal.Caption := 'Definir como forma de pagamento principal';
    chkPrincipal.Left := 30;
    chkPrincipal.Top := 330;
    chkPrincipal.Width := 350;
    chkPrincipal.Font.Size := 9;
    chkPrincipal.Font.Style := [fsBold];
    chkPrincipal.Checked := Cartao.Principal; // ⭐ PREENCHER

    // ========== PAINEL DE BOTÕES ==========
    pBotoes := TPanel.Create(pFundo);
    pBotoes.Parent := pFundo;
    pBotoes.Align := alBottom;
    pBotoes.Height := 70;
    pBotoes.BevelOuter := bvNone;
    pBotoes.Color := $00EEEEEE;
    pBotoes.ParentBackground := False;

    // Botão Cancelar
    btnCancelar := TButton.Create(pBotoes);
    btnCancelar.Parent := pBotoes;
    btnCancelar.Caption := 'Cancelar';
    btnCancelar.Left := 250;
    btnCancelar.Top := 15;
    btnCancelar.Width := 110;
    btnCancelar.Height := 40;
    btnCancelar.Font.Size := 10;
    btnCancelar.Font.Style := [fsBold];
    btnCancelar.Cursor := crHandPoint;
    btnCancelar.ModalResult := mrCancel;

    // Botão Salvar
    btnSalvar := TButton.Create(pBotoes);
    btnSalvar.Parent := pBotoes;
    btnSalvar.Caption := 'Salvar Alterações';
    btnSalvar.Left := 370;
    btnSalvar.Top := 15;
    btnSalvar.Width := 110;
    btnSalvar.Height := 40;
    btnSalvar.Font.Size := 10;
    btnSalvar.Font.Style := [fsBold];
    btnSalvar.Cursor := crHandPoint;
    btnSalvar.ModalResult := mrOk;

    // ========== EXIBIR E PROCESSAR ==========
    if FormEdicao.ShowModal = mrOk then
    begin
      // Atualizar dados do objeto
      Cartao.Apelido := Trim(eApelido.Text);
      Cartao.NumeroCartao := Trim(eNumeroCartao.Text);
      Cartao.NomeTitular := Trim(eNomeTitular.Text);
      Cartao.Bandeira := cbBandeira.Text;
      Cartao.TipoCartao := cbTipoCartao.Text;
      Cartao.Validade := Trim(eValidade.Text);
      Cartao.Principal := chkPrincipal.Checked;

      // Validar dados
      if not Cartao.ValidarDados(MsgErro) then
      begin
        ShowMessage('❌ ' + MsgErro);
        Exit;
      end;

      // Atualizar no banco
      if FPagamentoController.AtualizarCartao(Cartao) then
      begin
        ShowMessage('✅ Cartão atualizado com sucesso!');
        CarregarPagamentos; // Recarregar lista
      end
      else
        ShowMessage('❌ Erro ao atualizar cartão!');
    end;

  finally
    FormEdicao.Free;
  end;
end;


procedure TFormHomeC.EditarPix(Pix: TPagamentoPix);
var
  FormEdicao: TForm;
  pFundo, pHeader, pDados, pBotoes: TPanel;
  lblTitulo, lblChave, lblTipo, lblApelido: TLabel;
  eChavePix, eApelido: TEdit;
  cbTipoChave: TComboBox;
  chkPrincipal: TCheckBox;
  btnSalvar, btnCancelar: TButton;
  MsgErro: String;
begin
  FormEdicao := TForm.Create(nil);
  try
    FormEdicao.BorderStyle := bsDialog;
    FormEdicao.Position := poScreenCenter;
    FormEdicao.Width := 500;
    FormEdicao.Height := 420;
    FormEdicao.Caption := 'Editar Pix';
    FormEdicao.Color := $00F5F5F5;
    FormEdicao.Font.Name := 'Segoe UI';

    // ========== PAINEL DE FUNDO ==========
    pFundo := TPanel.Create(FormEdicao);
    pFundo.Parent := FormEdicao;
    pFundo.Align := alClient;
    pFundo.BevelOuter := bvNone;
    pFundo.Color := $00F5F5F5;
    pFundo.ParentBackground := False;

    // ========== HEADER ==========
    pHeader := TPanel.Create(pFundo);
    pHeader.Parent := pFundo;
    pHeader.Align := alTop;
    pHeader.Height := 60;
    pHeader.BevelOuter := bvNone;
    pHeader.Color := $00517CFF;
    pHeader.ParentBackground := False;

    lblTitulo := TLabel.Create(pHeader);
    lblTitulo.Parent := pHeader;
    lblTitulo.Caption := '✏️ Editar Pix';
    lblTitulo.Font.Size := 14;
    lblTitulo.Font.Style := [fsBold];
    lblTitulo.Font.Color := clWhite;
    lblTitulo.Left := 20;
    lblTitulo.Top := 20;
    lblTitulo.Transparent := True;

    // ========== PAINEL DE DADOS ==========
    pDados := TPanel.Create(pFundo);
    pDados.Parent := pFundo;
    pDados.Align := alClient;
    pDados.BevelOuter := bvNone;
    pDados.Color := $00F5F5F5;
    pDados.ParentBackground := False;

    // Apelido
    lblApelido := TLabel.Create(pDados);
    lblApelido.Parent := pDados;
    lblApelido.Caption := 'Apelido:';
    lblApelido.Left := 30;
    lblApelido.Top := 20;
    lblApelido.Font.Size := 9;

    eApelido := TEdit.Create(pDados);
    eApelido.Parent := pDados;
    eApelido.Left := 30;
    eApelido.Top := 42;
    eApelido.Width := 430;
    eApelido.Height := 25;
    eApelido.Font.Size := 10;
    eApelido.Text := Pix.Apelido; // ⭐ PREENCHER

    // Tipo de Chave
    lblTipo := TLabel.Create(pDados);
    lblTipo.Parent := pDados;
    lblTipo.Caption := 'Tipo de Chave:';
    lblTipo.Left := 30;
    lblTipo.Top := 80;
    lblTipo.Font.Size := 9;

    cbTipoChave := TComboBox.Create(pDados);
    cbTipoChave.Parent := pDados;
    cbTipoChave.Left := 30;
    cbTipoChave.Top := 102;
    cbTipoChave.Width := 430;
    cbTipoChave.Height := 25;
    cbTipoChave.Style := csDropDownList;
    cbTipoChave.Items.Add('CPF');
    cbTipoChave.Items.Add('CNPJ');
    cbTipoChave.Items.Add('Email');
    cbTipoChave.Items.Add('Telefone');
    cbTipoChave.Items.Add('Aleatória');
    cbTipoChave.Text := Pix.TipoChavePix; // ⭐ PREENCHER

    // Chave Pix
    lblChave := TLabel.Create(pDados);
    lblChave.Parent := pDados;
    lblChave.Caption := 'Chave Pix:';
    lblChave.Left := 30;
    lblChave.Top := 140;
    lblChave.Font.Size := 9;

    eChavePix := TEdit.Create(pDados);
    eChavePix.Parent := pDados;
    eChavePix.Left := 30;
    eChavePix.Top := 162;
    eChavePix.Width := 430;
    eChavePix.Height := 25;
    eChavePix.Font.Size := 10;
    eChavePix.Text := Pix.ChavePix; // ⭐ PREENCHER

    // CheckBox Principal
    chkPrincipal := TCheckBox.Create(pDados);
    chkPrincipal.Parent := pDados;
    chkPrincipal.Caption := 'Definir como forma de pagamento principal';
    chkPrincipal.Left := 30;
    chkPrincipal.Top := 210;
    chkPrincipal.Width := 350;
    chkPrincipal.Font.Size := 9;
    chkPrincipal.Font.Style := [fsBold];
    chkPrincipal.Checked := Pix.Principal; // ⭐ PREENCHER

    // ========== PAINEL DE BOTÕES ==========
    pBotoes := TPanel.Create(pFundo);
    pBotoes.Parent := pFundo;
    pBotoes.Align := alBottom;
    pBotoes.Height := 70;
    pBotoes.BevelOuter := bvNone;
    pBotoes.Color := $00EEEEEE;
    pBotoes.ParentBackground := False;

    // Botão Cancelar
    btnCancelar := TButton.Create(pBotoes);
    btnCancelar.Parent := pBotoes;
    btnCancelar.Caption := 'Cancelar';
    btnCancelar.Left := 250;
    btnCancelar.Top := 15;
    btnCancelar.Width := 110;
    btnCancelar.Height := 40;
    btnCancelar.Font.Size := 10;
    btnCancelar.Font.Style := [fsBold];
    btnCancelar.Cursor := crHandPoint;
    btnCancelar.ModalResult := mrCancel;

    // Botão Salvar
    btnSalvar := TButton.Create(pBotoes);
    btnSalvar.Parent := pBotoes;
    btnSalvar.Caption := 'Salvar Alterações';
    btnSalvar.Left := 370;
    btnSalvar.Top := 15;
    btnSalvar.Width := 110;
    btnSalvar.Height := 40;
    btnSalvar.Font.Size := 10;
    btnSalvar.Font.Style := [fsBold];
    btnSalvar.Cursor := crHandPoint;
    btnSalvar.ModalResult := mrOk;

    // ========== EXIBIR E PROCESSAR ==========
    if FormEdicao.ShowModal = mrOk then
    begin
      // Atualizar dados do objeto
      Pix.Apelido := Trim(eApelido.Text);
      Pix.ChavePix := Trim(eChavePix.Text);
      Pix.TipoChavePix := cbTipoChave.Text;
      Pix.Principal := chkPrincipal.Checked;

      // Validar dados
      if not Pix.ValidarDados(MsgErro) then
      begin
        ShowMessage('❌ ' + MsgErro);
        Exit;
      end;

      // Atualizar no banco
      if FPagamentoController.AtualizarPix(Pix) then
      begin
        ShowMessage('✅ Pix atualizado com sucesso!');
        CarregarPagamentos; // Recarregar lista
      end
      else
        ShowMessage('❌ Erro ao atualizar Pix!');
    end;

  finally
    FormEdicao.Free;
  end;
end;


procedure TFormHomeC.EditarTransferencia(
  Transferencia: TPagamentoTransferencia);
var
  FormEdicao: TForm;
  pFundo, pHeader, pDados, pBotoes: TPanel;
  lblTitulo, lblBanco, lblCodigo, lblAgencia, lblConta, lblDigito, lblTipo, lblApelido: TLabel;
  eBanco, eCodigoBanco, eAgencia, eConta, eDigitoConta, eApelido: TEdit;
  cbTipoConta: TComboBox;
  chkPrincipal: TCheckBox;
  btnSalvar, btnCancelar: TButton;
  MsgErro: String;
begin
  FormEdicao := TForm.Create(nil);
  try
    FormEdicao.BorderStyle := bsDialog;
    FormEdicao.Position := poScreenCenter;
    FormEdicao.Width := 500;
    FormEdicao.Height := 600;
    FormEdicao.Caption := 'Editar Transferência Bancária';
    FormEdicao.Color := $00F5F5F5;
    FormEdicao.Font.Name := 'Segoe UI';

    // ========== PAINEL DE FUNDO ==========
    pFundo := TPanel.Create(FormEdicao);
    pFundo.Parent := FormEdicao;
    pFundo.Align := alClient;
    pFundo.BevelOuter := bvNone;
    pFundo.Color := $00F5F5F5;
    pFundo.ParentBackground := False;

    // ========== HEADER ==========
    pHeader := TPanel.Create(pFundo);
    pHeader.Parent := pFundo;
    pHeader.Align := alTop;
    pHeader.Height := 60;
    pHeader.BevelOuter := bvNone;
    pHeader.Color := $00517CFF;
    pHeader.ParentBackground := False;

    lblTitulo := TLabel.Create(pHeader);
    lblTitulo.Parent := pHeader;
    lblTitulo.Caption := '✏️ Editar Transferência Bancária';
    lblTitulo.Font.Size := 14;
    lblTitulo.Font.Style := [fsBold];
    lblTitulo.Font.Color := clWhite;
    lblTitulo.Left := 20;
    lblTitulo.Top := 20;
    lblTitulo.Transparent := True;

    // ========== PAINEL DE DADOS ==========
    pDados := TPanel.Create(pFundo);
    pDados.Parent := pFundo;
    pDados.Align := alClient;
    pDados.BevelOuter := bvNone;
    pDados.Color := $00F5F5F5;
    pDados.ParentBackground := False;

    // Apelido
    lblApelido := TLabel.Create(pDados);
    lblApelido.Parent := pDados;
    lblApelido.Caption := 'Apelido:';
    lblApelido.Left := 30;
    lblApelido.Top := 20;
    lblApelido.Font.Size := 9;

    eApelido := TEdit.Create(pDados);
    eApelido.Parent := pDados;
    eApelido.Left := 30;
    eApelido.Top := 42;
    eApelido.Width := 430;
    eApelido.Height := 25;
    eApelido.Font.Size := 10;
    eApelido.Text := Transferencia.Apelido; // ⭐ PREENCHER

    // Banco
    lblBanco := TLabel.Create(pDados);
    lblBanco.Parent := pDados;
    lblBanco.Caption := 'Nome do Banco:';
    lblBanco.Left := 30;
    lblBanco.Top := 80;
    lblBanco.Font.Size := 9;

    eBanco := TEdit.Create(pDados);
    eBanco.Parent := pDados;
    eBanco.Left := 30;
    eBanco.Top := 102;
    eBanco.Width := 280;
    eBanco.Height := 25;
    eBanco.Font.Size := 10;
    eBanco.Text := Transferencia.Banco; // ⭐ PREENCHER

    // Código do Banco
    lblCodigo := TLabel.Create(pDados);
    lblCodigo.Parent := pDados;
    lblCodigo.Caption := 'Código:';
    lblCodigo.Left := 330;
    lblCodigo.Top := 80;
    lblCodigo.Font.Size := 9;

    eCodigoBanco := TEdit.Create(pDados);
    eCodigoBanco.Parent := pDados;
    eCodigoBanco.Left := 330;
    eCodigoBanco.Top := 102;
    eCodigoBanco.Width := 130;
    eCodigoBanco.Height := 25;
    eCodigoBanco.Font.Size := 10;
    eCodigoBanco.MaxLength := 3;
    eCodigoBanco.NumbersOnly := True;
    eCodigoBanco.Text := Transferencia.CodigoBanco; // ⭐ PREENCHER

    // Agência
    lblAgencia := TLabel.Create(pDados);
    lblAgencia.Parent := pDados;
    lblAgencia.Caption := 'Agência:';
    lblAgencia.Left := 30;
    lblAgencia.Top := 140;
    lblAgencia.Font.Size := 9;

    eAgencia := TEdit.Create(pDados);
    eAgencia.Parent := pDados;
    eAgencia.Left := 30;
    eAgencia.Top := 162;
    eAgencia.Width := 150;
    eAgencia.Height := 25;
    eAgencia.Font.Size := 10;
    eAgencia.NumbersOnly := True;
    eAgencia.Text := Transferencia.Agencia; // ⭐ PREENCHER

    // Conta
    lblConta := TLabel.Create(pDados);
    lblConta.Parent := pDados;
    lblConta.Caption := 'Conta:';
    lblConta.Left := 200;
    lblConta.Top := 140;
    lblConta.Font.Size := 9;

    eConta := TEdit.Create(pDados);
    eConta.Parent := pDados;
    eConta.Left := 200;
    eConta.Top := 162;
    eConta.Width := 180;
    eConta.Height := 25;
    eConta.Font.Size := 10;
    eConta.NumbersOnly := True;
    eConta.Text := Transferencia.Conta; // ⭐ PREENCHER

    // Dígito
    lblDigito := TLabel.Create(pDados);
    lblDigito.Parent := pDados;
    lblDigito.Caption := 'Dígito:';
    lblDigito.Left := 400;
    lblDigito.Top := 140;
    lblDigito.Font.Size := 9;

    eDigitoConta := TEdit.Create(pDados);
    eDigitoConta.Parent := pDados;
    eDigitoConta.Left := 400;
    eDigitoConta.Top := 162;
    eDigitoConta.Width := 60;
    eDigitoConta.Height := 25;
    eDigitoConta.Font.Size := 10;
    eDigitoConta.MaxLength := 1;
    eDigitoConta.Text := Transferencia.DigitoC; // ⭐ PREENCHER

    // Tipo de Conta
    lblTipo := TLabel.Create(pDados);
    lblTipo.Parent := pDados;
    lblTipo.Caption := 'Tipo de Conta:';
    lblTipo.Left := 30;
    lblTipo.Top := 200;
    lblTipo.Font.Size := 9;

    cbTipoConta := TComboBox.Create(pDados);
    cbTipoConta.Parent := pDados;
    cbTipoConta.Left := 30;
    cbTipoConta.Top := 222;
    cbTipoConta.Width := 200;
    cbTipoConta.Height := 25;
    cbTipoConta.Style := csDropDownList;
    cbTipoConta.Items.Add('Corrente');
    cbTipoConta.Items.Add('Poupança');
    cbTipoConta.Text := Transferencia.TipoConta; // ⭐ PREENCHER

    // CheckBox Principal
    chkPrincipal := TCheckBox.Create(pDados);
    chkPrincipal.Parent := pDados;
    chkPrincipal.Caption := 'Definir como forma de pagamento principal';
    chkPrincipal.Left := 30;
    chkPrincipal.Top := 270;
    chkPrincipal.Width := 350;
    chkPrincipal.Font.Size := 9;
    chkPrincipal.Font.Style := [fsBold];
    chkPrincipal.Checked := Transferencia.Principal; // ⭐ PREENCHER

    // ========== PAINEL DE BOTÕES ==========
    pBotoes := TPanel.Create(pFundo);
    pBotoes.Parent := pFundo;
    pBotoes.Align := alBottom;
    pBotoes.Height := 70;
    pBotoes.BevelOuter := bvNone;
    pBotoes.Color := $00EEEEEE;
    pBotoes.ParentBackground := False;

    // Botão Cancelar
    btnCancelar := TButton.Create(pBotoes);
    btnCancelar.Parent := pBotoes;
    btnCancelar.Caption := 'Cancelar';
    btnCancelar.Left := 250;
    btnCancelar.Top := 15;
    btnCancelar.Width := 110;
    btnCancelar.Height := 40;
    btnCancelar.Font.Size := 10;
    btnCancelar.Font.Style := [fsBold];
    btnCancelar.Cursor := crHandPoint;
    btnCancelar.ModalResult := mrCancel;

    // Botão Salvar
    btnSalvar := TButton.Create(pBotoes);
    btnSalvar.Parent := pBotoes;
    btnSalvar.Caption := 'Salvar Alterações';
    btnSalvar.Left := 370;
    btnSalvar.Top := 15;
    btnSalvar.Width := 110;
    btnSalvar.Height := 40;
    btnSalvar.Font.Size := 10;
    btnSalvar.Font.Style := [fsBold];
    btnSalvar.Cursor := crHandPoint;
    btnSalvar.ModalResult := mrOk;

    // ========== EXIBIR E PROCESSAR ==========
    if FormEdicao.ShowModal = mrOk then
    begin
      // Atualizar dados do objeto
      Transferencia.Apelido := Trim(eApelido.Text);
      Transferencia.Banco := Trim(eBanco.Text);
      Transferencia.CodigoBanco := Trim(eCodigoBanco.Text);
      Transferencia.Agencia := Trim(eAgencia.Text);
      Transferencia.Conta := Trim(eConta.Text);
      Transferencia.DigitoC := Trim(eDigitoConta.Text);
      Transferencia.TipoConta := cbTipoConta.Text;
      Transferencia.Principal := chkPrincipal.Checked;

      // Validar dados
      if not Transferencia.ValidarDados(MsgErro) then
      begin
        ShowMessage('❌ ' + MsgErro);
        Exit;
      end;

      // Atualizar no banco
      if FPagamentoController.AtualizarTransferencia(Transferencia) then
      begin
        ShowMessage('✅ Transferência atualizada com sucesso!');
        CarregarPagamentos; // Recarregar lista
      end
      else
        ShowMessage('❌ Erro ao atualizar transferência!');
    end;

  finally
    FormEdicao.Free;
  end;
end;

procedure TFormHomeC.eQuantidadeProdutoSelecChange(Sender: TObject);
var
  Qtd: Integer;
begin
  if TryStrToInt(eQuantidadeProdutoSelec.Text, Qtd) then
  begin
    if (Qtd >= 1) and (Qtd <= 99) then
      AtualizarSubtotalProduto
    else if Qtd < 1 then
      eQuantidadeProdutoSelec.Text := '1'
    else if Qtd > 99 then
      eQuantidadeProdutoSelec.Text := '99';
  end
  else
  begin
    eQuantidadeProdutoSelec.Text := '1';
  end;
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

procedure TFormHomeC.ExibirMensagemNenhumResultadoLojas;
var
  pMensagem: TPanel;
  lblMensagem, lblDica: TLabel;
  LarguraCard: Integer;
begin
  LarguraCard := scbxComerciosL.ClientWidth - (FMargemLateral * 2);
  if LarguraCard < 200 then
    LarguraCard := 200;

  pMensagem := TPanel.Create(scbxComerciosL);
  pMensagem.Parent := scbxComerciosL;
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
  lblDica.Caption := 'Tente buscar por outra categoria';
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
  pMensagem := TPanel.Create(scbxPagamentos);
  pMensagem.Parent := scbxPagamentos;
  pMensagem.Left := 10;
  pMensagem.Top := 10;
  pMensagem.Width := scbxPagamentos.ClientWidth - 20;
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
  pcMain.ActivePageIndex := 1; // tsLojas
  PopularCategoriasLojas;
  PopularRestaurantesLojas(FCategoriaSelecionadaLojas);
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

procedure TFormHomeC.iButtonBackLojasClick(Sender: TObject);
begin
  FecharTelaProduto;
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
  // Ir para aba do carrinho
  pcMain.ActivePageIndex := 4; // tsCarrinho

  // ⭐ IMPORTANTE: Recarregar itens com os cards completos
  CarregarItensCarrinho; // Este método cria os cards com botões +/-

  // Atualizar resumo
  AtualizarResumoCarrinho;
end;

{ TCardEventHandler }

constructor TCardEventHandler.Create(AFormSelecao: TForm);
begin
  inherited Create;
  FFormSelecao := AFormSelecao;
  FTipoSelecionado := 0;
end;

procedure TCardEventHandler.OnCardClick(Sender: TObject);
begin
  if Sender is TPanel then
    FTipoSelecionado := TPanel(Sender).Tag
  else if Sender is TLabel then
    FTipoSelecionado := TPanel(TLabel(Sender).Parent).Tag;

  if Assigned(FFormSelecao) then
    FFormSelecao.ModalResult := mrOk;
end;
procedure TCardEventHandler.OnCardMouseEnter(Sender: TObject);
begin
  if Sender is TPanel then
  begin
    TPanel(Sender).Color := $00FFF4E6;
    TPanel(Sender).BringToFront;
  end;
end;

procedure TCardEventHandler.OnCardMouseLeave(Sender: TObject);
begin
  if Sender is TPanel then
    TPanel(Sender).Color := clWhite;
end;

end.
