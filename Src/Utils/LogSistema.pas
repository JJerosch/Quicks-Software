unit LogSistema;

interface

uses
  System.SysUtils, System.Classes, System.IOUtils;

type
  TLogSimples = class
  private
    { Campos de Instância }
    FCaminhoArquivo: string;
    function GetCaminhoArquivoLog: string;
  private
    { Campos de Classe (Estáticos) }
    class var FInstancia: TLogSimples;
  public
    constructor Create;
    destructor Destroy; override;

    class function Instancia: TLogSimples;
    class procedure LiberarInstancia;

    procedure Registrar(AUsuario, AAcao: string);
    procedure RegistrarComDetalhes(AUsuario, AAcao, ADetalhes: string);

    function AbrirArquivoLog: Boolean;
    function GetCaminhoCompleto: string;

    property CaminhoArquivo: string read FCaminhoArquivo write FCaminhoArquivo;
  end;

implementation

uses
  Winapi.ShellAPI, Winapi.Windows;

{ TLogSimples }

constructor TLogSimples.Create;
begin
  inherited;
  // Define o caminho FIXO para o arquivo de log
  FCaminhoArquivo := 'C:\Users\jpjer\Documents\Embarcadero\Studio\Projects\Quicks-Software\log';

  // Cria o diretório se não existir (isso continua funcionando)
  if not TDirectory.Exists(FCaminhoArquivo) then
    TDirectory.CreateDirectory(FCaminhoArquivo);
end;

destructor TLogSimples.Destroy;
begin
  inherited;
end;

class function TLogSimples.Instancia: TLogSimples;
begin
  if not Assigned(FInstancia) then
    FInstancia := TLogSimples.Create;
  Result := FInstancia;
end;

class procedure TLogSimples.LiberarInstancia;
begin
  if Assigned(FInstancia) then
    FreeAndNil(FInstancia);
end;

function TLogSimples.GetCaminhoArquivoLog: string;
begin
  // Arquivo único: log_sistema.txt
  Result := TPath.Combine(FCaminhoArquivo, 'log_sistema.txt');
end;

function TLogSimples.GetCaminhoCompleto: string;
begin
  Result := GetCaminhoArquivoLog;
end;

procedure TLogSimples.Registrar(AUsuario, AAcao: string);
begin
  RegistrarComDetalhes(AUsuario, AAcao, '');
end;

procedure TLogSimples.RegistrarComDetalhes(AUsuario, AAcao, ADetalhes: string);
var
  LArquivo: TextFile;
  LNomeArquivo: string;
  LLinha: string;
begin
  LNomeArquivo := GetCaminhoArquivoLog;

  try
    AssignFile(LArquivo, LNomeArquivo);

    if FileExists(LNomeArquivo) then
      Append(LArquivo)
    else
      Rewrite(LArquivo);

    // Formato simples: [Data/Hora] - Usuário - Ação - Detalhes
    if ADetalhes <> '' then
      LLinha := Format('[%s] - %s - %s - %s', [
        FormatDateTime('dd/mm/yyyy hh:nn:ss', Now),
        AUsuario,
        AAcao,
        ADetalhes
      ])
    else
      LLinha := Format('[%s] - %s - %s', [
        FormatDateTime('dd/mm/yyyy hh:nn:ss', Now),
        AUsuario,
        AAcao
      ]);

    WriteLn(LArquivo, LLinha);
  finally
    CloseFile(LArquivo);
  end;
end;

function TLogSimples.AbrirArquivoLog: Boolean;
var
  LCaminho: string;
begin
  Result := False;
  LCaminho := GetCaminhoArquivoLog;

  if FileExists(LCaminho) then
  begin
    // Abre o arquivo com o aplicativo padrão do Windows (Bloco de Notas)
    ShellExecute(0, 'open', PChar(LCaminho), nil, nil, SW_SHOWNORMAL);
    Result := True;
  end;
end;

initialization

finalization
  TLogSimples.LiberarInstancia;

end.
