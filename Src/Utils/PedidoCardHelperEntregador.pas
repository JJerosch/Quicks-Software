unit PedidoCardHelperEntregador;

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
  TFiltroSelecionadoEntregadorEvent = procedure(IdFiltro: Integer; const NomeFiltro: String) of object;
  TPedidoAceitarEntregaEvent = procedure(IdPedido: Integer) of object;
  TPedidoACaminhoEvent = procedure(IdPedido: Integer) of object;
  TPedidoEntregueEvent = procedure(IdPedido: Integer) of object;
  TPedidoVerDetalhesEntregadorEvent = procedure(IdPedido: Integer) of object;

  // ========== RECORD PARA DADOS DO PEDIDO ==========
  TDadosPedidoEntregador = record
    IdPedido: Integer;
    IdStatusPedido: Integer;
    IdEntregador: Integer;  // Se já foi aceito por alguém
    NomeStatus: String;
    CorStatus: TColor;
    NomeCliente: String;
    TelefoneCliente: String;
    EnderecoEntrega: String;
    NomeComercio: String;
    EnderecoComercio: String;
    TelefoneComercio: String;
    DataPedido: TDateTime;
    ValorTotal: Currency;
    TaxaEntrega: Currency;
    QtdItens: Integer;
    JaAceitoPorMim: Boolean;  // Se este entregador já aceitou
  end;

  // ========== CHIP DE FILTRO PARA ENTREGADOR ==========
  TFiltroPedidoChipEntregador = class(TPanel)
  private
    FIdFiltro: Integer;
    FNomeFiltro: String;
    FSelecionado: Boolean;
    FOnFiltroSelecionado: TFiltroSelecionadoEntregadorEvent;
    procedure SetSelecionado(const Value: Boolean);
    procedure ChipClick(Sender: TObject);
  public
    constructor CreateChip(AOwner: TComponent; IdFiltro: Integer; const NomeFiltro: String);
    procedure ConfigurarVisual;
    property IdFiltro: Integer read FIdFiltro;
    property NomeFiltro: String read FNomeFiltro;
    property Selecionado: Boolean read FSelecionado write SetSelecionado;
    property OnFiltroSelecionado: TFiltroSelecionadoEntregadorEvent read FOnFiltroSelecionado write FOnFiltroSelecionado;
  end;

  // ========== CARD DO PEDIDO PARA ENTREGADOR ==========
  TPedidoCardEntregador = class(TPanel)
  private
    FIdPedido: Integer;
    FDados: TDadosPedidoEntregador;
    FOnAceitarEntrega: TPedidoAceitarEntregaEvent;
    FOnACaminho: TPedidoACaminhoEvent;
    FOnEntregue: TPedidoEntregueEvent;
    FOnVerDetalhes: TPedidoVerDetalhesEntregadorEvent;

    // Componentes visuais
    pHeader: TPanel;
    pStatus: TPanel;
    pBotoes: TPanel;
    lblNumeroPedido: TLabel;
    lblNomeComercio: TLabel;
    lblEnderecoComercio: TLabel;
    lblTelefoneComercio: TLabel;
    lblNomeCliente: TLabel;
    lblTelefoneCliente: TLabel;
    lblEnderecoEntrega: TLabel;
    lblDataPedido: TLabel;
    lblValorTotal: TLabel;
    lblTaxaEntrega: TLabel;
    btnAceitarEntrega: TButton;
    btnACaminho: TButton;
    btnEntregue: TButton;
    btnVerDetalhes: TButton;

    procedure BtnAceitarEntregaClick(Sender: TObject);
    procedure BtnACaminhoClick(Sender: TObject);
    procedure BtnEntregueClick(Sender: TObject);
    procedure BtnVerDetalhesClick(Sender: TObject);

    function ObterCorStatus(IdStatus: Integer): TColor;
    function ObterNomeStatus(IdStatus: Integer): String;
    procedure AtualizarBotoesVisiveis;
  public
    constructor CreateCard(AOwner: TComponent; const Dados: TDadosPedidoEntregador);
    procedure ConfigurarVisual;
    procedure AtualizarStatus(NovoIdStatus: Integer);
    procedure MarcarComoAceito;

    property IdPedido: Integer read FIdPedido;
    property OnAceitarEntrega: TPedidoAceitarEntregaEvent read FOnAceitarEntrega write FOnAceitarEntrega;
    property OnACaminho: TPedidoACaminhoEvent read FOnACaminho write FOnACaminho;
    property OnEntregue: TPedidoEntregueEvent read FOnEntregue write FOnEntregue;
    property OnVerDetalhes: TPedidoVerDetalhesEntregadorEvent read FOnVerDetalhes write FOnVerDetalhes;
  end;

  // ========== HELPER PRINCIPAL ==========
  TPedidoCardHelperEntregador = class
  public
    // Verificações
    class function EntregadorEmExpediente(
      Connection: TFDConnection;
      IdEntregador: Integer
    ): Boolean;

    class function ObterIdEntregador(
      Connection: TFDConnection;
      IdUsuario: Integer
    ): Integer;

    // Filtros
    class procedure PopularFiltros(
      ScrollBox: TScrollBox;
      OnFiltroClick: TFiltroSelecionadoEntregadorEvent
    );
    class procedure DeselecionarTodosFiltros(ScrollBox: TScrollBox);
    class procedure SelecionarFiltro(ScrollBox: TScrollBox; IdFiltro: Integer);

    // Pedidos
    class function BuscarPedidosEntregador(
      Connection: TFDConnection;
      IdEntregador: Integer;
      IdFiltroStatus: Integer = -1
    ): TList<TDadosPedidoEntregador>;

    class procedure PopularPedidos(
      ScrollBox: TScrollBox;
      Connection: TFDConnection;
      IdEntregador: Integer;
      IdFiltroStatus: Integer;
      OnAceitarEntrega: TPedidoAceitarEntregaEvent;
      OnACaminho: TPedidoACaminhoEvent;
      OnEntregue: TPedidoEntregueEvent;
      OnVerDetalhes: TPedidoVerDetalhesEntregadorEvent
    );

    class procedure LimparCards(ScrollBox: TScrollBox);

    // Ações
    class function AceitarEntrega(
      Connection: TFDConnection;
      IdPedido: Integer;
      IdEntregador: Integer
    ): Boolean;

    class function MarcarACaminho(
      Connection: TFDConnection;
      IdPedido: Integer
    ): Boolean;

    class function MarcarEntregue(
      Connection: TFDConnection;
      IdPedido: Integer
    ): Boolean;

    class procedure ExibirMensagemSemPedidos(ScrollBox: TScrollBox);
  end;

implementation

{ TFiltroPedidoChipEntregador }

constructor TFiltroPedidoChipEntregador.CreateChip(AOwner: TComponent; IdFiltro: Integer; const NomeFiltro: String);
begin
  inherited Create(AOwner);

  FIdFiltro := IdFiltro;
  FNomeFiltro := NomeFiltro;
  FSelecionado := False;

  Self.Height := 40;
  Self.Width := 120;
end;

procedure TFiltroPedidoChipEntregador.ConfigurarVisual;
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
  lblTexto.Font.Color := $005185FF; // Verde (tema do entregador)
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

procedure TFiltroPedidoChipEntregador.ChipClick(Sender: TObject);
begin
  if Assigned(FOnFiltroSelecionado) then
    FOnFiltroSelecionado(FIdFiltro, FNomeFiltro);
end;

procedure TFiltroPedidoChipEntregador.SetSelecionado(const Value: Boolean);
var
  lbl: TLabel;
  i: Integer;
begin
  FSelecionado := Value;

  if FSelecionado then
  begin
    Self.Color := $005185FF; // Verde
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
        lbl.Font.Color := $005185FF;
      end;
    end;
  end;
end;

{ TPedidoCardEntregador }

constructor TPedidoCardEntregador.CreateCard(AOwner: TComponent; const Dados: TDadosPedidoEntregador);
begin
  inherited Create(AOwner);

  FIdPedido := Dados.IdPedido;
  FDados := Dados;

  Self.Height := 280;
  Self.Width := 100;
end;

procedure TPedidoCardEntregador.ConfigurarVisual;
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
  lblNumeroPedido.Caption := '🛵 ENTREGA #' + IntToStr(FDados.IdPedido);
  lblNumeroPedido.Font.Name := 'Segoe UI';
  lblNumeroPedido.Font.Size := 13;
  lblNumeroPedido.Font.Style := [fsBold];
  lblNumeroPedido.Font.Color := $005185FF; // Verde
  lblNumeroPedido.Transparent := True;

  // ========== SEÇÃO: RETIRADA (COMÉRCIO) ==========

  // Nome do Comércio
  lblNomeComercio := TLabel.Create(Self);
  lblNomeComercio.Parent := Self;
  lblNomeComercio.Left := 15;
  lblNomeComercio.Top := 50;
  lblNomeComercio.Caption := '🏪 RETIRAR EM: ' + FDados.NomeComercio;
  lblNomeComercio.Font.Name := 'Segoe UI';
  lblNomeComercio.Font.Size := 10;
  lblNomeComercio.Font.Style := [fsBold];
  lblNomeComercio.Font.Color := $00333333;
  lblNomeComercio.Transparent := True;

  // Endereço do Comércio
  lblEnderecoComercio := TLabel.Create(Self);
  lblEnderecoComercio.Parent := Self;
  lblEnderecoComercio.Left := 15;
  lblEnderecoComercio.Top := 70;
  lblEnderecoComercio.Caption := '📍 ' + FDados.EnderecoComercio;
  lblEnderecoComercio.Font.Name := 'Segoe UI';
  lblEnderecoComercio.Font.Size := 9;
  lblEnderecoComercio.Font.Color := $00666666;
  lblEnderecoComercio.Transparent := True;

  // Telefone do Comércio
  lblTelefoneComercio := TLabel.Create(Self);
  lblTelefoneComercio.Parent := Self;
  lblTelefoneComercio.Left := 15;
  lblTelefoneComercio.Top := 88;
  lblTelefoneComercio.Caption := '📞 Comércio: ' + FDados.TelefoneComercio;
  lblTelefoneComercio.Font.Name := 'Segoe UI';
  lblTelefoneComercio.Font.Size := 9;
  lblTelefoneComercio.Font.Color := $00888888;
  lblTelefoneComercio.Transparent := True;

  // ========== SEÇÃO: ENTREGA (CLIENTE) ==========

  // Nome do Cliente
  lblNomeCliente := TLabel.Create(Self);
  lblNomeCliente.Parent := Self;
  lblNomeCliente.Left := 15;
  lblNomeCliente.Top := 115;
  lblNomeCliente.Caption := '👤 ENTREGAR PARA: ' + FDados.NomeCliente;
  lblNomeCliente.Font.Name := 'Segoe UI';
  lblNomeCliente.Font.Size := 10;
  lblNomeCliente.Font.Style := [fsBold];
  lblNomeCliente.Font.Color := $00333333;
  lblNomeCliente.Transparent := True;

  // Endereço de Entrega
  lblEnderecoEntrega := TLabel.Create(Self);
  lblEnderecoEntrega.Parent := Self;
  lblEnderecoEntrega.Left := 15;
  lblEnderecoEntrega.Top := 135;
  lblEnderecoEntrega.Caption := '📍 ' + FDados.EnderecoEntrega;
  lblEnderecoEntrega.Font.Name := 'Segoe UI';
  lblEnderecoEntrega.Font.Size := 9;
  lblEnderecoEntrega.Font.Color := $00666666;
  lblEnderecoEntrega.Transparent := True;
  lblEnderecoEntrega.AutoSize := False;
  lblEnderecoEntrega.Width := Self.Width - 30;
  lblEnderecoEntrega.WordWrap := True;

  // Telefone do Cliente
  lblTelefoneCliente := TLabel.Create(Self);
  lblTelefoneCliente.Parent := Self;
  lblTelefoneCliente.Left := 15;
  lblTelefoneCliente.Top := 158;
  lblTelefoneCliente.Caption := '📞 Cliente: ' + FDados.TelefoneCliente;
  lblTelefoneCliente.Font.Name := 'Segoe UI';
  lblTelefoneCliente.Font.Size := 9;
  lblTelefoneCliente.Font.Color := $00888888;
  lblTelefoneCliente.Transparent := True;

  // ========== SEÇÃO: VALORES ==========

  // Data do Pedido
  lblDataPedido := TLabel.Create(Self);
  lblDataPedido.Parent := Self;
  lblDataPedido.Left := 15;
  lblDataPedido.Top := 185;
  lblDataPedido.Caption := '📅 ' + FormatDateTime('dd/mm/yyyy hh:nn', FDados.DataPedido);
  lblDataPedido.Font.Name := 'Segoe UI';
  lblDataPedido.Font.Size := 9;
  lblDataPedido.Font.Color := $00888888;
  lblDataPedido.Transparent := True;

  // Taxa de Entrega (destaque para o entregador)
  lblTaxaEntrega := TLabel.Create(Self);
  lblTaxaEntrega.Parent := Self;
  lblTaxaEntrega.Left := 15;
  lblTaxaEntrega.Top := 205;
  lblTaxaEntrega.Caption := '💰 TAXA DE ENTREGA: R$ ' + FormatFloat('#,##0.00', FDados.TaxaEntrega);
  lblTaxaEntrega.Font.Name := 'Segoe UI';
  lblTaxaEntrega.Font.Size := 11;
  lblTaxaEntrega.Font.Style := [fsBold];
  lblTaxaEntrega.Font.Color := $005185FF; // Verde
  lblTaxaEntrega.Transparent := True;

  // Valor Total do Pedido
  lblValorTotal := TLabel.Create(Self);
  lblValorTotal.Parent := Self;
  lblValorTotal.Left := 300;
  lblValorTotal.Top := 205;
  lblValorTotal.Caption := 'Total pedido: R$ ' + FormatFloat('#,##0.00', FDados.ValorTotal);
  lblValorTotal.Font.Name := 'Segoe UI';
  lblValorTotal.Font.Size := 9;
  lblValorTotal.Font.Color := $00888888;
  lblValorTotal.Transparent := True;

  // ========== PAINEL DE BOTÕES ==========
  pBotoes := TPanel.Create(Self);
  pBotoes.Parent := Self;
  pBotoes.Left := 15;
  pBotoes.Top := 235;
  pBotoes.Width := Self.Width - 30;
  pBotoes.Height := 40;
  pBotoes.Anchors := [akLeft, akTop, akRight];
  pBotoes.BevelOuter := bvNone;
  pBotoes.Color := Self.Color;
  pBotoes.ParentBackground := False;

  // Botão Aceitar Entrega
  btnAceitarEntrega := TButton.Create(pBotoes);
  btnAceitarEntrega.Parent := pBotoes;
  btnAceitarEntrega.Caption := '✅ Aceitar Entrega';
  btnAceitarEntrega.Left := 0;
  btnAceitarEntrega.Top := 5;
  btnAceitarEntrega.Width := 130;
  btnAceitarEntrega.Height := 30;
  btnAceitarEntrega.Font.Name := 'Segoe UI';
  btnAceitarEntrega.Font.Size := 9;
  btnAceitarEntrega.Font.Style := [fsBold];
  btnAceitarEntrega.Cursor := crHandPoint;
  btnAceitarEntrega.OnClick := BtnAceitarEntregaClick;

  // Botão A Caminho
  btnACaminho := TButton.Create(pBotoes);
  btnACaminho.Parent := pBotoes;
  btnACaminho.Caption := '🚗 A Caminho';
  btnACaminho.Left := 140;
  btnACaminho.Top := 5;
  btnACaminho.Width := 110;
  btnACaminho.Height := 30;
  btnACaminho.Font.Name := 'Segoe UI';
  btnACaminho.Font.Size := 9;
  btnACaminho.Font.Style := [fsBold];
  btnACaminho.Cursor := crHandPoint;
  btnACaminho.OnClick := BtnACaminhoClick;

  // Botão Entregue
  btnEntregue := TButton.Create(pBotoes);
  btnEntregue.Parent := pBotoes;
  btnEntregue.Caption := '🏁 Entregue';
  btnEntregue.Left := 260;
  btnEntregue.Top := 5;
  btnEntregue.Width := 100;
  btnEntregue.Height := 30;
  btnEntregue.Font.Name := 'Segoe UI';
  btnEntregue.Font.Size := 9;
  btnEntregue.Font.Style := [fsBold];
  btnEntregue.Cursor := crHandPoint;
  btnEntregue.OnClick := BtnEntregueClick;

  // Botão Ver Detalhes
  btnVerDetalhes := TButton.Create(pBotoes);
  btnVerDetalhes.Parent := pBotoes;
  btnVerDetalhes.Caption := '👁️ Detalhes';
  btnVerDetalhes.Left := pBotoes.Width - 100;
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

procedure TPedidoCardEntregador.AtualizarBotoesVisiveis;
begin
  // Esconder todos primeiro
  btnAceitarEntrega.Visible := False;
  btnACaminho.Visible := False;
  btnEntregue.Visible := False;

  case FDados.IdStatusPedido of
    3: // Pronto p/ Entrega
    begin
      if FDados.JaAceitoPorMim then
      begin
        // Já aceitou - pode marcar A Caminho
        btnACaminho.Visible := True;
      end
      else if FDados.IdEntregador = 0 then
      begin
        // Ninguém aceitou ainda - pode aceitar
        btnAceitarEntrega.Visible := True;
      end;
      // Se outro entregador aceitou, não mostra nenhum botão
    end;

    4: // A Caminho
    begin
      if FDados.JaAceitoPorMim then
      begin
        // É minha entrega - pode marcar como Entregue
        btnEntregue.Visible := True;
      end;
    end;

    // 5 (Entregue) - Nenhum botão de ação
  end;
end;

procedure TPedidoCardEntregador.BtnAceitarEntregaClick(Sender: TObject);
begin
  if MessageDlg(
    'Aceitar entrega #' + IntToStr(FIdPedido) + '?' + #13#10#13#10 +
    '📍 Retirar em: ' + FDados.NomeComercio + #13#10 +
    '📍 Entregar em: ' + FDados.EnderecoEntrega + #13#10#13#10 +
    '💰 Taxa: R$ ' + FormatFloat('#,##0.00', FDados.TaxaEntrega),
    mtConfirmation,
    [mbYes, mbNo],
    0) = mrYes then
  begin
    if Assigned(FOnAceitarEntrega) then
      FOnAceitarEntrega(FIdPedido);
  end;
end;

procedure TPedidoCardEntregador.BtnACaminhoClick(Sender: TObject);
begin
  if MessageDlg(
    'Confirmar que está A CAMINHO da entrega #' + IntToStr(FIdPedido) + '?',
    mtConfirmation,
    [mbYes, mbNo],
    0) = mrYes then
  begin
    if Assigned(FOnACaminho) then
      FOnACaminho(FIdPedido);
  end;
end;

procedure TPedidoCardEntregador.BtnEntregueClick(Sender: TObject);
begin
  if MessageDlg(
    'Confirmar que a entrega #' + IntToStr(FIdPedido) + ' foi CONCLUÍDA?' + #13#10#13#10 +
    'Cliente: ' + FDados.NomeCliente,
    mtConfirmation,
    [mbYes, mbNo],
    0) = mrYes then
  begin
    if Assigned(FOnEntregue) then
      FOnEntregue(FIdPedido);
  end;
end;

procedure TPedidoCardEntregador.BtnVerDetalhesClick(Sender: TObject);
begin
  if Assigned(FOnVerDetalhes) then
    FOnVerDetalhes(FIdPedido);
end;

procedure TPedidoCardEntregador.AtualizarStatus(NovoIdStatus: Integer);
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

procedure TPedidoCardEntregador.MarcarComoAceito;
begin
  FDados.JaAceitoPorMim := True;
  AtualizarBotoesVisiveis;
end;

function TPedidoCardEntregador.ObterCorStatus(IdStatus: Integer): TColor;
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

function TPedidoCardEntregador.ObterNomeStatus(IdStatus: Integer): String;
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

{ TPedidoCardHelperEntregador }

class function TPedidoCardHelperEntregador.EntregadorEmExpediente(
  Connection: TFDConnection;
  IdEntregador: Integer
): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;

  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := Connection;
    Qr.SQL.Text := 'SELECT em_expediente FROM entregadores WHERE id_entregador = :id_entregador';
    Qr.ParamByName('id_entregador').AsInteger := IdEntregador;
    Qr.Open;

    if not Qr.IsEmpty then
      Result := Qr.FieldByName('em_expediente').AsBoolean;
  finally
    Qr.Free;
  end;
end;

class function TPedidoCardHelperEntregador.ObterIdEntregador(
  Connection: TFDConnection;
  IdUsuario: Integer
): Integer;
var
  Qr: TFDQuery;
begin
  Result := 0;

  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := Connection;
    Qr.SQL.Text := 'SELECT id_entregador FROM entregadores WHERE id_user = :id_user';
    Qr.ParamByName('id_user').AsInteger := IdUsuario;
    Qr.Open;

    if not Qr.IsEmpty then
      Result := Qr.FieldByName('id_entregador').AsInteger;
  finally
    Qr.Free;
  end;
end;

class procedure TPedidoCardHelperEntregador.PopularFiltros(
  ScrollBox: TScrollBox;
  OnFiltroClick: TFiltroSelecionadoEntregadorEvent
);
var
  Chip: TFiltroPedidoChipEntregador;
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

  // Chip "Todos" (disponíveis + minhas entregas)
  Chip := TFiltroPedidoChipEntregador.CreateChip(FormOwner, -1, 'Todos');
  Chip.Parent := ScrollBox;
  Chip.ConfigurarVisual;
  Chip.Left := PosX;
  Chip.Top := 5;
  Chip.OnFiltroSelecionado := OnFiltroClick;
  Chip.Selecionado := True;
  Inc(PosX, Chip.Width + 10);

  // Chip "Disponíveis" (Pronto p/ Entrega sem entregador)
  Chip := TFiltroPedidoChipEntregador.CreateChip(FormOwner, 3, 'Disponíveis');
  Chip.Parent := ScrollBox;
  Chip.ConfigurarVisual;
  Chip.Left := PosX;
  Chip.Top := 5;
  Chip.OnFiltroSelecionado := OnFiltroClick;
  Inc(PosX, Chip.Width + 10);

  // Chip "Minhas Entregas" (onde eu sou o entregador)
  Chip := TFiltroPedidoChipEntregador.CreateChip(FormOwner, -2, 'Minhas Entregas');
  Chip.Parent := ScrollBox;
  Chip.ConfigurarVisual;
  Chip.Left := PosX;
  Chip.Top := 5;
  Chip.OnFiltroSelecionado := OnFiltroClick;
  Inc(PosX, Chip.Width + 10);

  // Chip "A Caminho"
  Chip := TFiltroPedidoChipEntregador.CreateChip(FormOwner, 4, 'A Caminho');
  Chip.Parent := ScrollBox;
  Chip.ConfigurarVisual;
  Chip.Left := PosX;
  Chip.Top := 5;
  Chip.OnFiltroSelecionado := OnFiltroClick;
  Inc(PosX, Chip.Width + 10);

  // Chip "Entregues"
  Chip := TFiltroPedidoChipEntregador.CreateChip(FormOwner, 5, 'Entregues');
  Chip.Parent := ScrollBox;
  Chip.ConfigurarVisual;
  Chip.Left := PosX;
  Chip.Top := 5;
  Chip.OnFiltroSelecionado := OnFiltroClick;
end;

class procedure TPedidoCardHelperEntregador.DeselecionarTodosFiltros(ScrollBox: TScrollBox);
var
  i: Integer;
begin
  for i := 0 to ScrollBox.ControlCount - 1 do
  begin
    if ScrollBox.Controls[i] is TFiltroPedidoChipEntregador then
      TFiltroPedidoChipEntregador(ScrollBox.Controls[i]).Selecionado := False;
  end;
end;

class procedure TPedidoCardHelperEntregador.SelecionarFiltro(ScrollBox: TScrollBox; IdFiltro: Integer);
var
  i: Integer;
  Chip: TFiltroPedidoChipEntregador;
begin
  for i := 0 to ScrollBox.ControlCount - 1 do
  begin
    if ScrollBox.Controls[i] is TFiltroPedidoChipEntregador then
    begin
      Chip := TFiltroPedidoChipEntregador(ScrollBox.Controls[i]);
      Chip.Selecionado := (Chip.IdFiltro = IdFiltro);
    end;
  end;
end;

class function TPedidoCardHelperEntregador.BuscarPedidosEntregador(
  Connection: TFDConnection;
  IdEntregador: Integer;
  IdFiltroStatus: Integer
): TList<TDadosPedidoEntregador>;
var
  Qr: TFDQuery;
  Dados: TDadosPedidoEntregador;
begin
  Result := TList<TDadosPedidoEntregador>.Create;

  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := Connection;
    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT ');
    Qr.SQL.Add('  p.id_pedido, p.id_status_pedido, p.valor_total_pedido,');
    Qr.SQL.Add('  p.data_pedido, p.taxa_entrega, p.endereco_entrega,');
    Qr.SQL.Add('  p.id_entregador,');
    Qr.SQL.Add('  u.nome_user AS nome_cliente, u.nphone_user AS telefone_cliente,');
    Qr.SQL.Add('  c.nome_comercio, c.endereco_completo AS endereco_comercio,');
    Qr.SQL.Add('  c.nphone_comercio AS telefone_comercio,');
    Qr.SQL.Add('  fp.nome_estado AS nome_status,');
    Qr.SQL.Add('  (SELECT COUNT(*) FROM itens_pedido ip WHERE ip.id_pedido = p.id_pedido) AS qtd_itens');
    Qr.SQL.Add('FROM pedidos p');
    Qr.SQL.Add('INNER JOIN clientes cl ON p.id_clie = cl.id_clie');
    Qr.SQL.Add('INNER JOIN usuarios u ON cl.id_user = u.id_user');
    Qr.SQL.Add('INNER JOIN comercios c ON p.id_comercio = c.id_comercio');
    Qr.SQL.Add('LEFT JOIN filtros_pedidos fp ON p.id_status_pedido = fp.id_estado');
    Qr.SQL.Add('WHERE (');
    Qr.SQL.Add('  (p.id_status_pedido = 3 AND p.id_entregador IS NULL)'); // Disponíveis
    Qr.SQL.Add('  OR (p.id_entregador = :id_entregador)'); // Minhas entregas
    Qr.SQL.Add(')');

    // Filtros específicos
    if IdFiltroStatus = 3 then
    begin
      // Apenas disponíveis (sem entregador)
      Qr.SQL.Clear;
      Qr.SQL.Add('SELECT ');
      Qr.SQL.Add('  p.id_pedido, p.id_status_pedido, p.valor_total_pedido,');
      Qr.SQL.Add('  p.data_pedido, p.taxa_entrega, p.endereco_entrega,');
      Qr.SQL.Add('  p.id_entregador,');
      Qr.SQL.Add('  u.nome_user AS nome_cliente, u.nphone_user AS telefone_cliente,');
      Qr.SQL.Add('  c.nome_comercio, c.endereco_completo AS endereco_comercio,');
      Qr.SQL.Add('  c.nphone_comercio AS telefone_comercio,');
      Qr.SQL.Add('  fp.nome_estado AS nome_status,');
      Qr.SQL.Add('  (SELECT COUNT(*) FROM itens_pedido ip WHERE ip.id_pedido = p.id_pedido) AS qtd_itens');
      Qr.SQL.Add('FROM pedidos p');
      Qr.SQL.Add('INNER JOIN clientes cl ON p.id_clie = cl.id_clie');
      Qr.SQL.Add('INNER JOIN usuarios u ON cl.id_user = u.id_user');
      Qr.SQL.Add('INNER JOIN comercios c ON p.id_comercio = c.id_comercio');
      Qr.SQL.Add('LEFT JOIN filtros_pedidos fp ON p.id_status_pedido = fp.id_estado');
      Qr.SQL.Add('WHERE p.id_status_pedido = 3 AND p.id_entregador IS NULL');
    end
    else if IdFiltroStatus = -2 then
    begin
      // Apenas minhas entregas (qualquer status)
      Qr.SQL.Clear;
      Qr.SQL.Add('SELECT ');
      Qr.SQL.Add('  p.id_pedido, p.id_status_pedido, p.valor_total_pedido,');
      Qr.SQL.Add('  p.data_pedido, p.taxa_entrega, p.endereco_entrega,');
      Qr.SQL.Add('  p.id_entregador,');
      Qr.SQL.Add('  u.nome_user AS nome_cliente, u.nphone_user AS telefone_cliente,');
      Qr.SQL.Add('  c.nome_comercio, c.endereco_completo AS endereco_comercio,');
      Qr.SQL.Add('  c.nphone_comercio AS telefone_comercio,');
      Qr.SQL.Add('  fp.nome_estado AS nome_status,');
      Qr.SQL.Add('  (SELECT COUNT(*) FROM itens_pedido ip WHERE ip.id_pedido = p.id_pedido) AS qtd_itens');
      Qr.SQL.Add('FROM pedidos p');
      Qr.SQL.Add('INNER JOIN clientes cl ON p.id_clie = cl.id_clie');
      Qr.SQL.Add('INNER JOIN usuarios u ON cl.id_user = u.id_user');
      Qr.SQL.Add('INNER JOIN comercios c ON p.id_comercio = c.id_comercio');
      Qr.SQL.Add('LEFT JOIN filtros_pedidos fp ON p.id_status_pedido = fp.id_estado');
      Qr.SQL.Add('WHERE p.id_entregador = :id_entregador');
    end
    else if IdFiltroStatus in [4, 5] then
    begin
      // A Caminho ou Entregues (apenas minhas)
      Qr.SQL.Clear;
      Qr.SQL.Add('SELECT ');
      Qr.SQL.Add('  p.id_pedido, p.id_status_pedido, p.valor_total_pedido,');
      Qr.SQL.Add('  p.data_pedido, p.taxa_entrega, p.endereco_entrega,');
      Qr.SQL.Add('  p.id_entregador,');
      Qr.SQL.Add('  u.nome_user AS nome_cliente, u.nphone_user AS telefone_cliente,');
      Qr.SQL.Add('  c.nome_comercio, c.endereco_completo AS endereco_comercio,');
      Qr.SQL.Add('  c.nphone_comercio AS telefone_comercio,');
      Qr.SQL.Add('  fp.nome_estado AS nome_status,');
      Qr.SQL.Add('  (SELECT COUNT(*) FROM itens_pedido ip WHERE ip.id_pedido = p.id_pedido) AS qtd_itens');
      Qr.SQL.Add('FROM pedidos p');
      Qr.SQL.Add('INNER JOIN clientes cl ON p.id_clie = cl.id_clie');
      Qr.SQL.Add('INNER JOIN usuarios u ON cl.id_user = u.id_user');
      Qr.SQL.Add('INNER JOIN comercios c ON p.id_comercio = c.id_comercio');
      Qr.SQL.Add('LEFT JOIN filtros_pedidos fp ON p.id_status_pedido = fp.id_estado');
      Qr.SQL.Add('WHERE p.id_entregador = :id_entregador');
      Qr.SQL.Add('AND p.id_status_pedido = :id_status');
      Qr.ParamByName('id_status').AsInteger := IdFiltroStatus;
    end;

    Qr.SQL.Add('ORDER BY p.data_pedido DESC');

    // Só define parâmetros que existem na query
    if Qr.Params.FindParam('id_entregador') <> nil then
      Qr.ParamByName('id_entregador').AsInteger := IdEntregador;

    Qr.Open;

    while not Qr.Eof do
    begin
      Dados.IdPedido := Qr.FieldByName('id_pedido').AsInteger;
      Dados.IdStatusPedido := Qr.FieldByName('id_status_pedido').AsInteger;
      Dados.IdEntregador := Qr.FieldByName('id_entregador').AsInteger;
      Dados.NomeStatus := Qr.FieldByName('nome_status').AsString;
      Dados.NomeCliente := Qr.FieldByName('nome_cliente').AsString;
      Dados.TelefoneCliente := Qr.FieldByName('telefone_cliente').AsString;
      Dados.EnderecoEntrega := Qr.FieldByName('endereco_entrega').AsString;
      Dados.NomeComercio := Qr.FieldByName('nome_comercio').AsString;
      Dados.EnderecoComercio := Qr.FieldByName('endereco_comercio').AsString;
      Dados.TelefoneComercio := Qr.FieldByName('telefone_comercio').AsString;
      Dados.DataPedido := Qr.FieldByName('data_pedido').AsDateTime;
      Dados.ValorTotal := Qr.FieldByName('valor_total_pedido').AsCurrency;
      Dados.TaxaEntrega := Qr.FieldByName('taxa_entrega').AsCurrency;
      Dados.QtdItens := Qr.FieldByName('qtd_itens').AsInteger;
      Dados.JaAceitoPorMim := (Dados.IdEntregador = IdEntregador);

      Result.Add(Dados);
      Qr.Next;
    end;

  finally
    Qr.Free;
  end;
end;

class procedure TPedidoCardHelperEntregador.PopularPedidos(
  ScrollBox: TScrollBox;
  Connection: TFDConnection;
  IdEntregador: Integer;
  IdFiltroStatus: Integer;
  OnAceitarEntrega: TPedidoAceitarEntregaEvent;
  OnACaminho: TPedidoACaminhoEvent;
  OnEntregue: TPedidoEntregueEvent;
  OnVerDetalhes: TPedidoVerDetalhesEntregadorEvent
);
var
  Pedidos: TList<TDadosPedidoEntregador>;
  Dados: TDadosPedidoEntregador;
  Card: TPedidoCardEntregador;
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
    if ScrollBox.Controls[Y] is TPedidoCardEntregador then
      ScrollBox.Controls[Y].Free
    else if (ScrollBox.Controls[Y] is TPanel) and
            not (ScrollBox.Controls[Y] is TFiltroPedidoChipEntregador) then
      ScrollBox.Controls[Y].Free;
  end;

  Pedidos := BuscarPedidosEntregador(Connection, IdEntregador, IdFiltroStatus);
  try
    if Pedidos.Count = 0 then
    begin
      ExibirMensagemSemPedidos(ScrollBox);
      Exit;
    end;

    CardHeight := 280;
    Spacing := 10;
    Y := Spacing;

    for Dados in Pedidos do
    begin
      Card := TPedidoCardEntregador.CreateCard(FormOwner, Dados);
      Card.Parent := ScrollBox;
      Card.Left := 10;
      Card.Top := Y;
      Card.Width := ScrollBox.ClientWidth - 25;
      Card.Anchors := [akLeft, akTop, akRight];
      Card.ConfigurarVisual;
      Card.OnAceitarEntrega := OnAceitarEntrega;
      Card.OnACaminho := OnACaminho;
      Card.OnEntregue := OnEntregue;
      Card.OnVerDetalhes := OnVerDetalhes;

      Inc(Y, CardHeight + Spacing);
    end;

  finally
    Pedidos.Free;
  end;
end;

class procedure TPedidoCardHelperEntregador.LimparCards(ScrollBox: TScrollBox);
var
  I: Integer;
begin
  for I := ScrollBox.ControlCount - 1 downto 0 do
  begin
    if (ScrollBox.Controls[I] is TPedidoCardEntregador) or
       (ScrollBox.Controls[I] is TFiltroPedidoChipEntregador) or
       (ScrollBox.Controls[I] is TPanel) then
      ScrollBox.Controls[I].Free;
  end;

  if Assigned(ScrollBox) then
    ScrollBox.VertScrollBar.Position := 0;
end;

class function TPedidoCardHelperEntregador.AceitarEntrega(
  Connection: TFDConnection;
  IdPedido: Integer;
  IdEntregador: Integer
): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;

  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := Connection;
    Qr.SQL.Text :=
      'UPDATE pedidos SET id_entregador = :id_entregador ' +
      'WHERE id_pedido = :id_pedido AND id_entregador IS NULL';
    Qr.ParamByName('id_entregador').AsInteger := IdEntregador;
    Qr.ParamByName('id_pedido').AsInteger := IdPedido;
    Qr.ExecSQL;

    Result := Qr.RowsAffected > 0;
  finally
    Qr.Free;
  end;
end;

class function TPedidoCardHelperEntregador.MarcarACaminho(
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
      'UPDATE pedidos SET id_status_pedido = 4 WHERE id_pedido = :id_pedido';
    Qr.ParamByName('id_pedido').AsInteger := IdPedido;
    Qr.ExecSQL;

    Result := Qr.RowsAffected > 0;
  finally
    Qr.Free;
  end;
end;

class function TPedidoCardHelperEntregador.MarcarEntregue(
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
      'UPDATE pedidos SET id_status_pedido = 5, recebeu_entrega = TRUE ' +
      'WHERE id_pedido = :id_pedido';
    Qr.ParamByName('id_pedido').AsInteger := IdPedido;
    Qr.ExecSQL;

    Result := Qr.RowsAffected > 0;
  finally
    Qr.Free;
  end;
end;

class procedure TPedidoCardHelperEntregador.ExibirMensagemSemPedidos(ScrollBox: TScrollBox);
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
    '🛵 Nenhuma entrega encontrada' + #13#10#13#10 +
    'Não há entregas disponíveis' + #13#10 +
    'no momento.';
  lblMensagem.Font.Name := 'Segoe UI';
  lblMensagem.Font.Size := 11;
  lblMensagem.Font.Color := $00808080;
  lblMensagem.Alignment := taCenter;
  lblMensagem.Layout := tlCenter;
  lblMensagem.WordWrap := True;
  lblMensagem.Align := alClient;
end;

end.
