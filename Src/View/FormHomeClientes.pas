unit FormHomeClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ComCtrls, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, uConn;

type
  TFormHomeC = class(TForm)
    pHomeBackground: TPanel;
    pBusca: TPanel;
    Image1: TImage;
    eBuscaMain: TEdit;
    scbxMain: TScrollBox;
    lvMain: TListView;
    pBarraMenuLeft: TPanel;
    iButton1: TImage;
    iButton2: TImage;
    iButton3: TImage;
    iButton4: TImage;
    iButtonLeave: TImage;
    lblButton1: TLabel;
    lblButton2: TLabel;
    lblButton3: TLabel;
    lblButton4: TLabel;
    iCarrinho: TImage;
    lblButton5: TLabel;
    lblQuantidadeCarrinho: TLabel;
    lblSair: TLabel;
    pEndereco: TPanel;
    pCategorias: TPanel;
    procedure iButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FIdUsuario: Integer;
    FNomeUsuario: String;
    // MUDANÇA 1: Procedure agora aceita um parâmetro TFDQuery
    procedure PopularLista(AQuery: TFDQuery);
  public
    property IdUsuario: Integer read FIdUsuario write FIdUsuario;
    property NomeUsuario: String read FNomeUsuario write FNomeUsuario;
  end;

var
  FormHomeC: TFormHomeC;

implementation

{$R *.dfm}

procedure TFormHomeC.FormShow(Sender: TObject);
var
  Qr: TFDQuery;
begin
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Text := 'SELECT id_comercio, nome_comercio, descricao FROM comercios WHERE ativo = true';

    // MUDANÇA 2: Passa a query (Qr) como parâmetro
    PopularLista(Qr);

  finally
    // MUDANÇA 3: Libera a query da memória após o uso
    Qr.Free;
  end;
end;

procedure TFormHomeC.iButton1Click(Sender: TObject);
begin
  if pBarraMenuLeft.Width = 57 then begin
    pBarraMenuLeft.Width := 225;
    pBarraMenuLeft.Height := 683;
  end else begin
    pBarraMenuLeft.Width := 57;
    pBarraMenuLeft.Height :=55;
  end;
end;

// MUDANÇA 4: Procedure agora usa o parâmetro 'AQuery'
procedure TFormHomeC.PopularLista(AQuery: TFDQuery);
var
  Item: TListViewItem;
  // MUDANÇA 5: A variável local 'Qr: TFDQuery' foi REMOVIDA
begin
  // Limpa a lista antes de adicionar novos itens
  lvMain.Items.Clear;

  // MUDANÇA 6: Não precisamos mais checar se a query está ativa,
  // pois acabamos de criá-la. Vamos direto para o Open.

  // Abre a query para buscar os dados
  try
    AQuery.Open; // Usa o parâmetro AQuery
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao conectar ao banco de dados: ' + E.Message);
      Exit; // Sai da procedure se não conseguir conectar
    end;
  end;

  // O 'try..finally' aqui é apenas para o BeginUpdate/EndUpdate
  try
    lvMain.BeginUpdate; // Otimização: pausa a atualização visual
    try
      // Loop enquanto não chegar ao fim dos registros
      while not AQuery.Eof do
      begin
        // 1. Adiciona um novo item ao ListView
        Item := lvMain.Items.Add;

        // 2. Define o texto principal do item
        Item.Text := AQuery.FieldByName('nome_comercio').AsString;

        // 3. (Opcional) Define detalhes adicionais
        Item.Detail := AQuery.FieldByName('descricao').AsString;

        // 4. (Opcional) Você pode guardar o ID para uso futuro
        Item.Data := TObject(NativeInt(AQuery.FieldByName('id_comercio').AsInteger));

        // 5. Move para o próximo registro
        AQuery.Next;
      end;
    finally
      lvMain.EndUpdate; // Retoma a atualização visual
    end;
  finally
    // MUDANÇA 7: NÃO fechamos a query aqui (AQuery.Close),
    // pois ela será destruída (Free) no FormShow.
  end;
end;

end.

