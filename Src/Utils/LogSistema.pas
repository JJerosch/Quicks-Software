unit LogSistema;

interface

uses
  System.SysUtils, System.Classes, System.IOUtils;

type
  TLogSistema = class
  private
    class var FLogPath: String;
    class function GetLogPath: String; static;
    class function GetLogFileName: String; static;
    class function FormatarLog(const Usuario, Acao: String): String; static;
    class function FormatarLogErro(const Usuario, Acao, Erro: String): String; static;
    class procedure EscreverLog(const Texto: String); static;
  public
    class procedure RegistrarAcessoPerfil(const Usuario: String); static;
    class procedure RegistrarEdicaoPerfil(const Usuario: String); static;
    class procedure RegistrarAlteracaoSenha(const Usuario: String); static;
    class procedure RegistrarCancelamentoEdicao(const Usuario: String); static;
    class procedure RegistrarLogin(const Usuario: String); static;
    class procedure RegistrarLogout(const Usuario: String); static;
    class procedure RegistrarAcaoUsuario(const Usuario, Acao: String); static;
    class procedure RegistrarErro(const Usuario, Acao, MensagemErro: String); static;
    class procedure RegistrarErroValidacao(const Usuario, Campo, Erro: String); static;
    class procedure RegistrarErroSenha(const Usuario, Erro: String); static;

    class function LerUltimosLogs(Quantidade: Integer = 10): TStringList; static;
    class function LerLogsDeHoje: TStringList; static;
    class procedure LimparLogsAntigos(DiasParaManter: Integer = 30); static;
  end;

implementation

{ TLogSistema }

class function TLogSistema.GetLogPath: String;
begin
  if FLogPath = '' then
  begin
    // Caminho fixo conforme sua estrutura
    FLogPath := 'C:\Users\jpjer\Documents\Embarcadero\Studio\Projects\Quicks-Software\log\';

    if not DirectoryExists(FLogPath) then
      ForceDirectories(FLogPath);
  end;

  Result := FLogPath;
end;

class function TLogSistema.GetLogFileName: String;
begin
  // Nome fixo do arquivo
  Result := GetLogPath + 'log_sistema.txt';
end;

class function TLogSistema.FormatarLog(const Usuario, Acao: String): String;
begin
  Result := Format('[%s] - %s - %s',
    [FormatDateTime('dd/mm/yyyy hh:nn:ss', Now), Usuario, Acao]);
end;

class function TLogSistema.FormatarLogErro(const Usuario, Acao, Erro: String): String;
begin
  Result := Format('[%s] - %s - %s - ERRO: %s',
    [FormatDateTime('dd/mm/yyyy hh:nn:ss', Now), Usuario, Acao, Erro]);
end;

// Método centralizado para escrever no log
class procedure TLogSistema.EscreverLog(const Texto: String);
var
  LogFile: TextFile;
  LogFileName: String;
begin
  try
    LogFileName := GetLogFileName;

    AssignFile(LogFile, LogFileName);

    if FileExists(LogFileName) then
      Append(LogFile)
    else
      Rewrite(LogFile);

    try
      WriteLn(LogFile, Texto);
    finally
      CloseFile(LogFile);
    end;
  except
    on E: Exception do
    begin
      // Se quiser debugar, descomente a linha abaixo
      // ShowMessage('Erro ao gravar log: ' + E.Message);
    end;
  end;
end;

class procedure TLogSistema.RegistrarAcessoPerfil(const Usuario: String);
begin
  EscreverLog(FormatarLog(Usuario, 'Acessou visualização de perfil'));
end;

class procedure TLogSistema.RegistrarEdicaoPerfil(const Usuario: String);
begin
  EscreverLog(FormatarLog(Usuario, 'Perfil atualizado com sucesso'));
end;

class procedure TLogSistema.RegistrarAlteracaoSenha(const Usuario: String);
begin
  EscreverLog(FormatarLog(Usuario, 'Senha alterada com sucesso'));
end;

class procedure TLogSistema.RegistrarCancelamentoEdicao(const Usuario: String);
begin
  EscreverLog(FormatarLog(Usuario, 'Cancelou edição de perfil'));
end;

class procedure TLogSistema.RegistrarLogin(const Usuario: String);
begin
  EscreverLog(FormatarLog(Usuario, 'Login Efetuado'));
end;

class procedure TLogSistema.RegistrarLogout(const Usuario: String);
begin
  EscreverLog(FormatarLog(Usuario, 'Logout do sistema'));
end;

class procedure TLogSistema.RegistrarAcaoUsuario(const Usuario, Acao: String);
begin
  EscreverLog(FormatarLog(Usuario, Acao));
end;

class procedure TLogSistema.RegistrarErro(const Usuario, Acao, MensagemErro: String);
begin
  EscreverLog(FormatarLogErro(Usuario, Acao, MensagemErro));
end;

class procedure TLogSistema.RegistrarErroValidacao(const Usuario, Campo, Erro: String);
begin
  RegistrarErro(Usuario, Format('Validação do campo %s', [Campo]), Erro);
end;

class procedure TLogSistema.RegistrarErroSenha(const Usuario, Erro: String);
begin
  RegistrarErro(Usuario, 'Alteração de Senha', Erro);
end;

class function TLogSistema.LerUltimosLogs(Quantidade: Integer): TStringList;
var
  LogFileName: String;
  TodasLinhas: TStringList;
  Inicio: Integer;
  i: Integer;
begin
  Result := TStringList.Create;

  try
    LogFileName := GetLogFileName;

    if not FileExists(LogFileName) then
      Exit;

    TodasLinhas := TStringList.Create;
    try
      TodasLinhas.LoadFromFile(LogFileName);

      if TodasLinhas.Count > Quantidade then
        Inicio := TodasLinhas.Count - Quantidade
      else
        Inicio := 0;

      for i := Inicio to TodasLinhas.Count - 1 do
        Result.Add(TodasLinhas[i]);

    finally
      TodasLinhas.Free;
    end;
  except
    // Retorna lista vazia em caso de erro
  end;
end;

class function TLogSistema.LerLogsDeHoje: TStringList;
var
  LogFileName: String;
  TodasLinhas: TStringList;
  Linha: String;
  DataHoje: String;
begin
  Result := TStringList.Create;
  LogFileName := GetLogFileName;

  try
    if not FileExists(LogFileName) then
      Exit;

    DataHoje := FormatDateTime('dd/mm/yyyy', Date);
    TodasLinhas := TStringList.Create;
    try
      TodasLinhas.LoadFromFile(LogFileName);

      // Filtra apenas os logs de hoje
      for Linha in TodasLinhas do
      begin
        if Pos('[' + DataHoje, Linha) = 1 then
          Result.Add(Linha);
      end;
    finally
      TodasLinhas.Free;
    end;
  except
    // Retorna lista vazia em caso de erro
  end;
end;

class procedure TLogSistema.LimparLogsAntigos(DiasParaManter: Integer);
var
  LogFileName: String;
  TodasLinhas: TStringList;
  NovasLinhas: TStringList;
  Linha: String;
  DataLimite: TDateTime;
  DataLinha: TDateTime;
  DataStr: String;
  PosInicio, PosFim: Integer;
begin
  try
    LogFileName := GetLogFileName;

    if not FileExists(LogFileName) then
      Exit;

    DataLimite := Date - DiasParaManter;
    TodasLinhas := TStringList.Create;
    NovasLinhas := TStringList.Create;
    try
      TodasLinhas.LoadFromFile(LogFileName);

      for Linha in TodasLinhas do
      begin
        // Extrai a data da linha: [dd/mm/yyyy hh:nn:ss]
        PosInicio := Pos('[', Linha);
        PosFim := Pos(']', Linha);

        if (PosInicio > 0) and (PosFim > PosInicio) then
        begin
          DataStr := Copy(Linha, PosInicio + 1, 10); // Pega apenas dd/mm/yyyy

          try
            DataLinha := StrToDate(DataStr);

            // Mantém apenas logs recentes
            if DataLinha >= DataLimite then
              NovasLinhas.Add(Linha);
          except
            // Se não conseguir ler a data, mantém a linha
            NovasLinhas.Add(Linha);
          end;
        end
        else
          NovasLinhas.Add(Linha);
      end;

      // Salva o arquivo atualizado
      NovasLinhas.SaveToFile(LogFileName);
    finally
      TodasLinhas.Free;
      NovasLinhas.Free;
    end;
  except
    // Ignora erros
  end;
end;

end.
