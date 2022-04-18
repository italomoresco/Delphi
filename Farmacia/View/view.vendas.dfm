inherited frmVendas: TfrmVendas
  Caption = 'Vendas'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    inherited pnlButtons: TPanel
      ExplicitTop = -5
      inherited btnSave: TButton
        OnClick = btnSaveClick
      end
      inherited btnExcluir: TButton
        OnClick = btnExcluirClick
      end
    end
    inherited pcMain: TPageControl
      ActivePage = TabSheet2
      inherited TabSheet1: TTabSheet
        inherited pnlSearch: TPanel
          inherited btnSearch: TButton
            OnClick = btnSearchClick
          end
        end
        inherited dbgSearch: TDBGrid
          DataSource = dsSearch
        end
      end
      inherited TabSheet2: TTabSheet
        object pcVenda: TPageControl
          Left = 0
          Top = 0
          Width = 528
          Height = 274
          ActivePage = pcSale
          Align = alClient
          TabOrder = 0
          object pcSale: TTabSheet
            Caption = 'Venda'
            object lblCode: TLabel
              Left = 12
              Top = 7
              Width = 33
              Height = 13
              Caption = 'C'#243'digo'
            end
            object lblCustomer: TLabel
              Left = 12
              Top = 33
              Width = 33
              Height = 13
              Caption = 'Cliente'
            end
            object edtCode: TDBEdit
              Left = 51
              Top = 3
              Width = 121
              Height = 21
              DataField = 'Id'
              DataSource = dsSearch
              TabOrder = 0
            end
            object edtCustomer: TDBEdit
              Left = 51
              Top = 30
              Width = 121
              Height = 21
              DataField = 'Descricao'
              DataSource = dsSearch
              TabOrder = 1
            end
          end
          object TabSheet4: TTabSheet
            Caption = 'Produtos'
            ImageIndex = 1
            object pnlProduct: TPanel
              Left = 0
              Top = 0
              Width = 520
              Height = 35
              Align = alTop
              BevelKind = bkFlat
              TabOrder = 0
              object lblProduct: TLabel
                Left = 8
                Top = 10
                Width = 38
                Height = 13
                Caption = 'Produto'
              end
              object lblQuantity: TLabel
                Left = 179
                Top = 10
                Width = 56
                Height = 13
                Caption = 'Quantidade'
              end
              object lblPrice: TLabel
                Left = 356
                Top = 10
                Width = 24
                Height = 13
                Caption = 'Valor'
              end
              object edtProduct: TDBEdit
                Left = 52
                Top = 5
                Width = 121
                Height = 21
                DataField = 'ITEM'
                DataSource = dsItens
                TabOrder = 0
              end
              object edtQuantity: TDBEdit
                Left = 241
                Top = 5
                Width = 109
                Height = 21
                DataField = 'QUANTIDADE'
                DataSource = dsItens
                TabOrder = 1
              end
              object edtPrice: TDBEdit
                Left = 386
                Top = 5
                Width = 121
                Height = 21
                TabOrder = 2
              end
            end
            object dbgProduct: TDBGrid
              Left = 0
              Top = 35
              Width = 520
              Height = 211
              Align = alClient
              DataSource = dsItens
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
            end
          end
        end
      end
    end
  end
  object dsItens: TDataSource
    Left = 440
    Top = 8
  end
end
