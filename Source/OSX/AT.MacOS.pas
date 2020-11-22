//Only compile for the OS X platform.
{$IF ( (NOT Defined(MACOS)) OR (Defined(IOS)) )}
  {$MESSAGE Fatal 'AT.MacOS.pas only compiles for the OS X platform.'}
{$ENDIF}

// ******************************************************************
//
// Program Name   : Angelic Tech Mac OS X Library
// Program Version: 2017
// Platform(s)    : OS X
// Framework      : None
//
// Filename       : AT.MacOS.pas
// File Version   : 2017.04
// Date Created   : 13-Apr-2017
// Author         : Matthew Vesperman
//
// Description:
//
// Contains Mac OS X system level commands.
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

//TODO: Finish documentation.

/// <summary>
///   Contains Mac OS X system level commands.
/// </summary>
unit AT.MacOS;

interface

uses
  Macapi.ObjCRuntime, Macapi.ObjectiveC, Macapi.CoreFoundation,
  Macapi.CocoaTypes, Macapi.Foundation, Macapi.AppKit, FMX.Forms;

function ExecuteTask(ACommand: String; AParams: array of String;
  ALaunch: Boolean = True): NSTask; overload;
function ExecuteTask(ACommand: String; ALaunch: Boolean = True)
  : NSTask; overload;
function ExecuteTask(ACommand: String; AParams: NSArray;
  ALaunch: Boolean = True): NSTask; overload;
procedure ExecuteTaskAndWait(ACommand: String; AParams: array of String;
    ADirectory: String = ''); overload;
procedure ExecuteTaskAndWait(ACommand: String; AParams: array of String; out
    AOutput, AError: String; ADirectory: String = ''); overload;
function GetUserName: String;
function GetFullUserName: String;
function NSRawStr(AValue: String): Pointer;
function OpenURL(AURL: String): NSTask;
function SelectFolder(const ATitle: string; var ADir: string): Boolean;

implementation

uses
  System.SysUtils, System.IOUtils, FMX.Platform.Mac, Macapi.Helpers,
  AT.GarbageCollector;

function NSUserName: Pointer; cdecl;
  external '/System/Library/Frameworks/Foundation.framework/Foundation'
  name _PU + 'NSUserName';
function NSFullUserName: Pointer; cdecl;
  external '/System/Library/Frameworks/Foundation.framework/Foundation'
  name _PU + 'NSFullUserName';

function ExecuteTask(ACommand: String; AParams: array of String;
  ALaunch: Boolean = True): NSTask;
var
  PArray    : array of Pointer;
  NSParams  : NSArray;
  ALen      : Integer;
  Idx1, Idx2: Integer;
begin
  ALen := Length(AParams);
  SetLength(PArray, ALen);
  if (ALen > 0) then
    begin
      Idx1 := 0;
      for Idx2 := Low(AParams) to High(AParams) do
        begin
          PArray[Idx1] := NSRawStr(AParams[Idx2]);
          Inc(Idx1);
        end;
    end;
  NSParams := TNSArray.Wrap(TNSArray.Alloc.initWithObjects(@PArray[0], ALen));

  Result := ExecuteTask(ACommand, NSParams, ALaunch);
end;

function ExecuteTask(ACommand: String; AParams: NSArray;
  ALaunch: Boolean = True): NSTask;
begin
  Result := ExecuteTask(ACommand, False);
  if (Assigned(Result)) then
    begin
      if (Assigned(AParams)) then
        Result.setArguments(AParams);
      if (ALaunch) then
        Result.launch;
    end;
end;

function ExecuteTask(ACommand: String; ALaunch: Boolean = True): NSTask;
begin
  Result := TNSTask.Wrap(TNSTask.Alloc.init);
  if (Assigned(Result)) then
    begin
      Result.setLaunchPath(StrToNSStr(ACommand));
      if (ALaunch) then
        Result.launch;
    end;
end;

procedure ExecuteTaskAndWait(ACommand: String; AParams: array of String;
    ADirectory: String = '');
var
  AJunk: String;
begin
  ExecuteTaskAndWait(ACommand, AParams, AJunk, AJunk, ADirectory);
end;

procedure ExecuteTaskAndWait(ACommand: String; AParams: array of String; out
    AOutput, AError: String; ADirectory: String = '');
var
  PArray    : array of Pointer;
  NSParams  : NSArray;
  ALen      : Integer;
  Idx1, Idx2: Integer;
  ATask: NSTask;
  AGC: IATGarbageCollector;
  AOutPipe: NSPipe;
  AErrPipe: NSPipe;
  AOutData: NSData;
  AErrData: NSData;
begin
  ALen := Length(AParams);

  SetLength(PArray, ALen);
  if (ALen > 0) then
    begin
      Idx1 := 0;
      for Idx2 := Low(AParams) to High(AParams) do
        begin
          PArray[Idx1] := NSRawStr(AParams[Idx2]);
          Inc(Idx1);
        end;
    end;
  NSParams := TNSArray.Wrap(TNSArray.Alloc.initWithObjects(@PArray[0], ALen));

  ATask := TNSTask.Wrap(TNSTask.Wrap(TNSTask.OCClass.alloc).init);
  TATGC.Cleanup(procedure
    begin
      ATask.release;
      ATask := NIL;
    end, AGC);

  ATask.setLaunchPath(StrToNSStr(ACommand));

  if ( (ADirectory <> '') AND (DirectoryExists(ADirectory)) ) then
    begin
      ATask.setCurrentDirectoryPath(StrToNSStr(ADirectory));
    end;

  ATask.setArguments(NSParams);

  AOutPipe := TNSPipe.Create;
  TATGC.Cleanup(procedure
    begin
      AOutPipe.release;
      AOutPipe := NIL;
    end, AGC);

  AErrPipe := TNSPipe.Create;
  TATGC.Cleanup(procedure
    begin
      AErrPipe.release;
      AErrPipe := NIL;
    end, AGC);

  ATask.setStandardOutput((AOutPipe AS ILocalObject).GetObjectID);
  ATask.setStandardError((AErrPipe AS ILocalObject).GetObjectID);

  ATask.launch;

  ATask.waitUntilExit;

  AOutData := AOutPipe.fileHandleForReading.readDataToEndOfFile;
  AOutput := StringOf(BytesOf(AOutData.bytes, AOutData.length));

  AErrData := AErrPipe.fileHandleForReading.readDataToEndOfFile;
  AError := StringOf(BytesOf(AErrData.bytes, AErrData.length));
end;

function GetUserName: String;
begin
  Result := String(TNSString.Wrap(NSUserName).UTF8String);
end;

function GetFullUserName: String;
begin
  Result := String(TNSString.Wrap(NSFullUserName).UTF8String);
end;

function NSRawStr(AValue: String): Pointer;
begin
  Result := TNSString.OCClass.stringWithUTF8String
    (PAnsiChar(UTF8String(AValue)));
end;

function OpenURL(AURL: String): NSTask;
var
  AParams: array of string;
begin
  SetLength(AParams, 1);
  AParams[0] := AURL;
  Result := ExecuteTask('/usr/bin/Open', AParams);
end;

function SelectFolder(const ATitle: string; var ADir: string): Boolean;
var
  LOpenDir: NSOpenPanel;
  LInitialDir: NSURL;
  LDlgResult: NSInteger;
  AGC: IATGarbageCollector;
begin
  LOpenDir := TNSOpenPanel.Wrap(TNSOpenPanel.OCClass.openPanel);

  TATGC.Cleanup(procedure
    begin
      LOpenDir.Release;
    end, AGC);

  LOpenDir.setAllowsMultipleSelection(False);
  LOpenDir.setCanChooseFiles(False);
  LOpenDir.setCanChooseDirectories(True);

  if (ADir <> '') then
    begin
      LInitialDir := TNSURL.Create;
      LInitialDir.initFileURLWithPath(StrToNSStr(ADir));
      LOpenDir.setDirectoryURL(LInitialDir);
    end;

  if (ATitle <> '') then
    begin
      LOpenDir.setTitle(StrToNSStr(ATitle));
    end;

  LOpenDir.retain;

  LDlgResult := LOpenDir.runModal;

  Result := (LDlgResult = NSOKButton);

  if (Result) then
    begin
      ADir := string(TNSUrl.Wrap(LOpenDir.URLs.objectAtIndex(
         0)).relativePath.UTF8String);
    end;
end;


































end.
