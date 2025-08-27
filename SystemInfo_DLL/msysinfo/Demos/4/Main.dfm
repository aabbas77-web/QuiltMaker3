object Form2: TForm2
  Left = 323
  Top = 354
  Width = 584
  Height = 456
  Caption = 'Memory Viewer'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    576
    429)
  PixelsPerInch = 96
  TextHeight = 13
  object LabelAddress: TLabel
    Left = 12
    Top = 16
    Width = 41
    Height = 13
    Caption = 'Address:'
  end
  object LabelLength: TLabel
    Left = 168
    Top = 16
    Width = 36
    Height = 13
    Caption = 'Length:'
  end
  object bShow: TButton
    Left = 328
    Top = 10
    Width = 197
    Height = 24
    Caption = 'Show Physical Memory'
    TabOrder = 3
    OnClick = bShowClick
  end
  object Memo: TMemo
    Left = 10
    Top = 45
    Width = 558
    Height = 371
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
    WordWrap = False
  end
  object EditAddress: TEdit
    Left = 64
    Top = 12
    Width = 85
    Height = 21
    TabOrder = 1
    Text = '$F0800'
  end
  object EditLength: TEdit
    Left = 216
    Top = 12
    Width = 85
    Height = 21
    TabOrder = 2
    Text = '64'
  end
end
