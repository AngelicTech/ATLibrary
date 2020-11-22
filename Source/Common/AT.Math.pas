// ******************************************************************
//
// Program Name   : AT Library
// Platform(s)    : Android, iOS, Linux, MacOS, Windows
// Framework      : Console, FMX, VCL
//
// Filename       : AT.Math.pas
// Date Created   : 22-Nov-2020
// Author         : Matthew Vesperman
//
// Description:
//
// General math functions.
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
///   General math functions.
/// </summary>
unit AT.Math;

interface

/// <summary>
///   Forces Value to be in the range of MinValue and MaxValue.
/// </summary>
function ForceInRange(Value, MinValue, MaxValue: Integer): Integer; overload;

/// <summary>
///   Checks if Value is in the range of MinValue and MaxValue.
/// </summary>
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
