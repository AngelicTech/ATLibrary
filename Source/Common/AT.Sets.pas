unit AT.Sets;

interface

function SetToInt(const aSet;const Size:integer):integer;
procedure IntToSet(const Value:integer;var aSet;const Size:integer);


implementation

function SetToInt(const aSet;const Size:integer):integer;
begin
  Result := 0;
  Move(aSet, Result, Size);
end;

procedure IntToSet(const Value:integer;var aSet;const Size:integer);
begin
  Move(Value, aSet, Size);
end;

end.
