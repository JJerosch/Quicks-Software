unit CargosServiceCRUDAdmin;

interface

uses
  System.SysUtils, System.Generics.Collections,
  CargosModelCRUDAdmin, CargosRepositoryCRUDAdmin;

type
  TCargoService = class
  private
    FRepository: TCargosRepository;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarTodosCargos: TObjectList<TCargo>;
    function BuscarCargoPorId(IdCargo: Integer): TCargo;
  end;

implementation

uses
  Vcl.Dialogs;

{ TCargoService }

constructor TCargoService.Create;
begin
  inherited;
  FRepository := TCargosRepository.Create;
end;

destructor TCargoService.Destroy;
begin
  FRepository.Free;
  inherited;
end;

function TCargoService.ListarTodosCargos: TObjectList<TCargo>;
begin
  try
    // ⭐ AQUI: chama BuscarTodos do Repository
    Result := FRepository.BuscarTodos;

    if Result.Count = 0 then
      ShowMessage('Nenhum cargo encontrado no sistema.');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao listar cargos: ' + E.Message);
      Result := TObjectList<TCargo>.Create(True);
    end;
  end;
end;

function TCargoService.BuscarCargoPorId(IdCargo: Integer): TCargo;
begin
  try
    Result := FRepository.BuscarPorId(IdCargo);

    if not Assigned(Result) then
      ShowMessage('Cargo não encontrado.');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao buscar cargo: ' + E.Message);
      Result := nil;
    end;
  end;
end;

end.
