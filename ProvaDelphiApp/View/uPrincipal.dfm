object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 262
  ClientWidth = 527
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmMenu
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 527
    Height = 262
    Align = alClient
    AutoSize = True
    TabOrder = 0
  end
  object mmMenu: TMainMenu
    Left = 256
    Top = 136
    object miTarefas: TMenuItem
      Caption = 'Tarefas'
      object miTarefa1: TMenuItem
        Caption = 'Tarefa 1'
        OnClick = miTarefa1Click
      end
      object miTarefa2: TMenuItem
        Caption = 'Tarefa 2'
        OnClick = miTarefa2Click
      end
      object miTarefa3: TMenuItem
        Caption = 'Tarefa 3'
        OnClick = miTarefa3Click
      end
    end
  end
end
