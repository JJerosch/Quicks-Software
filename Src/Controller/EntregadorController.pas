unit EntregadorController;

interface

uses
  System.SysUtils, System.Generics.Collections,
  EntregadorModel, EntregadorService;

type
  TEntregadorController = class
  private
    FService: TEntregadorService;
  public
    constructor Create;
    destructor Destroy; override;

    // Buscar perfil
    function ObterPerfil(IdUsuario: Integer): TEntregador;

    // Atualizar perfil
    function AtualizarPerfil(Entregador: TEntregador): Boolean;
    function AtualizarEnderecoOrigem(IdEntregador: Integer; EnderecoOrigem: TEnderecoOrigem): Boolean;

    // Registrar localização
    function RegistrarLocalizacao(IdEntregador: Integer; EnderecoAtual: TEnderecoAtual): Boolean;

    // Histórico
    function ObterHistoricoLocalizacoes(IdEntregador: Integer): TObjectList<TEnderecoAtual>;

    // ⭐ Status de expediente
    function AlterarStatusExpediente(IdEntregador: Integer; EmExpediente: Boolean): Boolean;

    // Senha
    function AlterarSenha(Request: TAlterarSenhaEntregadorRequest): Boolean;
  end;

implementation

{ TEntregadorController }

constructor TEntregadorController.Create;
begin
  inherited;
  FService := TEntregadorService.Create;
end;

destructor TEntregadorController.Destroy;
begin
  FService.Free;
  inherited;
end;

function TEntregadorController.ObterPerfil(IdUsuario: Integer): TEntregador;
begin
  Result := FService.ObterPerfilPorUsuario(IdUsuario);
end;

function TEntregadorController.AtualizarPerfil(Entregador: TEntregador): Boolean;
begin
  Result := FService.AtualizarPerfil(Entregador);
end;

function TEntregadorController.AtualizarEnderecoOrigem(IdEntregador: Integer;
  EnderecoOrigem: TEnderecoOrigem): Boolean;
begin
  Result := FService.AtualizarEnderecoOrigem(IdEntregador, EnderecoOrigem);
end;

function TEntregadorController.RegistrarLocalizacao(IdEntregador: Integer;
  EnderecoAtual: TEnderecoAtual): Boolean;
begin
  Result := FService.RegistrarLocalizacaoAtual(IdEntregador, EnderecoAtual);
end;

function TEntregadorController.ObterHistoricoLocalizacoes(IdEntregador: Integer): TObjectList<TEnderecoAtual>;
begin
  Result := FService.ObterHistoricoEnderecos(IdEntregador);
end;

function TEntregadorController.AlterarStatusExpediente(IdEntregador: Integer;
  EmExpediente: Boolean): Boolean;
begin
  Result := FService.AlterarStatusExpediente(IdEntregador, EmExpediente);
end;

function TEntregadorController.AlterarSenha(Request: TAlterarSenhaEntregadorRequest): Boolean;
begin
  Result := FService.AlterarSenha(Request);
end;

end.
