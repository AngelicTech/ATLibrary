unit AT.DataType.Convert;

interface

/// <summary>
///   Converts an Currency value to a Extended (Floating-Point)
///   value.
/// </summary>
function CurrToExtended(Value: Currency): Extended;

/// <summary>
///   Converts an Extended (Floating-Point) value to a Currency
///   value.
/// </summary>
function ExtendedToCurr(Value: Extended): Currency;

implementation

function CurrToExtended(Value: Currency): Extended;
var
  AValue: Variant;
begin
  AValue := Value;

  Result := AValue;
end;

function ExtendedToCurr(Value: Extended): Currency;
var
  AValue: Variant;
begin
  AValue := Value;

  Result := AValue;
end;


end.
