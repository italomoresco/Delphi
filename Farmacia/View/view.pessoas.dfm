inherited frmPessoas: TfrmPessoas
  Caption = 'frmPessoas'
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
      end
      inherited TabSheet2: TTabSheet
        object lblCode: TLabel
          Left = 25
          Top = 11
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object lblName: TLabel
          Left = 31
          Top = 38
          Width = 27
          Height = 13
          Caption = 'Nome'
        end
        object lblPostalCode: TLabel
          Left = 39
          Top = 65
          Width = 19
          Height = 13
          Caption = 'CEP'
        end
        object lblPublicPlace: TLabel
          Left = 3
          Top = 92
          Width = 55
          Height = 13
          Caption = 'Logradouro'
        end
        object lblType: TLabel
          Left = 269
          Top = 11
          Width = 20
          Height = 13
          Caption = 'Tipo'
        end
        object lblPhone: TLabel
          Left = 25
          Top = 119
          Width = 33
          Height = 13
          Caption = 'Celular'
        end
        object lblDocument: TLabel
          Left = 241
          Top = 38
          Width = 48
          Height = 13
          Caption = 'Documeto'
        end
        object lblStateCity: TLabel
          Left = 239
          Top = 65
          Width = 50
          Height = 13
          Caption = 'UF/Cidade'
        end
        object lblDistrict: TLabel
          Left = 261
          Top = 92
          Width = 28
          Height = 13
          Caption = 'Bairro'
        end
        object edtID: TDBEdit
          Left = 64
          Top = 8
          Width = 121
          Height = 21
          DataField = 'ID'
          DataSource = dsSearch
          Enabled = False
          TabOrder = 0
        end
        object edtName: TDBEdit
          Left = 64
          Top = 35
          Width = 121
          Height = 21
          DataField = 'NOME'
          DataSource = dsSearch
          TabOrder = 1
        end
        object edtPostalCode: TDBEdit
          Left = 64
          Top = 62
          Width = 121
          Height = 21
          DataField = 'CEP'
          DataSource = dsSearch
          TabOrder = 2
        end
        object edtPublicPlace: TDBEdit
          Left = 64
          Top = 89
          Width = 121
          Height = 21
          DataField = 'LOGRADOURO'
          DataSource = dsSearch
          TabOrder = 3
        end
        object edtDistrict: TDBEdit
          Left = 295
          Top = 89
          Width = 180
          Height = 21
          DataField = 'BAIRRO'
          DataSource = dsSearch
          TabOrder = 4
        end
        object edtDocument: TDBEdit
          Left = 295
          Top = 35
          Width = 180
          Height = 21
          DataField = 'DOCUMENTO'
          DataSource = dsSearch
          TabOrder = 5
        end
        object edtPhone: TDBEdit
          Left = 64
          Top = 116
          Width = 121
          Height = 21
          DataField = 'TELEFONE'
          DataSource = dsSearch
          TabOrder = 6
        end
        object edtCity: TDBEdit
          Left = 354
          Top = 62
          Width = 121
          Height = 21
          DataField = 'CIDADE'
          DataSource = dsSearch
          TabOrder = 7
        end
        object edtState: TDBEdit
          Left = 295
          Top = 62
          Width = 53
          Height = 21
          DataField = 'ESTADO'
          DataSource = dsSearch
          TabOrder = 8
        end
      end
    end
  end
end
