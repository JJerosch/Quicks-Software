unit ClientePerfilController;

interface

uses
  System.SysUtils, ClienteModel, ClientePerfilService;

type
  TClientePerfilController = class
  private
    FService: TClientePerfilService;
  public
    constructor Create;
    destructor Destroy; override;

    function ObterPerfil(IdUsuario: Integer): TCliente;
    function AtualizarPerfil(Cliente: TCliente): Boolean;
    function AlterarSenha(Request: TAlterarSenhaClienteRequest): Boolean;
  end;

implementation

{ TClientePerfilController }

constructor TClientePerfilController.Create;
begin
  inherited;
  FService := TClientePerfilService.Create;
end;

destructor TClientePerfilController.Destroy;
begin
  FService.Free;
  inherited;
end;

function TClientePerfilController.ObterPerfil(IdUsuario: Integer): TCliente;
begin
  Result := FService.ObterPerfilPorUsuario(IdUsuario);
end;

function TClientePerfilController.AtualizarPerfil(Cliente: TCliente): Boolean;
begin
  Result := FService.AtualizarPerfil(Cliente);
end;

function TClientePerfilController.AlterarSenha(Request: TAlterarSenhaClienteRequest): Boolean;
begin
  Result := FService.AlterarSenha(Request);
end;

end.
