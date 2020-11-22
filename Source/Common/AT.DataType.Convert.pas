// ******************************************************************
//
// Program Name   : AT Library
// Platform(s)    : Android, iOS, Linux, MacOS, Windows
// Framework      : Console, FMX, VCL
//
// Filename       : AT.DataType.Convert.pas
// Date Created   : 22-Nov-2020
// Author         : Matthew Vesperman
//
// Description:
//
// Contains routines to convert data types.
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
///   Contains routines to convert data types.
/// </summary>
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
