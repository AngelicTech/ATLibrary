// ******************************************************************
//
// Program Name   : AT Library
// Platform(s)    : Android, iOS, Linux, MacOS, Windows
// Framework      : Console, FMX, VCL
//
// Filename       : AT.Sets.pas
// Date Created   : 22-Nov-2020
// Author         : Matthew Vesperman
//
// Description:
//
// Set helper routines.
//
// Revision History:
//
// v1.00   :   Initial version
//
// ******************************************************************
//
// COPYRIGHT © 2020 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

/// <summary>
///   Set helper routines.
/// </summary>
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
