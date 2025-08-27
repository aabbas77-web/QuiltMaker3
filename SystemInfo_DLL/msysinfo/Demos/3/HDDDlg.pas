unit HDDDlg;

interface

uses
  Windows, Messages, SysUtils, {$IFDEF D6PLUS} Variants, {$ENDIF} Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, MSI_IDE;

type
  TdlgHDD = class(TForm)
    Panel1: TPanel;
    List: TListView;
    Panel2: TPanel;
    Panel8: TPanel;
    bOK: TButton;
    procedure bOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
    procedure RefreshList;
  end;

var
  dlgHDD: TdlgHDD;

implementation

{$R *.dfm}

procedure TdlgHDD.RefreshList;
begin
  with TIDE.Create do try

  GetInfo;

  List.Items.Clear;

  with List.Items.Add, PrimaryMaster do begin
    Caption:='Primary Master';
    if ErrorCode=0 then begin
      SubItems.Add(ModelNumber);
      SubItems.Add(SerialNumber);
      SubItems.Add(RevisionNumber);
      SubItems.Add(Format('%d',[Cylinders]));
      SubItems.Add(Format('%d',[Heads]));
      SubItems.Add(Format('%d',[SectorsPerTrack]));
      SubItems.Add(Format('%d MB',[((Capacity) div 1024) div 1024]));
    end else
      SubItems.Add(ErrorMessage);
  end;

  with List.Items.Add, PrimarySlave do begin
    Caption:='Primary Slave';
    if ErrorCode=0 then begin
      SubItems.Add(ModelNumber);
      SubItems.Add(SerialNumber);
      SubItems.Add(RevisionNumber);
      SubItems.Add(Format('%d',[Cylinders]));
      SubItems.Add(Format('%d',[Heads]));
      SubItems.Add(Format('%d',[SectorsPerTrack]));
      SubItems.Add(Format('%d MB',[((Capacity) div 1024) div 1024]));
    end else
      SubItems.Add(ErrorMessage);
  end;

  with List.Items.Add, SecondaryMaster do begin
    Caption:='Secondary Master';
    if ErrorCode=0 then begin
      SubItems.Add(ModelNumber);
      SubItems.Add(SerialNumber);
      SubItems.Add(RevisionNumber);
      SubItems.Add(Format('%d',[Cylinders]));
      SubItems.Add(Format('%d',[Heads]));
      SubItems.Add(Format('%d',[SectorsPerTrack]));
      SubItems.Add(Format('%d MB',[((Capacity) div 1024) div 1024]));
    end else
      SubItems.Add(ErrorMessage);
  end;

  with List.Items.Add, SecondarySlave do begin
    Caption:='Secondary Slave';
    if ErrorCode=0 then begin
      SubItems.Add(ModelNumber);
      SubItems.Add(SerialNumber);
      SubItems.Add(RevisionNumber);
      SubItems.Add(Format('%d',[Cylinders]));
      SubItems.Add(Format('%d',[Heads]));
      SubItems.Add(Format('%d',[SectorsPerTrack]));
      SubItems.Add(Format('%d MB',[((Capacity) div 1024) div 1024]));
    end else
      SubItems.Add(ErrorMessage);
  end;
  finally
    Free;
  end;
end;

procedure TdlgHDD.bOKClick(Sender: TObject);
begin
  Close;
end;

procedure TdlgHDD.FormCreate(Sender: TObject);
begin
  RefreshList;
end;

end.
