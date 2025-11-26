unit Avaliacao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Comp.Client;

type
  TAvaliacao = class
  private
    FId: Integer;
    FIdCliente: Integer;
    FIdComercio: Integer;
    FNota: Integer;
    FComentario: string;
    FDataAvaliacao: TDateTime;
  public
    property Id: Integer read FId write FId;
    property IdCliente: Integer read FIdCliente write FIdCliente;
    property IdComercio: Integer read FIdComercio write FIdComercio;
    property Nota: Integer read FNota write FNota;
    property Comentario: string read FComentario write FComentario;
    property DataAvaliacao: TDateTime read FDataAvaliacao write FDataAvaliacao;

    // Métodos
    class function Salvar(AConn: TFDConnection; AIdCliente, AIdComercio, ANota: Integer;
      AComentario: string = ''): Boolean;
    class function JaAvaliou(AConn: TFDConnection; AIdCliente, AIdComercio: Integer): Boolean;
    class function ObterMediaComercio(AConn: TFDConnection; AIdComercio: Integer): Double;
    class function ObterTotalAvaliacoes(AConn: TFDConnection; AIdComercio: Integer): Integer;
    class function ObterAvaliacaoCliente(AConn: TFDConnection; AIdCliente, AIdComercio: Integer): Integer;
  end;

implementation

class function TAvaliacao.Salvar(AConn: TFDConnection; AIdCliente, AIdComercio,
  ANota: Integer; AComentario: string): Boolean;
var
  Qry: TFDQuery;
begin
  Result := False;
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := AConn;

    // Usa INSERT OR REPLACE para atualizar se já existir
    Qry.SQL.Text :=
      'INSERT OR REPLACE INTO avaliacoes (id_cliente, id_comercio, nota, comentario, data_avaliacao) ' +
      'VALUES (:id_cliente, :id_comercio, :nota, :comentario, CURRENT_TIMESTAMP)';

    Qry.ParamByName('id_cliente').AsInteger := AIdCliente;
    Qry.ParamByName('id_comercio').AsInteger := AIdComercio;
    Qry.ParamByName('nota').AsInteger := ANota;
    Qry.ParamByName('comentario').AsString := AComentario;

    Qry.ExecSQL;
    Result := True;
  finally
    Qry.Free;
  end;
end;

class function TAvaliacao.JaAvaliou(AConn: TFDConnection; AIdCliente,
  AIdComercio: Integer): Boolean;
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := AConn;
    Qry.SQL.Text :=
      'SELECT 1 FROM avaliacoes WHERE id_cliente = :id_cliente AND id_comercio = :id_comercio';
    Qry.ParamByName('id_cliente').AsInteger := AIdCliente;
    Qry.ParamByName('id_comercio').AsInteger := AIdComercio;
    Qry.Open;
    Result := not Qry.IsEmpty;
  finally
    Qry.Free;
  end;
end;

class function TAvaliacao.ObterMediaComercio(AConn: TFDConnection;
  AIdComercio: Integer): Double;
var
  Qry: TFDQuery;
begin
  Result := 0;
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := AConn;
    Qry.SQL.Text :=
      'SELECT COALESCE(AVG(nota * 1.0), 0) as media FROM avaliacoes WHERE id_comercio = :id';
    Qry.ParamByName('id').AsInteger := AIdComercio;
    Qry.Open;
    Result := Qry.FieldByName('media').AsFloat;
  finally
    Qry.Free;
  end;
end;

class function TAvaliacao.ObterTotalAvaliacoes(AConn: TFDConnection;
  AIdComercio: Integer): Integer;
var
  Qry: TFDQuery;
begin
  Result := 0;
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := AConn;
    Qry.SQL.Text :=
      'SELECT COUNT(*) as total FROM avaliacoes WHERE id_comercio = :id';
    Qry.ParamByName('id').AsInteger := AIdComercio;
    Qry.Open;
    Result := Qry.FieldByName('total').AsInteger;
  finally
    Qry.Free;
  end;
end;

class function TAvaliacao.ObterAvaliacaoCliente(AConn: TFDConnection;
  AIdCliente, AIdComercio: Integer): Integer;
var
  Qry: TFDQuery;
begin
  Result := 0;
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := AConn;
    Qry.SQL.Text :=
      'SELECT nota FROM avaliacoes WHERE id_cliente = :id_cliente AND id_comercio = :id_comercio';
    Qry.ParamByName('id_cliente').AsInteger := AIdCliente;
    Qry.ParamByName('id_comercio').AsInteger := AIdComercio;
    Qry.Open;
    if not Qry.IsEmpty then
      Result := Qry.FieldByName('nota').AsInteger;
  finally
    Qry.Free;
  end;
end;

end.
