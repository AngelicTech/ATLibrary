//Only compile for the ANDROID platform.
{$IF NOT Defined(ANDROID)}
  {$MESSAGE Fatal 'AT.Android.Folders.pas only compiles for the ANDROID platform.'}
{$ENDIF}

// ******************************************************************
//
// Program Name   : AT Library
// Platform(s)    : Android
// Framework      : FMX
//
// Filename       : AT.Android.Folders.pas
// Date Created   : 22-Nov-2020
// Author         : Matthew Vesperman
//
// Description:
//
// Android folder routines.
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
///   Contains routines that return folder paths for the Android
///   platform.
/// </summary>
unit AT.Android.Folders;

interface

/// <summary>
///   Returns either the shared or private documents folder on the
///   Android platform.
/// </summary>
/// <param name="AAppPath">
///   The path to append to the documents folder path. The folder
///   tree passed here will be created if it does not exist. Pass an
///   empty string to get just the documents path.
/// </param>
/// <param name="ACommon">
///   Flag to indicate if we want the shared documents path or the
///   private documents path.
/// </param>
/// <returns>
///   The full path to either the shared or private documents folder
///   for an Android device.
/// </returns>
/// <remarks>
///   <para>
///     If the AAppPath parameter is an empty string then this
///     function returns just the documents folder (either shared
///     or private). If AAppPath contains a value then it is
///     appended to the documents path and the full path is created
///     if it does not exist.
///   </para>
///   <para>
///     If ACommon is set to TRUE then the shared documents folder
///     path is returned, otherwise the private (app) documents
///     folder is returned.
///   </para>
/// </remarks>
/// <seealso cref="AT.Android.Folders|GetDocumentDirectory(string,Boolean)">
///   GetDocumentDirectory
/// </seealso>
function GetAppDataDirectory(AAppPath: String = ''; ACommon: Boolean = False):
    String;
/// <summary>
///   Returns either the shared or private documents folder on the
///   Android platform.
/// </summary>
/// <param name="ADocPath">
///   The path to append to the documents folder path. The folder
///   tree passed here will be created if it does not exist. Pass an
///   empty string to get just the documents path.
/// </param>
/// <param name="ACommon">
///   Flag to indicate if we want the shared documents path or the
///   private documents path.
/// </param>
/// <returns>
///   The full path to either the shared or private documents folder
///   for an Android device.
/// </returns>
/// <remarks>
///   <para>
///     If the ADocPath parameter is an empty string then this
///     function returns just the documents folder (either shared
///     or private). If ADocPath contains a value then it is
///     appended to the documents path and the full path is created
///     if it does not exist.
///   </para>
///   <para>
///     If ACommon is set to TRUE then the shared documents folder
///     path is returned, otherwise the private (app) documents
///     folder is returned.
///   </para>
///   <para>
///     On the Android platform GetDocumentDirectory is an alias to
///     GetAppDataDirectory.
///   </para>
/// </remarks>
/// <seealso cref="AT.Android.Folders|GetAppDataDirectory(string,Boolean)">
///   GetAppDataDirectory
/// </seealso>
function GetDocumentDirectory(const ADocPath: String = '';
  ACommon: Boolean = False): String;

implementation

uses
  System.IOUtils, System.SysUtils;

function GetAppDataDirectory(AAppPath: String = ''; ACommon: Boolean = False):
    String;
begin
  //Are we returning the shared document folder???
  if (ACommon) then
    begin
      //Yes, get the shared documents folder value...
      Result := TPath.GetSharedDocumentsPath;
    end
  else
    begin
      //No, get the private documents folder value...
      Result := TPath.GetDocumentsPath;
    end;

  //Ensure the trailing path delimeter is added to the folder value...
  Result := IncludeTrailingPathDelimiter(Result);

  if (NOT AAppPath.IsEmpty) then
    begin

      //Append the AAppPath value to the folder value...
      Result := Format('%s%s', [Result, AAppPath]);

      //Ensure the trailing path delimeter is added to the folder value...
      Result := IncludeTrailingPathDelimiter(Result);

      //Make sure the path actually exists...
      TDirectory.CreateDirectory(Result);
    end;
end;

function GetDocumentDirectory(const ADocPath: String = '';
  ACommon: Boolean = False): String;
begin
  //Return the value from GetAppDataDirectory...
  Result := GetAppDataDirectory(ADocPath, ACommon);
end;

end.
