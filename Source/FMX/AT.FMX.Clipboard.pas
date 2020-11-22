unit AT.FMX.Clipboard;

interface

uses
  FMX.Platform;

function Clipboard: IFMXClipboardService;
function ClipboardAvailable: Boolean;

implementation

function Clipboard: IFMXClipboardService;
begin
  if (NOT ClipboardAvailable) then
    Exit(NIL);

  Result := IFMXClipboardService(
              TPlatformServices.Current.GetPlatformService(
                IFMXClipboardService));
end;

function ClipboardAvailable: Boolean;
begin
  Result := TPlatformServices.Current.SupportsPlatformService(
              IFMXClipboardService);
end;


end.
