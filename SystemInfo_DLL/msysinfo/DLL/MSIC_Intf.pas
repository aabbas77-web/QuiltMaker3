{*******************************************************}
{                                                       }
{       MiTeC System Information Component              }
{                 MSIC interface                        }
{           version 8.2 for Delphi 5,6,7                }
{                                                       }
{       Copyright © 1997,2003 Michal Mutl               }
{                                                       }
{*******************************************************}

unit MSIC_Intf;

interface

uses Windows;

const
  SO_CPU      = $0001;
  SO_Machine  = $0002;
  SO_Devices  = $0004;
  SO_Display  = $0008;
  SO_Network  = $0010;
  SO_Media    = $0020;
  SO_Memory   = $0040;
  SO_IDE      = $0080;
  SO_Engines  = $0100;
  SO_APM      = $0200;
  SO_Disk     = $0400;
  SO_OS       = $0800;
  SO_Printers = $1000;
  SO_Software = $2000;
  SO_Startup  = $4000;

  SO_All = SO_CPU or SO_Machine or SO_Devices or SO_Display or SO_Network or SO_Media or
          SO_Memory or SO_Engines or SO_IDE or SO_APM or SO_Disk or SO_OS or SO_Printers or
          SO_Software or SO_Startup;


type
  TShowSystemOverviewModal = procedure; stdcall;
  TGenerateXMLReport = procedure(Topics: DWORD; Filename: PChar); stdcall;
  TGetCPUUsage = function: DWORD; stdcall;

var
  MSIC_DLL: THandle = 0;
  ShowSystemOverviewModal: TShowSystemOverviewModal = nil;
  GenerateXMLReport: TGenerateXMLReport = nil;
  GetCPUUsage: TGetCPUUsage = nil;
const
  MSIC_DLL_Name = 'MSIC.DLL';

implementation

initialization
  MSIC_DLL:=GetModuleHandle(MSIC_DLL_Name);
  if MSIC_DLL=0 then
    MSIC_DLL:=LoadLibrary(MSIC_DLL_Name);
  if MSIC_DLL<>0 then begin
    @ShowSystemOverviewModal:=GetProcAddress(MSIC_DLL,'ShowSystemOverviewModal');
    @GenerateXMLReport:=GetProcAddress(MSIC_DLL,'GenerateXMLReport');
    @GetCPUUsage:=GetProcAddress(MSIC_DLL,'GetCPUUsage');
  end;
finalization
  if MSIC_DLL<>0 then
    FreeLibrary(MSIC_DLL);
end.
