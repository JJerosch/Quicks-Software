unit CardAvaliacao;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Comp.Client;

type
  TfrmAvaliacaoRapida = class(TForm)
  private
    FIdCliente: Integer;
    FIdComercio: Integer;
    FNotaSelecionada: Integer;

    pHeader: TPanel;
    lblTitulo: TLabel;
    lblSubtitulo: TLabel;
    pEstrelas: TPanel;
    lblEstrelas: array[1..5] of TLabel;
    btnCancelar: TButton;

    procedure CriarComponentes;
    procedure CriarEstrelas;
    procedure HighlightEstrelas(Ate: Integer);
    procedure SalvarAvaliacao(Nota: Integer);

    procedure btnCancelarClick(Sender: TObject);
    procedure lblEstrelaClick(Sender: TObject);
    procedure lblEstrelaMouseEnter(Sender: TObject);
    procedure lblEstrelaMouseLeave(Sender: TObject);
  public
    constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); override;
    class procedure Mostrar(AIdCliente, AIdComercio: Integer; const ANomeComercio: string);
  end;

implementation

uses
  uConn, Vcl.Dialogs;

{ TfrmAvaliacaoRapida }

constructor TfrmAvaliacaoRapida.CreateNew(AOwner: TComponent; Dummy: Integer);
begin
  inherited CreateNew(AOwner, Dummy);

  Self.BorderStyle := bsNone;
  Self.Position := poScreenCenter;
  Self.Width := 300;
  Self.Height := 180;
  Self.Color := clWhite;

  FNotaSelecionada := 0;
  CriarComponentes;
  CriarEstrelas;
end;

procedure TfrmAvaliacaoRapida.CriarComponentes;
begin
  // Header laranja
  pHeader := TPanel.Create(Self);
  pHeader.Parent := Self;
  pHeader.Align := alTop;
  pHeader.Height := 40;
  pHeader.BevelOuter := bvNone;
  pHeader.Color := $004080FF;  // Laranja
  pHeader.ParentBackground := False;

  // Ícone estrela no header
  with TLabel.Create(Self) do
  begin
    Parent := pHeader;
    Left := 15;
    Top := 10;
    Caption := '★';
    Font.Size := 14;
    Font.Color := clWhite;
    Transparent := True;
  end;

  // Título
  lblTitulo := TLabel.Create(Self);
  lblTitulo.Parent := pHeader;
  lblTitulo.Left := 40;
  lblTitulo.Top := 12;
  lblTitulo.Caption := 'Avaliar Comércio';
  lblTitulo.Font.Name := 'Segoe UI';
  lblTitulo.Font.Size := 11;
  lblTitulo.Font.Style := [fsBold];
  lblTitulo.Font.Color := clWhite;
  lblTitulo.Transparent := True;

  // Subtítulo (nome do comércio)
  lblSubtitulo := TLabel.Create(Self);
  lblSubtitulo.Parent := Self;
  lblSubtitulo.Left := 15;
  lblSubtitulo.Top := 55;
  lblSubtitulo.Caption := 'Nome do comércio';
  lblSubtitulo.Font.Name := 'Segoe UI';
  lblSubtitulo.Font.Size := 10;
  lblSubtitulo.Font.Color := $00666666;
  lblSubtitulo.Transparent := True;

  // Painel das estrelas
  pEstrelas := TPanel.Create(Self);
  pEstrelas.Parent := Self;
  pEstrelas.Left := 20;
  pEstrelas.Top := 85;
  pEstrelas.Width := 260;
  pEstrelas.Height := 45;
  pEstrelas.BevelOuter := bvNone;
  pEstrelas.Color := clWhite;
  pEstrelas.ParentBackground := False;

  // Botão Cancelar
  btnCancelar := TButton.Create(Self);
  btnCancelar.Parent := Self;
  btnCancelar.Left := 100;
  btnCancelar.Top := 140;
  btnCancelar.Width := 100;
  btnCancelar.Height := 28;
  btnCancelar.Caption := 'Cancelar';
  btnCancelar.Font.Name := 'Segoe UI';
  btnCancelar.Font.Size := 9;
  btnCancelar.OnClick := btnCancelarClick;
end;

procedure TfrmAvaliacaoRapida.CriarEstrelas;
var
  i: Integer;
  Estrela: TLabel;
begin
  for i := 1 to 5 do
  begin
    Estrela := TLabel.Create(Self);
    Estrela.Parent := pEstrelas;
    Estrela.Left := (i - 1) * 50;
    Estrela.Top := 0;
    Estrela.Caption := '★';
    Estrela.Font.Size := 26;
    Estrela.Font.Color := $00D0D0D0;
    Estrela.Tag := i;
    Estrela.Cursor := crHandPoint;
    Estrela.Transparent := True;
    Estrela.OnClick := lblEstrelaClick;
    Estrela.OnMouseEnter := lblEstrelaMouseEnter;
    Estrela.OnMouseLeave := lblEstrelaMouseLeave;

    lblEstrelas[i] := Estrela;
  end;
end;

procedure TfrmAvaliacaoRapida.HighlightEstrelas(Ate: Integer);
var
  i: Integer;
begin
  for i := 1 to 5 do
  begin
    if i <= Ate then
      lblEstrelas[i].Font.Color := $000080FF  // Laranja
    else
      lblEstrelas[i].Font.Color := $00D0D0D0;  // Cinza
  end;
end;

procedure TfrmAvaliacaoRapida.lblEstrelaMouseEnter(Sender: TObject);
begin
  HighlightEstrelas(TLabel(Sender).Tag);
end;

procedure TfrmAvaliacaoRapida.lblEstrelaMouseLeave(Sender: TObject);
begin
  HighlightEstrelas(FNotaSelecionada);
end;

procedure TfrmAvaliacaoRapida.lblEstrelaClick(Sender: TObject);
var
  Nota: Integer;
begin
  Nota := TLabel(Sender).Tag;
  FNotaSelecionada := Nota;
  HighlightEstrelas(Nota);

  try
    SalvarAvaliacao(Nota);
    Self.Close;
  except
    on E: Exception do
      ShowMessage('Erro ao salvar: ' + E.Message);
  end;
end;

procedure TfrmAvaliacaoRapida.SalvarAvaliacao(Nota: Integer);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := DM.FDConn;

    Qry.SQL.Text :=
      'INSERT INTO avaliacoes (id_cliente, id_comercio, nota, data_avaliacao) ' +
      'VALUES (:id_cliente, :id_comercio, :nota, CURRENT_TIMESTAMP) ' +
      'ON CONFLICT (id_cliente, id_comercio) ' +
      'DO UPDATE SET nota = :nota, data_avaliacao = CURRENT_TIMESTAMP';

    Qry.ParamByName('id_cliente').AsInteger := FIdCliente;
    Qry.ParamByName('id_comercio').AsInteger := FIdComercio;
    Qry.ParamByName('nota').AsInteger := Nota;
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

procedure TfrmAvaliacaoRapida.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

class procedure TfrmAvaliacaoRapida.Mostrar(AIdCliente, AIdComercio: Integer;
  const ANomeComercio: string);
var
  Form: TfrmAvaliacaoRapida;
begin
  Form := TfrmAvaliacaoRapida.CreateNew(nil);
  try
    Form.FIdCliente := AIdCliente;
    Form.FIdComercio := AIdComercio;
    Form.lblSubtitulo.Caption := ANomeComercio;
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

end.
