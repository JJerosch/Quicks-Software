unit EnderecoClienteController;

interface

uses
  System.SysUtils, System.Generics.Collections,
  EnderecoClienteModel, EnderecoClienteService;

type
  TEnderecoClienteController = class
  private
    FService: TEnderecoClienteService;
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

{ TEnderecoClienteController }

constructor TEnderecoClienteController.Create;
begin
  inherited;
  FService := TEnderecoClienteService.Create;
end;

destructor TEnderecoClienteController.Destroy;
begin
  if Assigned(FService) then
    FService.Free;
  inherited;
end;

function TEnderecoClienteController.ListarEnderecos(IdCliente: Integer): TObjectList<TEnderecoCliente>;
begin
  Result := nil;

  try
    if IdCliente <= 0 then
    begin
      raise Exception.Create('ID do cliente inválido!');
    end;

    Result := FService.ListarEnderecos(IdCliente);

  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao listar endereços: ' + E.Message);
    end;
  end;
end;

function TEnderecoClienteController.ObterEndereco(IdEndereco: Integer): TEnderecoCliente;
begin
  Result := nil;

  try
    if IdEndereco <= 0 then
    begin
      raise Exception.Create('ID do endereço inválido!');
    end;

    Result := FService.ObterEndereco(IdEndereco);

    if not Assigned(Result) then
      raise Exception.Create('Endereço não encontrado!');

  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao obter endereço: ' + E.Message);
    end;
  end;
end;

function TEnderecoClienteController.CadastrarEndereco(Endereco: TEnderecoCliente): Boolean;
begin
  Result := False;

  try
    // Validações
    if not Assigned(Endereco) then
      raise Exception.Create('Dados do endereço não informados!');

    if Endereco.IdCliente <= 0 then
      raise Exception.Create('Cliente não informado!');

    if Trim(Endereco.Logradouro) = '' then
      raise Exception.Create('Logradouro é obrigatório!');

    if Trim(Endereco.CEP) = '' then
      raise Exception.Create('CEP é obrigatório!');

    if Trim(Endereco.Numero) = '' then
      raise Exception.Create('Número é obrigatório!');

    if Trim(Endereco.Bairro) = '' then
      raise Exception.Create('Bairro é obrigatório!');

    if Trim(Endereco.Cidade) = '' then
      raise Exception.Create('Cidade é obrigatória!');

    if Trim(Endereco.UF) = '' then
      raise Exception.Create('Estado é obrigatório!');

    // Validar UF (2 caracteres)
    if Length(Trim(Endereco.UF)) <> 2 then
      raise Exception.Create('Estado deve ter 2 caracteres!');

    // Chamar service
    Result := FService.CadastrarEndereco(Endereco);

  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao cadastrar endereço: ' + E.Message);
    end;
  end;
end;

function TEnderecoClienteController.AtualizarEndereco(Endereco: TEnderecoCliente): Boolean;
begin
  Result := False;

  try
    // Validações
    if not Assigned(Endereco) then
      raise Exception.Create('Dados do endereço não informados!');

    if Endereco.IdEndereco <= 0 then
      raise Exception.Create('ID do endereço inválido!');

    if Endereco.IdCliente <= 0 then
      raise Exception.Create('Cliente não informado!');

    if Trim(Endereco.Logradouro) = '' then
      raise Exception.Create('Logradouro é obrigatório!');

    if Trim(Endereco.CEP) = '' then
      raise Exception.Create('CEP é obrigatório!');

    if Trim(Endereco.Numero) = '' then
      raise Exception.Create('Número é obrigatório!');

    if Trim(Endereco.Bairro) = '' then
      raise Exception.Create('Bairro é obrigatório!');

    if Trim(Endereco.Cidade) = '' then
      raise Exception.Create('Cidade é obrigatória!');

    if Trim(Endereco.UF) = '' then
      raise Exception.Create('Estado é obrigatório!');

    // Validar UF (2 caracteres)
    if Length(Trim(Endereco.UF)) <> 2 then
      raise Exception.Create('Estado deve ter 2 caracteres!');

    // Chamar service
    Result := FService.AtualizarEndereco(Endereco);

  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao atualizar endereço: ' + E.Message);
    end;
  end;
end;

function TEnderecoClienteController.ExcluirEndereco(IdEndereco: Integer): Boolean;
begin
  Result := False;

  try
    if IdEndereco <= 0 then
      raise Exception.Create('ID do endereço inválido!');

    Result := FService.ExcluirEndereco(IdEndereco);

  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao excluir endereço: ' + E.Message);
    end;
  end;
end;

function TEnderecoClienteController.DefinirComoPrincipal(IdEndereco, IdCliente: Integer): Boolean;
begin
  Result := False;

  try
    if not Assigned(FService) then
      Exit;

    // Delega para o Service
    Result := FService.DefinirComoPrincipal(IdEndereco, IdCliente);

  except
    on E: Exception do
    begin
      Result := False;
      raise Exception.Create('Erro no Controller ao definir principal: ' + E.Message);
    end;
  end;
end;

end.
