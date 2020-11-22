unit AT.FMX.Graphics.Reg;

interface

procedure Register;

implementation

uses
  System.Classes, AT.FMX.Graphics.Shapes;

procedure Register;
begin
  RegisterComponents('AT FMX Shapes', [TATRoundRect, TATPolygon]);
end;
end.
