unit LoginRepository;

interface
uses FireDAC.Comp.Client, System.SysUtils, uConn;

Type TLoginRepository = class
  public
    function VerificarUser(const ALogin, ASenha: String): Boolean;
end;
implementation
  function TLoginRepository.VerificarUser(const ALogin, ASenha: String): Boolean;
    var Qr: TFDQuery;
    begin
      Result := False;
      Qr := TFDQuery.Create(nil);
      try
        Qr.Connection:=DM.FDConn;
        Qr.SQL.Text:='SELECT 1 FROM usuarios WHERE email_user = :email AND senha_user = :senha';

        Qr.ParamByName('email').AsString:=ALogin;
        Qr.ParamByName('senha').AsString:=ASenha;

        Qr.Open;

        Result:=not Qr.IsEmpty;
      finally
        Qr.Free;
      end;
    end;
end.
