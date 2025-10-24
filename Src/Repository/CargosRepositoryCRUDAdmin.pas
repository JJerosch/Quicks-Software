unit CargosRepositoryCRUDAdmin;

interface

uses
  System.SysUtils, System.Generics.Collections, FireDAC.Comp.Client,
  CargosModelCRUDAdmin;

type
  TCargosRepository = class
  public
    function BuscarTodos: TObjectList<TCargo>;
    function BuscarPorId(IdCargo: Integer): TCargo;
  end;

implementation

uses
  uConn;

{ TCargosRepository }

function TCargosRepository.BuscarTodos: TObjectList<TCargo>;
var
  Qr: TFDQuery;
begin
  Result := TObjectList<TCargo>.Create(True);
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT id_cargo, desc_cargo FROM cargos ORDER BY id_cargo');
    Qr.Open;

    while not Qr.Eof do
    begin
      Result.Add(TCargo.Create(
        Qr.FieldByName('id_cargo').AsInteger,
        Qr.FieldByName('desc_cargo').AsString
      ));
      Qr.Next;
    end;
  finally
    Qr.Free;
  end;
end;

function TCargosRepository.BuscarPorId(IdCargo: Integer): TCargo;
var
  Qr: TFDQuery;
begin
  Result := nil;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT id_cargo, desc_cargo FROM cargos WHERE id_cargo = :id');
    Qr.ParamByName('id').AsInteger := IdCargo;
    Qr.Open;

    if not Qr.IsEmpty then
      Result := TCargo.Create(
        Qr.FieldByName('id_cargo').AsInteger,
        Qr.FieldByName('desc_cargo').AsString
      );
  finally
    Qr.Free;
  end;
end;

end.
