// ****************************************************************************
//
// Program Name   : - AT Library -
// Program Version: 1.00
// Filenames      : AT.Windows.System.pas
// File Version   : 1.00
// Date Created   : 26-JAN-2014
// Author         : Matthew S. Vesperman
//
// Description:
//
// Angelic Tech system functions... (Migrated from SSSysUtils.pas)
//
// Revision History:
//
// v1.00   :   Initial version for Delphi XE5.
//
// ****************************************************************************
//
// COPYRIGHT © 2013-Present Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ****************************************************************************

unit AT.Windows.System;

interface

uses
  System.Classes, System.Types;

/// <summary>
/// Retrieves the date/time AFilename was last modified.
/// </summary>
/// <param name="AFilename">
/// The name of the file to inspect.
/// </param>
/// <returns>
/// Returns the date/time that AFilename was last modified.
/// </returns>
function FileLastModified(const AFilename: String): TDateTime;

/// <summary>
/// Retrieves the location of the AppData folder. If ACommon is TRUE then
/// return the AppData folder for all users. The value of AAppPath is
/// appended to the value and the directory tree is forced to exist.
/// </summary>
/// <param name="AAppPath">
/// The sub-folder location within AppData to use.
/// </param>
/// <param name="ACommon">
/// If TRUE then then we use the All Users app data folder, otherwise we use
/// the user's roaming app data location.
/// </param>
/// <returns>
/// Returns a  string containing the path to the app data location.
/// </returns>
function GetAppDataPath(const AAppPath: String = '';
  ACommon: Boolean = False): String;
function GetAppDataDirectory(const AAppPath: String = '';
  ACommon: Boolean = False): String;


/// <summary>
/// Retrieves the location of the Documents folder. If ACommon is TRUE then
/// return the Documents folder for all users. The value of ADocPath is
/// appended to the value and the directory tree is forced to exist.
/// </summary>
/// <param name="ADocPath">
/// The sub-folder location within Documents to use.
/// </param>
/// <param name="ACommon">
/// If TRUE then then we use the All Users document folder, otherwise we use
/// the user's document location.
/// </param>
/// <returns>
/// Returns a  string containing the path to the document location.
/// </returns>
function GetDocumentPath(const ADocPath: String = '';
  ACommon: Boolean = False): String;
function GetProgramFilesPath: String;

/// <summary>
/// Converts APoint to a string.
/// </summary>
/// <param name="APoint">
/// The point to convert.
/// </param>
/// <returns>
/// Returns a string formatted as 'APoint.X,APoint.Y'
/// </returns>
function PointToStr(const APoint: TPoint): String;

/// <summary>
/// Generates a "random" component name.
/// </summary>
/// <param name="APrefix">
/// The prefix to prepend to the component name. If no prefix is specified
/// then the prefix is 'Component'.
/// </param>
/// <returns>
/// Returns the component name as a string.
/// </returns>
/// <remarks>
/// Actually returns a string where the name is the prefix + the current
/// date/time formatted as 'yyyymmdd_hhnnsszzz'.
/// </remarks>
function RandomComponentName(const APrefix: String = ''): String;

/// <summary>
/// Splits AString into a stringlist of values.
/// </summary>
/// <param name="AString">
/// The string to tokenize.
/// </param>
/// <param name="ADelim">
/// The character to split at.
/// </param>
/// <param name="ATokens">
/// A variable pointing to a stringlist to receive the results.
/// </param>
procedure StrTokens(const AString: String; const ADelim: Char;
  var ATokens: TStrings);

/// <summary>
/// Converts AStr to a point value.
/// </summary>
/// <param name="AStr">
/// The string to convert.
/// </param>
/// <returns>
/// Returns a point value. If the string cannot be converted an exception of
/// EConvertError is raised.
/// </returns>
function StrToPoint(const AStr: String): TPoint;

implementation

uses
  System.SysUtils, Winapi.SHFolder, Winapi.Windows, System.RegularExpressions;

function FileLastModified(const AFilename: String): TDateTime;
begin
  if (NOT FileAge(AFilename, Result)) then
    Result := 0;
end;

function GetAppDataPath(const AAppPath: String = '';
  ACommon: Boolean = False): String;
var
  iFolderID: Integer;
  AFolder  : array [0 .. MAX_PATH] of Char;
begin

  AFolder := '';

  if (ACommon) then
    iFolderID := CSIDL_COMMON_APPDATA
  else
    iFolderID := CSIDL_APPDATA;

  if (Succeeded(SHGetFolderPath(0, iFolderID, 0, SHGFP_TYPE_CURRENT,
        @AFolder[0]))) then
    begin
      Result := AFolder;
      Result := IncludeTrailingPathDelimiter(Result);
      Result := Format('%s%s', [Result, AAppPath]);
      ForceDirectories(Result);
    end
  else
    begin
      Result := '';
    end;
end;

function GetAppDataDirectory(const AAppPath: String = '';
  ACommon: Boolean = False): String;
begin
  Result := GetAppDataPath(AAppPath, ACommon);
end;


function GetDocumentPath(const ADocPath: String = '';
  ACommon: Boolean = False): String;
var
  iFolderID: Integer;
  AFolder  : array [0 .. MAX_PATH] of Char;
begin

  AFolder := '';

  if (ACommon) then
    iFolderID := CSIDL_COMMON_DOCUMENTS
  else
    iFolderID := CSIDL_PERSONAL;

  if (Succeeded(SHGetFolderPath(0, iFolderID, 0, SHGFP_TYPE_CURRENT,
        @AFolder[0]))) then
    begin
      Result := AFolder;
      Result := IncludeTrailingPathDelimiter(Result);
      Result := Format('%s%s', [Result, ADocPath]);
      ForceDirectories(Result);
    end
  else
    begin
      Result := '';
    end;
end;

function GetProgramFilesPath: String;
var
  iFolderID: Integer;
  AFolder  : array [0 .. MAX_PATH] of Char;
begin

  AFolder := '';

  iFolderID := CSIDL_PROGRAM_FILES;

  if (Succeeded(SHGetFolderPath(0, iFolderID, 0, SHGFP_TYPE_CURRENT,
        @AFolder[0]))) then
    begin
      Result := AFolder;
    end
  else
    begin
      Result := EmptyStr;
    end;
end;

function PointToStr(const APoint: TPoint): String;
begin
  Result := Format('%d,%d', [APoint.X, APoint.Y]);
end;

function RandomComponentName(const APrefix: String = ''): String;
const
  sFmt = 'yyyymmdd_hhnnsszzz';
var
  sVal: String;
begin
  DateTimeToString(sVal, sFmt, Now);

  if (APrefix <> '') then
    sVal := APrefix + sVal
  else
    sVal := 'Component' + sVal;

  Result := sVal;

end;

procedure StrTokens(const AString: String; const ADelim: Char;
  var ATokens: TStrings);
var
  ATokStr: String;
  APos   : Integer;
  AToken : String;
begin
  ATokStr := AString;
  ATokens.Clear;

  APos := Pos(ADelim, ATokStr);

  while (APos > 0) do
    begin
      AToken := Copy(ATokStr, 1, APos - 1);
      Delete(ATokStr, 1, APos);

      ATokens.Add(AToken);

      APos := Pos(ADelim, ATokStr);

    end;

  if (Length(ATokStr) > 0) then
    ATokens.Add(ATokStr);

end;

function StrToPoint(const AStr: String): TPoint;
var
  Idx         : Integer;
  AXStr, AYStr: String;
  AX, AY      : Integer;
begin
  Idx := Pos(',', AStr);
  if (Idx > 0) then
    begin
      AXStr := Copy(AStr, 1, Idx - 1);
      AYStr := Copy(AStr, Idx + 1, Length(AStr));

      try

        AX := StrToInt(AXStr);
        AY := StrToInt(AYStr);

        Result := Point(AX, AY);

      except
        raise EConvertError.Create('Invalid Point string');
      end;
    end
  else
    begin
      raise EConvertError.Create('Invalid Point string');
    end;
end;

end.
