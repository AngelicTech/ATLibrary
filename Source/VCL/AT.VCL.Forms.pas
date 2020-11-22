// ****************************************************************************
//
// Program Name   : - AT Library -
// Program Version: 1.00
// Filenames      : AT.Windows.pas
// File Version   : 1.10
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
// v1.10   :   Fixed ProcessFormEnterKeyPress
//               - Now takes Shift State into account...
//               - Checks for valid form before proceeding...
//
// ****************************************************************************
//
// COPYRIGHT © 2013-Present Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ****************************************************************************

unit AT.VCL.Forms;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Winapi.CommDlg, System.Classes;

/// <summary>
/// Displays the OS Open Dialog.
/// </summary>
/// <param name="ParentHwnd">
/// Handle to the parent window.
/// </param>
/// <param name="sDefExt">
/// The default file extension.
/// </param>
/// <param name="sFilter">
/// The list of filename filters.
/// </param>
/// <param name="sInitialDir">
/// The initial folder to display.
/// </param>
/// <param name="sTitle">
/// The title of the Open dialog box.
/// </param>
/// <param name="sFilename">
/// A variable to receive the selected filename.
/// </param>
/// <param name="bMustExist">
/// If TRUE then the file must exist.
/// </param>
/// <param name="bOverwritePrompt">
/// If TRUE then prompt to overwrite a file that exists.
/// </param>
/// <param name="bNoChangeDir">
/// If TRUE do not allow user to change folders.
/// </param>
/// <returns>
/// Returns TRUE if user clicks OPEN button, FALSE otherwise.
/// </returns>
function OpenFileDialog(ParentHwnd: HWND; const sDefExt: String;
  const sFilter: String; const sInitialDir: String; const sTitle: String;
  var sFilename: String; const bMustExist: Boolean = False;
  const bOverwritePrompt: Boolean = False;
  const bNoChangeDir: Boolean = False): Boolean;

/// <summary>
/// Processes the ENTER key for forms. If ENTER key is pressed tell AFrm to
/// move to the next dialog control in the tab chain.
/// </summary>
/// <param name="AFrm">
/// The form to process ENTER keystrokes for.
/// </param>
/// <param name="AKey">
/// A variable containing the key that was pressed.
/// </param>
procedure ProcessFormEnterKeyPress(AFrm: TCustomForm; var AKey: Char; AShift:
    TShiftState);

/// <summary>
/// Displays the OS Save Dialog.
/// </summary>
/// <param name="ParentHwnd">
/// Handle to the parent window.
/// </param>
/// <param name="sDefExt">
/// The default file extension.
/// </param>
/// <param name="sFilter">
/// The list of filename filters.
/// </param>
/// <param name="sInitialDir">
/// The initial folder to display.
/// </param>
/// <param name="sTitle">
/// The title of the Save dialog box.
/// </param>
/// <param name="sFilename">
/// A variable to receive the selected filename.
/// </param>
/// <param name="bMustExist">
/// If TRUE then the file must exist.
/// </param>
/// <param name="bOverwritePrompt">
/// If TRUE then prompt to overwrite a file that exists.
/// </param>
/// <param name="bNoChangeDir">
/// If TRUE do not allow user to change folders.
/// </param>
/// <returns>
/// Returns TRUE if user clicks SAVE button, FALSE otherwise.
/// </returns>
function SaveFileDialog(ParentHwnd: HWND; const sDefExt: String;
  const sFilter: String; const sInitialDir: String; const sTitle: String;
  var sFilename: String; const bMustExist: Boolean = False;
  const bOverwritePrompt: Boolean = False;
  const bNoChangeDir: Boolean = False): Boolean;

implementation

uses
  Winapi.ShellAPI, System.Win.Registry, AT.Windows.System,
  AT.Strings.Replace;

function OpenFileDialog(ParentHwnd: HWND; const sDefExt: String;
  const sFilter: String; const sInitialDir: String; const sTitle: String;
  var sFilename: String; const bMustExist: Boolean = False;
  const bOverwritePrompt: Boolean = False;
  const bNoChangeDir: Boolean = False): Boolean;
var
  ofn   : TOpenFileName;
  szFile: array [0 .. MAX_PATH] of Char;
begin
  Result := False;
  FillChar(ofn, SizeOf(TOpenFileName), 0);
  with ofn do
    begin
      lStructSize := SizeOf(TOpenFileName);
      hwndOwner := ParentHwnd;
      lpstrFile := szFile;
      nMaxFile := SizeOf(szFile);
      if (sTitle <> '') then
        lpstrTitle := PChar(sTitle);
      if (sInitialDir <> '') then
        lpstrInitialDir := PChar(sInitialDir);
      StrPCopy(lpstrFile, sFilename);
      lpstrFilter := PChar(StrReplace(sFilter, '|', #0) + #0#0);
      if sDefExt <> '' then
        lpstrDefExt := PChar(sDefExt);
    end;

  if bMustExist then
    ofn.Flags := ofn.Flags or OFN_FILEMUSTEXIST;

  if bOverwritePrompt then
    ofn.Flags := ofn.Flags or OFN_OVERWRITEPROMPT;

  if bNoChangeDir then
    ofn.Flags := ofn.Flags or OFN_NOCHANGEDIR;

  if GetOpenFileName(ofn) then
    begin
      Result := True;
      sFilename := StrPas(szFile);
    end;
end;

procedure ProcessFormEnterKeyPress(AFrm: TCustomForm; var AKey: Char; AShift:
    TShiftState);
begin
  if (NOT Assigned(AFrm)) then
    Exit;

  if ( (AShift = []) AND (AKey = #13) ) then
    begin
      AKey := #0;
      AFrm.Perform(WM_NEXTDLGCTL, 0, 0);
    end;
end;

function SaveFileDialog(ParentHwnd: HWND; const sDefExt: String;
  const sFilter: String; const sInitialDir: String; const sTitle: String;
  var sFilename: String; const bMustExist: Boolean = False;
  const bOverwritePrompt: Boolean = False;
  const bNoChangeDir: Boolean = False): Boolean;
var
  ofn   : TOpenFileName;
  szFile: array [0 .. MAX_PATH] of Char;
begin
  Result := False;
  FillChar(ofn, SizeOf(TOpenFileName), 0);
  with ofn do
    begin
      lStructSize := SizeOf(TOpenFileName);
      hwndOwner := ParentHwnd;
      lpstrFile := szFile;
      nMaxFile := SizeOf(szFile);
      if (sTitle <> '') then
        lpstrTitle := PChar(sTitle);
      if (sInitialDir <> '') then
        lpstrInitialDir := PChar(sInitialDir);
      StrPCopy(lpstrFile, sFilename);
      lpstrFilter := PChar(StrReplace(sFilter, '|', #0) + #0#0);
      if sDefExt <> '' then
        lpstrDefExt := PChar(sDefExt);
    end;

  if bMustExist then
    ofn.Flags := ofn.Flags or OFN_FILEMUSTEXIST;

  if bOverwritePrompt then
    ofn.Flags := ofn.Flags or OFN_OVERWRITEPROMPT;

  if bNoChangeDir then
    ofn.Flags := ofn.Flags or OFN_NOCHANGEDIR;

  if GetSaveFileName(ofn) then
    begin
      Result := True;
      sFilename := StrPas(szFile);
    end;
end;

end.
