unit PerfilViewHelper;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Imaging.pngimage, Data.DB, Vcl.Mask, Vcl.Grids, Vcl.DBGrids,
  System.Generics.Collections, EnderecoClienteModel, FormaPagamentoClienteModel,
  EnderecoCardPanel, PagamentoCardPanel;

type
  TPerfilViewHelper = class
  public
    // Endereços
    class procedure PopularEnderecosCards(ScrollBox: TScrollBox;
      Enderecos: TObjectList<TEnderecoCliente>;
      OnEditar, OnExcluir: TNotifyEvent);
    class procedure PopularEnderecosComboBox(ComboBox: TComboBox;
      Enderecos: TObjectList<TEnderecoCliente>);
    class procedure AtualizarCardsPrincipalEndereco(ScrollBox: TScrollBox;
      IdEnderecoPrincipal: Integer);

    // Pagamentos
    class procedure PopularPagamentosCards(ScrollBox: TScrollBox;
      Pagamentos: TObjectList<TFormaPagamentoCliente>;
      OnEditar, OnExcluir, OnDefinirPrincipal: TNotifyEvent);
    class procedure PopularPagamentosComboBox(ComboBox: TComboBox;
      Pagamentos: TObjectList<TFormaPagamentoCliente>);
    class procedure AtualizarCardsPrincipalPagamento(ScrollBox: TScrollBox;
      IdPagamentoPrincipal: Integer);

    // Mensagens
    class procedure ExibirMensagemSemEnderecos(ScrollBox: TScrollBox);
    class procedure ExibirMensagemSemPagamentos(ScrollBox: TScrollBox);

    // Limpeza
    class procedure LimparCards(ScrollBox: TScrollBox);
  end;

implementation

{ TPerfilViewHelper }

class procedure TPerfilViewHelper.PopularEnderecosCards(ScrollBox: TScrollBox;
  Enderecos: TObjectList<TEnderecoCliente>; OnEditar, OnExcluir: TNotifyEvent);
var
  Endereco: TEnderecoCliente;
  Card: TEnderecoCardPanel;
  Y, CardHeight, Spacing: Integer;
begin
  if not Assigned(ScrollBox) or not Assigned(Enderecos) then
    Exit;

  // Limpar cards existentes
  LimparCards(ScrollBox);

  if Enderecos.Count = 0 then
  begin
    ExibirMensagemSemEnderecos(ScrollBox);
    Exit;
  end;

  CardHeight := 130;
  Spacing := 10;
  Y := Spacing;

  for Endereco in Enderecos do
  begin
    if Assigned(Endereco) then
    begin
      Card := TEnderecoCardPanel.CreateCard(
        ScrollBox.Owner,
        Endereco.IdEndereco,
        Endereco.Apelido,
        Endereco.Logradouro,
        Endereco.Numero,
        Endereco.Bairro,
        Endereco.Cidade,
        Endereco.UF,
        Endereco.CEP,
        Endereco.Principal
      );

      Card.Parent := ScrollBox;
      Card.Top := Y;
      Card.Left := 10;
      Card.Width := ScrollBox.ClientWidth - 20;
      Card.Anchors := [akLeft, akTop, akRight];
      Card.OnEditar := OnEditar;
      Card.OnExcluir := OnExcluir;

      Inc(Y, CardHeight + Spacing);
    end;
  end;
end;

class procedure TPerfilViewHelper.PopularEnderecosComboBox(ComboBox: TComboBox;
  Enderecos: TObjectList<TEnderecoCliente>);
var
  Endereco: TEnderecoCliente;
  IdxPrincipal: Integer;
begin
  if not Assigned(ComboBox) or not Assigned(Enderecos) then
    Exit;

  ComboBox.Clear;
  ComboBox.OnChange := nil;

  if Enderecos.Count = 0 then
  begin
    ComboBox.Enabled := False;
    Exit;
  end;

  IdxPrincipal := -1;

  for Endereco in Enderecos do
  begin
    if Assigned(Endereco) then
    begin
      ComboBox.Items.AddObject(
        Format('%s - %s, %s', [Endereco.Apelido, Endereco.Logradouro, Endereco.Numero]),
        TObject(Endereco.IdEndereco)
      );

      if Endereco.Principal then
        IdxPrincipal := ComboBox.Items.Count - 1;
    end;
  end;

  if IdxPrincipal >= 0 then
    ComboBox.ItemIndex := IdxPrincipal
  else if ComboBox.Items.Count > 0 then
    ComboBox.ItemIndex := 0;

  ComboBox.Enabled := True;
end;

class procedure TPerfilViewHelper.AtualizarCardsPrincipalEndereco(
  ScrollBox: TScrollBox; IdEnderecoPrincipal: Integer);
var
  I: Integer;
  Card: TEnderecoCardPanel;
begin
  if not Assigned(ScrollBox) then
    Exit;

  for I := 0 to ScrollBox.ControlCount - 1 do
  begin
    if ScrollBox.Controls[I] is TEnderecoCardPanel then
    begin
      Card := TEnderecoCardPanel(ScrollBox.Controls[I]);
      Card.Principal := (Card.IdEndereco = IdEnderecoPrincipal);
    end;
  end;
end;

class procedure TPerfilViewHelper.PopularPagamentosCards(ScrollBox: TScrollBox;
  Pagamentos: TObjectList<TFormaPagamentoCliente>;
  OnEditar, OnExcluir, OnDefinirPrincipal: TNotifyEvent);
var
  Pagamento: TFormaPagamentoCliente;
  Card: TPagamentoCardPanel;
  Y, CardHeight, Spacing: Integer;
begin
  if not Assigned(ScrollBox) or not Assigned(Pagamentos) then
    Exit;

  // Limpar cards existentes
  LimparCards(ScrollBox);

  if Pagamentos.Count = 0 then
  begin
    ExibirMensagemSemPagamentos(ScrollBox);
    Exit;
  end;

  CardHeight := 130;
  Spacing := 10;
  Y := Spacing;

  for Pagamento in Pagamentos do
  begin
    if Assigned(Pagamento) then
    begin
      Card := TPagamentoCardPanel.CreateCardFromModel(ScrollBox.Owner, Pagamento);

      Card.Parent := ScrollBox;
      Card.Top := Y;
      Card.Left := 10;
      Card.Width := ScrollBox.ClientWidth - 20;
      Card.Anchors := [akLeft, akTop, akRight];
      Card.OnEditar := OnEditar;
      Card.OnExcluir := OnExcluir;
      Card.OnDefinirPrincipal := OnDefinirPrincipal;

      Inc(Y, CardHeight + Spacing);
    end;
  end;
end;

class procedure TPerfilViewHelper.PopularPagamentosComboBox(ComboBox: TComboBox;
  Pagamentos: TObjectList<TFormaPagamentoCliente>);
var
  Pagamento: TFormaPagamentoCliente;
  IdxPrincipal: Integer;
  Descricao: String;
begin
  if not Assigned(ComboBox) or not Assigned(Pagamentos) then
    Exit;

  ComboBox.Clear;
  ComboBox.OnChange := nil;

  if Pagamentos.Count = 0 then
  begin
    ComboBox.Enabled := False;
    Exit;
  end;

  IdxPrincipal := -1;

  for Pagamento in Pagamentos do
  begin
    if Assigned(Pagamento) then
    begin
      // Criar descrição amigável
      if Pagamento is TPagamentoCartao then
        Descricao := Format('%s - %s **** %s',
          [Pagamento.Apelido,
           TPagamentoCartao(Pagamento).Bandeira,
           TPagamentoCartao(Pagamento).NumeroCartao])
      else if Pagamento is TPagamentoPix then
        Descricao := Format('%s - Pix: %s',
          [Pagamento.Apelido,
           Copy(TPagamentoPix(Pagamento).ChavePix, 1, 20)])
      else if Pagamento is TPagamentoTransferencia then
        Descricao := Format('%s - %s',
          [Pagamento.Apelido,
           TPagamentoTransferencia(Pagamento).Banco])
      else
        Descricao := Pagamento.Apelido;

      ComboBox.Items.AddObject(Descricao, TObject(Pagamento.IdPagamento));

      if Pagamento.Principal then
        IdxPrincipal := ComboBox.Items.Count - 1;
    end;
  end;

  if IdxPrincipal >= 0 then
    ComboBox.ItemIndex := IdxPrincipal
  else if ComboBox.Items.Count > 0 then
    ComboBox.ItemIndex := 0;

  ComboBox.Enabled := True;
end;

class procedure TPerfilViewHelper.AtualizarCardsPrincipalPagamento(
  ScrollBox: TScrollBox; IdPagamentoPrincipal: Integer);
var
  I: Integer;
  Card: TPagamentoCardPanel;
begin
  if not Assigned(ScrollBox) then
    Exit;

  for I := 0 to ScrollBox.ControlCount - 1 do
  begin
    if ScrollBox.Controls[I] is TPagamentoCardPanel then
    begin
      Card := TPagamentoCardPanel(ScrollBox.Controls[I]);
      Card.Principal := (Card.IdPagamento = IdPagamentoPrincipal);
    end;
  end;
end;

class procedure TPerfilViewHelper.ExibirMensagemSemEnderecos(ScrollBox: TScrollBox);
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
  pMensagem.Height := 100;
  pMensagem.BevelOuter := bvNone;
  pMensagem.Color := $00F5F5F5;
  pMensagem.Anchors := [akLeft, akTop, akRight];

  lblMensagem := TLabel.Create(pMensagem);
  lblMensagem.Parent := pMensagem;
  lblMensagem.Caption :=
    '📍 Nenhum endereço cadastrado' + #13#10 +
    'Clique em "Adicionar Endereço" para cadastrar';
  lblMensagem.Font.Name := 'Segoe UI';
  lblMensagem.Font.Size := 10;
  lblMensagem.Font.Color := $00808080;
  lblMensagem.Alignment := taCenter;
  lblMensagem.Layout := tlCenter;
  lblMensagem.WordWrap := True;
  lblMensagem.Align := alClient;
end;

class procedure TPerfilViewHelper.ExibirMensagemSemPagamentos(ScrollBox: TScrollBox);
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
  pMensagem.Height := 100;
  pMensagem.BevelOuter := bvNone;
  pMensagem.Color := $00F5F5F5;
  pMensagem.Anchors := [akLeft, akTop, akRight];

  lblMensagem := TLabel.Create(pMensagem);
  lblMensagem.Parent := pMensagem;
  lblMensagem.Caption :=
    '💳 Nenhuma forma de pagamento cadastrada' + #13#10#13#10 +
    'Clique em "Adicionar Forma de Pagamento" para cadastrar';
  lblMensagem.Font.Name := 'Segoe UI';
  lblMensagem.Font.Size := 10;
  lblMensagem.Font.Color := $00808080;
  lblMensagem.Alignment := taCenter;
  lblMensagem.Layout := tlCenter;
  lblMensagem.WordWrap := True;
  lblMensagem.Align := alClient;
end;

class procedure TPerfilViewHelper.LimparCards(ScrollBox: TScrollBox);
var
  I: Integer;
begin
  if not Assigned(ScrollBox) then
    Exit;

  for I := ScrollBox.ControlCount - 1 downto 0 do
  begin
    if (ScrollBox.Controls[I] is TEnderecoCardPanel) or
       (ScrollBox.Controls[I] is TPagamentoCardPanel) or
       (ScrollBox.Controls[I] is TPanel) then
      ScrollBox.Controls[I].Free;
  end;

  ScrollBox.VertScrollBar.Position := 0;
end;

end.
