unit CadastroRepository;

interface
uses
  FireDAC.Comp.Client, SysUtils, vcl.Dialogs, CadastroModel;

type
  TCadastroRepository = class
  public
    function VerificarEmail(const AEmail: String): Boolean;
    function AddUser(const ANome, AEmail, ACpf, ASenha, ANPhone: String; AIdTipoUsuario: Integer): Int64;
    function AddUserTipoUsuario(Cadastro: TCadastroCfg): Boolean;
  end;

implementation

uses
  uConn, PasswordHelper; // ⭐ ADICIONE AQUI

function TCadastroRepository.VerificarEmail(const AEmail: String): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Close;
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text := 'SELECT 1 FROM usuarios WHERE email_user = :email';
    Qr.ParamByName('email').AsString := AEmail;
    Qr.Open;
    Result := not Qr.IsEmpty;
  finally
    Qr.Free;
  end;
end;

function TCadastroRepository.AddUser(const ANome, AEmail, ACpf, ASenha, ANPhone: String; AIdTipoUsuario: Integer): Int64;
var
  Qr: TFDQuery;
  SenhaHash: string; // ⭐ ADICIONE ESTA VARIÁVEL
begin
  Result := 0;
  Qr := TFDQuery.Create(nil);
  try
    // ⭐ GERAR O HASH DA SENHA ANTES DE INSERIR
    SenhaHash := TPasswordHelper.HashPassword(ASenha);

    Qr.Close;
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text := 'INSERT INTO usuarios (nome_user, email_user, cpf_user, senha_user, nphone_user, ativo, id_cargo) ' +
                   'VALUES (:nome, :email, :cpf, :senha, :nphone, ''true'', :id_cargo) RETURNING id_user';

    Qr.ParamByName('nome').AsString := ANome;
    Qr.ParamByName('email').AsString := AEmail;
    Qr.ParamByName('cpf').AsString := ACpf;
    Qr.ParamByName('senha').AsString := SenhaHash; // ⭐ USAR O HASH AQUI
    Qr.ParamByName('nphone').AsString := ANPhone;
    Qr.ParamByName('id_cargo').AsInteger := AIdTipoUsuario;

    Qr.Open;

    if not Qr.IsEmpty then
      Result := Qr.Fields[0].AsLargeInt;
  finally
    Qr.Free;
  end;
end;

function TCadastroRepository.AddUserTipoUsuario(Cadastro: TCadastroCfg): Boolean;
var
  Qr: TFDQuery;
  IdUsuario: Int64;
begin
  Result := False;
  IdUsuario := AddUser(Cadastro.Nome, Cadastro.Email, Cadastro.CPF, Cadastro.Senha, Cadastro.NPhone, Cadastro.IdTipoUsuario);

  if IdUsuario > 0 then
  begin
    Qr := TFDQuery.Create(nil);
    try
      Qr.Connection := DM.FDConn;
      Qr.SQL.Text := 'INSERT INTO usuarios_cargos (id_user, id_cargo) VALUES (:id_user, :id_cargo)';
      Qr.ParamByName('id_user').AsLargeInt := IdUsuario;
      Qr.ParamByName('id_cargo').AsInteger := Cadastro.IdTipoUsuario;
      Qr.ExecSQL;

      Result := True;
    finally
      Qr.Free;
    end;
  end;
end;

end.
