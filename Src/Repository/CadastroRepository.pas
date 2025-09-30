unit CadastroRepository;

interface
uses
  FireDAC.Comp.Client, SysUtils, vcl.Dialogs, CadastroModel;

type
  TCadastroRepository = class
  public
    function VerificarEmail(const AEmail: String): Boolean;
    function AddUser(const ANome, AEmail, ACpf, ASenha, ANPhone: String): Int64;
    function AddUserDonoComercio(Cadastro: TCadastroCfg): Boolean;
    function AddUserEntregador(Cadastro: TCadastroCfg): Boolean;
    function AddUserCliente(Cadastro: TCadastroCfg): Boolean;
  end;

implementation

uses
  uConn;

function TCadastroRepository.VerificarEmail(const AEmail: String): Boolean;
  var
    Qr: TFDQuery;
  begin
    Result := False;
    Qr := TFDQuery.Create(nil);
    try
      Qr.Connection := DM.FDConn;
      Qr.SQL.Text := 'SELECT 1 FROM usuarios WHERE email_user = :email';
      Qr.ParamByName('email').AsString := AEmail;
      Qr.Open;
      Result := not Qr.IsEmpty;
    finally
      Qr.Free;
    end;
  end;

function TCadastroRepository.AddUser(const ANome, AEmail, ACpf, ASenha, ANPhone: String): Int64;
  var
    Qr: TFDQuery;
  begin
    Result := 0;
    Qr := TFDQuery.Create(nil);
    try
      Qr.Connection := DM.FDConn;
      Qr.SQL.Text := 'INSERT INTO usuarios (nome_user, email_user, cpf_user, senha_user, nphone_user) ' + 'VALUES (:nome, :email, :cpf, :senha, :nphone) RETURNING id_user';
      Qr.ParamByName('nome').AsString := ANome;
      Qr.ParamByName('email').AsString := AEmail;
      Qr.ParamByName('cpf').AsString := ACpf;
      Qr.ParamByName('senha').AsString := ASenha;
      Qr.ParamByName('nphone').AsString := ANPhone;
      Qr.Open;
      if not Qr.IsEmpty then
        Result := Qr.Fields[0].AsLargeInt;
    finally
      Qr.Free;
    end;
  end;

function TCadastroRepository.AddUserDonoComercio(Cadastro: TCadastroCfg): Boolean;
  var
    Qr: TFDQuery;
    IdUsuario: Int64;
  begin
    Result := False;
    IdUsuario := AddUser(Cadastro.Nome, Cadastro.Email, Cadastro.CPF, Cadastro.Senha, Cadastro.NPhone);
    if IdUsuario > 0 then
    begin
      Qr := TFDQuery.Create(nil);
      try
        Qr.Connection := DM.FDConn;
        Qr.SQL.Text := 'INSERT INTO comerciantes (id_user) VALUES (:id_user)';
        Qr.ParamByName('id_user').AsLargeInt := IdUsuario;
        Qr.ExecSQL;
        Result := True;
      finally
        Qr.Free;
      end;
    end;
  end;

function TCadastroRepository.AddUserEntregador(Cadastro: TCadastroCfg): Boolean;
  var
    Qr: TFDQuery;
    IdUsuario: Int64;
  begin
    Result := False;
    IdUsuario := AddUser(Cadastro.Nome, Cadastro.Email, Cadastro.CPF, Cadastro.Senha, Cadastro.NPhone);
    if IdUsuario > 0 then
    begin
      Qr := TFDQuery.Create(nil);
      try
        Qr.Connection := DM.FDConn;
        Qr.SQL.Text := 'INSERT INTO entregadores (id_user) VALUES (:id_user)';
        Qr.ParamByName('id_user').AsLargeInt := IdUsuario;
        Qr.ExecSQL;
        Result := True;
      finally
        Qr.Free;
      end;
    end;
  end;

function TCadastroRepository.AddUserCliente(Cadastro: TCadastroCfg): Boolean;
  var
    Qr: TFDQuery;
    IdUsuario: Int64;
  begin
    Result := False;
    IdUsuario := AddUser(Cadastro.Nome, Cadastro.Email, Cadastro.CPF, Cadastro.Senha, Cadastro.NPhone);
    if IdUsuario > 0 then
    begin
      Qr := TFDQuery.Create(nil);
      try
        Qr.Connection := DM.FDConn;
        Qr.SQL.Text := 'INSERT INTO clientes (id_user) VALUES (:id_user)';
        Qr.ParamByName('id_user').AsLargeInt := IdUsuario;
        Qr.ExecSQL;
        Result := True;
      finally
        Qr.Free;
      end;
    end;
  end;
end.
