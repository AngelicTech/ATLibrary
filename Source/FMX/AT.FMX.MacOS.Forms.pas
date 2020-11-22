// ******************************************************************
//
// Program Name   : AT Library
// Program Version: 1.00
// Platform(s)    : OSX
// Framework      : FireMonkey
//
// Filename       : AT.FMX.MacOS.Forms.pas
// File Version   : 1.10
// Date Created   : 15-AUG-2015
// Author         : Matthew S. Vesperman
//
// Description:
//
// This code unit contains functions for working with FireMonkey
// forms under Mac OSX.
//
// Revision History:
//
// v1.00   :   Initial version
// v1.10   :   18-SEP-2015
//             + Added HideFormFromShowAllWindows
//
// ******************************************************************
//
// COPYRIGHT © 2015 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************


unit AT.FMX.MacOS.Forms;

interface

uses
  System.Classes, Macapi.AppKit, FMX.Forms, AT.MacOS.SheetDelegate,
  AT.MacOS.AlertDelegate;

type
  TATAlertResult = (arUnknown, arButton1, arButton2, arButton3);
  TATAlertType = (atInfo, atWarn, atCritical);

/// <summary>Retrieves the NSView interface for a FireMonkey form.
/// </summary>
/// <returns>A reference to a NSView interface.
/// </returns>
/// <param name="AForm">(TCommonCustomForm) - The form you need the NSView
/// interface for.</param>
function NSViewOfForm(AForm: TCommonCustomForm): NSView;
/// <summary>Retrieves the NSWindow interface for a FireMonkey form.
/// </summary>
/// <returns>A reference to a NSWindow interface.
/// </returns>
/// <param name="AForm">(TCommonCustomForm) - The form you need the NSWindow
/// interface for.</param>
function NSWindowOfForm(AForm: TCommonCustomForm): NSWindow;
/// <summary>Determines if a FireMonkey form is a Mac OSX sheet window.
/// </summary>
/// <returns>A Boolean value indicating if the form referenced by AForm is a Mac
/// OSX sheet window.
/// </returns>
/// <param name="AForm">(TCommonCustomForm) - The form you need to check.
///  </param>
function IsFormSheet(AForm: TCommonCustomForm): Boolean;
/// <summary>Instructs Mac OSX to close a FireMonkey form that is being used as
///  a sheet window.
/// </summary>
/// <param name="AForm">(TCommonCustomForm) - The FireMonkey form to close.
///  </param>
/// <param name="AResult">(Integer) - The result code to pass back to the sheet
/// delegate.</param>
procedure CloseSheetForm(AForm: TCommonCustomForm; AResult: Integer);
/// <summary>Creates a NSAlert object.
/// </summary>
/// <returns>A reference to a NSAlert interface.
/// </returns>
/// <param name="AMessage">(String) - The text of the message for the alert.
/// </param>
/// <param name="AAlertType">(TATAlertType) - The type of alert to display.
/// </param>
/// <param name="AInfoText">(String) - An optional string containing informational
/// text.</param>
/// <param name="AFirstBtnCaption">(String) - An optional string containing the
/// caption for the first button. If this param is left empty the frst button's
/// caption will default to 'Ok'</param>
/// <param name="ASecondBtnCaption">(String) - An optional string containing the
/// caption for the second button. If this param is left empty there is no second
/// button.</param>
/// <param name="AThirdBtnCaption">(String) - An optional string containing the
/// caption for the third button. If this param is left empty there is no third
/// button.</param>
function CreateAlert(AMessage: String; AAlertType: TATAlertType = atInfo;
    AInfoText: String = ''; AFirstBtnCaption: String = ''; ASecondBtnCaption:
    String = ''; AThirdBtnCaption: String = ''): NSAlert; overload;
procedure CreateFormPDF(AForm: TCommonCustomForm; AFilename: String); overload;
procedure CreateFormPDF(AForm: TCommonCustomForm; AStream: TStream); overload;
procedure DisplayFormAlert(AParent: TCommonCustomForm; AAlert: NSAlert; const
    AOnAlertClosed: TATAlertClosedEvent = NIL); overload;
procedure DisplayFormAlert(AParent: TCommonCustomForm; AMessage: String; const
    AOnAlertClosed: TATAlertClosedEvent = NIL; AAlertType: TATAlertType =
    atInfo; AInfoText: String = ''; AFirstBtnCaption: String = '';
    ASecondBtnCaption: String = ''; AThirdBtnCaption: String = ''); overload;
procedure DisplayFormSheet(AParent, ASheet: TCommonCustomForm; const
    AOnSheetClose: TATSheetCloseEvent = NIL; const AOnSheetClosed:
    TATSheetClosedEvent = NIL);
function FormFromNSWindow(AWindow: NSWindow): TCommonCustomForm;
procedure HideFormFromShowAllWindows(AForm: TCommonCustomForm; AHide: Boolean =
    True);
procedure SetFormAutoSaveName(AForm: TCommonCustomForm; ASaveName: String);
procedure SetFormFilename(AForm: TCommonCustomForm; AFilename: String);
procedure SetFormMaxClientSize(AForm: TCommonCustomForm; AMaxWidth, AMaxHeight:
    Single);
procedure SetFormMaxSize(AForm: TCommonCustomForm; AMaxWidth, AMaxHeight:
    Single);
procedure SetFormMinClientSize(AForm: TCommonCustomForm; AMinWidth, AMinHeight:
    Single);
procedure SetFormMinSize(AForm: TCommonCustomForm; AMinWidth, AMinHeight:
    Single);
procedure SetFormMovableByBackground(AForm: TCommonCustomForm; ABgMovable:
    Boolean);
function ShowAlert(AAlert: NSAlert): Integer; overload;
function ShowAlert(AMessage: String; AAlertType: TATAlertType = atInfo;
    AInfoText: String = ''; AFirstBtnCaption: String = ''; ASecondBtnCaption:
    String = ''; AThirdBtnCaption: String = ''): TATAlertResult; overload;

implementation

uses
  System.SysUtils, Macapi.CocoaTypes, Macapi.Helpers, Macapi.Foundation,
  FMX.Platform.Mac, AT.MacOS.App;

function NSViewOfForm(AForm: TCommonCustomForm): NSView;
var
  AHandle: TMacWindowHandle;
begin
  if (NOT Assigned(AForm)) then
    Exit(NIL);

  AHandle := WindowHandleToPlatform(AForm.Handle);

  Result := AHandle.View;
end;

function NSWindowOfForm(AForm: TCommonCustomForm): NSWindow;
var
  AHandle: TMacWindowHandle;
begin
  if (NOT Assigned(AForm)) then
    Exit(NIL);

  AHandle := WindowHandleToPlatform(AForm.Handle);

  Result := AHandle.Wnd;
end;

function IsFormSheet(AForm: TCommonCustomForm): Boolean;
var
  AWindow: NSWindow;
begin
  if (NOT Assigned(AForm)) then
    Exit(False);

  AWindow := NSWindowOfForm(AForm);

  if (NOT Assigned(AWindow)) then
    Exit(False);

  Result := AWindow.isSheet;
end;

procedure CloseSheetForm(AForm: TCommonCustomForm; AResult: Integer);
var
  AWindow: NSWindow;
  AApp: NSApplication;
begin
  if (NOT Assigned(AForm)) then
    Exit;

  if (NOT IsFormSheet(AForm)) then
    Exit;

  AWindow := NSWindowOfForm(AForm);

  if (NOT Assigned(AWindow)) then
    Exit;

  AApp := GetApplication;

  if (NOT Assigned(AApp)) then
    Exit;

  AApp.endSheet(AWindow, AResult);
end;

function CreateAlert(AMessage: String; AAlertType: TATAlertType = atInfo;
    AInfoText: String = ''; AFirstBtnCaption: String = ''; ASecondBtnCaption:
    String = ''; AThirdBtnCaption: String = ''): NSAlert;
var
  AAlert: NSAlert;
  ABtn1Cap: String;
begin
  AAlert := TNSAlert.Create;

  if (AFirstBtnCaption = '') then
    ABtn1Cap := 'Ok'
  else
    ABtn1Cap := AFirstBtnCaption;

  AAlert.addButtonWithTitle(StrToNSStr(ABtn1Cap));

  if (ASecondBtnCaption <> '') then
    AAlert.addButtonWithTitle(StrToNSStr(ASecondBtnCaption));
  if (AThirdBtnCaption <> '') then
    AAlert.addButtonWithTitle(StrToNSStr(AThirdBtnCaption));

  AAlert.setMessageText(StrToNSStr(AMessage));

  if (AInfoText <> '') then
    AAlert.setInformativeText(StrToNSStr(AInfoText));

  case AAlertType of
    atInfo: AAlert.setAlertStyle(NSInformationalAlertStyle);
    atWarn: AAlert.setAlertStyle(NSWarningAlertStyle);
    atCritical: AAlert.setAlertStyle(NSCriticalAlertStyle);
  end;

  Result := AAlert;
end;

procedure CreateFormPDF(AForm: TCommonCustomForm; AFilename: String);
var
  AStream: TFileStream;
begin
  AStream := TFileStream.Create(AFileName, fmCreate);
  try
    CreateFormPDF(AForm, AStream);
  finally
    AStream.Free;
  end;
end;

procedure CreateFormPDF(AForm: TCommonCustomForm; AStream: TStream);
var
  AWindow: NSWindow;
  AData: NSData;
  ARect: NSRect;
begin
  if (NOT Assigned(AForm)) then
    Exit;

  AWindow := NSWindowOfForm(AForm);

  if (NOT Assigned(AWindow)) then
    Exit;

  ARect.origin.x := 0;
  ARect.origin.y := 0;
  ARect.size.width := AForm.ClientWidth;
  ARect.size.height := AForm.ClientHeight;

  AData := AWindow.dataWithEPSInsideRect(ARect);

  if (AData = nil) or (AData.length = 0) then RaiseLastOSError;

  AStream.WriteBuffer(AData.bytes^, AData.length);
end;

procedure DisplayFormAlert(AParent: TCommonCustomForm; AAlert: NSAlert; const
    AOnAlertClosed: TATAlertClosedEvent = NIL);
var
  ADelegate: TATAlertDelegate;
  AWindow: NSWindow;
begin
  if (NOT Assigned(AParent)) then
    begin
      ShowAlert(AAlert);
      Exit;
    end;

  if (NOT Assigned(AAlert)) then
    Exit;

  ADelegate := TATAlertDelegate.Create(AOnAlertClosed);

  AWindow := NSWindowOfForm(AParent);

  AAlert.beginSheetModalForWindow(AWindow, ADelegate.ObjectID,
     ADelegate.Selector, NIL);
end;

procedure DisplayFormAlert(AParent: TCommonCustomForm; AMessage: String; const
    AOnAlertClosed: TATAlertClosedEvent = NIL; AAlertType: TATAlertType =
    atInfo; AInfoText: String = ''; AFirstBtnCaption: String = '';
    ASecondBtnCaption: String = ''; AThirdBtnCaption: String = '');
var
  AAlert: NSAlert;
begin
  AAlert := CreateAlert(AMessage, AAlertType, AInfoText, AFirstBtnCaption,
     ASecondBtnCaption, AThirdBtnCaption);

  try
    DisplayFormAlert(AParent, AAlert, AOnAlertClosed);
  finally
    AAlert.release;
  end;

end;

procedure DisplayFormSheet(AParent, ASheet: TCommonCustomForm; const
    AOnSheetClose: TATSheetCloseEvent = NIL; const AOnSheetClosed:
    TATSheetClosedEvent = NIL);
var
  AWin, ASht: NSWindow;
  AApp: NSApplication;
  ADelegate: TATSheetDelegate;
begin
  AWin := NSWindowOfForm(AParent);
  ASht := NSWindowOfForm(ASheet);

  AApp := GetApplication;

  ADelegate := TATSheetDelegate.Create(AOnSheetClose, AOnSheetClosed);

  AApp.beginSheet(ASht, AWin, ADelegate.ObjectID, ADelegate.Selector, NIL);
end;

function FormFromNSWindow(AWindow: NSWindow): TCommonCustomForm;
begin
  if (NOT Assigned(AWindow)) then
    Exit(NIL);

  Result := TMacWindowHandle.FindForm(AWindow);
end;

procedure HideFormFromShowAllWindows(AForm: TCommonCustomForm; AHide: Boolean =
    True);
var
  AWindow: NSWindow;
begin
  if (NOT Assigned(AForm)) then
    Exit;

  AWindow := NSWindowOfForm(AForm);

  if (NOT Assigned(AWindow)) then
    Exit;

  if (AHide) then
    begin
      AWindow.setCollectionBehavior(AWindow.collectionBehavior OR
         NSWindowCollectionBehaviorTransient);
    end
  else
    begin
      AWindow.setCollectionBehavior(AWindow.collectionBehavior OR
         NSWindowCollectionBehaviorManaged);
    end;
end;

procedure SetFormAutoSaveName(AForm: TCommonCustomForm; ASaveName: String);
var
  AWindow: NSWindow;
begin
  if (NOT Assigned(AForm)) then
    Exit;

  AWindow := NSWindowOfForm(AForm);

  if (NOT Assigned(AWindow)) then
    Exit;

  AWindow.setFrameAutosaveName(StrToNSStr(ASaveName));
end;

procedure SetFormFilename(AForm: TCommonCustomForm; AFilename: String);
var
  AWindow: NSWindow;
begin
  if (NOT Assigned(AForm)) then
    Exit;

  AWindow := NSWindowOfForm(AForm);

  if (NOT Assigned(AWindow)) then
    Exit;

  AWindow.setRepresentedFilename(StrToNSStr(AFilename));
end;

procedure SetFormMaxClientSize(AForm: TCommonCustomForm; AMaxWidth, AMaxHeight:
    Single);
var
  AWindow: NSWindow;
  AMaxSize: NSSize;
begin
  if (NOT Assigned(AForm)) then
    Exit;

  AWindow := NSWindowOfForm(AForm);

  if (NOT Assigned(AWindow)) then
    Exit;

  AMaxSize.width := AMaxWidth;
  AMaxSize.height := AMaxHeight;

  AWindow.setContentMaxSize(AMaxSize);
end;

procedure SetFormMaxSize(AForm: TCommonCustomForm; AMaxWidth, AMaxHeight:
    Single);
var
  AWindow: NSWindow;
  AMaxSize: NSSize;
begin
  if (NOT Assigned(AForm)) then
    Exit;

  AWindow := NSWindowOfForm(AForm);

  if (NOT Assigned(AWindow)) then
    Exit;

  AMaxSize.width := AMaxWidth;
  AMaxSize.height := AMaxHeight;

  AWindow.setMaxSize(AMaxSize);
end;

procedure SetFormMinClientSize(AForm: TCommonCustomForm; AMinWidth, AMinHeight:
    Single);
var
  AWindow: NSWindow;
  AMinSize: NSSize;
begin
  if (NOT Assigned(AForm)) then
    Exit;

  AWindow := NSWindowOfForm(AForm);

  if (NOT Assigned(AWindow)) then
    Exit;

  AMinSize.width := AMinWidth;
  AMinSize.height := AMinHeight;

  AWindow.setContentMinSize(AMinSize);
end;

procedure SetFormMinSize(AForm: TCommonCustomForm; AMinWidth, AMinHeight:
    Single);
var
  AWindow: NSWindow;
  AMinSize: NSSize;
begin
  if (NOT Assigned(AForm)) then
    Exit;

  AWindow := NSWindowOfForm(AForm);

  if (NOT Assigned(AWindow)) then
    Exit;

  AMinSize.width := AMinWidth;
  AMinSize.height := AMinHeight;

  AWindow.setMinSize(AMinSize);
end;

procedure SetFormMovableByBackground(AForm: TCommonCustomForm; ABgMovable:
    Boolean);
var
  AWindow: NSWindow;
begin
  if (NOT Assigned(AForm)) then
    Exit;

  AWindow := NSWindowOfForm(AForm);

  if (NOT Assigned(AWindow)) then
    Exit;

  AWindow.setMovableByWindowBackground(ABgMovable);
end;

function ShowAlert(AAlert: NSAlert): Integer;
begin
  if (NOT Assigned(AAlert)) then
    Exit(-1);

  Result := AAlert.runModal;
end;

function ShowAlert(AMessage: String; AAlertType: TATAlertType = atInfo;
    AInfoText: String = ''; AFirstBtnCaption: String = ''; ASecondBtnCaption:
    String = ''; AThirdBtnCaption: String = ''): TATAlertResult;
var
  AAlert: NSAlert;
  AResult: Integer;
begin
  AAlert := CreateAlert(AMessage, AAlertType, AInfoText, AFirstBtnCaption,
     ASecondBtnCaption, AThirdBtnCaption);

  try
    AResult := ShowAlert(AAlert);
    case AResult of
      NSAlertFirstButtonReturn : Result := arButton1;
      NSAlertSecondButtonReturn: Result := arButton2;
      NSAlertThirdButtonReturn : Result := arButton3;
    else
      Result := arUnknown;
    end;
  finally
    AAlert.release;
  end;

end;

end.
