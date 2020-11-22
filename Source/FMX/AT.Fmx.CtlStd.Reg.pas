unit AT.Fmx.CtlStd.Reg;

interface

procedure Register;

implementation

uses
  System.Classes, AT.FMX.ClockLabel;

procedure Register;
begin
  RegisterComponents('AT FMX Standard', [TATFMXClockLabel]);
end;

end.
