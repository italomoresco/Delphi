inherited frmPedidos: TfrmPedidos
  Caption = 'Pedidos de Venda'
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
      ActivePage = TabSheet2
      inherited TabSheet1: TTabSheet
        inherited pnlSearch: TPanel
          inherited btnSearch: TButton
            OnClick = btnSearchClick
          end
        end
        inherited dbgSearch: TDBGrid
          Color = clBtnFace
          Columns = <
            item
              Expanded = False
              FieldName = 'NUMERO_PEDIDO'
              Title.Caption = 'N'#250'mero Pedido'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_CLIENTE'
              Title.Caption = 'C'#243'digo Cliente'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_EMISSAO'
              Title.Caption = 'Data Emiss'#227'o'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_TOTAL'
              Title.Caption = 'Valor Total'
              Width = 80
              Visible = True
            end>
        end
      end
      inherited TabSheet2: TTabSheet
        object pcData: TPageControl
          Left = 0
          Top = 0
          Width = 528
          Height = 274
          ActivePage = tsGeneral
          Align = alClient
          TabOrder = 0
          object tsGeneral: TTabSheet
            Caption = 'Dados Gerais'
            object lblOrderNumber: TLabel
              Left = 12
              Top = 7
              Width = 56
              Height = 13
              Caption = 'Nro. Pedido'
            end
            object lblCustomer: TLabel
              Left = 33
              Top = 33
              Width = 33
              Height = 13
              Caption = 'Cliente'
            end
            object lblDate: TLabel
              Left = 2
              Top = 61
              Width = 64
              Height = 13
              Caption = 'Data Emiss'#227'o'
            end
            object edtOrderNumber: TDBEdit
              Left = 75
              Top = 3
              Width = 121
              Height = 21
              DataField = 'NUMERO_PEDIDO'
              DataSource = dsSearch
              TabOrder = 0
            end
            object edtCustomer: TDBEdit
              Left = 75
              Top = 30
              Width = 121
              Height = 21
              DataField = 'CODIGO_CLIENTE'
              DataSource = dsSearch
              TabOrder = 1
            end
            object edtDate: TDBEdit
              Left = 75
              Top = 57
              Width = 121
              Height = 21
              DataField = 'DATA_EMISSAO'
              DataSource = dsSearch
              TabOrder = 2
              OnExit = edtDateExit
            end
            object pnlAmount: TPanel
              Left = 280
              Top = 200
              Width = 236
              Height = 41
              Color = 5592575
              ParentBackground = False
              TabOrder = 3
              object lblAmount: TLabel
                Left = 41
                Top = 16
                Width = 51
                Height = 13
                Caption = 'Valor Total'
              end
              object edtAmount: TDBEdit
                Left = 98
                Top = 8
                Width = 121
                Height = 27
                DataField = 'VALOR_TOTAL'
                DataSource = dsSearch
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
            end
            object DBComboBox1: TDBComboBox
              Left = 202
              Top = 30
              Width = 145
              Height = 21
              DataField = 'CODIGO_CLIENTE'
              DataSource = dsSearch
              TabOrder = 4
            end
            object DBLookupComboBox1: TDBLookupComboBox
              Left = 353
              Top = 30
              Width = 145
              Height = 21
              DataField = 'CODIGO_CLIENTE'
              DataSource = dsSearch
              TabOrder = 5
            end
          end
          object tsProducts: TTabSheet
            Caption = 'Produtos'
            ImageIndex = 1
            object dbgProduct: TDBGrid
              Left = 0
              Top = 35
              Width = 520
              Height = 211
              Align = alClient
              DataSource = dsItens
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnKeyDown = dbgProductKeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CODIGO_PRODUTO'
                  Title.Caption = 'C'#243'digo Produto'
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRICAO'
                  Title.Caption = 'Descri'#231#227'o'
                  Width = 150
                  Visible = True
                end
                item
                  Alignment = taRightJustify
                  Expanded = False
                  FieldName = 'VALOR_UNITARIO'
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
            object pnlProduct: TPanel
              Left = 0
              Top = 0
              Width = 520
              Height = 35
              Align = alTop
              BevelKind = bkFlat
              TabOrder = 1
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
                DataField = 'CODIGO_PRODUTO'
                DataSource = dsItens
                TabOrder = 0
                OnExit = edtProductExit
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
                DataField = 'VALOR_UNITARIO'
                DataSource = dsItens
                TabOrder = 2
                OnExit = edtPriceExit
              end
            end
          end
        end
      end
    end
  end
  object dsItens: TDataSource
    OnDataChange = dsItensDataChange
    Left = 485
    Top = 66
  end
  object dsProdutos: TDataSource
    Left = 417
    Top = 66
  end
end
