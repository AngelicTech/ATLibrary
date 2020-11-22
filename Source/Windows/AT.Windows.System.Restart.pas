unit AT.Windows.System.Restart;

interface

var
  AppRestart: Boolean;

implementation

uses
  Windows, ShellAPI, System.SysUtils;

var
  ExeName: String;

initialization

AppRestart := False;
ExeName := ParamStr(0);

finalization

if ((AppRestart) AND (ExeName <> '')) then
  begin
    if (FileExists(ExeName)) then
      ShellExecute(0, 'open', PChar(ExeName), NIL, NIL, SW_SHOWNORMAL);
  end;

end.
