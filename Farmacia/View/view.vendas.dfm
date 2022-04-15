inherited frmVendas: TfrmVendas
  Caption = 'Vendas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 538
    ExplicitHeight = 345
    inherited pnlButtons: TPanel
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 536
    end
    inherited pcMain: TPageControl
      ActivePage = TabSheet2
      ExplicitTop = 40
      ExplicitWidth = 536
      ExplicitHeight = 302
      inherited TabSheet1: TTabSheet
        inherited pnlSearch: TPanel
          ExplicitTop = 0
          ExplicitWidth = 528
        end
      end
      inherited TabSheet2: TTabSheet
        object PageControl1: TPageControl
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
              Top = 3
              Width = 33
              Height = 13
              Caption = 'C'#243'digo'
            end
            object lblCustomer: TLabel
              Left = 12
              Top = 35
              Width = 33
              Height = 13
              Caption = 'Cliente'
            end
            object Label3: TLabel
              Left = 92
              Top = 51
              Width = 33
              Height = 13
              Caption = 'C'#243'digo'
            end
            object Label4: TLabel
              Left = 3
              Top = 67
              Width = 33
              Height = 13
              Caption = 'C'#243'digo'
            end
            object Label5: TLabel
              Left = 28
              Top = 86
              Width = 33
              Height = 13
              Caption = 'C'#243'digo'
            end
            object Label6: TLabel
              Left = 28
              Top = 123
              Width = 33
              Height = 13
              Caption = 'C'#243'digo'
            end
          end
          object TabSheet4: TTabSheet
            Caption = 'Produtos'
            ImageIndex = 1
            object pnlProduct: TPanel
              Left = 0
              Top = 0
              Width = 520
              Height = 65
              Align = alTop
              BevelKind = bkFlat
              TabOrder = 0
              ExplicitTop = -6
              object lblProduct: TLabel
                Left = 16
                Top = 16
                Width = 38
                Height = 13
                Caption = 'Produto'
              end
              object lblQuantity: TLabel
                Left = 156
                Top = 16
                Width = 56
                Height = 13
                Caption = 'Quantidade'
              end
              object lblPrice: TLabel
                Left = 276
                Top = 16
                Width = 24
                Height = 13
                Caption = 'Valor'
              end
            end
            object dbgProduct: TDBGrid
              Left = 0
              Top = 65
              Width = 520
              Height = 181
              Align = alClient
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
end
