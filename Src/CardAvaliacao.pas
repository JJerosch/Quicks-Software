unit CardAvaliacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Objects, FMX.Layouts, FMX.StdCtrls, FMX.Controls.Presentation,
  uConn, FireDAC.Comp.Client;

type
  TfrmAvaliacaoRapida = class(TForm)
  private
    FNotaSelecionada: Integer;
    FIdCliente: Integer;
    FIdComercio: Integer;

    rectFundo: TRectangle;
    rectPopup: TRectangle;
    lblTitulo: TLabel;
    lblComercio: TLabel;
    lblMensagem: TLabel;
    btnFechar: TLabel;
    layoutEstrelas: TLayout;
    imgEstrelas: array[1..5] of TImage;

    procedure CriarComponentes;
    procedure CriarEstrelas;
    procedure ConfigurarEstrelas;
    procedure HighlightEstrelas(Ate: Integer);
    procedure ResetEstrelas;

    procedure rectFundoClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure imgEstrelaClick(Sender: TObject);
    procedure imgEstrelaMouseEnter(Sender: TObject);
    procedure imgEstrelaMouseLeave(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    class procedure Mostrar(AIdCliente, AIdComercio: Integer;
      ANomeComercio: string);
  end;

implementation

{ TfrmAvaliacaoRapida }

constructor TfrmAvaliacaoRapida.Create(AOwner: TComponent);
begin
  inherited CreateNew(AOwner);  // CreateNew pois não tem .fmx

  Self.BorderStyle := TFmxFormBorderStyle.None;
  Self.Fill.Kind := TBrushKind.None;
  Self.Transparency := True;
  Self.Width := 360;
  Self.Height := 480;
  Self.Position := TFormPosition.ScreenCenter;

  FNotaSelecionada := 0;
  CriarComponentes;
  CriarEstrelas;
  ConfigurarEstrelas;
end;

procedure TfrmAvaliacaoRapida.CriarComponentes;
begin
  // Fundo escuro semi-transparente
  rectFundo := TRectangle.Create(Self);
  rectFundo.Parent := Self;
  rectFundo.Align := TAlignLayout.Client;
  rectFundo.Fill.Color := $99000000;
  rectFundo.Stroke.Kind := TBrushKind.None;
  rectFundo.OnClick := rectFundoClick;

  // Popup branco centralizado
  rectPopup := TRectangle.Create(Self);
  rectPopup.Parent := rectFundo;
  rectPopup.Align := TAlignLayout.Center;
  rectPopup.Width := 300;
  rectPopup.Height := 200;
  rectPopup.Fill.Color := TAlphaColorRec.White;
  rectPopup.Stroke.Kind := TBrushKind.None;
  rectPopup.XRadius := 15;
  rectPopup.YRadius := 15;

  // Botão Fechar (X)
  btnFechar := TLabel.Create(Self);
  btnFechar.Parent := rectPopup;
  btnFechar.Align := TAlignLayout.Top;
  btnFechar.Height := 30;
  btnFechar.Margins.Top := 5;
  btnFechar.Margins.Right := 15;
  btnFechar.Text := '✕';
  btnFechar.TextSettings.Font.Size := 18;
  btnFechar.TextSettings.FontColor := $FF999999;
  btnFechar.TextSettings.HorzAlign := TTextAlign.Trailing;
  btnFechar.HitTest := True;
  btnFechar.Cursor := crHandPoint;
  btnFechar.OnClick := btnFecharClick;

  // Título
  lblTitulo := TLabel.Create(Self);
  lblTitulo.Parent := rectPopup;
  lblTitulo.Align := TAlignLayout.Top;
  lblTitulo.Height := 25;
  lblTitulo.Margins.Left := 15;
  lblTitulo.Margins.Right := 15;
  lblTitulo.Text := 'Avalie este comércio';
  lblTitulo.TextSettings.Font.Size := 16;
  lblTitulo.TextSettings.Font.Style := [TFontStyle.fsBold];
  lblTitulo.TextSettings.FontColor := $FF333333;
  lblTitulo.TextSettings.HorzAlign := TTextAlign.Center;

  // Nome do comércio
  lblComercio := TLabel.Create(Self);
  lblComercio.Parent := rectPopup;
  lblComercio.Align := TAlignLayout.Top;
  lblComercio.Height := 20;
  lblComercio.Margins.Left := 15;
  lblComercio.Margins.Right := 15;
  lblComercio.Text := 'Nome do Comércio';
  lblComercio.TextSettings.Font.Size := 14;
  lblComercio.TextSettings.FontColor := $FF666666;
  lblComercio.TextSettings.HorzAlign := TTextAlign.Center;

  // Layout das estrelas
  layoutEstrelas := TLayout.Create(Self);
  layoutEstrelas.Parent := rectPopup;
  layoutEstrelas.Align := TAlignLayout.Center;
  layoutEstrelas.Width := 260;
  layoutEstrelas.Height := 50;

  // Mensagem de feedback
  lblMensagem := TLabel.Create(Self);
  lblMensagem.Parent := rectPopup;
  lblMensagem.Align := TAlignLayout.Bottom;
  lblMensagem.Height := 30;
  lblMensagem.Margins.Left := 15;
  lblMensagem.Margins.Right := 15;
  lblMensagem.Margins.Bottom := 15;
  lblMensagem.Text := '';
  lblMensagem.TextSettings.Font.Size := 12;
  lblMensagem.TextSettings.FontColor := $FF4CAF50;  // Verde
  lblMensagem.TextSettings.HorzAlign := TTextAlign.Center;
  lblMensagem.Visible := False;
end;

procedure TfrmAvaliacaoRapida.CriarEstrelas;
var
  i: Integer;
  Estrela: TImage;
begin
  for i := 1 to 5 do
  begin
    Estrela := TImage.Create(Self);
    Estrela.Parent := layoutEstrelas;
    Estrela.Position.X := (i - 1) * 52;
    Estrela.Position.Y := 0;
    Estrela.Width := 45;
    Estrela.Height := 45;
    Estrela.Tag := i;
    Estrela.HitTest := True;
    Estrela.Cursor := crHandPoint;
    Estrela.OnClick := imgEstrelaClick;
    Estrela.OnMouseEnter := imgEstrelaMouseEnter;
    Estrela.OnMouseLeave := imgEstrelaMouseLeave;

    // Carrega a imagem da estrela do Assets
    // Ajuste o caminho conforme seu projeto
    Estrela.Bitmap.LoadFromFile('Assets\star.png');

    imgEstrelas[i] := Estrela;
  end;
end;

procedure TfrmAvaliacaoRapida.ConfigurarEstrelas;
var
  i: Integer;
begin
  for i := 1 to 5 do
    imgEstrelas[i].Opacity := 0.3;
end;

procedure TfrmAvaliacaoRapida.HighlightEstrelas(Ate: Integer);
var
  i: Integer;
begin
  for i := 1 to 5 do
  begin
    if i <= Ate then
      imgEstrelas[i].Opacity := 1.0
    else
      imgEstrelas[i].Opacity := 0.3;
  end;
end;

procedure TfrmAvaliacaoRapida.ResetEstrelas;
begin
  if FNotaSelecionada > 0 then
    HighlightEstrelas(FNotaSelecionada)
  else
    HighlightEstrelas(0);
end;

procedure TfrmAvaliacaoRapida.imgEstrelaMouseEnter(Sender: TObject);
begin
  HighlightEstrelas(TImage(Sender).Tag);
end;

procedure TfrmAvaliacaoRapida.imgEstrelaMouseLeave(Sender: TObject);
begin
  ResetEstrelas;
end;

procedure TfrmAvaliacaoRapida.imgEstrelaClick(Sender: TObject);
var
  Nota: Integer;
  Qry: TFDQuery;
begin
  Nota := TImage(Sender).Tag;
  FNotaSelecionada := Nota;
  HighlightEstrelas(Nota);

  // Salva no banco
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := DM.FDConn;  // Ajuste para sua conexão

    // INSERT ou UPDATE se já existe
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

  // Feedback visual
  lblMensagem.Text := 'Obrigado! Você avaliou com ' + Nota.ToString + ' estrela(s)';
  lblMensagem.Visible := True;

  // Fecha após 1 segundo
  TThread.CreateAnonymousThread(
    procedure
    begin
      Sleep(1000);
      TThread.Synchronize(nil,
        procedure
        begin
          Self.Close;
        end);
    end).Start;
end;

procedure TfrmAvaliacaoRapida.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAvaliacaoRapida.rectFundoClick(Sender: TObject);
begin
  Close;
end;

class procedure TfrmAvaliacaoRapida.Mostrar(AIdCliente, AIdComercio: Integer;
  ANomeComercio: string);
var
  Form: TfrmAvaliacaoRapida;
begin
  Form := TfrmAvaliacaoRapida.Create(nil);
  try
    Form.FIdCliente := AIdCliente;
    Form.FIdComercio := AIdComercio;
    Form.lblComercio.Text := ANomeComercio;
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

end.
