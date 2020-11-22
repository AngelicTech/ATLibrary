unit AT.Vcl.Graphics.Reg;

interface

procedure Register;

implementation

uses
  System.Classes, AT.Windows.Controls.Background;

procedure Register;
begin
  RegisterComponents('AT Graphics', [TATBackground]);
end;
end.
