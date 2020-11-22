unit AT.XPlatform.Folders;

interface

function GetAppDataDirectory(const AAppPath: String = '';
    ACommon: Boolean = False): String;
function GetDocumentDirectory(ADocPath: String = '';
    ACommon: Boolean = False): String;
function GetExecutablePath(AppRoot: Boolean = False): String;

implementation

uses
  {$IF Defined(ANDROID)}
  AT.Android.Folders,
  {$ELSEIF Defined(IOS)}
  AT.iOS.Folders,
  {$ELSEIF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}
  AT.MacOS.Folders,
  {$ELSEIF Defined(LINUX)}
  AT.Linux.Folders,
  {$ELSEIF Defined(MSWINDOWS)}
  AT.Windows.System, AT.Windows,
  {$ENDIF}
  System.IOUtils, System.SysUtils;

function GetAppDataDirectory(const AAppPath: String = '';
  ACommon: Boolean = False): String;
begin

  {$IF Defined(ANDROID)}
  Result := AT.Android.Folders.GetAppDataDirectory(AAppPath, ACommon);
  {$ELSEIF Defined(IOS)}
  Result := AT.iOS.Folders.GetAppDataDirectory(AAppPath, ACommon);
  {$ELSEIF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}
  Result := AT.MacOS.Folders.GetAppDataDirectory(AAppPath, ACommon);
  {$ELSEIF Defined(LINUX)}
  Result := AT.Linux.Folders.GetAppDataDirectory(AAppPath);
  {$ELSEIF Defined(MSWINDOWS)}
  Result := AT.Windows.System.GetAppDataDirectory(AAppPath, ACommon);
  {$ELSE}
  Result := TPath.GetHomePath;
  {$ENDIF}

end;

function GetDocumentDirectory(ADocPath: String = '';
    ACommon: Boolean = False): String;
begin

  {$IF Defined(ANDROID)}
  Result := AT.Android.Folders.GetDocumentDirectory(ADocPath, ACommon);
  {$ELSEIF Defined(IOS)}
  Result := AT.iOS.Folders.GetDocumentDirectory(ADocPath, ACommon);
  {$ELSEIF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}
  Result := AT.MacOS.Folders.GetDocumentDirectory(ADocPath, ACommon);
  {$ELSEIF Defined(LINUX)}
  Result := AT.Linux.Folders.GetDocumentDirectory(ADocPath);
  {$ELSEIF Defined(MSWINDOWS)}
  Result := AT.Windows.System.GetDocumentPath(ADocPath, ACommon);
  {$ELSE}
  Result := TPath.GetDocumentsPath;
  {$ENDIF}

end;

function GetExecutablePath(AppRoot: Boolean = False): String;
begin

  {$IF Defined(ANDROID)}
  Result :=  ExtractFilePath(ParamStr(0));
  {$ELSEIF Defined(IOS)}
  if (AppRoot) then
    Result := AT.iOS.Folders.GetBundleDirectory
  else
    Result := AT.iOS.Folders.GetAppDirectory;
  {$ELSEIF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}
  if (AppRoot) then
    Result := AT.MacOS.Folders.GetBundleDirectory
  else
    Result := AT.MacOS.Folders.GetAppDirectory;
  {$ELSEIF Defined(LINUX)}
  Result := AT.Linux.Folders.GetAppDirectory;
  {$ELSEIF Defined(MSWINDOWS)}
  Result := AT.Windows.GetExeFolder;
  {$ELSE}
  Result := ExtractFilePath(ParamStr(0));
  {$ENDIF}

end;


end.
