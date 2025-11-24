unit ClienteHelper;

interface

uses
  System.SysUtils, FireDAC.Comp.Client;

type
  TClienteHelper = class
  public
    class function ObterIdCliente(IdUsuario: Integer): Integer;
    class function ObterNomeCliente(IdUsuario: Integer): String;
    class function ObterEmailCliente(IdUsuario: Integer): String;
  end;

implementation

uses
  uConn;

{ TClienteHelper }

class function TClienteHelper.ObterIdCliente(IdUsuario: Integer): Integer;
var
  Qr: TFDQuery;
begin
  Result := 0;

  if IdUsuario <= 0 then
    Exit;

  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text := 'SELECT id_clie FROM clientes WHERE id_user = :id_user';
    Qr.ParamByName('id_user').AsInteger := IdUsuario;
    Qr.Open;

    if not Qr.IsEmpty then
      Result := Qr.FieldByName('id_clie').AsInteger;
  finally
    Qr.Free;
  end;
end;

class function TClienteHelper.ObterNomeCliente(IdUsuario: Integer): String;
var
  Qr: TFDQuery;
begin
  Result := '';

  if IdUsuario <= 0 then
    Exit;

  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text := 'SELECT nome_user FROM usuarios WHERE id_user = :id_user';
    Qr.ParamByName('id_user').AsInteger := IdUsuario;
    Qr.Open;

    if not Qr.IsEmpty then
      Result := Qr.FieldByName('nome_user').AsString;
  finally
    Qr.Free;
  end;
end;

class function TClienteHelper.ObterEmailCliente(IdUsuario: Integer): String;
var
  Qr: TFDQuery;
begin
  Result := '';

  if IdUsuario <= 0 then
    Exit;

  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text := 'SELECT email_user FROM usuarios WHERE id_user = :id_user';
    Qr.ParamByName('id_user').AsInteger := IdUsuario;
    Qr.Open;

    if not Qr.IsEmpty then
      Result := Qr.FieldByName('email_user').AsString;
  finally
    Qr.Free;
  end;
end;

end.
