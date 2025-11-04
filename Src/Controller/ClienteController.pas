unit ClienteController;

interface

uses
  System.SysUtils, System.Generics.Collections, ComercioModel, ClienteRepository;

type
  TClienteController = class
  private
    FRepository: TClienteRepository;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarComerciosDisponiveis(ApenasAbertos: Boolean): TObjectList<TComercio>;
    function BuscarComercios(const Termo: string): TObjectList<TComercio>;
  end;

implementation

constructor TClienteController.Create;
begin
  inherited;
  FRepository := TClienteRepository.Create;
end;

destructor TClienteController.Destroy;
begin
  FRepository.Free;
  inherited;
end;

function TClienteController.ListarComerciosDisponiveis(ApenasAbertos: Boolean): TObjectList<TComercio>;
begin
  Result := FRepository.ListarComercios(ApenasAbertos);
end;

function TClienteController.BuscarComercios(const Termo: string): TObjectList<TComercio>;
begin
  Result := FRepository.BuscarComercios(Termo);
end;

end.
