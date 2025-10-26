unit UsuarioViewHelperCRUDAdmin;

interface

uses
  System.SysUtils, System.Generics.Collections, Vcl.StdCtrls,
  Data.DB, FireDAC.Comp.Client,
  UsuarioModelCRUDAdmin, CargosModelCRUDAdmin;

type
  TUsuarioViewHelper = class
  public
    class procedure PreencherComboBoxCargos(ComboBox: TComboBox; Cargos: TObjectList<TCargo>);
    class procedure SelecionarCargoPorId(ComboBox: TComboBox; IdCargo: Integer);
    class function ObterIdCargoSelecionado(ComboBox: TComboBox): Integer;
    class procedure PreencherMemTableUsuarios(MemTable: TFDMemTable; Usuarios: TObjectList<TUsuario>);
  end;

implementation

class procedure TUsuarioViewHelper.PreencherComboBoxCargos(ComboBox: TComboBox; Cargos: TObjectList<TCargo>);
var
  Cargo: TCargo;
begin
  ComboBox.Clear;

  for Cargo in Cargos do
    ComboBox.Items.AddObject(Cargo.DescCargo, TObject(Cargo.IdCargo));

  ComboBox.ItemIndex := -1;
end;

class procedure TUsuarioViewHelper.SelecionarCargoPorId(ComboBox: TComboBox; IdCargo: Integer);
var
  i: Integer;
begin
  for i := 0 to ComboBox.Items.Count - 1 do
  begin
    if Integer(ComboBox.Items.Objects[i]) = IdCargo then
    begin
      ComboBox.ItemIndex := i;
      Exit;
    end;
  end;
end;

class function TUsuarioViewHelper.ObterIdCargoSelecionado(ComboBox: TComboBox): Integer;
begin
  Result := 0;
  if (ComboBox.ItemIndex >= 0) then
    Result := Integer(ComboBox.Items.Objects[ComboBox.ItemIndex]);
end;

class procedure TUsuarioViewHelper.PreencherMemTableUsuarios(MemTable: TFDMemTable; Usuarios: TObjectList<TUsuario>);
var
  Usuario: TUsuario;
  CriarEstrutura: Boolean;
begin
  // Verificar se precisa criar estrutura
  CriarEstrutura := (MemTable.FieldDefs.Count = 0);

  // Fechar se estiver aberto
  if MemTable.Active then
    MemTable.Close;

  // Criar estrutura apenas se necessário
  if CriarEstrutura then
  begin
    with MemTable.FieldDefs do
    begin
      Clear;
      Add('id_user', ftInteger);
      Add('nome_user', ftString, 100);
      Add('email_user', ftString, 100);
      Add('cpf_user', ftString, 14);
      Add('nphone_user', ftString, 15);
      Add('desc_cargo', ftString, 50);
      Add('ativo', ftBoolean);
    end;
    MemTable.CreateDataSet;
  end
  else
  begin
    MemTable.Open;
    MemTable.EmptyDataSet;
  end;

  // Preencher dados
  for Usuario in Usuarios do
  begin
    MemTable.Append;
    MemTable.FieldByName('id_user').AsInteger := Usuario.IdUser;
    MemTable.FieldByName('nome_user').AsString := Usuario.NomeUser;
    MemTable.FieldByName('email_user').AsString := Usuario.EmailUser;
    MemTable.FieldByName('cpf_user').AsString := Usuario.CpfUser;
    MemTable.FieldByName('nphone_user').AsString := Usuario.NPhoneUser;
    MemTable.FieldByName('desc_cargo').AsString := Usuario.DescCargo;
    MemTable.FieldByName('ativo').AsBoolean := Usuario.Ativo;
    MemTable.Post;
  end;

  if not MemTable.IsEmpty then
    MemTable.First;
end;

end.
