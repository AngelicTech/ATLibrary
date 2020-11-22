unit AT.Math;

interface

function ForceInRange(Value, MinValue, MaxValue: Integer): Integer; overload;
function IsInRange(Value, MinValue, MaxValue: Integer): Boolean; overload;

implementation

uses
  System.Math;

function ForceInRange(Value, MinValue, MaxValue: Integer): Integer;
var
  iVal: Integer;
begin

  iVal := Max(Value, MinValue);

  Result := Min(iVal, MaxValue);

end;

function IsInRange(Value, MinValue, MaxValue: Integer): Boolean;
begin

  Result := ( (Value >= MinValue) AND (Value <= MaxValue) );

end;

end.
