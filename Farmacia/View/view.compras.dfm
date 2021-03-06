inherited frmCompras: TfrmCompras
  Caption = 'Compras'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    inherited pnlButtons: TPanel
      inherited btnNew: TButton
        OnClick = btnNewClick
      end
      inherited btnSave: TButton
        OnClick = btnSaveClick
      end
      inherited btnCancel: TButton
        OnClick = btnCancelClick
      end
      inherited btnDelete: TButton
        OnClick = btnDeleteClick
      end
    end
    inherited pcMain: TPageControl
      inherited TabSheet1: TTabSheet
        inherited pnlSearch: TPanel
          inherited btnSearch: TButton
            OnClick = btnSearchClick
          end
        end
        inherited dbgSearch: TDBGrid
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Title.Caption = 'C'#243'digo'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PESSOA'
              Title.Caption = 'C'#243'digo Fornecedor'
              Width = 100
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'DATA'
              Title.Alignment = taRightJustify
              Title.Caption = 'Data Compra'
              Width = 100
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'VALOR_TOTAL'
              Title.Alignment = taRightJustify
              Title.Caption = 'Valor Total'
              Width = 100
              Visible = True
            end>
        end
      end
      inherited TabSheet2: TTabSheet
        object pcCompra: TPageControl
          Left = 0
          Top = 0
          Width = 528
          Height = 274
          ActivePage = pcPurchase
          Align = alClient
          TabOrder = 0
          object pcPurchase: TTabSheet
            Caption = 'Pedido'
            object lblCode: TLabel
              Left = 24
              Top = 7
              Width = 33
              Height = 13
              Caption = 'C'#243'digo'
            end
            object lblCustomer: TLabel
              Left = 2
              Top = 34
              Width = 55
              Height = 13
              Caption = 'Fornecedor'
            end
            object lblDate: TLabel
              Left = 34
              Top = 61
              Width = 23
              Height = 13
              Caption = 'Data'
            end
            object edtCode: TDBEdit
              Left = 63
              Top = 3
              Width = 121
              Height = 21
              DataField = 'ID'
              DataSource = dsSearch
              ReadOnly = True
              TabOrder = 0
            end
            object edtProvider: TDBEdit
              Left = 63
              Top = 30
              Width = 121
              Height = 21
              DataField = 'PESSOA'
              DataSource = dsSearch
              TabOrder = 1
            end
            object edtDate: TDBEdit
              Left = 63
              Top = 57
              Width = 121
              Height = 21
              DataField = 'DATA'
              DataSource = dsSearch
              TabOrder = 2
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
                Top = 8
                Width = 38
                Height = 13
                Caption = 'Produto'
              end
              object lblQuantity: TLabel
                Left = 179
                Top = 8
                Width = 56
                Height = 13
                Caption = 'Quantidade'
              end
              object lblPrice: TLabel
                Left = 358
                Top = 8
                Width = 24
                Height = 13
                Caption = 'Valor'
              end
              object edtProduct: TDBEdit
                Left = 52
                Top = 5
                Width = 121
                Height = 21
                DataField = 'PRODUTO'
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
                Left = 388
                Top = 6
                Width = 121
                Height = 21
                DataField = 'VALOR'
                DataSource = dsItens
                TabOrder = 2
                OnExit = edtPriceExit
              end
            end
            object dbgProduct: TDBGrid
              Left = 0
              Top = 35
              Width = 520
              Height = 211
              Align = alClient
              DataSource = dsItens
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              ReadOnly = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'PRODUTO'
                  Title.Caption = 'C'#243'digo Produto'
                  Width = 80
                  Visible = True
                end
                item
                  Alignment = taRightJustify
                  Expanded = False
                  FieldName = 'VALOR'
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Valor Unit'#225'rio'
                  Width = 80
                  Visible = True
                end
                item
                  Alignment = taRightJustify
                  Expanded = False
                  FieldName = 'QUANTIDADE'
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Quantidade'
                  Width = 80
                  Visible = True
                end
                item
                  Alignment = taRightJustify
                  Expanded = False
                  FieldName = 'VALOR_TOTAL'
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Valor Total'
                  Width = 80
                  Visible = True
                end>
            end
          end
        end
      end
    end
  end
  object dsItens: TDataSource
    OnDataChange = dsItensDataChange
    Left = 440
    Top = 8
  end
end
