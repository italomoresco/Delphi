inherited frmProdutos: TfrmProdutos
  Caption = 'Produtos'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBText1: TDBText [0]
    Left = 248
    Top = 184
    Width = 65
    Height = 17
  end
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
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Produto'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR'
              Title.Caption = 'Valor'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTOQUE'
              Title.Caption = 'Saldo'
              Width = 100
              Visible = True
            end>
        end
      end
      inherited TabSheet2: TTabSheet
        object lbID: TLabel
          Left = 25
          Top = 11
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object lblName: TLabel
          Left = 12
          Top = 38
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object lblPrice: TLabel
          Left = 31
          Top = 65
          Width = 27
          Height = 13
          Caption = 'Pre'#231'o'
        end
        object edtID: TDBEdit
          Left = 64
          Top = 8
          Width = 121
          Height = 21
          DataField = 'ID'
          DataSource = dsSearch
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
        object edtName: TDBEdit
          Left = 64
          Top = 35
          Width = 335
          Height = 21
          DataField = 'DESCRICAO'
          DataSource = dsSearch
          TabOrder = 1
        end
        object edtPrice: TDBEdit
          Left = 64
          Top = 62
          Width = 121
          Height = 21
          DataField = 'VALOR'
          DataSource = dsSearch
          TabOrder = 2
        end
      end
    end
  end
end
