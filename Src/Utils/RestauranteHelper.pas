unit RestauranteHelper;

interface

uses
  System.SysUtils, System.Classes, System.Types, System.Generics.Collections,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.Stan.Intf, StrUtils,
  Data.DB, uConn, ComercioModel, System.DateUtils;

type
  // Evento para notificar quando um restaurante é clicado
  TRestauranteSelecionadoEvent = procedure(IdComercio: Integer; const NomeComercio: string) of object;

  // Card de restaurante (painel clicável) - IGUAL AO TCategoriaChip
  TRestauranteCard = class(TPanel)
  private
    FIdComercio: Integer;
    FNomeComercio: String;
    FCategoria: String;
    FTaxa: String;
    FHorario: String;
    FEstaAberto: Boolean;
    FDescricao: String;
    FOnRestauranteSelecionado: TRestauranteSelecionadoEvent;
    procedure CardClick(Sender: TObject);
    procedure CardMouseEnter(Sender: TObject);
    procedure CardMouseLeave(Sender: TObject);
  public
    constructor CreateCard(AOwner: TComponent; IdComercio: Integer;
      const Nome, Categoria, Taxa, Horario, Descricao: String; EstaAberto: Boolean);
    procedure ConfigurarVisual; // ⭐ IGUAL ao TCategoriaChip
    property IdComercio: Integer read FIdComercio;
    property NomeComercio: String read FNomeComercio;
    property OnRestauranteSelecionado: TRestauranteSelecionadoEvent read FOnRestauranteSelecionado write FOnRestauranteSelecionado;
  end;

  // Helper para gerenciar restaurantes - IGUAL AO TCategoriaHelper
  TRestauranteHelper = class
  private
    class function ComercioEstaAberto(HorarioAbertura, HorarioFechamento: TTime): Boolean;
  public
    class function BuscarComercios(const Categoria: string = ''; const TermoBusca: string = ''): TObjectList<TComercio>;
    class procedure PopularScrollBoxRestaurantes(
      ScrollBox: TScrollBox;
      const Categoria: string;
      OnRestauranteClick: TRestauranteSelecionadoEvent);
  end;

implementation

{ TRestauranteCard }

constructor TRestauranteCard.CreateCard(AOwner: TComponent; IdComercio: Integer;
  const Nome, Categoria, Taxa, Horario, Descricao: String; EstaAberto: Boolean);
begin
  inherited Create(AOwner);

  if not Assigned(AOwner) then
    raise Exception.Create('Owner não pode ser nil ao criar TRestauranteCard');

  FIdComercio := IdComercio;
  FNomeComercio := Nome;
  FCategoria := Categoria;
  FTaxa := Taxa;
  FHorario := Horario;
  FEstaAberto := EstaAberto;
  FDescricao := Descricao;

  // ⭐ Definir tamanho temporário - visual será configurado depois
  Self.Height := 165;
  Self.Width := 320;
end;

procedure TRestauranteCard.ConfigurarVisual;
var
  lblNome, lblCategoria, lblTaxa, lblHorario, lblDescricao: TLabel;
  pStatus: TPanel;
  Y: Integer;
begin
  // ⭐ Configurar propriedades visuais DEPOIS que o Parent foi definido
  Self.ParentBackground := False;
  Self.BevelOuter := bvNone;
  Self.Color := clWhite;
  Self.Cursor := crHandPoint;
  Self.ShowHint := True;
  Self.Hint := 'Clique para ver o cardápio';
  Self.OnClick := CardClick;
  Self.OnMouseEnter := CardMouseEnter;
  Self.OnMouseLeave := CardMouseLeave;
  Self.BorderStyle := bsSingle;
  Self.Ctl3D := True;
  Self.ParentColor := False;

  Y := 15;

  // Nome do restaurante
  lblNome := TLabel.Create(Self);
  lblNome.Parent := Self;
  lblNome.Left := 20;
  lblNome.Top := Y;
  lblNome.Caption := FNomeComercio;
  lblNome.Font.Name := 'Segoe UI';
  lblNome.Font.Size := 12;
  lblNome.Font.Style := [fsBold];
  lblNome.Font.Color := clBlack;
  lblNome.Cursor := crHandPoint;
  lblNome.OnClick := CardClick;
  lblNome.Transparent := True;
  Inc(Y, 28);

  // Categoria
  lblCategoria := TLabel.Create(Self);
  lblCategoria.Parent := Self;
  lblCategoria.Left := 20;
  lblCategoria.Top := Y;
  lblCategoria.Caption := '📍 ' + FCategoria;
  lblCategoria.Font.Name := 'Segoe UI';
  lblCategoria.Font.Size := 9;
  lblCategoria.Font.Color := $00808080;
  lblCategoria.Cursor := crHandPoint;
  lblCategoria.OnClick := CardClick;
  lblCategoria.Transparent := True;
  Inc(Y, 22);

  // Taxa de entrega
  lblTaxa := TLabel.Create(Self);
  lblTaxa.Parent := Self;
  lblTaxa.Left := 20;
  lblTaxa.Top := Y;
  lblTaxa.Caption := '💰 Entrega: ' + FTaxa;
  lblTaxa.Font.Name := 'Segoe UI';
  lblTaxa.Font.Size := 9;
  lblTaxa.Font.Style := [fsBold];
  lblTaxa.Font.Color := $00FF6600;
  lblTaxa.Cursor := crHandPoint;
  lblTaxa.OnClick := CardClick;
  lblTaxa.Transparent := True;
  Inc(Y, 22);

  // Horário de funcionamento
  lblHorario := TLabel.Create(Self);
  lblHorario.Parent := Self;
  lblHorario.Left := 20;
  lblHorario.Top := Y;
  lblHorario.Caption := '🕐 ' + FHorario;
  lblHorario.Font.Name := 'Segoe UI';
  lblHorario.Font.Size := 8;
  lblHorario.Font.Color := $00666666;
  lblHorario.Cursor := crHandPoint;
  lblHorario.OnClick := CardClick;
  lblHorario.Transparent := True;
  Inc(Y, 20);

  // Badge de Status (ABERTO/FECHADO)
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
  pStatus.OnClick := CardClick;
  pStatus.Caption := IfThen(FEstaAberto, 'ABERTO', 'FECHADO');

  if FEstaAberto then
  begin
    pStatus.Color := $0000BB00;
    pStatus.Font.Color := clWhite;
  end
  else
  begin
    pStatus.Color := $000000BB;
    pStatus.Font.Color := clWhite;
  end;

  // Descrição
  lblDescricao := TLabel.Create(Self);
  lblDescricao.Parent := Self;
  lblDescricao.Left := 20;
  lblDescricao.Top := Y;
  if Length(FDescricao) > 70 then
    lblDescricao.Caption := Copy(FDescricao, 1, 70) + '...'
  else
    lblDescricao.Caption := FDescricao;
  lblDescricao.Font.Name := 'Segoe UI';
  lblDescricao.Font.Size := 8;
  lblDescricao.Font.Color := $00999999;
  lblDescricao.Cursor := crHandPoint;
  lblDescricao.OnClick := CardClick;
  lblDescricao.AutoSize := False;
  lblDescricao.Width := Self.Width - 40;
  lblDescricao.WordWrap := True;
  lblDescricao.Transparent := True;
end;

procedure TRestauranteCard.CardClick(Sender: TObject);
begin
  if Assigned(FOnRestauranteSelecionado) then
    FOnRestauranteSelecionado(FIdComercio, FNomeComercio);
end;

procedure TRestauranteCard.CardMouseEnter(Sender: TObject);
begin
  Self.Color := $00F5F5F5;
end;

procedure TRestauranteCard.CardMouseLeave(Sender: TObject);
begin
  Self.Color := clWhite;
end;

{ TRestauranteHelper }

class function TRestauranteHelper.ComercioEstaAberto(HorarioAbertura, HorarioFechamento: TTime): Boolean;
var
  HoraAtual: TTime;
begin
  HoraAtual := Time;

  if HorarioFechamento > HorarioAbertura then
    Result := (HoraAtual >= HorarioAbertura) and (HoraAtual <= HorarioFechamento)
  else
    Result := (HoraAtual >= HorarioAbertura) or (HoraAtual <= HorarioFechamento);
end;

class function TRestauranteHelper.BuscarComercios(const Categoria: string = ''; const TermoBusca: string = ''): TObjectList<TComercio>;
var
  Qr: TFDQuery;
  Comercio: TComercio;
begin
  Result := TObjectList<TComercio>.Create(True);
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT ');
    Qr.SQL.Add('  c.id_comercio, c.nome_comercio, c.categoria,');
    Qr.SQL.Add('  c.descricao, c.horario_abertura, c.horario_fechamento,');
    Qr.SQL.Add('  c.tempo_preparo_medio, c.taxa_entrega_base, c.nphone_comercio');
    Qr.SQL.Add('FROM comercios c');
    Qr.SQL.Add('WHERE 1=1');

    // Filtro por categoria
    if (Trim(Categoria) <> '') and (Categoria <> 'Todos') then
    begin
      Qr.SQL.Add('AND UPPER(c.categoria) = UPPER(:categoria)');
      Qr.ParamByName('categoria').AsString := Categoria;
    end;

    // Filtro por termo de busca
    if Trim(TermoBusca) <> '' then
    begin
      Qr.SQL.Add('AND (UPPER(c.nome_comercio) LIKE UPPER(:termo)');
      Qr.SQL.Add('     OR UPPER(c.categoria) LIKE UPPER(:termo)');
      Qr.SQL.Add('     OR UPPER(c.descricao) LIKE UPPER(:termo))');
      Qr.ParamByName('termo').AsString := '%' + TermoBusca + '%';
    end;

    Qr.SQL.Add('ORDER BY c.nome_comercio');
    Qr.Open;

    while not Qr.Eof do
    begin
      Comercio := TComercio.Create;
      try
        Comercio.IdComercio := Qr.FieldByName('id_comercio').AsInteger;
        Comercio.NomeComercio := Qr.FieldByName('nome_comercio').AsString;
        Comercio.Categoria := Qr.FieldByName('categoria').AsString;
        Comercio.Descricao := Qr.FieldByName('descricao').AsString;
        Comercio.HorarioAbertura := Frac(Qr.FieldByName('horario_abertura').AsDateTime);
        Comercio.HorarioFechamento := Frac(Qr.FieldByName('horario_fechamento').AsDateTime);
        Comercio.TempoPreparoMedio := Qr.FieldByName('tempo_preparo_medio').AsInteger;
        Comercio.TaxaEntregaBase := Qr.FieldByName('taxa_entrega_base').AsCurrency;
        Comercio.NPhoneComercio := Qr.FieldByName('nphone_comercio').AsString;

        Result.Add(Comercio);
      except
        Comercio.Free;
        raise;
      end;

      Qr.Next;
    end;

  finally
    Qr.Free;
  end;
end;

class procedure TRestauranteHelper.PopularScrollBoxRestaurantes(
  ScrollBox: TScrollBox;
  const Categoria: string;
  OnRestauranteClick: TRestauranteSelecionadoEvent);
var
  Comercios: TObjectList<TComercio>;
  Comercio: TComercio;
  Card: TRestauranteCard;
  PosX: Integer;
  i: Integer;
  FormOwner: TComponent;
  Horario, Taxa: String;
  EstaAberto: Boolean;
begin
  if not Assigned(ScrollBox) then
    raise Exception.Create('ScrollBox não pode ser nil');

  // Pegar o Form como owner
  FormOwner := ScrollBox;
  while Assigned(FormOwner) and not (FormOwner is TForm) do
    FormOwner := FormOwner.Owner;

  if not Assigned(FormOwner) then
    FormOwner := ScrollBox;

  // Limpar cards existentes
  for i := ScrollBox.ControlCount - 1 downto 0 do
  begin
    if ScrollBox.Controls[i] is TRestauranteCard then
      ScrollBox.Controls[i].Free;
  end;

  // Buscar comércios do banco
  Comercios := BuscarComercios(Categoria, '');
  try
    PosX := 10;

    // Adicionar cards dos restaurantes
    for i := 0 to Comercios.Count - 1 do
    begin
      Comercio := Comercios[i];

      // Verificar se está aberto
      EstaAberto := ComercioEstaAberto(Comercio.HorarioAbertura, Comercio.HorarioFechamento);

      // Formatar dados
      Horario := FormatDateTime('hh:nn', Comercio.HorarioAbertura) + ' - ' +
                 FormatDateTime('hh:nn', Comercio.HorarioFechamento);
      Taxa := FormatFloat('R$ #,##0.00', Comercio.TaxaEntregaBase);

      // Criar card
      Card := TRestauranteCard.CreateCard(
        FormOwner,
        Comercio.IdComercio,
        Comercio.NomeComercio,
        Comercio.Categoria,
        Taxa,
        Horario,
        Comercio.Descricao,
        EstaAberto
      );

      Card.Parent := ScrollBox;      // ⭐ Definir Parent ANTES de configurar visual
      Card.ConfigurarVisual;         // ⭐ AGORA configurar visual
      Card.Left := PosX;
      Card.Top := 10;
      Card.OnRestauranteSelecionado := OnRestauranteClick;

      Inc(PosX, Card.Width + 15);   // Espaçamento de 15px entre cards
    end;

    // Exibir mensagem se não houver resultados
    if Comercios.Count = 0 then
    begin
      // Criar painel de mensagem
      Card := TRestauranteCard.CreateCard(
        FormOwner,
        0,
        '😕 Nenhum resultado encontrado',
        '',
        '',
        '',
        'Tente buscar por outro termo ou categoria',
        False
      );
      Card.Parent := ScrollBox;
      Card.ConfigurarVisual;
      Card.Left := 10;
      Card.Top := 10;
      Card.Color := $00F5F5F5;
    end;

  finally
    Comercios.Free;
  end;
end;

end.
