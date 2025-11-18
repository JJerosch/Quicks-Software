unit PagamentoCardPanel;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls,
  FormaPagamentoClienteModel;

type
  TPagamentoCardPanel = class(TPanel)
  private
    FIdPagamento: Integer;
    FTipoPagamento: String;
    FApelido: String;
    FDescricao: String;
    FPrincipal: Boolean;

    pBadgePrincipal: TPanel;
    pBotoes: TPanel; // ⭐ NOVO - Painel para organizar botões
    btnEditar: TButton;
    btnExcluir: TButton;
    btnDefinirPrincipal: TButton;
    lblApelido: TLabel;
    lblDescricao: TLabel;
    lblTipo: TLabel;

    FOnEditar: TNotifyEvent;
    FOnExcluir: TNotifyEvent;
    FOnDefinirPrincipal: TNotifyEvent;

    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnDefinirPrincipalClick(Sender: TObject);
    procedure AtualizarVisualPrincipal;

  public
    constructor CreateCard(AOwner: TComponent;
      IdPagamento: Integer;
      const TipoPagamento, Apelido, Descricao: String;
      Principal: Boolean);

    constructor CreateCardFromModel(AOwner: TComponent; Pagamento: TFormaPagamentoCliente);

    procedure SetPrincipal(Value: Boolean);

    property IdPagamento: Integer read FIdPagamento;
    property Principal: Boolean read FPrincipal write SetPrincipal;
    property OnEditar: TNotifyEvent read FOnEditar write FOnEditar;
    property OnExcluir: TNotifyEvent read FOnExcluir write FOnExcluir;
    property OnDefinirPrincipal: TNotifyEvent read FOnDefinirPrincipal write FOnDefinirPrincipal;
  end;

implementation

{ TPagamentoCardPanel }

constructor TPagamentoCardPanel.CreateCard(AOwner: TComponent;
  IdPagamento: Integer;
  const TipoPagamento, Apelido, Descricao: String;
  Principal: Boolean);
begin
  inherited Create(AOwner);

  FIdPagamento := IdPagamento;
  FTipoPagamento := TipoPagamento;
  FApelido := Apelido;
  FDescricao := Descricao;
  FPrincipal := Principal;

  Self.Height := 130; // ⭐ AUMENTADO para acomodar os botões
  Self.ParentBackground := False;
  Self.BevelOuter := bvNone;
  Self.Color := clWhite;
  Self.BorderStyle := bsSingle;

  // ========== ÍCONE DO TIPO DE PAGAMENTO ==========
  lblTipo := TLabel.Create(Self);
  lblTipo.Parent := Self;
  lblTipo.Left := 15;
  lblTipo.Top := 15;

  // Escolher ícone baseado no tipo
  if Pos('Cartão', TipoPagamento) > 0 then
    lblTipo.Caption := '💳'
  else if Pos('Pix', TipoPagamento) > 0 then
    lblTipo.Caption := '🔄'
  else if Pos('Transferência', TipoPagamento) > 0 then
    lblTipo.Caption := '🏦'
  else if Pos('Dinheiro', TipoPagamento) > 0 then
    lblTipo.Caption := '💵'
  else
    lblTipo.Caption := '💰';

  lblTipo.Font.Size := 16;
  lblTipo.Transparent := True;

  // ========== APELIDO ==========
  lblApelido := TLabel.Create(Self);
  lblApelido.Parent := Self;
  lblApelido.Left := 50;
  lblApelido.Top := 15;
  lblApelido.Caption := Apelido;
  lblApelido.Font.Name := 'Segoe UI';
  lblApelido.Font.Size := 11;
  lblApelido.Font.Style := [fsBold];
  lblApelido.Font.Color := clBlack;
  lblApelido.Transparent := True;

  // ========== DESCRIÇÃO ==========
  lblDescricao := TLabel.Create(Self);
  lblDescricao.Parent := Self;
  lblDescricao.Left := 50;
  lblDescricao.Top := 45;
  lblDescricao.Caption := Descricao;
  lblDescricao.Font.Name := 'Segoe UI';
  lblDescricao.Font.Size := 9;
  lblDescricao.Font.Color := $00666666;
  lblDescricao.Transparent := True;
  lblDescricao.AutoSize := False;
  lblDescricao.Width := Self.Width - 130;
  lblDescricao.WordWrap := True;

  // ========== PAINEL DE BOTÕES ========== ⭐ NOVO
  pBotoes := TPanel.Create(Self);
  pBotoes.Parent := Self;
  pBotoes.Left := 15;
  pBotoes.Top := 85;
  pBotoes.Width := Self.Width - 30;
  pBotoes.Height := 35;
  pBotoes.Anchors := [akLeft, akRight, akBottom];
  pBotoes.BevelOuter := bvNone;
  pBotoes.Color := Self.Color;
  pBotoes.ParentBackground := False;

  // ========== BOTÃO EDITAR ========== ⭐ DENTRO DO PAINEL
  btnEditar := TButton.Create(pBotoes);
  btnEditar.Parent := pBotoes;
  btnEditar.Width := 80;
  btnEditar.Height := 30;
  btnEditar.Top := 0;
  btnEditar.Left := 0;
  btnEditar.Caption := '✏️ Editar';
  btnEditar.OnClick := BtnEditarClick;
  btnEditar.Font.Size := 9;
  btnEditar.Font.Name := 'Segoe UI';

  // ========== BOTÃO EXCLUIR ========== ⭐ DENTRO DO PAINEL
  btnExcluir := TButton.Create(pBotoes);
  btnExcluir.Parent := pBotoes;
  btnExcluir.Width := 80;
  btnExcluir.Height := 30;
  btnExcluir.Top := 0;
  btnExcluir.Left := 90;
  btnExcluir.Caption := '🗑️ Excluir';
  btnExcluir.OnClick := BtnExcluirClick;
  btnExcluir.Font.Size := 9;
  btnExcluir.Font.Name := 'Segoe UI';

  // ========== BOTÃO DEFINIR PRINCIPAL ========== ⭐ CONDICIONAL
  if not Principal then
  begin
    btnDefinirPrincipal := TButton.Create(pBotoes);
    btnDefinirPrincipal.Parent := pBotoes;
    btnDefinirPrincipal.Width := 120;
    btnDefinirPrincipal.Height := 30;
    btnDefinirPrincipal.Top := 0;
    btnDefinirPrincipal.Left := pBotoes.Width - btnDefinirPrincipal.Width;
    btnDefinirPrincipal.Anchors := [akTop, akRight];
    btnDefinirPrincipal.Caption := '⭐ Definir Principal';
    btnDefinirPrincipal.OnClick := BtnDefinirPrincipalClick;
    btnDefinirPrincipal.Font.Size := 9;
    btnDefinirPrincipal.Font.Name := 'Segoe UI';
  end;

  // ========== BADGE PRINCIPAL ==========
  if Principal then
  begin
    pBadgePrincipal := TPanel.Create(Self);
    pBadgePrincipal.Parent := Self;
    pBadgePrincipal.Width := 90;
    pBadgePrincipal.Height := 25;
    pBadgePrincipal.Top := 10;
    pBadgePrincipal.Left := Self.Width - pBadgePrincipal.Width - 15;
    pBadgePrincipal.Anchors := [akTop, akRight];
    pBadgePrincipal.BevelOuter := bvNone;
    pBadgePrincipal.Color := $0000BB00; // Verde
    pBadgePrincipal.Font.Name := 'Segoe UI';
    pBadgePrincipal.Font.Size := 8;
    pBadgePrincipal.Font.Style := [fsBold];
    pBadgePrincipal.Font.Color := clWhite;
    pBadgePrincipal.Caption := 'PRINCIPAL';
  end;

  AtualizarVisualPrincipal;
end;

// ========== CONSTRUTOR A PARTIR DO MODEL ==========
constructor TPagamentoCardPanel.CreateCardFromModel(AOwner: TComponent; Pagamento: TFormaPagamentoCliente);
var
  TipoStr: String;
  Icone: String;
begin
  TipoStr := Pagamento.TipoPagamentoToString;

  // Determinar ícone baseado no tipo
  if Pagamento is TPagamentoCartao then
  begin
    if TPagamentoCartao(Pagamento).TipoCartao = 'Crédito' then
      Icone := '💳'
    else
      Icone := '💸';
  end
  else if Pagamento is TPagamentoPix then
    Icone := '🔄'
  else if Pagamento is TPagamentoTransferencia then
    Icone := '🏦'
  else
    Icone := '💵';

  // Chamar construtor padrão
  CreateCard(
    AOwner,
    Pagamento.IdPagamento,
    TipoStr,
    Pagamento.Apelido,
    Pagamento.DescricaoCompleta,
    Pagamento.Principal
  );

  // Substituir ícone padrão pelo específico
  if Assigned(lblTipo) then
    lblTipo.Caption := Icone;
end;

// ========== EVENTOS DOS BOTÕES ==========
procedure TPagamentoCardPanel.BtnEditarClick(Sender: TObject);
begin
  if Assigned(FOnEditar) then
    FOnEditar(Self);
end;

procedure TPagamentoCardPanel.BtnExcluirClick(Sender: TObject);
begin
  if Assigned(FOnExcluir) then
    FOnExcluir(Self);
end;

procedure TPagamentoCardPanel.BtnDefinirPrincipalClick(Sender: TObject);
begin
  if Assigned(FOnDefinirPrincipal) then
    FOnDefinirPrincipal(Self);
end;

// ========== SETAR PRINCIPAL ==========
procedure TPagamentoCardPanel.SetPrincipal(Value: Boolean);
begin
  if FPrincipal <> Value then
  begin
    FPrincipal := Value;
    AtualizarVisualPrincipal;
  end;
end;

// ========== ATUALIZAR VISUAL PRINCIPAL ==========
procedure TPagamentoCardPanel.AtualizarVisualPrincipal;
begin
  if FPrincipal then
  begin
    // ========== VISUAL DE PRINCIPAL ==========
    Self.Color := $00E8F5E9; // Verde claro

    // Criar badge se não existir
    if not Assigned(pBadgePrincipal) then
    begin
      pBadgePrincipal := TPanel.Create(Self);
      pBadgePrincipal.Parent := Self;
      pBadgePrincipal.Width := 90;
      pBadgePrincipal.Height := 25;
      pBadgePrincipal.Top := 10;
      pBadgePrincipal.Left := Self.Width - pBadgePrincipal.Width - 15;
      pBadgePrincipal.Anchors := [akTop, akRight];
      pBadgePrincipal.BevelOuter := bvNone;
      pBadgePrincipal.Color := $0000BB00; // Verde
      pBadgePrincipal.Font.Name := 'Segoe UI';
      pBadgePrincipal.Font.Size := 8;
      pBadgePrincipal.Font.Style := [fsBold];
      pBadgePrincipal.Font.Color := clWhite;
      pBadgePrincipal.Caption := 'PRINCIPAL';
    end;

    pBadgePrincipal.Visible := True;

    // Esconder botão "Definir Principal"
    if Assigned(btnDefinirPrincipal) then
      btnDefinirPrincipal.Visible := False;

    // Atualizar cor do painel de botões
    if Assigned(pBotoes) then
      pBotoes.Color := $00E8F5E9;
  end
  else
  begin
    // ========== VISUAL NORMAL ==========
    Self.Color := clWhite;

    if Assigned(pBadgePrincipal) then
      pBadgePrincipal.Visible := False;

    // Mostrar/Criar botão "Definir Principal"
    if not Assigned(btnDefinirPrincipal) and Assigned(pBotoes) then
    begin
      btnDefinirPrincipal := TButton.Create(pBotoes);
      btnDefinirPrincipal.Parent := pBotoes;
      btnDefinirPrincipal.Width := 120;
      btnDefinirPrincipal.Height := 30;
      btnDefinirPrincipal.Top := 0;
      btnDefinirPrincipal.Left := pBotoes.Width - btnDefinirPrincipal.Width;
      btnDefinirPrincipal.Anchors := [akTop, akRight];
      btnDefinirPrincipal.Caption := '⭐ Definir Principal';
      btnDefinirPrincipal.OnClick := BtnDefinirPrincipalClick;
      btnDefinirPrincipal.Font.Size := 9;
      btnDefinirPrincipal.Font.Name := 'Segoe UI';
    end;

    if Assigned(btnDefinirPrincipal) then
      btnDefinirPrincipal.Visible := True;

    // Atualizar cor do painel de botões
    if Assigned(pBotoes) then
      pBotoes.Color := clWhite;
  end;
end;

end.
