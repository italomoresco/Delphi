object frmPadrao: TfrmPadrao
  Left = 0
  Top = 0
  Caption = 'frmPadrao'
  ClientHeight = 345
  ClientWidth = 538
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 538
    Height = 345
    Align = alClient
    TabOrder = 0
    object pnlButtons: TPanel
      Left = 1
      Top = 1
      Width = 536
      Height = 41
      Align = alTop
      TabOrder = 0
      object btnNew: TButton
        Left = 4
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Novo'
        TabOrder = 0
      end
      object btnSave: TButton
        Left = 85
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Salvar'
        TabOrder = 1
      end
      object btnCancel: TButton
        Left = 166
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 2
      end
      object btnDelete: TButton
        Left = 247
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Excluir'
        TabOrder = 3
      end
    end
    object pcMain: TPageControl
      Left = 1
      Top = 42
      Width = 536
      Height = 302
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 1
      OnChange = pcMainChange
      object TabSheet1: TTabSheet
        Caption = 'Consulta'
        object pnlSearch: TPanel
          Left = 0
          Top = 0
          Width = 528
          Height = 41
          Align = alTop
          TabOrder = 0
          object btnSearch: TButton
            Left = 1
            Top = 1
            Width = 526
            Height = 39
            Align = alClient
            Caption = 'Consultar'
            TabOrder = 0
          end
        end
        object dbgSearch: TDBGrid
          Left = 0
          Top = 47
          Width = 528
          Height = 227
          Align = alBottom
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = dbgSearchDblClick
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Cadastro'
        ImageIndex = 1
      end
    end
  end
  object dsSearch: TDataSource
    OnDataChange = dsSearchDataChange
    Left = 488
    Top = 8
  end
end
