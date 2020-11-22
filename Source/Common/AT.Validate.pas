// ******************************************************************
//
// Program Name   : AT Library
// Platform(s)    : Android, iOS, Linux, MacOS, Windows
// Framework      : Console, FMX, VCL
//
// Filename       : AT.Validate.pas
// Date Created   : 11-Apr-2017
// Author         : Matthew Vesperman
//
// Description:
//
// Data validation routines.
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
///   Contains data validation routines.
/// </summary>
unit AT.Validate;

interface

uses
  System.Classes, System.Types;


const
  cRegExBoolFalse = '^[Ff]([Aa][Ll][Ss][Ee])?|[Nn][Oo]?|0$';
  cRegExBoolTrue  = '^[Tt]([Rr][Uu][Ee])?|[Yy]([Ee][Ss])?|1$';
  cRegExEmail     = '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:' +
                    '[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:' +
                    '[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$';
  cRegExHostName  = '^(localhost|[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,10})' +
                    '(:[0-9]{1,5})?(\/.*)?$';
  cRegExIPV4      = '^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}' +
                    '([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$';
  cRegExURL       = '^(ftp:\/\/|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}' +
                    '[a-z0-9]+)*\.[a-z]{2,10}(:[0-9]{1,5})?(\/.*)?$';





type
  /// <summary>
  ///   Contains class functions to check and validate data.
  /// </summary>
  TATValidate = class
  public
    /// <summary>
    ///   Determine if Value is a boolean value.
    /// </summary>
    /// <param name="Value">
    ///   The string to check.
    /// </param>
    /// <returns>
    ///   Returns TRUE if Value is a boolean value. Can be
    ///   F[alse]|N[o]|0|T[rue]|Y[es]|1. Case insensitive.
    /// </returns>
    /// <remarks>
    ///   Calls TATValidate.IsStrBooleanFalse and TATValidate.IsStrBooleanTrue
    ///   to check string.
    /// </remarks>
    class function IsStrBoolean(const Value: String): Boolean;
    /// <summary>
    ///   Determine if Value is a boolean false value.
    /// </summary>
    /// <param name="Value">
    ///   The string to check.
    /// </param>
    /// <returns>
    ///   Returns TRUE if Value is a boolean false value. Can be
    ///   F[alse]|N[o]|0. Case insensitive.
    /// </returns>
    /// <remarks>
    ///   <para>
    ///     Regular Expression: '^[Ff]([Aa][Ll][Ss][Ee])?|[Nn][Oo]?|0$'
    ///   </para>
    ///   <para>
    ///     Calls TATValidate.MatchesRegEx to check string.
    ///   </para>
    /// </remarks>
    class function IsStrBooleanFalse(const Value: String): Boolean;
    /// <summary>
    ///   Determine if Value is a boolean true value.
    /// </summary>
    /// <param name="Value">
    ///   The string to check.
    /// </param>
    /// <returns>
    ///   Returns TRUE if Value is a boolean true value. Can be T[rue]|Y[es]|1.
    ///   Case insensitive.
    /// </returns>
    /// <remarks>
    ///   <para>
    ///     Regular Expression: '^[Tt]([Rr][Uu][Ee])?|[Yy]([Ee][Ss])?|1$'
    ///   </para>
    ///   <para>
    ///     Calls TATValidate.MatchesRegEx to check string.
    ///   </para>
    /// </remarks>
    class function IsStrBooleanTrue(const Value: String): Boolean;
    /// <summary>
    ///   Determine if Value is a currency (money) value.
    /// </summary>
    /// <param name="Value">
    ///   The string to check.
    /// </param>
    /// <returns>
    ///   Returns TRUE if Value is a currency (money) value.
    /// </returns>
    class function IsStrCurrency(const Value: String): Boolean;
    ///	<summary>
    ///	  Determine if Value is a date value.
    ///	</summary>
    ///	<param name="Value">
    ///	  The string to check.
    ///	</param>
    ///	<returns>
    ///	  Returns TRUE if Value is a date value.
    ///	</returns>
    class function IsStrDate(const Value: String): Boolean;
    ///	<summary>
    ///	  Determine is Value is a date/time value.
    ///	</summary>
    ///	<param name="Value">
    ///	  The string to check.
    ///	</param>
    ///	<returns>
    ///	  Returns TRUE is Value is a date/time value.
    ///	</returns>
    class function IsStrDateTime(const Value: String): Boolean;
    ///	<summary>
    ///	  Determine if Value is a Real (floating-point) value.
    ///	</summary>
    ///	<param name="Value">
    ///	  The string to check.
    ///	</param>
    ///	<returns>
    ///	  Returns TRUE if Value is a Real (floating-point) value.
    ///	</returns>
    class function IsStrFloat(const Value: String): Boolean;
    ///	<summary>
    ///	  Determine if Value is a Int64 value.
    ///	</summary>
    ///	<param name="Value">
    ///	  The string to check.
    ///	</param>
    ///	<returns>
    ///	  Returns TRUE if Value is a Int64 value.
    ///	</returns>
    class function IsStrInt64(const Value: String): Boolean;
    ///	<summary>
    ///	  Determine if Value is a Integer value.
    ///	</summary>
    ///	<param name="Value">
    ///	  The string to check.
    ///	</param>
    ///	<returns>
    ///	  Returns TRUE if Value is a Integer value.
    ///	</returns>
    class function IsStrInteger(const Value: String): Boolean;
    ///	<summary>
    ///	  Determine if Value is a time value.
    ///	</summary>
    ///	<param name="Value">
    ///	  The string to check.
    ///	</param>
    ///	<returns>
    ///	  Returns TRUE if Value is a time value.
    ///	</returns>
    class function IsStrTime(const Value: String): Boolean;
    ///	<summary>
    ///	  Determine if Value is a UInt value.
    ///	</summary>
    ///	<param name="Value">
    ///	  The string to check.
    ///	</param>
    ///	<returns>
    ///	  Returns TRUE if Value is a UInt value.
    ///	</returns>
    class function IsStrUInt(const Value: String): Boolean;
    ///	<summary>
    ///	  Determine if Value is a UInt64 value.
    ///	</summary>
    ///	<param name="Value">
    ///	  The string to check.
    ///	</param>
    ///	<returns>
    ///	  Returns TRUE if Value is a UInt64 value.
    ///	</returns>
    class function IsStrUInt64(const Value: String): Boolean;
    /// <summary>
    ///   Determines if Value is a valid email address.
    /// </summary>
    /// <param name="Value">
    ///   The string to validate as an email address.
    /// </param>
    /// <returns>
    ///   TRUE if Value is a valid email address, FALSE otherwise.
    /// </returns>
    /// <remarks>
    ///   <para>
    ///     Regular Expression:
    ///     '^[a-zA-Z0-9.!#$%&amp;'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$'
    ///   </para>
    ///   <para>
    ///     Calls TATValidate.MatchesRegEx to check string.
    ///   </para>
    /// </remarks>
    class function IsValidEmail(const Value: String): Boolean;
    /// <summary>
    ///   Determines if Value is a valid hostname.
    /// </summary>
    /// <param name="Value">
    ///   The string to validate as a hostname.
    /// </param>
    /// <returns>
    ///   TRUE if Value is a valid hostname, FALSE otherwise.
    /// </returns>
    /// <remarks>
    ///   <para>
    ///     Regular Expression:
    ///     '^[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,10}?$'
    ///   </para>
    ///   <para>
    ///     If Value is NOT 'localhost' then this method calls
    ///     TATValidate.MatchesRegEx to check string.
    ///   </para>
    /// </remarks>
    class function IsValidHostName(const Value: String): Boolean;
    /// <summary>
    ///   Determines if Value is a valid IPV4 address.
    /// </summary>
    /// <param name="Value">
    ///   The string to validate as a IPV4 address.
    /// </param>
    /// <returns>
    ///   TRUE if Value is a valid IPV4 address, FALSE otherwise.
    /// </returns>
    /// <remarks>
    ///   <para>
    ///     Regular Expression:
    ///     '^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$'
    ///   </para>
    ///   <para>
    ///     Calls TATValidate.MatchesRegEx to check string.
    ///   </para>
    /// </remarks>
    class function IsValidIPV4Address(const Value: String): Boolean;
    /// <summary>
    ///   Determines if Value is a valid url.
    /// </summary>
    /// <param name="Value">
    ///   The string to validate as a url.
    /// </param>
    /// <returns>
    ///   TRUE if Value is a valid url, FALSE otherwise.
    /// </returns>
    /// <remarks>
    ///   <para>
    ///     Regular Expression:
    ///     '^(ftp:\/\/|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,10}(:[0-9]{1,5})?(\/.*)?$'
    ///   </para>
    ///   <para>
    ///     Validates ftp, http, https prefixes as well as prefix-less urls.
    ///   </para>
    ///   <para>
    ///     Calls TATValidate.MatchesRegEx to check string.
    ///   </para>
    /// </remarks>
    class function IsValidURL(const Value: String): Boolean;
    /// <summary>
    ///   Determines if Value is a valid string according to ARegEx,
    /// </summary>
    /// <param name="Value">
    ///   The string value to validate.
    /// </param>
    /// <param name="ARegEx">
    ///   The regular expression to use for validation.
    /// </param>
    /// <returns>
    ///   TRUE if Value matches the regular expression passed in ARegEx.
    /// </returns>
    class function MatchesRegEx(const Value, ARegEx: String): Boolean;
  end;


//FUNCTIONS - These are maintained for backwards compatability...


/// <summary>
///   Determine if Value is a boolean value.
/// </summary>
/// <param name="Value">
///   The string to check.
/// </param>
/// <returns>
///   Returns TRUE if Value is a boolean value. Can be
///   F[alse]|N[o]|0|T[rue]|Y[es]|1. Case insensitive.
/// </returns>
/// <remarks>
///   <para>
///     Calls TATValidate.IsStrBoolean to check string.
///   </para>
///   <para>
///     Maintained for backwards compatability. Use TATValidate.IsStrBoolean
///     instead.
///   </para>
/// </remarks>
function IsStrBoolean(const Value: String): Boolean;

/// <summary>
///   Determine if Value is a boolean false value.
/// </summary>
/// <param name="Value">
///   The string to check.
/// </param>
/// <returns>
///   Returns TRUE if Value is a boolean false value. Can be F[alse]|N[o]|0.
///   Case insensitive.
/// </returns>
/// <remarks>
///   <para>
///     Calls TATValidate.IsStrBooleanFalse to check string.
///   </para>
///   <para>
///     Maintained for backwards compatability. Use
///     TATValidate.IsStrBooleanFalse instead.
///   </para>
/// </remarks>
function IsStrBooleanFalse(const Value: String): Boolean;

/// <summary>
///   Determine if Value is a boolean true value.
/// </summary>
/// <param name="Value">
///   The string to check.
/// </param>
/// <returns>
///   Returns TRUE if Value is a boolean true value. Can be T[rue]|Y[es]|1.
///   Case insensitive.
/// </returns>
/// <remarks>
///   <para>
///     Calls TATValidate.IsStrBooleanTrue to check string.
///   </para>
///   <para>
///     Maintained for backwards compatability. Use TATValidate.IsBooleanTrue
///     instead.
///   </para>
/// </remarks>
function IsStrBooleanTrue(const Value: String): Boolean;

/// <summary>
///   Determine if Value is a currency (money) value.
/// </summary>
/// <param name="Value">
///   The string to check.
/// </param>
/// <returns>
///   Returns TRUE if Value is a currency (money) value.
/// </returns>
/// <remarks>
///   <para>
///     Calls TATValidate.IsStrCurrency to check string.
///   </para>
///   <para>
///     Maintained for backwards compatability. Use TATValidate.IsStrCurrency
///     instead.
///   </para>
/// </remarks>
function IsStrCurrency(const Value: String): Boolean;

/// <summary>
///   Determine if Value is a date value.
/// </summary>
/// <param name="Value">
///   The string to check.
/// </param>
/// <returns>
///   Returns TRUE if Value is a date value.
/// </returns>
/// <remarks>
///   <para>
///     Calls TATValidate.IsStrDate to check string.
///   </para>
///   <para>
///     Maintained for backwards compatability. Use TATValidate.IsStrDate
///     instead.
///   </para>
/// </remarks>
function IsStrDate(const Value: String): Boolean;

/// <summary>
///   Determine is Value is a date/time value.
/// </summary>
/// <param name="Value">
///   The string to check.
/// </param>
/// <returns>
///   Returns TRUE is Value is a date/time value.
/// </returns>
/// <remarks>
///   <para>
///     Calls TATValidate.IsStrDateTime to check string.
///   </para>
///   <para>
///     Maintained for backwards compatability. Use TATValidate.IsStrDateTime
///     instead.
///   </para>
/// </remarks>
function IsStrDateTime(const Value: String): Boolean;

/// <summary>
///   Determine if Value is a Integer value.
/// </summary>
/// <param name="Value">
///   The string to check.
/// </param>
/// <returns>
///   Returns TRUE if Value is a Integer value.
/// </returns>
/// <remarks>
///   <para>
///     Calls TATValidate.IsStrIneger to check string.
///   </para>
///   <para>
///     Maintained for backwards compatability. Use TATValidate.IsStrInteger
///     instead.
///   </para>
/// </remarks>
function IsStrInteger(const Value: String): Boolean;

/// <summary>
///   Determine if Value is a Real (floating-point) value.
/// </summary>
/// <param name="Value">
///   The string to check.
/// </param>
/// <returns>
///   Returns TRUE if Value is a Real (floating-point) value.
/// </returns>
/// <remarks>
///   <para>
///     Calls TATValidate.IsStrFloat to check value.
///   </para>
///   <para>
///     Maintained for backwards compatability. Use TATValidate.IsStrFloat
///     instead.
///   </para>
/// </remarks>
function IsStrReal(const Value: String): Boolean;

/// <summary>
///   Determine if AStr is a time value.
/// </summary>
/// <param name="AStr">
///   The string to check.
/// </param>
/// <returns>
///   Returns TRUE if AStr is a time value.
/// </returns>
/// <remarks>
///   <para>
///     Calls TATValidate.IsStrTime to check string.
///   </para>
///   <para>
///     Maintained for backwards compatability. Use TATValidate.IsStrTime
///     instead.
///   </para>
/// </remarks>
function IsStrTime(const AStr: String): Boolean;

/// <summary>
///   Determines if Value is a valid email address.
/// </summary>
/// <param name="Value">
///   The string to validate as an email address.
/// </param>
/// <returns>
///   TRUE if Value is a valid email address, FALSE otherwise.
/// </returns>
/// <remarks>
///   <para>
///     Calls TATValidate.IsValidEmail to check string.
///   </para>
///   <para>
///     Maintained for backwards compatability. Use TATValidate.IsValidEmail
///     instead.
///   </para>
/// </remarks>
function IsValidEmail(const Value: String): Boolean;

/// <summary>
///   Determines if Value is a valid string according to ARegEx,
/// </summary>
/// <param name="Value">
///   The string value to validate.
/// </param>
/// <param name="ARegEx">
///   The regular expression to use for validation.
/// </param>
/// <returns>
///   TRUE if Value matches the regular expression passed in ARegEx.
/// </returns>
/// <remarks>
///   <para>
///     Calls TATValidate.MatchesRegEx to validate string.
///   </para>
///   <para>
///     Maintained for backwards compatability. Use TATValidate.MatchesRegEx
///     instead.
///   </para>
/// </remarks>
function MatchesRegEx(const Value, ARegEx: String): Boolean;


implementation

uses
  System.SysUtils, System.RegularExpressions, AT.Strings.Replace;


function IsStrBoolean(const Value: String): Boolean;
begin

  Result := TATValidate.IsStrBoolean(Value);

end;

function IsStrBooleanFalse(const Value: String): Boolean;
begin

  Result := TATValidate.IsStrBooleanFalse(Value);

end;

function IsStrBooleanTrue(const Value: String): Boolean;
begin

  Result := TATValidate.IsStrBooleanTrue(Value);

end;

function IsStrCurrency(const Value: String): Boolean;
begin

  Result := TATValidate.IsStrCurrency(Value);

end;

function IsStrDate(const Value: String): Boolean;
begin

  Result := TATValidate.IsStrDate(Value);

end;

function IsStrDateTime(const Value: String): Boolean;
begin

  Result := TATValidate.IsStrDateTime(Value);

end;

function IsStrInteger(const Value: String): Boolean;
begin

  Result := TATValidate.IsStrInteger(Value);

end;

function IsStrReal(const Value: String): Boolean;
begin

  Result := TATValidate.IsStrFloat(Value);

end;

function IsStrTime(const AStr: string): Boolean;
var
  ADT: TDateTime;
begin
  Result := TryStrToTime(AStr, ADT);
end;

  function IsValidEmail(const Value: String): Boolean;
begin

  Result := TATValidate.IsValidEmail(Value);

end;

function MatchesRegEx(const Value, ARegEx: String): Boolean;
begin

  Result := TATValidate.MatchesRegEx(Value, ARegEx);

end;

class function TATValidate.IsStrBoolean(const Value: String): Boolean;
begin

  Result := (
      TATValidate.IsStrBooleanFalse(Value) OR
      TATValidate.IsStrBooleanTrue(Value)
    );

end;

class function TATValidate.IsStrBooleanFalse(const Value: String): Boolean;
begin

  Result := TATValidate.MatchesRegEx(Value, cRegExBoolFalse);

end;

class function TATValidate.IsStrBooleanTrue(const Value: String): Boolean;
begin

  Result := TATValidate.MatchesRegEx(Value, cRegExBoolTrue);

end;

class function TATValidate.IsStrCurrency(const Value: String): Boolean;
var
  ACurr: Currency;
  AFmt: TFormatSettings;
begin

  AFmt := TFormatSettings.Create;

  Result := TryStrToCurr(Value, ACurr, AFmt);

end;

class function TATValidate.IsStrDate(const Value: String): Boolean;
var
  sTemp: String;
  ADT: TDateTime;
  AFmt: TFormatSettings;
begin

  sTemp := StrReplaceMonthNames(Value);

  AFmt := TFormatSettings.Create;

  Result := TryStrToDate(sTemp, ADT, AFmt);

end;

class function TATValidate.IsStrDateTime(const Value: String): Boolean;
var
  sTemp: String;
  ADT: TDateTime;
  AFmt: TFormatSettings;
begin

  sTemp := StrReplaceMonthNames(Value);

  AFmt := TFormatSettings.Create;

  Result := TryStrToDateTime(sTemp, ADT, AFmt);

end;

class function TATValidate.IsStrFloat(const Value: String): Boolean;
var
  AFloat: Extended;
  AFmt: TFormatSettings;
begin

  AFmt := TFormatSettings.Create;

  Result := TryStrToFloat(Value, AFloat, AFmt);

end;

class function TATValidate.IsStrInt64(const Value: String): Boolean;
var
  AInt: Int64;
begin

  Result := TryStrToInt64(Value, AInt);

end;

class function TATValidate.IsStrInteger(const Value: String): Boolean;
var
  AInt: Integer;
begin

  Result := TryStrToInt(Value, AInt);

end;

class function TATValidate.IsStrTime(const Value: String): Boolean;
var
  sTemp: String;
  ADT: TDateTime;
  AFmt: TFormatSettings;
begin

  sTemp := StrReplaceMonthNames(Value);

  AFmt := TFormatSettings.Create;

  Result := TryStrToTime(sTemp, ADT, AFmt);

end;

class function TATValidate.IsStrUInt(const Value: String): Boolean;
var
  AInt: Cardinal;
begin

  Result := TryStrToUInt(Value, AInt);

end;

class function TATValidate.IsStrUInt64(const Value: String): Boolean;
var
  AInt: UInt64;
begin

  Result := TryStrToUInt64(Value, AInt);

end;

class function TATValidate.IsValidEmail(const Value: String): Boolean;
begin

  Result := TATValidate.MatchesRegEx(Value, cRegExEmail);

end;

class function TATValidate.IsValidHostName(const Value: String): Boolean;
begin

  Result := SameText(Value, 'localhost');

  if (Result) then
    Exit(Result);

  Result := TATValidate.MatchesRegEx(Value, cRegExHostName);

end;

class function TATValidate.IsValidIPV4Address(const Value: String): Boolean;
begin

  Result := TATValidate.MatchesRegEx(Value, cRegExIPV4);

end;

class function TATValidate.IsValidURL(const Value: String): Boolean;
begin

  Result := TATValidate.MatchesRegEx(Value, cRegExURL);

end;

class function TATValidate.MatchesRegEx(const Value, ARegEx: String): Boolean;
begin

  Result := TRegEx.IsMatch(Value, ARegEx);

end;

end.

