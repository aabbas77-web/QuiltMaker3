object FormMain: TFormMain
  Left = 190
  Top = 105
  Width = 544
  Height = 375
  Caption = 'Protect File'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 4
    Width = 47
    Height = 13
    Caption = 'File Name'
  end
  object SpeedButton1: TSpeedButton
    Left = 508
    Top = 20
    Width = 23
    Height = 22
    Caption = '...'
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 4
    Top = 48
    Width = 100
    Height = 22
    Caption = 'Write Check Sum'
    OnClick = SpeedButton2Click
  end
  object EditFileName: TEdit
    Left = 4
    Top = 20
    Width = 497
    Height = 21
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 0
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'exe'
    Filter = 'Executables (*.exe)|*.exe'
    Left = 472
    Top = 12
  end
end
