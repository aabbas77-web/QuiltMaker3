program HDDetect;

uses
  Forms,
  HDDDlg in 'HDDDlg.pas' {dlgHDD};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdlgHDD, dlgHDD);
  Application.Run;
end.
