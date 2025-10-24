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
    Result := 'O nome do usu�rio � obrigat�rio.';
    Exit;
  end;

  if Length(Trim(Usuario.NomeUser)) < 3 then
  begin
    Result := 'O nome deve ter no m�nimo 3 caracteres.';
    Exit;
  end;

  // Validar Email
  if Trim(Usuario.EmailUser) = '' then
  begin
    Result := 'O email � obrigat�rio.';
    Exit;
  end;

  if Pos('@', Usuario.EmailUser) = 0 then
  begin
    Result := 'Email inv�lido.';
    Exit;
  end;

  // Verificar se email j� existe
  if IsUpdate then
  begin
    if FUsuarioRepository.EmailJaExiste(Usuario.EmailUser, Usuario.IdUser) then
    begin
      Result := 'Este email j� est� cadastrado para outro usu�rio.';
      Exit;
    end;
  end
  else
  begin
    if FUsuarioRepository.EmailJaExiste(Usuario.EmailUser) then
    begin
      Result := 'Este email j� est� cadastrado.';
      Exit;
    end;
  end;

  // Validar CPF
  if Trim(Usuario.CpfUser) = '' then
  begin
    Result := 'O CPF � obrigat�rio.';
    Exit;
  end;

  // Verificar se CPF j� existe
  if IsUpdate then
  begin
    if FUsuarioRepository.CPFJaExiste(Usuario.CpfUser, Usuario.IdUser) then
    begin
      Result := 'Este CPF j� est� cadastrado para outro usu�rio.';
      Exit;
    end;
  end
  else
  begin
    if FUsuarioRepository.CPFJaExiste(Usuario.CpfUser) then
    begin
      Result := 'Este CPF j� est� cadastrado.';
      Exit;
    end;
  end;

  // Validar Telefone
  if Trim(Usuario.NPhoneUser) = '' then
  begin
    Result := 'O telefone � obrigat�rio.';
    Exit;
  end;

  // Validar Cargo
  if Usuario.IdCargo <= 0 then
  begin
    Result := 'Selecione um cargo v�lido.';
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
      ShowMessage('Erro ao listar usu�rios: ' + E.Message);
      Result := TObjectList<TUsuario>.Create(True);
    end;
  end;
end;

function TUsuarioService.ObterUsuario(IdUsuario: Integer): TUsuario;
begin
  try
    Result := FUsuarioRepository.BuscarPorId(IdUsuario);

    if not Assigned(Result) then
      ShowMessage('Usu�rio n�o encontrado.');
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao buscar usu�rio: ' + E.Message);
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
      ShowMessage('A senha � obrigat�ria.');
      Exit;
    end;

    if Length(Senha) < 6 then
    begin
      ShowMessage('A senha deve ter no m�nimo 6 caracteres.');
      Exit;
    end;

    // Validar dados do usu�rio
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
      ShowMessage('Usu�rio cadastrado com sucesso!')
    else
      ShowMessage('Erro ao cadastrar usu�rio.');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao adicionar usu�rio: ' + E.Message);
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
    // Validar dados do usu�rio
    MsgErro := ValidarUsuario(Usuario, True);
    if MsgErro <> '' then
    begin
      ShowMessage(MsgErro);
      Exit;
    end;

    // Atualizar no banco
    Result := FUsuarioRepository.Atualizar(Usuario);

    if Result then
      ShowMessage('Usu�rio atualizado com sucesso!')
    else
      ShowMessage('Erro ao atualizar usu�rio.');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao atualizar usu�rio: ' + E.Message);
      Result := False;
    end;
  end;
end;

function TUsuarioService.DesativarUsuario(IdUsuario: Integer): Boolean;
begin
  try
    Result := FUsuarioRepository.AlterarStatus(IdUsuario, False);

    if Result then
      ShowMessage('Usu�rio desativado com sucesso!')
    else
      ShowMessage('Erro ao desativar usu�rio.');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao desativar usu�rio: ' + E.Message);
      Result := False;
    end;
  end;
end;

function TUsuarioService.ReativarUsuario(IdUsuario: Integer): Boolean;
begin
  try
    Result := FUsuarioRepository.AlterarStatus(IdUsuario, True);

    if Result then
      ShowMessage('Usu�rio reativado com sucesso!')
    else
      ShowMessage('Erro ao reativar usu�rio.');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao reativar usu�rio: ' + E.Message);
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
