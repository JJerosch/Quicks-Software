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
var
//  Item: TListViewItem;
  Qr: TFDQuery;
 begin
//   // Limpa a lista antes de adicionar novos itens
//   lvMain.Items.Clear;
//
//   // Garante que a query esteja fechada antes de abrir
//   if Qr.Active then
//     Qr.Close;
//
//   // Abre a query para buscar os dados
//   try
//     Qr.Open;
//   except
//     on E: Exception do
//     begin
//       ShowMessage('Erro ao conectar ao banco de dados: ' + E.Message);
//       Exit; // Sai da procedure se não conseguir conectar
//     end;
//   end;
//   try
//     lvMain.BeginUpdate; // Otimização: pausa a atualização visual
//     try
//       // Loop enquanto não chegar ao fim dos registros
//       while not Qr.Eof do
//       begin
//         // 1. Adiciona um novo item ao ListView
//         Item := lvMain.Items.Add;
//
//         // 2. Define o texto principal do item
//         Item.Text := Qr.FieldByName('nome_comercio').AsString;
//
//         // 3. (Opcional) Define detalhes adicionais
//         // (Para isso, o ViewStyle do lvMain deve ser vsList, vsIcon, etc.)
//         Item.Detail := Qr.FieldByName('descricao').AsString;
//
//         // 4. (Opcional) Você pode guardar o ID para uso futuro
//         // (Convertemos o Integer para um TObject para guardar no .Data)
//         Item.Data := TObject(NativeInt(Qr.FieldByName('id_comercio').AsInteger));
//
//         // 5. Move para o próximo registro
//         Qr.Next;
//       end;
//     finally
//       lvMain.EndUpdate; // Retoma a atualização visual
//     end;
//   finally
//     Qr.Close; // Fecha a query
//   end;
 end;
end.
