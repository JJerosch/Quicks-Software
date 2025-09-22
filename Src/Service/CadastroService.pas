unit CadastroService;

interface

uses
  CadastroModel,SysUtils,vcl.Dialogs;
type
  TCadastroService = class
  public
    class procedure Salvar(const Cadastro: TCadastroCfg);
  end;

implementation

uses
  CadastroRepository;

class procedure TCadastroService.Salvar(const cadastro: TCadastroCfg);
var
  Repository: TCadastroRepository;
begin
  if (Cadastro.Email = '') or (Cadastro.Senha = '') or (Cadastro.CPF = '') or (Cadastro.NPhone = '') or (Cadastro.Nome = '') then
    begin
      raise Exception.Create(' Preencha todos os campos e tente novamente.');
    end;
  Repository := TCadastroRepository.Create;
  try
    if Repository.VerificarEmail(Cadastro.Email) then
      begin
        raise Exception.Create(' Este e-mail já está cadastrado. Por favor, use outro.');
      end;
  finally
    Repository.Free;
  end;
  ShowMessage('Usuário ' + Cadastro.Nome + ' salvo com sucesso!');
end;

end.
