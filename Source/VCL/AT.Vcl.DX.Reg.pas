unit AT.Vcl.DX.Reg;

interface

procedure Register;

implementation

uses
  System.Classes, AT.Vcl.DX.FileSelector;

procedure Register;
begin
  RegisterComponents('AT DevExpress', [TATdxFileSelector]);
end;
end.
