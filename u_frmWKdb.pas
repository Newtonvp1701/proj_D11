unit u_frmWKdb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Mask, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.DBLookup, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, System.ImageList, Vcl.ImgList;


type TDBGridPadrao = class(TDBgrid);

type
  TfrmWKdb = class(TForm)
    dbgPedProd: TDBGrid;
    dsCliente: TDataSource;
    qryCliente: TFDQuery;
    dbcProduto: TDBLookupComboBox;
    lblCliente: TLabel;
    lblProduto: TLabel;
    qryProduto: TFDQuery;
    dsProduto: TDataSource;
    edtQtde: TLabeledEdit;
    dsPedProd: TDataSource;
    qrypedProd: TFDQuery;
    edtVlrUnitario: TLabeledEdit;
    edtVlrTotal: TLabeledEdit;
    dsPedDG: TDataSource;
    qryPedDG: TFDQuery;
    dbcCliente: TDBLookupComboBox;
    btnInserir: TButton;
    dtPedido: TDateTimePicker;
    lblDataPedido: TLabel;
    dsGrid: TDataSource;
    qryGrid: TFDQuery;
    qryGridid: TFDAutoIncField;
    qryGridnum_pedido: TIntegerField;
    qryGridcod_prod: TIntegerField;
    qryGriddescricao: TStringField;
    qryGridqtde: TSingleField;
    qryGridvlr_unitario: TSingleField;
    qryGridvlr_total: TSingleField;
    StatusBar1: TStatusBar;
    lblTotalPedido: TLabeledEdit;
    Label1: TLabel;
    edtvlrTotPed: TLabeledEdit;
    btnGravarPedido: TButton;
    ImageList1: TImageList;
    cbbPedido: TComboBox;
    edtCodPedido: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure dbcProdutoClick(Sender: TObject);
    procedure edtQtdeEnter(Sender: TObject);
    procedure edtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure btnInserirClick(Sender: TObject);
    procedure dbgPedProdEnter(Sender: TObject);
    procedure dbgPedProdKeyPress(Sender: TObject; var Key: Char);
    procedure dbgPedProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbbPedidoChange(Sender: TObject);
    procedure btnGravarPedidoClick(Sender: TObject);
    procedure AtualizarPedidos;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWKdb: TfrmWKdb;

implementation

{$R *.dfm}

uses dm;


procedure TfrmWKdb.btnGravarPedidoClick(Sender: TObject);
var
_qryAddPedido, _qryTotPed: TFDQuery;
begin
//  ShowMessage('codigo do cliente --> '+IntToStr(cbbCliente.Items.IndexOf(cbbCliente.Text)));
//  ShowMessage('codigo do cliente --> '+ IntToStr(dbcCliente.KeyValue ));

//  exit;

  _qryTotPed := TFDQuery.Create(nil);
  with _qryTotPed do
  begin
    sql.Clear;
    Connection := dmVolunt.fdconnMYSql;
    sql.Add('select sum(vlr_total) TotPed from ped_prod  ');
    sql.Add('where num_pedido =:pPedido ');
    ParamByName('pPedido').AsInteger := StrToInt(edtcodpedido.Text);  ;//StrToInt(cbbPedido.Text);
    Open;
    if not IsEmpty then
    begin
        lblTotalPedido.Text := FloatToStrF(FieldByName('TotPed').AsFloat, ffFixed, 5, 2);
        lblTotalPedido.Alignment := taCenter;
    end;
  end;

  _qryAddPedido := TFDQuery.Create(nil);
  with _qryaddPedido do
  begin
    close;
    sql.Clear;
    Connection := dmVolunt.fdconnMYSql;
    sql.Add(' update ped_dados_gerais ');
    sql.Add(' set dt_emissao =:pDtEmissao, cod_cliente =:pCod_Cliente, vlr_total =:pVlr_Total  ');
    sql.add(' where num_pedido =:pPedido ');
    ParamByName('pPedido').AsInteger :=  StrToInt(edtCodPedido.Text);//StrToInt(cbbPedido.Text);
    ParamByName('pDtEmissao').AsDateTime := dtPedido.DateTime;
    ParamByName('pCod_Cliente').AsInteger := StrToInt(dbcCliente.KeyValue); //cbbCliente.Items.IndexOf(cbbCliente.Text);
    ParamByName('pVlr_Total').AsFloat := _qryTotPed.FieldByName('TotPed').AsFloat;
    ExecSQL;
  end;

  ShowMessage('Pedido gravado com sucesso!!');

  AtualizarPedidos;

end;

procedure TfrmWKdb.btnInserirClick(Sender: TObject);
var
  _qryInserir, _qryTotPed: TFDQuery;
  _codprod : integer;
begin

  _codprod := dbcproduto.KeyValue;

  _qryInserir := TFDQuery.Create(nil);
  with _qryInserir do
  begin
    Close;
    sql.Clear;
    Connection := dmVolunt.fdconnMYSql;
    sql.add('insert into ped_prod ');
    sql.Add('  (num_pedido, cod_prod, qtde, vlr_unitario, vlr_total) ');
    sql.Add('  values ');
    sql.Add(' ( :num_pedido, :cod_prod, :qtde, :vlr_unitario, :vlr_total ) ');
    ParamByName('num_pedido').AsInteger := strtoint(edtCodPedido.Text);
    ParamByName('cod_prod').Value := dbcProduto.KeyValue;
    ParamByName('vlr_unitario').AsFloat := StrToFloat(edtVlrUnitario.Text);
    ParamByName('qtde').AsFloat := StrToFloat(edtqtde.Text);
    ParamByName('vlr_total').AsFloat := StrToFloat(edtVlrTotal.Text);
    ExecSQL;
    dbgPedProd.Refresh;
  end;

  with qrypedProd do
  begin
    close;
    sql.Clear;
    sql.Add('select num_pedido ,cod_prod, qtde, vlr_unitario, vlr_total ');
    sql.Add(' from ped_prod ');
    sql.Add(' where num_pedido =:pPedido');
    ParamByName('pPedido').AsInteger := strtoint(edtCodPedido.Text);
    open;
  end;

  with qrypedDG do
  begin
    sql.Clear;
    sql.Add(' select num_pedido, dt_emissao, cod_cliente, vlr_total ');
    sql.Add(' from ped_dados_gerais ');
    Open;
  end;

  with qryGrid do
  begin
    sql.Clear;
    sql.Add('select pp.id, pp.num_pedido ,pp.cod_prod, pr.descricao  ,pp.qtde, pp.vlr_unitario, pp.vlr_total ');
    sql.Add('from ped_prod pp ');
    sql.Add('inner join produto pr on pr.codprod = pp.cod_prod ');
    sql.Add(' where pp.num_pedido =:pPedido');
    ParamByName('pPedido').AsInteger := strtoint(edtCodPedido.Text);
    Open;
  end;

  TDBGridPadrao(dbgPedProd).DefaultRowHeight := 30;

  dbgPedProd.ReadOnly := True;
  dbgPedProd.Columns[0].Width := 100;
  dbgPedProd.Columns[1].Width := 100;
  dbgPedProd.Columns[2].Width := 100;
  dbgPedProd.Columns[3].Width := 200;
  dbgPedProd.Columns[4].Width := 50;
  dbgPedProd.Columns[5].Width := 80;
  dbgPedProd.Columns[6].Width := 80;

 if  (Application.MessageBox('Pedido atualizado !!', PChar(Application.Title), MB_YESNOCANCEL
      + MB_ICONINFORMATION) = ID_YES) then
  begin
    dbgPedProd.ReadOnly := False;
    dbgPedProd.SetFocus;
    edtVlrUnitario.Clear;
    edtQtde.Clear;
    edtVlrTotal.Clear;
  end;

  _qryTotPed := TFDQuery.Create(nil);
  with _qryTotPed do
  begin
    sql.Clear;
    Connection := dmVolunt.fdconnMYSql;
    sql.Add('select sum(vlr_total) TotPed from ped_prod  ');
    sql.Add('where num_pedido =:pPedido ');
    ParamByName('pPedido').AsInteger := StrToInt(edtCodPedido.Text); //StrToInt(cbbPedido.Text);
    Open;
    if not IsEmpty then
    begin
        lblTotalPedido.Text := FloatToStrF(FieldByName('TotPed').AsFloat, ffFixed, 5, 2);
        lblTotalPedido.Alignment := taCenter;
        edtvlrTotPed.Text := FloatToStrF(FieldByName('TotPed').AsFloat, ffFixed, 5, 2);
    end;
  end;
end;

procedure TfrmWKdb.cbbPedidoChange(Sender: TObject);
var
  _qrya, _qryNrPed, _qryTotPed : TFDQuery;
begin
  _qrya := TFDQuery.Create(nil);
  _qryNrPed := TFDQuery.Create(nil);
  _qryTotPed := TFDQuery.Create(nil);
  with qryPedDG do
  begin
    sql.Clear;
    sql.Add(' select  dg.num_pedido, dg.dt_emissao, dg.cod_cliente, cp.nome, dg.vlr_total ');
    sql.Add(' from ped_dados_gerais dg  ');
    sql.Add(' inner join cliente cp on cp.codigo = dg.cod_cliente ');
    sql.Add(' where dg.num_pedido =:pPedido ');
    if cbbPedido.Text <> 'Novo' then
    begin
      ParamByName('pPedido').AsInteger := StrToInt(cbbPedido.Text);
      Open;
      edtCodPedido.Text := cbbPedido.Text;
    end;
    if cbbPedido.Text = 'Novo' then
    begin
      with _qryNrPed do
      begin
        sql.Clear;
        Connection := dmVolunt.fdconnMYSql;
        sql.Add(' select max(num_pedido) + 1  as num_novo ');
        sql.add(' from ped_dados_gerais ');
        Open;
        if not IsEmpty then
        begin
          with _qrya do
          begin
            sql.Clear;
            Connection := dmVolunt.fdconnMYSql;
            sql.add('insert into ped_dados_gerais (num_pedido) ');
            sql.Add(' values ('' '+ inttostr(_qryNrPed.FieldByName('num_novo').AsInteger) +' '' ) ');
            ExecSQL;
            edtCodPedido.Text := inttostr(_qryNrPed.FieldByName('num_novo').AsInteger);
          end;
        end;
        with qrypedDG do
        begin
          sql.Clear;
          sql.Add(' select num_pedido, dt_emissao, cod_cliente, vlr_total ');
          sql.Add(' from ped_dados_gerais ');
          Open;
        end;

        qryGrid.Active := False;

      end;

    end;
    if (not IsEmpty) and (cbbPedido.Text <> 'Novo' )then
    begin
      dbcCliente.KeyValue := qryPedDG.FieldByName('cod_cliente').Value;
      dtPedido.DateTime   := qryPedDG.FieldByName('dt_emissao').Value;
      edtvlrTotPed.Text   := FloatToStrf(qryPedDG.FieldByName('vlr_total').AsFloat, fffixed, 5, 2);

      //preencher o dbgrid dbgpedprod

      with qryGrid do
      begin
        sql.Clear;
        sql.Add('select pp.id, pp.num_pedido ,pp.cod_prod, pr.descricao  ,pp.qtde, pp.vlr_unitario, pp.vlr_total ');
        sql.Add('from ped_prod pp ');
        sql.Add('inner join produto pr on pr.codprod = pp.cod_prod ');
        sql.Add('where pp.num_pedido =:pPedido');
        ParamByName('pPedido').AsInteger := StrToInt(cbbPedido.Text);
        Open;
      end;
      dbgPedProd.Refresh;

      with _qryTotPed do
      begin
        sql.Clear;
        Connection := dmVolunt.fdconnMYSql;
        sql.Add('select sum(vlr_total) TotPed from ped_prod  ');
        sql.Add('where num_pedido =:pPedido ');
        ParamByName('pPedido').AsInteger := StrToInt(cbbPedido.Text);
        Open;
        if not IsEmpty then
        begin
            lblTotalPedido.Text := FloatToStrF(FieldByName('TotPed').AsFloat, ffFixed, 5, 2);
            lblTotalPedido.Alignment := taCenter;
        end;

      end;


    end;

  end;
end;


procedure TfrmWKdb.dbcProdutoClick(Sender: TObject);
begin
  edtVlrUnitario.Text := FloatToStrF(qryProduto.FieldByName('preco_venda').AsFloat, ffFixed, 5 ,2);
end;

procedure TfrmWKdb.dbgPedProdEnter(Sender: TObject);
begin
  Application.MessageBox('alterar registro ? ', PChar(Application.title), MB_YESNOCANCEL);
end;

procedure TfrmWKdb.dbgPedProdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var _qryDel, _qryTotPed: TFDQuery;
begin
  if Key = vk_delete then
  begin
    if (Application.MessageBox(PWideChar('quer excluir o registro ? ' + IntToStr(dbgPedProd.Fields[0].Value)) , pchar(application.title), MB_YESNOCANCEL
     + MB_ICONINFORMATION) = ID_YES) then
     begin
//      ShowMessage('quer excluir o registro ?  ' + IntToStr(dbgPedProd.Fields[0].Value));
      _qryDel := TFDQuery.Create(Self);
      try
        with _qryDel do
        begin
          Close;
          Connection := dmVolunt.fdconnMYSql;
          sql.Clear;
          sql.Add('delete from ped_prod where id=' + IntToStr(dbgPedProd.Fields[0].Value));
          ExecSQL;
        end;
      finally
        FreeAndNil(_qryDel);
      end;

      // recalcular o total do pedido

      _qrytotped := TFDQuery.Create(nil);
      with _qryTotPed do
      begin
        try
          Close;
          sql.Clear;
          Connection := dmVolunt.fdconnMYSql;
          sql.Add('select sum(vlr_total) TotPed from ped_prod  ');
          sql.Add('where num_pedido =:pPedido ');
          ParamByName('pPedido').AsInteger := StrToInt(cbbPedido.Text);
          Open;
          if not IsEmpty then
          begin
              lblTotalPedido.Text := FloatToStrF(FieldByName('TotPed').AsFloat, ffFixed, 5, 2);
              lblTotalPedido.Alignment := taCenter;
          end;
        finally
          freeandnil(_qryTotPed);
        end;

      end;


      with qryGrid do
      begin
        Close;
        sql.Clear;
        sql.Add('select pp.id, pp.num_pedido ,pp.cod_prod, pr.descricao  ,pp.qtde, pp.vlr_unitario, pp.vlr_total ');
        sql.Add('from ped_prod pp ');
        sql.Add('inner join produto pr on pr.codprod = pp.cod_prod ');
        sql.Add('where pp.num_pedido =:pPedido');
        ParamByName('pPedido').AsInteger := StrToInt(cbbPedido.Text);
        Open;
      end;



     end;

  end;

end;

procedure TfrmWKdb.dbgPedProdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    dbcProduto.KeyValue := dbgPedProd.Fields[2].Value;
    edtVlrUnitario.Text := FloatToStrF( dbgPedProd.Fields[4].Value, ffFixed, 4, 2);
    edtQtde.Text        := FloatToStrF( dbgPedProd.Fields[5].Value, ffFixed, 4, 0);
    edtVlrTotal.Text    := FloatToStrF( dbgPedProd.Fields[6].Value, ffFixed, 4, 2);
    edtQtde.SetFocus;

    btnInserir.Caption := 'Confirmar';

  end;

  if (Key = #46) then
  begin
    ShowMessage('quer excluir o registro ? ');
  end;


end;

procedure TfrmWKdb.edtQtdeEnter(Sender: TObject);
begin
  if edtQtde.Text <> '' then
    edtVlrTotal.Text := FloatToStr(strtoint(edtQtde.Text) * strtofloat(edtVlrUnitario.Text))
  else edtQtde.SetFocus;
end;

procedure TfrmWKdb.edtQtdeKeyPress(Sender: TObject; var Key: Char);
begin
  if edtQtde.Text <> '' then
    edtVlrTotal.Text := FloatToStr(strtoint(edtQtde.Text) * strtofloat(edtVlrUnitario.Text))
  else edtQtde.SetFocus;
end;

procedure TfrmWKdb.FormCreate(Sender: TObject);
begin
  with qryCliente do
  begin
    Close;
    sql.Clear;
    sql.Add('select codigo, nome ');
    sql.Add('from cliente ');
    sql.Add('order by nome ');
    Open;
    First;
//    while not qryCliente.Eof  do
//    begin
//      cbbCliente.Items.Add(qrycliente.FieldByName('nome').AsString);
//      qrycliente.Next;
//    end;
//    cbbCliente.ItemIndex := 0;
  end;

  with qryProduto do
  begin
    close;
    sql.Clear;
    sql.Add('select codprod, descricao, preco_venda');
    sql.Add(' from produto ');
    Open;
    First;
  end;

  AtualizarPedidos;

//  with qrypedDG do
//  begin
//    sql.Clear;
//    sql.Add(' select num_pedido, dt_emissao, cod_cliente, vlr_total ');
//    sql.Add(' from ped_dados_gerais ');
//    Open;
//  end;
//
//  cbbPedido.Items.Add('Novo');
//  while not qryPedDG.Eof  do
//  begin
//    cbbPedido.Items.Add(IntToStr(qryPedDG.FieldByName('num_pedido').AsInteger));
//    qryPedDG.Next;
//  end;
//  cbbPedido.ItemIndex := 0;

  with qrypedProd do
  begin
    close;
    sql.Clear;
    sql.Add('select num_pedido ,cod_prod, qtde, vlr_unitario, vlr_total ');
    sql.Add(' from ped_prod ');
    open;
  end;


end;


procedure TfrmWKdb.AtualizarPedidos;
begin
  with qrypedDG do
  begin
    sql.Clear;
    sql.Add(' select num_pedido, dt_emissao, cod_cliente, vlr_total ');
    sql.Add(' from ped_dados_gerais ');
    Open;
  end;

  cbbPedido.Clear;
  cbbPedido.Items.Add('Novo');
  while not qryPedDG.Eof  do
  begin
    cbbPedido.Items.Add(IntToStr(qryPedDG.FieldByName('num_pedido').AsInteger));
    qryPedDG.Next;
  end;
  cbbPedido.ItemIndex := 0;

  qryGrid.Active := False;

end;


end.
