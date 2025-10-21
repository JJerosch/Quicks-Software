unit LoginRepository;

interface
uses
  FireDAC.Comp.Client, System.SysUtils, uConn, LoginModel;

type
  TLoginRepository = class
  public
    function BuscarUsuarioPorCredenciais(const AEmail, ASenha: String): TLoginResponse;
  end;

implementation

{ TLoginRepository }

function TLoginRepository.BuscarUsuarioPorCredenciais(const AEmail, ASenha: String): TLoginResponse;
var
  Qr: TFDQuery;
begin
  Result := TLoginResponse.Create;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;

    // Query que busca o usuário com seu cargo através da tabela de relação
    Qr.SQL.Text :=
      'SELECT ' +
      '  u.id_user, ' +
      '  u.nome_user, ' +
      '  u.email_user, ' +
      '  c.id_cargo, ' +
      '  c.desc_cargo ' +
      'FROM usuarios u ' +
      'INNER JOIN usuarios_cargos uc ON u.id_user = uc.id_user ' +
      'INNER JOIN cargos c ON uc.id_cargo = c.id_cargo ' +
      'WHERE u.email_user = :email ' +
      '  AND u.senha_user = :senha ' +
      '  AND u.ativo = true';

    Qr.ParamByName('email').AsString := AEmail;
    Qr.ParamByName('senha').AsString := ASenha;

    Qr.Open;

    if not Qr.IsEmpty then
    begin
      Result.Autenticado := True;
      Result.IdUsuario := Qr.FieldByName('id_user').AsInteger;
      Result.NomeUsuario := Qr.FieldByName('nome_user').AsString;
      Result.IdCargo := Qr.FieldByName('id_cargo').AsInteger;
      Result.DescCargo := Qr.FieldByName('desc_cargo').AsString;

      // Determina o tipo de usuário baseado no id_cargo (conforme imagem)
      case Result.IdCargo of
        1: Result.TipoUsuario := tuCliente;
        2: Result.TipoUsuario := tuComercio;
        3: Result.TipoUsuario := tuEntregador;
        4: Result.TipoUsuario := tuAdmin;
      else
        Result.TipoUsuario := tuInvalido;
      end;

      Result.Mensagem := 'Login realizado com sucesso!';
    end
    else
    begin
      Result.Autenticado := False;
      Result.Mensagem := 'Email ou senha inválidos!';
    end;

  finally
    Qr.Free;
  end;
end;

end.
