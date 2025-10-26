unit UsuarioControllerCRUDAdmin;

interface

uses
  System.SysUtils, System.Generics.Collections, System.UITypes, Vcl.Dialogs, Vcl.Forms,
  UsuarioModelCRUDAdmin, UsuarioServiceCRUDAdmin, CargosModelCRUDAdmin;

type
  TUsuarioController = class
  private
    FService: TUsuarioService;
  public
    constructor Create;
    destructor Destroy; override;

    // Operações de Usuário
    function CadastrarUsuario(Usuario: TUsuario; const Senha: string): Boolean;
    function AtualizarUsuario(Usuario: TUsuario): Boolean;
    function DesativarUsuario(IdUsuario: Integer; const NomeUsuario: string): Boolean;
    function ReativarUsuario(IdUsuario: Integer; const NomeUsuario: string): Boolean;

    // Consultas
    function ObterUsuario(IdUsuario: Integer): TUsuario;
    function ListarUsuarios(ApenasAtivos: Boolean): TObjectList<TUsuario>;

    // Cargos
    function ListarCargos: TObjectList<TCargo>;
  end;

implementation

{ TUsuarioController }

constructor TUsuarioController.Create;
begin
  inherited;
  FService := TUsuarioService.Create;
end;

destructor TUsuarioController.Destroy;
begin
  FService.Free;
  inherited;
end;

function TUsuarioController.CadastrarUsuario(Usuario: TUsuario; const Senha: string): Boolean;
begin
  try
    Result := FService.AdicionarUsuario(Usuario, Senha);
  except
    on E: Exception do
    begin
      ShowMessage('Erro no controller ao cadastrar: ' + E.Message);
      Result := False;
    end;
  end;
end;

function TUsuarioController.AtualizarUsuario(Usuario: TUsuario): Boolean;
begin
  try
    Result := FService.AtualizarUsuario(Usuario);
  except
    on E: Exception do
    begin
      ShowMessage('Erro no controller ao atualizar: ' + E.Message);
      Result := False;
    end;
  end;
end;

function TUsuarioController.DesativarUsuario(IdUsuario: Integer; const NomeUsuario: string): Boolean;
begin
  Result := False;

  // Confirmar ação
  if MessageDlg(Format('Deseja desativar o usuário "%s"?', [NomeUsuario]),
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      Result := FService.DesativarUsuario(IdUsuario);
    except
      on E: Exception do
      begin
        ShowMessage('Erro no controller ao desativar: ' + E.Message);
        Result := False;
      end;
    end;
  end;
end;

function TUsuarioController.ReativarUsuario(IdUsuario: Integer; const NomeUsuario: string): Boolean;
begin
  Result := False;

  // Confirmar ação
  if MessageDlg(Format('Deseja reativar o usuário "%s"?', [NomeUsuario]),
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      Result := FService.ReativarUsuario(IdUsuario);
    except
      on E: Exception do
      begin
        ShowMessage('Erro no controller ao reativar: ' + E.Message);
        Result := False;
      end;
    end;
  end;
end;

function TUsuarioController.ObterUsuario(IdUsuario: Integer): TUsuario;
begin
  try
    Result := FService.ObterUsuario(IdUsuario);
  except
    on E: Exception do
    begin
      ShowMessage('Erro no controller ao buscar usuário: ' + E.Message);
      Result := nil;
    end;
  end;
end;

function TUsuarioController.ListarUsuarios(ApenasAtivos: Boolean): TObjectList<TUsuario>;
begin
  try
    Result := FService.ListarUsuarios(ApenasAtivos);
  except
    on E: Exception do
    begin
      ShowMessage('Erro no controller ao listar: ' + E.Message);
      Result := TObjectList<TUsuario>.Create(True);
    end;
  end;
end;

function TUsuarioController.ListarCargos: TObjectList<TCargo>;
begin
  try
    Result := FService.ListarCargos;
  except
    on E: Exception do
    begin
      ShowMessage('Erro no controller ao listar cargos: ' + E.Message);
      Result := TObjectList<TCargo>.Create(True);
    end;
  end;
end;

end.
