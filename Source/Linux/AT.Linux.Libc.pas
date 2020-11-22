//Only compile for the LINUX platform.
{$IF NOT Defined(LINUX)}
  {$MESSAGE Fatal 'AT.Linux.Libc.pas only compiles for the LINUX platform.'}
{$ENDIF}

// ******************************************************************
//
// Program Name   : Angelic Tech Linux Library
// Program Version: 2017
// Platform(s)    : Linux
// Framework      : None
//
// Filename       : AT.Linux.Libc.pas
// File Version   : 2017.04
// Date Created   : 15-Apr-2017
// Author         : Matthew Vesperman
//
// Description:
//
// Linux libc imports.
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
///   Contains Linux libc import statements.
/// </summary>
unit AT.Linux.Libc;

interface

uses
  Posix.Base,
//  System.SysUtils,
//  Posix.Stdlib,
//  Posix.Fcntl,
  Posix.SysTypes;

type
  TStreamHandle = Pointer;


function _execv(const Command: MarshaledAString;
    const ArgV: Pointer): Integer;
    cdecl; external libc name _PU + 'execv';
function _fgets(ABuffer: Pointer; ASize: Int32;
    AStream: TStreamHandle): Pointer;
    cdecl; external libc name _PU + 'fgets';
function _fork(): pid_t; cdecl; external libc name _PU + 'fork';
function _pclose(AHandle: TStreamHandle): Int32;
    cdecl; external libc name _PU + 'pclose';
function _popen(const ACommand: MarshaledAString;
    const AType: MarshaledAString): TStreamHandle;
    cdecl; external libc name _PU + 'popen';

implementation

end.
