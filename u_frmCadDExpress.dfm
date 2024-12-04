object frmCadVolDBExpress: TfrmCadVolDBExpress
  Left = 0
  Top = 0
  Caption = 'Cadastro - CCB - dbexpress'
  ClientHeight = 640
  ClientWidth = 1037
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 50
    Top = 360
    Width = 599
    Height = 145
    DataSource = dsCad
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_VOLUNT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_LIMPEZA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_MANUT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDERECO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BAIRRO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTNASC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CELULAR'
        Visible = True
      end>
  end
  object dbcPesqNome: TDBLookupCombo
    Left = 50
    Top = 32
    Width = 305
    Height = 25
    DataField = 'NOME'
    DataSource = dsCad
    TabOrder = 1
  end
  object DBLabeledEdit1: TDBLabeledEdit
    Left = 50
    Top = 176
    Width = 400
    Height = 23
    DataField = 'NOME'
    DataSource = dsCad
    TabOrder = 2
    EditLabel.Width = 33
    EditLabel.Height = 15
    EditLabel.Caption = 'Nome'
    EditLabel.Layout = tlCenter
  end
  object DBLabeledEdit2: TDBLabeledEdit
    Left = 50
    Top = 232
    Width = 121
    Height = 23
    DataField = 'COD_LIMPEZA'
    DataSource = dsCad
    TabOrder = 3
    EditLabel.Width = 72
    EditLabel.Height = 15
    EditLabel.Caption = 'C'#243'd. Limpeza'
    EditLabel.Layout = tlCenter
  end
  object DBLabeledEdit3: TDBLabeledEdit
    Left = 50
    Top = 288
    Width = 121
    Height = 23
    DataField = 'COD_MANUT'
    DataSource = dsCad
    TabOrder = 4
    EditLabel.Width = 95
    EditLabel.Height = 15
    EditLabel.Caption = 'C'#243'd. Manuten'#231#227'o'
    EditLabel.Layout = tlCenter
  end
  object DBLabeledEdit4: TDBLabeledEdit
    Left = 50
    Top = 128
    Width = 121
    Height = 23
    DataField = 'NOME'
    DataSource = dsCad
    TabOrder = 5
    EditLabel.Width = 68
    EditLabel.Height = 15
    EditLabel.Caption = 'ID Volunt'#225'rio'
    EditLabel.Layout = tlCenter
  end
  object DBNavigator1: TDBNavigator
    Left = 50
    Top = 329
    Width = 240
    Height = 25
    DataSource = dsCad
    TabOrder = 6
  end
  object dsCad: TDataSource
    DataSet = SimpleDataSet1
    Left = 528
    Top = 104
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from cad_volunt'
      'order by nome')
    SQLConnection = dmVolunt.SQLConnDB
    Left = 616
    Top = 160
  end
  object SimpleDataSet1: TSimpleDataSet
    Aggregates = <>
    Connection = dmVolunt.SQLConnDB
    DataSet.CommandText = 'select * from cad_volunt'
    DataSet.DataSource = dsCad
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 704
    Top = 96
  end
end
