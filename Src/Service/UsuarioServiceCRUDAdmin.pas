unit UsuarioServiceCRUDAdmin;

interface

uses
  System.SysUtils, System.Generics.Collections,
  UsuarioModelCRUDAdmin, UsuarioRepositoryCRUDAdmin, CargosRepositoryCRUDAdmin,
  CargosModelCRUDAdmin;

type
  TUsuarioService = class
  private
    FUsuarioRepository: TUsuarioRepository;
    FCargosRepository: TCargosRepository;
    function ValidarUsuario(Usuario: TUsuario; IsUpdate: Boolean): string;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarUsuarios(ApenasAtivos: Boolean): TObjectList<TUsuario>;
    function ObterUsuario(IdUsuario: Integer): TUsuario;
    function AdicionarUsuario(Usuario: TUsuario; const Senha: string): Boolean;
    function AtualizarUsuario(Usuario: TUsuario): Boolean;
    function DesativarUsuario(IdUsuario: Integer): Boolean;
    function ReativarUsuario(IdUsuario: Integer): Boolean;
    function ListarCargos: TObjectList<TCargo>;
  end;

implementation

uses
  PasswordHelper, Vcl.Dialogs;

{ TUsuarioService }

constructor TUsuarioService.Create;
begin
  inherited;
  FUsuarioRepository := TUsuarioRepository.Create;
  FCargosRepository := TCargosRepository.Create;
end;

destructor TUsuarioService.Destroy;
begin
  FUsuarioRepository.Free;
  FCargosRepository.Free;
  inherited;
end;

function TUsuarioService.ValidarUsuario(Usuario: TUsuario; IsUpdate: Boolean): string;
begin
  Result := '';

  // Validar Nome
  if Trim(Usuario.NomeUser) = '' then
  begin
    Result := 'O nome do usuário é obrigatório.';
    Exit;
  end;

  if Length(Trim(Usuario.NomeUser)) < 3 then
  begin
    Result := 'O nome deve ter no mínimo 3 caracteres.';
    Exit;
  end;

  // Validar Email
  if Trim(Usuario.EmailUser) = '' then
  begin
    Result := 'O email é obrigatório.';
    Exit;
  end;

  if Pos('@', Usuario.EmailUser) = 0 then
  begin
    Result := 'Email inválido.';
    Exit;
  end;

  // Verificar se email já existe
  if IsUpdate then
  begin
    if FUsuarioRepository.EmailJaExiste(Usuario.EmailUser, Usuario.IdUser) then
    begin
      Result := 'Este email já está cadastrado para outro usuário.';
      Exit;
    end;
  end
  else
  begin
    if FUsuarioRepository.EmailJaExiste(Usuario.EmailUser) then
    begin
      Result := 'Este email já está cadastrado.';
      Exit;
    end;
  end;

  // Validar CPF
  if Trim(Usuario.CpfUser) = '' then
  begin
    Result := 'O CPF é obrigatório.';
    Exit;
  end;

  // Verificar se CPF já existe
  if IsUpdate then
  begin
    if FUsuarioRepository.CPFJaExiste(Usuario.CpfUser, Usuario.IdUser) then
    begin
      Result := 'Este CPF já está cadastrado para outro usuário.';
      Exit;
    end;
  end
  else
  begin
    if FUsuarioRepository.CPFJaExiste(Usuario.CpfUser) then
    begin
      Result := 'Este CPF já está cadastrado.';
      Exit;
    end;
  end;

  // Validar Telefone
  if Trim(Usuario.NPhoneUser) = '' then
  begin
    Result := 'O telefone é obrigatório.';
    Exit;
  end;

  // Validar Cargo
  if Usuario.IdCargo <= 0 then
  begin
    Result := 'Selecione um cargo válido.';
    Exit;
  end;
end;

function TUsuarioService.ListarUsuarios(ApenasAtivos: Boolean): TObjectList<TUsuario>;
begin
  try
    Result := FUsuarioRepository.BuscarTodos(ApenasAtivos);
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao listar usuários: ' + E.Message);
      Result := TObjectList<TUsuario>.Create(True);
    end;
  end;
end;

function TUsuarioService.ObterUsuario(IdUsuario: Integer): TUsuario;
begin
  try
    Result := FUsuarioRepository.BuscarPorId(IdUsuario);

    if not Assigned(Result) then
      ShowMessage('Usuário não encontrado.');
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao buscar usuário: ' + E.Message);
      Result := nil;
    end;
  end;
end;

function TUsuarioService.AdicionarUsuario(Usuario: TUsuario; const Senha: string): Boolean;
var
  MsgErro: string;
  SenhaHash: string;
begin
  Result := False;

  try
    // Validar senha
    if Trim(Senha) = '' then
    begin
      ShowMessage('A senha é obrigatória.');
      Exit;
    end;

    if Length(Senha) < 6 then
    begin
      ShowMessage('A senha deve ter no mínimo 6 caracteres.');
      Exit;
    end;

    // Validar dados do usuário
    MsgErro := ValidarUsuario(Usuario, False);
    if MsgErro <> '' then
    begin
      ShowMessage(MsgErro);
      Exit;
    end;

    // Gerar hash da senha
    SenhaHash := TPasswordHelper.HashPassword(Senha);

    // Inserir no banco
    Result := FUsuarioRepository.Inserir(Usuario, SenhaHash);

    if Result then
      ShowMessage('Usuário cadastrado com sucesso!')
    else
      ShowMessage('Erro ao cadastrar usuário.');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao adicionar usuário: ' + E.Message);
      Result := False;
    end;
  end;
end;

function TUsuarioService.AtualizarUsuario(Usuario: TUsuario): Boolean;
var
  MsgErro: string;
begin
  Result := False;

  try
    // Validar dados do usuário
    MsgErro := ValidarUsuario(Usuario, True);
    if MsgErro <> '' then
    begin
      ShowMessage(MsgErro);
      Exit;
    end;

    // Atualizar no banco
    Result := FUsuarioRepository.Atualizar(Usuario);

    if Result then
      ShowMessage('Usuário atualizado com sucesso!')
    else
      ShowMessage('Erro ao atualizar usuário.');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao atualizar usuário: ' + E.Message);
      Result := False;
    end;
  end;
end;

function TUsuarioService.DesativarUsuario(IdUsuario: Integer): Boolean;
begin
  try
    Result := FUsuarioRepository.AlterarStatus(IdUsuario, False);

    if Result then
      ShowMessage('Usuário desativado com sucesso!')
    else
      ShowMessage('Erro ao desativar usuário.');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao desativar usuário: ' + E.Message);
      Result := False;
    end;
  end;
end;

function TUsuarioService.ReativarUsuario(IdUsuario: Integer): Boolean;
begin
  try
    Result := FUsuarioRepository.AlterarStatus(IdUsuario, True);

    if Result then
      ShowMessage('Usuário reativado com sucesso!')
    else
      ShowMessage('Erro ao reativar usuário.');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao reativar usuário: ' + E.Message);
      Result := False;
    end;
  end;
end;

function TUsuarioService.ListarCargos: TObjectList<TCargo>;
begin
  try
    Result := FCargosRepository.BuscarTodos;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao listar cargos: ' + E.Message);
      Result := TObjectList<TCargo>.Create(True);
    end;
  end;
end;

end.
