{*******************************************************}
{                                                       }
{          MiTeC System Information Component           }
{                Detail Info Dialog                     }
{           version 8.1 for Delphi 5,6                  }
{                                                       }
{       Copyright © 1997,2002 Michal Mutl               }
{                                                       }
{*******************************************************}


unit MSI_DetailDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, CheckLst, ComCtrls;

type
  TdlgMSI_Detail = class(TForm)
    ButtonPanel: TPanel;
    Panel: TPanel;
    bOK: TButton;
    ClientPanel: TPanel;
    Notebook: TNotebook;
    Memo: TMemo;
    clb: TCheckListBox;
    lb: TListBox;
    lv: TListView;
    TitlePanel: TPanel;
    Image2: TImage;
    Bevel1: TBevel;
    lSubTitle: TLabel;
    lTitle: TLabel;
    procedure clbClickCheck(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
  public
  end;

var
  dlgMSI_Detail: TdlgMSI_Detail;

implementation

{$R *.DFM}

procedure TdlgMSI_Detail.clbClickCheck(Sender: TObject);
var
  OCC: TNotifyEvent;
  idx: integer;
  p: TPoint;
begin
  with TCheckListBox(Sender) do begin
    OCC:=OnClickCheck;
    OnClickCheck:=nil;
    GetCursorPos(p);
    p:=ScreenToClient(p);
    idx:=ItemAtPos(p,True);
    if idx>-1 then
      Checked[idx]:=not Checked[idx];
    OnClickCheck:=OCC;
  end;
end;

procedure TdlgMSI_Detail.FormCreate(Sender: TObject);
begin
  caption:=Application.Title;
end;

procedure TdlgMSI_Detail.FormActivate(Sender: TObject);
begin
  lv.Width:=0;
end;

end.