unit CargosRepositoryCRUDAdmin;

interface

uses
  System.SysUtils, System.Generics.Collections, FireDAC.Comp.Client,
  FireDAC.Stan.Param, CargosModelCRUDAdmin, uConn;

type
  TCargoRepository = class
  public
    function ListarTodos: TObjectList<TCargo>;
    function BuscarPorId(IdCargo: Integer): TCargo;
    function CargoExiste(IdCargo: Integer): Boolean;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TCargoRepository }

constructor TCargoRepository.Create;
begin
  inherited Create;
end;

destructor TCargoRepository.Destroy;
begin
  inherited;
end;

function TCargoRepository.ListarTodos: TObjectList<TCargo>;
var
  Query: TFDQuery;
  Cargo: TCargo;
begin
  Result := TObjectList<TCargo>.Create(True);

  if not Assigned(DM) or not Assigned(DM.FDConn) then
    raise Exception.Create('Conexão com banco de dados não disponível.');

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM.FDConn;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT id_cargo, desc_cargo FROM cargos ORDER BY id_cargo');
    Query.Open;

    while not Query.Eof do
    begin
      Cargo := TCargo.Create(
        Query.FieldByName('id_cargo').AsInteger,
        Query.FieldByName('desc_cargo').AsString
      );
      Result.Add(Cargo);
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

function TCargoRepository.BuscarPorId(IdCargo: Integer): TCargo;
var
  Query: TFDQuery;
begin
  Result := nil;

  if not Assigned(DM) or not Assigned(DM.FDConn) then
    raise Exception.Create('Conexão com banco de dados não disponível.');

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM.FDConn;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT id_cargo, desc_cargo FROM cargos WHERE id_cargo = :id_cargo');
    Query.ParamByName('id_cargo').AsInteger := IdCargo;
    Query.Open;

    if not Query.IsEmpty then
    begin
      Result := TCargo.Create(
        Query.FieldByName('id_cargo').AsInteger,
        Query.FieldByName('desc_cargo').AsString
      );
    end;
  finally
    Query.Free;
  end;
end;

function TCargoRepository.CargoExiste(IdCargo: Integer): Boolean;
var
  Query: TFDQuery;
begin
  Result := False;

  if not Assigned(DM) or not Assigned(DM.FDConn) then
    raise Exception.Create('Conexão com banco de dados não disponível.');

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM.FDConn;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT COUNT(*) as total FROM cargos WHERE id_cargo = :id_cargo');
    Query.ParamByName('id_cargo').AsInteger := IdCargo;
    Query.Open;

    Result := Query.FieldByName('total').AsInteger > 0;
  finally
    Query.Free;
  end;
end;

end.
