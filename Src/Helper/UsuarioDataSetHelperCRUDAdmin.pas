unit UsuarioDataSetHelperCRUDAdmin;

interface

uses
  System.SysUtils, System.Generics.Collections, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, UsuarioModelCRUDAdmin;

type
  TUsuarioDataSetHelper = class
  public
    class function ConverterListaParaDataSet(Lista: TObjectList<TUsuario>): TFDMemTable;
  end;

implementation

{ TUsuarioDataSetHelper }

class function TUsuarioDataSetHelper.ConverterListaParaDataSet(
  Lista: TObjectList<TUsuario>): TFDMemTable;
var
  Usuario: TUsuario;
begin
  Result := TFDMemTable.Create(nil);

  // Criar estrutura da tabela em memória
  with Result do
  begin
    FieldDefs.Add('id_user', ftInteger);
    FieldDefs.Add('nome_user', ftString, 100);
    FieldDefs.Add('email_user', ftString, 100);
    FieldDefs.Add('cpf_user', ftString, 14);
    FieldDefs.Add('nphone_user', ftString, 15);
    FieldDefs.Add('desc_cargo', ftString, 50);
    FieldDefs.Add('id_cargo', ftInteger);
    FieldDefs.Add('ativo', ftBoolean);
    CreateDataSet;
  end;

  // Preencher com os dados da lista
  if Assigned(Lista) then
  begin
    for Usuario in Lista do
    begin
      Result.Append;
      Result.FieldByName('id_user').AsInteger := Usuario.IdUser;
      Result.FieldByName('nome_user').AsString := Usuario.NomeUser;
      Result.FieldByName('email_user').AsString := Usuario.EmailUser;
      Result.FieldByName('cpf_user').AsString := Usuario.CpfUser;
      Result.FieldByName('nphone_user').AsString := Usuario.NPhoneUser;
      Result.FieldByName('desc_cargo').AsString := Usuario.DescCargo;
      Result.FieldByName('id_cargo').AsInteger := Usuario.IdCargo;
      Result.FieldByName('ativo').AsBoolean := Usuario.Ativo;
      Result.Post;
    end;

    Result.First;
  end;
end;

end.
