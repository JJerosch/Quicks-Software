unit FormHomeAdmin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, uConn, CadastroModel, CadastroController,
  Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFormHomeA = class(TForm)
    pHomeBackground: TPanel;
    pListViewMain: TPanel;
    pcMain: TPageControl;
    pctab1Selecione: TTabSheet;
    pText: TPanel;
    lblText: TLabel;
    pctab2Relatorios: TTabSheet;
    pBarraMenuLeft: TPanel;
    iButton1: TImage;
    iButton3: TImage;
    iButton2: TImage;
    iButton6: TImage;
    lblButton1: TLabel;
    lblButton2: TLabel;
    lblButton3: TLabel;
    lblButton4: TLabel;
    iButton5: TImage;
    lblButton5: TLabel;
    iButton4: TImage;
    pctab3Pedidos: TTabSheet;
    pctab4Usuarios: TTabSheet;
    pctab5Perfil: TTabSheet;
    pHeader: TPanel;
    pMainUsuarios: TPanel;
    pMainGrid: TPanel;
    pBusca: TPanel;
    DBGridUsuarios: TDBGrid;
    pButton2Excluir: TPanel;
    pButton3Atualizar: TPanel;
    pButton4Restaurar: TPanel;
    pButton5Pesquisar: TPanel;
    pButton1Adicionar: TPanel;
    pButton6Cancelar: TPanel;
    pcButtons: TPageControl;
    pctab0Clique: TTabSheet;
    pMainPTab0: TPanel;
    lblClique: TLabel;
    pctab1Add: TTabSheet;
    pctab2Ex: TTabSheet;
    pctab3Up: TTabSheet;
    pctab4Res: TTabSheet;
    pctab5Pesq: TTabSheet;
    eBuscaMain: TEdit;
    pHideTSbar: TPanel;
    pLR: TPanel;
    lblSenha: TLabel;
    lblEmail: TLabel;
    lblCPF: TLabel;
    lblNome: TLabel;
    lblNPhone: TLabel;
    meCPF: TMaskEdit;
    bCadastro: TPanel;
    eEmail: TEdit;
    eNome: TEdit;
    meSenha: TMaskEdit;
    cbOpcoes: TComboBox;
    meNPhone: TMaskEdit;
    eNPhone: TEdit;
    eCPF: TEdit;
    lblTituloMain: TLabel;
    pConfirmarRestore: TPanel;
    pButtonConfirmarRestore: TPanel;
    pUserSelectionRestore: TPanel;
    lblDescUserSelectRes: TLabel;
    lblUserSelectRes: TLabel;
    pBackgroundExcluir: TPanel;
    pButtonConfirmarExcluir: TPanel;
    pUserSelectionEx: TPanel;
    lblDescUserSelectEx: TLabel;
    lblUserSelectEx: TLabel;
    pBackgroundUpdate: TPanel;
    lblEmailUpdate: TLabel;
    lblCPFUpdate: TLabel;
    lblNomeUpdate: TLabel;
    lblNPhoneUpdate: TLabel;
    lblPreenchaUpdate: TLabel;
    meCPFUpdate: TMaskEdit;
    pButtonConfirmarUpdate: TPanel;
    eEmailUpdate: TEdit;
    eNomeUpdate: TEdit;
    cbUpdate: TComboBox;
    meNPhoneUpdate: TMaskEdit;
    Panel3: TPanel;
    Label7: TLabel;
    Label1: TLabel;
    QueryUp: TFDQuery;
    procedure iButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pButton1AdicionarClick(Sender: TObject);
    procedure pButton2ExcluirClick(Sender: TObject);
    procedure pButton3AtualizarClick(Sender: TObject);
    procedure pButton5PesquisarClick(Sender: TObject);
    procedure pButton6CancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bCadastroClick(Sender: TObject);
    procedure eCPFChange(Sender: TObject);
    procedure eCPFClick(Sender: TObject);
    procedure eNPhoneChange(Sender: TObject);
    procedure pButtonConfirmarExcluirClick(Sender: TObject);
    procedure pButtonConfirmarRestoreClick(Sender: TObject);
    procedure pButton4RestaurarClick(Sender: TObject);
    procedure DBGridUsuariosCellClick(Column: TColumn);
    procedure pButtonConfirmarUpdateClick(Sender: TObject);
    procedure eBuscaMainChange(Sender: TObject);
  private
    FIdUsuarioSelecionado: Integer;
    procedure CarregarCargos;
    procedure CarregarCargosUpdate;
    procedure OrganizarGrid;
    procedure LimparCamposUpdate;
    procedure CarregarDadosUpdate(IdUsuario: Integer);
    procedure AtualizarGrid;
    procedure AtualizarGridFalse;
    procedure AtualizarGridTrue;
    procedure FiltrarGrid(const TextoBusca: string);
  public

  end;
var
  FormHomeA: TFormHomeA;

implementation
{$R *.dfm}
procedure TFormHomeA.AtualizarGrid;
begin
  try
    if not Assigned(DM) then
    begin
      ShowMessage('DataModule não está disponível.');
      Exit;
    end;
    if not Assigned(DM.FDQr) then
    begin
      ShowMessage('FDQuery não está disponível.');
      Exit;
    end;
    if not Assigned(DM.FDConn) or not DM.FDConn.Connected then
    begin
      ShowMessage('Banco de dados não conectado.');
      Exit;
    end;
    if not Assigned(DBGridUsuarios.DataSource) then
    begin
      ShowMessage('DataSource não está conectado ao Grid.');
      Exit;
    end;
    try
      with DM.FDQr do
      begin
        try
          DisableControls;
          if Active then
            Close;
          SQL.Clear;
          // AQUI É ONDE VOCÊ GARANTE QUE ID_CARGO ESTÁ INCLUÍDO
          SQL.Add('SELECT u.id_user, u.nome_user, u.email_user, u.cpf_user, u.nphone_user, c.desc_cargo, u.id_cargo, u.ativo');
          SQL.Add('FROM usuarios u');
          SQL.Add('INNER JOIN cargos c ON u.id_cargo = c.id_cargo'); // Certifique-se que o INNER JOIN esteja correto
          SQL.Add('WHERE u.ativo = True');
          SQL.Add('ORDER BY u.id_user');
          Open;
          if IsEmpty then
          begin
            ShowMessage('Nenhum usuário ativo encontrado.');
          end
          else
          begin
            First;
          end;
          Filtered := False;
          Filter := '';
          Refresh;
        finally
          EnableControls;
        end;
      end;
      OrganizarGrid;
      eBuscaMain.Clear;
    except
      on E: Exception do
        ShowMessage('Erro ao atualizar grid: ' + E.Message);
    end;
  finally
  end;
end;

procedure TFormHomeA.AtualizarGridFalse;
begin
  try
    if not Assigned(DM) then
    begin
      ShowMessage('DataModule não está disponível.');
      Exit;
    end;
    if not Assigned(DM.FDQr) then
    begin
      ShowMessage('FDQuery não está disponível.');
      Exit;
    end;
    if not Assigned(DM.FDConn) or not DM.FDConn.Connected then
    begin
      ShowMessage('Banco de dados não conectado.');
      Exit;
    end;
    if not Assigned(DBGridUsuarios.DataSource) then
    begin
      ShowMessage('DataSource não está conectado ao Grid.');
      Exit;
    end;
    try
      with DM.FDQr do
      begin
        try
          DisableControls;
          if Active then
            Close;
          SQL.Clear;
          SQL.Add('SELECT u.id_user, u.nome_user, u.email_user, u.cpf_user, u.nphone_user, c.desc_cargo, u.id_cargo, u.ativo');
          SQL.Add('FROM usuarios u');
          SQL.Add('INNER JOIN cargos c ON u.id_cargo = c.id_cargo');
          SQL.Add('WHERE u.ativo = False');
          SQL.Add('ORDER BY u.id_user');
          Open;
          if IsEmpty then
          begin
            ShowMessage('Nenhum usuário inativo encontrado.');
          end
          else
          begin
            First;
          end;
          Filtered := False;
          Filter := '';
          Refresh;
        finally
          EnableControls;
        end;
      end;
      OrganizarGrid;
      eBuscaMain.Clear;
    except
      on E: Exception do
        ShowMessage('Erro ao atualizar grid: ' + E.Message);
    end;
  finally
  end;
end;

procedure TFormHomeA.AtualizarGridTrue;
begin
  try
    if not Assigned(DM) then
    begin
      ShowMessage('DataModule não está disponível.');
      Exit;
    end;
    if not Assigned(DM.FDQr) then
    begin
      ShowMessage('FDQuery não está disponível.');
      Exit;
    end;
    if not Assigned(DM.FDConn) or not DM.FDConn.Connected then
    begin
      ShowMessage('Banco de dados não conectado.');
      Exit;
    end;
    if not Assigned(DBGridUsuarios.DataSource) then
    begin
      ShowMessage('DataSource não está conectado ao Grid.');
      Exit;
    end;
    try
      with DM.FDQr do
      begin
        try
          DisableControls;
          if Active then
            Close;
          SQL.Clear;
          SQL.Add('SELECT u.id_user, u.nome_user, u.email_user, u.cpf_user, u.nphone_user, c.desc_cargo, u.id_cargo, u.ativo');
          SQL.Add('FROM usuarios u');
          SQL.Add('INNER JOIN cargos c ON u.id_cargo = c.id_cargo');
          SQL.Add('WHERE u.ativo = True');
          SQL.Add('ORDER BY u.id_user');
          Open;
          if IsEmpty then
          begin
            ShowMessage('Nenhum usuário encontrado no banco de dados.');
          end
          else
          begin
            First;
          end;
          Filtered := False;
          Filter := '';
          Refresh;
        finally
          EnableControls;
        end;
      end;
      OrganizarGrid;
      eBuscaMain.Clear;
    except
      on E: Exception do
        ShowMessage('Erro ao atualizar grid: ' + E.Message);
    end;
  finally
  end;
end;
procedure TFormHomeA.bCadastroClick(Sender: TObject);
var
  Cadastro: TCadastroCfg;
  Controller: TCadastroController;
begin
  Cadastro := TCadastroCfg.Create;
  Controller := TCadastroController.Create;
  try
    Cadastro.Nome := eNome.Text;
    Cadastro.Email := eEmail.Text;
    Cadastro.CPF := meCPF.Text;
    Cadastro.Senha := meSenha.Text;
    Cadastro.NPhone := meNPhone.Text;
    Cadastro.TipoUsuario := cbOpcoes.Text;
    if Controller.ProcessoCadastro(Cadastro) then
    begin
      eNome.Clear;
      eEmail.Clear;
      meCPF.Clear;
      meSenha.Clear;
      meNPhone.Clear;
      cbOpcoes.ItemIndex := -1;
      AtualizarGrid;
    end;
  finally
    Cadastro.Free;
    Controller.Free;
  end;
end;

procedure TFormHomeA.CarregarCargos;
var
  QueryAux: TFDQuery;
begin
  if not Assigned(DM) or not Assigned(DM.FDConn) then
  begin
    ShowMessage('DataModule não disponível.');
    Exit;
  end;

  QueryAux := TFDQuery.Create(nil);
  try
    QueryAux.Connection := DM.FDConn;
    QueryAux.SQL.Clear;
    QueryAux.SQL.Add('SELECT id_cargo, desc_cargo FROM cargos ORDER BY id_cargo');
    QueryAux.Open;

    cbOpcoes.Clear;
    cbOpcoes.Items.Clear;

    // ⭐ MESMO FORMATO que CarregarCargosUpdate
    while not QueryAux.EOF do
    begin
      cbOpcoes.Items.AddObject(
        QueryAux.FieldByName('desc_cargo').AsString,
        TObject(QueryAux.FieldByName('id_cargo').AsInteger)
      );
      QueryAux.Next;
    end;

    cbOpcoes.ItemIndex := -1;
  finally
    QueryAux.Free;
  end;
end;

procedure TFormHomeA.CarregarCargosUpdate;
var
  QueryAux: TFDQuery;
begin
  if not Assigned(DM) or not Assigned(DM.FDConn) then
  begin
    ShowMessage('DataModule não disponível.');
    Exit;
  end;

  QueryAux := TFDQuery.Create(nil);
  try
    QueryAux.Connection := DM.FDConn;
    QueryAux.SQL.Clear;
    QueryAux.SQL.Add('SELECT id_cargo, desc_cargo FROM cargos ORDER BY id_cargo');
    QueryAux.Open;

    cbUpdate.Clear;
    cbUpdate.Items.Clear;

    while not QueryAux.EOF do
    begin
      cbUpdate.Items.AddObject(
        QueryAux.FieldByName('desc_cargo').AsString,
        TObject(QueryAux.FieldByName('id_cargo').AsInteger)
      );
      QueryAux.Next;
    end;

    cbUpdate.ItemIndex := -1;
  finally
    QueryAux.Free;
  end;
end;

procedure TFormHomeA.CarregarDadosUpdate(IdUsuario: Integer);
var
  i: Integer;
  IdCargoAtual: Integer;
  QueryAux: TFDQuery;
begin
  if not Assigned(DM) or not Assigned(DM.FDConn) then
  begin
    ShowMessage('DataModule não disponível.');
    Exit;
  end;

  QueryAux := TFDQuery.Create(nil);
  try
    QueryAux.Connection := DM.FDConn;
    QueryAux.SQL.Clear;
    QueryAux.SQL.Add('SELECT u.id_user, u.nome_user, u.email_user, u.cpf_user, u.nphone_user, u.id_cargo, c.desc_cargo');
    QueryAux.SQL.Add('FROM usuarios u');
    QueryAux.SQL.Add('INNER JOIN cargos c ON u.id_cargo = c.id_cargo');
    QueryAux.SQL.Add('WHERE u.id_user = :id_user');
    QueryAux.ParamByName('id_user').AsInteger := IdUsuario;
    QueryAux.Open;

    if QueryAux.IsEmpty then
    begin
      ShowMessage('Usuário não encontrado.');
      Exit;
    end;

    try
      // Carregar os cargos primeiro
      CarregarCargosUpdate;

      // Preencher os campos com os dados do usuário específico
      eNomeUpdate.Text := QueryAux.FieldByName('nome_user').AsString;
      eEmailUpdate.Text := QueryAux.FieldByName('email_user').AsString;
      meCPFUpdate.Text := QueryAux.FieldByName('cpf_user').AsString;
      meNPhoneUpdate.Text := QueryAux.FieldByName('nphone_user').AsString;

      // Selecionar o cargo atual
      IdCargoAtual := QueryAux.FieldByName('id_cargo').AsInteger;
      cbUpdate.ItemIndex := -1;

      for i := 0 to cbUpdate.Items.Count - 1 do
      begin
        if Integer(cbUpdate.Items.Objects[i]) = IdCargoAtual then
        begin
          cbUpdate.ItemIndex := i;
          Break;
        end;
      end;

      if cbUpdate.ItemIndex = -1 then
        ShowMessage('Cargo do usuário não encontrado na lista.');

    except
      on E: Exception do
        ShowMessage('Erro ao carregar dados: ' + E.Message);
    end;
  finally
    QueryAux.Free;
  end;
end;

procedure TFormHomeA.DBGridUsuariosCellClick(Column: TColumn);
begin
  lblUserSelectEx.Caption:=DBGridUsuarios.DataSource.DataSet.FieldByName('nome_user').AsString;
  lblUserSelectRes.Caption:=DBGridUsuarios.DataSource.DataSet.FieldByName('nome_user').AsString;
end;

procedure TFormHomeA.eBuscaMainChange(Sender: TObject);
begin
  // Verificar se o dataset está ativo antes de filtrar
  if Assigned(DM) and Assigned(DM.FDQr) and DM.FDQr.Active then
    FiltrarGrid(eBuscaMain.Text);
end;

procedure TFormHomeA.eCPFChange(Sender: TObject);
begin
  eCPF.Hide;
  meCPF.SetFocus;
end;

procedure TFormHomeA.eCPFClick(Sender: TObject);
begin
  eCPF.Hide;
  meCPF.SetFocus;
end;

procedure TFormHomeA.eNPhoneChange(Sender: TObject);
begin
  eNPhone.Hide;
  meNPhone.SetFocus;
end;

procedure TFormHomeA.FiltrarGrid(const TextoBusca: string);
var
  Filtro: string;
  TextoBuscaUpper: string;
begin
  if not Assigned(DM) or not Assigned(DM.FDQr) then
  begin
    ShowMessage('DataModule ou FDQuery não disponível.');
    Exit;
  end;

  try
    with DM.FDQr do
    begin
      // Verificar se o dataset está aberto
      if not Active then
      begin
        ShowMessage('Dataset não está aberto. Carregue os dados primeiro.');
        Exit;
      end;

      Filtered := False;
      Filter := '';

      if Trim(TextoBusca) <> '' then
      begin
        TextoBuscaUpper := UpperCase(TextoBusca);
        Filtro := Format(
          '(UPPER(id_user) LIKE ''%%%s%%'') OR ' +
          '(UPPER(nome_user) LIKE ''%%%s%%'') OR ' +
          '(UPPER(email_user) LIKE ''%%%s%%'') OR ' +
          '(UPPER(cpf_user) LIKE ''%%%s%%'') OR ' +
          '(UPPER(nphone_user) LIKE ''%%%s%%'') OR ' +
          '(UPPER(desc_cargo) LIKE ''%%%s%%'')',
          [TextoBuscaUpper, TextoBuscaUpper, TextoBuscaUpper,
           TextoBuscaUpper, TextoBuscaUpper, TextoBuscaUpper]
        );
        Filter := Filtro;
        Filtered := True;
      end;

      if not IsEmpty then
        First;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao filtrar: ' + E.Message);
  end;
end;
procedure TFormHomeA.FormCreate(Sender: TObject);
  begin
    if Assigned(pcMain) then
      pcMain.ActivePageIndex := 3; //mudar aqui para 0 quando terminar o crud e os redirecionamentos de pgcontrol
    eBuscaMain.Clear;
    eBuscaMain.TextHint := 'Digite aqui para pesquisar.';
  end;

procedure TFormHomeA.FormShow(Sender: TObject);
  begin
    if Assigned(DM) and Assigned(DM.FDQr) and Assigned(DM.FDConn) then
    begin
      try
        if DM.FDConn.Connected then
          AtualizarGrid;
          eBuscaMain.TextHint := 'Digite aqui para pesquisar.';
      except
        on E: Exception do
          ShowMessage('Erro ao carregar dados: ' + E.Message);
      end;
    end;
  end;

procedure TFormHomeA.iButton1Click(Sender: TObject);
  begin
   if pBarraMenuLeft.Width = 89 then begin
      pBarraMenuLeft.Width := 200;
    end else begin
      pBarraMenuLeft.Width := 89;
    end;
  end;

procedure TFormHomeA.LimparCamposUpdate;
begin
  eNomeUpdate.Clear;
  eEmailUpdate.Clear;
  meCPFUpdate.Clear;
  meNPhoneUpdate.Clear;
  cbUpdate.ItemIndex := -1;
  cbUpdate.Items.Clear;
  FIdUsuarioSelecionado := 0; // ⭐ Limpar o ID também
end;

procedure TFormHomeA.OrganizarGrid;
begin
  DBGridUsuarios.Columns[0].Width:=30;
  DBGridUsuarios.Columns[1].Width:=80;
  DBGridUsuarios.Columns[2].Width:=80;
  DBGridUsuarios.Columns[3].Width:=83;
  DBGridUsuarios.Columns[4].Width:=90;
  DBGridUsuarios.Columns[5].Width:=80;
  DBGridUsuarios.Columns[6].Width:=30;

  DBGridUsuarios.Columns[0].Title.Caption:='Id';
  DBGridUsuarios.Columns[1].Title.Caption:='Nome';
  DBGridUsuarios.Columns[2].Title.Caption:='Email';
  DBGridUsuarios.Columns[3].Title.Caption:='CPF';
  DBGridUsuarios.Columns[4].Title.Caption:='Telefone';
  DBGridUsuarios.Columns[5].Title.Caption:='Cargo';
  DBGridUsuarios.Columns[6].Title.Caption:='Ativo';
end;

procedure TFormHomeA.pButton1AdicionarClick(Sender: TObject);
begin
  if Assigned(pcButtons) then
      pcButtons.ActivePageIndex := 1;
  AtualizarGridTrue;
end;

procedure TFormHomeA.pButton2ExcluirClick(Sender: TObject);
  begin
    if Assigned(pcButtons) then
      pcButtons.ActivePageIndex := 2;
    AtualizarGridTrue;
    lblUserSelectEx.Caption:=DBGridUsuarios.DataSource.DataSet.FieldByName('nome_user').AsString;
  end;

procedure TFormHomeA.pButton3AtualizarClick(Sender: TObject);
  begin
  // Verificar se há um usuário selecionado
  if not Assigned(DM) or not Assigned(DM.FDQr) or DM.FDQr.IsEmpty then
  begin
    ShowMessage('Selecione um usuário para editar.');
    Exit;
  end;

  // ⭐ IMPORTANTE: Capturar o ID ANTES de fazer qualquer outra operação
  FIdUsuarioSelecionado := DM.FDQr.FieldByName('id_user').AsInteger;

  // Mudar para a página de atualização
  if Assigned(pcButtons) then
    pcButtons.ActivePageIndex := 3;

  // Carregar os dados usando o ID armazenado
  CarregarDadosUpdate(FIdUsuarioSelecionado);
  end;

procedure TFormHomeA.pButton4RestaurarClick(Sender: TObject);
begin
  if Assigned(pcButtons) then
      pcButtons.ActivePageIndex := 4;
  AtualizarGridFalse;
end;

procedure TFormHomeA.pButton5PesquisarClick(Sender: TObject);
begin
  if Assigned(pcButtons) then
    pcButtons.ActivePageIndex := 5;
  if not DM.FDQr.Active then
    AtualizarGrid;

  if Trim(eBuscaMain.Text) = '' then
  begin
    eBuscaMain.Enabled := True;
    eBuscaMain.SetFocus;
    Exit;
  end;

  FiltrarGrid(Trim(eBuscaMain.Text));
end;

procedure TFormHomeA.pButton6CancelarClick(Sender: TObject);
  begin
    if not Assigned(DM) or not Assigned(DM.FDQr) then
    begin
      eBuscaMain.Clear;
      Exit;
    end;
    try
      with DM.FDQr do
      begin
        if State in [dsEdit, dsInsert] then
          Cancel;
      end;
      eBuscaMain.Clear;
      AtualizarGridTrue;
      ShowMessage('Operação cancelada. Grid restaurado.');
      if Assigned(pcButtons) then
        begin
          pcButtons.ActivePageIndex := 0;
          eBuscaMain.Enabled:=False;
        end;
  AtualizarGridTrue;
    except
      on E: Exception do
        ShowMessage('Erro ao cancelar: ' + E.Message);
    end;
  end;
procedure TFormHomeA.pButtonConfirmarExcluirClick(Sender: TObject);
  var
    IdUsuario: Integer;
    NomeUsuario: string;
  begin
    if Assigned(pcButtons) then
      pcButtons.ActivePageIndex := 2;
      AtualizarGridTrue;
    if not Assigned(DM) or not Assigned(DM.FDQr) then
    begin
      ShowMessage('DataModule não disponível.');
      Exit;
    end;
    if DM.FDQr.IsEmpty then
    begin
      ShowMessage('Selecione um usuário para excluir.');
      Exit;
    end;
    try
      with DM.FDQr do
      begin
        IdUsuario := FieldByName('id_user').AsInteger;
        NomeUsuario := FieldByName('nome_user').AsString;
        if not FieldByName('ativo').AsBoolean then
        begin
          ShowMessage('Este usuário já está inativo.');
          Exit;
        end;
        if MessageDlg(Format('Deseja desativar o usuário "%s"?', [NomeUsuario]), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          try
            Edit;
            FieldByName('ativo').AsBoolean := False;
            Post;
            AtualizarGridTrue;
            ShowMessage('Usuário desativado com sucesso!');
            pcButtons.ActivePageIndex := 0;
          except
            on E: Exception do
            begin
              Cancel;
              ShowMessage('Erro ao desativar usuário: ' + E.Message);
            end;
          end;
        end;
      end;
    except
      on E: Exception do
        ShowMessage('Erro: ' + E.Message);
    end;
  end;
procedure TFormHomeA.pButtonConfirmarRestoreClick(Sender: TObject);
var
  IdUsuario: Integer;
  NomeUsuario: string;
begin
  if not Assigned(DM) or not Assigned(DM.FDQr) then
  begin
    ShowMessage('DataModule não disponível.');
    Exit;
  end;
  if DM.FDQr.IsEmpty then
  begin
    ShowMessage('Selecione um usuário para restaurar.');
    Exit;
  end;

  try
    with DM.FDQr do
    begin
      IdUsuario := FieldByName('id_user').AsInteger;
      NomeUsuario := FieldByName('nome_user').AsString;
      if FieldByName('ativo').AsBoolean then
      begin
        ShowMessage('Este usuário já está ativo.');
        Exit;
      end;
      if MessageDlg(Format('Deseja restaurar o usuário "%s"?', [NomeUsuario]), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        try
          Edit;
          FieldByName('ativo').AsBoolean := True;
          Post;
          AtualizarGrid;
          ShowMessage('Usuário restaurado com sucesso!');
        except
          on E: Exception do
          begin
            Cancel;
            ShowMessage('Erro ao restaurar usuário: ' + E.Message);
          end;
        end;
      end;
    end;
  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message);
  end;
end;
procedure TFormHomeA.pButtonConfirmarUpdateClick(Sender: TObject);
var
  IdCargo: Integer;
  QueryUpdate: TFDQuery;
begin
  // Validações iniciais
  if not Assigned(DM) or not Assigned(DM.FDConn) then
  begin
    ShowMessage('DataModule não disponível.');
    Exit;
  end;

  // Verificar se temos um ID válido armazenado
  if FIdUsuarioSelecionado <= 0 then
  begin
    ShowMessage('Nenhum usuário foi selecionado para atualização.');
    Exit;
  end;

  // Validar campos obrigatórios
  if Trim(eNomeUpdate.Text) = '' then
  begin
    ShowMessage('Preencha o nome do usuário.');
    eNomeUpdate.SetFocus;
    Exit;
  end;

  if Trim(eEmailUpdate.Text) = '' then
  begin
    ShowMessage('Preencha o email do usuário.');
    eEmailUpdate.SetFocus;
    Exit;
  end;

  if Trim(meCPFUpdate.Text) = '' then
  begin
    ShowMessage('Preencha o CPF do usuário.');
    meCPFUpdate.SetFocus;
    Exit;
  end;

  if Trim(meNPhoneUpdate.Text) = '' then
  begin
    ShowMessage('Preencha o telefone do usuário.');
    meNPhoneUpdate.SetFocus;
    Exit;
  end;

  // Verifica se o ComboBox tem um item selecionado
  if cbUpdate.ItemIndex = -1 then
  begin
    ShowMessage('Selecione um cargo válido.');
    cbUpdate.SetFocus;
    Exit;
  end;

  try
    // Obter ID do cargo selecionado
    IdCargo := Integer(cbUpdate.Items.Objects[cbUpdate.ItemIndex]);

    // Verificar se o ID do cargo é válido
    if IdCargo <= 0 then
    begin
      ShowMessage('ID do cargo inválido. Por favor, selecione um cargo válido.');
      cbUpdate.SetFocus;
      Exit;
    end;

    // Criar uma query separada para o UPDATE
    QueryUpdate := TFDQuery.Create(nil);
    try
      QueryUpdate.Connection := DM.FDConn;
      QueryUpdate.SQL.Clear;
      QueryUpdate.SQL.Add('UPDATE usuarios SET');
      QueryUpdate.SQL.Add('  nome_user = :nome,');
      QueryUpdate.SQL.Add('  email_user = :email,');
      QueryUpdate.SQL.Add('  cpf_user = :cpf,');
      QueryUpdate.SQL.Add('  nphone_user = :nphone,');
      QueryUpdate.SQL.Add('  id_cargo = :id_cargo');
      QueryUpdate.SQL.Add('WHERE id_user = :id_user');

      // Parametrizar a query usando o ID armazenado
      QueryUpdate.ParamByName('nome').AsString := Trim(eNomeUpdate.Text);
      QueryUpdate.ParamByName('email').AsString := Trim(eEmailUpdate.Text);
      QueryUpdate.ParamByName('cpf').AsString := meCPFUpdate.Text;
      QueryUpdate.ParamByName('nphone').AsString := meNPhoneUpdate.Text;
      QueryUpdate.ParamByName('id_cargo').AsInteger := IdCargo;
      QueryUpdate.ParamByName('id_user').AsInteger := FIdUsuarioSelecionado; // ⭐ USA O ID ARMAZENADO

      // Executar o UPDATE
      QueryUpdate.ExecSQL;

      ShowMessage('Usuário atualizado com sucesso!');

      // Limpar o ID armazenado
      FIdUsuarioSelecionado := 0;

      LimparCamposUpdate;
      AtualizarGrid;
      pcButtons.ActivePageIndex := 0;

    finally
      QueryUpdate.Free;
    end;

  except
    on E: Exception do
      ShowMessage('Erro ao atualizar usuário: ' + E.Message);
  end;
end;

end.
