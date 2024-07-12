unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    lbl7: TLabel;
    lbl8: TLabel;
    dbgrd1: TDBGrid;
    lbl9: TLabel;
    edt6: TEdit;
    cbb1: TComboBox;
    Button1: TButton;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Unit2;

{$R *.dfm}

procedure TForm1.btn2Click(Sender: TObject);
begin
if edt1.Text = '' then
  begin
    ShowMessage('Nik Tidak Boleh Kosong!');
  end else
  if DataModule2.Zkustomer.Locate('nik', edt1.Text, []) then
  begin
    ShowMessage('Nik ' + edt1.Text + ' Sudah Ada Didalam Sistem');
  end else
  begin
    // Simpan
    with DataModule2.Zkustomer do
    begin
      SQL.Clear;
      SQL.Add('insert into kustomer (nik, nama, telp, email, alamat, member) values(:nik, :nama, :telp, :email, :alamat, :member)');
      ParamByName('nik').AsString := edt1.Text;
      ParamByName('nama').AsString := edt2.Text;
      ParamByName('telp').AsString := edt3.Text;
      ParamByName('email').AsString := edt4.Text;
      ParamByName('alamat').AsString := edt5.Text;
      ParamByName('member').AsString := cbb1.Text; // Assuming cbMember is a ComboBox
      ExecSQL;
      SQL.Clear;
      SQL.Add('select * from kustomer');
      Open;
    end;
    ShowMessage('Data Berhasil Disimpan!');

    // Nonaktifkan kembali komponen input dan tombol SIMPAN setelah data disimpan
    edt1.Enabled := False;
    edt2.Enabled := False;
    edt3.Enabled := False;
    edt4.Enabled := False;
    edt5.Enabled := False;
    cbb1.Enabled := False;
    btn2.Enabled := False;
    btn3.Enabled := False;
    btn4.Enabled := False;
    btn5.Enabled := False;
  end;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
// Nonaktifkan komponen input dan tombol SIMPAN pada awal form diinisialisasi
  edt1.Enabled := False;
  edt2.Enabled := False;
  edt3.Enabled := False;
  edt4.Enabled := False;
  edt5.Enabled := False;
  cbb1.Enabled := False;
  btn2.Enabled := False;
  btn3.Enabled := False;
  btn4.Enabled := False;
  btn5.Enabled := False;

  // Isi ComboBox dengan opsi 'yes' dan 'no'
  cbb1.Items.Clear;
  cbb1.Items.Add('yes');
  cbb1.Items.Add('no');
  cbb1.ItemIndex := -1; // Pilih default 'yes'

  // Tambahkan event handler untuk ComboBox cbMember
  cbb1.OnChange := cbb1Change;
end;


procedure TForm1.cbb1Change(Sender: TObject);
begin
 if cbb1.Text = 'yes' then
    lbl8.Caption := 'DISKON : 10%'
  else if cbb1.Text = 'no' then
    lbl8.Caption := 'DISKON : 5%';
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
if edt1.Text = '' then
  begin
    ShowMessage('Nik Tidak Boleh Kosong!');
  end
  else if not DataModule2.Zkustomer.Locate('nik', edt1.Text, []) then
  begin
    ShowMessage('Nik ' + edt1.Text + ' Tidak Ditemukan Dalam Sistem');
  end
  else
  begin
    // Ubah
    with DataModule2.Zkustomer do
    begin
      SQL.Clear;
      SQL.Add('update kustomer set nama = :nama, telp = :telp, email = :email, alamat = :alamat, member = :member  where nik = :nik');
      ParamByName('nik').AsString := edt1.Text;
      ParamByName('nama').AsString := edt2.Text;
      ParamByName('telp').AsString := edt3.Text;
      ParamByName('email').AsString := edt4.Text;
      ParamByName('alamat').AsString := edt5.Text;
      ParamByName('member').AsString := cbb1.Text; // Assuming cbMember is a ComboBox
      ExecSQL;
      SQL.Clear;
      SQL.Add('select * from kustomer');
      Open;
    end;
    ShowMessage('Data Berhasil Disimpan!');
  end;
end;

procedure TForm1.dbgrd1CellClick(Column: TColumn);
begin
  edt1.Text := DataModule2.Zkustomer.FieldByName('nik').AsString;
  edt2.Text := DataModule2.Zkustomer.FieldByName('nama').AsString;
  edt3.Text := DataModule2.Zkustomer.FieldByName('telp').AsString;
  edt4.Text := DataModule2.Zkustomer.FieldByName('email').AsString;
  edt5.Text := DataModule2.Zkustomer.FieldByName('alamat').AsString;
  cbb1.Text := DataModule2.Zkustomer.FieldByName('member').AsString;

  // Update LabelDiskon berdasarkan nilai cbMember yang baru
  cbb1Change(nil); // Panggil cbMemberChange untuk mengupdate LabelDiskon

  edt1.Enabled := True;
  edt2.Enabled := True;
  edt3.Enabled := True;
  edt4.Enabled := True;
  edt5.Enabled := True;
  cbb1.Enabled := True;

  btn2.Enabled := False;
  btn3.Enabled := True;
  btn4.Enabled := True;
  btn5.Enabled := True;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
if edt1.Text = '' then
  begin
    ShowMessage('Nik Tidak Boleh Kosong!');
  end
  else if not DataModule2.Zkustomer.Locate('nik', edt1.Text, []) then
  begin
    ShowMessage('Nik ' + edt1.Text + ' Tidak Ditemukan Dalam Sistem');
  end
  else
  begin
    // Delete data
    with DataModule2.Zkustomer do
    begin
      SQL.Clear;
      SQL.Add('delete from kustomer where nik = :nik');
      ParamByName('nik').AsString := edt1.Text;
      ExecSQL;
      SQL.Clear;
      SQL.Add('select * from kustomer');
      Open;
    end;
    ShowMessage('Data Berhasil Dihapus!');

    // Kosongkan semua field input
    edt1.Text := '';
    edt2.Text := '';
    edt3.Text := '';
    edt4.Text := '';
    edt5.Text := '';
    cbb1.ItemIndex := -1;

    // Nonaktifkan komponen input dan tombol yang tidak diperlukan
    edt1.Enabled := False;
    edt2.Enabled := False;
    edt3.Enabled := False;
    edt4.Enabled := False;
    edt5.Enabled := False;
    cbb1.Enabled := False;
    btn2.Enabled := False;
    btn3.Enabled := False;
    btn4.Enabled := False;
    btn5.Enabled := False;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
DataModule2.frxReport1.ShowReport();
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
  edt1.Text := '';
  edt2.Text := '';
  edt3.Text := '';
  edt4.Text := '';
  edt5.Text := '';
  cbb1.Text := '';
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
  edt1.Text := '';
  edt2.Text := '';
  edt3.Text := '';
  edt4.Text := '';
  edt5.Text := '';
  cbb1.Text := '';
end;

end.
