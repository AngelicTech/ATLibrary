// ******************************************************************
//
// Program Name   : AT Library
// Program Version:
// Platform(s)    : Win32, Win64, OSX
// Framework      : None
//
// Filename       : AT.SoftwareDNA.XPlatform.pas
// File Version   : 1.00
// Date Created   : 27-APR-2016
// Author         : Matthew S. Vesperman
//
// Description:
//
// Cross platform SoftwareDNA interface.
//
// Revision History:
//
// v1.00   :   Initial version
//
// ******************************************************************
//
// COPYRIGHT © 2015 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

unit AT.SoftwareDNA.XPlatform;

interface

{$IF (Defined(MACOS) AND (NOT Defined(IOS))) OR Defined(MSWINDOWS) }

uses
  AT.SoftwareDNA.Types;

function DNAActivate(Key, Code, Email, Password: String;
  out Error: Integer): Boolean;
function DNAActivateOffline(Key, Code: String;
  out Error: Integer): Boolean;
function DNAActivatePurchase(Key: String; UseMachineID: Boolean;
  out Error: Integer): Boolean;
function DNADeactivate(Key, Password: String;
  out Error: Integer): Boolean;
function DNAError(ErrorNo: Integer; out Msg: String): Boolean;
function DNAEvaluateNow(Key: String; out Error: Integer): Boolean;
function DNAInfoTag(Key, Code, Tag: String;
  out Error: Integer): Boolean;
function DNAParam(Param: TDNAParams; out Value: String;
  out Error: Integer): Boolean;
function DNAProtectionOK(Key: String;
  RequestEvalCode, UseMachineID: Boolean; out Error: Integer;
  UseNative: Boolean = False): Boolean;
function DNAQuery(Key, Code: String; out Error: Integer): Boolean;
function DNAReactivate(Key, Code, OldPwd, NewPwd: String;
  out Error: Integer): Boolean;
function DNASendEvalCode(Key, Email: String; UseMachineID: Boolean;
  out Error: Integer): Boolean;
function DNASendPassword(Key, Code: String;
  out Error: Integer): Boolean;
function DNASetBuildNo(BuildNumber: String;
  out Error: Integer): Boolean;
function DNASetCDMPathName(Folder, FileName: String;
  out Error: Integer; FileExt: String = '.cdm'): Boolean;
function DNASetINIPathName(Folder, FileName: String;
  out Error: Integer; FileExt: String = '.ini'): Boolean;
function DNASetLanguage(Language: TDNALanguage;
  out Error: Integer): Boolean;
function DNASetProxy(Server, Port, UserName, Password: String;
  out Error: Integer): Boolean;
function DNAUseIESettings(UseIESettings: Boolean;
  out Error: Integer): Boolean;
function DNAValidate(Key: String; out Error: Integer): Boolean;
function DNAValidate2(Key: String; out Error: Integer): Boolean;
function DNAValidate3(Key: String; out Error: Integer): Boolean;
function DNAValidate4(Key: String; out Error: Integer): Boolean;
function DNAValidate5(Key: String; out Error: Integer): Boolean;
function DNAValidateCDM(Key: String; out Error: Integer): Boolean;
function DNAValidateCDM2(Key: String; out Error: Integer): Boolean;
function DNAValidateCDM3(Key: String; out Error: Integer): Boolean;
function DNAValidateCDM4(Key: String; out Error: Integer): Boolean;
function DNAValidateCDM5(Key: String; out Error: Integer): Boolean;
function RndValidate(Key: String; out Error: Integer): Boolean;
function RndValidateCDM(Key: String; out Error: Integer): Boolean;

{$IFEND}

implementation

{$IF (Defined(MACOS) AND (NOT Defined(IOS))) OR Defined(MSWINDOWS) }

uses
  FMX.Dialogs,
{$IFDEF MACOS}
  AT.SoftwareDNA.MacOS;
{$ELSE}
AT.SoftwareDNA.Windows;
{$ENDIF}

function DNAActivate(Key, Code, Email, Password: String;
  out Error: Integer): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNAActivate(Key, Code, Email,
    Password, Error);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNAActivate(Key, Code, Email,
    Password, Error);
{$ENDIF}
end;

function DNAActivateOffline(Key, Code: String;
  out Error: Integer): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNAActivateOffline(Key, Code, Error);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNAActivateOffline(Key,
    Code, Error);
{$ENDIF}
end;

function DNAActivatePurchase(Key: String; UseMachineID: Boolean;
  out Error: Integer): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNAActivatePurchase(Key,
    UseMachineID, Error);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNAActivatePurchase(Key,
    UseMachineID, Error);
{$ENDIF}
end;

function DNADeactivate(Key, Password: String;
  out Error: Integer): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNADeactivate(Key, Password, Error);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNADeactivate(Key,
    Password, Error);
{$ENDIF}
end;

function DNAError(ErrorNo: Integer; out Msg: String): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNAError(ErrorNo, Msg);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNAError(ErrorNo, Msg);
{$ENDIF}
end;

function DNAEvaluateNow(Key: String; out Error: Integer): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNAEvaluateNow(Key, Error);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNAEvaluateNow(Key, Error);
{$ENDIF}
end;

function DNAInfoTag(Key, Code, Tag: String;
  out Error: Integer): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNAInfoTag(Key, Code, Tag, Error);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNAInfoTag(Key, Code, Tag, Error);
{$ENDIF}
end;

function DNAParam(Param: TDNAParams; out Value: String;
  out Error: Integer): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNAParam(Param, Value, Error);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNAParam(Param, Value, Error);
{$ENDIF}
end;

function DNAProtectionOK(Key: String;
  RequestEvalCode, UseMachineID: Boolean; out Error: Integer;
  UseNative: Boolean = False): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNAProtectionOK(Key, RequestEvalCode,
    UseMachineID, Error);
{$ELSE}
  if (UseNative) then
    Result := AT.SoftwareDNA.Windows.DNAProtectionOK(Key,
      RequestEvalCode, UseMachineID, Error)
  else
    Result := AT.SoftwareDNA.Windows.DNAProtectionOK2(Key,
      RequestEvalCode, UseMachineID, Error)
{$ENDIF}
end;

function DNAQuery(Key, Code: String; out Error: Integer): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNAQuery(Key, Code, Error);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNAQuery(Key, Code, Error);
{$ENDIF}
end;

function DNAReactivate(Key, Code, OldPwd, NewPwd: String;
  out Error: Integer): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNAReactivate(Key, Code, OldPwd,
    NewPwd, Error);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNAReactivate(Key, Code, OldPwd,
    NewPwd, Error);
{$ENDIF}
end;

function DNASendEvalCode(Key, Email: String; UseMachineID: Boolean;
  out Error: Integer): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNASendEvalCode(Key, Email,
    UseMachineID, Error);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNASendEvalCode(Key, Email,
    UseMachineID, Error);
{$ENDIF}
end;

function DNASendPassword(Key, Code: String;
  out Error: Integer): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNASendPassword(Key, Code, Error);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNASendPassword(Key, Code, Error);
{$ENDIF}
end;

function DNASetBuildNo(BuildNumber: String;
  out Error: Integer): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNASetBuildNo(BuildNumber, Error);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNASetBuildNo(BuildNumber, Error);
{$ENDIF}
end;

function DNASetCDMPathName(Folder, FileName: String;
  out Error: Integer; FileExt: String = '.cdm'): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNASetCDMPathName(Folder, FileName,
    Error, FileExt);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNASetCDMPathName(Folder, FileName,
    Error, FileExt);
{$ENDIF}
end;

function DNASetINIPathName(Folder, FileName: String;
  out Error: Integer; FileExt: String = '.ini'): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNASetINIPathName(Folder, FileName,
    Error, FileExt);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNASetINIPathName(Folder, FileName,
    Error, FileExt);
{$ENDIF}
end;

function DNASetLanguage(Language: TDNALanguage;
  out Error: Integer): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNASetLanguage(Language, Error);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNASetLanguage(Language, Error);
{$ENDIF}
end;

function DNASetProxy(Server, Port, UserName, Password: String;
  out Error: Integer): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNASetProxy(Server, Port, UserName,
    Password, Error)
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNASetProxy(Server, Port, UserName,
    Password, Error);
{$ENDIF}
end;

function DNAUseIESettings(UseIESettings: Boolean;
  out Error: Integer): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNAUseIESettings
    (UseIESettings, Error);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNAUseIESettings
    (UseIESettings, Error);
{$ENDIF}
end;

function DNAValidate(Key: String; out Error: Integer): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNAValidate(Key, Error);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNAValidate(Key, Error);
{$ENDIF}
end;

function DNAValidate2(Key: String; out Error: Integer): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNAValidate2(Key, Error);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNAValidate2(Key, Error);
{$ENDIF}
end;

function DNAValidate3(Key: String; out Error: Integer): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNAValidate3(Key, Error);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNAValidate3(Key, Error);
{$ENDIF}
end;

function DNAValidate4(Key: String; out Error: Integer): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNAValidate4(Key, Error);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNAValidate4(Key, Error);
{$ENDIF}
end;

function DNAValidate5(Key: String; out Error: Integer): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNAValidate5(Key, Error);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNAValidate5(Key, Error);
{$ENDIF}
end;

function DNAValidateCDM(Key: String; out Error: Integer): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNAValidateCDM(Key, Error);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNAValidateCDM(Key, Error);
{$ENDIF}
end;

function DNAValidateCDM2(Key: String; out Error: Integer): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNAValidateCDM2(Key, Error);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNAValidateCDM2(Key, Error);
{$ENDIF}
end;

function DNAValidateCDM3(Key: String; out Error: Integer): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNAValidateCDM3(Key, Error);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNAValidateCDM3(Key, Error);
{$ENDIF}
end;

function DNAValidateCDM4(Key: String; out Error: Integer): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNAValidateCDM4(Key, Error);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNAValidateCDM4(Key, Error);
{$ENDIF}
end;

function DNAValidateCDM5(Key: String; out Error: Integer): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.DNAValidateCDM5(Key, Error);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.DNAValidateCDM5(Key, Error);
{$ENDIF}
end;

function RndValidate(Key: String; out Error: Integer): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.RndValidate(Key, Error);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.RndValidate(Key, Error);
{$ENDIF}
end;

function RndValidateCDM(Key: String; out Error: Integer): Boolean;
begin
{$IFDEF MACOS}
  Result := AT.SoftwareDNA.MacOS.RndValidateCDM(Key, Error);
{$ELSE}
  Result := AT.SoftwareDNA.Windows.RndValidateCDM(Key, Error);
{$ENDIF}
end;

{$IFEND}

end.
