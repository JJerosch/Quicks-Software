unit EnderecoClienteService;

interface

uses
  System.SysUtils, System.Generics.Collections,
  EnderecoClienteModel, EnderecoClienteRepository;

type
  TEnderecoClienteService = class
  private
    FRepository: TEnderecoClienteRepository;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarEnderecos(IdCliente: Integer): TObjectList<TEnderecoCliente>;
    function ObterEndereco(IdEndereco: Integer): TEnderecoCliente;
    function CadastrarEndereco(Endereco: TEnderecoCliente): Boolean;
    function AtualizarEndereco(Endereco: TEnderecoCliente): Boolean;
    function ExcluirEndereco(IdEndereco: Integer): Boolean;
    function DefinirComoPrincipal(IdEndereco, IdCliente: Integer): Boolean;
  end;

implementation

{ TEnderecoClienteService }

constructor TEnderecoClienteService.Create;
begin
  inherited;
  FRepository := TEnderecoClienteRepository.Create;
end;

destructor TEnderecoClienteService.Destroy;
begin
  if Assigned(FRepository) then
    FRepository.Free;
  inherited;
end;

function TEnderecoClienteService.ListarEnderecos(IdCliente: Integer): TObjectList<TEnderecoCliente>;
begin
  Result := FRepository.ListarEnderecos(IdCliente);
end;

function TEnderecoClienteService.ObterEndereco(IdEndereco: Integer): TEnderecoCliente;
begin
  Result := FRepository.ObterEndereco(IdEndereco);
end;

function TEnderecoClienteService.CadastrarEndereco(Endereco: TEnderecoCliente): Boolean;
begin
  // Lógica de negócio adicional pode ser adicionada aqui
  // Por exemplo: validar CEP, geocodificar endereço, etc.

  Result := FRepository.CadastrarEndereco(Endereco);
end;

function TEnderecoClienteService.AtualizarEndereco(Endereco: TEnderecoCliente): Boolean;
begin
  // Lógica de negócio adicional pode ser adicionada aqui

  Result := FRepository.AtualizarEndereco(Endereco);
end;

function TEnderecoClienteService.ExcluirEndereco(IdEndereco: Integer): Boolean;
begin
  Result := FRepository.ExcluirEndereco(IdEndereco);
end;

function TEnderecoClienteService.DefinirComoPrincipal(IdEndereco, IdCliente: Integer): Boolean;
begin
  Result := False;

  try
    if not Assigned(FRepository) then
      Exit;

    // Delega para o Repository
    Result := FRepository.DefinirComoPrincipal(IdEndereco, IdCliente);

  except
    on E: Exception do
    begin
      Result := False;
      raise Exception.Create('Erro no Service ao definir principal: ' + E.Message);
    end;
  end;
end;

end.
