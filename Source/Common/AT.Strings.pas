// ******************************************************************
//
// Program Name   : AT Library
// Platform(s)    : Android, iOS, Linux, MacOS, Windows
// Framework      : Console, FMX, VCL
//
// Filename       : AT.Strings.pas
// Date Created   : 11-Apr-2017
// Author         : Matthew Vesperman
//
// Description:
//
// String handling/information routines.
//
// Revision History:
//
// v1.00   :   Initial version
// v1.10   : 2018-06-02 - Added constants for random options sets.
//
// ******************************************************************
//
// COPYRIGHT © 2017 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

/// <summary>
///   Contains string handling/information routines.
/// </summary>
unit AT.Strings;

interface

type
  /// <summary>
  ///   The type of characters to use when generating a random
  ///   string.
  /// </summary>
  /// <seealso cref="AT.Strings|TATRandomOptions">
  ///   TATRandomOptions
  /// </seealso>
  /// <seealso cref="AT.Strings|RandomString(Integer,TATRandomOptions)">
  ///   RandomString
  /// </seealso>
  TATRandomOption = (
    /// <summary>
    ///   Include lowercase letters.
    /// </summary>
    roAlphaLC,
    /// <summary>
    ///   Include uppercase letters.
    /// </summary>
    roAlphaUC,
    /// <summary>
    ///   Include numbers.
    /// </summary>
    roNumbers,
    /// <summary>
    ///   Include special symbols.
    /// </summary>
    roSymbols);
  /// <summary>
  ///   The set of characters to use when generating random strings.
  /// </summary>
  /// <seealso cref="AT.Strings|TATRandomOption">
  ///   TATRandomOption
  /// </seealso>
  /// <seealso cref="AT.Strings|RandomString(Integer,TATRandomOptions)">
  ///   RandomString
  /// </seealso>
  TATRandomOptions = set of TATRandomOption;

const
  cRandOptsAll : TATRandomOptions = [
                                      roAlphaLC,
                                      roAlphaUC,
                                      roNumbers,
                                      roSymbols
                                    ];
  cRandOptsAlphaAll : TATRandomOptions = [roAlphaLC, roAlphaUC];
  cRandOptsAlphaLC : TATRandomOptions = [roAlphaLC];
  cRandOptsAlphaUC : TATRandomOptions = [roAlphaUC];
  cRandOptsNone : TATRandomOptions = [];
  cRandOptsNumbers : TATRandomOptions = [roNumbers];
  cRandOptsSymbols : TATRandomOptions = [roSymbols];

/// <summary>
///   Generate a random string ALen in size.
/// </summary>
/// <param name="ALen">
///   The size of the string to generate.
/// </param>
/// <param name="ARandOpts">
///   The set of characters to use to generate the random string.
///   Default is [roAlphaLC, roAlphaUC, roNumbers, roSymbols].
/// </param>
/// <returns>
///   Returns a string of random characters ALen in size.
/// </returns>
/// <seealso cref="AT.Strings|TATRandomOption">
///   TATRandomOption
/// </seealso>
/// <seealso cref="AT.Strings|TATRandomOptions">
///   TATRandomOptions
/// </seealso>
function RandomString(const ALen: Integer; ARandOpts: TATRandomOptions =
    [roAlphaLC, roAlphaUC, roNumbers, roSymbols]): String;
/// <summary>
///   Reverses the string passed in the AValue parameter.
/// </summary>
/// <param name="AValue">
///   The string to reverse.
/// </param>
/// <returns>
///   A reversed version of AValue.
/// </returns>
function ReverseString(AValue: string): String;

function WinTextToUnixText(const AValue: String): String;

function IsWindowsText(const AValue: String): Boolean;

function IsUnixText(const AValue: String): Boolean;

function TextHasLineBreaks(const AValue: String): Boolean;

function UnixTextToWinText(const AValue: String): string;

implementation

uses
  System.SysUtils, System.StrUtils;

function RandomString(const ALen: Integer; ARandOpts: TATRandomOptions =
    [roAlphaLC, roAlphaUC, roNumbers, roSymbols]): String;
const
  AlphaLC = 'abcdefghijklmnopqrstuvwxyz';       //Uppercase letters...
  AlphaUC = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';       //Lowercase letters...
  Nums    = '1234567890';                       //Numbers...
  Syms    = '~`!@#$%^&*()-_=+[{]}\|;:",<.>/?';  //Special symbols...
var
  ACharSet: String;       //Holds the charset to use...
  Idx, CharNum: Integer;  //Temp indexing vars...
begin
  Randomize;            //Randomize the random number generator...

  Result := EmptyStr;   //Set result to empty string...

  ACharSet := EmptyStr; //Set charset to empty string...

  //Include lowercase letters???
  if (roAlphaLC IN ARandOpts) then ACharSet := ACharSet + AlphaLC;

  //Include uppercase letters???
  if (roAlphaUC IN ARandOpts) then ACharSet := ACharSet + AlphaUC;

  //Include numbers???
  if (roNumbers IN ARandOpts) then ACharSet := ACharSet + Nums;

  //Include special symbols???
  if (roSymbols IN ARandOpts) then ACharSet := ACharSet + Syms;

  //Loop ALen times to generate a random string...
  for Idx := 1 to ALen do
    begin
      //Get a random charset character index...
      CharNum := Random(Length(ACharSet)) + 1;

      //Append the charset character at CharNum to the result string...
      Result := Result + ACharSet[CharNum];
    end;
end;

function ReverseString(AValue: String): String;
var
  AIsWinText: Boolean;
begin

  AIsWinText := IsWindowsText(AValue);

  if (AIsWinText) then
    Result := WinTextToUnixText(AValue)
  else
    Result := AValue;

  Result := System.StrUtils.ReverseString(Result);

  if (AIsWinText) then
    Result := UnixTextToWinText(Result);

end;

function WinTextToUnixText(const AValue: String): String;
begin
  if (NOT IsWindowsText(AValue)) then
    Exit(AValue);

  Result := ReplaceText(AValue, #13#10, #10);
end;

function IsWindowsText(const AValue: String): Boolean;
begin
  Result := ContainsText(AValue, #13#10);
end;

function IsUnixText(const AValue: String): Boolean;
begin
  Result := ( (NOT IsWindowsText(AValue)) AND
              (ContainsText(AValue, #10)) );
end;

function TextHasLineBreaks(const AValue: String): Boolean;
begin
  Result := ( (ContainsText(AValue, #10)) OR
              (ContainsText(AValue, #13)) );
end;

function UnixTextToWinText(const AValue: String): string;
begin
  if (NOT IsUnixText(AValue)) then
    Exit(AValue);

  Result := ReplaceText(AValue, #10, #13#10);
end;





end.
