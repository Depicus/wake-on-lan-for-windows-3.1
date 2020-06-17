program Wol31;

uses
  Forms,
  Frmmain in 'FRMMAIN.PAS' {Main},
  wol in 'WOL.PAS';

{$R *.RES}

begin
  Application.Title := 'Wake On Lan for Windows 3.1';
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
