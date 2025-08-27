object frmMain: TfrmMain
  Left = 328
  Top = 356
  BorderStyle = bsToolWindow
  Caption = 'Resource Meter'
  ClientHeight = 140
  ClientWidth = 229
  Color = clBtnFace
  Font.Charset = EASTEUROPE_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lGDI: TLabel
    Left = 13
    Top = 50
    Width = 18
    Height = 13
    Caption = 'GDI'
  end
  object lSystem: TLabel
    Left = 13
    Top = 11
    Width = 35
    Height = 13
    Caption = 'System'
  end
  object lUser: TLabel
    Left = 13
    Top = 89
    Width = 22
    Height = 13
    Caption = 'User'
  end
  object pbGDI: TProgressBar
    Left = 13
    Top = 69
    Width = 200
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 0
  end
  object pbSystem: TProgressBar
    Left = 14
    Top = 30
    Width = 200
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 1
  end
  object pbUser: TProgressBar
    Left = 13
    Top = 108
    Width = 200
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 2
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 188
    Top = 32
  end
end
