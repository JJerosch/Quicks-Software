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
  UsuarioViewHelperCRUDAdmin, Vcl.WinXPickers, PerfilAdminService, uConn, LogSistema;

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
    pcPerfil: TPageControl;
    tsVisualizar: TTabSheet;
    scbxPerfilVisualizar: TScrollBox;
    pMainPerfilVisualizar: TPanel;
    pButtonEditar: TPanel;
    pButtonAlterarSenha: TPanel;
    pInfoRestauranteP: TPanel;
    lblProprietario: TLabel;
    lblNAdmin: TLabel;
    lblEAdmin: TLabel;
    lblCPFPAdmin: TLabel;
    lblNAdminD: TLabel;
    lblEAdminD: TLabel;
    lblCPFPCommD: TLabel;
    tsEditar: TTabSheet;
    tsAlterarSenha: TTabSheet;
    iButtonBackAlterarSenha: TImage;
    pAlterarSenha: TPanel;
    lblAlterarSenha: TLabel;
    lblSenhaAtual: TLabel;
    lblNovaSenha: TLabel;
    lblDigiteNovamente: TLabel;
    eSenhaAtual: TEdit;
    eSenhaNova: TEdit;
    eSenhaConfirmacao: TEdit;
    pButtonConfirmarAlterarSenha: TPanel;
    pButtonCancelarAlterarSenha: TPanel;
    pDicas: TPanel;
    lblDicasTitle: TLabel;
    lblDicas: TLabel;
    scbxMainEditar: TScrollBox;
    pMainPerfilEditar: TPanel;
    pButtonSalvarDadosE: TPanel;
    pButtonAlterarSenhaE: TPanel;
    pInfoRestaurantePE: TPanel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label3: TLabel;
    eNPCommDE: TEdit;
    eEPCommDE: TEdit;
    meCPFPCommDE: TMaskEdit;
    MaskEdit1: TMaskEdit;
    pButtonCancelarE: TPanel;
    lblTAdmin: TLabel;
    lblTCommD: TLabel;

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

    // ⭐ NOVOS PROCEDIMENTOS PARA PERFIL
    procedure pButtonEditarClick(Sender: TObject);
    procedure pButtonAlterarSenhaClick(Sender: TObject);
    procedure pButtonSalvarDadosEClick(Sender: TObject);
    procedure pButtonCancelarEClick(Sender: TObject);
    procedure pButtonAlterarSenhaEClick(Sender: TObject);
    procedure iButtonBackAlterarSenhaClick(Sender: TObject);
    procedure pButtonConfirmarAlterarSenhaClick(Sender: TObject);
    procedure pButtonCancelarAlterarSenhaClick(Sender: TObject);

  private
    FIdUsuario: Integer;
    FNomeUsuario: String;
    FController: TUsuarioController;
    FPerfilService: TPerfilAdminService;  // ⭐ ADICIONAR
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

    // ⭐ NOVOS MÉTODOS PARA PERFIL
    procedure CarregarDadosPerfil;
    procedure CarregarDadosPerfilEdicao;
    procedure LimparCamposSenha;

  public
    property IdUsuario: Integer read FIdUsuario write FIdUsuario;
    property NomeUsuario: String read FNomeUsuario write FNomeUsuario;
  end;

var
  FormHomeA: TFormHomeA;

implementation

{$R *.dfm}



{ TFormHomeA }

procedure TFormHomeA.FormCreate(Sender: TObject);
begin
  // Criar controller
  FController := TUsuarioController.Create;
  FPerfilService := TPerfilAdminService.Create;  // ⭐ ADICIONAR
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

  if Assigned(pcPerfil) then
    pcPerfil.ActivePageIndex := 0;

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

  // ⭐ Configurar eventos dos botões de perfil
  if Assigned(pButtonEditar) then
    pButtonEditar.OnClick := pButtonEditarClick;

  if Assigned(pButtonAlterarSenha) then
    pButtonAlterarSenha.OnClick := pButtonAlterarSenhaClick;

  if Assigned(pButtonSalvarDadosE) then
    pButtonSalvarDadosE.OnClick := pButtonSalvarDadosEClick;

  if Assigned(pButtonCancelarE) then
    pButtonCancelarE.OnClick := pButtonCancelarEClick;

  if Assigned(pButtonAlterarSenhaE) then
    pButtonAlterarSenhaE.OnClick := pButtonAlterarSenhaEClick;

  if Assigned(iButtonBackAlterarSenha) then
    iButtonBackAlterarSenha.OnClick := iButtonBackAlterarSenhaClick;

  if Assigned(pButtonConfirmarAlterarSenha) then
    pButtonConfirmarAlterarSenha.OnClick := pButtonConfirmarAlterarSenhaClick;

  if Assigned(pButtonCancelarAlterarSenha) then
    pButtonCancelarAlterarSenha.OnClick := pButtonCancelarAlterarSenhaClick;
end;

procedure TFormHomeA.FormDestroy(Sender: TObject);
begin
  FController.Free;
  FPerfilService.Free;  // ⭐ ADICIONAR
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

    // ⭐ Carregar dados do perfil
    CarregarDadosPerfil;

    // ⭐ Registrar log de acesso
    TLogSistema.RegistrarLogin(NomeUsuario);

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

// ============ PERFIL - CARREGAR DADOS ============

procedure TFormHomeA.CarregarDadosPerfil;
var
  Nome, Email, CPF, Telefone: String;
begin
  if FPerfilService.ObterDadosPerfil(FIdUsuario, Nome, Email, CPF, Telefone) then
  begin
    // Atualizar labels de visualização
    if Assigned(lblNAdminD) then
      lblNAdminD.Caption := Nome;

    if Assigned(lblEAdminD) then
      lblEAdminD.Caption := Email;

    if Assigned(lblCPFPCommD) then
      lblCPFPCommD.Caption := CPF;

    if Assigned(lblTCommD) then
      lblTCommD.Caption := Telefone;
  end;
end;

procedure TFormHomeA.CarregarDadosPerfilEdicao;
var
  Nome, Email, CPF, Telefone: String;
begin
  if FPerfilService.ObterDadosPerfil(FIdUsuario, Nome, Email, CPF, Telefone) then
  begin
    // Atualizar campos de edição
    if Assigned(eNPCommDE) then
      eNPCommDE.Text := Nome;

    if Assigned(eEPCommDE) then
      eEPCommDE.Text := Email;

    if Assigned(meCPFPCommDE) then
      meCPFPCommDE.Text := CPF;

    if Assigned(MaskEdit1) then  // Telefone
      MaskEdit1.Text := Telefone;
  end;
end;

procedure TFormHomeA.LimparCamposSenha;
begin
  if Assigned(eSenhaAtual) then
    eSenhaAtual.Clear;

  if Assigned(eSenhaNova) then
    eSenhaNova.Clear;

  if Assigned(eSenhaConfirmacao) then
    eSenhaConfirmacao.Clear;
end;

// ============ PERFIL - EVENTOS DOS BOTÕES ============

procedure TFormHomeA.iButton5Click(Sender: TObject);
begin
  pcMain.ActivePage := pctab5Perfil;
  pcPerfil.ActivePageIndex := 0;
  CarregarDadosPerfil;
end;

procedure TFormHomeA.pButtonEditarClick(Sender: TObject);
begin
  pcPerfil.ActivePageIndex := 1; // tsEditar
  CarregarDadosPerfilEdicao;

  TLogSistema.RegistrarAcaoUsuario(NomeUsuario, 'Acessou edição de perfil');
end;

procedure TFormHomeA.pButtonAlterarSenhaClick(Sender: TObject);
begin
  pcPerfil.ActivePageIndex := 2; // tsAlterarSenha
  LimparCamposSenha;

  TLogSistema.RegistrarAcaoUsuario(NomeUsuario, 'Acessou alteração de senha');
end;

procedure TFormHomeA.pButtonAlterarSenhaEClick(Sender: TObject);
begin
  pcPerfil.ActivePageIndex := 2; // tsAlterarSenha
  LimparCamposSenha;
end;

procedure TFormHomeA.iButtonBackAlterarSenhaClick(Sender: TObject);
begin
  LimparCamposSenha;
  pcPerfil.ActivePageIndex := 0; // tsVisualizar
end;

procedure TFormHomeA.pButtonSalvarDadosEClick(Sender: TObject);
var
  Nome, Email, CPF, Telefone: String;
begin
  // Obter dados dos campos
  Nome := '';
  Email := '';
  CPF := '';
  Telefone := '';

  if Assigned(eNPCommDE) then
    Nome := Trim(eNPCommDE.Text);

  if Assigned(eEPCommDE) then
    Email := Trim(eEPCommDE.Text);

  if Assigned(meCPFPCommDE) then
    CPF := meCPFPCommDE.Text;

  if Assigned(MaskEdit1) then
    Telefone := MaskEdit1.Text;

  // Atualizar no banco
  if FPerfilService.AtualizarPerfil(FIdUsuario, Nome, Email, CPF, Telefone) then
  begin
    // Atualizar nome no header
    FNomeUsuario := Nome;
    lblUserNameHeader.Caption := Nome;

    // Voltar para visualização
    CarregarDadosPerfil;
    pcPerfil.ActivePageIndex := 0;

    TLogSistema.RegistrarAcaoUsuario(Nome, 'Perfil atualizado com sucesso');
  end
  else
  begin
    TLogSistema.RegistrarErro(FNomeUsuario, 'Atualizar Perfil', 'Falha ao salvar dados');
  end;
end;

procedure TFormHomeA.pButtonCancelarEClick(Sender: TObject);
begin
  pcPerfil.ActivePageIndex := 0; // tsVisualizar
  TLogSistema.RegistrarAcaoUsuario(NomeUsuario, 'Cancelou edição de perfil');
end;

procedure TFormHomeA.pButtonConfirmarAlterarSenhaClick(Sender: TObject);
var
  SenhaAtual, NovaSenha, Confirmacao: String;
  MsgErro: String;
begin
  // Obter senhas
  SenhaAtual := '';
  NovaSenha := '';
  Confirmacao := '';

  if Assigned(eSenhaAtual) then
    SenhaAtual := Trim(eSenhaAtual.Text);

  if Assigned(eSenhaNova) then
    NovaSenha := Trim(eSenhaNova.Text);

  if Assigned(eSenhaConfirmacao) then
    Confirmacao := Trim(eSenhaConfirmacao.Text);

  // Validar confirmação
  if NovaSenha <> Confirmacao then
  begin
    ShowMessage('A nova senha e a confirmação não coincidem.');
    if Assigned(eSenhaConfirmacao) then
      eSenhaConfirmacao.SetFocus;
    Exit;
  end;

  // Tentar alterar senha
  if FPerfilService.AlterarSenha(FIdUsuario, SenhaAtual, NovaSenha, MsgErro) then
  begin
    ShowMessage('Senha alterada com sucesso!');
    LimparCamposSenha;
    pcPerfil.ActivePageIndex := 0; // tsVisualizar

    TLogSistema.RegistrarAcaoUsuario(NomeUsuario, 'Senha alterada com sucesso');
  end
  else
  begin
    ShowMessage(MsgErro);
    TLogSistema.RegistrarErro(NomeUsuario, 'Alterar Senha', MsgErro);
  end;
end;

procedure TFormHomeA.pButtonCancelarAlterarSenhaClick(Sender: TObject);
begin
  LimparCamposSenha;
  pcPerfil.ActivePageIndex := 0; // tsVisualizar

  TLogSistema.RegistrarAcaoUsuario(NomeUsuario, 'Cancelou alteração de senha');
end;

// ============ MÉTODOS ORIGINAIS (sem alteração) ============

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

// ============ EVENTOS DOS BOTÕES (mantidos) ============

procedure TFormHomeA.iButton1Click(Sender: TObject);
begin
  if pBarraMenuLeft.Width = 97 then
    pBarraMenuLeft.Width := 250
  else
    pBarraMenuLeft.Width := 97;
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

procedure TFormHomeA.iButton6Click(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja fechar a aplicação?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    TLogSistema.RegistrarAcaoUsuario(NomeUsuario, 'Saiu do Sistema - Admin');
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

    if FController.CadastrarUsuario(Usuario, meSenha.Text) then
    begin
      LimparCamposAdicionar;
      CarregarGrid(True);
      pcButtons.ActivePageIndex := 0;

      TLogSistema.RegistrarAcaoUsuario(NomeUsuario, 'Cadastrou usuário: ' + Usuario.NomeUser);
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

  if FController.DesativarUsuario(IdUsuario, NomeUsuario) then
  begin
    CarregarGrid(True);
    pcButtons.ActivePageIndex := 0;

    TLogSistema.RegistrarAcaoUsuario(Self.NomeUsuario, 'Desativou usuário: ' + NomeUsuario);
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

      TLogSistema.RegistrarAcaoUsuario(NomeUsuario, 'Atualizou usuário: ' + Usuario.NomeUser);
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

  if FController.ReativarUsuario(IdUsuario, NomeUsuario) then
  begin
    CarregarGrid(True);
    pcButtons.ActivePageIndex := 0;

    TLogSistema.RegistrarAcaoUsuario(Self.NomeUsuario, 'Reativou usuário: ' + NomeUsuario);
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
