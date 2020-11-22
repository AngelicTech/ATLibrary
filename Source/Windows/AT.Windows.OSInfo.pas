unit AT.Windows.OSInfo;

interface

function GetOSVersionInfoString: String;

implementation

uses
  JclSysInfo, System.SysUtils;

function GetOSVersionInfoString: String;
begin
  Result := GetWindowsVersionString;

  if (GetWindowsEdition <> weUnknown) then
    Result := Format('%s %s', [Result, GetWindowsEditionString]);

  if (GetWindowsServicePackVersion > 0) then
    Result := Format('%s %s', [Result, GetWindowsServicePackVersionString]);

  if (IsWindows64) then
    Result := Format('%s, 64-bit Edition', [Result])
  else
    Result := Format('%s, 32-bit Edition', [Result]);
end;

end.
