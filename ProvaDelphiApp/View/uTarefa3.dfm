inherited fTarefa3: TfTarefa3
  Caption = 'Tarefa 3'
  ClientHeight = 311
  Visible = True
  OnCreate = FormCreate
  ExplicitHeight = 350
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 527
    Height = 311
    Align = alClient
    TabOrder = 0
    object lblTotal: TLabel
      Left = 401
      Top = 205
      Width = 40
      Height = 13
      Caption = 'Total R$'
    end
    object lblTotalDivisoes: TLabel
      Left = 401
      Top = 251
      Width = 82
      Height = 13
      Caption = 'Total Divis'#245'es R$'
    end
    object lblProjeto: TLabel
      Left = 9
      Top = 4
      Width = 96
      Height = 13
      Caption = 'Valores por Projeto:'
    end
    object dbgDadosProjeto: TDBGrid
      Left = 0
      Top = 23
      Width = 527
      Height = 176
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object edtTotal: TEdit
      Left = 400
      Top = 224
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object edtTotalDivisoes: TEdit
      Left = 400
      Top = 269
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object btnTotal: TBitBtn
      Left = 280
      Top = 222
      Width = 115
      Height = 25
      Caption = 'Obter Total'
      TabOrder = 3
      OnClick = btnTotalClick
    end
    object btnTotalDivisoes: TBitBtn
      Left = 280
      Top = 267
      Width = 115
      Height = 25
      Caption = 'Obter Total Divis'#245'es'
      TabOrder = 4
      OnClick = btnTotalDivisoesClick
    end
  end
end
