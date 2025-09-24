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
      FTipoUsuario: string;
    public
      property Nome: string read FNome write FNome;
      property Email: string read FEmail write FEmail;
      property CPF: string read FCPF write FCPF;
      property Senha: string read FSenha write FSenha;
      property NPhone: string read FNPhone write FNPhone;
      property TipoUsuario: string read FTipoUsuario write FTipoUsuario;
    end;
implementation
end.
