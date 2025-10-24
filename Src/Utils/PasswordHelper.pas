unit PasswordHelper;

interface

uses
  BCrypt;

type
  TPasswordHelper = class
  public
    class function HashPassword(const Password: string): string;
    class function VerifyPassword(const Password, Hash: string): Boolean;
  end;

implementation

uses
  System.SysUtils;

class function TPasswordHelper.HashPassword(const Password: string): string;
begin
  // ✅ Gera o hash BCrypt (já está funcionando)
  Result := TBCrypt.HashPassword(Password);
end;

class function TPasswordHelper.VerifyPassword(const Password, Hash: string): Boolean;
var
  PasswordRehashNeeded: Boolean;
begin
  try
    // ✅ CORREÇÃO: CheckPassword precisa de 3 parâmetros!
    // O terceiro parâmetro indica se a senha precisa ser rehasheada (ignoramos por enquanto)
    Result := TBCrypt.CheckPassword(Password, Hash, PasswordRehashNeeded);
  except
    on E: Exception do
      Result := False;
  end;
end;

end.
