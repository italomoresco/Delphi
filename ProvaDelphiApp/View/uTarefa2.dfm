inherited fTarefa2: TfTarefa2
  Caption = 'Tarefa 2'
  ClientHeight = 208
  Visible = True
  ExplicitHeight = 247
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 527
    Height = 208
    Align = alClient
    TabOrder = 0
    object lblIntervalo1: TLabel
      Left = 140
      Top = 28
      Width = 53
      Height = 13
      Caption = 'Intervalo 1'
    end
    object lblIntervalo2: TLabel
      Left = 140
      Top = 97
      Width = 53
      Height = 13
      Caption = 'Intervalo 2'
    end
    object edtIntervalo1: TEdit
      Left = 202
      Top = 24
      Width = 121
      Height = 21
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 0
      Text = '100'
    end
    object edtIntervalo2: TEdit
      Left = 202
      Top = 93
      Width = 121
      Height = 21
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 1
      Text = '100'
    end
    object pb1: TProgressBar
      Left = 13
      Top = 51
      Width = 505
      Height = 30
      TabOrder = 2
    end
    object pb2: TProgressBar
      Left = 13
      Top = 120
      Width = 505
      Height = 30
      TabOrder = 3
    end
    object btnExecutar: TButton
      Left = 1
      Top = 172
      Width = 525
      Height = 35
      Align = alBottom
      Caption = 'Executar'
      TabOrder = 4
      OnClick = btnExecutarClick
    end
  end
end
