unit AT.FMX.Layouts.Reg;

interface


procedure Register;


implementation

uses
  System.Classes, AT.FMX.Layouts;

procedure Register;
begin
  RegisterComponents('Layouts', [TATListLayout]);
end;

end.
