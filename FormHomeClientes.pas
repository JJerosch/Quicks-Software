unit FormHomeClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, uConn,
  System.Generics.Collections, ComercioModel, ClienteController,
  System.DateUtils, System.JSON, System.Net.HttpClient, System.Net.URLClient;

type
  // ============================================================================
  // CLASSE DO CARD DE COMÉRCIO - VERSÃO PROFISSIONAL REMASTERIZADA
  // ============================================================================
  TCardComercioPanel = class(TPanel)
  private
    FIdComercio: Integer;
    FNomeComercio: String;
    FCategoria: String;
    FTaxa: Currency;
    FHorarioAbertura: TTime;
    FHorarioFechamento: TTime;
    FEstaAberto: Boolean;
    FDescricao: String;
    FIdCategoria: Integer;

    // Componentes visuais
    FPanelContainer: TPanel;
    FPanelStatus: TPanel;
    FLabelNome: TLabel;
    FLabelCategoria: TLabel;
    FLabelTaxa: TLabel;
    FLabelHorario: TLabel;
    FLabelDescricao: TLabel;
    FPanelDivider: TPanel;

    procedure SetupVisualComponents;
    procedure OnMouseEnterCard(Sender: TObject);
    procedure OnMouseLeaveCard(Sender: TObject);
    procedure OnCardClick(Sender: TObject);
    procedure AtualizarStatus;

  public
    constructor Create(AOwner: TComponent;
                      IdComercio: Integer;
                      const Nome, Categoria, Descricao: String;
                      Taxa: Currency;
                      HorarioAbertura, HorarioFechamento: TTime;
                      IdCategoria: Integer = 0); reintroduce;
    property IdCategoria: Integer read FIdCategoria;
  end;

  // ============================================================================
  // RECORD PARA ENDEREÇO
  // ============================================================================
  TEndereco = record
    Id: Integer;
    IdCliente: Integer;
    Apelido: String;        // Ex: "Casa", "Trabalho", "Casa da mãe"
    CEP: String;
    Logradouro: String;
    Numero: String;
    Complemento: String;
    Bairro: String;
    Cidade: String;
    UF: String;
    Padrao: Boolean;        // Endereço padrão do cliente
  end;

  // ============================================================================
  // FORM PRINCIPAL
  // ============================================================================
  TFormHomeC = class(TForm)
    pHomeBackground: TPanel;
    pBusca: TPanel;
    Image1: TImage;
    eBuscaMain: TEdit;
    scbxMain: TScrollBox;
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
    pEndereco: TPanel;
    pCategorias: TPanel;

    procedure iButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure eBuscaMainChange(Sender: TObject);
    procedure FormResize(Sender: TObject);

  private
    FIdUsuario: Integer;
    FNomeUsuario: String;
    FController: TClienteController;
    FInicializado: Boolean;

    // Configurações de layout dos cards
    FCardWidth: Integer;
    FCardHeight: Integer;
    FCardSpacing: Integer;
    FCardsPerRow: Integer;

    // Componentes dinâmicos do painel de endereços
    FComboEndereco: TComboBox;
    FBtnAdicionarEndereco: TButton;
    FLabelEnderecoAtual: TLabel;
    FEnderecos: TList<TEndereco>;
    FIdCategoriaFiltro: Integer; // 0 = sem filtro

    procedure InicializarController;
    procedure InicializarLayoutForm;
    procedure InicializarPainelEndereco;
    procedure InicializarPainelCategorias;
    procedure PopularLista(ApenasAbertos: Boolean = True);
    procedure BuscarComercios(const Termo: string);
    function ComercioEstaAberto(HorarioAbertura, HorarioFechamento: TTime): Boolean;
    procedure LimparCards;
    procedure AdicionarCard(Comercio: TComercio; Index: Integer);
    procedure AbrirCardapio(IdComercio: Integer; const NomeComercio: String);
    procedure CalcularLayoutCards;

    // Métodos do painel de endereços
    procedure CarregarEnderecos;
    procedure OnComboEnderecoChange(Sender: TObject);
    procedure OnBtnAdicionarEnderecoClick(Sender: TObject);
    procedure AtualizarEnderecoSelecionado;

    // Métodos do painel de categorias
    procedure CarregarCategorias;
    procedure OnCategoriaPanelClick(Sender: TObject);
    procedure FiltrarPorCategoria(IdCategoria: Integer);

  public
    property IdUsuario: Integer read FIdUsuario write FIdUsuario;
    property NomeUsuario: String read FNomeUsuario write FNomeUsuario;
  end;

var
  FormHomeC: TFormHomeC;

implementation

{$R *.dfm}

// ============================================================================
// IMPLEMENTAÇÃO DO CARD DE COMÉRCIO REMASTERIZADO
// ============================================================================

constructor TCardComercioPanel.Create(AOwner: TComponent;
                                      IdComercio: Integer;
                                      const Nome, Categoria, Descricao: String;
                                      Taxa: Currency;
                                      HorarioAbertura, HorarioFechamento: TTime;
                                      IdCategoria: Integer = 0);
begin
  inherited Create(AOwner);

  FIdComercio := IdComercio;
  FNomeComercio := Nome;
  FCategoria := Categoria;
  FTaxa := Taxa;
  FHorarioAbertura := HorarioAbertura;
  FHorarioFechamento := HorarioFechamento;
  FDescricao := Descricao;
  FIdCategoria := IdCategoria;

  // Verificar se está aberto
  FEstaAberto := (AOwner as TFormHomeC).ComercioEstaAberto(HorarioAbertura, HorarioFechamento);

  // Configurar componente
  SetupVisualComponents;
end;

procedure TCardComercioPanel.SetupVisualComponents;
var
  TextoHorario, TextoTaxa: String;
begin
  // ===== CONFIGURAÇÃO DO PAINEL PRINCIPAL (Container externo com sombra) =====
  Self.ParentBackground := False;
  Self.BevelOuter := bvNone;
  Self.Color := $00F0F0F0; // Cor do fundo (para simular sombra)
  Self.Padding.Left := 3;
  Self.Padding.Right := 3;
  Self.Padding.Top := 3;
  Self.Padding.Bottom := 3;

  // ===== PAINEL INTERNO (Card branco) =====
  FPanelContainer := TPanel.Create(Self);
  FPanelContainer.Parent := Self;
  FPanelContainer.Align := alClient;
  FPanelContainer.ParentBackground := False;
  FPanelContainer.BevelOuter := bvNone;
  FPanelContainer.Color := clWhite;
  FPanelContainer.Cursor := crHandPoint;
  FPanelContainer.ShowHint := True;
  FPanelContainer.Hint := 'Clique para ver o cardápio de ' + FNomeComercio;
  FPanelContainer.Padding.Left := 16;
  FPanelContainer.Padding.Right := 16;
  FPanelContainer.Padding.Top := 14;
  FPanelContainer.Padding.Bottom := 14;

  // Eventos do painel
  FPanelContainer.OnClick := OnCardClick;
  FPanelContainer.OnMouseEnter := OnMouseEnterCard;
  FPanelContainer.OnMouseLeave := OnMouseLeaveCard;

  // ===== BADGE DE STATUS (Canto Superior Direito) =====
  FPanelStatus := TPanel.Create(FPanelContainer);
  FPanelStatus.Parent := FPanelContainer;
  FPanelStatus.Width := 90;
  FPanelStatus.Height := 28;
  FPanelStatus.Top := 12;
  FPanelStatus.Left := FPanelContainer.Width - FPanelStatus.Width - 16;
  FPanelStatus.Anchors := [akTop, akRight];
  FPanelStatus.BevelOuter := bvNone;
  FPanelStatus.Font.Name := 'Segoe UI';
  FPanelStatus.Font.Size := 9;
  FPanelStatus.Font.Style := [fsBold];
  FPanelStatus.Cursor := crHandPoint;
  FPanelStatus.OnClick := OnCardClick;
  FPanelStatus.ParentBackground := False;

  if FEstaAberto then
  begin
    FPanelStatus.Color := $0040C040; // Verde mais suave
    FPanelStatus.Font.Color := clWhite;
    FPanelStatus.Caption := '● ABERTO';
  end
  else
  begin
    FPanelStatus.Color := $004040E0; // Vermelho mais suave
    FPanelStatus.Font.Color := clWhite;
    FPanelStatus.Caption := '● FECHADO';
  end;

  // ===== NOME DO COMÉRCIO =====
  FLabelNome := TLabel.Create(FPanelContainer);
  FLabelNome.Parent := FPanelContainer;
  FLabelNome.Left := 16;
  FLabelNome.Top := 14;
  FLabelNome.Caption := FNomeComercio;
  FLabelNome.Font.Name := 'Segoe UI';
  FLabelNome.Font.Size := 13;
  FLabelNome.Font.Style := [fsBold];
  FLabelNome.Font.Color := $00222222;
  FLabelNome.Cursor := crHandPoint;
  FLabelNome.OnClick := OnCardClick;
  FLabelNome.AutoSize := True;
  FLabelNome.Transparent := True;

  // ===== CATEGORIA =====
  FLabelCategoria := TLabel.Create(FPanelContainer);
  FLabelCategoria.Parent := FPanelContainer;
  FLabelCategoria.Left := 16;
  FLabelCategoria.Top := 42;
  FLabelCategoria.Caption := '📍 ' + FCategoria;
  FLabelCategoria.Font.Name := 'Segoe UI';
  FLabelCategoria.Font.Size := 9;
  FLabelCategoria.Font.Color := $00707070;
  FLabelCategoria.Cursor := crHandPoint;
  FLabelCategoria.OnClick := OnCardClick;
  FLabelCategoria.AutoSize := True;
  FLabelCategoria.Transparent := True;

  // ===== LINHA DIVISÓRIA =====
  FPanelDivider := TPanel.Create(FPanelContainer);
  FPanelDivider.Parent := FPanelContainer;
  FPanelDivider.Height := 2;
  FPanelDivider.Top := 68;
  FPanelDivider.Left := 16;
  FPanelDivider.Width := FPanelContainer.Width - 32;
  FPanelDivider.Anchors := [akLeft, akTop, akRight];
  FPanelDivider.Color := $00E8E8E8;
  FPanelDivider.BevelOuter := bvNone;
  FPanelDivider.ParentBackground := False;

  // ===== TAXA DE ENTREGA =====
  TextoTaxa := FormatFloat('R$ #,##0.00', FTaxa);
  FLabelTaxa := TLabel.Create(FPanelContainer);
  FLabelTaxa.Parent := FPanelContainer;
  FLabelTaxa.Left := 16;
  FLabelTaxa.Top := 80;
  FLabelTaxa.Caption := '💰 Taxa de entrega: ' + TextoTaxa;
  FLabelTaxa.Font.Name := 'Segoe UI';
  FLabelTaxa.Font.Size := 9;
  FLabelTaxa.Font.Style := [fsBold];
  FLabelTaxa.Font.Color := $00FF7700; // Laranja vibrante
  FLabelTaxa.Cursor := crHandPoint;
  FLabelTaxa.OnClick := OnCardClick;
  FLabelTaxa.AutoSize := True;
  FLabelTaxa.Transparent := True;

  // ===== HORÁRIO =====
  TextoHorario := FormatDateTime('hh:nn', FHorarioAbertura) + ' - ' +
                  FormatDateTime('hh:nn', FHorarioFechamento);
  FLabelHorario := TLabel.Create(FPanelContainer);
  FLabelHorario.Parent := FPanelContainer;
  FLabelHorario.Left := 16;
  FLabelHorario.Top := 104;
  FLabelHorario.Caption := '🕐 ' + TextoHorario;
  FLabelHorario.Font.Name := 'Segoe UI';
  FLabelHorario.Font.Size := 9;
  FLabelHorario.Font.Color := $00606060;
  FLabelHorario.Cursor := crHandPoint;
  FLabelHorario.OnClick := OnCardClick;
  FLabelHorario.AutoSize := True;
  FLabelHorario.Transparent := True;

  // ===== DESCRIÇÃO =====
  FLabelDescricao := TLabel.Create(FPanelContainer);
  FLabelDescricao.Parent := FPanelContainer;
  FLabelDescricao.Left := 16;
  FLabelDescricao.Top := 126;
  FLabelDescricao.AutoSize := False;
  FLabelDescricao.Width := FPanelContainer.Width - 120; // Espaço para o badge
  FLabelDescricao.Height := 35;
  FLabelDescricao.WordWrap := True;
  FLabelDescricao.Font.Name := 'Segoe UI';
  FLabelDescricao.Font.Size := 8;
  FLabelDescricao.Font.Color := $00909090;
  FLabelDescricao.Cursor := crHandPoint;
  FLabelDescricao.OnClick := OnCardClick;
  FLabelDescricao.Transparent := True;

  if Length(FDescricao) > 110 then
    FLabelDescricao.Caption := Copy(FDescricao, 1, 110) + '...'
  else
    FLabelDescricao.Caption := FDescricao;
end;

procedure TCardComercioPanel.OnMouseEnterCard(Sender: TObject);
begin
  FPanelContainer.Color := $00FAFAFA; // Cinza super claro
  Self.Color := $00D0D0D0; // Sombra mais escura
end;

procedure TCardComercioPanel.OnMouseLeaveCard(Sender: TObject);
begin
  FPanelContainer.Color := clWhite;
  Self.Color := $00F0F0F0; // Sombra normal
end;

procedure TCardComercioPanel.OnCardClick(Sender: TObject);
begin
  if Assigned(Self.Owner) and (Self.Owner is TFormHomeC) then
    TFormHomeC(Self.Owner).AbrirCardapio(FIdComercio, FNomeComercio);
end;

procedure TCardComercioPanel.AtualizarStatus;
var
  Aberto: Boolean;
begin
  if Assigned(Self.Owner) and (Self.Owner is TFormHomeC) then
  begin
    Aberto := TFormHomeC(Self.Owner).ComercioEstaAberto(FHorarioAbertura, FHorarioFechamento);

    if Aberto <> FEstaAberto then
    begin
      FEstaAberto := Aberto;

      if FEstaAberto then
      begin
        FPanelStatus.Color := $0040C040;
        FPanelStatus.Caption := '● ABERTO';
      end
      else
      begin
        FPanelStatus.Color := $004040E0;
        FPanelStatus.Caption := '● FECHADO';
      end;
    end;
  end;
end;

// ============================================================================
// IMPLEMENTAÇÃO DO FORM PRINCIPAL
// ============================================================================

procedure TFormHomeC.FormCreate(Sender: TObject);
begin
  FInicializado := False;
  FController := nil;
  FEnderecos := TList<TEndereco>.Create;
  FIdCategoriaFiltro := 0; // Sem filtro inicial

  // Configurações iniciais de layout
  FCardWidth := 0;        // 0 = largura automática (ocupa toda largura disponível)
  FCardHeight := 175;     // Altura do card (aumentada um pouco)
  FCardSpacing := 12;     // Espaçamento entre cards
  FCardsPerRow := 1;      // 1 card por linha (empilhado)

  InicializarLayoutForm;
end;

procedure TFormHomeC.InicializarLayoutForm;
begin
  // Configurar ScrollBox
  if Assigned(scbxMain) then
  begin
    scbxMain.VertScrollBar.Tracking := True;
    scbxMain.HorzScrollBar.Visible := False;
    scbxMain.BorderStyle := bsNone;
    scbxMain.Align := alClient;
    scbxMain.Color := $00F8F8F8; // Cinza bem claro de fundo
  end;

  // Inicializar painéis
  InicializarPainelEndereco;
  InicializarPainelCategorias;

  // Configurar busca
  if Assigned(eBuscaMain) then
  begin
    eBuscaMain.TextHint := 'Pesquise um restaurante ou loja...';
    eBuscaMain.Font.Size := 10;
  end;
end;

procedure TFormHomeC.InicializarPainelEndereco;
var
  IconeEndereco: TLabel;
begin
  if not Assigned(pEndereco) then
    Exit;

  pEndereco.Align := alTop;
  pEndereco.Height := 106;
  pEndereco.Color := clWhite;
  pEndereco.BevelOuter := bvNone;
  pEndereco.Caption := '';
  pEndereco.Padding.Left := 16;
  pEndereco.Padding.Right := 16;
  pEndereco.Padding.Top := 12;
  pEndereco.Padding.Bottom := 12;

  // ===== ÍCONE DE ENDEREÇO =====
  IconeEndereco := TLabel.Create(pEndereco);
  IconeEndereco.Parent := pEndereco;
  IconeEndereco.Left := 16;
  IconeEndereco.Top := 12;
  IconeEndereco.Caption := '📍';
  IconeEndereco.Font.Size := 18;
  IconeEndereco.AutoSize := True;

  // ===== LABEL "ENDEREÇO DE ENTREGA" =====
  FLabelEnderecoAtual := TLabel.Create(pEndereco);
  FLabelEnderecoAtual.Parent := pEndereco;
  FLabelEnderecoAtual.Left := 50;
  FLabelEnderecoAtual.Top := 15;
  FLabelEnderecoAtual.Caption := 'Endereço de entrega';
  FLabelEnderecoAtual.Font.Name := 'Segoe UI';
  FLabelEnderecoAtual.Font.Size := 10;
  FLabelEnderecoAtual.Font.Style := [fsBold];
  FLabelEnderecoAtual.Font.Color := $00404040;
  FLabelEnderecoAtual.AutoSize := True;

  // ===== COMBOBOX DE ENDEREÇOS =====
  FComboEndereco := TComboBox.Create(pEndereco);
  FComboEndereco.Parent := pEndereco;
  FComboEndereco.Left := 16;
  FComboEndereco.Top := 45;
  FComboEndereco.Width := pEndereco.Width - 150;
  FComboEndereco.Height := 25;
  FComboEndereco.Anchors := [akLeft, akTop, akRight];
  FComboEndereco.Style := csDropDownList;
  FComboEndereco.Font.Name := 'Segoe UI';
  FComboEndereco.Font.Size := 9;
  FComboEndereco.OnChange := OnComboEnderecoChange;
  FComboEndereco.Text := 'Selecione um endereço...';

  // ===== BOTÃO ADICIONAR ENDEREÇO =====
  FBtnAdicionarEndereco := TButton.Create(pEndereco);
  FBtnAdicionarEndereco.Parent := pEndereco;
  FBtnAdicionarEndereco.Left := pEndereco.Width - 120;
  FBtnAdicionarEndereco.Top := 45;
  FBtnAdicionarEndereco.Width := 100;
  FBtnAdicionarEndereco.Height := 25;
  FBtnAdicionarEndereco.Anchors := [akTop, akRight];
  FBtnAdicionarEndereco.Caption := '+ Adicionar';
  FBtnAdicionarEndereco.Font.Name := 'Segoe UI';
  FBtnAdicionarEndereco.Font.Size := 9;
  FBtnAdicionarEndereco.Font.Style := [fsBold];
  FBtnAdicionarEndereco.OnClick := OnBtnAdicionarEnderecoClick;
  FBtnAdicionarEndereco.Cursor := crHandPoint;
end;

procedure TFormHomeC.InicializarPainelCategorias;
var
  LabelTitulo: TLabel;
begin
  if not Assigned(pCategorias) then
    Exit;

  pCategorias.Align := alTop;
  pCategorias.Height := 143;
  pCategorias.Color := $00F5F5F5;
  pCategorias.BevelOuter := bvNone;
  pCategorias.Caption := '';
  pCategorias.Padding.Left := 16;
  pCategorias.Padding.Right := 16;
  pCategorias.Padding.Top := 12;
  pCategorias.Padding.Bottom := 12;

  // ===== TÍTULO =====
  LabelTitulo := TLabel.Create(pCategorias);
  LabelTitulo.Parent := pCategorias;
  LabelTitulo.Left := 16;
  LabelTitulo.Top := 12;
  LabelTitulo.Caption := '🏷️ Categorias';
  LabelTitulo.Font.Name := 'Segoe UI';
  LabelTitulo.Font.Size := 11;
  LabelTitulo.Font.Style := [fsBold];
  LabelTitulo.Font.Color := $00404040;
  LabelTitulo.AutoSize := True;
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
  if Assigned(FController) then
    FreeAndNil(FController);

  if Assigned(FEnderecos) then
    FreeAndNil(FEnderecos);
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
    CarregarEnderecos;
    CarregarCategorias;
    PopularLista(True);
  except
    on E: Exception do
      ShowMessage('Erro ao carregar dados: ' + E.Message);
  end;
end;

procedure TFormHomeC.FormResize(Sender: TObject);
begin
  CalcularLayoutCards;
end;

procedure TFormHomeC.CalcularLayoutCards;
var
  LarguraDisponivel: Integer;
begin
  if not Assigned(scbxMain) then
    Exit;

  // Calcular largura disponível (descontando scrollbar e margens)
  LarguraDisponivel := scbxMain.ClientWidth - (FCardSpacing * 2) - 20;

  // Se largura for 0 (automática), usar toda largura disponível
  if FCardWidth = 0 then
    FCardWidth := LarguraDisponivel;
end;

function TFormHomeC.ComercioEstaAberto(HorarioAbertura, HorarioFechamento: TTime): Boolean;
var
  HoraAtual: TTime;
begin
  HoraAtual := Time;

  // Se o fechamento for depois da abertura (mesmo dia)
  if HorarioFechamento > HorarioAbertura then
    Result := (HoraAtual >= HorarioAbertura) and (HoraAtual <= HorarioFechamento)
  else
    // Se o fechamento for antes da abertura (vira a madrugada)
    Result := (HoraAtual >= HorarioAbertura) or (HoraAtual <= HorarioFechamento);
end;

procedure TFormHomeC.LimparCards;
var
  I: Integer;
  Component: TComponent;
begin
  if not Assigned(scbxMain) then
    Exit;

  // Percorrer de trás para frente para evitar problemas de índice
  for I := scbxMain.ComponentCount - 1 downto 0 do
  begin
    Component := scbxMain.Components[I];
    if Component is TCardComercioPanel then
    begin
      TCardComercioPanel(Component).Free;
    end;
  end;
end;

procedure TFormHomeC.PopularLista(ApenasAbertos: Boolean);
var
  Comercios: TObjectList<TComercio>;
  Comercio: TComercio;
  Index: Integer;
begin
  if not FInicializado or not Assigned(FController) then
  begin
    InicializarController;
    if not FInicializado then
      Exit;
  end;

  try
    LimparCards;

    // Calcular layout antes de adicionar cards
    CalcularLayoutCards;

    Comercios := FController.ListarComerciosDisponiveis(ApenasAbertos);

    if not Assigned(Comercios) then
    begin
      ShowMessage('Erro ao buscar comércios do banco!');
      Exit;
    end;

    try
      if Comercios.Count = 0 then
      begin
        ShowMessage('Nenhum comércio disponível no momento.');
        Exit;
      end;

      Index := 0;
      for Comercio in Comercios do
      begin
        if Assigned(Comercio) then
        begin
          // Aplicar filtro de categoria se houver
          if (FIdCategoriaFiltro = 0) or (Comercio.IdCategoria = FIdCategoriaFiltro) then
          begin
            AdicionarCard(Comercio, Index);
            Inc(Index);
          end;
        end;
      end;

    finally
      Comercios.Free;
    end;

  except
    on E: Exception do
      ShowMessage('Erro ao popular lista: ' + E.Message);
  end;
end;

procedure TFormHomeC.AdicionarCard(Comercio: TComercio; Index: Integer);
var
  Card: TCardComercioPanel;
  PosY: Integer;
  LarguraCard: Integer;
begin
  if not Assigned(Comercio) or not Assigned(scbxMain) then
    Exit;

  // Calcular largura do card
  LarguraCard := scbxMain.ClientWidth - (FCardSpacing * 2) - 20;

  if LarguraCard < 200 then
    LarguraCard := 200; // Largura mínima

  // Calcular posição Y (cards empilhados verticalmente)
  PosY := FCardSpacing + (Index * (FCardHeight + FCardSpacing));

  // Criar o card
  Card := TCardComercioPanel.Create(
    Self,
    Comercio.IdComercio,
    Comercio.NomeComercio,
    Comercio.Categoria,
    Comercio.Descricao,
    Comercio.TaxaEntregaBase,
    Comercio.HorarioAbertura,
    Comercio.HorarioFechamento,
    Comercio.IdCategoria
  );

  Card.Parent := scbxMain;
  Card.Left := FCardSpacing;
  Card.Top := PosY;
  Card.Width := LarguraCard;
  Card.Height := FCardHeight;
  Card.Anchors := [akLeft, akTop, akRight];
end;

procedure TFormHomeC.AbrirCardapio(IdComercio: Integer; const NomeComercio: String);
begin
  ShowMessage('Abrindo cardápio de: ' + NomeComercio + #13#10 +
              'ID: ' + IntToStr(IdComercio) + #13#10#13#10 +
              'Aqui será aberto o form de cardápio do comércio.');

  // TODO: Implementar abertura do form de cardápio
  // FormCardapio := TFormCardapio.Create(Self);
  // FormCardapio.IdComercio := IdComercio;
  // FormCardapio.NomeComercio := NomeComercio;
  // FormCardapio.ShowModal;
  // FormCardapio.Free;
end;

procedure TFormHomeC.eBuscaMainChange(Sender: TObject);
begin
  if not FInicializado then
    Exit;

  if Trim(eBuscaMain.Text) = '' then
    PopularLista(True)
  else
    BuscarComercios(eBuscaMain.Text);
end;

procedure TFormHomeC.BuscarComercios(const Termo: string);
var
  Comercios: TObjectList<TComercio>;
  Comercio: TComercio;
  Index: Integer;
begin
  if not FInicializado or not Assigned(FController) then
    Exit;

  try
    LimparCards;
    CalcularLayoutCards;

    Comercios := FController.BuscarComercios(Termo);

    if not Assigned(Comercios) then
      Exit;

    try
      if Comercios.Count = 0 then
      begin
        ShowMessage('Nenhum comércio encontrado com "' + Termo + '"');
        Exit;
      end;

      Index := 0;
      for Comercio in Comercios do
      begin
        if Assigned(Comercio) then
        begin
          // Aplicar filtro de categoria se houver
          if (FIdCategoriaFiltro = 0) or (Comercio.IdCategoria = FIdCategoriaFiltro) then
          begin
            AdicionarCard(Comercio, Index);
            Inc(Index);
          end;
        end;
      end;

    finally
      Comercios.Free;
    end;

  except
    on E: Exception do
      ShowMessage('Erro ao buscar: ' + E.Message);
  end;
end;

// ============================================================================
// MÉTODOS DO PAINEL DE ENDEREÇOS
// ============================================================================

procedure TFormHomeC.CarregarEnderecos;
var
  Query: TFDQuery;
  Endereco: TEndereco;
  EnderecoTexto: String;
begin
  if not Assigned(FComboEndereco) then
    Exit;

  FComboEndereco.Clear;
  FEnderecos.Clear;

  try
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := DM.FDConn;
      Query.SQL.Text :=
        'SELECT ec.id_endereco_cliente, ec.id_user, ec.apelido, ' +
        '       ec.endereco_principal, e.cep, e.logradouro, e.numero, ' +
        '       e.complemento, e.bairro, e.cidade, e.uf ' +
        'FROM enderecos_clientes ec ' +
        'INNER JOIN enderecos e ON ec.id_endereco = e.id_endereco ' +
        'WHERE ec.id_user = :id_user AND ec.ativo = true ' +
        'ORDER BY ec.endereco_principal DESC, ec.apelido';
      Query.ParamByName('id_user').AsInteger := FIdUsuario;
      Query.Open;

      while not Query.Eof do
      begin
        Endereco.Id := Query.FieldByName('id_endereco_cliente').AsInteger;
        Endereco.IdCliente := Query.FieldByName('id_user').AsInteger;
        Endereco.Apelido := Query.FieldByName('apelido').AsString;
        Endereco.CEP := Query.FieldByName('cep').AsString;
        Endereco.Logradouro := Query.FieldByName('logradouro').AsString;
        Endereco.Numero := Query.FieldByName('numero').AsString;
        Endereco.Complemento := Query.FieldByName('complemento').AsString;
        Endereco.Bairro := Query.FieldByName('bairro').AsString;
        Endereco.Cidade := Query.FieldByName('cidade').AsString;
        Endereco.UF := Query.FieldByName('uf').AsString;
        Endereco.Padrao := Query.FieldByName('endereco_principal').AsBoolean;

        FEnderecos.Add(Endereco);

        // Montar texto para o combo
        EnderecoTexto := Endereco.Apelido + ' - ' +
                        Endereco.Logradouro + ', ' +
                        Endereco.Numero;
        if Trim(Endereco.Complemento) <> '' then
          EnderecoTexto := EnderecoTexto + ' (' + Endereco.Complemento + ')';

        FComboEndereco.Items.Add(EnderecoTexto);

        Query.Next;
      end;

      // Selecionar o endereço padrão
      if FComboEndereco.Items.Count > 0 then
      begin
        FComboEndereco.ItemIndex := 0;
        AtualizarEnderecoSelecionado;
      end
      else
      begin
        FComboEndereco.Text := 'Nenhum endereço cadastrado';
      end;

    finally
      Query.Free;
    end;

  except
    on E: Exception do
      ShowMessage('Erro ao carregar endereços: ' + E.Message);
  end;
end;

procedure TFormHomeC.OnComboEnderecoChange(Sender: TObject);
begin
  AtualizarEnderecoSelecionado;
end;

procedure TFormHomeC.AtualizarEnderecoSelecionado;
var
  Endereco: TEndereco;
  EnderecoCompleto: String;
begin
  if not Assigned(FComboEndereco) or not Assigned(FLabelEnderecoAtual) then
    Exit;

  if (FComboEndereco.ItemIndex >= 0) and (FComboEndereco.ItemIndex < FEnderecos.Count) then
  begin
    Endereco := FEnderecos[FComboEndereco.ItemIndex];

    EnderecoCompleto := Endereco.Logradouro + ', ' + Endereco.Numero +
                       ' - ' + Endereco.Bairro + ', ' +
                       Endereco.Cidade + ' - ' + Endereco.UF;

    FLabelEnderecoAtual.Caption := 'Entregar em: ' + Endereco.Apelido;
    FLabelEnderecoAtual.Hint := EnderecoCompleto;
    FLabelEnderecoAtual.ShowHint := True;
  end;
end;

procedure TFormHomeC.OnBtnAdicionarEnderecoClick(Sender: TObject);
begin
  ShowMessage('Formulário de cadastro de endereço será implementado!' + #13#10 +
              'Terá integração com ViaCEP para busca automática.' + #13#10#13#10 +
              'Campos:' + #13#10 +
              '- Apelido (Casa, Trabalho, etc)' + #13#10 +
              '- CEP (com busca automática)' + #13#10 +
              '- Logradouro' + #13#10 +
              '- Número' + #13#10 +
              '- Complemento' + #13#10 +
              '- Bairro' + #13#10 +
              '- Cidade' + #13#10 +
              '- UF' + #13#10 +
              '- Marcar como padrão');

  // TODO: Implementar form de cadastro de endereço
end;

// ============================================================================
// MÉTODOS DO PAINEL DE CATEGORIAS
// ============================================================================

procedure TFormHomeC.CarregarCategorias;
var
  Query: TFDQuery;
  PanelCategoria: TPanel;
  LabelCategoria: TLabel;
  PosLeft: Integer;
  IdCategoria: Integer;
  NomeCategoria: String;
begin
  if not Assigned(pCategorias) then
    Exit;

  try
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := DM.FDConn;
      Query.SQL.Text :=
        'SELECT id_categoria, nome_categoria_comm ' +
        'FROM categorias_comm ' +
        'ORDER BY nome_categoria_comm';
      Query.Open;

      PosLeft := 16;

      // Adicionar opção "TODAS"
      PanelCategoria := TPanel.Create(pCategorias);
      PanelCategoria.Parent := pCategorias;
      PanelCategoria.Left := PosLeft;
      PanelCategoria.Top := 45;
      PanelCategoria.Width := 100;
      PanelCategoria.Height := 80;
      PanelCategoria.BevelOuter := bvNone;
      PanelCategoria.Color := clWhite;
      PanelCategoria.Cursor := crHandPoint;
      PanelCategoria.Tag := 0; // ID 0 = todas as categorias
      PanelCategoria.OnClick := OnCategoriaPanelClick;
      PanelCategoria.ParentBackground := False;

      LabelCategoria := TLabel.Create(PanelCategoria);
      LabelCategoria.Parent := PanelCategoria;
      LabelCategoria.Caption := '📂' + #13#10 + 'TODAS';
      LabelCategoria.Align := alClient;
      LabelCategoria.Alignment := taCenter;
      LabelCategoria.Layout := tlCenter;
      LabelCategoria.Font.Name := 'Segoe UI';
      LabelCategoria.Font.Size := 9;
      LabelCategoria.Font.Style := [fsBold];
      LabelCategoria.Font.Color := $00404040;
      LabelCategoria.Cursor := crHandPoint;
      LabelCategoria.OnClick := OnCategoriaPanelClick;
      LabelCategoria.Transparent := True;
      LabelCategoria.WordWrap := True;

      Inc(PosLeft, 110);

      // Carregar categorias do banco
      while not Query.Eof do
      begin
        IdCategoria := Query.FieldByName('id_categoria').AsInteger;
        NomeCategoria := Query.FieldByName('nome_categoria_comm').AsString;

        PanelCategoria := TPanel.Create(pCategorias);
        PanelCategoria.Parent := pCategorias;
        PanelCategoria.Left := PosLeft;
        PanelCategoria.Top := 45;
        PanelCategoria.Width := 100;
        PanelCategoria.Height := 80;
        PanelCategoria.BevelOuter := bvNone;
        PanelCategoria.Color := $00F5F5F5;
        PanelCategoria.Cursor := crHandPoint;
        PanelCategoria.Tag := IdCategoria;
        PanelCategoria.OnClick := OnCategoriaPanelClick;
        PanelCategoria.ParentBackground := False;

        LabelCategoria := TLabel.Create(PanelCategoria);
        LabelCategoria.Parent := PanelCategoria;
        LabelCategoria.Caption := '🍽️' + #13#10 + UpperCase(NomeCategoria);
        LabelCategoria.Align := alClient;
        LabelCategoria.Alignment := taCenter;
        LabelCategoria.Layout := tlCenter;
        LabelCategoria.Font.Name := 'Segoe UI';
        LabelCategoria.Font.Size := 8;
        LabelCategoria.Font.Style := [fsBold];
        LabelCategoria.Font.Color := $00505050;
        LabelCategoria.Cursor := crHandPoint;
        LabelCategoria.OnClick := OnCategoriaPanelClick;
        LabelCategoria.Transparent := True;
        LabelCategoria.WordWrap := True;

        Inc(PosLeft, 110);

        Query.Next;
      end;

    finally
      Query.Free;
    end;

  except
    on E: Exception do
      ShowMessage('Erro ao carregar categorias: ' + E.Message);
  end;
end;

procedure TFormHomeC.OnCategoriaPanelClick(Sender: TObject);
var
  IdCategoria: Integer;
  Panel: TPanel;
  I: Integer;
begin
  IdCategoria := 0;

  // Obter o ID da categoria
  if Sender is TPanel then
    IdCategoria := TPanel(Sender).Tag
  else if Sender is TLabel then
    IdCategoria := (Sender as TLabel).Parent.Tag;

  // Resetar cor de todos os painéis de categoria
  for I := 0 to pCategorias.ControlCount - 1 do
  begin
    if pCategorias.Controls[I] is TPanel then
    begin
      Panel := TPanel(pCategorias.Controls[I]);
      if Panel.Tag = IdCategoria then
        Panel.Color := $00FFE4B5 // Laranja claro (selecionado)
      else if Panel.Tag = 0 then
        Panel.Color := clWhite
      else
        Panel.Color := $00F5F5F5;
    end;
  end;

  // Aplicar filtro
  FiltrarPorCategoria(IdCategoria);
end;

procedure TFormHomeC.FiltrarPorCategoria(IdCategoria: Integer);
begin
  FIdCategoriaFiltro := IdCategoria;

  if Trim(eBuscaMain.Text) = '' then
    PopularLista(True)
  else
    BuscarComercios(eBuscaMain.Text);
end;

procedure TFormHomeC.iButton1Click(Sender: TObject);
begin
  // Toggle do menu lateral
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
