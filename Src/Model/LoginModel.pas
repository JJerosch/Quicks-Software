unit LoginModel;

interface
  Type TLoginCfg = class
    private
      FEmail: String;
      FSenha: String;
    public
      property Email: String Read FEmail Write FEmail;
      property Senha: String Read FSenha Write FSenha;
end;
implementation

end.
