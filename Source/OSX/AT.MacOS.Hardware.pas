//Only compile for the OS X platform.
{$IF ( (NOT Defined(MACOS)) OR (Defined(IOS)) )}
  {$MESSAGE Fatal 'AT.MacOS.Hardware.pas only compiles for the OS X platform.'}
{$ENDIF}

// ******************************************************************
//
// Program Name   : Angelic Tech Mac OS X Library
// Program Version: 2017
// Platform(s)    : OS X
// Framework      : None
//
// Filename       : AT.MacOS.Hardware.pas
// File Version   : 2017.04
// Date Created   : 13-Apr-2017
// Author         : Matthew Vesperman
//
// Description:
//
// Mac OS X hardware information routines.
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
///   Contains Mac OS X hardware information routines.
/// </summary>
unit AT.MacOS.Hardware;

interface

type
  /// <summary>
  ///   Indicates the type of system hardware infor we are looking
  ///   for.
  /// </summary>
  TMacHWInfoType = (
    /// <summary>
    ///   Retrieve the computer's model name.
    /// </summary>
    hwitModelName,
    /// <summary>
    ///   Retrieve the computer's model identifier.
    /// </summary>
    hwitModelID,
    /// <summary>
    ///   Retrieve the processor's name.
    /// </summary>
    hwitProcName,
    /// <summary>
    ///   Retrieve the processor's speed.
    /// </summary>
    hwitProcSpeed,
    /// <summary>
    ///   Retrieve the number of physical processors.
    /// </summary>
    hwitProcCount,
    /// <summary>
    ///   Retrieve the numbers of cores per physical processor.
    /// </summary>
    hwitCoreCount,
    /// <summary>
    ///   Retrieve the amount of L2 cache per
    ///   processor core.
    /// </summary>
    hwitL2Cache,
    /// <summary>
    ///   Retrieve the amount of L3 cache.
    /// </summary>
    hwitL3Cache,
    /// <summary>
    ///   Retrieve the amount of physical RAM.
    /// </summary>
    hwitMemSize,
    /// <summary>
    ///   Retrieve the boot ROM version.
    /// </summary>
    hwitBootROMVer,
    /// <summary>
    ///   Retrieve the system's SMC version.
    /// </summary>
    hwitSMCVer,
    /// <summary>
    ///   Retrieve the computer's system serial number.
    /// </summary>
    hwitSerialNumber,
    /// <summary>
    ///   Retrieve the computer's hardware ID. (UUID)
    /// </summary>
    hwitUUID);

/// <summary>
///   Retrieves the boot ROM version.
/// </summary>
/// <returns>
///   A string containing the system's boot ROM version information.
/// </returns>
/// <seealso cref="AT.MacOS.Hardware|TMacHWInfoType">
///   TMacHWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Hardware|GetHWDataItem(TMacHWInfoType)">
///   GetHWDataItem
/// </seealso>
function GetHWBootROMVersion: String;
/// <summary>
///   Retrieves the number of cores per physical processor.
/// </summary>
/// <returns>
///   The number of cores per physical processor.
/// </returns>
/// <seealso cref="AT.MacOS.Hardware|TMacHWInfoType">
///   TMacHWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Hardware|GetHWDataItem(TMacHWInfoType)">
///   GetHWDataItem
/// </seealso>
function GetHWCoreCount: Integer;
/// <summary>
///   Executes the system_profiler OS utility to retrieve hardware
///   information.
/// </summary>
/// <returns>
///   A string containing the output from the system_profiler system
///   utility.
/// </returns>
/// <seealso cref="AT.MacOS.Hardware|GetHWDataItem(TMacHWInfoType)">
///   GetHWDataItem
/// </seealso>
function GetHWData: String;
/// <summary>
///   Retrieves the specified hardware information as a string.
/// </summary>
/// <param name="AHWInfoType">
///   The type of hardware information to return.
/// </param>
/// <returns>
///   The specified hardware information as a string.
/// </returns>
/// <seealso cref="AT.MacOS.Hardware|TMacHWInfoType">
///   TMacHWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Hardware|GetHWData">
///   GetHWData
/// </seealso>
function GetHWDataItem(AHWInfoType: TMacHWInfoType): String;
/// <summary>
///   Retrieves the amount of L2 cache per processor core.
/// </summary>
/// <returns>
///   The amount (in bytes) of L2 cache per processor core.
/// </returns>
/// <seealso cref="AT.MacOS.Hardware|TMacHWInfoType">
///   TMacHWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Hardware|GetHWDataItem(TMacHWInfoType)">
///   GetHWDataItem
/// </seealso>
/// <seealso cref="AT.MacOS.Hardware|GetHWL2CacheStr">
///   GetHWL2CacheStr
/// </seealso>
function GetHWL2Cache: Integer;
/// <summary>
///   Retrieves the amount of L2 cache per processor core as a
///   string.
/// </summary>
/// <returns>
///   The amount (as returned by system_profiler) of L2 cache per
///   processor core.
/// </returns>
/// <seealso cref="AT.MacOS.Hardware|TMacHWInfoType">
///   TMacHWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Hardware|GetHWDataItem(TMacHWInfoType)">
///   GetHWDataItem
/// </seealso>
/// <seealso cref="AT.MacOS.Hardware|GetHWL2Cache">
///   GetHWL2Cache
/// </seealso>
function GetHWL2CacheStr: String;
/// <summary>
///   Retrieves the amount of L3 cache.
/// </summary>
/// <returns>
///   The amount (in bytes) of L3 cache.
/// </returns>
/// <seealso cref="AT.MacOS.Hardware|TMacHWInfoType">
///   TMacHWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Hardware|GetHWDataItem(TMacHWInfoType)">
///   GetHWDataItem
/// </seealso>
/// <seealso cref="AT.MacOS.Hardware|GetHWL3CacheStr">
///   GetHWL3CacheStr
/// </seealso>
function GetHWL3Cache: Integer;
/// <summary>
///   Retrieves the amount of L3 cache as a string.
/// </summary>
/// <returns>
///   The amount (as returned by system_profiler) of L3 cache.
/// </returns>
/// <seealso cref="AT.MacOS.Hardware|TMacHWInfoType">
///   TMacHWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Hardware|GetHWDataItem(TMacHWInfoType)">
///   GetHWDataItem
/// </seealso>
/// <seealso cref="AT.MacOS.Hardware|GetHWL3Cache">
///   GetHWL3Cache
/// </seealso>
function GetHWL3CacheStr: String;
/// <summary>
///   Retrieves the amount of physical RAM.
/// </summary>
/// <returns>
///   The amount (in bytes) of physical RAM.
/// </returns>
/// <seealso cref="AT.MacOS.Hardware|TMacHWInfoType">
///   TMacHWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Hardware|GetHWDataItem(TMacHWInfoType)">
///   GetHWDataItem
/// </seealso>
/// <seealso cref="AT.MacOS.Hardware|GetHWMemorySizeStr">
///   GetHWMemorySizeStr
/// </seealso>
function GetHWMemorySize: Int64;
/// <summary>
///   Retrieves the amount of physical RAM as a string.
/// </summary>
/// <returns>
///   The amount (as returned by system_profiler) of physical RAM.
/// </returns>
/// <seealso cref="AT.MacOS.Hardware|TMacHWInfoType">
///   TMacHWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Hardware|GetHWDataItem(TMacHWInfoType)">
///   GetHWDataItem
/// </seealso>
/// <seealso cref="AT.MacOS.Hardware|GetHWMemorySize">
///   GetHWMemorySize
/// </seealso>
function GetHWMemorySizeStr: String;
/// <summary>
///   Retrieves the computer's hardware model identifier.
/// </summary>
/// <returns>
///   A string containing the computer's model identifier.
/// </returns>
/// <seealso cref="AT.MacOS.Hardware|TMacHWInfoType">
///   TMacHWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Hardware|GetHWDataItem(TMacHWInfoType)">
///   GetHWDataItem
/// </seealso>
function GetHWModelID: String;
/// <summary>
///   Retrieves the computer's hardware model name.
/// </summary>
/// <returns>
///   A string containing the computer's model name.
/// </returns>
/// <seealso cref="AT.MacOS.Hardware|TMacHWInfoType">
///   TMacHWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Hardware|GetHWDataItem(TMacHWInfoType)">
///   GetHWDataItem
/// </seealso>
function GetHWModelName: String;
/// <summary>
///   Retrieves the number of physical processors.
/// </summary>
/// <returns>
///   The number of physical processors.
/// </returns>
/// <seealso cref="AT.MacOS.Hardware|TMacHWInfoType">
///   TMacHWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Hardware|GetHWDataItem(TMacHWInfoType)">
///   GetHWDataItem
/// </seealso>
function GetHWProcessorCount: Integer;
/// <summary>
///   Retrieves the processor's model name.
/// </summary>
/// <returns>
///   A string containing the processor's model name.
/// </returns>
/// <seealso cref="AT.MacOS.Hardware|TMacHWInfoType">
///   TMacHWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Hardware|GetHWDataItem(TMacHWInfoType)">
///   GetHWDataItem
/// </seealso>
function GetHWProcessorName: String;
/// <summary>
///   Retrieves the processor's speed.
/// </summary>
/// <returns>
///   The processor's speed (in hertz).
/// </returns>
/// <seealso cref="AT.MacOS.Hardware|TMacHWInfoType">
///   TMacHWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Hardware|GetHWDataItem(TMacHWInfoType)">
///   GetHWDataItem
/// </seealso>
/// <seealso cref="AT.MacOS.Hardware|GetHWProcessorSpeedStr">
///   GetHWProcessorSpeedStr
/// </seealso>
function GetHWProcessorSpeed: Extended;
/// <summary>
///   Retrieves the processor's speed as a string.
/// </summary>
/// <returns>
///   The processor's speed (as returned by system_profiler).
/// </returns>
/// <seealso cref="AT.MacOS.Hardware|TMacHWInfoType">
///   TMacHWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Hardware|GetHWDataItem(TMacHWInfoType)">
///   GetHWDataItem
/// </seealso>
/// <seealso cref="AT.MacOS.Hardware|GetHWProcessorSpeed">
///   GetHWProcessorSpeed
/// </seealso>
function GetHWProcessorSpeedStr: String;
/// <summary>
///   Retrieves the system's serial number.
/// </summary>
/// <returns>
///   A string containing the system's serial number.
/// </returns>
/// <seealso cref="AT.MacOS.Hardware|TMacHWInfoType">
///   TMacHWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Hardware|GetHWDataItem(TMacHWInfoType)">
///   GetHWDataItem
/// </seealso>
function GetHWSerialNumber: String;
/// <summary>
///   Retrieves the system's SMC version.
/// </summary>
/// <returns>
///   A string containing the system's SMC version information.
/// </returns>
/// <seealso cref="AT.MacOS.Hardware|TMacHWInfoType">
///   TMacHWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Hardware|GetHWDataItem(TMacHWInfoType)">
///   GetHWDataItem
/// </seealso>
function GetHWSMCVersion: String;
/// <summary>
///   Retrieves the system's universally-unique id (UUID).
/// </summary>
/// <returns>
///   A string containing the system's universally-unique id (UUID).
/// </returns>
/// <seealso cref="AT.MacOS.Hardware|TMacHWInfoType">
///   TMacHWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Hardware|GetHWDataItem(TMacHWInfoType)">
///   GetHWDataItem
/// </seealso>
function GetHWUUID: String;

implementation

uses
  System.Classes, AT.GarbageCollector, AT.MacOS, System.StrUtils,
  System.SysUtils, System.Math, FMX.Dialogs;


var
  HWInfo: TStrings;
  ModuleGC: IATGarbageCollector;


function GetBinMultiplier(Value: String): Integer;
begin
  if (ContainsText(Value, 'KB')) then
    begin
      Exit(1024);
    end
  else if (ContainsText(Value, 'MB')) then
    begin
      Exit(Sqr(1024));
    end
  else if (ContainsText(Value, 'GB')) then
    begin
      Exit(Trunc(Power(1024, 3)));
    end
  else
    Result := 1;
end;

function GetDecMultiplier(Value: String): Integer;
begin
  if (ContainsText(Value, 'KHz')) then
    begin
      Exit(Trunc(Power10(1, 3)));
    end
  else if (ContainsText(Value, 'MHz')) then
    begin
      Exit(Trunc(Power10(1, 6)));
    end
  else if (ContainsText(Value, 'GHz')) then
    begin
      Exit(Trunc(Power10(1, 9)));
    end
  else
    Result := 1;
end;

function GetHWBootROMVersion: String;
begin
  Result := GetHWDataItem(hwitBootROMVer);
end;

function GetHWCoreCount: Integer;
var
  AData: String;
begin
  AData := GetHWDataItem(hwitCoreCount);

  if (NOT TryStrToInt(AData, Result)) then
    Exit (-1);
end;

function GetHWData: String;
var
  AOutput, AError: String;
begin
  if (NOT Assigned(HWInfo)) then
    begin
      HWInfo := TATGC.Collect(TStringList.Create, ModuleGC);

      ExecuteTaskAndWait('/usr/sbin/system_profiler',
                         ['SPHardwareDataType'],
                         AOutput, AError);

      HWInfo.Text := AOutput;
    end;

  Result := HWInfo.Text;
end;

function GetHWDataItem(AHWInfoType: TMacHWInfoType): String;
var
  AStrLst: TStrings;
  AGC: IATGarbageCollector;
  ASearchStr, AStr: String;
  APos: Integer;
begin
  AStrLst := TATGC.Collect(TStringList.Create, AGC);

  AStrLst.Text := GetHWData;

  case AHWInfoType of
    hwitModelName: ASearchStr :='Model Name';
    hwitModelID: ASearchStr :='Model Identifier';
    hwitProcName: ASearchStr :='Processor Name';
    hwitProcSpeed: ASearchStr :='Processor Speed';
    hwitProcCount: ASearchStr :='Number of Processors';
    hwitCoreCount: ASearchStr :='Total Number of Cores';
    hwitL2Cache: ASearchStr :='L2 Cache';
    hwitL3Cache: ASearchStr :='L3 Cache';
    hwitMemSize: ASearchStr :='Memory';
    hwitBootROMVer: ASearchStr :='Boot ROM';
    hwitSMCVer: ASearchStr :='SMC Version';
    hwitSerialNumber: ASearchStr := 'Serial Number';
    hwitUUID: ASearchStr :='Hardware UUID';
  else
    Exit(AStrLst.Text);  //Should never happen...
  end;

  for AStr in AStrLst do
    begin
      if (ContainsText(AStr, ASearchStr)) then
        begin
          APos := Pos(':', AStr);

          if (APos > 0) then
            Result := Copy(AStr, APos + 1, Length(AStr))
          else
            Result := AStr;

          Result := Trim(Result);

          Exit(Result);
        end;
    end;

  Result := '';
end;

function GetHWL2Cache: Integer;
var
  AData: String;
  AMultiplier, APos: Integer;
begin
  AData := GetHWL2CacheStr;

  AMultiplier := GetBinMultiplier(AData);

  APos := Pos(' ', AData);

  Delete(AData, APos, Length(AData));

  if (NOT TryStrToInt(AData, Result)) then
    Exit(-1);

  Result := Result * AMultiplier;
end;

function GetHWL2CacheStr: String;
begin
  Result := GetHWDataItem(hwitL2Cache);
end;

function GetHWL3Cache: Integer;
var
  AData: String;
  AMultiplier, APos: Integer;
begin
  AData := GetHWL3CacheStr;

  AMultiplier := GetBinMultiplier(AData);

  APos := Pos(' ', AData);

  Delete(AData, APos, Length(AData));

  if (NOT TryStrToInt(AData, Result)) then
    Exit(-1);

  Result := Result * AMultiplier;
end;

function GetHWL3CacheStr: String;
begin
  Result := GetHWDataItem(hwitL3Cache);
end;

function GetHWMemorySize: Int64;
var
  AData: String;
  APos: Integer;
  AMultiplier, iData: Int64;
begin
  AData := GetHWMemorySizeStr;

  AMultiplier := GetBinMultiplier(AData);

  APos := Pos(' ', AData);

  Delete(AData, APos, Length(AData));

  if (NOT TryStrToInt64(AData, iData)) then
    begin
      Exit(-1);
    end;

  Result := (iData * AMultiplier);
end;

function GetHWMemorySizeStr: String;
begin
  Result := GetHWDataItem(hwitMemSize);
end;

function GetHWModelID: String;
begin
  Result := GetHWDataItem(hwitModelID);
end;

function GetHWModelName: String;
begin
  Result := GetHWDataItem(hwitModelName);
end;

function GetHWProcessorCount: Integer;
var
  AData: String;
begin
  AData := GetHWDataItem(hwitProcCount);

  if (NOT TryStrToInt(AData, Result)) then
    Exit (-1);
end;

function GetHWProcessorName: String;
begin
  Result := GetHWDataItem(hwitProcName);
end;

function GetHWProcessorSpeed: Extended;
var
  AData: String;
  AMultiplier, APos: Integer;
begin
  AData := GetHWProcessorSpeedStr;

  AMultiplier := GetDecMultiplier(AData);

  APos := Pos(' ', AData);

  Delete(AData, APos, Length(AData));

  if (NOT TryStrToFloat(AData, Result)) then
    Exit(-1);

  Result := Result * AMultiplier;
end;

function GetHWProcessorSpeedStr: String;
begin
  Result := GetHWDataItem(hwitProcSpeed);
end;

function GetHWSerialNumber: String;
begin
  Result := GetHWDataItem(hwitSerialNumber);
end;

function GetHWSMCVersion: String;
begin
  Result := GetHWDataItem(hwitSMCVer);
end;

function GetHWUUID: String;
begin
  Result := GetHWDataItem(hwitUUID);
end;



end.
