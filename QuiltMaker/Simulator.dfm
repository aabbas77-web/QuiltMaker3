object FormSimulator: TFormSimulator
  Left = 190
  Top = 105
  Width = 544
  Height = 375
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Quilting Simulator'
  Color = 14671839
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 310
    Width = 536
    Height = 19
    AutoHint = True
    Color = 14671839
    Panels = <>
    SimplePanel = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 26
    Width = 100
    Height = 284
    Align = alLeft
    BevelOuter = bvNone
    Color = 14671839
    TabOrder = 1
    object Label1: TLabel
      Left = 4
      Top = 37
      Width = 27
      Height = 13
      Caption = 'Delay'
    end
    object Label2: TLabel
      Left = 4
      Top = 88
      Width = 31
      Height = 13
      Caption = 'Speed'
    end
    object SpeedButtonChangeSpeed: TSpeedButton
      Left = 73
      Top = 104
      Width = 23
      Height = 22
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      OnClick = SpeedButtonChangeSpeedClick
    end
    object Label3: TLabel
      Left = 4
      Top = 140
      Width = 67
      Height = 13
      Caption = 'Element Index'
    end
    object CheckBoxKeepRatio: TCheckBox
      Left = 4
      Top = 8
      Width = 77
      Height = 17
      Caption = 'Keep Ratio'
      Checked = True
      Ctl3D = False
      ParentCtl3D = False
      State = cbChecked
      TabOrder = 0
    end
    object CSpinEditDelay: TCSpinEdit
      Left = 4
      Top = 52
      Width = 90
      Height = 22
      TabStop = True
      Ctl3D = True
      MaxValue = 1000000
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 1
      Value = 100
      OnChange = CSpinEditDelayChange
    end
    object EditSpeed: TEdit
      Left = 4
      Top = 104
      Width = 65
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      Text = '500'
    end
    object EditElementIndex: TEdit
      Left = 4
      Top = 156
      Width = 90
      Height = 19
      Color = 14671839
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 3
      Text = '0'
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 536
    Height = 26
    AutoSize = True
    Caption = 'ToolBar1'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    Images = FormMain.ImageList
    TabOrder = 2
    Transparent = True
    object ToolButton5: TToolButton
      Left = 0
      Top = 0
      Action = AFileOpen
    end
    object ToolButton6: TToolButton
      Left = 23
      Top = 0
      Action = AFileSave
    end
    object ToolButton7: TToolButton
      Left = 46
      Top = 0
      Action = AFileSaveAs
    end
    object ToolButton8: TToolButton
      Left = 69
      Top = 0
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 87
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 77
      Top = 0
      Action = ASimulatorPlay
    end
    object ToolButton2: TToolButton
      Left = 100
      Top = 0
      Action = ASimulatorNext
    end
    object ToolButton3: TToolButton
      Left = 123
      Top = 0
      Action = ASimulatorPause
    end
    object ToolButton4: TToolButton
      Left = 146
      Top = 0
      Action = ASimulatorStop
    end
    object ToolButton9: TToolButton
      Left = 169
      Top = 0
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 87
      Style = tbsSeparator
    end
  end
  object ScrollBox1: TScrollBox
    Left = 100
    Top = 26
    Width = 436
    Height = 284
    HorzScrollBar.Tracking = True
    VertScrollBar.Tracking = True
    Align = alClient
    TabOrder = 3
    OnResize = ScrollBox1Resize
    object Image: TImage
      Left = 0
      Top = 0
      Width = 100
      Height = 100
      AutoSize = True
    end
  end
  object OpenDialogDAT: TOpenDialog
    DefaultExt = 'dat'
    Filter = 'Quilting Machines Files (*.dat)|*.dat'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 420
    Top = 188
  end
  object SaveDialogDAT: TSaveDialog
    DefaultExt = 'dat'
    Filter = 'Quilting Machines Files (*.dat)|*.dat'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 448
    Top = 188
  end
  object ActionList1: TActionList
    Images = FormMain.ImageList
    Left = 420
    Top = 216
    object AFile: TAction
      Category = 'File'
      Caption = '&File'
      Hint = 'File Menu'
      OnExecute = AFileExecute
    end
    object AFileOpen: TAction
      Category = 'File'
      Caption = '&Open...'
      Hint = 'Open Quilting file'
      ImageIndex = 1
      OnExecute = AFileOpenExecute
    end
    object AFileSave: TAction
      Category = 'File'
      Caption = '&Save'
      Hint = 'Save Current changes'
      ImageIndex = 2
      OnExecute = AFileSaveExecute
    end
    object AFileSaveAs: TAction
      Category = 'File'
      Caption = 'Save &As...'
      Hint = 'Save changes as'
      ImageIndex = 73
      OnExecute = AFileSaveAsExecute
    end
    object AFileClose: TAction
      Category = 'File'
      Caption = '&Close'
      Hint = 'Close simluator window'
      ImageIndex = 77
      OnExecute = AFileCloseExecute
    end
    object ASimulator: TAction
      Category = 'Simulator'
      Caption = '&Simulator'
      Hint = 'Simulator Menu'
      OnExecute = ASimulatorExecute
    end
    object ASimulatorPlay: TAction
      Category = 'Simulator'
      Caption = '&Play'
      Enabled = False
      Hint = 'Play current file'
      ImageIndex = 83
      OnExecute = ASimulatorPlayExecute
    end
    object ASimulatorPause: TAction
      Category = 'Simulator'
      Caption = 'Pa&use'
      Enabled = False
      Hint = 'Pause playing current file'
      ImageIndex = 82
      OnExecute = ASimulatorPauseExecute
    end
    object ASimulatorStop: TAction
      Category = 'Simulator'
      Caption = '&Stop'
      Enabled = False
      Hint = 'Stop playing current file'
      ImageIndex = 86
      OnExecute = ASimulatorStopExecute
    end
    object ASimulatorNext: TAction
      Category = 'Simulator'
      Caption = '&Next'
      Enabled = False
      Hint = 'Show Next stitch'
      ImageIndex = 81
      ShortCut = 113
      OnExecute = ASimulatorNextExecute
    end
  end
  object MainMenu1: TMainMenu
    Images = FormMain.ImageList
    Left = 448
    Top = 216
    object File1: TMenuItem
      Action = AFile
      object Open1: TMenuItem
        Action = AFileOpen
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Save1: TMenuItem
        Action = AFileSave
      end
      object SaveAs1: TMenuItem
        Action = AFileSaveAs
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Close1: TMenuItem
        Action = AFileClose
      end
    end
    object Simulator1: TMenuItem
      Action = ASimulator
      object Play1: TMenuItem
        Action = ASimulatorPlay
      end
      object Next1: TMenuItem
        Action = ASimulatorNext
      end
      object Pause1: TMenuItem
        Action = ASimulatorPause
      end
      object Stop1: TMenuItem
        Action = ASimulatorStop
      end
    end
  end
  object Timer: TTimer
    Enabled = False
    Interval = 40
    OnTimer = TimerTimer
    Left = 420
    Top = 244
  end
  object FormTranslation1: TFormTranslation
    Left = 448
    Top = 244
  end
end
