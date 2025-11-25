unit PedidoCardHelper;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Classes, System.Types,
  System.Generics.Collections, System.StrUtils, System.DateUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Dialogs,
  FireDAC.Comp.Client, FireDAC.Stan.Param, Data.DB;

type
  // ========== EVENTOS ==========
  TFiltroSelecionadoEvent = procedure(IdFiltro: Integer; const NomeFiltro: String) of object;
  TPedidoCancelarEvent = procedure(IdPedido: Integer) of object;
  TPedidoVerDetalhesEvent = procedure(IdPedido: Integer) of object;

  // ========== RECORD PARA DADOS DO PEDIDO ==========
  TDadosPedidoCard = record
    IdPedido: Integer;
    IdStatusPedido: Integer;
    NomeStatus: String;
    CorStatus: TColor;
    NomeComercio: String;
    DataPedido: TDateTime;
    ValorTotal: Currency;
    TaxaEntrega: Currency;
    TempoEstimado: String;
    QtdItens: Integer;
    PodeCancelar: Boolean;
    NomeEntregador: String;        // ⭐ NOVO
    TelefoneEntregador: String;    // ⭐ NOVO
    EnderecoEntrega: String;       // ⭐ NOVO
  end;

  // ========== CHIP DE FILTRO ==========
  TFiltroPedidoChip = class(TPanel)
  private
    FIdFiltro: Integer;
    FNomeFiltro: String;
    FSelecionado: Boolean;
    FOnFiltroSelecionado: TFiltroSelecionadoEvent;
    procedure SetSelecionado(const Value: Boolean);
    procedure ChipClick(Sender: TObject);
  public
    constructor CreateChip(AOwner: TComponent; IdFiltro: Integer; const NomeFiltro: String);
    procedure ConfigurarVisual;
    property IdFiltro: Integer read FIdFiltro;
    property NomeFiltro: String read FNomeFiltro;
    property Selecionado: Boolean read FSelecionado write SetSelecionado;
    property OnFiltroSelecionado: TFiltroSelecionadoEvent read FOnFiltroSelecionado write FOnFiltroSelecionado;
  end;

  // ========== CARD DO PEDIDO PARA CLIENTE ==========
  TPedidoCardCliente = class(TPanel)
  private
    FIdPedido: Integer;
    FDados: TDadosPedidoCard;
    FOnCancelar: TPedidoCancelarEvent;
    FOnVerDetalhes: TPedidoVerDetalhesEvent;

    // Componentes visuais
    pHeader: TPanel;
    pStatus: TPanel;
    lblNumeroPedido: TLabel;
    lblNomeComercio: TLabel;
    lblStatus: TLabel;
    lblDataPedido: TLabel;
    lblValorTotal: TLabel;
    lblTempoEstimado: TLabel;
    lblQtdItens: TLabel;
    lblEntregador: TLabel;         // ⭐ NOVO
    btnVerDetalhes: TButton;
    btnCancelar: TButton;

    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnVerDetalhesClick(Sender: TObject);
    function ObterCorStatus(IdStatus: Integer): TColor;
    function ObterEmojiStatus(IdStatus: Integer): String;
  public
    constructor CreateCard(AOwner: TComponent; const Dados: TDadosPedidoCard);
    procedure ConfigurarVisual;
    procedure OcultarBotaoCancelar;
    procedure AtualizarStatus(NovoIdStatus: Integer; const NovoNomeStatus: String);

    property IdPedido: Integer read FIdPedido;
    property OnCancelar: TPedidoCancelarEvent read FOnCancelar write FOnCancelar;
    property OnVerDetalhes: TPedidoVerDetalhesEvent read FOnVerDetalhes write FOnVerDetalhes;
  end;

  // ========== HELPER PRINCIPAL ==========
  TPedidoCardHelper = class
  public
    // Filtros
    class procedure PopularFiltros(
      ScrollBox: TScrollBox;
      Connection: TFDConnection;
      OnFiltroClick: TFiltroSelecionadoEvent
    );
    class procedure DeselecionarTodosFiltros(ScrollBox: TScrollBox);
    class procedure SelecionarFiltro(ScrollBox: TScrollBox; IdFiltro: Integer);

    // Pedidos
    class function BuscarPedidosCliente(
      Connection: TFDConnection;
      IdCliente: Integer;
      IdFiltroStatus: Integer = -1  // -1 = Todos
    ): TList<TDadosPedidoCard>;

    class procedure PopularPedidos(
      ScrollBox: TScrollBox;
      Connection: TFDConnection;
      IdCliente: Integer;
      IdFiltroStatus: Integer;
      OnCancelar: TPedidoCancelarEvent;
      OnVerDetalhes: TPedidoVerDetalhesEvent
    );

    class procedure LimparCards(ScrollBox: TScrollBox);

    // Ações
    class function CancelarPedido(
      Connection: TFDConnection;
      IdPedido: Integer
    ): Boolean;

    class procedure ExibirMensagemSemPedidos(ScrollBox: TScrollBox);
  end;

implementation

{ TFiltroPedidoChip }

constructor TFiltroPedidoChip.CreateChip(AOwner: TComponent; IdFiltro: Integer; const NomeFiltro: String);
begin
  inherited Create(AOwner);

  FIdFiltro := IdFiltro;
  FNomeFiltro := NomeFiltro;
  FSelecionado := False;

  Self.Height := 40;
  Self.Width := 120;
end;

procedure TFiltroPedidoChip.ConfigurarVisual;
var
  lblTexto: TLabel;
  LarguraTexto: Integer;
begin
  Self.ParentBackground := False;
  Self.BevelOuter := bvNone;
  Self.Color := clWhite;
  Self.Cursor := crHandPoint;
  Self.ShowHint := True;
  Self.Hint := 'Filtrar por ' + FNomeFiltro;
  Self.OnClick := ChipClick;
  Self.BorderStyle := bsSingle;
  Self.ParentColor := False;

  lblTexto := TLabel.Create(Self);
  lblTexto.Parent := Self;
  lblTexto.Caption := FNomeFiltro;
  lblTexto.Font.Name := 'Segoe UI';
  lblTexto.Font.Size := 9;
  lblTexto.Font.Style := [fsBold];
  lblTexto.Font.Color := $00517CFF;
  lblTexto.Cursor := crHandPoint;
  lblTexto.OnClick := ChipClick;
  lblTexto.Transparent := True;
  lblTexto.Alignment := taCenter;
  lblTexto.Layout := tlCenter;
  lblTexto.Align := alClient;

  // Calcular largura baseada no texto
  lblTexto.AutoSize := True;
  LarguraTexto := lblTexto.Canvas.TextWidth(FNomeFiltro);
  lblTexto.AutoSize := False;

  Self.Width := LarguraTexto + 30;
  if Self.Width < 80 then
    Self.Width := 80;
  if Self.Width > 150 then
    Self.Width := 150;
end;

procedure TFiltroPedidoChip.ChipClick(Sender: TObject);
begin
  if Assigned(FOnFiltroSelecionado) then
    FOnFiltroSelecionado(FIdFiltro, FNomeFiltro);
end;

procedure TFiltroPedidoChip.SetSelecionado(const Value: Boolean);
var
  lbl: TLabel;
  i: Integer;
begin
  FSelecionado := Value;

  if FSelecionado then
  begin
    Self.Color := $00517CFF;
    for i := 0 to Self.ControlCount - 1 do
    begin
      if Self.Controls[i] is TLabel then
      begin
        lbl := TLabel(Self.Controls[i]);
        lbl.Font.Color := clWhite;
      end;
    end;
  end
  else
  begin
    Self.Color := clWhite;
    for i := 0 to Self.ControlCount - 1 do
    begin
      if Self.Controls[i] is TLabel then
      begin
        lbl := TLabel(Self.Controls[i]);
        lbl.Font.Color := $00517CFF;
      end;
    end;
  end;
end;

{ TPedidoCardCliente }

constructor TPedidoCardCliente.CreateCard(AOwner: TComponent; const Dados: TDadosPedidoCard);
begin
  inherited Create(AOwner);

  FIdPedido := Dados.IdPedido;
  FDados := Dados;

  // ⭐ Altura aumentada para acomodar entregador
  Self.Height := 180;
  Self.Width := 100; // Será ajustado pelo Parent
end;

procedure TPedidoCardCliente.ConfigurarVisual;
var
  Emoji: String;
begin
  // Painel principal
  Self.ParentBackground := False;
  Self.BevelOuter := bvNone;
  Self.Color := clWhite;
  Self.BorderStyle := bsSingle;
  Self.ParentColor := False;

  // ========== HEADER COM STATUS ==========
  pHeader := TPanel.Create(Self);
  pHeader.Parent := Self;
  pHeader.Align := alTop;
  pHeader.Height := 45;
  pHeader.BevelOuter := bvNone;
  pHeader.Color := clWhite;
  pHeader.ParentBackground := False;

  // Badge de Status
  pStatus := TPanel.Create(pHeader);
  pStatus.Parent := pHeader;
  pStatus.Width := 130;
  pStatus.Height := 28;
  pStatus.Top := 8;
  pStatus.Left := pHeader.Width - pStatus.Width - 15;
  pStatus.Anchors := [akTop, akRight];
  pStatus.BevelOuter := bvNone;
  pStatus.Color := ObterCorStatus(FDados.IdStatusPedido);
  pStatus.Font.Name := 'Segoe UI';
  pStatus.Font.Size := 8;
  pStatus.Font.Style := [fsBold];
  pStatus.Font.Color := clWhite;
  pStatus.Caption := FDados.NomeStatus;

  // Número do Pedido
  lblNumeroPedido := TLabel.Create(pHeader);
  lblNumeroPedido.Parent := pHeader;
  lblNumeroPedido.Left := 15;
  lblNumeroPedido.Top := 12;
  lblNumeroPedido.Caption := '📋 Pedido #' + IntToStr(FDados.IdPedido);
  lblNumeroPedido.Font.Name := 'Segoe UI';
  lblNumeroPedido.Font.Size := 12;
  lblNumeroPedido.Font.Style := [fsBold];
  lblNumeroPedido.Font.Color := $00333333;
  lblNumeroPedido.Transparent := True;

  // ========== CORPO DO CARD ==========

  // Nome do Comércio
  Emoji := ObterEmojiStatus(FDados.IdStatusPedido);
  lblNomeComercio := TLabel.Create(Self);
  lblNomeComercio.Parent := Self;
  lblNomeComercio.Left := 15;
  lblNomeComercio.Top := 50;
  lblNomeComercio.Caption := '🏪 ' + FDados.NomeComercio;
  lblNomeComercio.Font.Name := 'Segoe UI';
  lblNomeComercio.Font.Size := 10;
  lblNomeComercio.Font.Color := $00666666;
  lblNomeComercio.Transparent := True;

  // Data do Pedido
  lblDataPedido := TLabel.Create(Self);
  lblDataPedido.Parent := Self;
  lblDataPedido.Left := 15;
  lblDataPedido.Top := 72;
  lblDataPedido.Caption := '📅 ' + FormatDateTime('dd/mm/yyyy hh:nn', FDados.DataPedido);
  lblDataPedido.Font.Name := 'Segoe UI';
  lblDataPedido.Font.Size := 9;
  lblDataPedido.Font.Color := $00888888;
  lblDataPedido.Transparent := True;

  // Quantidade de Itens
  lblQtdItens := TLabel.Create(Self);
  lblQtdItens.Parent := Self;
  lblQtdItens.Left := 200;
  lblQtdItens.Top := 72;
  lblQtdItens.Caption := '📦 ' + IntToStr(FDados.QtdItens) + ' ' +
    IfThen(FDados.QtdItens = 1, 'item', 'itens');
  lblQtdItens.Font.Name := 'Segoe UI';
  lblQtdItens.Font.Size := 9;
  lblQtdItens.Font.Color := $00888888;
  lblQtdItens.Transparent := True;

  // ⭐ NOVO: Nome do Entregador (se houver)
  if Trim(FDados.NomeEntregador) <> '' then
  begin
    lblEntregador := TLabel.Create(Self);
    lblEntregador.Parent := Self;
    lblEntregador.Left := 15;
    lblEntregador.Top := 94;
    lblEntregador.Caption := '🚴 Entregador: ' + FDados.NomeEntregador;

    // Adicionar telefone se houver
    if Trim(FDados.TelefoneEntregador) <> '' then
      lblEntregador.Caption := lblEntregador.Caption + ' - 📞 ' + FDados.TelefoneEntregador;

    lblEntregador.Font.Name := 'Segoe UI';
    lblEntregador.Font.Size := 9;
    lblEntregador.Font.Style := [fsBold];
    lblEntregador.Font.Color := $00FF6600;
    lblEntregador.Transparent := True;
  end;

  // Valor Total
  lblValorTotal := TLabel.Create(Self);
  lblValorTotal.Parent := Self;
  lblValorTotal.Left := 15;

  // ⭐ CORREÇÃO: Usar IF ao invés de IfThen triplo
  if Trim(FDados.NomeEntregador) <> '' then
    lblValorTotal.Top := 116
  else
    lblValorTotal.Top := 95;

  lblValorTotal.Caption := '💰 Total: R$ ' + FormatFloat('#,##0.00', FDados.ValorTotal);
  lblValorTotal.Font.Name := 'Segoe UI';
  lblValorTotal.Font.Size := 11;
  lblValorTotal.Font.Style := [fsBold];
  lblValorTotal.Font.Color := $00FF6600;
  lblValorTotal.Transparent := True;

  // Tempo Estimado (se aplicável)
  if Trim(FDados.TempoEstimado) <> '' then
  begin
    lblTempoEstimado := TLabel.Create(Self);
    lblTempoEstimado.Parent := Self;
    lblTempoEstimado.Left := 200;

    // ⭐ CORREÇÃO: Usar IF ao invés de IfThen triplo
    if Trim(FDados.NomeEntregador) <> '' then
      lblTempoEstimado.Top := 116
    else
      lblTempoEstimado.Top := 95;

    lblTempoEstimado.Caption := '⏱️ ' + FDados.TempoEstimado;
    lblTempoEstimado.Font.Name := 'Segoe UI';
    lblTempoEstimado.Font.Size := 9;
    lblTempoEstimado.Font.Color := $00666666;
    lblTempoEstimado.Transparent := True;
  end;

  // ========== BOTÕES ==========

  // Botão Ver Detalhes
  btnVerDetalhes := TButton.Create(Self);
  btnVerDetalhes.Parent := Self;
  btnVerDetalhes.Caption := '👁️ Ver Detalhes';
  btnVerDetalhes.Left := Self.Width - 240;
  btnVerDetalhes.Top := 140;
  btnVerDetalhes.Width := 110;
  btnVerDetalhes.Height := 30;
  btnVerDetalhes.Font.Name := 'Segoe UI';
  btnVerDetalhes.Font.Size := 9;
  btnVerDetalhes.Cursor := crHandPoint;
  btnVerDetalhes.Anchors := [akTop, akRight];
  btnVerDetalhes.OnClick := BtnVerDetalhesClick;

  // Botão Cancelar (só se puder cancelar)
  if FDados.PodeCancelar then
  begin
    btnCancelar := TButton.Create(Self);
    btnCancelar.Parent := Self;
    btnCancelar.Caption := '❌ Cancelar';
    btnCancelar.Left := Self.Width - 120;
    btnCancelar.Top := 140;
    btnCancelar.Width := 100;
    btnCancelar.Height := 30;
    btnCancelar.Font.Name := 'Segoe UI';
    btnCancelar.Font.Size := 9;
    btnCancelar.Font.Color := clRed;
    btnCancelar.Cursor := crHandPoint;
    btnCancelar.Anchors := [akTop, akRight];
    btnCancelar.OnClick := BtnCancelarClick;
  end;
end;

procedure TPedidoCardCliente.BtnCancelarClick(Sender: TObject);
begin
  if MessageDlg(
    'Deseja realmente cancelar o pedido #' + IntToStr(FIdPedido) + '?' + #13#10#13#10 +
    'Esta ação não pode ser desfeita.',
    mtConfirmation,
    [mbYes, mbNo],
    0) = mrYes then
  begin
    if Assigned(FOnCancelar) then
      FOnCancelar(FIdPedido);
  end;
end;

procedure TPedidoCardCliente.BtnVerDetalhesClick(Sender: TObject);
begin
  if Assigned(FOnVerDetalhes) then
    FOnVerDetalhes(FIdPedido);
end;

procedure TPedidoCardCliente.OcultarBotaoCancelar;
begin
  if Assigned(btnCancelar) then
    btnCancelar.Visible := False;
end;

procedure TPedidoCardCliente.AtualizarStatus(NovoIdStatus: Integer; const NovoNomeStatus: String);
begin
  FDados.IdStatusPedido := NovoIdStatus;
  FDados.NomeStatus := NovoNomeStatus;

  if Assigned(pStatus) then
  begin
    pStatus.Color := ObterCorStatus(NovoIdStatus);
    pStatus.Caption := NovoNomeStatus;
  end;

  // Se cancelou, ocultar botão
  if NovoIdStatus = 6 then
    OcultarBotaoCancelar;
end;

function TPedidoCardCliente.ObterCorStatus(IdStatus: Integer): TColor;
begin
  case IdStatus of
    0: Result := $000080FF;  // Laranja - Pendente
    1: Result := $00FF901E;  // Azul - Confirmado
    2: Result := $0000CCFF;  // Laranja+ - Preparando
    3: Result := $00FFCC00;  // Azul+ - Pronto p/Entrega
    4: Result := $0000D7FF;  // Dourado - A Caminho
    5: Result := $0000BB00;  // Verde - Entregue
    6: Result := $000000CC;  // Vermelho - Cancelado
  else
    Result := $00808080;     // Cinza - Desconhecido
  end;
end;

function TPedidoCardCliente.ObterEmojiStatus(IdStatus: Integer): String;
begin
  case IdStatus of
    0: Result := '⏳';  // Pendente
    1: Result := '✅';  // Confirmado
    2: Result := '👨‍🍳'; // Preparando
    3: Result := '📦';  // Pronto p/Entrega
    4: Result := '🚚';  // A Caminho
    5: Result := '🎉';  // Entregue
    6: Result := '❌';  // Cancelado
  else
    Result := '❓';
  end;
end;

{ TPedidoCardHelper }

class procedure TPedidoCardHelper.PopularFiltros(
  ScrollBox: TScrollBox;
  Connection: TFDConnection;
  OnFiltroClick: TFiltroSelecionadoEvent
);
var
  Qr: TFDQuery;
  Chip: TFiltroPedidoChip;
  PosX: Integer;
  FormOwner: TComponent;
begin
  if not Assigned(ScrollBox) then
    Exit;

  // Pegar Form como owner
  FormOwner := ScrollBox;
  while Assigned(FormOwner) and not (FormOwner is TForm) do
    FormOwner := FormOwner.Owner;

  if not Assigned(FormOwner) then
    FormOwner := ScrollBox;

  // Limpar chips existentes
  LimparCards(ScrollBox);

  PosX := 10;

  // Adicionar chip "Todos" primeiro
  Chip := TFiltroPedidoChip.CreateChip(FormOwner, -1, 'Todos');
  Chip.Parent := ScrollBox;
  Chip.ConfigurarVisual;
  Chip.Left := PosX;
  Chip.Top := 5;
  Chip.OnFiltroSelecionado := OnFiltroClick;
  Chip.Selecionado := True; // Começa selecionado
  Inc(PosX, Chip.Width + 10);

  // Buscar filtros da tabela
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := Connection;
    Qr.SQL.Text := 'SELECT id_estado, nome_estado FROM filtros_pedidos ORDER BY id_estado';
    Qr.Open;

    while not Qr.Eof do
    begin
      Chip := TFiltroPedidoChip.CreateChip(
        FormOwner,
        Qr.FieldByName('id_estado').AsInteger,
        Qr.FieldByName('nome_estado').AsString
      );
      Chip.Parent := ScrollBox;
      Chip.ConfigurarVisual;
      Chip.Left := PosX;
      Chip.Top := 5;
      Chip.OnFiltroSelecionado := OnFiltroClick;
      Chip.Selecionado := False;

      Inc(PosX, Chip.Width + 10);
      Qr.Next;
    end;

  finally
    Qr.Free;
  end;
end;

class procedure TPedidoCardHelper.DeselecionarTodosFiltros(ScrollBox: TScrollBox);
var
  i: Integer;
begin
  for i := 0 to ScrollBox.ControlCount - 1 do
  begin
    if ScrollBox.Controls[i] is TFiltroPedidoChip then
      TFiltroPedidoChip(ScrollBox.Controls[i]).Selecionado := False;
  end;
end;

class procedure TPedidoCardHelper.SelecionarFiltro(ScrollBox: TScrollBox; IdFiltro: Integer);
var
  i: Integer;
  Chip: TFiltroPedidoChip;
begin
  for i := 0 to ScrollBox.ControlCount - 1 do
  begin
    if ScrollBox.Controls[i] is TFiltroPedidoChip then
    begin
      Chip := TFiltroPedidoChip(ScrollBox.Controls[i]);
      Chip.Selecionado := (Chip.IdFiltro = IdFiltro);
    end;
  end;
end;

class function TPedidoCardHelper.BuscarPedidosCliente(
  Connection: TFDConnection;
  IdCliente: Integer;
  IdFiltroStatus: Integer
): TList<TDadosPedidoCard>;
var
  Qr: TFDQuery;
  Dados: TDadosPedidoCard;
begin
  Result := TList<TDadosPedidoCard>.Create;

  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := Connection;
    Qr.SQL.Clear;

    // ⭐ QUERY ATUALIZADA COM DADOS DO ENTREGADOR
    Qr.SQL.Add('SELECT ');
    Qr.SQL.Add('  p.id_pedido, p.id_status_pedido, p.valor_total_pedido,');
    Qr.SQL.Add('  p.data_pedido, p.taxa_entrega, p.endereco_entrega,');
    Qr.SQL.Add('  c.nome_comercio, c.tempo_preparo_medio,');
    Qr.SQL.Add('  fp.nome_estado AS nome_status,');
    Qr.SQL.Add('  u.nome_user AS nome_entregador,');
    Qr.SQL.Add('  u.nphone_user,');
    Qr.SQL.Add('  (SELECT COUNT(*) FROM itens_pedido ip WHERE ip.id_pedido = p.id_pedido) AS qtd_itens');
    Qr.SQL.Add('FROM pedidos p');
    Qr.SQL.Add('INNER JOIN comercios c ON p.id_comercio = c.id_comercio');
    Qr.SQL.Add('LEFT JOIN filtros_pedidos fp ON p.id_status_pedido = fp.id_estado');
    Qr.SQL.Add('LEFT JOIN entregadores e ON p.id_entregador = e.id_entregador');
    Qr.SQL.Add('LEFT JOIN usuarios u ON e.id_user = u.id_user');
    Qr.SQL.Add('WHERE p.id_clie = :id_cliente');

    if IdFiltroStatus >= 0 then
    begin
      Qr.SQL.Add('AND p.id_status_pedido = :id_status');
      Qr.ParamByName('id_status').AsInteger := IdFiltroStatus;
    end;

    Qr.SQL.Add('ORDER BY p.data_pedido DESC');
    Qr.ParamByName('id_cliente').AsInteger := IdCliente;
    Qr.Open;

    while not Qr.Eof do
    begin
      Dados.IdPedido := Qr.FieldByName('id_pedido').AsInteger;
      Dados.IdStatusPedido := Qr.FieldByName('id_status_pedido').AsInteger;
      Dados.NomeStatus := Qr.FieldByName('nome_status').AsString;
      Dados.NomeComercio := Qr.FieldByName('nome_comercio').AsString;
      Dados.DataPedido := Qr.FieldByName('data_pedido').AsDateTime;
      Dados.ValorTotal := Qr.FieldByName('valor_total_pedido').AsCurrency;
      Dados.TaxaEntrega := Qr.FieldByName('taxa_entrega').AsCurrency;
      Dados.QtdItens := Qr.FieldByName('qtd_itens').AsInteger;
      Dados.EnderecoEntrega := Qr.FieldByName('endereco_entrega').AsString;

      // ⭐ NOVO: Dados do entregador
      if not Qr.FieldByName('nome_entregador').IsNull then
        Dados.NomeEntregador := Qr.FieldByName('nome_entregador').AsString
      else
        Dados.NomeEntregador := '';

      // Tempo estimado baseado no status
      case Dados.IdStatusPedido of
        0, 1, 2: Dados.TempoEstimado := 'Preparo: ~' + Qr.FieldByName('tempo_preparo_medio').AsString + ' min';
        3: Dados.TempoEstimado := 'Aguardando entregador';
        4: Dados.TempoEstimado := 'Chega em breve';
        5: Dados.TempoEstimado := 'Entregue';
        6: Dados.TempoEstimado := 'Cancelado';
      else
        Dados.TempoEstimado := '';
      end;

      // Pode cancelar apenas se Pendente (0) ou Confirmado (1)
      Dados.PodeCancelar := Dados.IdStatusPedido in [0, 1];

      Result.Add(Dados);
      Qr.Next;
    end;

  finally
    Qr.Free;
  end;
end;

class procedure TPedidoCardHelper.PopularPedidos(
  ScrollBox: TScrollBox;
  Connection: TFDConnection;
  IdCliente: Integer;
  IdFiltroStatus: Integer;
  OnCancelar: TPedidoCancelarEvent;
  OnVerDetalhes: TPedidoVerDetalhesEvent
);
var
  Pedidos: TList<TDadosPedidoCard>;
  Dados: TDadosPedidoCard;
  Card: TPedidoCardCliente;
  Y, CardHeight, Spacing: Integer;
  FormOwner: TComponent;
begin
  if not Assigned(ScrollBox) then
    Exit;

  // Pegar Form como owner
  FormOwner := ScrollBox;
  while Assigned(FormOwner) and not (FormOwner is TForm) do
    FormOwner := FormOwner.Owner;

  if not Assigned(FormOwner) then
    FormOwner := ScrollBox;

  // Limpar cards existentes
  LimparCards(ScrollBox);

  // Buscar pedidos
  Pedidos := BuscarPedidosCliente(Connection, IdCliente, IdFiltroStatus);
  try
    if Pedidos.Count = 0 then
    begin
      ExibirMensagemSemPedidos(ScrollBox);
      Exit;
    end;

    // ⭐ Altura aumentada para acomodar entregador
    CardHeight := 180;
    Spacing := 10;
    Y := Spacing;

    for Dados in Pedidos do
    begin
      Card := TPedidoCardCliente.CreateCard(FormOwner, Dados);
      Card.Parent := ScrollBox;
      Card.Left := 10;
      Card.Top := Y;
      Card.Width := ScrollBox.ClientWidth - 25;
      Card.Anchors := [akLeft, akTop, akRight];
      Card.ConfigurarVisual;
      Card.OnCancelar := OnCancelar;
      Card.OnVerDetalhes := OnVerDetalhes;

      Inc(Y, CardHeight + Spacing);
    end;

  finally
    Pedidos.Free;
  end;
end;

class procedure TPedidoCardHelper.LimparCards(ScrollBox: TScrollBox);
var
  I: Integer;
begin
  for I := ScrollBox.ControlCount - 1 downto 0 do
  begin
    if (ScrollBox.Controls[I] is TPedidoCardCliente) or
       (ScrollBox.Controls[I] is TFiltroPedidoChip) or
       (ScrollBox.Controls[I] is TPanel) then
      ScrollBox.Controls[I].Free;
  end;

  if Assigned(ScrollBox) then
    ScrollBox.VertScrollBar.Position := 0;
end;

class function TPedidoCardHelper.CancelarPedido(
  Connection: TFDConnection;
  IdPedido: Integer
): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;

  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := Connection;
    Qr.SQL.Text :=
      'UPDATE pedidos SET id_status_pedido = 6 WHERE id_pedido = :id_pedido';
    Qr.ParamByName('id_pedido').AsInteger := IdPedido;
    Qr.ExecSQL;

    Result := Qr.RowsAffected > 0;
  finally
    Qr.Free;
  end;
end;

class procedure TPedidoCardHelper.ExibirMensagemSemPedidos(ScrollBox: TScrollBox);
var
  pMensagem: TPanel;
  lblMensagem: TLabel;
begin
  if not Assigned(ScrollBox) then
    Exit;

  pMensagem := TPanel.Create(ScrollBox);
  pMensagem.Parent := ScrollBox;
  pMensagem.Left := 10;
  pMensagem.Top := 10;
  pMensagem.Width := ScrollBox.ClientWidth - 20;
  pMensagem.Height := 120;
  pMensagem.BevelOuter := bvNone;
  pMensagem.Color := $00F5F5F5;
  pMensagem.Anchors := [akLeft, akTop, akRight];

  lblMensagem := TLabel.Create(pMensagem);
  lblMensagem.Parent := pMensagem;
  lblMensagem.Caption :=
    '📋 Nenhum pedido encontrado' + #13#10#13#10 +
    'Você ainda não fez nenhum pedido' + #13#10 +
    'ou não há pedidos com este filtro.';
  lblMensagem.Font.Name := 'Segoe UI';
  lblMensagem.Font.Size := 11;
  lblMensagem.Font.Color := $00808080;
  lblMensagem.Alignment := taCenter;
  lblMensagem.Layout := tlCenter;
  lblMensagem.WordWrap := True;
  lblMensagem.Align := alClient;
end;

end.
