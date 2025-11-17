unit EnderecoCardPanel;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TEnderecoCardPanel = class(TPanel)
  private
    FIdEndereco: Integer;
    FApelido: String;
    FLogradouro: String;
    FNumero: String;
    FBairro: String;
    FCidade: String;
    FUF: String;
    FCEP: String;
    FPrincipal: Boolean;

    pBadgePrincipal: TPanel;
    btnEditar: TButton;
    btnExcluir: TButton;
    lblApelido: TLabel;
    lblEndereco: TLabel;
    lblCidade: TLabel;

    FOnEditar: TNotifyEvent;
    FOnExcluir: TNotifyEvent;

    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure AtualizarVisualPrincipal;

  public
    constructor CreateCard(AOwner: TComponent;
      IdEndereco: Integer;
      const Apelido, Logradouro, Numero, Bairro, Cidade, UF, CEP: String;
      Principal: Boolean);

    procedure SetPrincipal(Value: Boolean);

    property IdEndereco: Integer read FIdEndereco;
    property Principal: Boolean read FPrincipal write SetPrincipal;
    property OnEditar: TNotifyEvent read FOnEditar write FOnEditar;
    property OnExcluir: TNotifyEvent read FOnExcluir write FOnExcluir;
  end;

implementation

{ TEnderecoCardPanel }

constructor TEnderecoCardPanel.CreateCard(AOwner: TComponent;
  IdEndereco: Integer;
  const Apelido, Logradouro, Numero, Bairro, Cidade, UF, CEP: String;
  Principal: Boolean);
begin
  inherited Create(AOwner);

  FIdEndereco := IdEndereco;
  FApelido := Apelido;
  FLogradouro := Logradouro;
  FNumero := Numero;
  FBairro := Bairro;
  FCidade := Cidade;
  FUF := UF;
  FCEP := CEP;
  FPrincipal := Principal;

  Self.Height := 130;
  Self.ParentBackground := False;
  Self.BevelOuter := bvNone;
  Self.Color := clWhite;
  Self.BorderStyle := bsSingle;

  lblApelido := TLabel.Create(Self);
  lblApelido.Parent := Self;
  lblApelido.Left := 15;
  lblApelido.Top := 15;
  lblApelido.Caption := '🏠 ' + FApelido;
  lblApelido.Font.Name := 'Segoe UI';
  lblApelido.Font.Size := 11;
  lblApelido.Font.Style := [fsBold];
  lblApelido.Font.Color := clBlack;
  lblApelido.Transparent := True;

  lblEndereco := TLabel.Create(Self);
  lblEndereco.Parent := Self;
  lblEndereco.Left := 15;
  lblEndereco.Top := 45;
  lblEndereco.Caption := Format('%s, %s - %s', [FLogradouro, FNumero, FBairro]);
  lblEndereco.Font.Name := 'Segoe UI';
  lblEndereco.Font.Size := 9;
  lblEndereco.Font.Color := $00666666;
  lblEndereco.Transparent := True;
  lblEndereco.AutoSize := False;
  lblEndereco.Width := Self.Width - 30;
  lblEndereco.WordWrap := True;

  lblCidade := TLabel.Create(Self);
  lblCidade.Parent := Self;
  lblCidade.Left := 15;
  lblCidade.Top := 70;
  lblCidade.Caption := Format('%s/%s - CEP: %s', [FCidade, FUF, FCEP]);
  lblCidade.Font.Name := 'Segoe UI';
  lblCidade.Font.Size := 9;
  lblCidade.Font.Color := $00999999;
  lblCidade.Transparent := True;

  btnEditar := TButton.Create(Self);
  btnEditar.Parent := Self;
  btnEditar.Width := 80;
  btnEditar.Height := 28;
  btnEditar.Top := 95;
  btnEditar.Left := Self.Width - btnEditar.Width - 100;
  btnEditar.Anchors := [akRight, akBottom];
  btnEditar.Caption := '✏️ Editar';
  btnEditar.OnClick := BtnEditarClick;
  btnEditar.Font.Size := 9;

  btnExcluir := TButton.Create(Self);
  btnExcluir.Parent := Self;
  btnExcluir.Width := 80;
  btnExcluir.Height := 28;
  btnExcluir.Top := 95;
  btnExcluir.Left := Self.Width - btnExcluir.Width - 10;
  btnExcluir.Anchors := [akRight, akBottom];
  btnExcluir.Caption := '🗑️ Excluir';
  btnExcluir.OnClick := BtnExcluirClick;
  btnExcluir.Font.Size := 9;

  if FPrincipal then
  begin
    pBadgePrincipal := TPanel.Create(Self);
    pBadgePrincipal.Parent := Self;
    pBadgePrincipal.Width := 90;
    pBadgePrincipal.Height := 25;
    pBadgePrincipal.Top := 10;
    pBadgePrincipal.Left := Self.Width - pBadgePrincipal.Width - 15;
    pBadgePrincipal.Anchors := [akTop, akRight];
    pBadgePrincipal.BevelOuter := bvNone;
    pBadgePrincipal.Color := $0000BB00;
    pBadgePrincipal.Font.Name := 'Segoe UI';
    pBadgePrincipal.Font.Size := 8;
    pBadgePrincipal.Font.Style := [fsBold];
    pBadgePrincipal.Font.Color := clWhite;
    pBadgePrincipal.Caption := 'PRINCIPAL';
  end;

  AtualizarVisualPrincipal;
end;

procedure TEnderecoCardPanel.BtnEditarClick(Sender: TObject);
begin
  if Assigned(FOnEditar) then
    FOnEditar(Self);
end;

procedure TEnderecoCardPanel.BtnExcluirClick(Sender: TObject);
begin
  if Assigned(FOnExcluir) then
    FOnExcluir(Self);
end;

procedure TEnderecoCardPanel.SetPrincipal(Value: Boolean);
begin
  if FPrincipal <> Value then
  begin
    FPrincipal := Value;
    AtualizarVisualPrincipal;
  end;
end;

procedure TEnderecoCardPanel.AtualizarVisualPrincipal;
begin
  if FPrincipal then
  begin
    Self.Color := $00E8F5E9;

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
      pBadgePrincipal.Color := $0000BB00;
      pBadgePrincipal.Font.Name := 'Segoe UI';
      pBadgePrincipal.Font.Size := 8;
      pBadgePrincipal.Font.Style := [fsBold];
      pBadgePrincipal.Font.Color := clWhite;
      pBadgePrincipal.Caption := 'PRINCIPAL';
    end;

    pBadgePrincipal.Visible := True;
  end
  else
  begin
    Self.Color := clWhite;

    if Assigned(pBadgePrincipal) then
      pBadgePrincipal.Visible := False;
  end;
end;

end.
