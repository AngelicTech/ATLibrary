// ******************************************************************
//
// Program Name   : AT Library
// Platform(s)    : Android, iOS, Linux, MacOS, Windows
// Framework      : Console, FMX, VCL
//
// Filename       : AT.Math.Conversion.Length.pas
// Date Created   : 19-NOV-2017
// Author         : Matthew Vesperman
//
// Description:
//
// Length unit conversion routines.
//
// Revision History:
//
// v1.00   :   Initial version
//
// ******************************************************************
//
// COPYRIGHT © 2017 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

/// <summary>
///   Contains length unit conversion routines..
/// </summary>
unit AT.Math.Conversion.Length;

interface

/// <summary>
///   Converts a value in centimeters to inches.
/// </summary>
/// <param name="Value">
///   A length in centimeters.
/// </param>
/// <returns>
///   The value passed in the Value parameter converted to inches.
/// </returns>
function CentimeterToInch(Value: Double): Double;

/// <summary>
///   Converts a value in centimeters to millimeters.
/// </summary>
/// <param name="Value">
///   A length in centimeters.
/// </param>
/// <returns>
///   The value passed in the Value parameter converted to
///   millimeters. <br />
/// </returns>
function CentimeterToMillimeter(Value: Double): Double;

/// <summary>
///   Converts a value in inches to centimeters.
/// </summary>
/// <param name="Value">
///   A length in inches. <br />
/// </param>
/// <returns>
///   The value passed in the Value parameter converted to
///   centimeters. <br />
/// </returns>
function InchToCentimeter(Value: Double): Double;

/// <summary>
///   Converts a value in inches to millimeters.
/// </summary>
/// <param name="Value">
///   A length in inches.
/// </param>
/// <returns>
///   The value passed in the Value parameter converted to
///   millimeters.
/// </returns>
function InchToToMillimeter(Value: Double): Double;

/// <summary>
///   Converts a value in millimeters to centimeters.
/// </summary>
/// <param name="Value">
///   A length in millimeters.
/// </param>
/// <returns>
///   The value passed in the Value parameter converted to
///   centimeters.
/// </returns>
function MillimeterToCentimeter(Value: Double): Double;

/// <summary>
///   Converts a value in millimeters to inches.
/// </summary>
/// <param name="Value">
///   A length in millimeters.
/// </param>
/// <returns>
///   The value passed in the Value parameter converted to inches.
/// </returns>
function MillimeterToInch(Value: Double): Double;

implementation

function CentimeterToInch(Value: Double): Double;
begin
  Result := Value / 2.54;
end;

function CentimeterToMillimeter(Value: Double): Double;
begin
  Result := Value * 10;
end;

function InchToCentimeter(Value: Double): Double;
begin
  Result := Value * 2.54;
end;

function InchToToMillimeter(Value: Double): Double;
begin
  Result := Value * 25.4;
end;

function MillimeterToCentimeter(Value: Double): Double;
begin
  Result := Value / 10;
end;

function MillimeterToInch(Value: Double): Double;
begin
  Result := Value / 25.4;
end;

end.
