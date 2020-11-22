//Only compile for the OS X platform.
{$IF ( (NOT Defined(MACOS)) OR (Defined(IOS)) )}
  {$MESSAGE Fatal 'AT.MacOS.Software.pas only compiles for the OS X platform.'}
{$ENDIF}

// ******************************************************************
//
// Program Name   : Angelic Tech Mac OS X Library
// Program Version: 2017
// Platform(s)    : OS X
// Framework      : None
//
// Filename       : AT.MacOS.Software.pas
// File Version   : 2017.04
// Date Created   : 14-Apr-2017
// Author         : Matthew Vesperman
//
// Description:
//
// Mac OS X software information routines.
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
///   Contains Mac OS X software information routines.
/// </summary>
unit AT.MacOS.Software;

interface

type
  TMacSWInfoType = (
    /// <summary>
    ///   Retrieve the system version.
    /// </summary>
    switSysVer,
    /// <summary>
    ///   Retrieve the kernel version.
    /// </summary>
    switKernelVer,
    /// <summary>
    ///   Retrieve the boot volume name.
    /// </summary>
    switBootVol,
    /// <summary>
    ///   Retrieve the boot mode.
    /// </summary>
    switBootMode,
    /// <summary>
    ///   Retrieve the computer's host name.
    /// </summary>
    switCompName,
    /// <summary>
    ///   Retrieve the current user name.
    /// </summary>
    switUserName,
    /// <summary>
    ///   Retrieve the flag indicating if the system
    ///   is using secure virtual memory.
    /// </summary>
    switSecureVirtMem,
    /// <summary>
    ///   Retrieve the flag indicating if the system is using system
    ///   integrity protection.
    /// </summary>
    switSysIntProt,
    /// <summary>
    ///   Retrieve the time since boot up.
    /// </summary>
    switUptime);

/// <summary>
///   Retrieves the boot mode.
/// </summary>
/// <returns>
///   A string containing the boot mode.
/// </returns>
/// <seealso cref="AT.MacOS.Software|TMacSWInfoType">
///   TMacSWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Software|GetSWDataItem">
///   GetSWDataItem
/// </seealso>
function GetSWBootMode: String;
/// <summary>
///   Retrieves the boot volume name.
/// </summary>
/// <returns>
///   A string containing the boot volume name.
/// </returns>
/// <seealso cref="AT.MacOS.Software|TMacSWInfoType">
///   TMacSWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Software|GetSWDataItem">
///   GetSWDataItem
/// </seealso>
function GetSWBootVolume: string;
/// <summary>
///   Retrieves the computer's host name.
/// </summary>
/// <returns>
///   A string containing the computer's host name.
/// </returns>
/// <seealso cref="AT.MacOS.Software|TMacSWInfoType">
///   TMacSWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Software|GetSWDataItem">
///   GetSWDataItem
/// </seealso>
function GetSWComputerName: String;
/// <summary>
///   Executes the system_profiler OS utility to retrieve software
///   information.
/// </summary>
/// <returns>
///   A string containing the output from the system_profiler system
///   utility.
/// </returns>
/// <seealso cref="AT.MacOS.Software|TMacSWInfoType">
///   TMacSWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Software|GetSWDataItem">
///   GetSWDataItem
/// </seealso>
function GetSWData: String;
/// <summary>
///   Retrieves the specified software information as a string.
/// </summary>
/// <param name="ASWInfoType">
///   The type of software information to return.
/// </param>
/// <returns>
///   The specified hardware information as a string. <br />
/// </returns>
/// <seealso cref="AT.MacOS.Software|TMacSWInfoType">
///   TMacSWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Software|GetSWData">
///   GetSWData
/// </seealso>
function GetSWDataItem(ASWInfoType: TMacSWInfoType): String;
/// <summary>
///   Retrieves the kernel version.
/// </summary>
/// <returns>
///   A string containing the kernel version information.
/// </returns>
/// <seealso cref="AT.MacOS.Software|TMacSWInfoType">
///   TMacSWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Software|GetSWDataItem">
///   GetSWDataItem
/// </seealso>
function GetSWKernelVersion: string;
/// <summary>
///   Retrieves the system version.
/// </summary>
/// <returns>
///   A string containing the system version information.
/// </returns>
/// <seealso cref="AT.MacOS.Software|TMacSWInfoType">
///   TMacSWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Software|GetSWDataItem">
///   GetSWDataItem
/// </seealso>
function GetSWSystemVersion: String;
/// <summary>
///   Retrieves the time since boot (uptime) as a string.
/// </summary>
/// <returns>
///   A string containing the time since boot (uptime.)
/// </returns>
/// <seealso cref="AT.MacOS.Software|TMacSWInfoType">
///   TMacSWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Software|GetSWDataItem">
///   GetSWDataItem
/// </seealso>
function GetSWTimeSinceBootStr: string;
/// <summary>
///   Retrieves the current user name.
/// </summary>
/// <returns>
///   A string containing the current user's name.
/// </returns>
/// <seealso cref="AT.MacOS.Software|TMacSWInfoType">
///   TMacSWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Software|GetSWDataItem">
///   GetSWDataItem
/// </seealso>
function GetSWUserName: String;
/// <summary>
///   Retrieves the flag indicating if the system is using secure
///   virtual memory. <br />
/// </summary>
/// <returns>
///   TRUE if secure virtual memory is enabled, FALSE otherwise.
/// </returns>
/// <seealso cref="AT.MacOS.Software|TMacSWInfoType">
///   TMacSWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Software|GetSWDataItem">
///   GetSWDataItem
/// </seealso>
/// <seealso cref="AT.MacOS.Software|SWSecureVirtualMemoryStr">
///   SWSecureVirtualMemoryStr
/// </seealso>
function SWSecureVirtualMemoryEnabled: Boolean;
/// <summary>
///   Retrieves the flag (as a string) indicating if the system is
///   using secure virtual memory.
/// </summary>
/// <returns>
///   A string, as returned by system_profiler, indicating if secure
///   virtual memory is enabled.
/// </returns>
/// <seealso cref="AT.MacOS.Software|TMacSWInfoType">
///   TMacSWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Software|GetSWDataItem">
///   GetSWDataItem
/// </seealso>
/// <seealso cref="AT.MacOS.Software|SWSecureVirtualMemoryEnabled">
///   SWSecureVirtualMemoryEnabled
/// </seealso>
function SWSecureVirtualMemoryStr: String;
/// <summary>
///   Retrieve the flag indicating if the system is using system
///   integrity protection. <br />
/// </summary>
/// <returns>
///   TRUE if system integrity protection is enabled, FALSE
///   otherwise.
/// </returns>
/// <seealso cref="AT.MacOS.Software|TMacSWInfoType">
///   TMacSWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Software|GetSWDataItem">
///   GetSWDataItem
/// </seealso>
/// <seealso cref="AT.MacOS.Software|SWSystemIntegrityProtectionStr">
///   SWSystemIntegrityProtectionStr
/// </seealso>
function SWSystemIntegrityProtectionEnabled: Boolean;
/// <summary>
///   Retrieves the flag (as a string) indicating if the system is
///   using system integrity protection.
/// </summary>
/// <returns>
///   A string, as returned by system_profiler, indicating if system
///   integrity protection is enabled. <br />
/// </returns>
/// <seealso cref="AT.MacOS.Software|TMacSWInfoType">
///   TMacSWInfoType
/// </seealso>
/// <seealso cref="AT.MacOS.Software|GetSWDataItem">
///   GetSWDataItem
/// </seealso>
/// <seealso cref="AT.MacOS.Software|SWSystemIntegrityProtectionEnabled">
///   SWSystemIntegrityProtectionEnabled
/// </seealso>
function SWSystemIntegrityProtectionStr: String;


implementation

uses
  System.Classes, AT.GarbageCollector, AT.MacOS, System.StrUtils,
  System.SysUtils, System.Math, FMX.Dialogs;


var
  SWInfo: TStrings;
  ModuleGC: IATGarbageCollector;


function GetBooleanValue(Value: String): Boolean;
begin
  if (NOT TryStrToBool(Value, Result)) then
    begin
      Result := ContainsText(Value, 'Enabled');
    end;
end;

function GetSWBootMode: String;
begin
  Result := GetSWDataItem(switBootMode);
end;

function GetSWBootVolume: string;
begin
  Result := GetSWDataItem(switBootVol);
end;

function GetSWComputerName: string;
begin
  Result := GetSWDataItem(switCompName);
end;

function GetSWData: String;
var
  AOutput, AError: String;
begin
  if (NOT Assigned(SWInfo)) then
    begin
      SWInfo := TATGC.Collect(TStringList.Create, ModuleGC);

      ExecuteTaskAndWait('/usr/sbin/system_profiler',
                         ['SPSoftwareDataType'],
                         AOutput, AError);

      SWInfo.Text := AOutput;
    end;

  Result := SWInfo.Text;
end;

function GetSWDataItem(ASWInfoType: TMacSWInfoType): String;
var
  AStrLst: TStrings;
  AGC: IATGarbageCollector;
  ASearchStr, AStr: String;
  APos: Integer;
begin
  AStrLst := TATGC.Collect(TStringList.Create, AGC);

  AStrLst.Text := GetSWData;

  case ASWInfoType of
    switSysVer: ASearchStr :='System Version';
    switKernelVer: ASearchStr :='Kernel Version';
    switBootVol: ASearchStr :='Boot Volume';
    switBootMode: ASearchStr :='Boot Mode';
    switCompName: ASearchStr :='Computer Name';
    switUserName: ASearchStr :='User Name';
    switSecureVirtMem: ASearchStr :='Secure Virtual Memory';
    switSysIntProt: ASearchStr :='System Integrity Protection';
    switUptime: ASearchStr :='Time since boot';
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

function GetSWKernelVersion: string;
begin
  Result := GetSWDataItem(switKernelVer);
end;

function GetSWSystemVersion: String;
begin
  Result := GetSWDataItem(switSysVer);
end;

function GetSWTimeSinceBootStr: string;
begin
  Result := GetSWDataItem(switUptime);
end;

function GetSWUserName: String;
begin
  Result := GetSWDataItem(switUserName);
end;

function SWSecureVirtualMemoryEnabled: Boolean;
var
  AData: String;
begin
  AData := SWSecureVirtualMemoryStr;

  Result := GetBooleanValue(AData);
end;

function SWSecureVirtualMemoryStr: String;
begin
  Result := GetSWDataItem(switSecureVirtMem);
end;

function SWSystemIntegrityProtectionEnabled: Boolean;
var
  AData: String;
begin
  AData := SWSystemIntegrityProtectionStr;

  Result := GetBooleanValue(AData);
end;

function SWSystemIntegrityProtectionStr: String;
begin
  Result := GetSWDataItem(switSysIntProt);
end;



end.
