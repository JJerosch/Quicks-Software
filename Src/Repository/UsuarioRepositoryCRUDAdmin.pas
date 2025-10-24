unit UsuarioRepositoryCRUDAdmin;

interface

uses
  System.SysUtils, System.Generics.Collections, FireDAC.Comp.Client,
  UsuarioModelCRUDAdmin, CargosModelCRUDAdmin;

type
  TUsuarioRepository = class
  private
    function DataSetToUsuario(DataSet: TFDQuery): TUsuario;
  public
    function BuscarTodos(ApenasAtivos: Boolean): TObjectList<TUsuario>;
    function BuscarPorId(IdUsuario: Integer): TUsuario;
    function Inserir(Usuario: TUsuario; SenhaHash: string): Boolean;
    function Atualizar(Usuario: TUsuario): Boolean;
    function AlterarStatus(IdUsuario: Integer; NovoStatus: Boolean): Boolean;
    function EmailJaExiste(const Email: string; IdUsuarioIgnorar: Integer = 0): Boolean;
    function CPFJaExiste(const CPF: string; IdUsuarioIgnorar: Integer = 0): Boolean;
  end;

implementation

uses
  uConn;

{ TUsuarioRepository }

function TUsuarioRepository.DataSetToUsuario(DataSet: TFDQuery): TUsuario;
begin
  Result := TUsuario.Create;
  Result.IdUser := DataSet.FieldByName('id_user').AsInteger;
  Result.NomeUser := DataSet.FieldByName('nome_user').AsString;
  Result.EmailUser := DataSet.FieldByName('email_user').AsString;
  Result.CpfUser := DataSet.FieldByName('cpf_user').AsString;
  Result.NPhoneUser := DataSet.FieldByName('nphone_user').AsString;
  Result.IdCargo := DataSet.FieldByName('id_cargo').AsInteger;
  Result.DescCargo := DataSet.FieldByName('desc_cargo').AsString;
  Result.Ativo := DataSet.FieldByName('ativo').AsBoolean;
end;

function TUsuarioRepository.BuscarTodos(ApenasAtivos: Boolean): TObjectList<TUsuario>;
var
  Qr: TFDQuery;
begin
  Result := TObjectList<TUsuario>.Create(True);
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT u.id_user, u.nome_user, u.email_user, u.cpf_user,');
    Qr.SQL.Add('       u.nphone_user, u.id_cargo, c.desc_cargo, u.ativo');
    Qr.SQL.Add('FROM usuarios u');
    Qr.SQL.Add('INNER JOIN cargos c ON u.id_cargo = c.id_cargo');

    if ApenasAtivos then
      Qr.SQL.Add('WHERE u.ativo = TRUE');

    Qr.SQL.Add('ORDER BY u.id_user');
    Qr.Open;

    while not Qr.Eof do
    begin
      Result.Add(DataSetToUsuario(Qr));
      Qr.Next;
    end;
  finally
    Qr.Free;
  end;
end;

function TUsuarioRepository.BuscarPorId(IdUsuario: Integer): TUsuario;
var
  Qr: TFDQuery;
begin
  Result := nil;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT u.id_user, u.nome_user, u.email_user, u.cpf_user,');
    Qr.SQL.Add('       u.nphone_user, u.id_cargo, c.desc_cargo, u.ativo');
    Qr.SQL.Add('FROM usuarios u');
    Qr.SQL.Add('INNER JOIN cargos c ON u.id_cargo = c.id_cargo');
    Qr.SQL.Add('WHERE u.id_user = :id_user');
    Qr.ParamByName('id_user').AsInteger := IdUsuario;
    Qr.Open;

    if not Qr.IsEmpty then
      Result := DataSetToUsuario(Qr);
  finally
    Qr.Free;
  end;
end;

function TUsuarioRepository.Inserir(Usuario: TUsuario; SenhaHash: string): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('INSERT INTO usuarios (nome_user, email_user, cpf_user, senha_user,');
    Qr.SQL.Add('                      nphone_user, id_cargo, ativo)');
    Qr.SQL.Add('VALUES (:nome, :email, :cpf, :senha, :nphone, :id_cargo, TRUE)');

    Qr.ParamByName('nome').AsString := Usuario.NomeUser;
    Qr.ParamByName('email').AsString := Usuario.EmailUser;
    Qr.ParamByName('cpf').AsString := Usuario.CpfUser;
    Qr.ParamByName('senha').AsString := SenhaHash;
    Qr.ParamByName('nphone').AsString := Usuario.NPhoneUser;
    Qr.ParamByName('id_cargo').AsInteger := Usuario.IdCargo;

    Qr.ExecSQL;
    Result := True;
  finally
    Qr.Free;
  end;
end;

function TUsuarioRepository.Atualizar(Usuario: TUsuario): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('UPDATE usuarios SET');
    Qr.SQL.Add('  nome_user = :nome,');
    Qr.SQL.Add('  email_user = :email,');
    Qr.SQL.Add('  cpf_user = :cpf,');
    Qr.SQL.Add('  nphone_user = :nphone,');
    Qr.SQL.Add('  id_cargo = :id_cargo');
    Qr.SQL.Add('WHERE id_user = :id_user');

    Qr.ParamByName('nome').AsString := Usuario.NomeUser;
    Qr.ParamByName('email').AsString := Usuario.EmailUser;
    Qr.ParamByName('cpf').AsString := Usuario.CpfUser;
    Qr.ParamByName('nphone').AsString := Usuario.NPhoneUser;
    Qr.ParamByName('id_cargo').AsInteger := Usuario.IdCargo;
    Qr.ParamByName('id_user').AsInteger := Usuario.IdUser;

    Qr.ExecSQL;
    Result := True;
  finally
    Qr.Free;
  end;
end;

function TUsuarioRepository.AlterarStatus(IdUsuario: Integer; NovoStatus: Boolean): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('UPDATE usuarios SET ativo = :ativo WHERE id_user = :id_user');
    Qr.ParamByName('ativo').AsBoolean := NovoStatus;
    Qr.ParamByName('id_user').AsInteger := IdUsuario;
    Qr.ExecSQL;
    Result := True;
  finally
    Qr.Free;
  end;
end;

function TUsuarioRepository.EmailJaExiste(const Email: string; IdUsuarioIgnorar: Integer): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT 1 FROM usuarios WHERE email_user = :email');

    if IdUsuarioIgnorar > 0 then
      Qr.SQL.Add('AND id_user <> :id_user');

    Qr.ParamByName('email').AsString := Email;

    if IdUsuarioIgnorar > 0 then
      Qr.ParamByName('id_user').AsInteger := IdUsuarioIgnorar;

    Qr.Open;
    Result := not Qr.IsEmpty;
  finally
    Qr.Free;
  end;
end;

function TUsuarioRepository.CPFJaExiste(const CPF: string; IdUsuarioIgnorar: Integer): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT 1 FROM usuarios WHERE cpf_user = :cpf');

    if IdUsuarioIgnorar > 0 then
      Qr.SQL.Add('AND id_user <> :id_user');

    Qr.ParamByName('cpf').AsString := CPF;

    if IdUsuarioIgnorar > 0 then
      Qr.ParamByName('id_user').AsInteger := IdUsuarioIgnorar;

    Qr.Open;
    Result := not Qr.IsEmpty;
  finally
    Qr.Free;
  end;
end;

end.
