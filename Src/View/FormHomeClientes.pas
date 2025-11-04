unit FormHomeClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ComCtrls,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, uConn,
  System.Generics.Collections, ComercioModel, ClienteController,
  System.DateUtils;

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
  public
    constructor CreateCard(AOwner: TComponent; IdComercio: Integer;
      const Nome, Categoria, Taxa, Horario, Descricao: String; EstaAberto: Boolean);
  end;

  TFormHomeC = class(TForm)
    pHomeBackground: TPanel;
    pBusca: TPanel;
    Image1: TImage;
    eBuscaMain: TEdit;
    scbxMain: TScrollBox;
    lvMain: TListView;
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

  private
    FIdUsuario: Integer;
    FNomeUsuario: String;
    FController: TClienteController;
    FInicializado: Boolean;
    FCardsPerRow: Integer;
    FCardWidth: Integer;
    FCardHeight: Integer;
    FCardSpacing: Integer;

    procedure InicializarController;
    procedure PopularLista(ApenasAbertos: Boolean);
    procedure BuscarComercios(const Termo: string);
    function ComercioEstaAberto(HorarioAbertura, HorarioFechamento: TTime): Boolean;
    procedure LimparCards;
    procedure AdicionarCardComercio(Comercio: TComercio; EstaAberto: Boolean; Index: Integer);
    procedure AbrirCardapio(IdComercio: Integer; const NomeComercio: String);

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

  // Configurações do painel principal
  Self.ParentBackground := False;
  Self.BevelOuter := bvNone;
  Self.Color := clWhite;
  Self.Cursor := crHandPoint;
  Self.ShowHint := True;
  Self.Hint := 'Clique para ver o cardápio';
  Self.OnClick := PanelClick;

  // Adicionar borda arredondada (simulação com bordas)
  Self.BorderStyle := bsSingle;
  Self.Ctl3D := True;

  Y := 12;  // Margem superior reduzida

  // Label do Nome
  lblNome := TLabel.Create(Self);
  lblNome.Parent := Self;
  lblNome.Left := 15;
  lblNome.Top := Y;
  lblNome.Caption := Nome;
  lblNome.Font.Name := 'Segoe UI';
  lblNome.Font.Size := 11;
  lblNome.Font.Style := [fsBold];
  lblNome.Font.Color := clBlack;
  lblNome.Cursor := crHandPoint;
  lblNome.OnClick := PanelClick;
  Inc(Y, 24);  // Espaçamento reduzido

  // Label da Categoria
  lblCategoria := TLabel.Create(Self);
  lblCategoria.Parent := Self;
  lblCategoria.Left := 15;
  lblCategoria.Top := Y;
  lblCategoria.Caption := '📍 ' + Categoria;
  lblCategoria.Font.Name := 'Segoe UI';
  lblCategoria.Font.Size := 9;
  lblCategoria.Font.Color := $00808080;
  lblCategoria.Cursor := crHandPoint;
  lblCategoria.OnClick := PanelClick;
  Inc(Y, 20);  // Espaçamento reduzido

  // Label da Taxa
  lblTaxa := TLabel.Create(Self);
  lblTaxa.Parent := Self;
  lblTaxa.Left := 15;
  lblTaxa.Top := Y;
  lblTaxa.Caption := '💰 Taxa de entrega: ' + Taxa;
  lblTaxa.Font.Name := 'Segoe UI';
  lblTaxa.Font.Size := 9;
  lblTaxa.Font.Style := [fsBold];
  lblTaxa.Font.Color := $00FF6600;
  lblTaxa.Cursor := crHandPoint;
  lblTaxa.OnClick := PanelClick;
  Inc(Y, 20);  // Espaçamento reduzido

  // Label do Horário
  lblHorario := TLabel.Create(Self);
  lblHorario.Parent := Self;
  lblHorario.Left := 15;
  lblHorario.Top := Y;
  lblHorario.Caption := '🕐 ' + Horario;
  lblHorario.Font.Name := 'Segoe UI';
  lblHorario.Font.Size := 8;
  lblHorario.Font.Color := $00666666;
  lblHorario.Cursor := crHandPoint;
  lblHorario.OnClick := PanelClick;
  Inc(Y, 18);  // Espaçamento reduzido

  // Badge de Status (canto superior direito)
  pStatus := TPanel.Create(Self);
  pStatus.Parent := Self;
  pStatus.Width := 80;
  pStatus.Height := 24;
  pStatus.Top := 10;
  pStatus.Left := Self.Width - pStatus.Width - 12;  // Alinhado à direita
  pStatus.Anchors := [akTop, akRight];  // Ficar sempre no canto direito
  pStatus.BevelOuter := bvNone;
  pStatus.Font.Name := 'Segoe UI';
  pStatus.Font.Size := 8;
  pStatus.Font.Style := [fsBold];
  pStatus.Cursor := crHandPoint;
  pStatus.OnClick := PanelClick;

  if EstaAberto then
  begin
    pStatus.Color := $0000CC00;  // Verde
    pStatus.Font.Color := clWhite;
    pStatus.Caption := 'ABERTO';
  end
  else
  begin
    pStatus.Color := $000000CC;  // Vermelho
    pStatus.Font.Color := clWhite;
    pStatus.Caption := 'FECHADO';
  end;

  // Label da Descrição (no final)
  lblDescricao := TLabel.Create(Self);
  lblDescricao.Parent := Self;
  lblDescricao.Left := 15;
  lblDescricao.Top := Y;
  if Length(Descricao) > 80 then
    lblDescricao.Caption := Copy(Descricao, 1, 80) + '...'
  else
    lblDescricao.Caption := Descricao;
  lblDescricao.Font.Name := 'Segoe UI';
  lblDescricao.Font.Size := 8;
  lblDescricao.Font.Color := $00999999;
  lblDescricao.Cursor := crHandPoint;
  lblDescricao.OnClick := PanelClick;
  lblDescricao.AutoSize := False;
  lblDescricao.Width := Self.Width - 110;  // Deixar espaço para o status badge
  lblDescricao.WordWrap := True;
end;

procedure TCardComercioPanel.PanelClick(Sender: TObject);
begin
  if Assigned(Self.Owner) and (Self.Owner is TFormHomeC) then
    TFormHomeC(Self.Owner).AbrirCardapio(FIdComercio, FNomeComercio);
end;

{ TFormHomeC }

procedure TFormHomeC.FormCreate(Sender: TObject);
begin
  FInicializado := False;
  FController := nil;

  // Configurações do Grid - EMPILHADO (1 card por linha)
  FCardsPerRow := 1;       // 1 card por linha (empilhado verticalmente)
  FCardWidth := 0;         // 0 = largura automática (ocupar toda a largura disponível)
  FCardHeight := 140;      // Altura de cada card
  FCardSpacing := 12;      // Espaçamento entre cards

  // PROTEÇÃO: Garantir valores mínimos
  if FCardsPerRow < 1 then
    FCardsPerRow := 1;
  if FCardWidth < 100 then
    FCardWidth := 280;
  if FCardHeight < 80 then
    FCardHeight := 150;

  eBuscaMain.TextHint := 'Pesquise um restaurante ou loja ...';

  // Configurar ScrollBox
  if Assigned(scbxMain) then
  begin
    scbxMain.VertScrollBar.Tracking := True;
    scbxMain.HorzScrollBar.Visible := False;
    scbxMain.BorderStyle := bsNone;
  end;

  // Esconder o ListView (vamos usar ScrollBox)
  if Assigned(lvMain) then
    lvMain.Visible := False;
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
    PopularLista(True);
  except
    on E: Exception do
      ShowMessage('Erro ao carregar comércios: ' + E.Message);
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

procedure TFormHomeC.LimparCards;
var
  I: Integer;
begin
  // Liberar todos os componentes filhos do ScrollBox
  for I := scbxMain.ComponentCount - 1 downto 0 do
  begin
    if scbxMain.Components[I] is TCardComercioPanel then
      scbxMain.Components[I].Free;
  end;
end;

procedure TFormHomeC.PopularLista(ApenasAbertos: Boolean);
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
    LimparCards;

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
          EstaAberto := ComercioEstaAberto(Comercio.HorarioAbertura, Comercio.HorarioFechamento);
          AdicionarCardComercio(Comercio, EstaAberto, Index);
          Inc(Index);
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

procedure TFormHomeC.AdicionarCardComercio(Comercio: TComercio; EstaAberto: Boolean; Index: Integer);
var
  Card: TCardComercioPanel;
  Horario, Taxa: String;
  PosY: Integer;
  LarguraCard: Integer;
begin
  if not Assigned(Comercio) then
    Exit;

  // PROTEÇÃO: Verificar valores seguros
  if FCardsPerRow < 1 then
    FCardsPerRow := 1;
  if FCardHeight < 80 then
    FCardHeight := 140;
  if FCardSpacing < 5 then
    FCardSpacing := 12;

  // Calcular largura do card (ocupar toda a largura disponível com margens)
  if FCardWidth = 0 then
    LarguraCard := scbxMain.Width - (FCardSpacing * 2) - 20  // -20 para scrollbar
  else
    LarguraCard := FCardWidth;

  // Posição Y (empilhado verticalmente)
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

  Card.Parent := scbxMain;
  Card.Left := FCardSpacing;      // Margem esquerda
  Card.Top := PosY;               // Posição vertical
  Card.Width := LarguraCard;      // Largura total disponível
  Card.Height := FCardHeight;     // Altura fixa
  Card.Anchors := [akLeft, akTop, akRight];  // Ancorar para redimensionar com o form
end;

procedure TFormHomeC.AbrirCardapio(IdComercio: Integer; const NomeComercio: String);
begin
  ShowMessage('Abrindo cardápio de: ' + NomeComercio + #13#10 +
              'ID: ' + IntToStr(IdComercio));

  // Aqui você abrirá o form de cardápio
  // FormCardapio := TFormCardapio.Create(Self);
  // FormCardapio.IdComercio := IdComercio;
  // FormCardapio.ShowModal;
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
  EstaAberto: Boolean;
  Index: Integer;
begin
  if not FInicializado or not Assigned(FController) then
    Exit;

  try
    LimparCards;

    Comercios := FController.BuscarComercios(Termo);

    if Assigned(Comercios) then
    try
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
    finally
      Comercios.Free;
    end;

  except
    on E: Exception do
      ShowMessage('Erro ao buscar: ' + E.Message);
  end;
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
