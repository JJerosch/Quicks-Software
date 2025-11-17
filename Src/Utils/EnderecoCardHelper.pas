unit EnderecoCardHelper;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Classes, System.Types,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  // Evento quando um card é clicado
  TEnderecoCardClickEvent = procedure(IdEndereco: Integer) of object;

  // Card visual de endereço
  TEnderecoCard = class(TPanel)
  private
    FIdEndereco: Integer;
    FSelecionado: Boolean;
    FPrincipal: Boolean;
    FApelido: String;
    FLogradouro: String;
    FNumero: String;
    FBairro: String;
    FCidade: String;
    FUF: String;
    FCEP: String;
    FOnCardClick: TEnderecoCardClickEvent;

    pBadgePrincipal: TPanel;
    lblApelido: TLabel;
    lblEnderecoCompleto: TLabel;
    lblCEP: TLabel;

    procedure SetSelecionado(const Value: Boolean);
    procedure CardClick(Sender: TObject);
    procedure CardMouseEnter(Sender: TObject);
    procedure CardMouseLeave(Sender: TObject);
    procedure AtualizarCores;
  public
    constructor CreateCard(AOwner: TComponent;
      IdEndereco: Integer;
      const Apelido, Logradouro, Numero, Bairro, Cidade, UF, CEP: String;
      Principal: Boolean);

    property IdEndereco: Integer read FIdEndereco;
    property Selecionado: Boolean read FSelecionado write SetSelecionado;
    property OnCardClick: TEnderecoCardClickEvent read FOnCardClick write FOnCardClick;
  end;

  // Helper para gerenciar os cards
  TEnderecoCardHelper = class
  public
    class procedure LimparCards(ScrollBox: TScrollBox);
    class procedure DeselecionarTodos(ScrollBox: TScrollBox);
    class function ObterCardSelecionado(ScrollBox: TScrollBox): TEnderecoCard;
  end;

implementation

{ TEnderecoCard }

constructor TEnderecoCard.CreateCard(AOwner: TComponent;
  IdEndereco: Integer;
  const Apelido, Logradouro, Numero, Bairro, Cidade, UF, CEP: String;
  Principal: Boolean);
var
  EnderecoCompleto: String;
begin
  inherited Create(AOwner);

  // Armazenar dados
  FIdEndereco := IdEndereco;
  FApelido := Apelido;
  FLogradouro := Logradouro;
  FNumero := Numero;
  FBairro := Bairro;
  FCidade := Cidade;
  FUF := UF;
  FCEP := CEP;
  FPrincipal := Principal;
  FSelecionado := False;

  // Configurar painel principal
  Self.Height := 120;
  Self.ParentBackground := False;
  Self.BevelOuter := bvNone;
  Self.Color := clWhite;
  Self.Cursor := crHandPoint;
  Self.BorderStyle := bsSingle;
  Self.Ctl3D := True;
  Self.ParentColor := False;

  // Eventos
  Self.OnClick := CardClick;
  Self.OnMouseEnter := CardMouseEnter;
  Self.OnMouseLeave := CardMouseLeave;

  // Badge "PRINCIPAL" (se for principal)
  if FPrincipal then
  begin
    pBadgePrincipal := TPanel.Create(Self);
    pBadgePrincipal.Parent := Self;
    pBadgePrincipal.Width := 90;
    pBadgePrincipal.Height := 25;
    pBadgePrincipal.Top := 10;
    pBadgePrincipal.Left := Self.Width - pBadgePrincipal.Width - 10;
    pBadgePrincipal.Anchors := [akTop, akRight];
    pBadgePrincipal.BevelOuter := bvNone;
    pBadgePrincipal.Color := $0000BB00; // Verde
    pBadgePrincipal.Font.Name := 'Segoe UI';
    pBadgePrincipal.Font.Size := 8;
    pBadgePrincipal.Font.Style := [fsBold];
    pBadgePrincipal.Font.Color := clWhite;
    pBadgePrincipal.Caption := 'PRINCIPAL';
    pBadgePrincipal.Cursor := crHandPoint;
    pBadgePrincipal.OnClick := CardClick;
  end;

  // Label Apelido/Título
  lblApelido := TLabel.Create(Self);
  lblApelido.Parent := Self;
  lblApelido.Left := 15;
  lblApelido.Top := 15;
  lblApelido.Caption := '🏠 ' + FApelido;
  lblApelido.Font.Name := 'Segoe UI';
  lblApelido.Font.Size := 11;
  lblApelido.Font.Style := [fsBold];
  lblApelido.Font.Color := clBlack;
  lblApelido.Cursor := crHandPoint;
  lblApelido.OnClick := CardClick;
  lblApelido.Transparent := True;

  // Endereço completo
  EnderecoCompleto := Format('%s, %s - %s', [FLogradouro, FNumero, FBairro]);

  lblEnderecoCompleto := TLabel.Create(Self);
  lblEnderecoCompleto.Parent := Self;
  lblEnderecoCompleto.Left := 15;
  lblEnderecoCompleto.Top := 45;
  lblEnderecoCompleto.Caption := EnderecoCompleto;
  lblEnderecoCompleto.Font.Name := 'Segoe UI';
  lblEnderecoCompleto.Font.Size := 9;
  lblEnderecoCompleto.Font.Color := $00666666;
  lblEnderecoCompleto.Cursor := crHandPoint;
  lblEnderecoCompleto.OnClick := CardClick;
  lblEnderecoCompleto.Transparent := True;
  lblEnderecoCompleto.AutoSize := False;
  lblEnderecoCompleto.Width := Self.Width - 30;
  lblEnderecoCompleto.WordWrap := True;

  // Cidade/Estado
  lblCEP := TLabel.Create(Self);
  lblCEP.Parent := Self;
  lblCEP.Left := 15;
  lblCEP.Top := 85;
  lblCEP.Caption := Format('%s/%s - CEP: %s', [FCidade, FUF, FCEP]);
  lblCEP.Font.Name := 'Segoe UI';
  lblCEP.Font.Size := 9;
  lblCEP.Font.Color := $00999999;
  lblCEP.Cursor := crHandPoint;
  lblCEP.OnClick := CardClick;
  lblCEP.Transparent := True;
end;

procedure TEnderecoCard.CardClick(Sender: TObject);
begin
  Self.Selecionado := True;

  if Assigned(FOnCardClick) then
    FOnCardClick(FIdEndereco);
end;

procedure TEnderecoCard.CardMouseEnter(Sender: TObject);
begin
  if not FSelecionado then
    Self.Color := $00F5F5F5; // Cinza claro
end;

procedure TEnderecoCard.CardMouseLeave(Sender: TObject);
begin
  if not FSelecionado then
    Self.Color := clWhite;
end;

procedure TEnderecoCard.SetSelecionado(const Value: Boolean);
begin
  FSelecionado := Value;
  AtualizarCores;
end;

procedure TEnderecoCard.AtualizarCores;
begin
  if FSelecionado then
  begin
    Self.Color := $00FFE4CC; // Laranja claro
    Self.BorderStyle := bsSingle;
    if Assigned(lblApelido) then
      lblApelido.Font.Color := $00FF6600; // Laranja escuro
  end
  else
  begin
    Self.Color := clWhite;
    if Assigned(lblApelido) then
      lblApelido.Font.Color := clBlack;
  end;
end;

{ TEnderecoCardHelper }

class procedure TEnderecoCardHelper.LimparCards(ScrollBox: TScrollBox);
var
  I: Integer;
begin
  for I := ScrollBox.ControlCount - 1 downto 0 do
  begin
    if ScrollBox.Controls[I] is TEnderecoCard then
      ScrollBox.Controls[I].Free;
  end;

  if Assigned(ScrollBox) then
    ScrollBox.VertScrollBar.Position := 0;
end;

class procedure TEnderecoCardHelper.DeselecionarTodos(ScrollBox: TScrollBox);
var
  I: Integer;
begin
  for I := 0 to ScrollBox.ControlCount - 1 do
  begin
    if ScrollBox.Controls[I] is TEnderecoCard then
      TEnderecoCard(ScrollBox.Controls[I]).Selecionado := False;
  end;
end;

class function TEnderecoCardHelper.ObterCardSelecionado(ScrollBox: TScrollBox): TEnderecoCard;
var
  I: Integer;
begin
  Result := nil;

  for I := 0 to ScrollBox.ControlCount - 1 do
  begin
    if (ScrollBox.Controls[I] is TEnderecoCard) and
       (TEnderecoCard(ScrollBox.Controls[I]).Selecionado) then
    begin
      Result := TEnderecoCard(ScrollBox.Controls[I]);
      Break;
    end;
  end;
end;

end.
