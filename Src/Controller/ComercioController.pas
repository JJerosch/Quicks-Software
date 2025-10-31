unit ComercioController;

interface

uses
  System.SysUtils, ComercioModel, ComercioService;

type
  TComercioController = class
  private
    FService: TComercioService;
  public
    constructor Create;
    destructor Destroy; override;

    function ObterComercioPorUsuario(IdUsuario: Integer): TComercio;
    function ObterComercioPorId(IdComercio: Integer): TComercio;
    function AtualizarComercio(Comercio: TComercio): Boolean;
    function AlterarSenha(Request: TAlterarSenhaRequest): Boolean;
  end;

implementation

{ TComercioController }

constructor TComercioController.Create;
begin
  inherited;
  FService := TComercioService.Create;
end;

destructor TComercioController.Destroy;
begin
  FService.Free;
  inherited;
end;

function TComercioController.ObterComercioPorUsuario(IdUsuario: Integer): TComercio;
begin
  Result := FService.ObterComercioPorUsuario(IdUsuario);
end;

function TComercioController.ObterComercioPorId(IdComercio: Integer): TComercio;
begin
  Result := FService.ObterComercioPorId(IdComercio);
end;

function TComercioController.AtualizarComercio(Comercio: TComercio): Boolean;
begin
  Result := FService.AtualizarComercio(Comercio);
end;

function TComercioController.AlterarSenha(Request: TAlterarSenhaRequest): Boolean;
begin
  Result := FService.AlterarSenha(Request);
end;

end.
