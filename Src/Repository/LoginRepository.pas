unit LoginRepository;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, LoginModel;

type
  TLoginRepository = class
  public
    function BuscarUsuarioPorEmail(const Email: string): TLoginResponse;
  end;

implementation

uses
  uConn;

function TLoginRepository.BuscarUsuarioPorEmail(const Email: string): TLoginResponse;
var
  Qr: TFDQuery;
begin
  Result := TLoginResponse.Create;
  Result.Autenticado := False;

  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT u.id_user, u.nome_user, u.email_user, u.senha_user, u.ativo, c.id_cargo, c.desc_cargo');
    Qr.SQL.Add('FROM usuarios u');
    Qr.SQL.Add('INNER JOIN cargos c ON u.id_cargo = c.id_cargo');
    Qr.SQL.Add('WHERE u.email_user = :email');
    Qr.ParamByName('email').AsString := Email;
    Qr.Open;

    if not Qr.IsEmpty then
    begin
      Result.IdUsuario := Qr.FieldByName('id_user').AsInteger;
      Result.NomeUsuario := Qr.FieldByName('nome_user').AsString;
      Result.EmailUsuario := Qr.FieldByName('email_user').AsString;
      Result.SenhaHash := Qr.FieldByName('senha_user').AsString;
      Result.Ativo := Qr.FieldByName('ativo').AsBoolean;
      Result.IdCargo := Qr.FieldByName('id_cargo').AsInteger;
      Result.DescCargo := Qr.FieldByName('desc_cargo').AsString;
      Result.UsuarioEncontrado := True;
    end
    else
    begin
      Result.UsuarioEncontrado := False;
      Result.Mensagem := 'Usuário não encontrado.';
    end;
  finally
    Qr.Free;
  end;
end;

end.
