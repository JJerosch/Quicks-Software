unit EntregadorService;

interface

uses
  System.SysUtils, System.Generics.Collections,
  EntregadorModel,
  EntregadorRepository, PasswordHelper;

type
  TEntregadorService = class
  private
    FRepository: TEntregadorRepository;

    // Validações
    function ValidarDadosPerfil(Entregador: TEntregador; out MsgErro: String): Boolean;
    function ValidarEnderecoOrigem(Endereco: TEnderecoOrigem; out MsgErro: String): Boolean;
    function ValidarEnderecoAtual(Endereco: TEnderecoAtual; out MsgErro: String): Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    // Buscar entregador
    function ObterPerfilPorUsuario(IdUsuario: Integer): TEntregador;
    function ObterPerfilPorEntregador(IdEntregador: Integer): TEntregador;

    // Atualizar perfil
    function AtualizarPerfil(Entregador: TEntregador): Boolean;
    function AtualizarEnderecoOrigem(IdEntregador: Integer; EnderecoOrigem: TEnderecoOrigem): Boolean;

    // Registrar endereço atual
    function RegistrarLocalizacaoAtual(IdEntregador: Integer; EnderecoAtual: TEnderecoAtual): Boolean;

    // Histórico
    function ObterHistoricoEnderecos(IdEntregador: Integer): TObjectList<TEnderecoAtual>;

    // ⭐ Status de expediente
    function AlterarStatusExpediente(IdEntregador: Integer; EmExpediente: Boolean): Boolean;

    // Senha
    function AlterarSenha(Request: TAlterarSenhaEntregadorRequest): Boolean;
  end;

implementation

uses
  Vcl.Dialogs, System.UITypes;

{ TEntregadorService }

constructor TEntregadorService.Create;
begin
  inherited;
  FRepository := TEntregadorRepository.Create;
end;

destructor TEntregadorService.Destroy;
begin
  FRepository.Free;
  inherited;
end;

// ========== VALIDAÇÕES ==========

function TEntregadorService.ValidarDadosPerfil(Entregador: TEntregador; out MsgErro: String): Boolean;
begin
  Result := False;
  MsgErro := '';

  if Trim(Entregador.NomeUsuario) = '' then
  begin
    MsgErro := 'Nome é obrigatório!';
    Exit;
  end;

  if Length(Trim(Entregador.NomeUsuario)) < 3 then
  begin
    MsgErro := 'Nome deve ter pelo menos 3 caracteres!';
    Exit;
  end;

  if Trim(Entregador.EmailUsuario) = '' then
  begin
    MsgErro := 'Email é obrigatório!';
    Exit;
  end;

  if Pos('@', Entregador.EmailUsuario) = 0 then
  begin
    MsgErro := 'Email inválido!';
    Exit;
  end;

  if Trim(Entregador.CPFUsuario) = '' then
  begin
    MsgErro := 'CPF é obrigatório!';
    Exit;
  end;

  if Trim(Entregador.TelefoneUsuario) = '' then
  begin
    MsgErro := 'Telefone é obrigatório!';
    Exit;
  end;

  Result := True;
end;

function TEntregadorService.ValidarEnderecoOrigem(Endereco: TEnderecoOrigem; out MsgErro: String): Boolean;
begin
  Result := False;
  MsgErro := '';

  if Trim(Endereco.Logradouro) = '' then
  begin
    MsgErro := 'Logradouro é obrigatório!';
    Exit;
  end;

  if Trim(Endereco.Numero) = '' then
  begin
    MsgErro := 'Número é obrigatório!';
    Exit;
  end;

  if Trim(Endereco.Bairro) = '' then
  begin
    MsgErro := 'Bairro é obrigatório!';
    Exit;
  end;

  if Trim(Endereco.Cidade) = '' then
  begin
    MsgErro := 'Cidade é obrigatória!';
    Exit;
  end;

  if Trim(Endereco.UF) = '' then
  begin
    MsgErro := 'UF é obrigatório!';
    Exit;
  end;

  if Trim(Endereco.CEP) = '' then
  begin
    MsgErro := 'CEP é obrigatório!';
    Exit;
  end;

  Result := True;
end;

function TEntregadorService.ValidarEnderecoAtual(Endereco: TEnderecoAtual; out MsgErro: String): Boolean;
begin
  Result := False;
  MsgErro := '';

  if Trim(Endereco.Logradouro) = '' then
  begin
    MsgErro := 'Logradouro é obrigatório!';
    Exit;
  end;

  if Trim(Endereco.Numero) = '' then
  begin
    MsgErro := 'Número é obrigatório!';
    Exit;
  end;

  if Trim(Endereco.Bairro) = '' then
  begin
    MsgErro := 'Bairro é obrigatório!';
    Exit;
  end;

  if Trim(Endereco.Cidade) = '' then
  begin
    MsgErro := 'Cidade é obrigatória!';
    Exit;
  end;

  if Trim(Endereco.UF) = '' then
  begin
    MsgErro := 'UF é obrigatório!';
    Exit;
  end;

  if Trim(Endereco.CEP) = '' then
  begin
    MsgErro := 'CEP é obrigatório!';
    Exit;
  end;

  Result := True;
end;

// ========== BUSCAR PERFIL ==========

function TEntregadorService.ObterPerfilPorUsuario(IdUsuario: Integer): TEntregador;
begin
  Result := nil;

  try
    if IdUsuario <= 0 then
      raise Exception.Create('ID do usuário inválido!');

    Result := FRepository.BuscarPorIdUsuario(IdUsuario);

    if not Assigned(Result) then
      raise Exception.Create('Entregador não encontrado!');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao buscar perfil: ' + E.Message);
      Result := nil;
    end;
  end;
end;

function TEntregadorService.ObterPerfilPorEntregador(IdEntregador: Integer): TEntregador;
begin
  Result := nil;

  try
    if IdEntregador <= 0 then
      raise Exception.Create('ID do entregador inválido!');

    Result := FRepository.BuscarPorIdEntregador(IdEntregador);

    if not Assigned(Result) then
      raise Exception.Create('Entregador não encontrado!');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao buscar perfil: ' + E.Message);
      Result := nil;
    end;
  end;
end;

// ========== ATUALIZAR PERFIL ==========

function TEntregadorService.AtualizarPerfil(Entregador: TEntregador): Boolean;
var
  MsgErro: String;
begin
  Result := False;

  try
    // Validar dados
    if not ValidarDadosPerfil(Entregador, MsgErro) then
    begin
      ShowMessage(MsgErro);
      Exit;
    end;

    // Atualizar no repositório
    Result := FRepository.AtualizarPerfil(Entregador);

    if Result then
      ShowMessage('✅ Perfil atualizado com sucesso!')
    else
      ShowMessage('❌ Não foi possível atualizar o perfil!');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao atualizar perfil: ' + E.Message);
      Result := False;
    end;
  end;
end;

function TEntregadorService.AtualizarEnderecoOrigem(IdEntregador: Integer;
  EnderecoOrigem: TEnderecoOrigem): Boolean;
var
  MsgErro: String;
begin
  Result := False;

  try
    // Validar endereço
    if not ValidarEnderecoOrigem(EnderecoOrigem, MsgErro) then
    begin
      ShowMessage(MsgErro);
      Exit;
    end;

    // Atualizar no repositório
    Result := FRepository.AtualizarEnderecoOrigem(IdEntregador, EnderecoOrigem);

    if Result then
      ShowMessage('✅ Endereço de origem atualizado com sucesso!')
    else
      ShowMessage('❌ Não foi possível atualizar o endereço de origem!');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao atualizar endereço de origem: ' + E.Message);
      Result := False;
    end;
  end;
end;

// ========== REGISTRAR LOCALIZAÇÃO ATUAL ==========

function TEntregadorService.RegistrarLocalizacaoAtual(IdEntregador: Integer;
  EnderecoAtual: TEnderecoAtual): Boolean;
var
  MsgErro: String;
begin
  Result := False;

  try
    // Validar endereço
    if not ValidarEnderecoAtual(EnderecoAtual, MsgErro) then
    begin
      ShowMessage(MsgErro);
      Exit;
    end;

    // Registrar no repositório
    Result := FRepository.RegistrarEnderecoAtual(IdEntregador, EnderecoAtual);

    if Result then
      ShowMessage('✅ Localização registrada com sucesso!')
    else
      ShowMessage('❌ Não foi possível registrar a localização!');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao registrar localização: ' + E.Message);
      Result := False;
    end;
  end;
end;

// ========== HISTÓRICO ==========

function TEntregadorService.ObterHistoricoEnderecos(IdEntregador: Integer): TObjectList<TEnderecoAtual>;
begin
  Result := nil;

  try
    if IdEntregador <= 0 then
      raise Exception.Create('ID do entregador inválido!');

    Result := FRepository.BuscarHistoricoEnderecos(IdEntregador);

    if not Assigned(Result) then
      Result := TObjectList<TEnderecoAtual>.Create(True);

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao buscar histórico: ' + E.Message);
      Result := TObjectList<TEnderecoAtual>.Create(True);
    end;
  end;
end;

// ========== STATUS DE EXPEDIENTE ==========

function TEntregadorService.AlterarStatusExpediente(IdEntregador: Integer;
  EmExpediente: Boolean): Boolean;
begin
  Result := False;

  try
    if IdEntregador <= 0 then
      raise Exception.Create('ID do entregador inválido!');

    Result := FRepository.AlterarStatusExpediente(IdEntregador, EmExpediente);

    if Result then
    begin
      if EmExpediente then
        ShowMessage('✅ Você entrou em expediente!')
      else
        ShowMessage('✅ Você saiu de expediente!');
    end
    else
      ShowMessage('❌ Não foi possível alterar o status!');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao alterar status: ' + E.Message);
      Result := False;
    end;
  end;
end;

// ========== SENHA ==========

function TEntregadorService.AlterarSenha(Request: TAlterarSenhaEntregadorRequest): Boolean;
var
  SenhaHashAtual: String;
  NovaSenhaHash: String;
begin
  Result := False;

  try
    // Validações
    if Request.IdUsuario <= 0 then
      raise Exception.Create('ID do usuário inválido!');

    if Trim(Request.SenhaAtual) = '' then
      raise Exception.Create('Informe a senha atual!');

    if Trim(Request.SenhaNova) = '' then
      raise Exception.Create('Informe a nova senha!');

    if Length(Request.SenhaNova) < 6 then
      raise Exception.Create('A nova senha deve ter pelo menos 6 caracteres!');

    if Request.SenhaNova <> Request.SenhaConfirmacao then
      raise Exception.Create('As senhas não coincidem!');

    // Buscar hash da senha atual
    SenhaHashAtual := FRepository.ObterSenhaHash(Request.IdUsuario);

    if SenhaHashAtual = '' then
      raise Exception.Create('Usuário não encontrado!');

    // Verificar senha atual
    if not TPasswordHelper.VerifyPassword(Request.SenhaAtual, SenhaHashAtual) then
      raise Exception.Create('Senha atual incorreta!');

    // Gerar hash da nova senha
    NovaSenhaHash := TPasswordHelper.HashPassword(Request.SenhaNova);

    // Atualizar no banco
    Result := FRepository.AlterarSenha(Request.IdUsuario, NovaSenhaHash);

    if Result then
      ShowMessage('✅ Senha alterada com sucesso!')
    else
      ShowMessage('❌ Não foi possível alterar a senha!');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao alterar senha: ' + E.Message);
      Result := False;
    end;
  end;
end;

end.
