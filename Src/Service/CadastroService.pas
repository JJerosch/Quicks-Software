unit CadastroService;

interface
uses
  CadastroModel, SysUtils, vcl.Dialogs, CadastroRepository;

type
  TCadastroService = class
  private
    Repository: TCadastroRepository;
  public
    constructor Create;
    destructor Destroy; override;
    function Cadastrar(const Cadastro: TCadastroCfg): Boolean;
  end;

implementation

constructor TCadastroService.Create;
  begin
    inherited;
    Repository := TCadastroRepository.Create;
  end;

destructor TCadastroService.Destroy;
  begin
    Repository.Free;
    inherited;
  end;

function TCadastroService.Cadastrar(const Cadastro: TCadastroCfg): Boolean;
  begin
    Result := False;
    while (Cadastro.Nome = '') or (Cadastro.Email = '') or (Cadastro.Senha = '') or (Cadastro.CPF = '') or (Cadastro.NPhone = '') or (Cadastro.TipoUsuario = '') do
    begin
      raise Exception.Create('Preencha todos os campos e tente novamente.');
    end;
    if Repository.VerificarEmail(Cadastro.Email) then
    begin
      raise Exception.Create('Este e-mail já está cadastrado. Por favor, use outro.');
    end;
    if Cadastro.TipoUsuario = 'Cliente' then
    begin
      Cadastro.IdTipoUsuario:=1;
      Result := Repository.AddUserTipoUsuario(Cadastro)
    end else if Cadastro.TipoUsuario = 'Dono de Comércio' then
      begin
          Cadastro.IdTipoUsuario:=2;
          Result := Repository.AddUserTipoUsuario(Cadastro)
      end else if Cadastro.TipoUsuario = 'Entregador' then
        begin
          Cadastro.IdTipoUsuario:=3;
          Result := Repository.AddUserTipoUsuario(Cadastro)
        end else if Cadastro.TipoUsuario = 'Administrador' then
          begin
              Cadastro.IdTipoUsuario:=4;
              Result := Repository.AddUserTipoUsuario(Cadastro)
          end else
            raise Exception.Create('Tipo de usuário inválido. Escolha Cliente, Entregador ou Dono de comércio.');
    if Result then
      ShowMessage('Usuário ' + Cadastro.Nome + ' salvo com sucesso!');
  end;
end.
