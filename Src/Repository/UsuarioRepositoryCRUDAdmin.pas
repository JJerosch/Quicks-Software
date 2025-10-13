unit UsuarioRepositoryCRUDAdmin;

interface

uses
  System.SysUtils, System.Generics.Collections, FireDAC.Comp.Client,
  FireDAC.Stan.Param, UsuarioModelCRUDAdmin, uConn;

type
  TUsuarioRepository = class
  private
    // Nenhuma dependência de banco aqui - usa o DM global
  public
    // CRUD Básico
    function Inserir(Usuario: TUsuario; Senha: string): Boolean;
    function Atualizar(Usuario: TUsuario): Boolean;
    function AlterarStatus(IdUsuario: Integer; Ativo: Boolean): Boolean;
    function BuscarPorId(IdUsuario: Integer): TUsuario;
    function ListarTodos(ApenasAtivos: Boolean = True): TObjectList<TUsuario>;
    function BuscarPorFiltro(Filtro: string; ApenasAtivos: Boolean = True): TObjectList<TUsuario>;

    // Validações
    function EmailJaExiste(Email: string; IdUsuarioIgnorar: Integer = 0): Boolean;
    function CpfJaExiste(Cpf: string; IdUsuarioIgnorar: Integer = 0): Boolean;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TUsuarioRepository }

constructor TUsuarioRepository.Create;
begin
  inherited Create;
end;

destructor TUsuarioRepository.Destroy;
begin
  inherited;
end;

function TUsuarioRepository.Inserir(Usuario: TUsuario; Senha: string): Boolean;
var
  Query: TFDQuery;
begin
  Result := False;

  if not Assigned(DM) or not Assigned(DM.FDConn) then
    raise Exception.Create('Conexão com banco de dados não disponível.');

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM.FDConn;
    Query.SQL.Clear;
    Query.SQL.Add('INSERT INTO usuarios (nome_user, email_user, cpf_user, senha_user, nphone_user, id_cargo, ativo)');
    Query.SQL.Add('VALUES (:nome, :email, :cpf, :senha, :nphone, :id_cargo, :ativo)');

    Query.ParamByName('nome').AsString := Usuario.NomeUser;
    Query.ParamByName('email').AsString := Usuario.EmailUser;
    Query.ParamByName('cpf').AsString := Usuario.CpfUser;
    Query.ParamByName('senha').AsString := Senha;
    Query.ParamByName('nphone').AsString := Usuario.NPhoneUser;
    Query.ParamByName('id_cargo').AsInteger := Usuario.IdCargo;
    Query.ParamByName('ativo').AsBoolean := Usuario.Ativo;

    Query.ExecSQL;
    Result := True;
  finally
    Query.Free;
  end;
end;

function TUsuarioRepository.Atualizar(Usuario: TUsuario): Boolean;
var
  Query: TFDQuery;
begin
  Result := False;

  if not Assigned(DM) or not Assigned(DM.FDConn) then
    raise Exception.Create('Conexão com banco de dados não disponível.');

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM.FDConn;
    Query.SQL.Clear;
    Query.SQL.Add('UPDATE usuarios SET');
    Query.SQL.Add('  nome_user = :nome,');
    Query.SQL.Add('  email_user = :email,');
    Query.SQL.Add('  cpf_user = :cpf,');
    Query.SQL.Add('  nphone_user = :nphone,');
    Query.SQL.Add('  id_cargo = :id_cargo');
    Query.SQL.Add('WHERE id_user = :id_user');

    Query.ParamByName('nome').AsString := Usuario.NomeUser;
    Query.ParamByName('email').AsString := Usuario.EmailUser;
    Query.ParamByName('cpf').AsString := Usuario.CpfUser;
    Query.ParamByName('nphone').AsString := Usuario.NPhoneUser;
    Query.ParamByName('id_cargo').AsInteger := Usuario.IdCargo;
    Query.ParamByName('id_user').AsInteger := Usuario.IdUser;

    Query.ExecSQL;
    Result := True;
  finally
    Query.Free;
  end;
end;

function TUsuarioRepository.AlterarStatus(IdUsuario: Integer; Ativo: Boolean): Boolean;
var
  Query: TFDQuery;
begin
  Result := False;

  if not Assigned(DM) or not Assigned(DM.FDConn) then
    raise Exception.Create('Conexão com banco de dados não disponível.');

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM.FDConn;
    Query.SQL.Clear;
    Query.SQL.Add('UPDATE usuarios SET ativo = :ativo WHERE id_user = :id_user');

    Query.ParamByName('ativo').AsBoolean := Ativo;
    Query.ParamByName('id_user').AsInteger := IdUsuario;

    Query.ExecSQL;
    Result := True;
  finally
    Query.Free;
  end;
end;

function TUsuarioRepository.BuscarPorId(IdUsuario: Integer): TUsuario;
var
  Query: TFDQuery;
begin
  Result := nil;

  if not Assigned(DM) or not Assigned(DM.FDConn) then
    raise Exception.Create('Conexão com banco de dados não disponível.');

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM.FDConn;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT u.id_user, u.nome_user, u.email_user, u.cpf_user,');
    Query.SQL.Add('       u.nphone_user, u.id_cargo, c.desc_cargo, u.ativo');
    Query.SQL.Add('FROM usuarios u');
    Query.SQL.Add('INNER JOIN cargos c ON u.id_cargo = c.id_cargo');
    Query.SQL.Add('WHERE u.id_user = :id_user');

    Query.ParamByName('id_user').AsInteger := IdUsuario;
    Query.Open;

    if not Query.IsEmpty then
    begin
      Result := TUsuario.Create(
        Query.FieldByName('id_user').AsInteger,
        Query.FieldByName('nome_user').AsString,
        Query.FieldByName('email_user').AsString,
        Query.FieldByName('cpf_user').AsString,
        Query.FieldByName('nphone_user').AsString,
        Query.FieldByName('id_cargo').AsInteger,
        Query.FieldByName('desc_cargo').AsString,
        Query.FieldByName('ativo').AsBoolean
      );
    end;
  finally
    Query.Free;
  end;
end;

function TUsuarioRepository.ListarTodos(ApenasAtivos: Boolean): TObjectList<TUsuario>;
var
  Query: TFDQuery;
  Usuario: TUsuario;
begin
  Result := TObjectList<TUsuario>.Create(True); // True = libera objetos ao destruir

  if not Assigned(DM) or not Assigned(DM.FDConn) then
    raise Exception.Create('Conexão com banco de dados não disponível.');

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM.FDConn;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT u.id_user, u.nome_user, u.email_user, u.cpf_user,');
    Query.SQL.Add('       u.nphone_user, u.id_cargo, c.desc_cargo, u.ativo');
    Query.SQL.Add('FROM usuarios u');
    Query.SQL.Add('INNER JOIN cargos c ON u.id_cargo = c.id_cargo');

    if ApenasAtivos then
      Query.SQL.Add('WHERE u.ativo = True');

    Query.SQL.Add('ORDER BY u.id_user');
    Query.Open;

    while not Query.Eof do
    begin
      Usuario := TUsuario.Create(
        Query.FieldByName('id_user').AsInteger,
        Query.FieldByName('nome_user').AsString,
        Query.FieldByName('email_user').AsString,
        Query.FieldByName('cpf_user').AsString,
        Query.FieldByName('nphone_user').AsString,
        Query.FieldByName('id_cargo').AsInteger,
        Query.FieldByName('desc_cargo').AsString,
        Query.FieldByName('ativo').AsBoolean
      );
      Result.Add(Usuario);
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

function TUsuarioRepository.BuscarPorFiltro(Filtro: string; ApenasAtivos: Boolean): TObjectList<TUsuario>;
var
  Query: TFDQuery;
  Usuario: TUsuario;
  FiltroUpper: string;
begin
  Result := TObjectList<TUsuario>.Create(True);

  if not Assigned(DM) or not Assigned(DM.FDConn) then
    raise Exception.Create('Conexão com banco de dados não disponível.');

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM.FDConn;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT u.id_user, u.nome_user, u.email_user, u.cpf_user,');
    Query.SQL.Add('       u.nphone_user, u.id_cargo, c.desc_cargo, u.ativo');
    Query.SQL.Add('FROM usuarios u');
    Query.SQL.Add('INNER JOIN cargos c ON u.id_cargo = c.id_cargo');
    Query.SQL.Add('WHERE (');
    Query.SQL.Add('  UPPER(CAST(u.id_user AS VARCHAR)) LIKE :filtro OR');
    Query.SQL.Add('  UPPER(u.nome_user) LIKE :filtro OR');
    Query.SQL.Add('  UPPER(u.email_user) LIKE :filtro OR');
    Query.SQL.Add('  UPPER(u.cpf_user) LIKE :filtro OR');
    Query.SQL.Add('  UPPER(u.nphone_user) LIKE :filtro OR');
    Query.SQL.Add('  UPPER(c.desc_cargo) LIKE :filtro');
    Query.SQL.Add(')');

    if ApenasAtivos then
      Query.SQL.Add('AND u.ativo = True');

    Query.SQL.Add('ORDER BY u.id_user');

    FiltroUpper := '%' + UpperCase(Filtro) + '%';
    Query.ParamByName('filtro').AsString := FiltroUpper;
    Query.Open;

    while not Query.Eof do
    begin
      Usuario := TUsuario.Create(
        Query.FieldByName('id_user').AsInteger,
        Query.FieldByName('nome_user').AsString,
        Query.FieldByName('email_user').AsString,
        Query.FieldByName('cpf_user').AsString,
        Query.FieldByName('nphone_user').AsString,
        Query.FieldByName('id_cargo').AsInteger,
        Query.FieldByName('desc_cargo').AsString,
        Query.FieldByName('ativo').AsBoolean
      );
      Result.Add(Usuario);
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

function TUsuarioRepository.EmailJaExiste(Email: string; IdUsuarioIgnorar: Integer): Boolean;
var
  Query: TFDQuery;
begin
  Result := False;

  if not Assigned(DM) or not Assigned(DM.FDConn) then
    raise Exception.Create('Conexão com banco de dados não disponível.');

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM.FDConn;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT COUNT(*) as total FROM usuarios');
    Query.SQL.Add('WHERE email_user = :email');

    if IdUsuarioIgnorar > 0 then
      Query.SQL.Add('AND id_user <> :id_user');

    Query.ParamByName('email').AsString := Email;

    if IdUsuarioIgnorar > 0 then
      Query.ParamByName('id_user').AsInteger := IdUsuarioIgnorar;

    Query.Open;
    Result := Query.FieldByName('total').AsInteger > 0;
  finally
    Query.Free;
  end;
end;

function TUsuarioRepository.CpfJaExiste(Cpf: string; IdUsuarioIgnorar: Integer): Boolean;
var
  Query: TFDQuery;
begin
  Result := False;

  if not Assigned(DM) or not Assigned(DM.FDConn) then
    raise Exception.Create('Conexão com banco de dados não disponível.');

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM.FDConn;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT COUNT(*) as total FROM usuarios');
    Query.SQL.Add('WHERE cpf_user = :cpf');

    if IdUsuarioIgnorar > 0 then
      Query.SQL.Add('AND id_user <> :id_user');

    Query.ParamByName('cpf').AsString := Cpf;

    if IdUsuarioIgnorar > 0 then
      Query.ParamByName('id_user').AsInteger := IdUsuarioIgnorar;

    Query.Open;
    Result := Query.FieldByName('total').AsInteger > 0;
  finally
    Query.Free;
  end;
end;

end.
