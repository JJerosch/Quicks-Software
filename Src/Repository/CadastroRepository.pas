unit CadastroRepository;
interface
uses FireDAC.Comp.Client;
Type
  TCadastroRepository = class
  public
    function VerificarEmail(const AEmail: String): Boolean;
    procedure AddUser(const ANome, AEmail, ACpf, ASenha, ANPhone: String);
  end;
implementation
uses
  uConn;
procedure TCadastroRepository.AddUser(const ANome, AEmail, ACpf,
  ASenha, ANPhone: String);
begin
var
  Qr: TFDQuery;
begin
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text := 'INSERT INTO usuarios (nome_user, email_user, cpf_user, senha_user, nphone_user) VALUES (:nome, :email, :cpf, :senha, :nphone)';

    Qr.ParamByName('nome').AsString := ANome;
    Qr.ParamByName('email').AsString := AEmail;
    Qr.ParamByName('cpf').AsString := ACpf;
    Qr.ParamByName('senha').AsString := ASenha;
    Qr.ParamByName('nphone').AsString := ANPhone;

    Qr.ExecSQL; // Executa o comando de inserção
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
