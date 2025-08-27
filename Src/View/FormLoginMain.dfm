object FormLogin: TFormLogin
  Left = 0
  Top = 0
  Caption = 'FormLogin'
  ClientHeight = 1061
  ClientWidth = 1920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 0
    Top = 0
    Width = 1920
    Height = 1061
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 72
    ExplicitTop = 264
    ExplicitHeight = 1080
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 997
      Width = 1912
      Height = 60
      Align = alBottom
      Alignment = taLeftJustify
      Caption = 'Panel2'
      TabOrder = 0
      ExplicitTop = 1016
      object bFormLoginSair: TButton
        Left = 1
        Top = 1
        Width = 88
        Height = 58
        Align = alLeft
        Caption = 'Sair'
        TabOrder = 0
        OnClick = bFormLoginSairClick
      end
    end
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 1912
      Height = 987
      Align = alClient
      Alignment = taLeftJustify
      Caption = 'Panel2'
      TabOrder = 1
      ExplicitHeight = 957
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 847
        Height = 985
        Align = alClient
        Caption = 'Panel4'
        TabOrder = 0
        ExplicitWidth = 656
      end
      object Panel5: TPanel
        Left = 848
        Top = 1
        Width = 1063
        Height = 985
        Align = alRight
        Caption = 'Panel5'
        TabOrder = 1
      end
    end
  end
end
