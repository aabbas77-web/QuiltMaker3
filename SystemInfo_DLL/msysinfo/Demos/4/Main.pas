unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm2 = class(TForm)
    LabelAddress: TLabel;
    LabelLength: TLabel;
    bShow: TButton;
    Memo: TMemo;
    EditAddress: TEdit;
    EditLength: TEdit;
    procedure bShowClick(Sender: TObject);
  private
  public                                                 
  end;

var
  Form2: TForm2;

implementation

uses MSI_DMA;

{$R *.dfm}

procedure TForm2.bShowClick(Sender: TObject);

function GetChar(Value: Char): Char;
begin
  if Value<' ' then
    Result:='.'
  else
    Result:=Value;
end;

var
  Address: DWORD;
  Size, Line, Row, LineCount: Integer;
  LineStr: String;
begin
  with TDMA.Create do
    try                                               
      Screen.Cursor:=crHourGlass;
      Memo.Lines.Clear;
      Memo.Lines.BeginUpdate;
      Size:=StrToInt(EditLength.Text);
      Address:=StrToInt(EditAddress.Text);
      MapMemory(Address,Size);
      LineCount:=Size div 16;
      if Size mod 16 > 0 then
        Inc(LineCount);
      for Line:=0 to LineCount-1 do begin
        LineStr:=IntToHex(Address+Line*16,8)+': ';
        for Row:=0 to 15 do
          LineStr:=LineStr+IntToHex(Byte(Memory[Line*16+Row]),2)+' ';
        LineStr:=LineStr+' ';
        for Row:=0 to 15 do
          LineStr:=LineStr+GetChar(Memory[Line*16+Row]);
        Memo.Lines.Add(LineStr);
      end;
    finally
      Free;
      Memo.Lines.EndUpdate;
      Screen.Cursor:=crDefault;
    end;
end;

end.
