//Only compile for the LINUX platform.
{$IF NOT Defined(LINUX)}
  {$MESSAGE Fatal 'AT.Linux.pas only compiles for the LINUX platform.'}
{$ENDIF}

// ******************************************************************
//
// Program Name   : Angelic Tech Linux Library
// Program Version: 2017
// Platform(s)    : Linux
// Framework      : None
//
// Filename       : AT.Linux.pas
// File Version   : 2017.04
// Date Created   : 15-Apr-2017
// Author         : Matthew Vesperman
//
// Description:
//
// Linux system commands.
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
///   Contains Linux system level commands.
/// </summary>
unit AT.Linux;

interface

/// <summary>
///   Converts the contents of a character buffer to a string.
/// </summary>
/// <param name="ABuffer">
///   A pointer to the buffer containing character data to convert to
///   a string.
/// </param>
/// <param name="AMaxSize">
///   The max number of characters in the buffer.
/// </param>
/// <returns>
///   A string containing the buffer character data. If a NIL buffer
///   was passed then the string is an empty string.
/// </returns>
function BufferToStr(ABuffer: Pointer; AMaxSize: UInt32): String;

/// <summary>
///   Executes a child process and returns immediately.
/// </summary>
/// <param name="ACommand">
///   The name (full path included) of the child process executable.
/// </param>
/// <param name="AParams">
///   An array of parameters for the child process.
/// </param>
/// <param name="AError">
///   Receives the error code (if any).
/// </param>
/// <returns>
///   TRUE if child process was successfully launched, FALSE
///   otherwise.
/// </returns>
function ExecuteTask(const ACommand: String; const AParams: array of string;
    out AError: Integer): Boolean;

/// <summary>
///   Executes a child process and waits for it to return.
/// </summary>
/// <param name="ACommand">
///   The name (full path included) of the child process executable.
/// </param>
/// <param name="AError">
///   Receives the error code (if any).
/// </param>
/// <returns>
///   TRUE if child process was successfully launched, FALSE
///   otherwise.
/// </returns>
function ExecuteTaskAndWait(const ACommand: String; out AError: Integer):
    Boolean; overload;

/// <summary>
///   Executes a child process and waits for it to return.
/// </summary>
/// <param name="ACommand">
///   The name (full path included) of the child process executable.
/// </param>
/// <param name="AParams">
///   An array of parameters for the child process.
/// </param>
/// <param name="AError">
///   Receives the error code (if any).
/// </param>
/// <returns>
///   TRUE if child process was successfully launched, FALSE
///   otherwise.
/// </returns>
function ExecuteTaskAndWait(const ACommand: String; const AParams: array of
    string; out AError: Integer): Boolean; overload;

/// <summary>
///   Executes a child process waits for it to return and retrieves
///   the output of the command as a string.
/// </summary>
/// <param name="ACommand">
///   The name (full path included) of the child process executable.
/// </param>
/// <param name="AParams">
///   An array of parameters for the child process.
/// </param>
/// <param name="AOutput">
///   Receives the output string.
/// </param>
/// <param name="AError">
///   Receives the error code (if any).
/// </param>
/// <returns>
///   TRUE if child process was successfully launched, FALSE
///   otherwise.
/// </returns>
function ExecuteTaskAndWait(const ACommand: String; const AParams: array of
    string; out AOutput: String;  out AError: Integer): Boolean; overload;

procedure OpenURL(AURL: String);

implementation

uses
  Posix.Base,
  Posix.SysTypes,
  Posix.Errno,
  Posix.Stdlib,
  Posix.SysWait,
  System.SysUtils,
  AT.Linux.Libc,
  AT.GarbageCollector;

function BufferToStr(ABuffer: Pointer; AMaxSize: UInt32): String;
var
  ACursor: ^UInt8;  //Current position in buffer...
  EOB: NativeUInt;  //End of buffer position...
begin
  //Do we have a valid buffer???
  if (NOT Assigned(ABuffer)) then
    Exit(EmptyStr);   //No, exit and return empty string...

  //Initialize result...
  Result := EmptyStr;

  //Initialize cursor vars...
  ACursor := ABuffer;
  EOB := NativeUInt(ACursor) + AMaxSize;

  //Iterrate over buffer contents until we reach either
  //the end of the buffer or a null (#0) character...
  while ( (NativeUInt(ACursor) < EOB) AND (ACursor^ <> 0) ) do
    begin
      //Add current char to result string...
      Result := Result + Chr(ACursor^);

      //move cursor to next char in buffer...
      ACursor := Pointer(Succ(NativeUInt(ACursor)));
    end;
end;

function ExecuteTask(const ACommand: String; const AParams: array of string;
    out AError: Integer): Boolean;
var
  ALen: Integer;
  Args: array of Pointer;
  Idx1, Idx2: Integer;
  APID: pid_t;
begin
  //Set initial result to false...
  Result := False;

  //Get number of params...
  ALen := Length(AParams);

  //Set size of Args array to size of AParams plus 2 elements...
  SetLength(Args, ALen + 2);

  //Initialize first parameter to command filename...
  Args[0] := MarshaledAString(RawByteString(ACommand));

  //Initialize last parameter to a NIL pointer...
  Args[High(Args)] := NIL;

  //Set index for Args array...
  Idx1 := 1;

  //Iterate over AParams array...
  for Idx2 := Low(AParams) to High(AParams) do
    begin
      //Add AParams[Idx2] to Args at index Idx1...
      Args[Idx1] := MarshaledAString(RawByteString(AParams[Idx2]));

      //Increment Args index...
      Inc(Idx1);
    end;

  //Spawn new child process...
  APID := _fork();

  case APID of
    0 : begin    //This is child process, load and run executable...
          _execv(MarshaledAString(RawByteString(ACommand)), @Args[0]);
          halt;
        end;
    -1: begin    //An error occurred...
          AError := errno;
          Result := False;
        end;
    else
      //Execution successful...
      AError := 0;
      Result := True;
    end;
end;

function ExecuteTaskAndWait(const ACommand: String; out AError: Integer):
    Boolean;
begin
  //Was ACommand passed an empty string???
  if (ACommand.IsEmpty) then
    begin
      //Yes, call system with a NIL parameter to get shell status...
      AError := _system(nil);
      //Exit, return TRUE if AError <> 0, False if AError = 0...
      Exit(AError <> 0);
    end;

AError := _system(MarshaledAString(RawByteString(ACommand)));

  case AError of
    127, -1: Exit(False);
  else
    Result := True;
  end;
end;

function ExecuteTaskAndWait(const ACommand: String; const AParams: array of
    string; out AError: Integer): Boolean;
var
  ALen: Integer;
  Args: array of Pointer;
  Idx1, Idx2: Integer;
  APID: pid_t;
begin
  //Set initial result to false...
  Result := False;

  //Get number of params...
  ALen := Length(AParams);

  //Set size of Args array to size of AParams plus 2 elements...
  SetLength(Args, ALen + 2);

  //Initialize first parameter to command filename...
  Args[0] := MarshaledAString(RawByteString(ACommand));

  //Initialize last parameter to a NIL pointer...
  Args[High(Args)] := NIL;

  //Set index for Args array...
  Idx1 := 1;

  //Iterate over AParams array...
  for Idx2 := Low(AParams) to High(AParams) do
    begin
      //Add AParams[Idx2] to Args at index Idx1...
      Args[Idx1] := MarshaledAString(RawByteString(AParams[Idx2]));

      //Increment Args index...
      Inc(Idx1);
    end;

  //Spawn new child process...
  APID := _fork();

  case APID of
    0 : begin    //This is child process, load and run executable...
          _execv(MarshaledAString(RawByteString(ACommand)), @Args[0]);
          halt;
        end;
    -1: begin    //An error occurred...
          AError := errno;
          Result := False;
        end;
    else
      //Execution successful...
      waitpid(APID, NIL, 0);      //Wait for child to finish...
      AError := 0;                //Set error to 0 (success)...
      Result := True;             //Ser result to true, success...
    end;
end;

function ExecuteTaskAndWait(const ACommand: String; const AParams: array of
    string; out AOutput: String;  out AError: Integer): Boolean; overload;
var
  ACmd: string;
  Idx: Integer;
  AHandle: TStreamHandle;
  AGC: IATGarbageCollector;
  AData: array[0..511] of UInt8;
begin
  Result := False;
  AOutput := EmptyStr;
  AError := -1;

  ACmd := ACommand;

  for Idx := Low(AParams) to High(AParams) do
    ACmd := Format('%s %s', [ACmd, AParams[Idx]]);

  AHandle := _popen(MarshaledAString(RawByteString(ACmd)), 'r');

  TATGC.Cleanup(procedure
    begin
      _pclose(AHandle);
    end, AGC);

  while (Assigned(_fgets(@AData[0], SizeOf(AData), AHandle))) do
    begin
      AOutput := AOutput + BufferToStr(@AData[0], SizeOf(AData));
    end;

  AError := 0;
  Result := True;
end;

procedure OpenURL(AURL: String);
var
  AError: Integer;
  AParams: array of string;
begin
  SetLength(AParams, 1);
  AParams[0] := AURL;
  ExecuteTask('/usr/bin/xdg-open', AParams, AError);
end;

end.
