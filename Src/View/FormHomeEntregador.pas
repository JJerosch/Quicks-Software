unit FormHomeEntregador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.Mask;

type
  TFormHomeE = class(TForm)
    pHomeBackground: TPanel;
    pBusca: TPanel;
    Image1: TImage;
    eBuscaMain: TEdit;
    pBarraMenuLeft: TPanel;
    iButton1: TImage;
    iButton3: TImage;
    iButton4: TImage;
    iButtonLeave: TImage;
    lblButton1: TLabel;
    lblButton3: TLabel;
    lblButton4: TLabel;
    lblSair: TLabel;
    pcMain: TPageControl;
    tsSelecione: TTabSheet;
    tsPerfil: TTabSheet;
    scbxPerfil: TScrollBox;
    pSalvar: TPanel;
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
    pButtonAlterarSenhaPerfilE: TPanel;
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
    procedure iButton1MenuClick(Sender: TObject);
    procedure iButton1Click(Sender: TObject);
  private
    FIdUsuario: Integer;
    FNomeUsuario: String;
  public
    property IdUsuario: Integer read FIdUsuario write FIdUsuario;
    property NomeUsuario: String read FNomeUsuario write FNomeUsuario;
  end;

var
  FormHomeE: TFormHomeE;

implementation

{$R *.dfm}

procedure TFormHomeE.iButton1Click(Sender: TObject);
begin
if pBarraMenuLeft.Width = 57 then begin
    pBarraMenuLeft.Width := 225;
    pBarraMenuLeft.Height := 683;
  end else begin
    pBarraMenuLeft.Width := 57;
    pBarraMenuLeft.Height :=55;
  end;
end;

procedure TFormHomeE.iButton1MenuClick(Sender: TObject);
begin
   if pBarraMenuLeft.Width = 89 then begin
    pBarraMenuLeft.Width := 190;
  end else begin
    pBarraMenuLeft.Width := 89;
  end;
end;
end.
