unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls;

type
  TfrmMain = class(TForm)
    pbGDI: TProgressBar;
    pbSystem: TProgressBar;
    pbUser: TProgressBar;
    lGDI: TLabel;
    lSystem: TLabel;
    lUser: TLabel;
    Timer: TTimer;
    procedure TimerTimer(Sender: TObject);
  private
  public

  end;

type
  TQT_Thunk = procedure cdecl;

procedure QT_Thunk; cdecl;

var
  frmMain: TfrmMain;

implementation

uses MiTeC_Routines;

{$R *.DFM}

var
  _QT_Thunk: TQT_Thunk;

  hInst16: THandle;
  SR: Pointer;

const
  cSystem = 0;
  cGDI = 1;
  cUSER = 2;

function LoadLibrary16(LibraryName: PChar): THandle; stdcall; external kernel32 index 35;
procedure FreeLibrary16(HInstance: THandle); stdcall; external kernel32 index 36;
function GetProcAddress16(Hinstance: THandle; ProcName: PChar): Pointer; stdcall; external kernel32 index 37;

procedure QT_Thunk;
begin
  if Assigned(_QT_Thunk) then
    _QT_Thunk;
end;

function GetFreeSysRes(SysRes: Word): Word;
var
  Thunks: Array[0..$20] of Word;
begin
  Thunks[0]:=hInst16;
  if not IsNT then begin
    hInst16:=LoadLibrary16('user.exe');
    if hInst16<32 then
      raise Exception.Create('Can''t load USER.EXE!');
    FreeLibrary16(hInst16);
    SR:=GetProcAddress16(hInst16,'GetFreeSystemResources');
    if not Assigned(SR) then
      raise Exception.Create('Can''t get address of GetFreeSystemResources');
    asm
      push SysRes       // push arguments
      mov edx, SR       // load 16-bit procedure pointer
      call _QT_Thunk     // call thunk
      mov Result, ax    // save the result
    end;
  end else
    Result:=90;
end;

procedure TfrmMain.TimerTimer(Sender: TObject);
begin
  pbGDI.Position:=GetFreeSysRes(cGDI);
  pbUser.Position:=GetFreeSysRes(cUser);
  pbSystem.Position:=GetFreeSysRes(cSystem);
  lGDI.Caption:=Format('GDI - %d%% free',[pbGDI.Position]);
  lUser.Caption:=Format('User - %d%% free',[pbUser.Position]);
  lSystem.Caption:=Format('System - %d%% free',[pbSystem.Position]);
end;

initialization
  @_QT_Thunk:=GetProcAddress(GetModuleHandle('kernel32'),PChar('QT_Thunk'));
end.
