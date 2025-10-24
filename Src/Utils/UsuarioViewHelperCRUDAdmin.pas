unit UsuarioViewHelperCRUDAdmin;

interface

uses
  System.SysUtils, System.Generics.Collections, Vcl.StdCtrls, Vcl.Grids,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param,
  UsuarioModelCRUDAdmin, CargosModelCRUDAdmin;

type
  TUsuarioViewHelper = class
  public
    class procedure PreencherComboBoxCargos(ComboBox: TComboBox; Cargos: TObjectList<TCargo>);
    class procedure SelecionarCargoPorId(ComboBox: TComboBox; IdCargo: Integer);
    class function ObterIdCargoSelecionado(ComboBox: TComboBox): Integer;
    class procedure PreencherMemTableUsuarios(MemTable: TFDMemTable; Usuarios: TObjectList<TUsuario>);
    class procedure LimparCamposUsuario(Nome, Email, CPF, NPhone: TEdit; Cargo: TComboBox);
  end;

implementation

{ TUsuarioViewHelper }

class procedure TUsuarioViewHelper.PreencherComboBoxCargos(ComboBox: TComboBox; Cargos: TObjectList<TCargo>);
var
  Cargo: TCargo;
begin
  ComboBox.Clear;
  ComboBox.Items.Clear;

  for Cargo in Cargos do
  begin
    ComboBox.Items.AddObject(Cargo.DescCargo, TObject(Cargo.IdCargo));
  end;

  ComboBox.ItemIndex := -1;
end;

class procedure TUsuarioViewHelper.SelecionarCargoPorId(ComboBox: TComboBox; IdCargo: Integer);
var
  i: Integer;
begin
  ComboBox.ItemIndex := -1;

  for i := 0 to ComboBox.Items.Count - 1 do
  begin
    if Integer(ComboBox.Items.Objects[i]) = IdCargo then
    begin
      ComboBox.ItemIndex := i;
      Break;
    end;
  end;
end;

class function TUsuarioViewHelper.ObterIdCargoSelecionado(ComboBox: TComboBox): Integer;
begin
  Result := 0;

  if (ComboBox.ItemIndex >= 0) and (ComboBox.ItemIndex < ComboBox.Items.Count) then
    Result := Integer(ComboBox.Items.Objects[ComboBox.ItemIndex]);
end;

class procedure TUsuarioViewHelper.PreencherMemTableUsuarios(MemTable: TFDMemTable; Usuarios: TObjectList<TUsuario>);
var
  Usuario: TUsuario;
begin
  MemTable.Close;

  // Criar estrutura da MemTable se não existir
  if MemTable.FieldDefs.Count = 0 then
  begin
    MemTable.FieldDefs.Clear;
    MemTable.FieldDefs.Add('id_user', ftInteger);
    MemTable.FieldDefs.Add('nome_user', ftString, 100);
    MemTable.FieldDefs.Add('email_user', ftString, 100);
    MemTable.FieldDefs.Add('cpf_user', ftString, 14);
    MemTable.FieldDefs.Add('nphone_user', ftString, 15);
    MemTable.FieldDefs.Add('desc_cargo', ftString, 50);
    MemTable.FieldDefs.Add('ativo', ftBoolean);
    MemTable.CreateDataSet;
  end
  else
  begin
    MemTable.Open;
  end;

  MemTable.EmptyDataSet;

  // Preencher com dados
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

  MemTable.First;
end;

class procedure TUsuarioViewHelper.LimparCamposUsuario(Nome, Email, CPF, NPhone: TEdit; Cargo: TComboBox);
begin
  Nome.Clear;
  Email.Clear;
  CPF.Clear;
  NPhone.Clear;
  Cargo.ItemIndex := -1;
end;

end.
