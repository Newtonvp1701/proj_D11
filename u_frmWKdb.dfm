object frmWKdb: TfrmWKdb
  Left = 0
  Top = 0
  Caption = 'WK - teste '
  ClientHeight = 700
  ClientWidth = 1275
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OnCreate = FormCreate
  TextHeight = 15
  object lblCliente: TLabel
    Left = 8
    Top = 99
    Width = 37
    Height = 15
    Caption = 'Cliente'
  end
  object lblProduto: TLabel
    Left = 8
    Top = 174
    Width = 43
    Height = 15
    Caption = 'Produto'
  end
  object lblDataPedido: TLabel
    Left = 320
    Top = 99
    Width = 27
    Height = 15
    Caption = 'Data:'
  end
  object Label1: TLabel
    Left = 8
    Top = 35
    Width = 137
    Height = 15
    Caption = 'Selecione o nr. do Pedido:'
  end
  object dbgPedProd: TDBGrid
    Left = 8
    Top = 272
    Width = 889
    Height = 313
    DataSource = dsGrid
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnKeyDown = dbgPedProdKeyDown
    OnKeyPress = dbgPedProdKeyPress
  end
  object dbcProduto: TDBLookupComboBox
    Left = 8
    Top = 195
    Width = 250
    Height = 23
    DataField = 'cod_prod'
    DataSource = dsPedProd
    KeyField = 'codprod'
    ListField = 'descricao'
    ListSource = dsProduto
    TabOrder = 1
    OnClick = dbcProdutoClick
  end
  object edtQtde: TLabeledEdit
    Left = 464
    Top = 195
    Width = 121
    Height = 23
    EditLabel.Width = 43
    EditLabel.Height = 15
    EditLabel.Caption = 'edtQtde'
    TabOrder = 2
    Text = ''
    OnEnter = edtQtdeEnter
    OnKeyPress = edtQtdeKeyPress
  end
  object edtVlrUnitario: TLabeledEdit
    Left = 320
    Top = 195
    Width = 121
    Height = 23
    EditLabel.Width = 62
    EditLabel.Height = 15
    EditLabel.Caption = 'Vlr. Unit'#225'rio'
    TabOrder = 3
    Text = ''
  end
  object edtVlrTotal: TLabeledEdit
    Left = 616
    Top = 195
    Width = 121
    Height = 23
    EditLabel.Width = 45
    EditLabel.Height = 15
    EditLabel.Caption = 'Vlr. Total'
    TabOrder = 4
    Text = ''
  end
  object dbcCliente: TDBLookupComboBox
    Left = 8
    Top = 120
    Width = 250
    Height = 23
    DataField = 'cod_cliente'
    DataSource = dsPedDG
    KeyField = 'codigo'
    ListField = 'nome'
    ListSource = dsCliente
    TabOrder = 5
  end
  object btnInserir: TButton
    Left = 768
    Top = 194
    Width = 129
    Height = 25
    Caption = 'Inserir'
    ImageIndex = 1
    Images = ImageList1
    TabOrder = 6
    OnClick = btnInserirClick
  end
  object dtPedido: TDateTimePicker
    Left = 320
    Top = 120
    Width = 186
    Height = 23
    Date = 45550.000000000000000000
    Time = 0.682181134259735700
    TabOrder = 7
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 681
    Width = 1275
    Height = 19
    Panels = <>
    ExplicitTop = 680
    ExplicitWidth = 1271
  end
  object lblTotalPedido: TLabeledEdit
    Left = 690
    Top = 616
    Width = 207
    Height = 23
    Alignment = taCenter
    EditLabel.Width = 82
    EditLabel.Height = 23
    EditLabel.Caption = 'Total Pedido:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -13
    EditLabel.Font.Name = 'Segoe UI'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    LabelPosition = lpLeft
    LabelSpacing = 5
    TabOrder = 9
    Text = ''
  end
  object edtvlrTotPed: TLabeledEdit
    Left = 616
    Top = 120
    Width = 121
    Height = 23
    EditLabel.Width = 104
    EditLabel.Height = 15
    EditLabel.Caption = 'vlr. Total do Pedido:'
    TabOrder = 10
    Text = ''
  end
  object btnGravarPedido: TButton
    Left = 768
    Top = 119
    Width = 129
    Height = 25
    Caption = 'Gravar Pedido'
    ImageIndex = 2
    Images = ImageList1
    TabOrder = 11
    OnClick = btnGravarPedidoClick
  end
  object cbbPedido: TComboBox
    Left = 8
    Top = 56
    Width = 145
    Height = 23
    TabOrder = 12
    Text = 'cbbPedido'
    OnChange = cbbPedidoChange
  end
  object edtCodPedido: TLabeledEdit
    Left = 320
    Top = 56
    Width = 121
    Height = 23
    EditLabel.Width = 99
    EditLabel.Height = 15
    EditLabel.Caption = 'C'#243'digo do Pedido:'
    TabOrder = 13
    Text = ''
  end
  object dsCliente: TDataSource
    DataSet = qryCliente
    Left = 960
    Top = 56
  end
  object qryCliente: TFDQuery
    Connection = dmVolunt.fdconnMYSql
    SQL.Strings = (
      'select codigo, nome '
      'from cliente'
      ' ')
    Left = 960
    Top = 120
  end
  object qryProduto: TFDQuery
    Connection = dmVolunt.fdconnMYSql
    SQL.Strings = (
      'select codprod, descricao, preco_venda '
      'from produto ')
    Left = 1056
    Top = 136
  end
  object dsProduto: TDataSource
    DataSet = qryProduto
    Left = 1048
    Top = 64
  end
  object dsPedProd: TDataSource
    DataSet = qrypedProd
    Left = 1168
    Top = 64
  end
  object qrypedProd: TFDQuery
    Connection = dmVolunt.fdconnMYSql
    SQL.Strings = (
      'select num_pedido ,cod_prod, qtde, vlr_unitario, vlr_total '
      'from ped_prod ')
    Left = 1176
    Top = 136
  end
  object dsPedDG: TDataSource
    DataSet = qryPedDG
    Left = 1160
    Top = 224
  end
  object qryPedDG: TFDQuery
    Connection = dmVolunt.fdconnMYSql
    SQL.Strings = (
      'select num_pedido, dt_emissao, cod_cliente, vlr_total '
      'from ped_dados_gerais')
    Left = 1160
    Top = 288
  end
  object dsGrid: TDataSource
    DataSet = qryGrid
    Left = 1168
    Top = 368
  end
  object qryGrid: TFDQuery
    Connection = dmVolunt.fdconnMYSql
    SQL.Strings = (
      
        'select pp.id, pp.num_pedido ,pp.cod_prod, pr.descricao  ,pp.qtde' +
        ', pp.vlr_unitario, pp.vlr_total '
      'from ped_prod pp'
      'inner join produto pr on pr.codprod = pp.cod_prod  '
      ' ')
    Left = 1168
    Top = 432
    object qryGridid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryGridnum_pedido: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'num_pedido'
      Origin = 'num_pedido'
    end
    object qryGridcod_prod: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_prod'
      Origin = 'cod_prod'
    end
    object qryGriddescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
    object qryGridqtde: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'qtde'
      Origin = 'qtde'
    end
    object qryGridvlr_unitario: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'vlr_unitario'
      Origin = 'vlr_unitario'
    end
    object qryGridvlr_total: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'vlr_total'
      Origin = 'vlr_total'
    end
  end
  object ImageList1: TImageList
    Left = 952
    Top = 256
    Bitmap = {
      494C010103000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A3A3A300A3A3A30000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF1F28
      1C0000000000000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000989898009898980000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FFA4D695009FE5
      B3009FE5B300000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000989898009898980000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000009FE5B3009FE5
      B3009FE5B3009FE5B300000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008585850025252500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000989898009898980000000000000000000000
      000000000000000000000000000000000000000000FF00000000000000000000
      00000000000000000000000000000000000000000000A1E1AC009FE5B3000000
      00009FE5B3009FE5B300D5D5D500000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000888888000000000001010100252525000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000989898009898980000000000000000000000
      0000000000000000000000000000000000000000000080776800938A7A00938A
      7A00938A7A00938A7A00938A7A00938A7A008B8273009FE5B30002040300938A
      7A00A4D695009FE5B30091D1A400000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008181
      8100000000000202020023232300010101002626260000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000989898009898980000000000000000000000
      0000000000000000000000000000000000000000000080776800938A7A000000
      0000000000000000000000000000000000000000000000000000938A7A00938A
      7A00000000009FE5B3009FE5B300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000888888000000
      000002020200A1A1A10000000000333333000101010025252500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000989898009898980000000000000000000000
      0000000000000000000000000000000000000000000080776800ECDADD00F6F6
      F900F6F6F900F6F6F900F6F6F900F6F6F900F6F6F900F6F6F900F6F6F900938A
      7A0000000000000000009FE5B300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094949400000000000202
      0200A4A4A4000000000000000000000000003030300001010100262626000000
      000000000000000000000000000000000000A3A3A30098989800989898009898
      98009898980098989800989898005B5B5B005B5B5B0098989800989898009898
      9800989898009898980098989800A3A3A3000000000080776800ECDADD00F6F6
      F900F6F6F900F6F6F900F6F6F900F6F6F900F6F6F900F6F6F900F6F6F900938A
      7A0000000000000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002C2C2C00A1A1
      A100000000000000000000000000000000000000000033333300010101002525
      250000000000000000000000000000000000A3A3A30098989800989898009898
      98009898980098989800989898005B5B5B005B5B5B0098989800989898009898
      9800989898009898980098989800A3A3A3000000000080776800ECDADD003131
      3200313132003131320031313200313132003131320046464700F6F6F900938A
      7A0000000000000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000303030000101
      0100262626000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000989898009898980000000000000000000000
      0000000000000000000000000000000000000000000080776800ECDADD00F6F6
      F900F6F6F900F6F6F900F6F6F900F6F6F900F6F6F900F6F6F900DCDCDF00938A
      7A0000000000000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003333
      3300010101002525250000000000000000000000000000000000000000000000
      0000000000000000000000000000989898009898980000000000000000000000
      0000000000000000000000000000000000000000000080776800938A7A00938A
      7A00938A7A00938A7A00938A7A00938A7A00938A7A00938A7A00938A7A00938A
      7A0000000000000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000303030000101010091919100000000000000000000000000000000000000
      0000000000000000000000000000989898009898980000000000000000000000
      0000000000000000000000000000000000000000000080776800938A7A00938A
      7A00938A7A00938A7A00938A7A00938A7A00938A7A00938A7A00938A7A00938A
      7A0000000000000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009999990000000000000000000000000000000000000000000000
      0000000000000000000000000000989898009898980000000000000000000000
      0000000000000000000000000000000000000000000080776800938A7A006C65
      59006C6559006C6559006C6559006C65590092897900938A7A00938A7A00938A
      7A0009090900000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000989898009898980000000000000000000000
      0000000000000000000000000000000000000000000080776800938A7A00ECDA
      DD0000000000F6F6F900F6F6F900F6F6F900F6F6F900938A7A00938A7A000000
      0000000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000989898009898980000000000000000000000
      0000000000000000000000000000000000000000000080776800938A7A00ECDA
      DD0080776800F6F6F900F6F6F900F6F6F900F6F6F900938A7A00000000000000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A3A3A300A3A3A30000000000000000000000
      000000000000000000000000000000000000000000FFCDCDCD0000000000ECDA
      DD00F6F6F900F6F6F900F6F6F900F6F6F900F6F6F900000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFE7FFFE70000FFFFFE7FFFC70000
      FFFFFE7FFF830000F9FFFE7F80010000F0FFFE7F00010000E07FFE7F00000000
      C23FFE7F00000000871F000000070000CF8F000000070000FFC7FE7F00070000
      FFE3FE7F00070000FFF1FE7F00070000FFFBFE7F00070000FFFFFE7F000F0000
      FFFFFE7F001F0000FFFFFE7F807F000000000000000000000000000000000000
      000000000000}
  end
end