unit CadastroRepository;
interface
uses FireDAC.Comp.Client, SysUtils, vcl.Dialogs;
Type
  TCadastroRepository = class
  public
    function VerificarEmail(const AEmail: String): Boolean;
    function AddUser(const ANome, AEmail, ACpf, ASenha, ANPhone: String): Integer;
    //class procedure AddUserDonoComercio();
    //class procedure AddUserEntregador();
    //class procedure AddUserCliente();
  end;
implementation
uses
  uConn;
function TCadastroRepository.AddUser(const ANome, AEmail, ACpf, ASenha, ANPhone: String): Integer;
begin
var
  Qr: TFDQuery;

begin
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text:='INSERT INTO usuarios (nome_user, email_user, cpf_user, senha_user, nphone_user) VALUES (:nome, :email, :cpf, :senha, :nphone) RETURNING id_user';
    Qr.ParamByName('nome').AsString := ANome;
    Qr.ParamByName('email').AsString := AEmail;
    Qr.ParamByName('cpf').AsString := ACpf;
    Qr.ParamByName('senha').AsString := ASenha;
    Qr.ParamByName('nphone').AsString := ANPhone;
    Qr.Open;
    if not Qr.IsEmpty then
      Result := Qr.Fields[0].AsInteger
    else
      Result := 0;
  finally
    Qr.Free;

  end;
end;
end;
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

end.
