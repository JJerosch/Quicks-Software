unit CategoriaHelper;

interface

uses
  System.SysUtils, System.Classes, System.Types,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  System.Generics.Collections,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.Stan.Intf,
  Data.DB, uConn;

type
  // Evento para notificar quando uma categoria é clicada
  TCategoriaSelecionadaEvent = procedure(const Categoria: string) of object;

  // Chip de categoria (painel clicável)
  TCategoriaChip = class(TPanel)
  private
    FCategoria: string;
    FSelecionado: Boolean;
    FOnCategoriaSelecionada: TCategoriaSelecionadaEvent;
    procedure SetSelecionado(const Value: Boolean);
    procedure ChipClick(Sender: TObject);
  public
    constructor CreateChip(AOwner: TComponent; const ACategoria: string);
    procedure ConfigurarVisual; // ⭐ NOVO
    property Categoria: string read FCategoria;
    property Selecionado: Boolean read FSelecionado write SetSelecionado;
    property OnCategoriaSelecionada: TCategoriaSelecionadaEvent read FOnCategoriaSelecionada write FOnCategoriaSelecionada;
  end;

  // Helper para gerenciar categorias
  TCategoriaHelper = class
  public
    class function BuscarCategoriasDistintas: TStringList;
    class procedure PopularScrollBoxCategorias(
      ScrollBox: TScrollBox;
      OnCategoriaClick: TCategoriaSelecionadaEvent);
    class procedure DeselecionarTodas(ScrollBox: TScrollBox);
    class procedure SelecionarCategoria(ScrollBox: TScrollBox; const Categoria: string);
  end;

implementation

{ TCategoriaChip }

constructor TCategoriaChip.CreateChip(AOwner: TComponent; const ACategoria: string);
var
  lblTexto: TLabel;
  LarguraTexto: Integer;
begin
  inherited Create(AOwner);

  if not Assigned(AOwner) then
    raise Exception.Create('Owner não pode ser nil ao criar TCategoriaChip');

  FCategoria := ACategoria;
  FSelecionado := False;

  // ⭐ NÃO configurar propriedades visuais aqui - será feito depois de definir Parent
  Self.Height := 40;
  Self.Width := 100; // Temporário
end;

procedure TCategoriaChip.ConfigurarVisual;
var
  lblTexto: TLabel;
  LarguraTexto: Integer;
begin
  // ⭐ Configurar propriedades visuais DEPOIS que o Parent foi definido
  Self.ParentBackground := False;
  Self.BevelOuter := bvNone;
  Self.Color := clWhite;
  Self.Cursor := crHandPoint;
  Self.ShowHint := True;
  Self.Hint := 'Filtrar por ' + FCategoria;
  Self.OnClick := ChipClick;
  Self.BorderStyle := bsSingle;
  Self.ParentColor := False;

  // Label com o texto da categoria
  lblTexto := TLabel.Create(Self);
  lblTexto.Parent := Self;
  lblTexto.Caption := FCategoria;
  lblTexto.Font.Name := 'Segoe UI';
  lblTexto.Font.Size := 10;
  lblTexto.Font.Style := [fsBold];
  lblTexto.Font.Color := $00666666;
  lblTexto.Cursor := crHandPoint;
  lblTexto.OnClick := ChipClick;
  lblTexto.Transparent := True;
  lblTexto.Alignment := taCenter;
  lblTexto.Layout := tlCenter;
  lblTexto.Align := alClient;

  // Calcular largura baseada no texto
  lblTexto.AutoSize := True;
  LarguraTexto := lblTexto.Canvas.TextWidth(FCategoria);
  lblTexto.AutoSize := False;

  Self.Width := LarguraTexto + 40;
  if Self.Width < 100 then
    Self.Width := 100;
  if Self.Width > 200 then
    Self.Width := 200;
end;

procedure TCategoriaChip.ChipClick(Sender: TObject);
begin
  // Notificar que foi clicado
  if Assigned(FOnCategoriaSelecionada) then
    FOnCategoriaSelecionada(FCategoria);
end;

procedure TCategoriaChip.SetSelecionado(const Value: Boolean);
var
  lbl: TLabel;
  i: Integer;
begin
  FSelecionado := Value;

  if FSelecionado then
  begin
    // Estilo selecionado - laranja
    Self.Color := $00FF6600;

    // Atualizar cor da label
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
    // Estilo não selecionado - branco
    Self.Color := clWhite;

    // Atualizar cor da label
    for i := 0 to Self.ControlCount - 1 do
    begin
      if Self.Controls[i] is TLabel then
      begin
        lbl := TLabel(Self.Controls[i]);
        lbl.Font.Color := $00666666;
      end;
    end;
  end;
end;

{ TCategoriaHelper }

class function TCategoriaHelper.BuscarCategoriasDistintas: TStringList;
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
      'SELECT categoria ' +
      'FROM comercios ' +
      'ORDER BY categoria';
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

class procedure TCategoriaHelper.PopularScrollBoxCategorias(
  ScrollBox: TScrollBox;
  OnCategoriaClick: TCategoriaSelecionadaEvent);
var
  Categorias: TStringList;
  Chip: TCategoriaChip;
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

  // Limpar chips existentes
  for i := ScrollBox.ControlCount - 1 downto 0 do
  begin
    if ScrollBox.Controls[i] is TCategoriaChip then
      ScrollBox.Controls[i].Free;
  end;

  // Buscar categorias do banco
  Categorias := BuscarCategoriasDistintas;
  try
    PosX := 10;

    // Adicionar chip "Todos" primeiro
    Chip := TCategoriaChip.CreateChip(FormOwner, 'Todos');
    Chip.Parent := ScrollBox; // ⭐ Definir Parent ANTES de configurar visual
    Chip.ConfigurarVisual;    // ⭐ AGORA configurar visual
    Chip.Left := PosX;
    Chip.Top := 5;
    Chip.OnCategoriaSelecionada := OnCategoriaClick;
    Chip.Selecionado := True; // Começa selecionado
    Inc(PosX, Chip.Width + 10);

    // Adicionar chips das categorias reais
    for i := 0 to Categorias.Count - 1 do
    begin
      Chip := TCategoriaChip.CreateChip(FormOwner, Categorias[i]);
      Chip.Parent := ScrollBox; // ⭐ Definir Parent ANTES de configurar visual
      Chip.ConfigurarVisual;    // ⭐ AGORA configurar visual
      Chip.Left := PosX;
      Chip.Top := 5;
      Chip.OnCategoriaSelecionada := OnCategoriaClick;
      Chip.Selecionado := False;

      Inc(PosX, Chip.Width + 10);
    end;

  finally
    Categorias.Free;
  end;
end;

class procedure TCategoriaHelper.DeselecionarTodas(ScrollBox: TScrollBox);
var
  i: Integer;
  Chip: TCategoriaChip;
begin
  for i := 0 to ScrollBox.ControlCount - 1 do
  begin
    if ScrollBox.Controls[i] is TCategoriaChip then
    begin
      Chip := TCategoriaChip(ScrollBox.Controls[i]);
      Chip.Selecionado := False;
    end;
  end;
end;

class procedure TCategoriaHelper.SelecionarCategoria(ScrollBox: TScrollBox; const Categoria: string);
var
  i: Integer;
  Chip: TCategoriaChip;
begin
  for i := 0 to ScrollBox.ControlCount - 1 do
  begin
    if ScrollBox.Controls[i] is TCategoriaChip then
    begin
      Chip := TCategoriaChip(ScrollBox.Controls[i]);
      Chip.Selecionado := (Chip.Categoria = Categoria);
    end;
  end;
end;

end.
