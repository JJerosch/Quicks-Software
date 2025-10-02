unit FormHomeAdmin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, uConn, ACRUDModel;

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
    pctab6Canc: TTabSheet;
    eBuscaMain: TEdit;
    pHideTSbar: TPanel;
    procedure iButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pButton1AdicionarClick(Sender: TObject);
    procedure pButton2ExcluirClick(Sender: TObject);
    procedure pButton3AtualizarClick(Sender: TObject);
    procedure pButton4RestaurarClick(Sender: TObject);
    procedure pButton5PesquisarClick(Sender: TObject);
    procedure pButton6CancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure AtualizarGrid;
    procedure FiltrarGrid(const TextoBusca: string);
  public

  end;
var
  FormHomeA: TFormHomeA;
  SqlQr: TACRUDCfg;

implementation
{$R *.dfm}
procedure TFormHomeA.AtualizarGrid;
  begin
    SqlQr:=TACRUDCfg.Create;
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
          SqlQr.sqladd:=('WHERE ativo = True');
          SQL.Clear;
          SQL.Add('SELECT id_user, nome_user, email_user, senha_user, cpf_user, nphone_user, ativo');
          SQL.Add('FROM usuarios');
          SQL.Add(SqlQr.sqladd);
          SQL.Add('ORDER BY id_user');
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
      eBuscaMain.Clear;
    except
      on E: Exception do
        ShowMessage('Erro ao atualizar grid: ' + E.Message);
    end;
  end;

procedure TFormHomeA.FiltrarGrid(const TextoBusca: string);
  var
    Filtro: string;
  begin
    if not Assigned(DM) or not Assigned(DM.FDQr) then
    begin
      ShowMessage('DataModule ou FDQuery não disponível.');
      Exit;
    end;
    try
      with DM.FDQr do
      begin
        Filtered := False;
        Filter := '';
        if Trim(TextoBusca) <> '' then
        begin
          Filtro := Format('(nome_user LIKE ''%%%s%%'') OR (email_user LIKE ''%%%s%%'') OR (cpf_user LIKE ''%%%s%%'')',[TextoBusca, TextoBusca, TextoBusca]);
          Filter := Filtro;
          Filtered := True;
          if IsEmpty then
            ShowMessage('Nenhum usuário encontrado com o termo: ' + TextoBusca);
        end;
        First;
      end;
    except
      on E: Exception do
        ShowMessage('Erro ao filtrar: ' + E.Message);
    end;
  end;

procedure TFormHomeA.FormCreate(Sender: TObject);
  begin
    eBuscaMain.Clear;
    eBuscaMain.TextHint := 'Para digitar clique no botão "Pesquisar"';
  end;

procedure TFormHomeA.FormShow(Sender: TObject);
  begin
    if Assigned(DM) and Assigned(DM.FDQr) and Assigned(DM.FDConn) then
    begin
      try
        if DM.FDConn.Connected then
          AtualizarGrid;
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

procedure TFormHomeA.pButton1AdicionarClick(Sender: TObject);
begin
  AtualizarGrid;
end;

procedure TFormHomeA.pButton2ExcluirClick(Sender: TObject);
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
            AtualizarGrid;
            ShowMessage('Usuário desativado com sucesso!');
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

procedure TFormHomeA.pButton3AtualizarClick(Sender: TObject);
  var
    IdUsuario: Integer;
    NomeUsuario, EmailUsuario, CpfUsuario, NPhoneUsuario: string;
  begin
    if Assigned(pcButtons) then
      pcButtons.ActivePageIndex := 3;
    if not Assigned(DM) or not Assigned(DM.FDQr) then
    begin
      ShowMessage('DataModule não disponível.');
      pcButtons.ActivePageIndex := 0;
      Exit;
    end;
    if DM.FDQr.IsEmpty then
    begin
      ShowMessage('Selecione um usuário para atualizar.');
      pcButtons.ActivePageIndex := 0;
      Exit;
    end;
    try
      with DM.FDQr do
      begin
        IdUsuario := FieldByName('id_user').AsInteger;
        NomeUsuario := FieldByName('nome_user').AsString;
        EmailUsuario := FieldByName('email_user').AsString;
        CpfUsuario := FieldByName('cpf_user').AsString;
        NPhoneUsuario := FieldByName('nphone_user').AsString;
        NomeUsuario := InputBox('Atualizar Usuário', 'Nome:', NomeUsuario);
        if Trim(NomeUsuario) = '' then
        begin
          ShowMessage('O nome não pode estar vazio.');
          pcButtons.ActivePageIndex := 0;
          Exit;
        end;
        EmailUsuario := InputBox('Atualizar Usuário', 'Email:', EmailUsuario);
        if Trim(EmailUsuario) = '' then
        begin
          ShowMessage('O email não pode estar vazio.');
          pcButtons.ActivePageIndex := 0;
          Exit;
        end;
        NPhoneUsuario := InputBox('Atualizar Usuário', 'Telefone:', NPhoneUsuario);
        if MessageDlg(Format('Deseja atualizar os dados do usuário?'#13#10 + 'Nome: %s'#13#10 + 'Email: %s'#13#10 + 'Telefone: %s', [NomeUsuario, EmailUsuario, NPhoneUsuario]), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          try
            Edit;
            FieldByName('nome_user').AsString := NomeUsuario;
            FieldByName('email_user').AsString := EmailUsuario;
            FieldByName('nphone_user').AsString := NPhoneUsuario;
            Post;
            AtualizarGrid;
            ShowMessage('Usuário atualizado com sucesso!');
            pcButtons.ActivePageIndex := 0;
          except
            on E: Exception do
            begin
              Cancel;
              ShowMessage('Erro ao atualizar usuário: ' + E.Message);
              pcButtons.ActivePageIndex := 0;
            end;
          end;
        end
        else
        begin
          pcButtons.ActivePageIndex := 0;
        end;
      end;
    except
      on E: Exception do
      begin
        ShowMessage('Erro: ' + E.Message);
        pcButtons.ActivePageIndex := 0;
      end;
    end;
  end;

procedure TFormHomeA.pButton4RestaurarClick(Sender: TObject);
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
        if MessageDlg(Format('Deseja restaurar o usuário "%s"?', [NomeUsuario]),
                      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
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

procedure TFormHomeA.pButton5PesquisarClick(Sender: TObject);
  begin
    if Trim(eBuscaMain.Text) = '' then
    begin
      ShowMessage('Digite um nome ou email para pesquisar.');
      eBuscaMain.SetFocus;
      Exit;
    end;
    FiltrarGrid(Trim(eBuscaMain.Text));
  end;

procedure TFormHomeA.pButton6CancelarClick(Sender: TObject);
  begin
    // Verifica se o DM existe
    if not Assigned(DM) or not Assigned(DM.FDQr) then
    begin
      eBuscaMain.Clear;
      Exit;
    end;

    try
      // Cancela qualquer operação em andamento
      with DM.FDQr do
      begin
        if State in [dsEdit, dsInsert] then
          Cancel;
      end;

      // Limpa o campo de busca e atualiza o grid
      eBuscaMain.Clear;
      AtualizarGrid;

      ShowMessage('Operação cancelada. Grid restaurado.');
    except
      on E: Exception do
        ShowMessage('Erro ao cancelar: ' + E.Message);
    end;
  end;
end.
