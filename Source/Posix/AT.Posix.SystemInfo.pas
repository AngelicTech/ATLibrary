unit AT.Posix.SystemInfo;

interface

uses
  System.Types;

function _SysCtlInt(AType, ASubType: Integer): Integer; overload;
function _SysCtlInt(AMIB: TIntegerDynArray): Integer; overload;
function _SysCtlInt(ATypeName: String): Integer; overload;
function _SysCtlInt64(AType, ASubType: Integer): Int64; overload;
function _SysCtlInt64(AMIB: TIntegerDynArray): Int64; overload;
function _SysCtlInt64(ATypeName: String): Int64; overload;
function _SysCtlString(AType, ASubType: Integer): String; overload;
function _SysCtlString(AMIB: TIntegerDynArray): String; overload;
function _SysCtlString(ATypeName: String): String; overload;

implementation

uses
  Posix.SysTypes, Posix.Base
  {$IF (NOT Defined(LINUX))}
  , Posix.SysSysctl
  {$ENDIF}
  ;


//TODO: Build proper Linux Posix.SysSysctl unit.
{$IF Defined(LINUX)}
function sysctl(name: PInteger; namelen: cardinal;
  oldp: Pointer; oldlen: Psize_t;
  newp: Pointer; newlen: size_t): Integer; cdecl;
  external libc name _PU + 'sysctl';
{$EXTERNALSYM sysctl}

function sysctlbyname(Name: MarshaledAString;
  oldp: Pointer; oldlen: Psize_t;
  newp: Pointer; newlen: size_t): Integer; cdecl;
  external libc name _PU + 'sysctlbyname';
{$EXTERNALSYM sysctlbyname}

function sysctlnametomib(name: MarshaledAString; mibp: PInteger;
  sizep: Psize_t): Integer; cdecl;
  external libc name _PU + 'sysctlnametomib';
{$EXTERNALSYM sysctlnametomib}
{$ENDIF}





function _SysCtlInt(AType, ASubType: Integer): Integer; overload;
var
  AMIB: array[0..1] of Integer;
  ARes: Integer;
  ALen: size_t;
begin
  AMIB[0] := AType;
  AMIB[1] := ASubType;

  ALen := SizeOf(Result);
  ARes := sysctl(@AMIB, Length(AMIB), @Result, @ALen, NIL, 0);

  if (ARes <> 0) then
    Result := -1;
end;

function _SysCtlInt(AMIB: TIntegerDynArray): Integer; overload;
var
  ARes: Integer;
  ALen: size_t;
begin
  ALen := SizeOf(Result);
  ARes := sysctl(@AMIB[0], Length(AMIB), @Result, @ALen, NIL, 0);

  if (ARes <> 0) then
    Result := -1;
end;

function _SysCtlInt(ATypeName: String): Integer; overload;
var
  ARes: Integer;
  {$IF Defined(IOS)}
  AName: String;
  {$ELSEIF Defined(LINUX)}
  AName: MarshaledAString;
  {$ELSE}
  AName: AnsiString;
  {$ENDIF}
  ALen: size_t;
begin
  ALen := SizeOf(Result);

  {$IF Defined(IOS)}
  AName := ATypeName;
  ARes := sysctlbyname(@AName, @Result, @ALen, NIL, 0);
  {$ELSEIF Defined(LINUX)}
  AName := MarshaledAString(UTF8STring(ATypeName));
  ARes := sysctlbyname(AName, @Result, @ALen, NIL, 0);
  {$ELSE}
  AName := AnsiString(ATypeName);
  ARes := sysctlbyname(PAnsiChar(AName), @Result, @ALen, NIL, 0);
  {$ENDIF}

  if (ARes <> 0) then
    Result := -1;
end;

function _SysCtlInt64(AType, ASubType: Integer): Int64; overload;
var
  AMIB: array[0..1] of Integer;
  ARes: Integer;
  ALen: size_t;
begin
  AMIB[0] := AType;
  AMIB[1] := ASubType;

  ALen := SizeOf(Result);
  ARes := sysctl(@AMIB, Length(AMIB), @Result, @ALen, NIL, 0);

  if (ARes <> 0) then
    Result := -1;
end;

function _SysCtlInt64(AMIB: TIntegerDynArray): Int64; overload;
var
  ARes: Integer;
  ALen: size_t;
begin
  ALen := SizeOf(Result);
  ARes := sysctl(@AMIB[0], Length(AMIB), @Result, @ALen, NIL, 0);

  if (ARes <> 0) then
    Result := -1;
end;

function _SysCtlInt64(ATypeName: String): Int64; overload;
var
  ARes: Integer;
  {$IF Defined(IOS)}
  AName: String;
  {$ELSEIF Defined(LINUX)}
  AName: MarshaledAString;
  {$ELSE}
  AName: AnsiString;
  {$ENDIF}
  ALen: size_t;
begin
  ALen := SizeOf(Result);

  {$IF Defined(IOS)}
  AName := ATypeName;
  ARes := sysctlbyname(@AName, @Result, @ALen, NIL, 0);
  {$ELSEIF Defined(LINUX)}
  AName := MarshaledAString(UTF8STring(ATypeName));
  ARes := sysctlbyname(AName, @Result, @ALen, NIL, 0);
  {$ELSE}
  AName := AnsiString(ATypeName);
  ARes := sysctlbyname(PAnsiChar(AName), @Result, @ALen, NIL, 0);
  {$ENDIF}

  if (ARes <> 0) then
    Result := -1;
end;

function _SysCtlString(AType, ASubType: Integer): String; overload;
var
  AMIB : array[0..1] of Integer;
  ARes : Integer;
  ALen : size_t;
  {$IF ( (Defined(IOS)) OR (Defined(LINUX)) )}
  AP   : Pointer;
  {$ELSE}
  AP   : PAnsiChar;
  {$ENDIF}
begin
  Result := '';

  AMIB[0] := AType;
  AMIB[1] := ASubType;

  //get the length of the buffer
  ARes := sysctl(@AMIB, Length(AMIB), nil, @ALen, nil, 0);
  if ( (ALen > 0) AND (ARes = 0) ) then
    begin

      //allocates the buffer
      GetMem(AP, ALen);
      try
        ARes := sysctl(@AMIB, Length(AMIB), AP, @ALen, nil, 0);
        if (ARes = 0) then
          Result := String(AP);
      finally
        FreeMem(AP);
      end;
    end;
end;

function _SysCtlString(AMIB: TIntegerDynArray): String; overload;
var
  ARes : Integer;
  ALen : size_t;
  {$IF ( (Defined(IOS)) OR (Defined(LINUX)) )}
  AP   : Pointer;
  {$ELSE}
  AP   : PAnsiChar;
  {$ENDIF}
begin
  Result := '';

  //get the length of the buffer
  ARes := sysctl(@AMIB, Length(AMIB), nil, @ALen, nil, 0);
  if ( (ALen > 0) AND (ARes = 0) ) then
    begin

      //allocates the buffer
      GetMem(AP, ALen);
      try
        ARes := sysctl(@AMIB, Length(AMIB), AP, @ALen, nil, 0);
        if (ARes = 0) then
          Result := String(AP);
      finally
        FreeMem(AP);
      end;
    end;
end;

function _SysCtlString(ATypeName: String): String;
var
  ARes : Integer;
  {$IF Defined(IOS)}
  AName: String;
  AP   : Pointer;
  {$ELSEIF Defined(LINUX)}
  AName: MarshaledAString;
  AP   : Pointer;
  {$ELSE}
  AName: AnsiString;
  AP   : PAnsiChar;
  {$ENDIF}
  ALen : size_t;
begin
  Result := '';

  {$IF Defined(IOS)}
  AName := ATypeName;
  {$ELSEIF Defined(LINUX)}
  AName := MarshaledAString(UTF8STring(ATypeName));
  {$ELSE}
  AName := AnsiString(ATypeName);
  {$ENDIF}

  //get the length of the buffer
  {$IF Defined(IOS)}
  ARes := sysctlbyname(@AName, nil, @ALen, nil, 0);
  {$ELSEIF Defined(LINUX)}
  ARes := sysctlbyname(AName, nil, @ALen, nil, 0);
  {$ELSE}
  ARes := sysctlbyname(PAnsiChar(AName), nil, @ALen, nil, 0);
  {$ENDIF}

  if ( (ALen > 0) AND (ARes = 0) ) then
    begin

      //allocates the buffer
      GetMem(AP, ALen);
      try

        {$IF Defined(IOS)}
        ARes := sysctlbyname(@AName, AP, @ALen, nil, 0);
        {$ELSEIF Defined(LINUX)}
        ARes := sysctlbyname(AName, AP, @ALen, nil, 0);
        {$ELSE}
        ARes := sysctlbyname(PAnsiChar(AName), AP, @ALen, nil, 0);
        {$ENDIF}

        if (ARes = 0) then
          Result := String(AP);
      finally
        FreeMem(AP);
      end;
    end;
end;


end.
