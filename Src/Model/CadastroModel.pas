unit CadastroModel;

interface
  Type
    TCadastroCfg = class
    private
      FNome: string;
      FEmail: string;
      FCPF: string;
      FSenha: string;
      FNPhone: string;
    public
      property Nome: string read FNome write FNome;
      property Email: string read FEmail write FEmail;
      property CPF: string read FCPF write FCPF;
      property Senha: string read FSenha write FSenha;
      property NPhone: string read FNPhone write FNPhone;
    end;
implementation
{ TRegistrationCfg }
end.
