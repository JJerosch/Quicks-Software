unit PedidoCardHelperAdmin;

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
  TFiltroAdminSelecionadoEvent = procedure(IdFiltro: Integer; const NomeFiltro: String) of object;
  TComercioAdminSelecionadoEvent = procedure(IdComercio: Integer; const NomeComercio: String) of object;
  TPedidoAdminVerDetalhesEvent = procedure(IdPedido: Integer) of object;

  // ========== RECORD PARA DADOS DO PEDIDO ADMIN ==========
  TDadosPedidoAdmin = record
    IdPedido: Integer;
    IdStatusPedido: Integer;
    NomeStatus: String;
    NomeComercio: String;
    NomeCliente: String;
    DataPedido: TDateTime;
    ValorTotal: Currency;
    TaxaEntrega: Currency;
    EnderecoEntrega: String;
    QtdItens: Integer;
    NomeEntregador: String;
    TelefoneEntregador: String;
    TempoEstimado: String;
  end;

  // ========== CHIP DE FILTRO STATUS ==========
  TFiltroStatusChip = class(TPanel)
  private
    FIdFiltro: Integer;
    FNomeFiltro: String;
    FSelecionado: Boolean;
    FOnFiltroSelecionado: TFiltroAdminSelecionadoEvent;
    procedure SetSelecionado(const Value: Boolean);
    procedure ChipClick(Sender: TObject);
  public
    constructor CreateChip(AOwner: TComponent; IdFiltro: Integer; const NomeFiltro: String);
    procedure ConfigurarVisual;
    property IdFiltro: Integer read FIdFiltro;
    property NomeFiltro: String read FNomeFiltro;
    property Selecionado: Boolean read FSelecionado write SetSelecionado;
    property OnFiltroSelecionado: TFiltroAdminSelecionadoEvent read FOnFiltroSelecionado write FOnFiltroSelecionado;
  end;

  // ========== CHIP DE FILTRO COMÉRCIO ==========
  TFiltroComercioChip = class(TPanel)
  private
    FIdComercio: Integer;
    FNomeComercio: String;
    FSelecionado: Boolean;
    FOnComercioSelecionado: TComercioAdminSelecionadoEvent;
    procedure SetSelecionado(const Value: Boolean);
    procedure ChipClick(Sender: TObject);
  public
    constructor CreateChip(AOwner: TComponent; IdComercio: Integer; const NomeComercio: String);
    procedure ConfigurarVisual;
    property IdComercio: Integer read FIdComercio;
    property NomeComercio: String read FNomeComercio;
    property Selecionado: Boolean read FSelecionado write SetSelecionado;
    property OnComercioSelecionado: TComercioAdminSelecionadoEvent read FOnComercioSelecionado write FOnComercioSelecionado;
  end;

  // ========== CARD DO PEDIDO PARA ADMIN (SOMENTE VISUALIZAÇÃO) ==========
  TAdminPedidoCard = class(TPanel)
  private
    FIdPedido: Integer;
    FDados: TDadosPedidoAdmin;
    FOnVerDetalhes: TPedidoAdminVerDetalhesEvent;

    // Componentes visuais
    pHeader: TPanel;
    pStatus: TPanel;
    lblNumeroPedido: TLabel;
    lblNomeComercio: TLabel;
    lblNomeCliente: TLabel;
    lblStatus: TLabel;
    lblDataPedido: TLabel;
    lblValorTotal: TLabel;
    lblQtdItens: TLabel;
    lblEntregador: TLabel;
    lblEndereco: TLabel;
    lblTempoEstimado: TLabel;

    function ObterCorStatus(IdStatus: Integer): TColor;
    function ObterEmojiStatus(IdStatus: Integer): String;
  public
    constructor CreateCard(AOwner: TComponent; const Dados: TDadosPedidoAdmin);
    procedure ConfigurarVisual;

    property IdPedido: Integer read FIdPedido;
    property OnVerDetalhes: TPedidoAdminVerDetalhesEvent read FOnVerDetalhes write FOnVerDetalhes;
  end;

  // ========== HELPER PRINCIPAL ==========
  TAdminPedidoCardHelper = class
  public
    // Filtros de Status
    class procedure PopularFiltrosStatus(
      ScrollBox: TScrollBox;
      Connection: TFDConnection;
      OnFiltroClick: TFiltroAdminSelecionadoEvent
    );
    class procedure DeselecionarTodosFiltrosStatus(ScrollBox: TScrollBox);
    class procedure SelecionarFiltroStatus(ScrollBox: TScrollBox; IdFiltro: Integer);

    // Filtros de Comércio
    class procedure PopularFiltrosComercios(
      ScrollBox: TScrollBox;
      Connection: TFDConnection;
      OnComercioClick: TComercioAdminSelecionadoEvent
    );
    class procedure DeselecionarTodosFiltrosComercios(ScrollBox: TScrollBox);
    class procedure SelecionarFiltroComercio(ScrollBox: TScrollBox; IdComercio: Integer);

    // Pedidos
    class function BuscarPedidosAdmin(
      Connection: TFDConnection;
      IdFiltroStatus: Integer = -1;
      IdComercio: Integer = 0
    ): TList<TDadosPedidoAdmin>;

    class procedure PopularPedidos(
      ScrollBox: TScrollBox;
      Connection: TFDConnection;
      IdFiltroStatus: Integer;
      IdComercio: Integer;
      OnVerDetalhes: TPedidoAdminVerDetalhesEvent
    );

    class procedure LimparCards(ScrollBox: TScrollBox);
    class procedure ExibirMensagemSemPedidos(ScrollBox: TScrollBox);
  end;

implementation

uses
  uConn;

{ TFiltroStatusChip }

constructor TFiltroStatusChip.CreateChip(AOwner: TComponent; IdFiltro: Integer; const NomeFiltro: String);
begin
  inherited Create(AOwner);

  FIdFiltro := IdFiltro;
  FNomeFiltro := NomeFiltro;
  FSelecionado := False;

  Self.Height := 40;
  Self.Width := 120;
end;

procedure TFiltroStatusChip.ConfigurarVisual;
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

procedure TFiltroStatusChip.ChipClick(Sender: TObject);
begin
  if Assigned(FOnFiltroSelecionado) then
    FOnFiltroSelecionado(FIdFiltro, FNomeFiltro);
end;

procedure TFiltroStatusChip.SetSelecionado(const Value: Boolean);
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

{ TFiltroComercioChip }

constructor TFiltroComercioChip.CreateChip(AOwner: TComponent; IdComercio: Integer; const NomeComercio: String);
begin
  inherited Create(AOwner);

  FIdComercio := IdComercio;
  FNomeComercio := NomeComercio;
  FSelecionado := False;

  Self.Height := 40;
  Self.Width := 120;
end;

procedure TFiltroComercioChip.ConfigurarVisual;
var
  lblTexto: TLabel;
  LarguraTexto: Integer;
begin
  Self.ParentBackground := False;
  Self.BevelOuter := bvNone;
  Self.Color := clWhite;
  Self.Cursor := crHandPoint;
  Self.ShowHint := True;
  Self.Hint := 'Filtrar por ' + FNomeComercio;
  Self.OnClick := ChipClick;
  Self.BorderStyle := bsSingle;
  Self.ParentColor := False;

  lblTexto := TLabel.Create(Self);
  lblTexto.Parent := Self;
  lblTexto.Caption := FNomeComercio;
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

  lblTexto.AutoSize := True;
  LarguraTexto := lblTexto.Canvas.TextWidth(FNomeComercio);
  lblTexto.AutoSize := False;

  Self.Width := LarguraTexto + 30;
  if Self.Width < 80 then
    Self.Width := 80;
  if Self.Width > 180 then
    Self.Width := 180;
end;

procedure TFiltroComercioChip.ChipClick(Sender: TObject);
begin
  if Assigned(FOnComercioSelecionado) then
    FOnComercioSelecionado(FIdComercio, FNomeComercio);
end;

procedure TFiltroComercioChip.SetSelecionado(const Value: Boolean);
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

{ TAdminPedidoCard }

constructor TAdminPedidoCard.CreateCard(AOwner: TComponent; const Dados: TDadosPedidoAdmin);
begin
  inherited Create(AOwner);

  FIdPedido := Dados.IdPedido;
  FDados := Dados;

  // Altura similar ao card de clientes
  Self.Height := 180;
  Self.Width := 100;
end;

procedure TAdminPedidoCard.ConfigurarVisual;
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
  lblNumeroPedido.Font.Color := clBlack;
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
  lblNomeComercio.Font.Color := clBlack;
  lblNomeComercio.Transparent := True;

  // Nome do Cliente
  lblNomeCliente := TLabel.Create(Self);
  lblNomeCliente.Parent := Self;
  lblNomeCliente.Left := 15;
  lblNomeCliente.Top := 72;
  lblNomeCliente.Caption := '👤 Cliente: ' + FDados.NomeCliente;
  lblNomeCliente.Font.Name := 'Segoe UI';
  lblNomeCliente.Font.Size := 9;
  lblNomeCliente.Font.Color := clBlack;
  lblNomeCliente.Transparent := True;

  // Data do Pedido
  lblDataPedido := TLabel.Create(Self);
  lblDataPedido.Parent := Self;
  lblDataPedido.Left := 250;
  lblDataPedido.Top := 50;
  lblDataPedido.Caption := '📅 ' + FormatDateTime('dd/mm/yyyy hh:nn', FDados.DataPedido);
  lblDataPedido.Font.Name := 'Segoe UI';
  lblDataPedido.Font.Size := 9;
  lblDataPedido.Font.Color := clBlack;
  lblDataPedido.Transparent := True;

  // Quantidade de Itens
  lblQtdItens := TLabel.Create(Self);
  lblQtdItens.Parent := Self;
  lblQtdItens.Left := 250;
  lblQtdItens.Top := 72;
  lblQtdItens.Caption := '📦 ' + IntToStr(FDados.QtdItens) + ' ' +
    IfThen(FDados.QtdItens = 1, 'item', 'itens');
  lblQtdItens.Font.Name := 'Segoe UI';
  lblQtdItens.Font.Size := 9;
  lblQtdItens.Font.Color := clBlack;
  lblQtdItens.Transparent := True;

  // Entregador (se houver)
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
    lblEntregador.Font.Color := clBlack;
    lblEntregador.Transparent := True;
  end;

  // Valor Total
  lblValorTotal := TLabel.Create(Self);
  lblValorTotal.Parent := Self;
  lblValorTotal.Left := 15;

  if Trim(FDados.NomeEntregador) <> '' then
    lblValorTotal.Top := 116
  else
    lblValorTotal.Top := 95;

  lblValorTotal.Caption := '💰 Total: R$ ' + FormatFloat('#,##0.00', FDados.ValorTotal);
  lblValorTotal.Font.Name := 'Segoe UI';
  lblValorTotal.Font.Size := 11;
  lblValorTotal.Font.Style := [fsBold];
  lblValorTotal.Font.Color := clGreen;
  lblValorTotal.Transparent := True;

  // Tempo Estimado (se aplicável)
  if Trim(FDados.TempoEstimado) <> '' then
  begin
    lblTempoEstimado := TLabel.Create(Self);
    lblTempoEstimado.Parent := Self;
    lblTempoEstimado.Left := 250;

    if Trim(FDados.NomeEntregador) <> '' then
      lblTempoEstimado.Top := 116
    else
      lblTempoEstimado.Top := 95;

    lblTempoEstimado.Caption := '⏱️ ' + FDados.TempoEstimado;
    lblTempoEstimado.Font.Name := 'Segoe UI';
    lblTempoEstimado.Font.Size := 9;
    lblTempoEstimado.Font.Color := clBlack;
    lblTempoEstimado.Transparent := True;
  end;

  // Endereço de Entrega
  lblEndereco := TLabel.Create(Self);
  lblEndereco.Parent := Self;
  lblEndereco.Left := 15;

  if Trim(FDados.NomeEntregador) <> '' then
    lblEndereco.Top := 140
  else
    lblEndereco.Top := 120;

  if Length(FDados.EnderecoEntrega) > 60 then
    lblEndereco.Caption := '📍 ' + Copy(FDados.EnderecoEntrega, 1, 60) + '...'
  else
    lblEndereco.Caption := '📍 ' + FDados.EnderecoEntrega;

  lblEndereco.Font.Name := 'Segoe UI';
  lblEndereco.Font.Size := 8;
  lblEndereco.Font.Color := clRed;
  lblEndereco.Transparent := True;
  lblEndereco.ShowHint := True;
  lblEndereco.Hint := FDados.EnderecoEntrega;
end;

function TAdminPedidoCard.ObterCorStatus(IdStatus: Integer): TColor;
begin
  case IdStatus of
    0: Result := $000080FF;  // Laranja - Pendente
    1: Result := $00FF901E;  // Azul - Confirmado
    2: Result := $0000CCFF;  // Amarelo - Preparando
    3: Result := $00FFCC00;  // Ciano - Pronto p/Entrega
    4: Result := $0000D7FF;  // Dourado - A Caminho
    5: Result := $0000BB00;  // Verde - Entregue
    6: Result := $000000CC;  // Vermelho - Cancelado
  else
    Result := $00808080;     // Cinza - Desconhecido
  end;
end;

function TAdminPedidoCard.ObterEmojiStatus(IdStatus: Integer): String;
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

{ TAdminPedidoCardHelper }

class procedure TAdminPedidoCardHelper.PopularFiltrosStatus(
  ScrollBox: TScrollBox;
  Connection: TFDConnection;
  OnFiltroClick: TFiltroAdminSelecionadoEvent
);
var
  Qr: TFDQuery;
  Chip: TFiltroStatusChip;
  PosX: Integer;
  FormOwner: TComponent;
begin
  if not Assigned(ScrollBox) then
    Exit;

  FormOwner := ScrollBox;
  while Assigned(FormOwner) and not (FormOwner is TForm) do
    FormOwner := FormOwner.Owner;

  if not Assigned(FormOwner) then
    FormOwner := ScrollBox;

  // Limpar chips existentes
  LimparCards(ScrollBox);

  PosX := 10;

  // Adicionar chip "Todos" primeiro
  Chip := TFiltroStatusChip.CreateChip(FormOwner, -1, 'Todos');
  Chip.Parent := ScrollBox;
  Chip.ConfigurarVisual;
  Chip.Left := PosX;
  Chip.Top := 5;
  Chip.OnFiltroSelecionado := OnFiltroClick;
  Chip.Selecionado := True;
  Inc(PosX, Chip.Width + 10);

  // Buscar filtros da tabela filtros_pedidos
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := Connection;
    Qr.SQL.Text := 'SELECT id_estado, nome_estado FROM filtros_pedidos ORDER BY id_estado';
    Qr.Open;

    while not Qr.Eof do
    begin
      Chip := TFiltroStatusChip.CreateChip(
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

class procedure TAdminPedidoCardHelper.DeselecionarTodosFiltrosStatus(ScrollBox: TScrollBox);
var
  i: Integer;
begin
  for i := 0 to ScrollBox.ControlCount - 1 do
  begin
    if ScrollBox.Controls[i] is TFiltroStatusChip then
      TFiltroStatusChip(ScrollBox.Controls[i]).Selecionado := False;
  end;
end;

class procedure TAdminPedidoCardHelper.SelecionarFiltroStatus(ScrollBox: TScrollBox; IdFiltro: Integer);
var
  i: Integer;
  Chip: TFiltroStatusChip;
begin
  for i := 0 to ScrollBox.ControlCount - 1 do
  begin
    if ScrollBox.Controls[i] is TFiltroStatusChip then
    begin
      Chip := TFiltroStatusChip(ScrollBox.Controls[i]);
      Chip.Selecionado := (Chip.IdFiltro = IdFiltro);
    end;
  end;
end;

class procedure TAdminPedidoCardHelper.PopularFiltrosComercios(
  ScrollBox: TScrollBox;
  Connection: TFDConnection;
  OnComercioClick: TComercioAdminSelecionadoEvent
);
var
  Qr: TFDQuery;
  Chip: TFiltroComercioChip;
  PosX: Integer;
  FormOwner: TComponent;
begin
  if not Assigned(ScrollBox) then
    Exit;

  FormOwner := ScrollBox;
  while Assigned(FormOwner) and not (FormOwner is TForm) do
    FormOwner := FormOwner.Owner;

  if not Assigned(FormOwner) then
    FormOwner := ScrollBox;

  LimparCards(ScrollBox);

  PosX := 10;

  // Adicionar chip "Todos" primeiro
  Chip := TFiltroComercioChip.CreateChip(FormOwner, 0, 'Todos');
  Chip.Parent := ScrollBox;
  Chip.ConfigurarVisual;
  Chip.Left := PosX;
  Chip.Top := 5;
  Chip.OnComercioSelecionado := OnComercioClick;
  Chip.Selecionado := True;
  Inc(PosX, Chip.Width + 10);

  // Buscar comércios ativos
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := Connection;
    Qr.SQL.Text := 'SELECT id_comercio, nome_comercio FROM comercios WHERE ativo = true ORDER BY nome_comercio';
    Qr.Open;

    while not Qr.Eof do
    begin
      Chip := TFiltroComercioChip.CreateChip(
        FormOwner,
        Qr.FieldByName('id_comercio').AsInteger,
        Qr.FieldByName('nome_comercio').AsString
      );
      Chip.Parent := ScrollBox;
      Chip.ConfigurarVisual;
      Chip.Left := PosX;
      Chip.Top := 5;
      Chip.OnComercioSelecionado := OnComercioClick;
      Chip.Selecionado := False;

      Inc(PosX, Chip.Width + 10);
      Qr.Next;
    end;

  finally
    Qr.Free;
  end;
end;

class procedure TAdminPedidoCardHelper.DeselecionarTodosFiltrosComercios(ScrollBox: TScrollBox);
var
  i: Integer;
begin
  for i := 0 to ScrollBox.ControlCount - 1 do
  begin
    if ScrollBox.Controls[i] is TFiltroComercioChip then
      TFiltroComercioChip(ScrollBox.Controls[i]).Selecionado := False;
  end;
end;

class procedure TAdminPedidoCardHelper.SelecionarFiltroComercio(ScrollBox: TScrollBox; IdComercio: Integer);
var
  i: Integer;
  Chip: TFiltroComercioChip;
begin
  for i := 0 to ScrollBox.ControlCount - 1 do
  begin
    if ScrollBox.Controls[i] is TFiltroComercioChip then
    begin
      Chip := TFiltroComercioChip(ScrollBox.Controls[i]);
      Chip.Selecionado := (Chip.IdComercio = IdComercio);
    end;
  end;
end;

class function TAdminPedidoCardHelper.BuscarPedidosAdmin(
  Connection: TFDConnection;
  IdFiltroStatus: Integer;
  IdComercio: Integer
): TList<TDadosPedidoAdmin>;
var
  Qr: TFDQuery;
  Dados: TDadosPedidoAdmin;
begin
  Result := TList<TDadosPedidoAdmin>.Create;

  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := Connection;
    Qr.SQL.Clear;

    Qr.SQL.Add('SELECT ');
    Qr.SQL.Add('  p.id_pedido, p.id_status_pedido, p.valor_total_pedido,');
    Qr.SQL.Add('  p.data_pedido, p.taxa_entrega, p.endereco_entrega,');
    Qr.SQL.Add('  c.nome_comercio, c.tempo_preparo_medio,');
    Qr.SQL.Add('  u.nome_user AS nome_cliente,');
    Qr.SQL.Add('  fp.nome_estado AS nome_status,');
    Qr.SQL.Add('  ue.nome_user AS nome_entregador,');
    Qr.SQL.Add('  ue.nphone_user AS telefone_entregador,');
    Qr.SQL.Add('  (SELECT COUNT(*) FROM itens_pedido ip WHERE ip.id_pedido = p.id_pedido) AS qtd_itens');
    Qr.SQL.Add('FROM pedidos p');
    Qr.SQL.Add('INNER JOIN comercios c ON p.id_comercio = c.id_comercio');
    Qr.SQL.Add('INNER JOIN clientes cl ON p.id_clie = cl.id_clie');
    Qr.SQL.Add('INNER JOIN usuarios u ON cl.id_user = u.id_user');
    Qr.SQL.Add('LEFT JOIN filtros_pedidos fp ON p.id_status_pedido = fp.id_estado');
    Qr.SQL.Add('LEFT JOIN entregadores e ON p.id_entregador = e.id_entregador');
    Qr.SQL.Add('LEFT JOIN usuarios ue ON e.id_user = ue.id_user');
    Qr.SQL.Add('WHERE 1=1');

    if IdFiltroStatus >= 0 then
    begin
      Qr.SQL.Add('AND p.id_status_pedido = :id_status');
      Qr.ParamByName('id_status').AsInteger := IdFiltroStatus;
    end;

    if IdComercio > 0 then
    begin
      Qr.SQL.Add('AND p.id_comercio = :id_comercio');
      Qr.ParamByName('id_comercio').AsInteger := IdComercio;
    end;

    Qr.SQL.Add('ORDER BY p.data_pedido DESC');
    Qr.Open;

    while not Qr.Eof do
    begin
      Dados.IdPedido := Qr.FieldByName('id_pedido').AsInteger;
      Dados.IdStatusPedido := Qr.FieldByName('id_status_pedido').AsInteger;
      Dados.NomeStatus := Qr.FieldByName('nome_status').AsString;
      Dados.NomeComercio := Qr.FieldByName('nome_comercio').AsString;
      Dados.NomeCliente := Qr.FieldByName('nome_cliente').AsString;
      Dados.DataPedido := Qr.FieldByName('data_pedido').AsDateTime;
      Dados.ValorTotal := Qr.FieldByName('valor_total_pedido').AsCurrency;
      Dados.TaxaEntrega := Qr.FieldByName('taxa_entrega').AsCurrency;
      Dados.EnderecoEntrega := Qr.FieldByName('endereco_entrega').AsString;
      Dados.QtdItens := Qr.FieldByName('qtd_itens').AsInteger;

      // Dados do entregador
      if not Qr.FieldByName('nome_entregador').IsNull then
        Dados.NomeEntregador := Qr.FieldByName('nome_entregador').AsString
      else
        Dados.NomeEntregador := '';

      if not Qr.FieldByName('telefone_entregador').IsNull then
        Dados.TelefoneEntregador := Qr.FieldByName('telefone_entregador').AsString
      else
        Dados.TelefoneEntregador := '';

      // Tempo estimado baseado no status
      case Dados.IdStatusPedido of
        0, 1, 2: Dados.TempoEstimado := 'Preparo: ~' + Qr.FieldByName('tempo_preparo_medio').AsString + ' min';
        3: Dados.TempoEstimado := 'Aguardando entregador';
        4: Dados.TempoEstimado := 'Em entrega';
        5: Dados.TempoEstimado := 'Entregue';
        6: Dados.TempoEstimado := 'Cancelado';
      else
        Dados.TempoEstimado := '';
      end;

      Result.Add(Dados);
      Qr.Next;
    end;

  finally
    Qr.Free;
  end;
end;

class procedure TAdminPedidoCardHelper.PopularPedidos(
  ScrollBox: TScrollBox;
  Connection: TFDConnection;
  IdFiltroStatus: Integer;
  IdComercio: Integer;
  OnVerDetalhes: TPedidoAdminVerDetalhesEvent
);
var
  Pedidos: TList<TDadosPedidoAdmin>;
  Dados: TDadosPedidoAdmin;
  Card: TAdminPedidoCard;
  Y, CardHeight, Spacing: Integer;
  FormOwner: TComponent;
begin
  if not Assigned(ScrollBox) then
    Exit;

  FormOwner := ScrollBox;
  while Assigned(FormOwner) and not (FormOwner is TForm) do
    FormOwner := FormOwner.Owner;

  if not Assigned(FormOwner) then
    FormOwner := ScrollBox;

  // Limpar apenas cards de pedidos (não os chips de filtro)
  for Y := ScrollBox.ControlCount - 1 downto 0 do
  begin
    if ScrollBox.Controls[Y] is TAdminPedidoCard then
      ScrollBox.Controls[Y].Free
    else if (ScrollBox.Controls[Y] is TPanel) and
            not (ScrollBox.Controls[Y] is TFiltroStatusChip) and
            not (ScrollBox.Controls[Y] is TFiltroComercioChip) then
      ScrollBox.Controls[Y].Free;
  end;

  Pedidos := BuscarPedidosAdmin(Connection, IdFiltroStatus, IdComercio);
  try
    if Pedidos.Count = 0 then
    begin
      ExibirMensagemSemPedidos(ScrollBox);
      Exit;
    end;

    CardHeight := 180;
    Spacing := 10;
    Y := Spacing;

    for Dados in Pedidos do
    begin
      Card := TAdminPedidoCard.CreateCard(FormOwner, Dados);
      Card.Parent := ScrollBox;
      Card.Left := 10;
      Card.Top := Y;
      Card.Width := ScrollBox.ClientWidth - 25;
      Card.Anchors := [akLeft, akTop, akRight];
      Card.ConfigurarVisual;
      Card.OnVerDetalhes := OnVerDetalhes;

      Inc(Y, CardHeight + Spacing);
    end;

  finally
    Pedidos.Free;
  end;
end;

class procedure TAdminPedidoCardHelper.LimparCards(ScrollBox: TScrollBox);
var
  I: Integer;
begin
  for I := ScrollBox.ControlCount - 1 downto 0 do
  begin
    if (ScrollBox.Controls[I] is TAdminPedidoCard) or
       (ScrollBox.Controls[I] is TFiltroStatusChip) or
       (ScrollBox.Controls[I] is TFiltroComercioChip) or
       (ScrollBox.Controls[I] is TPanel) then
      ScrollBox.Controls[I].Free;
  end;

  if Assigned(ScrollBox) then
    ScrollBox.VertScrollBar.Position := 0;
end;

class procedure TAdminPedidoCardHelper.ExibirMensagemSemPedidos(ScrollBox: TScrollBox);
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
    'Não há pedidos com os filtros selecionados.';
  lblMensagem.Font.Name := 'Segoe UI';
  lblMensagem.Font.Size := 11;
  lblMensagem.Font.Color := $00808080;
  lblMensagem.Alignment := taCenter;
  lblMensagem.Layout := tlCenter;
  lblMensagem.WordWrap := True;
  lblMensagem.Align := alClient;
end;

end.
