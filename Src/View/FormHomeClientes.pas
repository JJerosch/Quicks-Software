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
    procedure PopularLista;
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
  Qr.Connection := DM.FDConn;
  Qr.SQL.Clear;
  Qr.SQL.Text := 'SELECT id_comercio, nome_comercio, descricao FROM comercios WHERE ativo = true';
  PopularLista;
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

procedure TFormHomeC.PopularLista;
//var
//  Item: TListViewItem;
//  Qr: TFDQuery; // A query deve ser criada e destruída aqui dentro
begin
//  // 1. Cria a Query
//  Qr := TFDQuery.Create(nil);
//  try
//    Qr.Connection := DM.FDConn; // Usa a conexão do seu DataModule
//    Qr.SQL.Text := 'SELECT id_comercio, nome_comercio, descricao FROM comercios WHERE ativo = true';
//
//    // 2. Limpa a lista antes de adicionar novos itens
//    lvMain.Items.Clear;
//
//    // 3. Abre a query
//    try
//      Qr.Open;
//    except
//      on E: Exception do
//      begin
//        ShowMessage('Erro ao buscar comércios: ' + E.Message);
//        Exit; // Sai da procedure se não conseguir conectar
//      end;
//    end;
//
//    // 4. Loop para popular o ListView
//    lvMain.BeginUpdate; // Otimização: pausa a atualização visual
//    try
//      while not Qr.Eof do
//      begin
//        // Adiciona um novo item ao ListView
//        Item := lvMain.Items.Add;
//
//        // Define o texto principal (Nome do Comércio)
//        Item.Text := Qr.FieldByName('nome_comercio').AsString;
//
//        // (Opcional) Define um sub-item (Descrição)
//        // Para isso, seu lvMain.ViewStyle precisa ser vsReport e você precisa ter colunas
//        // Item.SubItems.Add(Qr.FieldByName('descricao').AsString);
//
//        // !! ESTA É A PARTE MAIS IMPORTANTE !!
//        // Guardamos o ID do comércio (Integer) dentro da propriedade 'Data' do item
//        // Estamos "anexando" o ID ao item visual da lista.
//        Item.Data := TObject(NativeInt(Qr.FieldByName('id_comercio').AsInteger));
//
//        // Move para o próximo registro
//        Qr.Next;
//      end;
//    finally
//      lvMain.EndUpdate; // Retoma a atualização visual
//    end;
//
//  finally
//    Qr.Free; // 5. Libera a memória da Query
//  end;
end;

end.
