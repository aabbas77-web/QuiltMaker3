object FormAbout: TFormAbout
  Left = 178
  Top = 118
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 313
  ClientWidth = 202
  Color = clWindow
  Ctl3D = False
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 202
    Height = 313
    Align = alClient
    BevelOuter = bvNone
    Color = 14671839
    TabOrder = 0
    object Bevel2: TBevel
      Left = 4
      Top = 196
      Width = 194
      Height = 9
    end
    object Label2: TLabel
      Left = 5
      Top = 24
      Width = 194
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Quilt Maker V3.0'
    end
    object Label1: TLabel
      Left = 5
      Top = 4
      Width = 194
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'AliSoft'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 5
      Top = 44
      Width = 194
      Height = 13
      Alignment = taCenter
      AutoSize = False
    end
    object Label7: TLabel
      Left = 5
      Top = 64
      Width = 194
      Height = 13
      Alignment = taCenter
      AutoSize = False
    end
    object LabelURL: TLabel
      Left = 5
      Top = 84
      Width = 194
      Height = 13
      Cursor = crHandPoint
      Hint = 'www.AliSoft.4t.com'
      Alignment = taCenter
      AutoSize = False
      Caption = 'www.hodhods.com'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = LabelURLClick
    end
    object LabelEMail: TLabel
      Left = 5
      Top = 123
      Width = 194
      Height = 13
      Cursor = crHandPoint
      Hint = 'mailto: aabbas77@yahoo.com'
      Alignment = taCenter
      AutoSize = False
      Caption = 'E-Mail: aabbas7@gmail.com'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = LabelEMailClick
    end
    object Label6: TLabel
      Left = 5
      Top = 143
      Width = 194
      Height = 13
      Alignment = taCenter
      AutoSize = False
    end
    object Image2: TImage
      Left = 161
      Top = 44
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        055449636F6E0000010001002020100000000000E80200001600000028000000
        2000000040000000010004000000000080020000000000000000000000000000
        0000000000000000000080000080000000808000800000008000800080800000
        80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF0099999999999999999999999999999999966666666666666666666666
        66666669966668868886666666666662F6666669966336666666666666666666
        666668699666666666666666E006666666266F6996666666E0600EF0000E6666
        666666699666666600EFE000000E66666666666996666600F0F000000006F666
        6666666996666000000000000006666666666669966600000000000000046666
        6666666996680000000008800004666666666669966000000000000000006666
        666666699EE000000000000000004EEEEEEEEEE99EE00088F8F0FF00000008EE
        EEEEEEE99EE8000000000000000000EEEEEEEEE99EEEE0FFFFF8EEEEF844008E
        EEEFFFE99EFEE0888838EEEEEEEE800EEEEEFEE99EEEE0011188EEEEEEEEEEEE
        EEEEEEE99EFEEEE999EEEEEEEEEEEEEEEEEEEEE99EEEEEE0FFEEEEEEEEEEFFFF
        FFFFEFE99EEEEEE088EEFFFFFEFFFFFFFFFFFFF99EEEEEEE8EEEEFFFFEEEFFFE
        FFFFEFF99EEEEEEF8EEEEEEEFEFEFFFFFFFEFFF99FFFFFF8FEEEEEEFEEEFEFFF
        FFEFEFE99FE8E88FEEEEEEEEEEEEFFFFFFEEFEE99FFEFEFFEEEEEEEEEEEFFFFF
        FFEEEEE99FFFFFEEEEEEEEEEEFFFFFFFEEEEEEE99EFEEEEEEEEEEEEEFFEEFFFE
        EEEEEEE99EEEEEEEEEEEEEEEEFFFFFFEEEEEEEE99EEFEFFEEEEEEEEEEEEEFFFE
        EEEEEEE99EFFFEEEEEEEEEEEEEEEEFEEEEEEEEE9999999999999999999999999
        9999999900000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000}
    end
    object Image1: TImage
      Left = 9
      Top = 44
      Width = 32
      Height = 32
      AutoSize = True
      Center = True
      Picture.Data = {
        055449636F6E0000010001002020100000000000E80200001600000028000000
        2000000040000000010004000000000080020000000000000000000000000000
        0000000000000000000080000080000000808000800000008000800080800000
        80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF0099999999999999999999999999999999966666666666666666666666
        66666669966668868886666666666662F6666669966336666666666666666666
        666668699666666666666666E006666666266F6996666666E0600EF0000E6666
        666666699666666600EFE000000E66666666666996666600F0F000000006F666
        6666666996666000000000000006666666666669966600000000000000046666
        6666666996680000000008800004666666666669966000000000000000006666
        666666699EE000000000000000004EEEEEEEEEE99EE00088F8F0FF00000008EE
        EEEEEEE99EE8000000000000000000EEEEEEEEE99EEEE0FFFFF8EEEEF844008E
        EEEFFFE99EFEE0888838EEEEEEEE800EEEEEFEE99EEEE0011188EEEEEEEEEEEE
        EEEEEEE99EFEEEE999EEEEEEEEEEEEEEEEEEEEE99EEEEEE0FFEEEEEEEEEEFFFF
        FFFFEFE99EEEEEE088EEFFFFFEFFFFFFFFFFFFF99EEEEEEE8EEEEFFFFEEEFFFE
        FFFFEFF99EEEEEEF8EEEEEEEFEFEFFFFFFFEFFF99FFFFFF8FEEEEEEFEEEFEFFF
        FFEFEFE99FE8E88FEEEEEEEEEEEEFFFFFFEEFEE99FFEFEFFEEEEEEEEEEEFFFFF
        FFEEEEE99FFFFFEEEEEEEEEEEFFFFFFFEEEEEEE99EFEEEEEEEEEEEEEFFEEFFFE
        EEEEEEE99EEEEEEEEEEEEEEEEFFFFFFEEEEEEEE99EEFEFFEEEEEEEEEEEEEFFFE
        EEEEEEE99EFFFEEEEEEEEEEEEEEEEFEEEEEEEEE9999999999999999999999999
        9999999900000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000}
    end
    object Label8: TLabel
      Left = 5
      Top = 104
      Width = 194
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Dr. Ali Abbas'
    end
    object Label9: TLabel
      Left = 5
      Top = 158
      Width = 194
      Height = 13
      Alignment = taCenter
      AutoSize = False
    end
    object Label10: TLabel
      Left = 5
      Top = 176
      Width = 194
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Last update: 27/08/2025'
    end
    object Label4: TLabel
      Left = 4
      Top = 208
      Width = 194
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Your code'
    end
    object Label5: TLabel
      Left = 4
      Top = 244
      Width = 194
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Registeration code'
    end
    object Button1: TButton
      Left = 64
      Top = 284
      Width = 75
      Height = 25
      Caption = '&Ok'
      Default = True
      TabOrder = 0
      OnClick = Button1Click
    end
    object EditYourCode: TEdit
      Left = 41
      Top = 224
      Width = 121
      Height = 19
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 1
      Text = '0'
    end
    object EditRegisterationCode: TEdit
      Left = 41
      Top = 260
      Width = 121
      Height = 19
      TabOrder = 2
      Text = '0'
    end
  end
end
