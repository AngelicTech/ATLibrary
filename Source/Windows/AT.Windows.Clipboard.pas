unit AT.Windows.Clipboard;

interface

var
  CF_HTML: Integer;
  CF_RTF: Integer;

implementation

uses
  Winapi.Windows;

initialization
  CF_HTML := RegisterClipboardFormat('HTML Format');
  CF_RTF := RegisterClipboardFormat('Rich Text Format');
end.
