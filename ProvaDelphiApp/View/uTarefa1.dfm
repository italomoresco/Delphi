inherited fTarefa1: TfTarefa1
  Caption = 'Tarefa 1'
  ClientHeight = 365
  ClientWidth = 567
  Visible = True
  ExplicitWidth = 583
  ExplicitHeight = 404
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 567
    Height = 365
    Align = alClient
    TabOrder = 0
    object lblColunas: TLabel
      Left = 16
      Top = 14
      Width = 42
      Height = 13
      Caption = 'Colunas:'
    end
    object lblTabelas: TLabel
      Left = 176
      Top = 14
      Width = 41
      Height = 13
      Caption = 'Tabelas:'
    end
    object lblCondicoes: TLabel
      Left = 336
      Top = 14
      Width = 53
      Height = 13
      Caption = 'Condi'#231#245'es:'
    end
    object lblSQL: TLabel
      Left = 16
      Top = 231
      Width = 61
      Height = 13
      Caption = 'SQL Gerado:'
    end
    object mmColunas: TMemo
      Left = 16
      Top = 32
      Width = 140
      Height = 185
      TabOrder = 0
    end
    object mmTabelas: TMemo
      Left = 176
      Top = 33
      Width = 140
      Height = 185
      TabOrder = 1
    end
    object mmCondicoes: TMemo
      Left = 336
      Top = 32
      Width = 140
      Height = 185
      TabOrder = 2
    end
    object btnGerar: TBitBtn
      Left = 484
      Top = 112
      Width = 75
      Height = 33
      Caption = 'Gerar SQL'
      TabOrder = 3
      OnClick = btnGerarClick
    end
    object mmSQL: TMemo
      Left = 16
      Top = 250
      Width = 543
      Height = 103
      TabOrder = 4
    end
  end
end
