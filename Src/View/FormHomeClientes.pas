unit FormHomeClientes;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.StrUtils, System.Variants, System.Classes, System.Types,
  System.Generics.Collections, System.DateUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ComCtrls, Vcl.Mask,
  Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Stan.Param, FireDAC.Stan.Intf,
  uConn, ComercioModel, ClienteController, CategoriaHelper;

type
  TCardComercioPanel = class(TPanel)
  private
    FIdComercio: Integer;
    FNomeComercio: String;
    FCategoria: String;
    FTaxa: String;
    FHorario: String;
    FEstaAberto: Boolean;
    FDescricao: String;
    procedure PanelClick(Sender: TObject);
    procedure PanelMouseEnter(Sender: TObject);
    procedure PanelMouseLeave(Sender: TObject);
  public
    constructor CreateCard(AOwner: TComponent; IdComercio: Integer;
      const Nome, Categoria, Taxa, Horario, Descricao: String; EstaAberto: Boolean);
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
    lblEnderecoAtual: TLabel;
    pButtonAddEndereco: TPanel;
    cbEnderecos: TComboBox;
    tsLojas: TTabSheet;
    tsPerfil: TTabSheet;
    tsPedidos: TTabSheet;
    tsCarrinho: TTabSheet;
    pBusca: TPanel;
    lblUserName: TLabel;
    lblUserId: TLabel;
    eBuscaMain: TEdit;
    tsCommSelec: TTabSheet;
    eBuscaProdutoComm: TEdit;
    scbxMainCommSelec: TScrollBox;
    pCarrinhoComm: TPanel;
    lblItensCart: TLabel;
    lblTotalCart: TLabel;
    pButtonCartComm: TPanel;
    pCategoriasProdutosComm: TPanel;
    scbxCategoriasProdutosComm: TScrollBox;
    lblCategoriasProdutos: TLabel;
    pInfoComm: TPanel;
    lblNomeComm: TLabel;
    iButtonBackComm: TImage;
    lblNota: TLabel;
    lblTaxaEntrega: TLabel;
    lblHorarioFunc: TLabel;
    lblCategoria: TLabel;
    pButtonAvalienos: TPanel;
    pProdutosComm: TPanel;
    scbxProdutosComm: TScrollBox;
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
    tsEditarPerfil: TTabSheet;
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
    pButtonEditar: TPanel;
    lblEnderecos: TLabel;
    lblFormasPagamento: TLabel;
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
    eLogradouroCommDE: TEdit;
    eNumeroEnderecoCommDE: TEdit;
    eCidadeCommDE: TEdit;
    eBairroCommDE: TEdit;
    eComplementoCommDE: TEdit;
    meCEPCommDE: TMaskEdit;
    cbEstadoCommDE: TComboBox;
    pButtonSalvarDadosE: TPanel;
    pHeaderEnderecoNovo: TPanel;
    lblAddEndereco: TLabel;
    iButtonBackEnderecoNovo: TImage;
    Panel2: TPanel;
    tsEnderecosE: TTabSheet;
    tsPagamentosE: TTabSheet;
    scbxMainEnderecosE: TScrollBox;
    pEnderecosE: TPanel;
    scbxEnderecosE: TScrollBox;
    lblEnderecosTitle: TLabel;
    pHeaderEnderecosE: TPanel;
    lblPerfilTitleEnderecosE: TLabel;
    iButtonBackEnderecosE: TImage;
    pButtonAlterarSenhaEnderecosE: TPanel;
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

    procedure iButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure eBuscaMainChange(Sender: TObject);
    procedure eBuscaMainKeyPress(Sender: TObject; var Key: Char);
    procedure FormResize(Sender: TObject);

  private
    FIdUsuario: Integer;
    FNomeUsuario: String;
    FController: TClienteController;
    FInicializado: Boolean;
    FBuscaTimer: TTimer;
    FUltimaBusca: String;
    FCategoriaSelecionada: String; // ⭐ NOVO - controla filtro

    // Configurações de layout
    FCardHeight: Integer;
    FCardSpacing: Integer;
    FMargemLateral: Integer;

    procedure InicializarController;
    procedure PopularCategorias; // ⭐ NOVO
    procedure PopularRestaurantes(const Categoria: String = ''); // ⭐ ATUALIZADO
    procedure BuscarComercios(const Termo: string);
    function ComercioEstaAberto(HorarioAbertura, HorarioFechamento: TTime): Boolean;
    procedure LimparCardsRestaurantes; // ⭐ RENOMEADO
    procedure AdicionarCardComercio(Comercio: TComercio; EstaAberto: Boolean; Index: Integer);
    procedure AbrirCardapio(IdComercio: Integer; const NomeComercio: String);
    procedure OnBuscaTimer(Sender: TObject);
    procedure LimparBusca;
    procedure ExibirMensagemNenhumResultado;
    procedure ConfigurarLayout;
    procedure AjustarScrollBox;
    procedure OnCategoriaClick(const Categoria: string); // ⭐ NOVO

  public
    property IdUsuario: Integer read FIdUsuario write FIdUsuario;
    property NomeUsuario: String read FNomeUsuario write FNomeUsuario;
  end;

var
  FormHomeC: TFormHomeC;

implementation

{$R *.dfm}

{ TCardComercioPanel }

constructor TCardComercioPanel.CreateCard(AOwner: TComponent; IdComercio: Integer;
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

  // Configurações do painel
  Self.ParentBackground := False;
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
  lblNome.Font.Color := clBlack;
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
  lblCategoria.Font.Color := $00808080;
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
  lblTaxa.Font.Color := $00FF6600;
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
  lblHorario.Font.Color := $00666666;
  lblHorario.Cursor := crHandPoint;
  lblHorario.OnClick := PanelClick;
  lblHorario.Transparent := True;
  Inc(Y, 20);

  // Badge Status (canto superior direito)
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
    pStatus.Color := $0000BB00;  // Verde
    pStatus.Font.Color := clWhite;
  end
  else
  begin
    pStatus.Color := $000000BB;  // Vermelho
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
  lblDescricao.Font.Color := $00999999;
  lblDescricao.Cursor := crHandPoint;
  lblDescricao.OnClick := PanelClick;
  lblDescricao.AutoSize := False;
  lblDescricao.Width := Self.Width - 130;
  lblDescricao.WordWrap := True;
  lblDescricao.Transparent := True;
end;

procedure TCardComercioPanel.PanelClick(Sender: TObject);
begin
  if Assigned(Self.Owner) and (Self.Owner is TFormHomeC) then
    TFormHomeC(Self.Owner).AbrirCardapio(FIdComercio, FNomeComercio);
end;

procedure TCardComercioPanel.PanelMouseEnter(Sender: TObject);
begin
  Self.Color := $00F5F5F5;  // Cinza bem claro
end;

procedure TCardComercioPanel.PanelMouseLeave(Sender: TObject);
begin
  Self.Color := clWhite;
end;

{ TFormHomeC }

procedure TFormHomeC.FormCreate(Sender: TObject);
begin
  FInicializado := False;
  FController := nil;
  FUltimaBusca := '';
  FCategoriaSelecionada := 'Todos'; // ⭐ NOVO - inicia com "Todos"

  // Configurações de layout
  FCardHeight := 145;
  FCardSpacing := 15;
  FMargemLateral := 20;

  // Timer para debounce
  FBuscaTimer := TTimer.Create(Self);
  FBuscaTimer.Enabled := False;
  FBuscaTimer.Interval := 500;
  FBuscaTimer.OnTimer := OnBuscaTimer;

  // Configurar campo de busca
  eBuscaMain.TextHint := '🔍 Pesquise restaurantes, lojas, categorias...';
  eBuscaMain.Text := '';
  eBuscaMain.Font.Size := 10;

  // Configurar layout
  ConfigurarLayout;
end;

procedure TFormHomeC.ConfigurarLayout;
begin
  // Configurar ScrollBox principal
  if Assigned(scbxMain) then
  begin
    scbxMain.Align := alClient;
    scbxMain.AlignWithMargins := False;
    scbxMain.VertScrollBar.Tracking := True;
    scbxMain.VertScrollBar.Smooth := True;
    scbxMain.VertScrollBar.Increment := 20;
    scbxMain.HorzScrollBar.Visible := False;
    scbxMain.BorderStyle := bsNone;
    scbxMain.Color := $00F8F8F8;
    scbxMain.ParentColor := False;
  end;

  // ⭐ Configurar ScrollBox de CATEGORIAS (horizontal)
  if Assigned(scbxCategorias) then
  begin
    scbxCategorias.HorzScrollBar.Visible := True;
    scbxCategorias.HorzScrollBar.Tracking := True;
    scbxCategorias.HorzScrollBar.Smooth := True;
    scbxCategorias.VertScrollBar.Visible := False;
    scbxCategorias.BorderStyle := bsNone;
    scbxCategorias.Color := clWhite;
  end;

  // ⭐ Configurar ScrollBox de RESTAURANTES (vertical)
  if Assigned(scbxRestaurantes) then
  begin
    scbxRestaurantes.VertScrollBar.Visible := True;
    scbxRestaurantes.VertScrollBar.Tracking := True;
    scbxRestaurantes.VertScrollBar.Smooth := True;
    scbxRestaurantes.VertScrollBar.Increment := 20;
    scbxRestaurantes.HorzScrollBar.Visible := False;
    scbxRestaurantes.BorderStyle := bsNone;
    scbxRestaurantes.Color := $00F8F8F8;
  end;

  // Garantir que painéis superiores estão posicionados
  if Assigned(pBusca) then
  begin
    pBusca.Align := alTop;
    pBusca.Height := 60;
  end;

  if Assigned(pEndereco) then
  begin
    pEndereco.Align := alTop;
    pEndereco.Height := 50;
  end;

  if Assigned(pCategorias) then
  begin
    pCategorias.Align := alTop;
    pCategorias.Height := 70; // Altura suficiente para os chips
  end;

  if Assigned(pRestaurantes) then
  begin
    pRestaurantes.Align := alClient; // Ocupa o restante do espaço
  end;
end;

procedure TFormHomeC.FormResize(Sender: TObject);
begin
  AjustarScrollBox;
end;

procedure TFormHomeC.AjustarScrollBox;
var
  I: Integer;
  Card: TCardComercioPanel;
  NovaLargura: Integer;
begin
  if not Assigned(scbxRestaurantes) then
    Exit;

  // Calcular nova largura dos cards
  NovaLargura := scbxRestaurantes.ClientWidth - (FMargemLateral * 2) - 10;

  // Ajustar largura de todos os cards existentes
  for I := 0 to scbxRestaurantes.ControlCount - 1 do
  begin
    if scbxRestaurantes.Controls[I] is TCardComercioPanel then
    begin
      Card := TCardComercioPanel(scbxRestaurantes.Controls[I]);
      Card.Width := NovaLargura;
    end;
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

    FInicializado := True;

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao inicializar: ' + E.Message);
      FInicializado := False;
    end;
  end;
end;

procedure TFormHomeC.FormDestroy(Sender: TObject);
begin
  if Assigned(FBuscaTimer) then
    FBuscaTimer.Free;

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
    // ⭐ Popular categorias primeiro
    PopularCategorias;

    // ⭐ Depois popular restaurantes
    PopularRestaurantes('Todos');
  except
    on E: Exception do
      ShowMessage('Erro ao carregar dados: ' + E.Message);
  end;
end;

// ⭐⭐⭐ NOVO - Popular chips de categorias
procedure TFormHomeC.PopularCategorias;
begin
  if not Assigned(scbxCategorias) then
  begin
    ShowMessage('Erro: scbxCategorias não existe no formulário!');
    Exit;
  end;

  try
    TCategoriaHelper.PopularScrollBoxCategorias(scbxCategorias, OnCategoriaClick);
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao carregar categorias: ' + E.Message + #13#10 +
                  'Verifique se o banco de dados está conectado.');
    end;
  end;
end;

// ⭐⭐⭐ NOVO - Evento quando clica em uma categoria
procedure TFormHomeC.OnCategoriaClick(const Categoria: string);
begin
  FCategoriaSelecionada := Categoria;

  // Atualizar seleção visual
  TCategoriaHelper.DeselecionarTodas(scbxCategorias);
  TCategoriaHelper.SelecionarCategoria(scbxCategorias, Categoria);

  // Recarregar restaurantes com filtro
  PopularRestaurantes(Categoria);
end;

// ⭐⭐⭐ ATUALIZADO - Popular restaurantes com filtro de categoria
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
      // Buscar todos os comércios
      Comercios := FController.ListarComerciosDisponiveis(True);

      if not Assigned(Comercios) then
      begin
        ShowMessage('Erro ao buscar comércios do banco!');
        Exit;
      end;

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
            // ⭐ Aplicar filtro de categoria
            if (Categoria = 'Todos') or (Categoria = '') or
               (AnsiUpperCase(Comercio.Categoria) = AnsiUpperCase(Categoria)) then
            begin
              EstaAberto := ComercioEstaAberto(Comercio.HorarioAbertura, Comercio.HorarioFechamento);
              AdicionarCardComercio(Comercio, EstaAberto, Index);
              Inc(Index);
            end;
          end;
        end;

        // Se nenhum restaurante foi adicionado após o filtro
        if Index = 0 then
          ExibirMensagemNenhumResultado;

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

// ⭐ RENOMEADO para deixar claro que limpa cards de restaurantes
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

procedure TFormHomeC.AdicionarCardComercio(Comercio: TComercio; EstaAberto: Boolean; Index: Integer);
var
  Card: TCardComercioPanel;
  Horario, Taxa: String;
  PosY: Integer;
  LarguraCard: Integer;
begin
  if not Assigned(Comercio) then
    Exit;

  // Calcular largura disponível
  LarguraCard := scbxRestaurantes.ClientWidth - (FMargemLateral * 2) - 10;
  if LarguraCard < 300 then
    LarguraCard := 300;

  // Calcular posição Y (empilhado verticalmente)
  PosY := FCardSpacing + (Index * (FCardHeight + FCardSpacing));

  // Formatar dados
  Horario := FormatDateTime('hh:nn', Comercio.HorarioAbertura) + ' - ' +
             FormatDateTime('hh:nn', Comercio.HorarioFechamento);
  Taxa := FormatFloat('R$ #,##0.00', Comercio.TaxaEntregaBase);

  // Criar o card
  Card := TCardComercioPanel.CreateCard(
    Self,
    Comercio.IdComercio,
    Comercio.NomeComercio,
    Comercio.Categoria,
    Taxa,
    Horario,
    Comercio.Descricao,
    EstaAberto
  );

  Card.Parent := scbxRestaurantes; // ⭐ MUDOU - agora vai para scbxRestaurantes
  Card.Left := FMargemLateral;
  Card.Top := PosY;
  Card.Width := LarguraCard;
  Card.Height := FCardHeight;
end;

procedure TFormHomeC.AbrirCardapio(IdComercio: Integer; const NomeComercio: String);
begin
  ShowMessage('Abrindo cardápio de: ' + NomeComercio + #13#10 +
              'ID: ' + IntToStr(IdComercio));
end;

// ⭐⭐⭐ SISTEMA DE BUSCA ⭐⭐⭐

procedure TFormHomeC.eBuscaMainChange(Sender: TObject);
begin
  if not FInicializado then
    Exit;

  FBuscaTimer.Enabled := False;

  if Trim(eBuscaMain.Text) = '' then
  begin
    FUltimaBusca := '';
    PopularRestaurantes(FCategoriaSelecionada); // ⭐ Respeita categoria selecionada
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

procedure TFormHomeC.ExibirMensagemNenhumResultado;
var
  pMensagem: TPanel;
  lblMensagem, lblDica: TLabel;
begin
  pMensagem := TPanel.Create(scbxRestaurantes);
  pMensagem.Parent := scbxRestaurantes;
  pMensagem.Left := FMargemLateral;
  pMensagem.Top := FCardSpacing;
  pMensagem.Width := scbxRestaurantes.ClientWidth - (FMargemLateral * 2) - 10;
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
  lblMensagem.Font.Color := $00808080;
  lblMensagem.Alignment := taCenter;
  lblMensagem.Left := 0;
  lblMensagem.Top := 50;
  lblMensagem.Width := pMensagem.Width;

  lblDica := TLabel.Create(pMensagem);
  lblDica.Parent := pMensagem;
  lblDica.Caption := 'Tente buscar por outro termo ou categoria';
  lblDica.Font.Name := 'Segoe UI';
  lblDica.Font.Size := 10;
  lblDica.Font.Color := $00999999;
  lblDica.Alignment := taCenter;
  lblDica.Left := 0;
  lblDica.Top := 85;
  lblDica.Width := pMensagem.Width;
end;

procedure TFormHomeC.iButton1Click(Sender: TObject);
begin
  if pBarraMenuLeft.Width = 57 then
  begin
    pBarraMenuLeft.Width := 225;
    pBarraMenuLeft.Height := 683;
  end
  else
  begin
    pBarraMenuLeft.Width := 57;
    pBarraMenuLeft.Height := 55;
  end;
end;

end.
