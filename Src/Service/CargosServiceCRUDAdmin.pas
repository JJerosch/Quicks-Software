unit CargosServiceCRUDAdmin;

interface

uses
  System.SysUtils, System.Generics.Collections, CargosModelCRUDAdmin, CargosRepositoryCRUDAdmin;

type
  TCargoService = class
  private
    FCargoRepository: TCargoRepository;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarTodosCargos: TObjectList<TCargo>;
    function BuscarCargoPorId(IdCargo: Integer): TCargo;
  end;

implementation

{ TCargoService }

constructor TCargoService.Create;
begin
  inherited Create;
  FCargoRepository := TCargoRepository.Create;
end;

destructor TCargoService.Destroy;
begin
  FCargoRepository.Free;
  inherited;
end;

function TCargoService.ListarTodosCargos: TObjectList<TCargo>;
begin
  Result := FCargoRepository.ListarTodos;

  if Result.Count = 0 then
    raise Exception.Create('Nenhum cargo cadastrado no sistema.');
end;

function TCargoService.BuscarCargoPorId(IdCargo: Integer): TCargo;
begin
  Result := FCargoRepository.BuscarPorId(IdCargo);

  if not Assigned(Result) then
    raise Exception.Create('Cargo não encontrado.');
end;

end.
