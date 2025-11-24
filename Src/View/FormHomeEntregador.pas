unit FormHomeEntregador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.Mask,
  // ⭐ Units do sistema de perfil
  EntregadorModel, EntregadorController, ViaCEPHelper;

type
  TFormHomeE = class(TForm)
    pHomeBackground: TPanel;
    pBusca: TPanel;
    pBarraMenuLeft: TPanel;
    iButton1: TImage;
    iButton2: TImage;
    iButton3: TImage;
    iButtonLeave: TImage;
    lblButton1: TLabel;
    lblButton2: TLabel;
    lblButton3: TLabel;
    lblSair: TLabel;
    pcMain: TPageControl;
    tsMain: TTabSheet;
    tsPerfil: TTabSheet;
    scbxPerfil: TScrollBox;
    pcPerfil: TPageControl;
    tsVisualizarPefil: TTabSheet;
    scbxMainPerfil: TScrollBox;
    pEnderecos: TPanel;
    scbxEndereco: TScrollBox;
    lblEnderecoTitleVisualizar: TLabel;
    lblLogradouroV: TLabel;
    lblCEPV: TLabel;
    lblEstadoV: TLabel;
    lblNumeroV: TLabel;
    lblCidadeV: TLabel;
    lblBairroV: TLabel;
    lblComplementoV: TLabel;
    lblCEPDV: TLabel;
    lblLogradouroDV: TLabel;
    lblCIdadeDV: TLabel;
    lblNumeroDV: TLabel;
    lblEstadoDV: TLabel;
    lblBairroDV: TLabel;
    lblComplementoDV: TLabel;
    pHeaderPerfil: TPanel;
    lblHeaderPerfil: TLabel;
    iButtonBackPerfil: TImage;
    pButtonAlterarSenhaV: TPanel;
    pInfoVisualizar: TPanel;
    scbxInfoVisualizar: TScrollBox;
    lblDados: TLabel;
    lblNomeV: TLabel;
    lblNomeDV: TLabel;
    lblCPFV: TLabel;
    lblTelefoneV: TLabel;
    lblCPFDV: TLabel;
    lblTelefoneDV: TLabel;
    lblEmailV: TLabel;
    lblEmailDV: TLabel;
    pButtonEditar: TPanel;
    tsEditarPerfil: TTabSheet;
    scbxMainPerfilE: TScrollBox;
    pHeaderPerfilE: TPanel;
    lblPerfilTitlePerfilE: TLabel;
    iButtonBackPerfilE: TImage;
    pButtonSalvar: TPanel;
    pInfoE: TPanel;
    scbxPerfilE: TScrollBox;
    Label3: TLabel;
    lblNome: TLabel;
    lblCPF: TLabel;
    lblTelefone: TLabel;
    lblEmail: TLabel;
    eNomeDE: TEdit;
    eEmailDE: TEdit;
    meCPFDE: TMaskEdit;
    meTelefoneDE: TMaskEdit;
    scbxEnderecos: TScrollBox;
    lblEndereco: TLabel;
    lblLogradouro: TLabel;
    lblCEP: TLabel;
    lblEstado: TLabel;
    lblNumero: TLabel;
    lblCidade: TLabel;
    lblBairro: TLabel;
    lblComplemento: TLabel;
    eLogradouroDE: TEdit;
    eNumeroEnderecoDE: TEdit;
    eCidadeDE: TEdit;
    eBairroDE: TEdit;
    eComplementoDE: TEdit;
    meCEPDE: TMaskEdit;
    cbEstadoDE: TComboBox;
    tsAtualizarSenhaPerfil: TTabSheet;
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
    TabSheet1: TTabSheet;
    scbxMain: TScrollBox;
    pHeaderMenuPrincipal: TPanel;
    lblMenuPrincipal: TLabel;
    pPedidoAtivo: TPanel;
    tsRelatorios: TTabSheet;
    lblPedidoAtivo: TLabel;
    pAtivo: TPanel;
    lblAtivo: TLabel;
    cbAtivo: TComboBox; // ⭐ ComboBox de Expediente
    scbxMainRelatorios: TScrollBox;
    pHeaderRelatorios: TPanel;
    lblRelatorios: TLabel;
    iButtonBackRelatorios: TImage;
    scbxMainPedidos: TScrollBox;
    pHeaderPedidos: TPanel;
    lblPedidos: TLabel;
    iButtonbackPedidos: TImage;
    iButton4: TImage;
    lblButton4: TLabel;
    pUserHeader: TPanel;
    lblUserId: TLabel;
    lblUserName: TLabel;

    // ⭐ Eventos
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject); // ⭐ ATUALIZADO
    procedure iButton1MenuClick(Sender: TObject);
    procedure iButton1Click(Sender: TObject);
    procedure iButton3Click(Sender: TObject); // Ir para Perfil
    procedure iButtonBackPerfilClick(Sender: TObject);
    procedure pButtonEditarClick(Sender: TObject);
    procedure iButtonBackPerfilEClick(Sender: TObject);
    procedure pButtonAlterarSenhaVClick(Sender: TObject);
    procedure iButtonBackAlterarSenhaClick(Sender: TObject);
    procedure pButtonConfirmarAlterarSenhaClick(Sender: TObject);
    procedure pButtonCancelarAlterarSenhaClick(Sender: TObject);
    procedure cbAtivoChange(Sender: TObject);
    procedure lblButton3Click(Sender: TObject);
    procedure lblButton1Click(Sender: TObject);
    procedure iButton4Click(Sender: TObject);
    procedure pButtonSalvarClick(Sender: TObject);
    procedure meCEPDEExit(Sender: TObject); // ⭐ NOVO - Buscar CEP via ViaCEP


  private
    FIdUsuario: Integer;
    FNomeUsuario: String;

    // ⭐ Novos campos para o sistema de perfil
    FController: TEntregadorController;
    FEntregador: TEntregador;

    // ⭐ Métodos privados
    procedure CarregarPerfil;
    procedure PreencherCamposVisualizacao;
    procedure PreencherCamposEdicao;
    procedure PopularComboEstados;
    procedure LimparCamposSenha;
    procedure AtualizarStatusExpediente;
    procedure AtualizarHeaderUsuario;
    procedure BuscarEnderecoPorCEP; // ⭐ NOVO - Buscar endereço via ViaCEP

  public
    property IdUsuario: Integer read FIdUsuario write FIdUsuario;
    property NomeUsuario: String read FNomeUsuario write FNomeUsuario;

    // ⭐ Método público para inicializar o perfil
    procedure InicializarPerfil(IdUsuario: Integer; const NomeUsuario: String);
  end;

var
  FormHomeE: TFormHomeE;

implementation

{$R *.dfm}

uses
  System.UITypes;

{ TFormHomeE }

// ========== CRIAÇÃO E DESTRUIÇÃO DO FORM ==========

procedure TFormHomeE.FormCreate(Sender: TObject);
begin
  // Criar controller
  FController := TEntregadorController.Create;
  FEntregador := nil;

  // Popular combo de estados
  PopularComboEstados;

  // ⭐ Popular combo de expediente
  cbAtivo.Items.Clear;
  cbAtivo.Items.Add('Em expediente');
  cbAtivo.Items.Add('Fora de expediente');
  cbAtivo.ItemIndex := 1; // Começa como "Fora de expediente"

  // Começar na aba principal
  pcMain.ActivePage := tsMain;
  pcPerfil.ActivePage := tsVisualizarPefil;
end;

procedure TFormHomeE.FormDestroy(Sender: TObject);
begin
  // Liberar recursos
  if Assigned(FEntregador) then
    FEntregador.Free;

  if Assigned(FController) then
    FController.Free;
end;

// ⭐ ATUALIZADO - FormShow para carregar tudo corretamente
procedure TFormHomeE.FormShow(Sender: TObject);
begin
  // ⭐ Garantir que inicia na página principal
  pcMain.ActivePage := tsMain;

  // ⭐ Garantir que a aba de perfil começa na visualização
  pcPerfil.ActivePage := tsVisualizarPefil;

  // ⭐ Atualizar header com ID e Nome do usuário
  AtualizarHeaderUsuario;

  // ⭐ NOVO: Se FEntregador não foi carregado ainda, carregar agora
  if not Assigned(FEntregador) and (FIdUsuario > 0) then
  begin
    CarregarPerfil;
  end;

  // ⭐ Se o perfil já foi carregado, atualizar status de expediente
  if Assigned(FEntregador) then
  begin
    AtualizarStatusExpediente;
  end
  else
  begin
    ShowMessage('❌ ERRO: Não foi possível carregar o perfil!' + #13#10 +
                'FIdUsuario = ' + IntToStr(FIdUsuario));
  end;
end;

// ========== INICIALIZAÇÃO DO PERFIL ==========

procedure TFormHomeE.InicializarPerfil(IdUsuario: Integer; const NomeUsuario: String);
begin
  FIdUsuario := IdUsuario;
  FNomeUsuario := NomeUsuario;

  // ⭐ Atualizar header
  AtualizarHeaderUsuario;

  // Carregar dados do perfil
  CarregarPerfil;

  // ⭐ Atualizar status do combobox baseado no banco
  AtualizarStatusExpediente;
end;

// ⭐ NOVO - Atualizar header com informações do usuário
procedure TFormHomeE.AtualizarHeaderUsuario;
begin
  if FIdUsuario > 0 then
  begin
    lblUserId.Caption := 'ID: ' + IntToStr(FIdUsuario);
    lblUserName.Caption := FNomeUsuario;
  end
  else
  begin
    lblUserId.Caption := 'ID: --';
    lblUserName.Caption := 'Usuário';
  end;
end;

procedure TFormHomeE.lblButton1Click(Sender: TObject);
begin
  pcMain.ActivePageIndex := 0;
end;

procedure TFormHomeE.lblButton3Click(Sender: TObject);
begin
  pcMain.ActivePageIndex := 1;
end;

procedure TFormHomeE.CarregarPerfil;
begin
  // Liberar entregador anterior se existir
  if Assigned(FEntregador) then
    FreeAndNil(FEntregador);

  // Buscar entregador do banco
  FEntregador := FController.ObterPerfil(FIdUsuario);

  if Assigned(FEntregador) then
  begin
    FNomeUsuario := FEntregador.NomeUsuario;

    // ⭐ Atualizar header com nome atualizado
    AtualizarHeaderUsuario;

    PreencherCamposVisualizacao;
    PreencherCamposEdicao;

    // ⭐ Atualizar status de expediente no combobox
    if FEntregador.EmExpediente then
      cbAtivo.ItemIndex := 0  // "Em expediente"
    else
      cbAtivo.ItemIndex := 1; // "Fora de expediente"
  end
  else
  begin
    ShowMessage('❌ Erro ao carregar perfil do entregador!');
  end;
end;

// ========== PREENCHER CAMPOS ==========

procedure TFormHomeE.PreencherCamposVisualizacao;
begin
  if not Assigned(FEntregador) then
    Exit;

  // ⭐ Dados do usuário
  lblNomeDV.Caption := FEntregador.NomeUsuario;
  lblEmailDV.Caption := FEntregador.EmailUsuario;
  lblCPFDV.Caption := FEntregador.CPFUsuario;
  lblTelefoneDV.Caption := FEntregador.TelefoneUsuario;

  // ⭐ Endereço de Origem
  lblLogradouroDV.Caption := FEntregador.EnderecoOrigem.Logradouro;
  lblNumeroDV.Caption := FEntregador.EnderecoOrigem.Numero;
  lblBairroDV.Caption := FEntregador.EnderecoOrigem.Bairro;
  lblCIdadeDV.Caption := FEntregador.EnderecoOrigem.Cidade;
  lblEstadoDV.Caption := FEntregador.EnderecoOrigem.UF;
  lblCEPDV.Caption := FEntregador.EnderecoOrigem.CEP;

  if Trim(FEntregador.EnderecoOrigem.Complemento) <> '' then
    lblComplementoDV.Caption := FEntregador.EnderecoOrigem.Complemento
  else
    lblComplementoDV.Caption := '(Sem complemento)';
end;

procedure TFormHomeE.PreencherCamposEdicao;
begin
  if not Assigned(FEntregador) then
    Exit;

  // ⭐ Dados do usuário
  eNomeDE.Text := FEntregador.NomeUsuario;
  eEmailDE.Text := FEntregador.EmailUsuario;
  meCPFDE.Text := FEntregador.CPFUsuario;
  meTelefoneDE.Text := FEntregador.TelefoneUsuario;

  // ⭐ Endereço de Origem
  eLogradouroDE.Text := FEntregador.EnderecoOrigem.Logradouro;
  eNumeroEnderecoDE.Text := FEntregador.EnderecoOrigem.Numero;
  eBairroDE.Text := FEntregador.EnderecoOrigem.Bairro;
  eCidadeDE.Text := FEntregador.EnderecoOrigem.Cidade;
  cbEstadoDE.Text := FEntregador.EnderecoOrigem.UF;
  meCEPDE.Text := FEntregador.EnderecoOrigem.CEP;
  eComplementoDE.Text := FEntregador.EnderecoOrigem.Complemento;
end;

procedure TFormHomeE.PopularComboEstados;
begin
  cbEstadoDE.Items.Clear;
  cbEstadoDE.Items.Add('AC');
  cbEstadoDE.Items.Add('AL');
  cbEstadoDE.Items.Add('AP');
  cbEstadoDE.Items.Add('AM');
  cbEstadoDE.Items.Add('BA');
  cbEstadoDE.Items.Add('CE');
  cbEstadoDE.Items.Add('DF');
  cbEstadoDE.Items.Add('ES');
  cbEstadoDE.Items.Add('GO');
  cbEstadoDE.Items.Add('MA');
  cbEstadoDE.Items.Add('MT');
  cbEstadoDE.Items.Add('MS');
  cbEstadoDE.Items.Add('MG');
  cbEstadoDE.Items.Add('PA');
  cbEstadoDE.Items.Add('PB');
  cbEstadoDE.Items.Add('PR');
  cbEstadoDE.Items.Add('PE');
  cbEstadoDE.Items.Add('PI');
  cbEstadoDE.Items.Add('RJ');
  cbEstadoDE.Items.Add('RN');
  cbEstadoDE.Items.Add('RS');
  cbEstadoDE.Items.Add('RO');
  cbEstadoDE.Items.Add('RR');
  cbEstadoDE.Items.Add('SC');
  cbEstadoDE.Items.Add('SP');
  cbEstadoDE.Items.Add('SE');
  cbEstadoDE.Items.Add('TO');
end;

// ========== NAVEGAÇÃO ENTRE ABAS ==========

procedure TFormHomeE.iButton3Click(Sender: TObject);
begin
  // Ir para o perfil
  pcMain.ActivePage := tsPerfil;
  pcPerfil.ActivePage := tsVisualizarPefil;

  // Recarregar perfil
  CarregarPerfil;
end;

procedure TFormHomeE.iButton4Click(Sender: TObject);
begin
  pcMain.ActivePageIndex := 1;
end;

procedure TFormHomeE.iButtonBackPerfilClick(Sender: TObject);
begin
  // Voltar para aba principal
  pcMain.ActivePage := tsMain;
end;

procedure TFormHomeE.pButtonEditarClick(Sender: TObject);
begin
  // Ir para edição
  pcPerfil.ActivePage := tsEditarPerfil;
end;

procedure TFormHomeE.pButtonSalvarClick(Sender: TObject);
begin
  if not Assigned(FEntregador) then
  begin
    ShowMessage('❌ Erro: Entregador não carregado!');
    Exit;
  end;

  // ⭐ Atualizar dados do usuário
  FEntregador.NomeUsuario := Trim(eNomeDE.Text);
  FEntregador.EmailUsuario := Trim(eEmailDE.Text);
  FEntregador.CPFUsuario := meCPFDE.Text;
  FEntregador.TelefoneUsuario := meTelefoneDE.Text;

  // ⭐ Atualizar endereço de origem
  FEntregador.EnderecoOrigem.Logradouro := Trim(eLogradouroDE.Text);
  FEntregador.EnderecoOrigem.Numero := Trim(eNumeroEnderecoDE.Text);
  FEntregador.EnderecoOrigem.Bairro := Trim(eBairroDE.Text);
  FEntregador.EnderecoOrigem.Cidade := Trim(eCidadeDE.Text);
  FEntregador.EnderecoOrigem.UF := cbEstadoDE.Text;
  FEntregador.EnderecoOrigem.CEP := meCEPDE.Text;
  FEntregador.EnderecoOrigem.Complemento := Trim(eComplementoDE.Text);

  // ⭐ Salvar perfil (dados do usuário)
  if FController.AtualizarPerfil(FEntregador) then
  begin
    // ⭐ Salvar endereço de origem
    if FController.AtualizarEnderecoOrigem(FEntregador.IdEntregador, FEntregador.EnderecoOrigem) then
    begin
      // Recarregar dados atualizados
      CarregarPerfil;

      // Voltar para visualização
      pcPerfil.ActivePage := tsVisualizarPefil;
    end;
  end;
end;

procedure TFormHomeE.iButtonBackPerfilEClick(Sender: TObject);
begin
  // Voltar para visualização sem salvar
  pcPerfil.ActivePage := tsVisualizarPefil;
end;

procedure TFormHomeE.pButtonAlterarSenhaVClick(Sender: TObject);
begin
  // Ir para alteração de senha
  pcPerfil.ActivePage := tsAtualizarSenhaPerfil;
  LimparCamposSenha;
end;

procedure TFormHomeE.iButtonBackAlterarSenhaClick(Sender: TObject);
begin
  // Voltar para visualização
  pcPerfil.ActivePage := tsVisualizarPefil;
  LimparCamposSenha;
end;

// ========== ALTERAR SENHA ==========

procedure TFormHomeE.pButtonConfirmarAlterarSenhaClick(Sender: TObject);
var
  Request: TAlterarSenhaEntregadorRequest;
begin
  Request := TAlterarSenhaEntregadorRequest.Create;
  try
    Request.IdUsuario := FIdUsuario;
    Request.SenhaAtual := eSenhaAtual.Text;
    Request.SenhaNova := eSenhaNova.Text;
    Request.SenhaConfirmacao := eSenhaConfirmacao.Text;

    if FController.AlterarSenha(Request) then
    begin
      // Limpar campos
      LimparCamposSenha;

      // Voltar para visualização
      pcPerfil.ActivePage := tsVisualizarPefil;
    end;
  finally
    Request.Free;
  end;
end;

procedure TFormHomeE.pButtonCancelarAlterarSenhaClick(Sender: TObject);
begin
  // Limpar e voltar
  LimparCamposSenha;
  pcPerfil.ActivePage := tsVisualizarPefil;
end;

procedure TFormHomeE.LimparCamposSenha;
begin
  eSenhaAtual.Clear;
  eSenhaNova.Clear;
  eSenhaConfirmacao.Clear;
end;

// ========== ⭐ SISTEMA DE EXPEDIENTE ==========

procedure TFormHomeE.cbAtivoChange(Sender: TObject);
var
  NovoStatus: Boolean;
begin
  // ⭐ DEBUG: Verificar se o evento está sendo chamado
  ShowMessage('DEBUG cbAtivoChange chamado!' + #13#10 +
              'ItemIndex: ' + IntToStr(cbAtivo.ItemIndex));

  if not Assigned(FEntregador) then
  begin
    ShowMessage('DEBUG: FEntregador NÃO está atribuído!' + #13#10 +
                'Entregador precisa ser carregado primeiro.');
    Exit;
  end;

  // ⭐ DEBUG: Mostrar dados do entregador
  ShowMessage('DEBUG Entregador:' + #13#10 +
              'IdEntregador: ' + IntToStr(FEntregador.IdEntregador) + #13#10 +
              'Nome: ' + FEntregador.NomeUsuario);

  // ⭐ Determinar novo status baseado no ComboBox
  // ItemIndex 0 = "Em expediente" (True)
  // ItemIndex 1 = "Fora de expediente" (False)
  NovoStatus := (cbAtivo.ItemIndex = 0);

  // ⭐ DEBUG: Mostrar novo status
  ShowMessage('DEBUG NovoStatus: ' + BoolToStr(NovoStatus, True));

  // ⭐ Atualizar no banco de dados
  if FController.AlterarStatusExpediente(FEntregador.IdEntregador, NovoStatus) then
  begin
    // ⭐ Atualizar localmente
    FEntregador.EmExpediente := NovoStatus;

    // ⭐ Feedback visual
    if NovoStatus then
    begin
      lblAtivo.Caption := '🟢 Em Expediente';
      lblAtivo.Font.Color := $0000BB00; // Verde
    end
    else
    begin
      lblAtivo.Caption := '🔴 Fora de Expediente';
      lblAtivo.Font.Color := $000000BB; // Vermelho
    end;
  end
  else
  begin
    // ⭐ Se falhou, reverter o combobox
    ShowMessage('DEBUG: AlterarStatusExpediente retornou FALSE!');
    if NovoStatus then
      cbAtivo.ItemIndex := 1
    else
      cbAtivo.ItemIndex := 0;
  end;
end;

procedure TFormHomeE.AtualizarStatusExpediente;
begin
  if not Assigned(FEntregador) then
    Exit;

  // ⭐ Atualizar ComboBox baseado no status do banco
  if FEntregador.EmExpediente then
  begin
    cbAtivo.ItemIndex := 0; // "Em expediente"
    lblAtivo.Caption := '🟢 Em Expediente';
    lblAtivo.Font.Color := $0000BB00; // Verde
  end
  else
  begin
    cbAtivo.ItemIndex := 1; // "Fora de expediente"
    lblAtivo.Caption := '🔴 Fora de Expediente';
    lblAtivo.Font.Color := $000000BB; // Vermelho
  end;
end;

// ========== NAVEGAÇÃO DO MENU ==========

procedure TFormHomeE.iButton1Click(Sender: TObject);
begin
  if pBarraMenuLeft.Width = 57 then
  begin
    pBarraMenuLeft.Width := 225;
    pBarraMenuLeft.Height := 683;
  end
  else
  begin
    pBarraMenuLeft.Width := 57;
    pBarraMenuLeft.Height := 55;
  end;
end;

procedure TFormHomeE.iButton1MenuClick(Sender: TObject);
begin
  if pBarraMenuLeft.Width = 89 then
  begin
    pBarraMenuLeft.Width := 190;
  end
  else
  begin
    pBarraMenuLeft.Width := 89;
  end;
end;

// ========== ⭐ INTEGRAÇÃO COM VIACEP ==========

procedure TFormHomeE.BuscarEnderecoPorCEP;
var
  CEP: String;
  Endereco: TEndereco; // ⭐ Tipo correto do ViaCEPHelper
begin
  // Pegar CEP do campo
  CEP := meCEPDE.Text;

  // Validar se CEP não está vazio
  if Trim(CEP) = '' then
    Exit;

  try
    // ⭐ Usar o método correto do ViaCEPHelper
    Endereco := TViaCEPHelper.BuscarEnderecoPorCEP(CEP);

    // Se não deu erro, os campos já foram validados pelo Helper
    if not Endereco.Erro then
    begin
      // ⭐ Preencher campos com os dados retornados
      eLogradouroDE.Text := Endereco.Logradouro;
      eBairroDE.Text := Endereco.Bairro;
      eCidadeDE.Text := Endereco.Localidade;
      cbEstadoDE.Text := Endereco.UF;

      // Complemento (se tiver)
      if Trim(Endereco.Complemento) <> '' then
        eComplementoDE.Text := Endereco.Complemento;

      // Focar no campo Número para usuário preencher
      eNumeroEnderecoDE.SetFocus;
    end;
    // Se der erro, o próprio ViaCEPHelper já mostra a mensagem

  except
    on E: Exception do
    begin
      ShowMessage('❌ Erro ao buscar CEP: ' + E.Message);
    end;
  end;
end;

procedure TFormHomeE.meCEPDEExit(Sender: TObject);
begin
  // Buscar endereço automaticamente quando sair do campo CEP
  if Trim(meCEPDE.Text) <> '' then
    BuscarEnderecoPorCEP;
end;

end.
