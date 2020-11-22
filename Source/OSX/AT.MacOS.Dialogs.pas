//Only compile for the OS X platform.
{$IF ( (NOT Defined(MACOS)) OR (Defined(IOS)) )}
  {$MESSAGE Fatal 'AT.MacOS.Dialogs.pas only compiles for the OS X platform.'}
{$ENDIF}

// ******************************************************************
//
// Program Name   : Angelic Tech Mac OS X Library
// Program Version: 2017
// Platform(s)    : OS X
// Framework      : None
//
// Filename       : AT.MacOS.Dialogs.pas
// File Version   : 2017.04
// Date Created   : 11-Apr-2017
// Author         : Matthew Vesperman
//
// Description:
//
// Mac OS X system dialog access routines.
//
// Revision History:
//
// v1.00   :   Initial version
//
// ******************************************************************
//
// COPYRIGHT © 2017 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************


/// <summary>
///   Contains Mac OS X system dialog access routines.
/// </summary>
unit AT.MacOS.Dialogs;

interface

type
  /// <summary>
  ///   Result type for the ShowCFMessage routine.
  /// </summary>
  TATCFMsgResult = (
    /// <summary>
    ///   An unknown response was returned by the OS. This should
    ///   never be returned.
    /// </summary>
    cfmrUnknown,
    /// <summary>
    ///   The notification alert was canceled.
    /// </summary>
    cfmrCancel,
    /// <summary>
    ///   The first button was clicked. Corresponds to
    ///   kCFUserNotificationDefaultResponse.
    /// </summary>
    cfmrButton1,
    /// <summary>
    ///   The second button was clicked. Corresponds to
    ///   kCFUserNotificationAlternateResponse.
    /// </summary>
    cfmrButton2,
    /// <summary>
    ///   The third button was clicked. Corresponds
    ///   to kCFUserNotificationOtherResponse.
    /// </summary>
    cfmrButton3);
  /// <summary>
  ///   The type of alert or notice to display.
  /// </summary>
  TATCFMsgType = (
    /// <summary>
    ///   Display a stop alert or notice. Corresponds to
    ///   kCFUserNotificationStopAlertLevel.
    /// </summary>
    cfmtStop,
    /// <summary>
    ///   Display a note alert or notice. Corresponds to
    ///   kCFUserNotificationNoteAlertLevel.
    /// </summary>
    cfmtNote,
    /// <summary>
    ///   Display a caution alert or notice. Corresponds to
    ///   kCFUserNotificationCautionAlertLevel.
    /// </summary>
    cfmtCaution,
    /// <summary>
    ///   Display a plain alert or notice. Corresponds to
    ///   kCFUserNotificationPlainAlertLevel.
    /// </summary>
    cfmtPlain);

/// <summary>
///   Calls the Mac OS X CFUserNotificationDisplayAlert
///   CoreFoundation api function to display a system alert window.
/// </summary>
/// <param name="ATitle">
///   The title for the alert window.
/// </param>
/// <param name="AMessage">
///   The message to display in the alert window.
/// </param>
/// <param name="AMsgType">
///   The type of alert window to display.
/// </param>
/// <param name="ADefaultBtnCaption">
///   The caption for the default button. If set to an empty string
///   the button caption defaults to OK.
/// </param>
/// <param name="ATimeout">
///   The amount of time (in seconds) to wait for a user response
///   before the alert window is automatically canceled. Default is
///   zero, which means wait forever.
/// </param>
/// <param name="ASecondBtnCaption">
///   The caption for the second button. If set to an empty string
///   the button is hidden.
/// </param>
/// <param name="AThirdBtnCaption">
///   The caption for the third button. If set to an empty string the
///   button is hidden.
/// </param>
/// <returns>
///   A flag indicating the way the alert dialog was closed.
/// </returns>
/// <seealso cref="AT.MacOS.Dialogs|TATCFMsgResult">
///   TATCFMsgResult
/// </seealso>
/// <seealso cref="AT.MacOS.Dialogs|TATCFMsgType">
///   TATCFMsgType
/// </seealso>
function ShowCFMessage(ATitle, AMessage: String; AMsgType: TATCFMsgType =
    cfmtPlain; ADefaultBtnCaption: String = ''; ATimeout: Double = 0;
    ASecondBtnCaption: String = ''; AThirdBtnCaption: String = ''):
    TATCFMsgResult;
/// <summary>
///   Calls the Mac OS X CFUserNotificationDisplayNotice
///   CoreFoundation api function to display a system alert window.
/// </summary>
/// <param name="ATitle">
///   The title for the notice window.
/// </param>
/// <param name="AMessage">
///   The message to display in the notice window.
/// </param>
/// <param name="AMsgType">
///   The type of notice window to display.
/// </param>
/// <param name="ADefaultBtnCaption">
///   The caption for the default button. If set to an empty string
///   the button caption defaults to OK.
/// </param>
/// <param name="ATimeout">
///   The amount of time (in seconds) to wait for a user response
///   before the notice window is automatically canceled. Default is
///   zero, which means wait forever.
/// </param>
/// <seealso cref="AT.MacOS.Dialogs|TATCFMsgResult">
///   TATCFMsgResult
/// </seealso>
/// <seealso cref="AT.MacOS.Dialogs|TATCFMsgType">
///   TATCFMsgType
/// </seealso>
procedure ShowCFNotification(ATitle, AMessage: String; AMsgType: TATCFMsgType =
    cfmtPlain; ADefaultBtnCaption: String = ''; ATimeout: Double = 0; const
    AHideButton: Boolean = False);

implementation

uses
  Macapi.CoreFoundation, AT.GarbageCollector;

function ShowCFMessage(ATitle, AMessage: String; AMsgType: TATCFMsgType =
    cfmtPlain; ADefaultBtnCaption: String = ''; ATimeout: Double = 0;
    ASecondBtnCaption: String = ''; AThirdBtnCaption: String = ''):
    TATCFMsgResult;
var
  AGC: IATGarbageCollector;
  LCaption, LMessage: CFStringRef;
  LBtn1, LBtn2, LBtn3: CFStringRef;
  AFlags: Cardinal;
  LResponse: CFOptionFlags;
begin
  LCaption := CFStringCreateWithCharactersNoCopy(NIL, PWideChar(ATitle),
     Length(ATitle), kCFAllocatorNull);
  TATGC.Cleanup(procedure
    begin
      CFRelease(LCaption);
    end, AGC);

  LMessage := CFStringCreateWithCharactersNoCopy(NIL, PWideChar(AMessage),
     Length(AMessage), kCFAllocatorNull);
  TATGC.Cleanup(procedure
    begin
      CFRelease(LMessage);
    end, AGC);

  case AMsgType of
    cfmtStop: AFlags := kCFUserNotificationStopAlertLevel;
    cfmtNote: AFlags := kCFUserNotificationNoteAlertLevel;
    cfmtCaution: AFlags := kCFUserNotificationCautionAlertLevel;
    cfmtPlain: AFlags := kCFUserNotificationPlainAlertLevel;
  else
    AFlags := kCFUserNotificationPlainAlertLevel;
  end;

  if (ADefaultBtnCaption = '') then
    LBtn1 := NIL
  else
    LBtn1 := CFStringCreateWithCharactersNoCopy(NIL,
      PWideChar(ADefaultBtnCaption), Length(ADefaultBtnCaption),
      kCFAllocatorNull);

  if (ASecondBtnCaption = '') then
    LBtn2 := NIL
  else
    LBtn2 := CFStringCreateWithCharactersNoCopy(NIL,
      PWideChar(ASecondBtnCaption), Length(ASecondBtnCaption),
      kCFAllocatorNull);

  if (AThirdBtnCaption = '') then
    LBtn3 := NIL
  else
    LBtn3 := CFStringCreateWithCharactersNoCopy(NIL,
      PWideChar(AThirdBtnCaption), Length(AThirdBtnCaption),
      kCFAllocatorNull);

  CFUserNotificationDisplayAlert(ATimeout, AFlags, NIL, NIL, NIL, LCaption,
     LMessage, LBtn1, LBtn2, LBtn3, LResponse);

  case LResponse of
    kCFUserNotificationDefaultResponse   : Result := cfmrButton1;
    kCFUserNotificationAlternateResponse : Result := cfmrButton2;
    kCFUserNotificationOtherResponse     : Result := cfmrButton3;
    kCFUserNotificationCancelResponse    : Result := cfmrCancel;
  else
    Result := cfmrUnknown;
  end;
end;

procedure ShowCFNotification(ATitle, AMessage: String; AMsgType: TATCFMsgType =
    cfmtPlain; ADefaultBtnCaption: String = ''; ATimeout: Double = 0; const
    AHideButton: Boolean = False);
var
  AGC: IATGarbageCollector;
  LCaption, LMessage, LBtn1: CFStringRef;
  AFlags: Cardinal;
begin
  LCaption := CFStringCreateWithCharactersNoCopy(NIL, PWideChar(ATitle),
     Length(ATitle), kCFAllocatorNull);
  TATGC.Cleanup(procedure
    begin
      CFRelease(LCaption);
    end, AGC);

  LMessage := CFStringCreateWithCharactersNoCopy(NIL, PWideChar(AMessage),
     Length(AMessage), kCFAllocatorNull);
  TATGC.Cleanup(procedure
    begin
      CFRelease(LMessage);
    end, AGC);

  case AMsgType of
    cfmtStop: AFlags := kCFUserNotificationStopAlertLevel;
    cfmtNote: AFlags := kCFUserNotificationNoteAlertLevel;
    cfmtCaution: AFlags := kCFUserNotificationCautionAlertLevel;
    cfmtPlain: AFlags := kCFUserNotificationPlainAlertLevel;
  else
    AFlags := kCFUserNotificationPlainAlertLevel;
  end;

//Todo: debug hide button code...
//  if (AHideButton) then
//    AFlags := AFlags + kCFUserNotificationNoDefaultButtonFlag;

  if (ADefaultBtnCaption = '') then
    LBtn1 := NIL
  else
    LBtn1 := CFStringCreateWithCharactersNoCopy(NIL,
      PWideChar(ADefaultBtnCaption), Length(ADefaultBtnCaption),
      kCFAllocatorNull);

  CFUserNotificationDisplayNotice(ATimeout, AFlags, NIL, NIL, NIL, LCaption,
     LMessage, LBtn1);
end;


end.
