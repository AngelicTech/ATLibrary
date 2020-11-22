unit AT.XPlatform.OSDetection;

interface

function IsAndroid: Boolean;
function IsIOS: Boolean;
function IsLinux: Boolean;
function IsMacOSX: Boolean;
function IsWin32: Boolean;
function IsWin64: Boolean;
function IsWindows: Boolean;

implementation

function IsAndroid: Boolean;
begin
{$IF Defined(ANDROID)}
  Exit(True);
{$ENDIF}
  Result := False;
end;

function IsIOS: Boolean;
begin
{$IF Defined(IOS)}
  Exit(True);
{$ENDIF}
  Result := False;
end;

function IsLinux: Boolean;
begin
{$IF Defined(LINUX)}
  Exit(True);
{$ENDIF}
  Result := False;
end;

function IsMacOSX: Boolean;
begin
{$IF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}
  Exit(True);
{$ENDIF}
  Result := False;
end;

function IsWin32: Boolean;
begin
{$IF Defined(WIN32)}
  Exit(True);
{$ENDIF}
  Result := False;
end;

function IsWin64: Boolean;
begin
{$IF Defined(WIN64)}
  Exit(True);
{$ENDIF}
  Result := False;
end;

function IsWindows: Boolean;
begin
{$IF Defined(MSWINDOWS)}
  Exit(True);
{$ENDIF}
  Result := False;
end;

end.
