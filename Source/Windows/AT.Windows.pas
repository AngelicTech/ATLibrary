// ****************************************************************************
//
// Program Name   : - AT Library -
// Program Version: 1.00
// Filenames      : AT.Windows.pas
// File Version   : 1.00
// Date Created   : 26-JAN-2014
// Author         : Matthew S. Vesperman
//
// Description:
//
// Windows OS functions... (Migrated from SSWindows.pas)
//
// Revision History:
//
// v1.00   :   Initial version for Delphi XE5
//
// ****************************************************************************
//
// COPYRIGHT © 2013-Present Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ****************************************************************************

unit AT.Windows;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils;

type
  /// <summary>
  /// Stores the name of the current workstation.
  /// </summary>
  TComputerName = String;

  /// <summary>
  /// Stores a directory (folder) name.
  /// </summary>
  TDirectoryName = String; // folder name

  /// <summary>
  /// Type of Windows Explorer window to show.
  /// </summary>
  TExploreType = (
    /// <summary>
    /// Display Explorer in explore mode.
    /// </summary>
    etExplore,

    /// <summary>
    /// Display Explorer in folder mode.
    /// </summary>
    etFolder);

  /// <summary>
  /// Operating System Platform Type.
  /// </summary>
  TOSPlatform = (
    /// <summary>
    /// Unknown OS.
    /// </summary>
    osUnknown,

    /// <summary>
    /// Windows 3.x
    /// </summary>
    osWin3x,

    /// <summary>
    /// Windows 9x/ME
    /// </summary>
    osWin9x,

    /// <summary>
    /// Windows NT based.
    /// </summary>
    osWinNT); // platform

  /// <summary>
  /// Currently logged in username.
  /// </summary>
  TOSUserName = String;

  /// <summary>
  /// OS registered owner.
  /// </summary>
  TRegOwner = String; // registered owner

  /// <summary>
  /// OS registered company.
  /// </summary>
  TRegCompany = String; // registered company

  EExploreBadAssoc = class(Exception)
  end;

  EExploreGenError = class(Exception)
  private
    FErrorCode: Integer;
    FFolder: string;
  public
    constructor CreateErr(const Msg: String; const iErrCode: Integer;
      const sFolder: String);
    property ErrorCode: Integer read FErrorCode write FErrorCode;
    property Folder: string read FFolder write FFolder;
  end;

  EExploreNoAccess = class(Exception)
  end;

  EExploreNotFound = class(Exception)
  end;

  ERegCompanyError = class(Exception)
  end;

  ERegUserError = class(Exception)
  end;

  EOSVersionError = class(Exception)
  end;

  EURLBadAssoc = class(Exception)
  end;

  EURLGenError = class(Exception)
  private
    FErrorCode: Integer;
    FURL: string;
  public
    constructor CreateErr(const Msg: String; const iErrCode: Integer;
      const sURL: String);
    property ErrorCode: Integer read FErrorCode write FErrorCode;
    property URL: string read FURL write FURL;
  end;

  EURLNoAccess = class(Exception)
  end;

  EURLNotFound = class(Exception)
  end;

  /// <summary>
  /// Deletes the file(s) specified in AFilename.
  /// </summary>
  /// <param name="AFilename">
  /// The file(s) to delete. If more than 1 file is specified they must be
  /// separated by #0. You may also specify a folder name (to recurively empty
  /// the folder) and you may specify wildcards as well. The wildcard *.* WILL
  /// recursively empty the folder.
  /// </param>
  /// <param name="AHWND">
  /// Handle to the parent window. Default: 0 (no parent)
  /// </param>
  /// <param name="AUndo">
  /// Flag to indicate if the action can be reversed. (If TRUE then files are
  /// moved to the recycle bin, otherwise they are permanently removed.)
  /// Default: FALSE
  /// </param>
  /// <returns>
  /// Returns TRUE if the file(s) were removed, FALSE otherwise.
  /// </returns>
  /// <remarks>
  /// Calls the Windows Shell to delete the file(s).
  /// </remarks>
function DeleteFile(AFilename: String; AHWND: THandle = 0;
  AUndo: Boolean = False): Boolean;

/// <summary>
/// Removes all files/folders contained in AFolder.
/// </summary>
/// <param name="AFolder">
/// The name of the folder to empty.
/// </param>
/// <param name="AHWND">
/// Handle to the parent window. Default: 0 (no parent)
/// </param>
/// <param name="AUndo">
/// Flag to indicate if the action can be reversed. (If TRUE then files are
/// moved to the recycle bin, otherwise they are permanently removed.)
/// Default: FALSE
/// </param>
/// <returns>
/// Returns TRUE if the folder was emptied, FALSE otherwise.
/// </returns>
/// <remarks>
/// Calls ATWindows.DeleteFile to empty the folder after checking to make
/// sure the folder exists.
/// </remarks>
function EmptyFolder(const AFolder: String; AHWND: THandle = 0;
  AUndo: Boolean = False): Boolean;

/// <summary>
/// Opens a Windows Explorer window displaying the contents of AFolder.
/// </summary>
/// <param name="AFolder">
/// The name of the folder whos conents you wish to display.
/// </param>
/// <param name="AHWND">
/// Handle to the parent window. Default: 0 (no parent)
/// </param>
/// <param name="AExploreType">
/// The type of Explorer window to display. Default: etFolder
/// </param>
/// <param name="AShowCmd">
/// The windows show type. Default: SW_NORMAL
/// </param>
/// <returns>
/// Returns TRUE if successful, FALSE otherwise.
/// </returns>
function ExploreFolder(const AFolder: String; const AHWND: THandle = 0;
  const AExploreType: TExploreType = etFolder;
  const AShowCmd: Integer = SW_NORMAL): Boolean;

/// <summary>
/// Retrieves the name of the workstation.
/// </summary>
/// <returns>
/// Returns a string containing the name of the workstation.
/// </returns>
function GetComputer: TComputerName;

/// <summary>
/// Retrieves the name of the folder where the application's executable
/// resides.
/// </summary>
/// <returns>
/// Returns a string containing the name of the folder where the
/// application's executable is located.
/// </returns>
function GetExeFolder: String;

/// <summary>
/// Retrieves the name of the application's executable
/// </summary>
/// <returns>
/// Returns a string containing the name of the application's executable.
/// </returns>
function GetExeName: String;

/// <summary>
/// Retrieves the long version of a filename in 8.3 format.
/// </summary>
/// <param name="AFileName">
/// A filename in 8.3 format.
/// </param>
/// <returns>
/// Returns a string containing the long version of AFileName.
/// </returns>
function GetLongFileName(Const AFilename: String): String;

/// <summary>
/// Retrieves the OS version information.
/// </summary>
/// <returns>
/// Returns a TOSVersionInfor structure containing the OS version information.
/// </returns>
function GetOSVersion: TOSVersionInfo;

/// <summary>
/// Retrieves the OS platform information.
/// </summary>
/// <returns>
/// Returns a TOSPlatform value containing the platform type.
/// </returns>
function GetOSPlatform: TOSPlatform;

/// <summary>
/// Retrieves the name of the currently logged in user.
/// </summary>
/// <returns>
/// Returns a string containing the name of the currently logged in user.
/// </returns>
function GetOSUserName: TOSUserName;

/// <summary>
/// Retrieves the name of the company that Windows is registered to.
/// </summary>
/// <returns>
/// Returns a string containing the name of the company that Windows is
/// registered to.
/// </returns>
function GetRegCompany: TRegCompany;

/// <summary>
/// Retrieves the name of the person that Windows is registered to.
/// </summary>
/// <remarks>
/// Returns a string containing the name of the person that Windows is
/// registered to.
/// </remarks>
function GetRegOwner: TRegOwner;

/// <summary>
/// Retrieves the short (8.3) name of AFileName.
/// </summary>
/// <param name="AFileName">
/// The name of a file.
/// </param>
/// <returns>
/// Returns a string containing the short (8.3) version of AFileName.
/// </returns>
function GetShortFileName(Const AFilename: String): String;

/// <summary>
/// Retrieves the location of the Windows System folder.
/// </summary>
/// <returns>
/// Returns a string containing the name of the Windows System folder.
/// </returns>
function GetSysDir: TDirectoryName;

/// <summary>
/// Retrieves the location of the Windows Temporary folder.
/// </summary>
/// <returns>
/// Returns a string containing the name of the Windows Temporary folder.
/// </returns>
function GetTempDir: TDirectoryName;

/// <summary>
/// Calculates a name for a temporary file, and optionally creates the file.
/// </summary>
/// <param name="bCreate">
/// Should the temp file be created? Default: TRUE
/// </param>
/// <param name="sPrefix">
/// Prefix for the temp filename. Default: 'tmp'
/// </param>
/// <returns>
/// Returns a string containing the name of the temp file.
/// </returns>
function GetTempFile(const bCreate: Boolean = True;
  const sPrefix: String = 'tmp'): TFileName;

/// <summary>
/// Retrieves the location of the Windows folder.
/// </summary>
/// <returns>
/// Returns a string containing the name of the Windows folder.
/// </returns>
function GetWinDir: TDirectoryName;

/// <summary>
/// Opens the default web browser and navigates the to specified URL.
/// </summary>
/// <param name="sURL">
/// The URL to navigate to.
/// </param>
/// <param name="aHWND">
/// Handle to the parent window. Default: 0 (no parent)
/// </param>
/// <param name="iShowCmd">
/// The windows show type. Default: SW_NORMAL
/// </param>
/// <returns>
/// Returns TRUE if successful, FALSE otherwise.
/// </returns>
function GotoURL(const sURL: String; const AHWND: THandle = 0;
  const iShowCmd: Integer = SW_NORMAL): Boolean;

/// <summary>
/// Check if Caps Lock is enabled.
/// </summary>
/// <returns>
/// Returns TRUE if Caps Lock is enabled, FALSE otherwise.
/// </returns>
function IsCapsLockOn: Boolean;

/// <summary>
/// Check if Control is pressed.
/// </summary>
/// <remarks>
/// Returns TRUE if the Control Key is pressed, FALSE otherwise.
/// </remarks>
function IsControlPressed: Boolean;

/// <summary>
/// Check if Num Lock is enabled.
/// </summary>
/// <returns>
/// Returns TRUE if Num Lock is enabled, FALSE otherwise.
/// </returns>
function IsNumLockOn: Boolean;

/// <summary>
/// Check if Scroll Lock is enabled.
/// </summary>
/// <remarks>
/// Returns TRUE if Scroll Lock is enabled, FALSE otherwise.
/// </remarks>
function IsScrollLockOn: Boolean;

function SelectFolder(const ATitle: string; var ADir: string): Boolean;

/// <summary>
/// Opens the system Date/Time properties control panel.
/// </summary>
procedure SetSystemDateTime;

/// <summary>
///   Runs an external application using the ShellExecuteEx windows
///   API call and waits for it to finish.
/// </summary>
/// <param name="ACommand">
///   The name of the executable or file to run/open.
/// </param>
/// <param name="AParams">
///   Any parameters to pass to the executable.
/// </param>
/// <param name="AVisibility">
///   The visibility constant.
/// </param>
/// <param name="ARunElevated">
///   Should the program run as administrator? True for admin, False
///   for normal.
/// </param>
/// <returns>
///   True if the app ran successfully, false otherwise.
/// </returns>
/// <remarks>
///   This function blocks the calling thread until the external app
///   closes.
/// </remarks>
function ShellExecuteAndWait(const ACommand, AParams: String; const
    AVisibility: Integer; const ARunElevated: Boolean = False): Boolean;

    /// <summary>
/// Replaces all occurrences of ACharToChange in AVal with ACharToUse.
/// </summary>
/// <param name="AVal">
/// The string to search in.
/// </param>
/// <param name="ACharToChange">
/// The character to search for.
/// </param>
/// <param name="ACharToUse">
/// The character to change ACharToChange to.
/// </param>
/// <returns>
/// Returns a copy of AVal where all instance of ACharToChange have been
/// replaced with ACharToUse.
/// </returns>
function SubstChar(const AVal: String;
  const ACharToChange, ACharToUse: Char): String;

/// <summary>
/// Toggles the state of the Caps Lock key.
/// </summary>
procedure ToggleCapsLock;

/// <summary>
/// Toggles the state of the Num Lock key.
/// </summary>
procedure ToggleNumLock;

/// <summary>
/// Toggles the state of the Scroll Lock key.
/// </summary>
procedure ToggleScrollLock;

/// <summary>
/// Retrieves the maximum size of an OS user name.
/// </summary>
/// <remarks>
/// Returns the maximum size of an OS user name.
/// </remarks>
function UserNameSize: LongInt;

/// <summary>
/// Executes the command passed in APath and waits for it to finish.
/// </summary>
/// <param name="APath">
/// The path to the executable to run. You may pass parameters to the
/// command here.
/// </param>
/// <param name="AVisibility">
/// The windows show value. Can pass any SW_xxx value.
/// </param>
/// <returns>
/// Returns 0 if successful, otherwise returns an error code.
/// </returns>
function WinExecAndWait32(APath: PChar; AVisibility: Word): Integer;

implementation

uses
  Winapi.ShellAPI, System.Win.Registry, AT.Windows.System,
  AT.Strings.Replace, Winapi.ShlObj, WinApi.ActiveX, AT.GarbageCollector;

type
  TRegInfoData = String;
  TRegInfoItem = (riOwner, riCompany);

function DeleteFile(AFilename: String; AHWND: THandle = 0;
  AUndo: Boolean = False): Boolean;
var
  FOp: TShFileOpStruct;
begin
  ZeroMemory(@FOp, SizeOf(TShFileOpStruct));
  FOp.Wnd := AHWND;
  FOp.wFunc := FO_DELETE;
  FOp.pFrom := PChar(AFilename + #0);

  FOp.fFlags := FOF_NOCONFIRMATION OR FOF_SILENT;

  if (AUndo) then
    FOp.fFlags := FOp.fFlags OR FOF_ALLOWUNDO;

  Result := (SHFileOperation(FOp) = 0);
end; // DeleteFile

function EmptyFolder(const AFolder: String; AHWND: THandle = 0;
  AUndo: Boolean = False): Boolean;
var
  sFldr: String;
begin

  sFldr := IncludeTrailingPathDelimiter(AFolder);
  // Save folder name to local storage...

  Result := DirectoryExists(sFldr); // Check if folder exists...
  // Result is FALSE if folder does not exist, TRUE if it does...

  if (Result) then // if folder exists...
    begin
      sFldr := Format('%s*.*', [AFolder]);
      // Append \*.* to folder name...
      Result := DeleteFile(sFldr, AHWND, AUndo); // Delete files...
    end;

end; // EmptyFolder...

function ExploreFolder(const AFolder: String; const AHWND: THandle = 0;
  const AExploreType: TExploreType = etFolder;
  const AShowCmd: Integer = SW_NORMAL): Boolean;
const
  sBadFormat =
    'The .EXE file is invalid (non-Win32 .EXE or error in .EXE '
    + 'image.';
  sDDEBusy = 'The DDE transaction could not be completed because other ' +
    'DDE transactions were being processed.';
  sDDEFail = 'The DDE transaction failed.';
  sDDETimeOut = 'The DDE transaction could not be completed because the '
    + 'request timed out.';
  sDLLNotFound = 'The specified dynamic-link library was not found.';
  sOutOfMemory = 'The operating system is out of memory.';
  sPathNotFound = 'The specified path was not found.';
  sShareError = 'A sharing voilation occurred.';
  sUnknownErr = 'An unexpected error occurred.';
  sURLBadAssoc = 'The application association for folders is incomplete '
    + 'or invalid.';
  sURLNoAccess = 'Access to folder "%s" has been denied.';
  sURLNotFound = 'The specified folder "%s" was not found.';
var
  Res: HINST;
  sVal: String;
  sCmd: String;
begin
  try
    if (AExploreType = etExplore) then
      sCmd := 'EXPLORE'
    else
      sCmd := 'OPEN';

    Res := ShellExecute(AHWND, PChar(sCmd), PChar(AFolder), '', '',
      AShowCmd);
    Result := (Res > 32);

    if (NOT Result) then
      begin
        case Res of
          0, SE_ERR_OOM:
            EOutOfMemory.Create(sOutOfMemory);
          ERROR_FILE_NOT_FOUND:
            EExploreNotFound.CreateFmt(sURLNotFound, [AFolder]);
          SE_ERR_ACCESSDENIED:
            EExploreNoAccess.CreateFmt(sURLNoAccess, [AFolder]);
          SE_ERR_NOASSOC, SE_ERR_ASSOCINCOMPLETE:
            EExploreBadAssoc.Create(sURLBadAssoc);
        else
          case Res of
            ERROR_PATH_NOT_FOUND:
              sVal := sPathNotFound;
            ERROR_BAD_FORMAT:
              sVal := sBadFormat;
            SE_ERR_DDEBUSY:
              sVal := sDDEBusy;
            SE_ERR_DDEFAIL:
              sVal := sDDEFail;
            SE_ERR_DDETIMEOUT:
              sVal := sDDETimeOut;
            SE_ERR_DLLNOTFOUND:
              sVal := sDLLNotFound;
            SE_ERR_SHARE:
              sVal := sShareError;
          else
            sVal := sUnknownErr;
          end;
          EExploreGenError.CreateErr(sVal, Res, AFolder)
        end;
      end;

  except
    Result := False;
  end;

end; // ExploreFolder...

function GetComputer: TComputerName;
var
  iSize: Cardinal;
  sName: String;
  bOk: Boolean;
  sRes: String;
begin
  iSize := 1024;
  SetLength(sName, iSize);
  bOk := GetComputerName(PChar(sName), iSize);
  if (bOk) then
    begin
      SetLength(sName, iSize);
      sRes := sName;
    end
  else
    sRes := '';

  Result := sRes;

end;

function GetExeFolder: String;
var
  sFolder: String;
begin
  sFolder := ParamStr(0);
  sFolder := ExpandFileName(sFolder);
  sFolder := ExtractFilePath(sFolder);
  sFolder := IncludeTrailingPathDelimiter(sFolder);
  Result := sFolder;
end;

function GetExeName: String;
var
  sFilename: String;
begin
  sFilename := ParamStr(0);
  sFilename := ExpandFileName(sFilename);
  sFilename := ExtractFileName(sFilename);
  Result := sFilename;
end;

function GetLongFileName(Const AFilename: String): String;
var
  aInfo: TSHFileInfo;
begin
  if SHGetFileInfo(PChar(AFilename), 0, aInfo, SizeOf(aInfo),
    SHGFI_DISPLAYNAME) <> 0 then
    Result := String(aInfo.szDisplayName)
  else
    Result := AFilename;

end;

function GetOSVersion: TOSVersionInfo;
begin

  Result.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  if (NOT(GetVersionEx(Result))) then
    raise EOSVersionError.Create
      ('Could not retrieve OS Version information.');

end;

function GetOSPlatform: TOSPlatform;
begin

  case GetOSVersion.dwPlatformId of
    VER_PLATFORM_WIN32s:
      Result := osWin3x;
    VER_PLATFORM_WIN32_WINDOWS:
      Result := osWin9x;
    VER_PLATFORM_WIN32_NT:
      Result := osWinNT;
  else
    Result := osUnknown;
  end;

end;

function GetOSUserName: TOSUserName;
var
  iSize: Cardinal;
  UserName: String;
  bOk: Boolean;
  sRes: String;
begin
  iSize := 1024;
  SetLength(UserName, iSize);
  bOk := GetUserName(PChar(UserName), iSize);
  if (bOk) then
    begin
      SetLength(UserName, iSize - 1);
      sRes := UserName;
    end
  else
    sRes := '';

  Result := sRes;
end;

function GetRegInfo(const aItem: TRegInfoItem;
  var sValue: TRegInfoData): Boolean;
const
  sWin95Key = '\SOFTWARE\Microsoft\Windows\CurrentVersion';
  sWinNTKey = '\SOFTWARE\Microsoft\Windows NT\CurrentVersion';
var
  sKey: String;
  Reg: TRegistry;
  sItem: String;
begin

  case GetOSPlatform of
    osWin9x:
      sKey := sWin95Key;
    osWinNT:
      sKey := sWinNTKey;
  else
    sValue := '';
    Result := False;
    Exit;
  end;

  Result := False;
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if (Reg.OpenKey(sKey, False)) then
      begin
        case aItem of
          riOwner:
            sItem := 'RegisteredOwner';
          riCompany:
            sItem := 'RegisteredOrganization';
        end;
        sValue := Reg.ReadString(sItem);
        Result := True;
      end;
  finally
    Reg.Free;
  end;

end;

function GetRegCompany: TRegCompany;
const
  sMsg = 'Could not find the registered company in the Windows registry';
var
  sValue: String;
begin

  if (GetRegInfo(riCompany, sValue)) then
    Result := sValue
  else
    raise ERegCompanyError.Create(sMsg);

end;

function GetRegOwner: TRegOwner;
const
  sMsg = 'Could not find the registered owner in the Windows registry';
var
  sValue: String;
begin

  if (GetRegInfo(riOwner, sValue)) then
    Result := sValue
  else
    raise ERegUserError.Create(sMsg);

end;

function GetShortFileName(Const AFilename: String): String;
var
  aTmp: array [0 .. 255] of Char;
  sRes: String;
begin
  if (GetShortPathName(PChar(AFilename), aTmp, SizeOf(aTmp) - 1) = 0) then
    sRes := AFilename
  else
    sRes := StrPas(aTmp);

  Result := sRes;
end;

function GetSysDir: TDirectoryName;
var
  iSize: Cardinal;
  sDir: String;
  bOk: Boolean;
  sRes: String;
begin
  iSize := MAX_PATH;
  SetLength(sDir, iSize);
  iSize := GetSystemDirectory(PChar(sDir), iSize);
  bOk := (iSize > 0);
  if (bOk) then
    begin
      SetLength(sDir, iSize);
      sRes := sDir;
    end
  else
    sRes := '';

  Result := sRes;
end;

function GetTempDir: TDirectoryName;
var
  iSize: Cardinal;
  sDir: String;
  bOk: Boolean;
  sRes: String;
begin
  iSize := MAX_PATH;
  SetLength(sDir, iSize);
  iSize := GetTempPath(iSize, PChar(sDir));
  bOk := (iSize > 0);

  if (bOk) then
    begin
      SetLength(sDir, iSize);
      sRes := sDir;
    end
  else
    sRes := 'C:\';

  Result := ExcludeTrailingPathDelimiter(sRes);
end;

function GetTempFile(const bCreate: Boolean = True;
  const sPrefix: String = 'tmp'): TFileName;
var
  iSize: Cardinal;
  sFN: String;
  bOk: Boolean;
  sRes: String;
begin
  iSize := MAX_PATH;
  SetLength(sFN, iSize);

  iSize := GetTempFileName(PChar(GetTempDir), PChar(sPrefix), 0,
    PChar(sFN));
  bOk := (iSize > 0);

  if (bOk) then
    begin
      SetLength(sFN, iSize);
      sRes := sFN;
    end
  else
    sRes := '';

  if (NOT bCreate) then
    DeleteFile(sRes);

  Result := sRes;
end;

function GetWinDir: TDirectoryName;
var
  iSize: Cardinal;
  sDir: String;
  bOk: Boolean;
  sRes: String;
begin
  iSize := MAX_PATH;
  SetLength(sDir, iSize);
  iSize := GetWindowsDirectory(PChar(sDir), iSize);
  bOk := (iSize > 0);

  if (bOk) then
    begin
      SetLength(sDir, iSize);
      sRes := sDir;
    end
  else
    sRes := '';

  Result := sRes;
end;

function GotoURL(const sURL: String; const AHWND: THandle = 0;
  const iShowCmd: Integer = SW_NORMAL): Boolean;
const
  sBadFormat =
    'The .EXE file is invalid (non-Win32 .EXE or error in .EXE '
    + 'image.';
  sDDEBusy = 'The DDE transaction could not be completed because other ' +
    'DDE transactions were being processed.';
  sDDEFail = 'The DDE transaction failed.';
  sDDETimeOut = 'The DDE transaction could not be completed because the '
    + 'request timed out.';
  sDLLNotFound = 'The specified dynamic-link library was not found.';
  sOutOfMemory = 'The operating system is out of memory.';
  sPathNotFound = 'The specified path was not found.';
  sShareError = 'A sharing voilation occurred.';
  sUnknownErr = 'An unexpected error occurred.';
  sURLBadAssoc =
    'The application association for web pages is incomplete ' +
    'or invalid.';
  sURLNoAccess = 'Access to URL "%s" has been denied.';
  sURLNotFound = 'The specified URL "%s" was not found.';
var
  Res: HINST;
  sVal: String;
begin
  try
    Res := ShellExecute(AHWND, 'OPEN', PChar(sURL), '', '', iShowCmd);
    Result := (Res > 32);
    if (NOT Result) then
      begin
        case Res of
          0, SE_ERR_OOM:
            EOutOfMemory.Create(sOutOfMemory);
          ERROR_FILE_NOT_FOUND:
            EURLNotFound.CreateFmt(sURLNotFound, [sURL]);
          SE_ERR_ACCESSDENIED:
            EURLNoAccess.CreateFmt(sURLNoAccess, [sURL]);
          SE_ERR_NOASSOC, SE_ERR_ASSOCINCOMPLETE:
            EURLBadAssoc.Create(sURLBadAssoc);
        else
          case Res of
            ERROR_PATH_NOT_FOUND:
              sVal := sPathNotFound;
            ERROR_BAD_FORMAT:
              sVal := sBadFormat;
            SE_ERR_DDEBUSY:
              sVal := sDDEBusy;
            SE_ERR_DDEFAIL:
              sVal := sDDEFail;
            SE_ERR_DDETIMEOUT:
              sVal := sDDETimeOut;
            SE_ERR_DLLNOTFOUND:
              sVal := sDLLNotFound;
            SE_ERR_SHARE:
              sVal := sShareError;
          else
            sVal := sUnknownErr;
          end;
          EURLGenError.CreateErr(sVal, Res, sURL)
        end;
      end;
  except
    Result := False;
  end;
end;

function IsCapsLockOn: Boolean;
var
  KeyState: TKeyboardState;
begin
  GetKeyboardState(KeyState);

  // simulate key events (down + up)
  Result := (KeyState[VK_CAPITAL] = 1);
end;

function IsControlPressed: Boolean;
// const
// V: SmallInt = $FFFFFF80;
var
  I: SmallInt;
  // J: SmallInt;
begin
  I := GetKeyState(VK_CONTROL);
  // J := I AND V;
  // Result := (J = V);
  Result := (I > 0);
end;

function IsNumLockOn: Boolean;
var
  KeyState: TKeyboardState;
begin
  GetKeyboardState(KeyState);

  // simulate key events (down + up)
  Result := (KeyState[VK_NUMLOCK] = 1);
end;

function IsScrollLockOn: Boolean;
var
  KeyState: TKeyboardState;
begin
  GetKeyboardState(KeyState);

  // simulate key events (down + up)
  Result := (KeyState[VK_SCROLL] = 1);
end;

function SelectFolder(const ATitle: string; var ADir: string): Boolean;
var
  FolderDialog : IFileDialog;
  hr: HRESULT;
  IResult: IShellItem;
  FileName: PChar;
  Settings: DWORD;
  lpItemID : PItemIDList;
  BrowseInfo : TBrowseInfo;
  DisplayName : array[0..MAX_PATH] of char;
  TempPath : array[0..MAX_PATH] of char;
begin
  //Is Vista+?
  if (Win32MajorVersion >= 6) then
    begin
      hr := CoCreateInstance(CLSID_FileOpenDialog,
                   nil,
                   CLSCTX_INPROC_SERVER,
                   IFileDialog,
                   FolderDialog);

      Result := (hr = S_OK);

      if (Result) then
        begin
          FolderDialog.GetOptions(Settings);
          FolderDialog.SetOptions(Settings or FOS_PICKFOLDERS);
          FolderDialog.GetOptions(Settings);
          FolderDialog.SetOptions(Settings or FOS_FORCEFILESYSTEM);
          FolderDialog.SetOkButtonLabel(PChar('Select'));
          FolderDialog.SetTitle(PChar(ATitle));

          hr := FolderDialog.Show(0);

          Result := (hr = S_OK);

          if (Result) then
            begin
              hr := FolderDialog.GetResult(IResult);

              Result := (hr = S_OK);

              if (Result) then
                begin
                  IResult.GetDisplayName(SIGDN_FILESYSPATH,FileName);
                  ADir := FileName;
                end;
            end;
        end;
    end
  else   //Win XP...
    begin
      FillChar(BrowseInfo, sizeof(TBrowseInfo), #0);

      with BrowseInfo do
        begin
          hwndOwner := 0;
          pszDisplayName := @DisplayName;
          lpszTitle := PChar(ATitle);
          ulFlags := BIF_USENEWUI OR BIF_RETURNONLYFSDIRS;
        end;

      lpItemID := SHBrowseForFolder(BrowseInfo);

      Result := (Assigned(lpItemID));

      if (Result) then
        begin
          SHGetPathFromIDList(lpItemID, TempPath);
          ADir := TempPath;
          GlobalFreePtr(lpItemID);
        end;
    end;
end;

procedure SetSystemDateTime;
begin
  ShellExecuteAndWait('control.exe', 'date/time', SW_SHOW);
end;

function ShellExecuteAndWait(const ACommand, AParams: String; const
    AVisibility: Integer; const ARunElevated: Boolean = False): Boolean;
var
  AProcInfo: TShellExecuteInfo;
begin
  FillChar(AProcInfo, SizeOf(TShellExecuteInfo), 0);

  AProcInfo.cbSize := SizeOf(TShellExecuteInfo);

  if (ARunElevated) then
    AProcInfo.lpVerb := 'runas'
  else
    AProcInfo.lpverb := 'open';

  AProcInfo.lpFile := PChar(ACommand);
  AProcInfo.lpParameters := PChar(AParams);
  AProcInfo.nShow := AVisibility;

  Result := ShellExecuteEx(@AProcInfo);

  if (Result) then
    begin
      WaitForSingleObject(AProcInfo.hProcess, INFINITE);
      CloseHandle(AProcInfo.hProcess);
    end;
end;

function SubstChar(const AVal: String;
  const ACharToChange, ACharToUse: Char): String;
var
  iPos: LongInt;
begin
  Result := AVal;
  iPos := Pos(ACharToChange, Result);
  while (iPos > 0) do
    begin
      Result[iPos] := ACharToUse;
      iPos := Pos(ACharToChange, Result);
    end;
end;

function UserNameSize: LongInt;
begin
  Result := SizeOf(TOSUserName);
end;

procedure ToggleStateKey(AKey: Byte);
var
  KeyState: TKeyboardState;
begin
  GetKeyboardState(KeyState);

  // simulate key events (down + up)
  if (KeyState[AKey] = 0) then
    begin
      Keybd_Event(AKey, 1, KEYEVENTF_EXTENDEDKEY or 0, 0);
      Keybd_Event(AKey, 1, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
    end
  else
    begin
      Keybd_Event(AKey, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
      Keybd_Event(AKey, 0, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
    end;
end;

procedure ToggleCapsLock;
var
  Key: Byte;
begin
  Key := VK_CAPITAL;

  ToggleStateKey(Key);
end;

procedure ToggleNumLock;
var
  Key: Byte;
begin
  Key := VK_NUMLOCK;

  ToggleStateKey(Key);
end;

procedure ToggleScrollLock;
var
  Key: Byte;
begin
  Key := VK_SCROLL;

  ToggleStateKey(Key);
end;

function WinExecAndWait32(APath: PChar; AVisibility: Word): Integer;
var
  Msg: TMsg;
  lpExitCode: Cardinal;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
begin
  FillChar(StartupInfo, SizeOf(TStartupInfo), 0);
  with StartupInfo do
    begin
      cb := SizeOf(TStartupInfo);
      dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
      wShowWindow := AVisibility;
      { you could pass sw_show or sw_hide as parameter }
    end;
  if CreateProcess(nil, APath, nil, nil, False, NORMAL_PRIORITY_CLASS,
    nil, nil, StartupInfo, ProcessInfo) then
    begin
      repeat
        while PeekMessage(Msg, 0, 0, 0, pm_Remove) do
          begin
            if Msg.Message = wm_Quit then
              Halt(Msg.WParam);
            TranslateMessage(Msg);
            DispatchMessage(Msg);
          end;
        GetExitCodeProcess(ProcessInfo.hProcess, lpExitCode);
      until lpExitCode <> Still_Active;
      with ProcessInfo
        do { not sure this is necessary but seen in in some code elsewhere }
        begin
          CloseHandle(hThread);
          CloseHandle(hProcess);
        end;
      Result := 0; { success }
    end
  else
    Result := GetLastError;
  { error occurs during CreateProcess see help for details }
end;

{ EURLGenError }

{
  ********************************* EURLGenError *********************************
}
{
  ********************************* EURLGenError *********************************
}
constructor EURLGenError.CreateErr(const Msg: String;
  const iErrCode: Integer; const sURL: String);
begin
  inherited Create(Msg);
  FErrorCode := iErrCode;
  FURL := sURL;
end;

{ EExploreGenError }

{
  ******************************* EExploreGenError *******************************
}
{
  ******************************* EExploreGenError *******************************
}
constructor EExploreGenError.CreateErr(const Msg: String;
  const iErrCode: Integer; const sFolder: String);
begin
  inherited Create(Msg);
  FErrorCode := iErrCode;
  FFolder := sFolder;
end;

end.
