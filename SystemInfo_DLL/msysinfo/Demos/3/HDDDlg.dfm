object dlgHDD: TdlgHDD
  Left = 324
  Top = 429
  BorderStyle = bsDialog
  Caption = 'IDE Devices'
  ClientHeight = 206
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 472
    Height = 169
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BorderWidth = 10
    Caption = ' '
    TabOrder = 0
    object List: TListView
      Left = 11
      Top = 11
      Width = 450
      Height = 147
      Align = alClient
      BorderStyle = bsNone
      Columns = <
        item
          Caption = 'Device'
          Width = 100
        end
        item
          Caption = 'Model'
          Width = 150
        end
        item
          Caption = 'Serial Number'
          Width = 125
        end
        item
          Caption = 'Revision'
          Width = 75
        end
        item
          Alignment = taRightJustify
          Caption = 'Cyls'
        end
        item
          Alignment = taRightJustify
          Caption = 'Heads'
        end
        item
          Alignment = taRightJustify
          Caption = 'Sectors Per Track'
        end
        item
          Alignment = taRightJustify
          Caption = 'Capacity'
          Width = 75
        end>
      ColumnClick = False
      GridLines = True
      HotTrackStyles = [htHandPoint, htUnderlineHot]
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 169
    Width = 472
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Panel8: TPanel
      Left = 382
      Top = 0
      Width = 90
      Height = 37
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object bOK: TButton
        Left = 6
        Top = 2
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Cancel = True
        Caption = 'OK'
        Default = True
        ModalResult = 1
        TabOrder = 0
        OnClick = bOKClick
      end
    end
  end
end
