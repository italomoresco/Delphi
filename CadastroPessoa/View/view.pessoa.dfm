inherited frmPessoa: TfrmPessoa
  Caption = 'Cadastro de Pessoas'
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
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPF'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RG'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_MAE'
              Title.Caption = 'Nome M'#227'e'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_PAI'
              Title.Caption = 'Nome Pai'
              Width = 100
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
            object lblCode: TLabel
              Left = 20
              Top = 6
              Width = 33
              Height = 13
              Caption = 'C'#243'digo'
            end
            object lblName: TLabel
              Left = 26
              Top = 33
              Width = 27
              Height = 13
              Caption = 'Nome'
            end
            object lblCPF: TLabel
              Left = 34
              Top = 141
              Width = 19
              Height = 13
              Caption = 'CPF'
            end
            object lblRG: TLabel
              Left = 39
              Top = 114
              Width = 14
              Height = 13
              Caption = 'RG'
            end
            object lblNameMother: TLabel
              Left = 3
              Top = 60
              Width = 50
              Height = 13
              Caption = 'Nome M'#227'e'
            end
            object lblNameDad: TLabel
              Left = 9
              Top = 87
              Width = 44
              Height = 13
              Caption = 'Nome Pai'
            end
            object edtOrderNumber: TDBEdit
              Left = 59
              Top = 3
              Width = 121
              Height = 21
              DataField = 'ID'
              DataSource = dsSearch
              ReadOnly = True
              TabOrder = 0
            end
            object edtName: TDBEdit
              Left = 59
              Top = 30
              Width = 400
              Height = 21
              DataField = 'NOME'
              DataSource = dsSearch
              TabOrder = 1
            end
            object edtDate: TDBEdit
              Left = 59
              Top = 138
              Width = 121
              Height = 21
              DataField = 'CPF'
              DataSource = dsSearch
              TabOrder = 2
            end
            object edtRG: TDBEdit
              Left = 59
              Top = 111
              Width = 121
              Height = 21
              DataField = 'RG'
              DataSource = dsSearch
              TabOrder = 3
            end
            object edtMotherName: TDBEdit
              Left = 59
              Top = 57
              Width = 400
              Height = 21
              DataField = 'NOME_MAE'
              DataSource = dsSearch
              TabOrder = 4
            end
            object edtDadName: TDBEdit
              Left = 59
              Top = 84
              Width = 400
              Height = 21
              DataField = 'NOME_PAI'
              DataSource = dsSearch
              TabOrder = 5
              OnExit = edtDadNameExit
            end
          end
          object tsAddress: TTabSheet
            Caption = 'Endere'#231'os'
            ImageIndex = 1
            object dbgProduct: TDBGrid
              Left = 0
              Top = 65
              Width = 520
              Height = 181
              Align = alClient
              DataSource = dsAddress
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CEP'
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ENDERECO'
                  Title.Caption = 'Endere'#231'o'
                  Width = 150
                  Visible = True
                end
                item
                  Alignment = taRightJustify
                  Expanded = False
                  FieldName = 'NUM'
                  Title.Alignment = taRightJustify
                  Title.Caption = 'N'#250'mero'
                  Width = 80
                  Visible = True
                end
                item
                  Alignment = taRightJustify
                  Expanded = False
                  FieldName = 'CIDADE'
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Cidade'
                  Width = 80
                  Visible = True
                end
                item
                  Alignment = taRightJustify
                  Expanded = False
                  FieldName = 'ESTADO'
                  Title.Alignment = taRightJustify
                  Title.Caption = 'UF'
                  Width = 80
                  Visible = True
                end>
            end
            object pnlProduct: TPanel
              Left = 0
              Top = 0
              Width = 520
              Height = 65
              Align = alTop
              BevelKind = bkFlat
              TabOrder = 1
              object lblZipCode: TLabel
                Left = 16
                Top = 8
                Width = 19
                Height = 13
                Caption = 'CEP'
              end
              object lblAddress: TLabel
                Left = 173
                Top = 8
                Width = 45
                Height = 13
                Caption = 'Endere'#231'o'
              end
              object lblNumber: TLabel
                Left = 380
                Top = 8
                Width = 37
                Height = 13
                Caption = 'N'#250'mero'
              end
              object lblCity: TLabel
                Left = 2
                Top = 35
                Width = 33
                Height = 13
                Caption = 'Cidade'
              end
              object lblState: TLabel
                Left = 185
                Top = 35
                Width = 33
                Height = 13
                Caption = 'Estado'
              end
              object edtZipCode: TDBEdit
                Left = 39
                Top = 5
                Width = 121
                Height = 21
                DataField = 'CEP'
                DataSource = dsAddress
                TabOrder = 0
              end
              object edtAddress: TDBEdit
                Left = 225
                Top = 5
                Width = 149
                Height = 21
                DataField = 'ENDERECO'
                DataSource = dsAddress
                TabOrder = 1
              end
              object edtNumber: TDBEdit
                Left = 424
                Top = 5
                Width = 83
                Height = 21
                DataField = 'NUM'
                DataSource = dsAddress
                TabOrder = 2
              end
              object edtCity: TDBEdit
                Left = 39
                Top = 32
                Width = 121
                Height = 21
                DataField = 'CIDADE'
                DataSource = dsAddress
                TabOrder = 3
              end
              object edtState: TDBEdit
                Left = 224
                Top = 32
                Width = 149
                Height = 21
                DataField = 'ESTADO'
                DataSource = dsAddress
                TabOrder = 4
                OnExit = edtStateExit
              end
            end
          end
        end
      end
    end
  end
  object dsAddress: TDataSource
    OnDataChange = dsAddressDataChange
    Left = 485
    Top = 58
  end
end
