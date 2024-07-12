object Form1: TForm1
  Left = 651
  Top = 185
  Width = 552
  Height = 502
  Caption = 'fiture_member'
  Color = clMedGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 40
    Top = 32
    Width = 17
    Height = 13
    Caption = 'NIK'
  end
  object lbl2: TLabel
    Left = 40
    Top = 64
    Width = 29
    Height = 13
    Caption = 'NAMA'
  end
  object lbl3: TLabel
    Left = 40
    Top = 96
    Width = 23
    Height = 13
    Caption = 'TELP'
  end
  object lbl4: TLabel
    Left = 40
    Top = 128
    Width = 30
    Height = 13
    Caption = 'EMAIL'
  end
  object lbl5: TLabel
    Left = 40
    Top = 160
    Width = 40
    Height = 13
    Caption = 'ALAMAT'
  end
  object lbl6: TLabel
    Left = 40
    Top = 192
    Width = 41
    Height = 13
    Caption = 'MEMBER'
  end
  object lbl7: TLabel
    Left = 248
    Top = 192
    Width = 48
    Height = 13
    Caption = 'DISKON  :'
  end
  object lbl8: TLabel
    Left = 304
    Top = 192
    Width = 16
    Height = 13
    Caption = 'lbl8'
  end
  object lbl9: TLabel
    Left = 40
    Top = 408
    Width = 79
    Height = 13
    Caption = 'MASUKAN NAME'
  end
  object edt1: TEdit
    Left = 128
    Top = 32
    Width = 337
    Height = 21
    TabOrder = 0
  end
  object edt2: TEdit
    Left = 128
    Top = 64
    Width = 337
    Height = 21
    TabOrder = 1
  end
  object edt3: TEdit
    Left = 128
    Top = 96
    Width = 337
    Height = 21
    TabOrder = 2
  end
  object edt4: TEdit
    Left = 128
    Top = 128
    Width = 337
    Height = 21
    TabOrder = 3
  end
  object edt5: TEdit
    Left = 128
    Top = 160
    Width = 337
    Height = 21
    TabOrder = 4
  end
  object btn1: TButton
    Left = 40
    Top = 232
    Width = 75
    Height = 25
    Caption = 'BARU'
    TabOrder = 5
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 128
    Top = 232
    Width = 75
    Height = 25
    Caption = 'SIMPAN'
    TabOrder = 6
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 216
    Top = 232
    Width = 75
    Height = 25
    Caption = 'EDIT'
    TabOrder = 7
    OnClick = btn3Click
  end
  object btn4: TButton
    Left = 304
    Top = 232
    Width = 75
    Height = 25
    Caption = 'HAPUS'
    TabOrder = 8
    OnClick = btn4Click
  end
  object btn5: TButton
    Left = 392
    Top = 232
    Width = 75
    Height = 25
    Caption = 'BATAL'
    TabOrder = 9
    OnClick = btn5Click
  end
  object dbgrd1: TDBGrid
    Left = 40
    Top = 264
    Width = 425
    Height = 120
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbgrd1CellClick
  end
  object edt6: TEdit
    Left = 128
    Top = 408
    Width = 241
    Height = 21
    TabOrder = 11
    Text = 'edt6'
  end
  object cbb1: TComboBox
    Left = 128
    Top = 192
    Width = 97
    Height = 21
    ItemHeight = 13
    TabOrder = 12
    OnChange = cbb1Change
  end
  object Button1: TButton
    Left = 384
    Top = 408
    Width = 75
    Height = 25
    Caption = 'CETAK'
    TabOrder = 13
    OnClick = Button1Click
  end
end
