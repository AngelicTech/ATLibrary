// ******************************************************************
//
// Program Name   : $ProgramName$
// Platform(s)    : $Platforms$
// Framework      : None
//
// Filename       : AT.$ShortName$.Config..pas
// File Version   : 1.00
// Date Created   : $CreateDate$
// Author         : Matthew Vesperman
//
// Description:
//
// Configuration sub-system.
//
// Revision History:
//
// v1.00   :   Initial version
//
// ******************************************************************
//
// COPYRIGHT © $Year$ - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************


/// <summary>
///   Configuration sub-system.
/// </summary>
unit AT.ShortName.Config;

interface

uses
  AT.Config.Storage.Custom;


/// <summary>
///   Returns a reference to a configuration object.
/// </summary>
/// <param name="AllUsers">
///   <para>
///     Passing TRUE will return a reference to the configuration
///     object that stores settings common to all users.
///   </para>
///   <para>
///     Passing FALSE will return a reference to the configuration
///     object that stores the current user's settings.
///   </para>
/// </param>
function Config(
  const AllUsers: Boolean = False): TATCustomConfigStorage;

implementation

uses
  System.SysUtils, AT.Config.Storage.SQLite3, AT.XPlatform.Folders,
  AT.GarbageCollector, AT.ShortName.Consts,
  AT.ShortName.Config.Consts;

var
  /// <summary>
  ///   Module level garbage collector object.
  /// </summary>
  MGC: IATGarbageCollector;
  /// <summary>
  ///   Stores a reference to the configuration object that stores
  ///   settings common to all users.
  /// </summary>
  AAllUsersCfg: TATCustomConfigStorage;
  /// <summary>
  ///   Stores a reference to the configuration object that stores
  ///   the current user's settings.
  /// </summary>
  ACurrUserConfig: TATCustomConfigStorage;


/// <summary>
///   Calculates the correct filename for a configuration file.
/// </summary>
/// <param name="AllUsers">
///   <para>
///     Passing TRUE will return the filename of the configuration
///     file that stores settings common to all users.
///   </para>
///   <para>
///     Passing FALSE will return the filename of the configuration
///     file that stores the current user's settings.
///   </para>
/// </param>
function CfgFilename(AllUsers: Boolean = False): String;
var
  AFN: String;
begin
  //Get appdata folder.
  //AllUsers determines if all user's or current user...
  AFN := AT.XPlatform.Folders.GetAppDataDirectory(cAppDataFolder,
    AllUsers);

  //Ensure trailing path delimiter is included...
  AFN := IncludeTrailingPathDelimiter(AFN);

  //Calculate actual config filename...
  AFN := Format(cConfigFNFmt, [AFN]);

  //Return filename...
  Result := AFN;
end;

function Config(
  const AllUsers: Boolean = False): TATCustomConfigStorage;
var
  AFileName: String;
begin
  AFileName := CfgFilename(AllUsers);   //Calculate filename...

  //Requesting AllUsers config???
  if (AllUsers) then
    begin //Yes, AllUsers...
      //Does AllUsers config exist?
      if (NOT Assigned(AAllUsersCfg)) then
        //No, create it...
        AAllUsersCfg := TATGC.Collect(TATConfigSQLite3Storage.Create(
            AFileName, cCfgMutex, cCfgEncryptKey), MGC);

      //Return AllUsers Config object...
      Exit(AAllUsersCfg);
    end
  else
    begin //No, CurrentUser...
      //Does CurrentUser config exist?
      if (NOT Assigned(ACurrUserConfig)) then
        //No, create it...
        ACurrUserConfig := TATGC.Collect(
            TATConfigSQLite3Storage.Create(AFileName, cCfgMutex,
            cCfgEncryptKey), MGC);

      //Return CurrentUser config object...
      Result := ACurrUserConfig;
    end;
end;

end.
