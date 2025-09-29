unit CadastroService;

interface

uses
  CadastroModel,SysUtils,vcl.Dialogs;
type
  TCadastroService = class
  public
    constructor Create;
    //class procedure LerCB(const Cadastro: TCadastroCfg);
    function Cadastrar(const Cadastro: TCadastroCfg): Boolean;
  end;

implementation
uses CadastroRepository;

//class procedure TCadastroService.LerCB(const Cadastro: TCadastroCfg);
//var escolhacb: string;
//begin
//  escolhacb:= Cadastro.TipoUsuario;
//  if escolhacb = 'Dono de Comércio' then begin
//    TCadastroRepository.AddUserDonoComercio();
//  end else if escolhacb = 'Entregador' then begin
//    TCadastroRepository.AddUserEntregador();
//  end else if escolhacb = 'Cliente' then begin
//    TCadastroRepository.AdduserCliente();
//  end else begin
//    raise Exception.Create(' Faça sua escolha sobre quais funcionalidades sua conta vai executar e tente novamente.');
//  end;
//end;

function TCadastroService.Cadastrar(const cadastro: TCadastroCfg): Boolean;
var
  Repository: TCadastroRepository;
  IdGerado: Integer;
begin
  if (Cadastro.Nome = '') or
     (Cadastro.Email = '') or
     (Cadastro.Senha = '') or
     (Cadastro.CPF = '') or
     (Cadastro.NPhone = '') or
     (Cadastro.TipoUsuario = '') then
    begin
      raise Exception.Create(' Preencha todos os campos e tente novamente.');
    end;
  Repository := TCadastroRepository.Create;
  try
    if Repository.VerificarEmail(Cadastro.Email) then
      begin
        raise Exception.Create(' Este e-mail já está cadastrado. Por favor, use outro.');
      end else begin
        IdGerado := Repository.AddUser(Cadastro.Nome, Cadastro.Email, Cadastro.Senha, Cadastro.CPF, Cadastro.NPhone);
        Result := True;
      end;
  finally
    Repository.Free;
  end;
  ShowMessage('Usuário ' + Cadastro.Nome + ' salvo com sucesso!');
end;
constructor TCadastroService.Create;
begin

end;

end.
