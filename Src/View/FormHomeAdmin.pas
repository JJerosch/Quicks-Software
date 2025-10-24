unit FormHomeAdmin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  System.Generics.Collections, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  UsuarioModelCRUDAdmin, CargosModelCRUDAdmin, UsuarioControllerCRUDAdmin,
  UsuarioViewHelperCRUDAdmin;

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
    lblUserNameHeader: TLabel;
    lblUserIdHeader: TLabel;

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
    procedure iButton6Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure iButton2Click(Sender: TObject);
    procedure iButton3Click(Sender: TObject);
    procedure iButton4Click(Sender: TObject);
    procedure iButton5Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    FIdUsuario: Integer;
    FNomeUsuario: String;
    FController: TUsuarioController;
    FIdUsuarioSelecionado: Integer;
    FMemTable: TFDMemTable;
    FDataSource: TDataSource;

    procedure CarregarGrid(ApenasAtivos: Boolean);
    procedure OrganizarGrid;
    procedure FiltrarGrid(const TextoBusca: string);
    procedure LimparCamposAdicionar;
    procedure LimparCamposAtualizar;
    procedure CarregarCargosAdicionar;
    procedure CarregarCargosAtualizar;
    procedure CarregarDadosParaAtualizar(IdUsuario: Integer);

  public
    property IdUsuario: Integer read FIdUsuario write FIdUsuario;
    property NomeUsuario: String read FNomeUsuario write FNomeUsuario;
  end;

var
  FormHomeA: TFormHomeA;

implementation

{$R *.dfm}

uses
  uConn;

{ TFormHomeA }

procedure TFormHomeA.FormCreate(Sender: TObject);
begin
  // Criar controller
  FController := TUsuarioController.Create;
  FIdUsuarioSelecionado := 0;

  // Criar MemTable e DataSource
  FMemTable := TFDMemTable.Create(Self);
  FDataSource := TDataSource.Create(Self);
  FDataSource.DataSet := FMemTable;
  DBGridUsuarios.DataSource := FDataSource;

  // Configurar páginas iniciais
  if Assigned(pcMain) then
    pcMain.ActivePageIndex := 3;

  if Assigned(pcButtons) then
    pcButtons.ActivePageIndex := 0;

  // Configurar busca
  eBuscaMain.Clear;
  eBuscaMain.TextHint := 'Digite aqui para pesquisar.';
  eBuscaMain.Enabled := False;

  // Configurar constraints da janela
  Constraints.MinWidth := 1248;
  Constraints.MinHeight := 683;
  Constraints.MaxWidth := 1920;
  Constraints.MaxHeight := 1080;

  Self.BorderStyle := bsSingle;
  Self.WindowState := wsNormal;
end;

procedure TFormHomeA.FormDestroy(Sender: TObject);
begin
  FController.Free;
  FMemTable.Free;
  FDataSource.Free;
end;

procedure TFormHomeA.FormShow(Sender: TObject);
begin
  try
    // Carregar apenas usuários ativos
    CarregarGrid(True);

    // Exibir informações do usuário logado
    lblUserNameHeader.Caption := NomeUsuario;
    lblUserIdHeader.Caption := IdUsuario.ToString;

    // Configurar hint de busca
    eBuscaMain.TextHint := 'Digite aqui para pesquisar.';
    eBuscaMain.Clear;

  except
    on E: Exception do
      ShowMessage('Erro ao carregar dados: ' + E.Message);
  end;
end;

procedure TFormHomeA.FormResize(Sender: TObject);
begin
  if Self.WindowState = wsMaximized then
  begin
    pHeader.Width := 1920;
    pMainGrid.Width := 1013;
  end;
end;

procedure TFormHomeA.CarregarGrid(ApenasAtivos: Boolean);
var
  Usuarios: TObjectList<TUsuario>;
begin
  try
    Usuarios := FController.ListarUsuarios(ApenasAtivos);
    try
      TUsuarioViewHelper.PreencherMemTableUsuarios(FMemTable, Usuarios);
      OrganizarGrid;
    finally
      Usuarios.Free;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao carregar grid: ' + E.Message);
  end;
end;

procedure TFormHomeA.OrganizarGrid;
begin
  if DBGridUsuarios.Columns.Count > 0 then
  begin
    DBGridUsuarios.Columns[0].Width := 30;   // id_user
    DBGridUsuarios.Columns[1].Width := 120;  // nome_user
    DBGridUsuarios.Columns[2].Width := 150;  // email_user
    DBGridUsuarios.Columns[3].Width := 100;  // cpf_user
    DBGridUsuarios.Columns[4].Width := 100;  // nphone_user
    DBGridUsuarios.Columns[5].Width := 100;  // desc_cargo
    DBGridUsuarios.Columns[6].Width := 50;   // ativo

    DBGridUsuarios.Columns[0].Title.Caption := 'ID';
    DBGridUsuarios.Columns[1].Title.Caption := 'Nome';
    DBGridUsuarios.Columns[2].Title.Caption := 'Email';
    DBGridUsuarios.Columns[3].Title.Caption := 'CPF';
    DBGridUsuarios.Columns[4].Title.Caption := 'Telefone';
    DBGridUsuarios.Columns[5].Title.Caption := 'Cargo';
    DBGridUsuarios.Columns[6].Title.Caption := 'Ativo';
  end;
end;

procedure TFormHomeA.FiltrarGrid(const TextoBusca: string);
var
  Filtro: string;
  TextoBuscaUpper: string;
begin
  try
    if not FMemTable.Active then
      Exit;

    FMemTable.Filtered := False;
    FMemTable.Filter := '';

    if Trim(TextoBusca) <> '' then
    begin
      TextoBuscaUpper := UpperCase(TextoBusca);
      Filtro := Format(
        '(UPPER(nome_user) LIKE ''%%%s%%'') OR ' +
        '(UPPER(email_user) LIKE ''%%%s%%'') OR ' +
        '(UPPER(cpf_user) LIKE ''%%%s%%'') OR ' +
        '(UPPER(nphone_user) LIKE ''%%%s%%'') OR ' +
        '(UPPER(desc_cargo) LIKE ''%%%s%%'')',
        [TextoBuscaUpper, TextoBuscaUpper, TextoBuscaUpper,
         TextoBuscaUpper, TextoBuscaUpper]
      );
      FMemTable.Filter := Filtro;
      FMemTable.Filtered := True;
    end;

    if not FMemTable.IsEmpty then
      FMemTable.First;
  except
    on E: Exception do
      ShowMessage('Erro ao filtrar: ' + E.Message);
  end;
end;

procedure TFormHomeA.LimparCamposAdicionar;
begin
  eNome.Clear;
  eEmail.Clear;
  meCPF.Clear;
  meSenha.Clear;
  meNPhone.Clear;
  cbOpcoes.ItemIndex := -1;
end;

procedure TFormHomeA.LimparCamposAtualizar;
begin
  eNomeUpdate.Clear;
  eEmailUpdate.Clear;
  meCPFUpdate.Clear;
  meNPhoneUpdate.Clear;
  cbUpdate.ItemIndex := -1;
  FIdUsuarioSelecionado := 0;
end;

procedure TFormHomeA.CarregarCargosAdicionar;
var
  Cargos: TObjectList<TCargo>;
begin
  try
    Cargos := FController.ListarCargos;
    try
      TUsuarioViewHelper.PreencherComboBoxCargos(cbOpcoes, Cargos);
    finally
      Cargos.Free;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao carregar cargos: ' + E.Message);
  end;
end;

procedure TFormHomeA.CarregarCargosAtualizar;
var
  Cargos: TObjectList<TCargo>;
begin
  try
    Cargos := FController.ListarCargos;
    try
      TUsuarioViewHelper.PreencherComboBoxCargos(cbUpdate, Cargos);
    finally
      Cargos.Free;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao carregar cargos: ' + E.Message);
  end;
end;

procedure TFormHomeA.CarregarDadosParaAtualizar(IdUsuario: Integer);
var
  Usuario: TUsuario;
begin
  try
    Usuario := FController.ObterUsuario(IdUsuario);
    if Assigned(Usuario) then
    begin
      try
        // Carregar cargos primeiro
        CarregarCargosAtualizar;

        // Preencher campos
        eNomeUpdate.Text := Usuario.NomeUser;
        eEmailUpdate.Text := Usuario.EmailUser;
        meCPFUpdate.Text := Usuario.CpfUser;
        meNPhoneUpdate.Text := Usuario.NPhoneUser;

        // Selecionar cargo
        TUsuarioViewHelper.SelecionarCargoPorId(cbUpdate, Usuario.IdCargo);
      finally
        Usuario.Free;
      end;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao carregar dados para atualização: ' + E.Message);
  end;
end;

// ============ EVENTOS DOS BOTÕES ============

procedure TFormHomeA.iButton1Click(Sender: TObject);
begin
  if pBarraMenuLeft.Width = 89 then
    pBarraMenuLeft.Width := 200
  else
    pBarraMenuLeft.Width := 89;
end;

procedure TFormHomeA.iButton2Click(Sender: TObject);
begin
  pcMain.ActivePage := pctab2Relatorios;
end;

procedure TFormHomeA.iButton3Click(Sender: TObject);
begin
  pcMain.ActivePage := pctab3Pedidos;
end;

procedure TFormHomeA.iButton4Click(Sender: TObject);
begin
  pcMain.ActivePage := pctab4Usuarios;
end;

procedure TFormHomeA.iButton5Click(Sender: TObject);
begin
  pcMain.ActivePage := pctab5Perfil;
end;

procedure TFormHomeA.iButton6Click(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja fechar a aplicação?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Application.Terminate;
  end;
end;

procedure TFormHomeA.pButton1AdicionarClick(Sender: TObject);
begin
  pcButtons.ActivePageIndex := 1;
  CarregarCargosAdicionar;
  LimparCamposAdicionar;
end;

procedure TFormHomeA.bCadastroClick(Sender: TObject);
var
  Usuario: TUsuario;
  IdCargo: Integer;
begin
  Usuario := TUsuario.Create;
  try
    Usuario.NomeUser := Trim(eNome.Text);
    Usuario.EmailUser := Trim(eEmail.Text);
    Usuario.CpfUser := meCPF.Text;
    Usuario.NPhoneUser := meNPhone.Text;

    IdCargo := TUsuarioViewHelper.ObterIdCargoSelecionado(cbOpcoes);
    Usuario.IdCargo := IdCargo;

    if FController.AdicionarUsuario(Usuario, meSenha.Text) then
    begin
      LimparCamposAdicionar;
      CarregarGrid(True);
      pcButtons.ActivePageIndex := 0;
    end;
  finally
    Usuario.Free;
  end;
end;

procedure TFormHomeA.pButton2ExcluirClick(Sender: TObject);
begin
  pcButtons.ActivePageIndex := 2;
  CarregarGrid(True);

  if not FMemTable.IsEmpty then
    lblUserSelectEx.Caption := FMemTable.FieldByName('nome_user').AsString;
end;

procedure TFormHomeA.pButtonConfirmarExcluirClick(Sender: TObject);
var
  IdUsuario: Integer;
  NomeUsuario: string;
begin
  if FMemTable.IsEmpty then
  begin
    ShowMessage('Selecione um usuário para desativar.');
    Exit;
  end;

  IdUsuario := FMemTable.FieldByName('id_user').AsInteger;
  NomeUsuario := FMemTable.FieldByName('nome_user').AsString;

  if MessageDlg(Format('Deseja desativar o usuário "%s"?', [NomeUsuario]),
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if FController.DesativarUsuario(IdUsuario) then
    begin
      CarregarGrid(True);
      pcButtons.ActivePageIndex := 0;
    end;
  end;
end;

procedure TFormHomeA.pButton3AtualizarClick(Sender: TObject);
begin
  if FMemTable.IsEmpty then
  begin
    ShowMessage('Selecione um usuário para editar.');
    Exit;
  end;

  FIdUsuarioSelecionado := FMemTable.FieldByName('id_user').AsInteger;
  pcButtons.ActivePageIndex := 3;
  CarregarDadosParaAtualizar(FIdUsuarioSelecionado);
end;

procedure TFormHomeA.pButtonConfirmarUpdateClick(Sender: TObject);
var
  Usuario: TUsuario;
  IdCargo: Integer;
begin
  if FIdUsuarioSelecionado <= 0 then
  begin
    ShowMessage('Nenhum usuário selecionado.');
    Exit;
  end;

  Usuario := TUsuario.Create;
  try
    Usuario.IdUser := FIdUsuarioSelecionado;
    Usuario.NomeUser := Trim(eNomeUpdate.Text);
    Usuario.EmailUser := Trim(eEmailUpdate.Text);
    Usuario.CpfUser := meCPFUpdate.Text;
    Usuario.NPhoneUser := meNPhoneUpdate.Text;

    IdCargo := TUsuarioViewHelper.ObterIdCargoSelecionado(cbUpdate);
    Usuario.IdCargo := IdCargo;

    if FController.AtualizarUsuario(Usuario) then
    begin
      LimparCamposAtualizar;
      CarregarGrid(True);
      pcButtons.ActivePageIndex := 0;
    end;
  finally
    Usuario.Free;
  end;
end;

procedure TFormHomeA.pButton4RestaurarClick(Sender: TObject);
begin
  pcButtons.ActivePageIndex := 4;
  CarregarGrid(False);

  if not FMemTable.IsEmpty then
    lblUserSelectRes.Caption := FMemTable.FieldByName('nome_user').AsString;
end;

procedure TFormHomeA.pButtonConfirmarRestoreClick(Sender: TObject);
var
  IdUsuario: Integer;
  NomeUsuario: string;
begin
  if FMemTable.IsEmpty then
  begin
    ShowMessage('Selecione um usuário para restaurar.');
    Exit;
  end;

  IdUsuario := FMemTable.FieldByName('id_user').AsInteger;
  NomeUsuario := FMemTable.FieldByName('nome_user').AsString;

  if MessageDlg(Format('Deseja restaurar o usuário "%s"?', [NomeUsuario]),
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if FController.ReativarUsuario(IdUsuario) then
    begin
      CarregarGrid(True);
      pcButtons.ActivePageIndex := 0;
    end;
  end;
end;

procedure TFormHomeA.pButton5PesquisarClick(Sender: TObject);
begin
  pcButtons.ActivePageIndex := 5;

  if not FMemTable.Active then
    CarregarGrid(True);

  eBuscaMain.Enabled := True;
  eBuscaMain.SetFocus;
end;

procedure TFormHomeA.eBuscaMainChange(Sender: TObject);
begin
  if FMemTable.Active then
    FiltrarGrid(eBuscaMain.Text);
end;

procedure TFormHomeA.pButton6CancelarClick(Sender: TObject);
begin
  eBuscaMain.Clear;
  eBuscaMain.Enabled := False;
  LimparCamposAdicionar;
  LimparCamposAtualizar;
  CarregarGrid(True);
  pcButtons.ActivePageIndex := 0;
end;

procedure TFormHomeA.DBGridUsuariosCellClick(Column: TColumn);
begin
  if not FMemTable.IsEmpty then
  begin
    lblUserSelectEx.Caption := FMemTable.FieldByName('nome_user').AsString;
    lblUserSelectRes.Caption := FMemTable.FieldByName('nome_user').AsString;
  end;
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

end.
