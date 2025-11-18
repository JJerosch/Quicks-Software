unit ProdutoViewHelper;

interface

uses
  System.SysUtils, System.Generics.Collections, System.Classes,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  FireDAC.Comp.Client, FireDAC.Stan.Param, Data.DB,
  ProdutoModel, uConn;

type
  // ⭐ NOVO: Evento para quando um produto é clicado
  TProdutoSelecionadoEvent = procedure(IdProduto: Integer; const NomeProduto: string; Preco: Currency) of object;

  // ⭐ NOVO: Card visual de produto
  TProdutoCard = class(TPanel)
  private
    FIdProduto: Integer;
    FNomeProduto: String;
    FDescricao: String;
    FPreco: Currency;
    FDisponivel: Boolean;
    FCategoria: String;
    FOnProdutoSelecionado: TProdutoSelecionadoEvent;
    procedure CardClick(Sender: TObject);
    procedure CardMouseEnter(Sender: TObject);
    procedure CardMouseLeave(Sender: TObject);
  public
    constructor CreateCard(AOwner: TComponent; IdProduto: Integer;
      const Nome, Descricao, Categoria: String; Preco: Currency; Disponivel: Boolean);
    procedure ConfigurarVisual;
    property IdProduto: Integer read FIdProduto;
    property NomeProduto: String read FNomeProduto;
    property OnProdutoSelecionado: TProdutoSelecionadoEvent read FOnProdutoSelecionado write FOnProdutoSelecionado;
  end;

  TProdutoViewHelper = class
  public
    // Métodos existentes
    class function FormatPreco(Valor: Currency): string;
    class function ParsePreco(const Texto: string): Currency;
    class procedure PopularCategoriasProduto(ComboBox: TComboBox);
    class procedure PreencherMemTableProdutos(MemTable: TFDMemTable; Produtos: TObjectList<TProduto>);

    // ⭐ NOVOS: Métodos para cards de produtos
    class function BuscarCategoriasPorComercio(IdComercio: Integer): TStringList;
    class function BuscarProdutosPorComercio(IdComercio: Integer; const Categoria: string = ''): TObjectList<TProduto>;
    class procedure PopularScrollBoxCategoriasProduto(
      ScrollBox: TScrollBox;
      IdComercio: Integer;
      OnCategoriaClick: TNotifyEvent);
    class procedure PopularScrollBoxProdutos(
      ScrollBox: TScrollBox;
      IdComercio: Integer;
      const Categoria: string;
      OnProdutoClick: TProdutoSelecionadoEvent);
  end;

implementation

{ TProdutoCard }

constructor TProdutoCard.CreateCard(AOwner: TComponent; IdProduto: Integer;
  const Nome, Descricao, Categoria: String; Preco: Currency; Disponivel: Boolean);
begin
  inherited Create(AOwner);

  if not Assigned(AOwner) then
    raise Exception.Create('Owner não pode ser nil ao criar TProdutoCard');

  FIdProduto := IdProduto;
  FNomeProduto := Nome;
  FDescricao := Descricao;
  FCategoria := Categoria;
  FPreco := Preco;
  FDisponivel := Disponivel;

  // Tamanho temporário
  Self.Height := 140;
  Self.Width := 280;
end;

procedure TProdutoCard.ConfigurarVisual;
var
  lblNome, lblPreco, lblDescricao, lblCategoria: TLabel;
  pStatus: TPanel;
  Y: Integer;
begin
  // Configurar painel
  Self.ParentBackground := False;
  Self.BevelOuter := bvNone;
  Self.Color := clWhite;
  Self.Cursor := crHandPoint;
  Self.ShowHint := True;
  Self.Hint := 'Clique para adicionar ao carrinho';
  Self.OnClick := CardClick;
  Self.OnMouseEnter := CardMouseEnter;
  Self.OnMouseLeave := CardMouseLeave;
  Self.BorderStyle := bsSingle;
  Self.ParentColor := False;

  Y := 15;

  // Nome do produto
  lblNome := TLabel.Create(Self);
  lblNome.Parent := Self;
  lblNome.Left := 15;
  lblNome.Top := Y;
  lblNome.Caption := FNomeProduto;
  lblNome.Font.Name := 'Segoe UI';
  lblNome.Font.Size := 11;
  lblNome.Font.Style := [fsBold];
  lblNome.Font.Color := $00517CFF;
  lblNome.Cursor := crHandPoint;
  lblNome.OnClick := CardClick;
  lblNome.Transparent := True;
  lblNome.AutoSize := False;
  lblNome.Width := Self.Width - 30;
  lblNome.WordWrap := True;
  Inc(Y, 25);

  // Categoria
  lblCategoria := TLabel.Create(Self);
  lblCategoria.Parent := Self;
  lblCategoria.Left := 15;
  lblCategoria.Top := Y;
  lblCategoria.Caption := '🏷️ ' + FCategoria;
  lblCategoria.Font.Name := 'Segoe UI';
  lblCategoria.Font.Size := 8;
  lblCategoria.Font.Color := clBlack;
  lblCategoria.Cursor := crHandPoint;
  lblCategoria.OnClick := CardClick;
  lblCategoria.Transparent := True;
  Inc(Y, 18);

  // Descrição
  lblDescricao := TLabel.Create(Self);
  lblDescricao.Parent := Self;
  lblDescricao.Left := 15;
  lblDescricao.Top := Y;
  if Length(FDescricao) > 60 then
    lblDescricao.Caption := Copy(FDescricao, 1, 60) + '...'
  else
    lblDescricao.Caption := FDescricao;
  lblDescricao.Font.Name := 'Segoe UI';
  lblDescricao.Font.Size := 8;
  lblDescricao.Font.Color := clBlack;
  lblDescricao.Cursor := crHandPoint;
  lblDescricao.OnClick := CardClick;
  lblDescricao.AutoSize := False;
  lblDescricao.Width := Self.Width - 30;
  lblDescricao.WordWrap := True;
  lblDescricao.Transparent := True;
  Inc(Y, 35);

  // Preço
  lblPreco := TLabel.Create(Self);
  lblPreco.Parent := Self;
  lblPreco.Left := 15;
  lblPreco.Top := Y;
  lblPreco.Caption := 'R$ ' + FormatFloat('#,##0.00', FPreco);
  lblPreco.Font.Name := 'Segoe UI';
  lblPreco.Font.Size := 12;
  lblPreco.Font.Style := [fsBold];
  lblPreco.Font.Color := $00517CFF; // Laranja
  lblPreco.Cursor := crHandPoint;
  lblPreco.OnClick := CardClick;
  lblPreco.Transparent := True;

  // Badge de disponibilidade
  pStatus := TPanel.Create(Self);
  pStatus.Parent := Self;
  pStatus.Width := 90;
  pStatus.Height := 25;
  pStatus.Top := 10;
  pStatus.Left := Self.Width - pStatus.Width - 10;
  pStatus.Anchors := [akTop, akRight];
  pStatus.BevelOuter := bvNone;
  pStatus.Font.Name := 'Segoe UI';
  pStatus.Font.Size := 8;
  pStatus.Font.Style := [fsBold];
  pStatus.Cursor := crHandPoint;
  pStatus.OnClick := CardClick;

  if FDisponivel then
  begin
    pStatus.Caption := 'DISPONÍVEL';
    pStatus.Color := $00FF6600; // Laranja vibrante
    pStatus.Font.Color := clBlack;
  end
  else
  begin
    pStatus.Caption := 'INDISPONÍVEL';
    pStatus.Color := $00CCCCCC; // Cinza
    pStatus.Font.Color := clBlack;
  end;
end;

procedure TProdutoCard.CardClick(Sender: TObject);
begin
  if FDisponivel and Assigned(FOnProdutoSelecionado) then
    FOnProdutoSelecionado(FIdProduto, FNomeProduto, FPreco);
end;

procedure TProdutoCard.CardMouseEnter(Sender: TObject);
begin
  if FDisponivel then
    Self.Color := clSilver
  else
    Self.Color := clWhite;
end;

procedure TProdutoCard.CardMouseLeave(Sender: TObject);
begin
  Self.Color := clWhite;
end;

{ TProdutoViewHelper }

// ============ MÉTODOS EXISTENTES ============

class function TProdutoViewHelper.FormatPreco(Valor: Currency): string;
begin
  Result := FormatFloat('#,##0.00', Valor);
end;

class function TProdutoViewHelper.ParsePreco(const Texto: string): Currency;
var
  TextoLimpo: string;
begin
  TextoLimpo := StringReplace(Texto, '.', '', [rfReplaceAll]);
  TextoLimpo := StringReplace(TextoLimpo, 'R$', '', [rfReplaceAll]);
  TextoLimpo := Trim(TextoLimpo);

  if TextoLimpo = '' then
    Result := 0
  else
  begin
    try
      Result := StrToCurr(TextoLimpo);
    except
      Result := 0;
    end;
  end;
end;

class procedure TProdutoViewHelper.PopularCategoriasProduto(ComboBox: TComboBox);
var
  Qr: TFDQuery;
begin
  ComboBox.Clear;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text := 'SELECT id_categoria, nome_categoria FROM categorias_produtos ORDER BY nome_categoria';
    Qr.Open;

    while not Qr.Eof do
    begin
      ComboBox.Items.AddObject(
        Qr.FieldByName('nome_categoria').AsString,
        TObject(Qr.FieldByName('id_categoria').AsInteger)
      );
      Qr.Next;
    end;

    if ComboBox.Items.Count > 0 then
      ComboBox.ItemIndex := 0;
  finally
    Qr.Free;
  end;
end;

class procedure TProdutoViewHelper.PreencherMemTableProdutos(
  MemTable: TFDMemTable; Produtos: TObjectList<TProduto>);
var
  Produto: TProduto;
begin
  MemTable.Close;
  MemTable.FieldDefs.Clear;

  MemTable.FieldDefs.Add('id_produto', ftInteger);
  MemTable.FieldDefs.Add('nome_prod', ftString, 255);
  MemTable.FieldDefs.Add('desc_prod', ftString, 500);
  MemTable.FieldDefs.Add('categoria', ftString, 100);
  MemTable.FieldDefs.Add('preco_custo', ftCurrency);
  MemTable.FieldDefs.Add('preco_venda', ftCurrency);
  MemTable.FieldDefs.Add('disponivel_venda', ftBoolean);
  MemTable.FieldDefs.Add('id_comercio', ftInteger);

  MemTable.CreateDataSet;

  for Produto in Produtos do
  begin
    MemTable.Append;
    MemTable.FieldByName('id_produto').AsInteger := Produto.IdProduto;
    MemTable.FieldByName('nome_prod').AsString := Produto.NomeProd;
    MemTable.FieldByName('desc_prod').AsString := Produto.DescProd;
    MemTable.FieldByName('categoria').AsString := Produto.Categoria;
    MemTable.FieldByName('preco_custo').AsCurrency := Produto.PrecoCusto;
    MemTable.FieldByName('preco_venda').AsCurrency := Produto.PrecoVenda;
    MemTable.FieldByName('disponivel_venda').AsBoolean := Produto.DisponivelVenda;
    MemTable.FieldByName('id_comercio').AsInteger := Produto.IdComercio;
    MemTable.Post;
  end;

  MemTable.First;
end;

// ============ NOVOS MÉTODOS PARA CARDS ============

class function TProdutoViewHelper.BuscarCategoriasPorComercio(IdComercio: Integer): TStringList;
var
  Qr: TFDQuery;
begin
  Result := TStringList.Create;
  Result.Duplicates := dupIgnore;
  Result.Sorted := True;

  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text :=
      'SELECT DISTINCT cp.nome_categoria as categoria ' +
      'FROM categorias_produtos cp ' +
      'INNER JOIN produtos p ON p.id_categoria = cp.id_categoria ' +
      'WHERE p.id_comercio = :id_comercio ' +
      '  AND p.disponivel_venda = true ' +
      'ORDER BY cp.nome_categoria';
    Qr.ParamByName('id_comercio').AsInteger := IdComercio;
    Qr.Open;

    while not Qr.Eof do
    begin
      Result.Add(Trim(Qr.FieldByName('categoria').AsString));
      Qr.Next;
    end;
  finally
    Qr.Free;
  end;
end;

class function TProdutoViewHelper.BuscarProdutosPorComercio(
  IdComercio: Integer; const Categoria: string): TObjectList<TProduto>;
var
  Qr: TFDQuery;
  Produto: TProduto;
begin
  Result := TObjectList<TProduto>.Create(True);
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT p.id_produto, p.nome_prod, p.desc_prod, p.preco_prod,');
    Qr.SQL.Add('       p.disponivel_venda, cp.nome_categoria as categoria');
    Qr.SQL.Add('FROM produtos p');
    Qr.SQL.Add('INNER JOIN categorias_produtos cp ON p.id_categoria = cp.id_categoria');
    Qr.SQL.Add('WHERE p.id_comercio = :id_comercio');

    if (Trim(Categoria) <> '') and (Categoria <> 'Todos') then
    begin
      Qr.SQL.Add('AND cp.nome_categoria = :categoria');
      Qr.ParamByName('categoria').AsString := Categoria;
    end;

    Qr.SQL.Add('ORDER BY p.disponivel_venda DESC, p.nome_prod');
    Qr.ParamByName('id_comercio').AsInteger := IdComercio;
    Qr.Open;

    while not Qr.Eof do
    begin
      Produto := TProduto.Create;
      try
        Produto.IdProduto := Qr.FieldByName('id_produto').AsInteger;
        Produto.NomeProd := Qr.FieldByName('nome_prod').AsString;
        Produto.DescProd := Qr.FieldByName('desc_prod').AsString;
        Produto.PrecoVenda := Qr.FieldByName('preco_prod').AsCurrency;
        Produto.DisponivelVenda := Qr.FieldByName('disponivel_venda').AsBoolean;
        Produto.Categoria := Qr.FieldByName('categoria').AsString;

        Result.Add(Produto);
      except
        Produto.Free;
        raise;
      end;

      Qr.Next;
    end;
  finally
    Qr.Free;
  end;
end;

class procedure TProdutoViewHelper.PopularScrollBoxCategoriasProduto(
  ScrollBox: TScrollBox;
  IdComercio: Integer;
  OnCategoriaClick: TNotifyEvent);
var
  Categorias: TStringList;
  Panel: TPanel;
  PosX: Integer;
  i: Integer;
  FormOwner: TComponent;
begin
  if not Assigned(ScrollBox) then
    raise Exception.Create('ScrollBox não pode ser nil');

  // Pegar o Form como owner
  FormOwner := ScrollBox;
  while Assigned(FormOwner) and not (FormOwner is TForm) do
    FormOwner := FormOwner.Owner;

  if not Assigned(FormOwner) then
    FormOwner := ScrollBox;

  // Limpar painéis existentes
  for i := ScrollBox.ControlCount - 1 downto 0 do
  begin
    if ScrollBox.Controls[i] is TPanel then
      ScrollBox.Controls[i].Free;
  end;

  // Buscar categorias do banco
  Categorias := BuscarCategoriasPorComercio(IdComercio);
  try
    PosX := 10;

    // Adicionar chip "Todos" primeiro
    Panel := TPanel.Create(FormOwner);
    Panel.Parent := ScrollBox;
    Panel.Left := PosX;
    Panel.Top := 5;
    Panel.Height := 40;
    Panel.Width := 100;
    Panel.Caption := 'Todos';
    Panel.BevelOuter := bvSpace;
    Panel.Color := $00517CFF; // Laranja vibrante - começa selecionado
    Panel.Font.Name := 'Segoe UI';
    Panel.Font.Size := 10;
    Panel.Font.Style := [fsBold];
    Panel.Font.Color := clWhite;
    Panel.Cursor := crHandPoint;
    Panel.Tag := 0; // Tag 0 = "Todos"
    Panel.OnClick := OnCategoriaClick;
    Inc(PosX, Panel.Width + 10);

    // Adicionar chips das categorias reais
    for i := 0 to Categorias.Count - 1 do
    begin
      Panel := TPanel.Create(FormOwner);
      Panel.Parent := ScrollBox;
      Panel.Left := PosX;
      Panel.Top := 5;
      Panel.Height := 40;
      Panel.Width := 140;
      Panel.Caption := Categorias[i];
      Panel.BevelOuter := bvLowered;
      Panel.Color := $00517CFF;
      Panel.Font.Name := 'Segoe UI';
      Panel.Font.Size := 10;
      Panel.Font.Style := [fsBold];
      Panel.Font.Color := clWhite;
      Panel.Cursor := crHandPoint;
      Panel.Tag := i + 1;
      Panel.Hint := Categorias[i];
      Panel.OnClick := OnCategoriaClick;

      Inc(PosX, Panel.Width + 10);
    end;

  finally
    Categorias.Free;
  end;
end;

class procedure TProdutoViewHelper.PopularScrollBoxProdutos(
  ScrollBox: TScrollBox;
  IdComercio: Integer;
  const Categoria: string;
  OnProdutoClick: TProdutoSelecionadoEvent);
var
  Produtos: TObjectList<TProduto>;
  Produto: TProduto;
  Card: TProdutoCard;
  PosX, PosY: Integer;
  i, CardsPerRow: Integer;
  FormOwner: TComponent;
  CardWidth, CardSpacing: Integer;
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
    if ScrollBox.Controls[i] is TProdutoCard then
      ScrollBox.Controls[i].Free;
  end;

  // Buscar produtos do banco
  Produtos := BuscarProdutosPorComercio(IdComercio, Categoria);
  try
    if Produtos.Count = 0 then
    begin
      // Exibir mensagem de nenhum produto
      Card := TProdutoCard.CreateCard(
        FormOwner,
        0,
        '😕 Nenhum produto encontrado',
        'Não há produtos disponíveis nesta categoria',
        '',
        0,
        False
      );
      Card.Parent := ScrollBox;
      Card.ConfigurarVisual;
      Card.Left := 10;
      Card.Top := 10;
      Exit;
    end;

    CardWidth := 280;
    CardSpacing := 15;
    CardsPerRow := (ScrollBox.ClientWidth - CardSpacing) div (CardWidth + CardSpacing);
    if CardsPerRow < 1 then CardsPerRow := 1;

    PosX := CardSpacing;
    PosY := CardSpacing;

    for i := 0 to Produtos.Count - 1 do
    begin
      Produto := Produtos[i];

      Card := TProdutoCard.CreateCard(
        FormOwner,
        Produto.IdProduto,
        Produto.NomeProd,
        Produto.DescProd,
        Produto.Categoria,
        Produto.PrecoVenda,
        Produto.DisponivelVenda
      );

      Card.Parent := ScrollBox;
      Card.ConfigurarVisual;
      Card.Left := PosX;
      Card.Top := PosY;
      Card.OnProdutoSelecionado := OnProdutoClick;

      // Calcular posição do próximo card
      if ((i + 1) mod CardsPerRow = 0) then
      begin
        // Próxima linha
        PosX := CardSpacing;
        Inc(PosY, Card.Height + CardSpacing);
      end
      else
      begin
        // Próxima coluna
        Inc(PosX, Card.Width + CardSpacing);
      end;
    end;

  finally
    Produtos.Free;
  end;
end;

end.
