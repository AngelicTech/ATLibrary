unit AT.Fmx.CtlAdv.Reg;

interface

procedure Register;


implementation

uses
  System.Classes, AT.FMX.DlgButtonPanel;


procedure Register;
begin
  RegisterComponents('AT FMX Advanced', [TATFMXDlgButtonPanel]);
end;

end.
