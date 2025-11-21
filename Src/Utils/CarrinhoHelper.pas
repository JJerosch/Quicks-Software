unit CarrinhoHelper;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Classes, System.Types,
  System.Generics.Collections,  // ← Faltava
  System.StrUtils,              // ← IfThen
  Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Dialogs,                  // ← MessageDlg
  CarrinhoModel;


type
  TCarrinhoItemChangeEvent = procedure(IdProduto: Integer;
    const Observacao: String; NovaQuantidade: Integer) of object;
  TCarrinhoItemRemoveEvent = procedure(IdProduto: Integer;
    const Observacao: String) of object;

  // Card visual de item do carrinho
  TCarrinhoItemCard = class(TPanel)
  private
    FIdProduto: Integer;
    FNomeProduto: String;
    FPreco: Currency;
    FQuantidade: Integer;
    FObservacao: String;
    FOnQuantidadeChange: TCarrinhoItemChangeEvent;
    FOnRemover: TCarrinhoItemRemoveEvent;

    lblNome, lblPreco, lblSubtotal, lblObservacao: TLabel;
    eQuantidade: TEdit;
    btnMenos, btnMais, btnRemover: TButton;

    procedure BtnMenosClick(Sender: TObject);
    procedure BtnMaisClick(Sender: TObject);
    procedure BtnRemoverClick(Sender: TObject);
    procedure QuantidadeChange(Sender: TObject);
    procedure AtualizarSubtotal;
  public
    constructor CreateCard(AOwner: TComponent; Item: TItemCarrinho);
    procedure ConfigurarVisual;

    property IdProduto: Integer read FIdProduto;
    property Quantidade: Integer read FQuantidade;
    property OnQuantidadeChange: TCarrinhoItemChangeEvent read FOnQuantidadeChange write FOnQuantidadeChange;
    property OnRemover: TCarrinhoItemRemoveEvent read FOnRemover write FOnRemover;
    property Observacao: String read FObservacao; // ⭐ ADICIONAR property
  end;

  // Helper para gerenciar o carrinho
  TCarrinhoHelper = class
  public
    class procedure LimparCards(ScrollBox: TScrollBox);
    class procedure AtualizarResumo(
      lblItens, lblSubtotal, lblTaxa, lblTotal: TLabel;
      TaxaEntrega: Currency;
      Itens: TObjectList<TItemCarrinho>
    );
    class procedure PopularResumoSimples(ScrollBox: TScrollBox;
  Itens: TObjectList<TItemCarrinho>);
  end;

implementation

{ TCarrinhoItemCard }

constructor TCarrinhoItemCard.CreateCard(AOwner: TComponent; Item: TItemCarrinho);
begin
  inherited Create(AOwner);

  if not Assigned(AOwner) then
    raise Exception.Create('Owner não pode ser nil ao criar TCarrinhoItemCard');

  FIdProduto := Item.IdProduto;
  FNomeProduto := Item.NomeProduto;
  FPreco := Item.Preco;
  FQuantidade := Item.Quantidade;
  FObservacao := Item.Observacao;

  Self.Height := 120;
  Self.Width := 100; // Temporário
end;

procedure TCarrinhoItemCard.ConfigurarVisual;
var
  pControles: TPanel;
begin
  // Configurar painel principal
  Self.ParentBackground := False;
  Self.BevelOuter := bvNone;
  Self.Color := clWhite;
  Self.BorderStyle := bsSingle;
  Self.ParentColor := False;

  // Nome do produto
  lblNome := TLabel.Create(Self);
  lblNome.Parent := Self;
  lblNome.Left := 15;
  lblNome.Top := 15;
  lblNome.Caption := FNomeProduto;
  lblNome.Font.Name := 'Segoe UI';
  lblNome.Font.Size := 11;
  lblNome.Font.Style := [fsBold];
  lblNome.Font.Color := $00333333;
  lblNome.Transparent := True;
  lblNome.AutoSize := False;
  lblNome.Width := Self.Width - 30;
  lblNome.WordWrap := True;

  // Preço unitário
  lblPreco := TLabel.Create(Self);
  lblPreco.Parent := Self;
  lblPreco.Left := 15;
  lblPreco.Top := 45;
  lblPreco.Caption := 'R$ ' + FormatFloat('#,##0.00', FPreco) + ' cada';
  lblPreco.Font.Name := 'Segoe UI';
  lblPreco.Font.Size := 9;
  lblPreco.Font.Color := $00666666;
  lblPreco.Transparent := True;

  // Painel de controles (quantidade + botões)
  pControles := TPanel.Create(Self);
  pControles.Parent := Self;
  pControles.Left := 15;
  pControles.Top := 70;
  pControles.Width := Self.Width - 30;
  pControles.Height := 35;
  pControles.BevelOuter := bvNone;
  pControles.Color := Self.Color;
  pControles.ParentBackground := False;

  // Botão Menos
  btnMenos := TButton.Create(pControles);
  btnMenos.Parent := pControles;
  btnMenos.Caption := '−';
  btnMenos.Left := 0;
  btnMenos.Top := 0;
  btnMenos.Width := 35;
  btnMenos.Height := 30;
  btnMenos.Font.Size := 12;
  btnMenos.Font.Style := [fsBold];
  btnMenos.Cursor := crHandPoint;
  btnMenos.OnClick := BtnMenosClick;

  // Edit Quantidade
  eQuantidade := TEdit.Create(pControles);
  eQuantidade.Parent := pControles;
  eQuantidade.Left := 40;
  eQuantidade.Top := 0;
  eQuantidade.Width := 50;
  eQuantidade.Height := 30;
  eQuantidade.Font.Size := 10;
  eQuantidade.Font.Style := [fsBold];
  eQuantidade.Alignment := taCenter;
  eQuantidade.NumbersOnly := True;
  eQuantidade.Text := IntToStr(FQuantidade);
  eQuantidade.OnChange := QuantidadeChange;

  // Botão Mais
  btnMais := TButton.Create(pControles);
  btnMais.Parent := pControles;
  btnMais.Caption := '+';
  btnMais.Left := 95;
  btnMais.Top := 0;
  btnMais.Width := 35;
  btnMais.Height := 30;
  btnMais.Font.Size := 12;
  btnMais.Font.Style := [fsBold];
  btnMais.Cursor := crHandPoint;
  btnMais.OnClick := BtnMaisClick;

  // Subtotal
  lblSubtotal := TLabel.Create(pControles);
  lblSubtotal.Parent := pControles;
  lblSubtotal.Left := 150;
  lblSubtotal.Top := 7;
  lblSubtotal.Caption := 'R$ ' + FormatFloat('#,##0.00', FPreco * FQuantidade);
  lblSubtotal.Font.Name := 'Segoe UI';
  lblSubtotal.Font.Size := 11;
  lblSubtotal.Font.Style := [fsBold];
  lblSubtotal.Font.Color := $00FF6600;
  lblSubtotal.Transparent := True;

  // Botão Remover
  btnRemover := TButton.Create(pControles);
  btnRemover.Parent := pControles;
  btnRemover.Caption := '🗑️ Remover';
  btnRemover.Left := pControles.Width - 110;
  btnRemover.Top := 0;
  btnRemover.Width := 110;
  btnRemover.Height := 30;
  btnRemover.Font.Size := 9;
  btnRemover.Cursor := crHandPoint;
  btnRemover.Anchors := [akTop, akRight];
  btnRemover.OnClick := BtnRemoverClick;

  // Observação (se houver)
  if Trim(FObservacao) <> '' then
  begin
    lblObservacao := TLabel.Create(Self);
    lblObservacao.Parent := Self;
    lblObservacao.Left := 15;
    lblObservacao.Top := 110;
    lblObservacao.Caption := '📝 ' + FObservacao;
    lblObservacao.Font.Name := 'Segoe UI';
    lblObservacao.Font.Size := 8;
    lblObservacao.Font.Color := $00808080;
    lblObservacao.Transparent := True;
    lblObservacao.AutoSize := False;
    lblObservacao.Width := Self.Width - 30;
    lblObservacao.WordWrap := True;

    // Aumentar altura do card se houver observação
    Self.Height := Self.Height + 25;
  end;
end;

procedure TCarrinhoItemCard.BtnMenosClick(Sender: TObject);
begin
  if FQuantidade > 1 then
  begin
    Dec(FQuantidade);
    eQuantidade.Text := IntToStr(FQuantidade);
    AtualizarSubtotal;

    if Assigned(FOnQuantidadeChange) then
      FOnQuantidadeChange(FIdProduto, FObservacao, FQuantidade); // ⭐ PASSA OBSERVAÇÃO
  end;
end;

procedure TCarrinhoItemCard.BtnMaisClick(Sender: TObject);
begin
  if FQuantidade < 99 then
  begin
    Inc(FQuantidade);
    eQuantidade.Text := IntToStr(FQuantidade);
    AtualizarSubtotal;

    if Assigned(FOnQuantidadeChange) then
      FOnQuantidadeChange(FIdProduto, FObservacao, FQuantidade); // ⭐ PASSA OBSERVAÇÃO
  end;
end;

procedure TCarrinhoItemCard.BtnRemoverClick(Sender: TObject);
begin
  if MessageDlg(
    'Deseja remover "' + FNomeProduto + '" do carrinho?',
    mtConfirmation,
    [mbYes, mbNo],
    0) = mrYes then
  begin
    if Assigned(FOnRemover) then
      FOnRemover(FIdProduto, FObservacao); // ⭐ PASSA OBSERVAÇÃO
  end;
end;

procedure TCarrinhoItemCard.QuantidadeChange(Sender: TObject);
var
  NovaQtd: Integer;
begin
  if TryStrToInt(eQuantidade.Text, NovaQtd) then
  begin
    if (NovaQtd > 0) and (NovaQtd <= 99) then
    begin
      FQuantidade := NovaQtd;
      AtualizarSubtotal;

      if Assigned(FOnQuantidadeChange) then
        FOnQuantidadeChange(FIdProduto, FObservacao, FQuantidade); // ⭐ PASSA OBSERVAÇÃO
    end
    else
    begin
      eQuantidade.Text := IntToStr(FQuantidade);
    end;
  end
  else
  begin
    eQuantidade.Text := IntToStr(FQuantidade);
  end;
end;

procedure TCarrinhoItemCard.AtualizarSubtotal;
begin
  if Assigned(lblSubtotal) then
    lblSubtotal.Caption := 'R$ ' + FormatFloat('#,##0.00', FPreco * FQuantidade);
end;

{ TCarrinhoHelper }

class procedure TCarrinhoHelper.LimparCards(ScrollBox: TScrollBox);
var
  I: Integer;
begin
  for I := ScrollBox.ControlCount - 1 downto 0 do
  begin
    if ScrollBox.Controls[I] is TCarrinhoItemCard then
      ScrollBox.Controls[I].Free;
  end;

  if Assigned(ScrollBox) then
    ScrollBox.VertScrollBar.Position := 0;
end;

class procedure TCarrinhoHelper.PopularResumoSimples(ScrollBox: TScrollBox;
  Itens: TObjectList<TItemCarrinho>);
var
  Item: TItemCarrinho;
  pItem: TPanel;
  lblNome, lblValor: TLabel;
  Y: Integer;
begin
  // Limpar existentes
  for Y := ScrollBox.ControlCount - 1 downto 0 do
    ScrollBox.Controls[Y].Free;

  if not Assigned(Itens) or (Itens.Count = 0) then
    Exit;

  Y := 10;

  for Item in Itens do
  begin
    pItem := TPanel.Create(ScrollBox);
    pItem.Parent := ScrollBox;
    pItem.Left := 10;
    pItem.Top := Y;
    pItem.Width := ScrollBox.ClientWidth - 20;
    pItem.Height := 40;
    pItem.BevelOuter := bvNone;
    pItem.Color := $00F5F5F5;
    pItem.Anchors := [akLeft, akTop, akRight];

    lblNome := TLabel.Create(pItem);
    lblNome.Parent := pItem;
    lblNome.Left := 15;
    lblNome.Top := 10;
    lblNome.Caption := Format('%dx %s', [Item.Quantidade, Item.NomeProduto]);
    lblNome.Font.Name := 'Segoe UI';
    lblNome.Font.Size := 10;
    lblNome.Font.Color := $00333333;
    lblNome.Transparent := True;

    lblValor := TLabel.Create(pItem);
    lblValor.Parent := pItem;
    lblValor.Left := pItem.Width - 120;
    lblValor.Top := 10;
    lblValor.Caption := 'R$ ' + FormatFloat('#,##0.00', Item.Subtotal);
    lblValor.Font.Name := 'Segoe UI';
    lblValor.Font.Size := 10;
    lblValor.Font.Style := [fsBold];
    lblValor.Font.Color := $00FF6600;
    lblValor.Transparent := True;
    lblValor.Anchors := [akTop, akRight];

    Inc(Y, 45);
  end;
end;

class procedure TCarrinhoHelper.AtualizarResumo(
  lblItens, lblSubtotal, lblTaxa, lblTotal: TLabel;
  TaxaEntrega: Currency;
  Itens: TObjectList<TItemCarrinho>
);
var
  Item: TItemCarrinho;
  TotalItens: Integer;
  Subtotal, Total: Currency;
begin
  TotalItens := 0;
  Subtotal := 0;

  if Assigned(Itens) then
  begin
    for Item in Itens do
    begin
      TotalItens := TotalItens + Item.Quantidade;
      Subtotal := Subtotal + Item.Subtotal;
    end;
  end;

  Total := Subtotal + TaxaEntrega;

  // Atualizar labels
  if Assigned(lblItens) then
    lblItens.Caption := IntToStr(TotalItens) + ' ' + IfThen(TotalItens = 1, 'item', 'itens');

  if Assigned(lblSubtotal) then
    lblSubtotal.Caption := 'R$ ' + FormatFloat('#,##0.00', Subtotal);

  if Assigned(lblTaxa) then
    lblTaxa.Caption := 'R$ ' + FormatFloat('#,##0.00', TaxaEntrega);

  if Assigned(lblTotal) then
    lblTotal.Caption := 'R$ ' + FormatFloat('#,##0.00', Total);
end;

end.
