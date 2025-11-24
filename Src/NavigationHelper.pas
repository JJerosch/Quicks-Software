unit NavigationHelper;

interface

uses
  Vcl.ComCtrls, System.SysUtils, System.UITypes;

type
  TNavigationHelper = class
  public
    class procedure IrParaHome(PageControl: TPageControl);
    class procedure IrParaLojas(PageControl: TPageControl);
    class procedure IrParaPerfil(PageControl: TPageControl);
    class procedure IrParaPedidos(PageControl: TPageControl);
    class procedure IrParaCarrinho(PageControl: TPageControl);
    class procedure IrParaComercio(PageControl: TPageControl);
    class procedure IrParaProduto(PageControl: TPageControl);

    class procedure VoltarDeComercio(PageControl: TPageControl);
    class procedure VoltarDeProduto(PageControl: TPageControl);

    class function ConfirmarSaida(const Mensagem: String = ''): Boolean;
  end;

implementation

uses
  Vcl.Dialogs;

{ TNavigationHelper }

class procedure TNavigationHelper.IrParaHome(PageControl: TPageControl);
begin
  if Assigned(PageControl) then
    PageControl.ActivePageIndex := 0;
end;

class procedure TNavigationHelper.IrParaLojas(PageControl: TPageControl);
begin
  if Assigned(PageControl) then
    PageControl.ActivePageIndex := 1;
end;

class procedure TNavigationHelper.IrParaPerfil(PageControl: TPageControl);
begin
  if Assigned(PageControl) then
    PageControl.ActivePageIndex := 2;
end;

class procedure TNavigationHelper.IrParaPedidos(PageControl: TPageControl);
begin
  if Assigned(PageControl) then
    PageControl.ActivePageIndex := 3;
end;

class procedure TNavigationHelper.IrParaCarrinho(PageControl: TPageControl);
begin
  if Assigned(PageControl) then
    PageControl.ActivePageIndex := 4;
end;

class procedure TNavigationHelper.IrParaComercio(PageControl: TPageControl);
begin
  if Assigned(PageControl) then
    PageControl.ActivePageIndex := 5;
end;

class procedure TNavigationHelper.IrParaProduto(PageControl: TPageControl);
begin
  if Assigned(PageControl) then
    PageControl.ActivePageIndex := 6;
end;

class procedure TNavigationHelper.VoltarDeComercio(PageControl: TPageControl);
begin
  IrParaLojas(PageControl);
end;

class procedure TNavigationHelper.VoltarDeProduto(PageControl: TPageControl);
begin
  IrParaComercio(PageControl);
end;

class function TNavigationHelper.ConfirmarSaida(const Mensagem: String = ''): Boolean;
var
  Msg: String;
begin
  Msg := Mensagem;
  if Msg = '' then
    Msg := 'Deseja voltar? As alterações não salvas serão perdidas.';

  Result := MessageDlg(Msg, mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;

end.
