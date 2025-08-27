{*******************************************************}
{                                                       }
{       MiTeC System Information Component              }
{                Design Editors                         }
{           version 8.2 for Delphi 5,6,7                }
{                                                       }
{       Copyright © 1997,2003 Michal Mutl               }
{                                                       }
{*******************************************************}

{$INCLUDE MITEC_DEF.INC}

unit MSI_DsgnIntf;

interface

uses
  MSI_GUI,
  MSI_CPUUsage,

  Windows, Classes,
  {$IFDEF D6PLUS}
  DesignIntf, DesignEditors
  {$ELSE}
  DsgnIntf
  {$ENDIF}
  ;

type
  TMSI_PropertyEditor = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;

  TMSI_ComponentEditor = class(TComponentEditor)
  public
    function GetVerbCount: Integer; override;
    function GetVerb(Index: Integer): String; override;
    procedure ExecuteVerb(Index: Integer); override;
    procedure Edit; override;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('MiTeC',[TMCPUUsage]);
  RegisterComponents('MiTeC',[TMSystemInfo]);
  RegisterPropertyEditor(TypeInfo(string),TMSystemInfo,'About',TMSI_PropertyEditor);
  RegisterComponentEditor(TMSystemInfo,TMSI_ComponentEditor);
end;

{ TMSI_ComponentEditor }

procedure TMSI_ComponentEditor.Edit;
begin
  TMSystemInfo(Self.Component).ShowModalOverviewWithAbout;
end;

procedure TMSI_ComponentEditor.ExecuteVerb(Index: Integer);
begin
  if Index=0 then
    Edit;
end;

function TMSI_ComponentEditor.GetVerb(Index: Integer): String;
begin
  if Index=0 then
    Result:='System Overview...'
  else
    Result:=inherited GetVerb(Index-1);
end;

function TMSI_ComponentEditor.GetVerbCount: Integer;
begin
  Result:=inherited GetVerbCount+1;
end;

{ TMSI_PropertyEditor }

procedure TMSI_PropertyEditor.Edit;
begin
  TMSystemInfo(Self.GetComponent(0)).ShowModalOverviewWithAbout;
end;

function TMSI_PropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result:=[paDialog, paReadOnly];
end;

end.