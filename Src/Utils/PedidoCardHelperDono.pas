unit PedidoCardHelperDono;

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
  TFiltroSelecionadoDonoEvent = procedure(IdFiltro: Integer; const NomeFiltro: String) of object;
  TPedidoStatusChangeEvent = procedure(IdPedido: Integer; NovoStatus: Integer) of object;
  TPedidoRecusarEvent = procedure(IdPedido: Integer) of object;
  TPedidoVerDetalhesDonoEvent = procedure(IdPedido: Integer) of object;

  // ========== RECORD PARA DADOS DO PEDIDO ==========
  TDadosPedidoDono = record
    IdPedido: Integer;
    IdStatusPedido: Integer;
    NomeStatus: String;
    CorStatus: TColor;
    NomeCliente: String;
    TelefoneCliente: String;
    EnderecoEntrega: String;
    DataPedido: TDateTime;
    ValorTotal: Currency;
    TaxaEntrega: Currency;
    QtdItens: Integer;
    Observacoes: String;
  end;

  // ========== CHIP DE FILTRO PARA DONO ==========
  TFiltroPedidoChipDono = class(TPanel)
  private
    FIdFiltro: Integer;
    FNomeFiltro: String;
    FSelecionado: Boolean;
    FOnFiltroSelecionado: TFiltroSelecionadoDonoEvent;
    procedure SetSelecionado(const Value: Boolean);
    procedure ChipClick(Sender: TObject);
  public
    constructor CreateChip(AOwner: TComponent; IdFiltro: Integer; const NomeFiltro: String);
    procedure ConfigurarVisual;
    property IdFiltro: Integer read FIdFiltro;
    property NomeFiltro: String read FNomeFiltro;
    property Selecionado: Boolean read FSelecionado write SetSelecionado;
    property OnFiltroSelecionado: TFiltroSelecionadoDonoEvent read FOnFiltroSelecionado write FOnFiltroSelecionado;
  end;

  // ========== CARD DO PEDIDO PARA DONO ==========
  TPedidoCardDono = class(TPanel)
  private
    FIdPedido: Integer;
    FDados: TDadosPedidoDono;
    FOnStatusChange: TPedidoStatusChangeEvent;
    FOnRecusar: TPedidoRecusarEvent;
    FOnVerDetalhes: TPedidoVerDetalhesDonoEvent;

    // Componentes visuais
    pHeader: TPanel;
    pStatus: TPanel;
    pBotoes: TPanel;
    lblNumeroPedido: TLabel;
    lblNomeCliente: TLabel;
    lblTelefoneCliente: TLabel;
    lblEnderecoEntrega: TLabel;
    lblDataPedido: TLabel;
    lblValorTotal: TLabel;
    lblQtdItens: TLabel;
    btnConfirmar: TButton;
    btnPreparando: TButton;
    btnProntoEntrega: TButton;
    btnRecusar: TButton;
    btnVerDetalhes: TButton;

    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnPreparandoClick(Sender: TObject);
    procedure BtnProntoEntregaClick(Sender: TObject);
    procedure BtnRecusarClick(Sender: TObject);
    procedure BtnVerDetalhesClick(Sender: TObject);

    function ObterCorStatus(IdStatus: Integer): TColor;
    function ObterNomeStatus(IdStatus: Integer): String;
    procedure AtualizarBotoesVisiveis;
  public
    constructor CreateCard(AOwner: TComponent; const Dados: TDadosPedidoDono);
    procedure ConfigurarVisual;
    procedure AtualizarStatus(NovoIdStatus: Integer);

    property IdPedido: Integer read FIdPedido;
    property OnStatusChange: TPedidoStatusChangeEvent read FOnStatusChange write FOnStatusChange;
    property OnRecusar: TPedidoRecusarEvent read FOnRecusar write FOnRecusar;
    property OnVerDetalhes: TPedidoVerDetalhesDonoEvent read FOnVerDetalhes write FOnVerDetalhes;
  end;

  // ========== HELPER PRINCIPAL ==========
  TPedidoCardHelperDono = class
  public
    // Filtros
    class procedure PopularFiltros(
      ScrollBox: TScrollBox;
      Connection: TFDConnection;
      OnFiltroClick: TFiltroSelecionadoDonoEvent
    );
    class procedure DeselecionarTodosFiltros(ScrollBox: TScrollBox);
    class procedure SelecionarFiltro(ScrollBox: TScrollBox; IdFiltro: Integer);

    // Pedidos
    class function BuscarPedidosComercio(
      Connection: TFDConnection;
      IdComercio: Integer;
      IdFiltroStatus: Integer = -1
    ): TList<TDadosPedidoDono>;

    class procedure PopularPedidos(
      ScrollBox: TScrollBox;
      Connection: TFDConnection;
      IdComercio: Integer;
      IdFiltroStatus: Integer;
      OnStatusChange: TPedidoStatusChangeEvent;
      OnRecusar: TPedidoRecusarEvent;
      OnVerDetalhes: TPedidoVerDetalhesDonoEvent
    );

    class procedure LimparCards(ScrollBox: TScrollBox);

    // Ações de Status
    class function AlterarStatusPedido(
      Connection: TFDConnection;
      IdPedido: Integer;
      NovoStatus: Integer
    ): Boolean;

    class function RecusarPedido(
      Connection: TFDConnection;
      IdPedido: Integer
    ): Boolean;

    class procedure ExibirMensagemSemPedidos(ScrollBox: TScrollBox);
  end;

implementation

{ TFiltroPedidoChipDono }

constructor TFiltroPedidoChipDono.CreateChip(AOwner: TComponent; IdFiltro: Integer; const NomeFiltro: String);
begin
  inherited Create(AOwner);

  FIdFiltro := IdFiltro;
  FNomeFiltro := NomeFiltro;
  FSelecionado := False;

  Self.Height := 40;
  Self.Width := 120;
end;

procedure TFiltroPedidoChipDono.ConfigurarVisual;
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
  lblTexto.Font.Color := $00FF6600; // Laranja (tema do dono)
  lblTexto.Cursor := crHandPoint;
  lblTexto.OnClick := ChipClick;
  lblTexto.Transparent := True;
  lblTexto.Alignment := taCenter;
  lblTexto.Layout := tlCenter;
  lblTexto.Align := alClient;

  lblTexto.AutoSize := True;
  LarguraTexto := lblTexto.Canvas.TextWidth(FNomeFiltro);
  lblTexto.AutoSize := False;

  Self.Width := LarguraTexto + 30;
  if Self.Width < 80 then
    Self.Width := 80;
  if Self.Width > 150 then
    Self.Width := 150;
end;

procedure TFiltroPedidoChipDono.ChipClick(Sender: TObject);
begin
  if Assigned(FOnFiltroSelecionado) then
    FOnFiltroSelecionado(FIdFiltro, FNomeFiltro);
end;

procedure TFiltroPedidoChipDono.SetSelecionado(const Value: Boolean);
var
  lbl: TLabel;
  i: Integer;
begin
  FSelecionado := Value;

  if FSelecionado then
  begin
    Self.Color := $00FF6600; // Laranja
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
        lbl.Font.Color := $00FF6600;
      end;
    end;
  end;
end;

{ TPedidoCardDono }

constructor TPedidoCardDono.CreateCard(AOwner: TComponent; const Dados: TDadosPedidoDono);
begin
  inherited Create(AOwner);

  FIdPedido := Dados.IdPedido;
  FDados := Dados;

  Self.Height := 200;
  Self.Width := 100;
end;

procedure TPedidoCardDono.ConfigurarVisual;
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
  pStatus.Width := 140;
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
  lblNumeroPedido.Caption := '📋 PEDIDO #' + IntToStr(FDados.IdPedido);
  lblNumeroPedido.Font.Name := 'Segoe UI';
  lblNumeroPedido.Font.Size := 13;
  lblNumeroPedido.Font.Style := [fsBold];
  lblNumeroPedido.Font.Color := $00FF6600;
  lblNumeroPedido.Transparent := True;

  // ========== CORPO DO CARD ==========

  // Nome do Cliente
  lblNomeCliente := TLabel.Create(Self);
  lblNomeCliente.Parent := Self;
  lblNomeCliente.Left := 15;
  lblNomeCliente.Top := 50;
  lblNomeCliente.Caption := '👤 Cliente: ' + FDados.NomeCliente;
  lblNomeCliente.Font.Name := 'Segoe UI';
  lblNomeCliente.Font.Size := 10;
  lblNomeCliente.Font.Style := [fsBold];
  lblNomeCliente.Font.Color := $00333333;
  lblNomeCliente.Transparent := True;

  // Telefone do Cliente
  lblTelefoneCliente := TLabel.Create(Self);
  lblTelefoneCliente.Parent := Self;
  lblTelefoneCliente.Left := 300;
  lblTelefoneCliente.Top := 50;
  lblTelefoneCliente.Caption := '📞 ' + FDados.TelefoneCliente;
  lblTelefoneCliente.Font.Name := 'Segoe UI';
  lblTelefoneCliente.Font.Size := 9;
  lblTelefoneCliente.Font.Color := $00666666;
  lblTelefoneCliente.Transparent := True;

  // Endereço de Entrega
  lblEnderecoEntrega := TLabel.Create(Self);
  lblEnderecoEntrega.Parent := Self;
  lblEnderecoEntrega.Left := 15;
  lblEnderecoEntrega.Top := 72;
  lblEnderecoEntrega.Caption := '📍 ' + FDados.EnderecoEntrega;
  lblEnderecoEntrega.Font.Name := 'Segoe UI';
  lblEnderecoEntrega.Font.Size := 9;
  lblEnderecoEntrega.Font.Color := $00666666;
  lblEnderecoEntrega.Transparent := True;
  lblEnderecoEntrega.AutoSize := False;
  lblEnderecoEntrega.Width := Self.Width - 30;
  lblEnderecoEntrega.WordWrap := True;

  // Data do Pedido
  lblDataPedido := TLabel.Create(Self);
  lblDataPedido.Parent := Self;
  lblDataPedido.Left := 15;
  lblDataPedido.Top := 95;
  lblDataPedido.Caption := '📅 ' + FormatDateTime('dd/mm/yyyy hh:nn', FDados.DataPedido);
  lblDataPedido.Font.Name := 'Segoe UI';
  lblDataPedido.Font.Size := 9;
  lblDataPedido.Font.Color := $00888888;
  lblDataPedido.Transparent := True;

  // Quantidade de Itens
  lblQtdItens := TLabel.Create(Self);
  lblQtdItens.Parent := Self;
  lblQtdItens.Left := 180;
  lblQtdItens.Top := 95;
  lblQtdItens.Caption := '📦 ' + IntToStr(FDados.QtdItens) + ' ' +
    IfThen(FDados.QtdItens = 1, 'item', 'itens');
  lblQtdItens.Font.Name := 'Segoe UI';
  lblQtdItens.Font.Size := 9;
  lblQtdItens.Font.Color := $00888888;
  lblQtdItens.Transparent := True;

  // Valor Total
  lblValorTotal := TLabel.Create(Self);
  lblValorTotal.Parent := Self;
  lblValorTotal.Left := 15;
  lblValorTotal.Top := 118;
  lblValorTotal.Caption := '💰 Total: R$ ' + FormatFloat('#,##0.00', FDados.ValorTotal) +
    ' (Taxa: R$ ' + FormatFloat('#,##0.00', FDados.TaxaEntrega) + ')';
  lblValorTotal.Font.Name := 'Segoe UI';
  lblValorTotal.Font.Size := 11;
  lblValorTotal.Font.Style := [fsBold];
  lblValorTotal.Font.Color := $0000AA00;
  lblValorTotal.Transparent := True;

  // ========== PAINEL DE BOTÕES ==========
  pBotoes := TPanel.Create(Self);
  pBotoes.Parent := Self;
  pBotoes.Left := 15;
  pBotoes.Top := 150;
  pBotoes.Width := Self.Width - 30;
  pBotoes.Height := 40;
  pBotoes.Anchors := [akLeft, akTop, akRight];
  pBotoes.BevelOuter := bvNone;
  pBotoes.Color := Self.Color;
  pBotoes.ParentBackground := False;

  // Botão Confirmar
  btnConfirmar := TButton.Create(pBotoes);
  btnConfirmar.Parent := pBotoes;
  btnConfirmar.Caption := '✅ Confirmar';
  btnConfirmar.Left := 0;
  btnConfirmar.Top := 5;
  btnConfirmar.Width := 100;
  btnConfirmar.Height := 30;
  btnConfirmar.Font.Name := 'Segoe UI';
  btnConfirmar.Font.Size := 9;
  btnConfirmar.Font.Style := [fsBold];
  btnConfirmar.Cursor := crHandPoint;
  btnConfirmar.OnClick := BtnConfirmarClick;

  // Botão Preparando
  btnPreparando := TButton.Create(pBotoes);
  btnPreparando.Parent := pBotoes;
  btnPreparando.Caption := '👨‍🍳 Preparando';
  btnPreparando.Left := 110;
  btnPreparando.Top := 5;
  btnPreparando.Width := 110;
  btnPreparando.Height := 30;
  btnPreparando.Font.Name := 'Segoe UI';
  btnPreparando.Font.Size := 9;
  btnPreparando.Font.Style := [fsBold];
  btnPreparando.Cursor := crHandPoint;
  btnPreparando.OnClick := BtnPreparandoClick;

  // Botão Pronto p/ Entrega
  btnProntoEntrega := TButton.Create(pBotoes);
  btnProntoEntrega.Parent := pBotoes;
  btnProntoEntrega.Caption := '📦 Pronto p/ Entrega';
  btnProntoEntrega.Left := 230;
  btnProntoEntrega.Top := 5;
  btnProntoEntrega.Width := 140;
  btnProntoEntrega.Height := 30;
  btnProntoEntrega.Font.Name := 'Segoe UI';
  btnProntoEntrega.Font.Size := 9;
  btnProntoEntrega.Font.Style := [fsBold];
  btnProntoEntrega.Cursor := crHandPoint;
  btnProntoEntrega.OnClick := BtnProntoEntregaClick;

  // Botão Recusar
  btnRecusar := TButton.Create(pBotoes);
  btnRecusar.Parent := pBotoes;
  btnRecusar.Caption := '❌ Recusar';
  btnRecusar.Left := pBotoes.Width - 100;
  btnRecusar.Top := 5;
  btnRecusar.Width := 100;
  btnRecusar.Height := 30;
  btnRecusar.Font.Name := 'Segoe UI';
  btnRecusar.Font.Size := 9;
  btnRecusar.Font.Color := clRed;
  btnRecusar.Cursor := crHandPoint;
  btnRecusar.Anchors := [akTop, akRight];
  btnRecusar.OnClick := BtnRecusarClick;

  // Botão Ver Detalhes
  btnVerDetalhes := TButton.Create(pBotoes);
  btnVerDetalhes.Parent := pBotoes;
  btnVerDetalhes.Caption := '👁️ Detalhes';
  btnVerDetalhes.Left := pBotoes.Width - 210;
  btnVerDetalhes.Top := 5;
  btnVerDetalhes.Width := 100;
  btnVerDetalhes.Height := 30;
  btnVerDetalhes.Font.Name := 'Segoe UI';
  btnVerDetalhes.Font.Size := 9;
  btnVerDetalhes.Cursor := crHandPoint;
  btnVerDetalhes.Anchors := [akTop, akRight];
  btnVerDetalhes.OnClick := BtnVerDetalhesClick;

  // Configurar visibilidade inicial dos botões
  AtualizarBotoesVisiveis;
end;

procedure TPedidoCardDono.AtualizarBotoesVisiveis;
begin
  // Esconder todos primeiro
  btnConfirmar.Visible := False;
  btnPreparando.Visible := False;
  btnProntoEntrega.Visible := False;
  btnRecusar.Visible := False;

  case FDados.IdStatusPedido of
    0: // Pendente
    begin
      btnConfirmar.Visible := True;
      btnRecusar.Visible := True;
    end;

    1: // Confirmado
    begin
      btnPreparando.Visible := True;
      btnProntoEntrega.Visible := True;
      btnRecusar.Visible := True;
    end;

    2: // Preparando
    begin
      btnProntoEntrega.Visible := True;
    end;

    // 3+ (Pronto, A Caminho, Entregue, Cancelado) - Nenhum botão de ação
  end;
end;

procedure TPedidoCardDono.BtnConfirmarClick(Sender: TObject);
begin
  if MessageDlg(
    'Confirmar pedido #' + IntToStr(FIdPedido) + '?',
    mtConfirmation,
    [mbYes, mbNo],
    0) = mrYes then
  begin
    if Assigned(FOnStatusChange) then
      FOnStatusChange(FIdPedido, 1); // Status 1 = Confirmado
  end;
end;

procedure TPedidoCardDono.BtnPreparandoClick(Sender: TObject);
begin
  if Assigned(FOnStatusChange) then
    FOnStatusChange(FIdPedido, 2); // Status 2 = Preparando
end;

procedure TPedidoCardDono.BtnProntoEntregaClick(Sender: TObject);
begin
  if Assigned(FOnStatusChange) then
    FOnStatusChange(FIdPedido, 3); // Status 3 = Pronto p/ Entrega
end;

procedure TPedidoCardDono.BtnRecusarClick(Sender: TObject);
begin
  if MessageDlg(
    'Deseja RECUSAR o pedido #' + IntToStr(FIdPedido) + '?' + #13#10#13#10 +
    'O cliente será notificado e o pedido será cancelado.',
    mtWarning,
    [mbYes, mbNo],
    0) = mrYes then
  begin
    if Assigned(FOnRecusar) then
      FOnRecusar(FIdPedido);
  end;
end;

procedure TPedidoCardDono.BtnVerDetalhesClick(Sender: TObject);
begin
  if Assigned(FOnVerDetalhes) then
    FOnVerDetalhes(FIdPedido);
end;

procedure TPedidoCardDono.AtualizarStatus(NovoIdStatus: Integer);
begin
  FDados.IdStatusPedido := NovoIdStatus;
  FDados.NomeStatus := ObterNomeStatus(NovoIdStatus);

  if Assigned(pStatus) then
  begin
    pStatus.Color := ObterCorStatus(NovoIdStatus);
    pStatus.Caption := FDados.NomeStatus;
  end;

  AtualizarBotoesVisiveis;
end;

function TPedidoCardDono.ObterCorStatus(IdStatus: Integer): TColor;
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
    Result := $00808080;
  end;
end;

function TPedidoCardDono.ObterNomeStatus(IdStatus: Integer): String;
begin
  case IdStatus of
    0: Result := 'Pendente';
    1: Result := 'Confirmado';
    2: Result := 'Preparando';
    3: Result := 'Pronto p/ Entrega';
    4: Result := 'A Caminho';
    5: Result := 'Entregue';
    6: Result := 'Cancelado';
  else
    Result := 'Desconhecido';
  end;
end;

{ TPedidoCardHelperDono }

class procedure TPedidoCardHelperDono.PopularFiltros(
  ScrollBox: TScrollBox;
  Connection: TFDConnection;
  OnFiltroClick: TFiltroSelecionadoDonoEvent
);
var
  Qr: TFDQuery;
  Chip: TFiltroPedidoChipDono;
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

  // Chip "Todos"
  Chip := TFiltroPedidoChipDono.CreateChip(FormOwner, -1, 'Todos');
  Chip.Parent := ScrollBox;
  Chip.ConfigurarVisual;
  Chip.Left := PosX;
  Chip.Top := 5;
  Chip.OnFiltroSelecionado := OnFiltroClick;
  Chip.Selecionado := True;
  Inc(PosX, Chip.Width + 10);

  // Buscar filtros da tabela
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := Connection;
    Qr.SQL.Text := 'SELECT id_estado, nome_estado FROM filtros_pedidos ORDER BY id_estado';
    Qr.Open;

    while not Qr.Eof do
    begin
      Chip := TFiltroPedidoChipDono.CreateChip(
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

class procedure TPedidoCardHelperDono.DeselecionarTodosFiltros(ScrollBox: TScrollBox);
var
  i: Integer;
begin
  for i := 0 to ScrollBox.ControlCount - 1 do
  begin
    if ScrollBox.Controls[i] is TFiltroPedidoChipDono then
      TFiltroPedidoChipDono(ScrollBox.Controls[i]).Selecionado := False;
  end;
end;

class procedure TPedidoCardHelperDono.SelecionarFiltro(ScrollBox: TScrollBox; IdFiltro: Integer);
var
  i: Integer;
  Chip: TFiltroPedidoChipDono;
begin
  for i := 0 to ScrollBox.ControlCount - 1 do
  begin
    if ScrollBox.Controls[i] is TFiltroPedidoChipDono then
    begin
      Chip := TFiltroPedidoChipDono(ScrollBox.Controls[i]);
      Chip.Selecionado := (Chip.IdFiltro = IdFiltro);
    end;
  end;
end;

class function TPedidoCardHelperDono.BuscarPedidosComercio(
  Connection: TFDConnection;
  IdComercio: Integer;
  IdFiltroStatus: Integer
): TList<TDadosPedidoDono>;
var
  Qr: TFDQuery;
  Dados: TDadosPedidoDono;
begin
  Result := TList<TDadosPedidoDono>.Create;

  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := Connection;
    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT ');
    Qr.SQL.Add('  p.id_pedido, p.id_status_pedido, p.valor_total_pedido,');
    Qr.SQL.Add('  p.data_pedido, p.taxa_entrega, p.endereco_entrega,');
    Qr.SQL.Add('  u.nome_user AS nome_cliente, u.nphone_user AS telefone_cliente,');
    Qr.SQL.Add('  fp.nome_estado AS nome_status,');
    Qr.SQL.Add('  (SELECT COUNT(*) FROM itens_pedido ip WHERE ip.id_pedido = p.id_pedido) AS qtd_itens');
    Qr.SQL.Add('FROM pedidos p');
    Qr.SQL.Add('INNER JOIN clientes c ON p.id_clie = c.id_clie');
    Qr.SQL.Add('INNER JOIN usuarios u ON c.id_user = u.id_user');
    Qr.SQL.Add('LEFT JOIN filtros_pedidos fp ON p.id_status_pedido = fp.id_estado');
    Qr.SQL.Add('WHERE p.id_comercio = :id_comercio');

    if IdFiltroStatus >= 0 then
    begin
      Qr.SQL.Add('AND p.id_status_pedido = :id_status');
      Qr.ParamByName('id_status').AsInteger := IdFiltroStatus;
    end;

    Qr.SQL.Add('ORDER BY ');
    Qr.SQL.Add('  CASE WHEN p.id_status_pedido = 0 THEN 0 ELSE 1 END,'); // Pendentes primeiro
    Qr.SQL.Add('  p.data_pedido DESC');

    Qr.ParamByName('id_comercio').AsInteger := IdComercio;
    Qr.Open;

    while not Qr.Eof do
    begin
      Dados.IdPedido := Qr.FieldByName('id_pedido').AsInteger;
      Dados.IdStatusPedido := Qr.FieldByName('id_status_pedido').AsInteger;
      Dados.NomeStatus := Qr.FieldByName('nome_status').AsString;
      Dados.NomeCliente := Qr.FieldByName('nome_cliente').AsString;
      Dados.TelefoneCliente := Qr.FieldByName('telefone_cliente').AsString;
      Dados.EnderecoEntrega := Qr.FieldByName('endereco_entrega').AsString;
      Dados.DataPedido := Qr.FieldByName('data_pedido').AsDateTime;
      Dados.ValorTotal := Qr.FieldByName('valor_total_pedido').AsCurrency;
      Dados.TaxaEntrega := Qr.FieldByName('taxa_entrega').AsCurrency;
      Dados.QtdItens := Qr.FieldByName('qtd_itens').AsInteger;

      Result.Add(Dados);
      Qr.Next;
    end;

  finally
    Qr.Free;
  end;
end;

class procedure TPedidoCardHelperDono.PopularPedidos(
  ScrollBox: TScrollBox;
  Connection: TFDConnection;
  IdComercio: Integer;
  IdFiltroStatus: Integer;
  OnStatusChange: TPedidoStatusChangeEvent;
  OnRecusar: TPedidoRecusarEvent;
  OnVerDetalhes: TPedidoVerDetalhesDonoEvent
);
var
  Pedidos: TList<TDadosPedidoDono>;
  Dados: TDadosPedidoDono;
  Card: TPedidoCardDono;
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

  // Limpar apenas cards de pedidos (não filtros)
  for Y := ScrollBox.ControlCount - 1 downto 0 do
  begin
    if ScrollBox.Controls[Y] is TPedidoCardDono then
      ScrollBox.Controls[Y].Free
    else if (ScrollBox.Controls[Y] is TPanel) and
            not (ScrollBox.Controls[Y] is TFiltroPedidoChipDono) then
      ScrollBox.Controls[Y].Free;
  end;

  Pedidos := BuscarPedidosComercio(Connection, IdComercio, IdFiltroStatus);
  try
    if Pedidos.Count = 0 then
    begin
      ExibirMensagemSemPedidos(ScrollBox);
      Exit;
    end;

    CardHeight := 200;
    Spacing := 10;
    Y := Spacing;

    for Dados in Pedidos do
    begin
      Card := TPedidoCardDono.CreateCard(FormOwner, Dados);
      Card.Parent := ScrollBox;
      Card.Left := 10;
      Card.Top := Y;
      Card.Width := ScrollBox.ClientWidth - 25;
      Card.Anchors := [akLeft, akTop, akRight];
      Card.ConfigurarVisual;
      Card.OnStatusChange := OnStatusChange;
      Card.OnRecusar := OnRecusar;
      Card.OnVerDetalhes := OnVerDetalhes;

      Inc(Y, CardHeight + Spacing);
    end;

  finally
    Pedidos.Free;
  end;
end;

class procedure TPedidoCardHelperDono.LimparCards(ScrollBox: TScrollBox);
var
  I: Integer;
begin
  for I := ScrollBox.ControlCount - 1 downto 0 do
  begin
    if (ScrollBox.Controls[I] is TPedidoCardDono) or
       (ScrollBox.Controls[I] is TFiltroPedidoChipDono) or
       (ScrollBox.Controls[I] is TPanel) then
      ScrollBox.Controls[I].Free;
  end;

  if Assigned(ScrollBox) then
    ScrollBox.VertScrollBar.Position := 0;
end;

class function TPedidoCardHelperDono.AlterarStatusPedido(
  Connection: TFDConnection;
  IdPedido: Integer;
  NovoStatus: Integer
): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;

  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := Connection;
    Qr.SQL.Text :=
      'UPDATE pedidos SET id_status_pedido = :novo_status WHERE id_pedido = :id_pedido';
    Qr.ParamByName('novo_status').AsInteger := NovoStatus;
    Qr.ParamByName('id_pedido').AsInteger := IdPedido;
    Qr.ExecSQL;

    Result := Qr.RowsAffected > 0;
  finally
    Qr.Free;
  end;
end;

class function TPedidoCardHelperDono.RecusarPedido(
  Connection: TFDConnection;
  IdPedido: Integer
): Boolean;
begin
  // Recusar = Cancelar (status 6)
  Result := AlterarStatusPedido(Connection, IdPedido, 6);
end;

class procedure TPedidoCardHelperDono.ExibirMensagemSemPedidos(ScrollBox: TScrollBox);
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
    'Não há pedidos para exibir' + #13#10 +
    'com o filtro selecionado.';
  lblMensagem.Font.Name := 'Segoe UI';
  lblMensagem.Font.Size := 11;
  lblMensagem.Font.Color := $00808080;
  lblMensagem.Alignment := taCenter;
  lblMensagem.Layout := tlCenter;
  lblMensagem.WordWrap := True;
  lblMensagem.Align := alClient;
end;

end.
