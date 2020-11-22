//Only compile for the OS X platform.
{$IF ( (NOT Defined(MACOS)) OR (Defined(IOS)) )}
  {$MESSAGE Fatal 'AT.MacOS.AlertDelegate.pas only compiles for the OS X platform.'}
{$ENDIF}

// ******************************************************************
//
// Program Name   : Angelic Tech Mac OS X Library
// Program Version: 2017
// Platform(s)    : OS X
// Framework      : FireMonkey
//
// Filename       : AT.MacOS.AlertDelegate.pas
// File Version   : 2017.04
// Date Created   : 13-Apr-2017
// Author         : Matthew Vesperman
//
// Description:
//
// Defines a delegate that allows an alert sheet to be used with
// FireMonkey forms.
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

//TODO: Finish documentation.

/// <summary>
///   Defines a delegate that allows an alert sheet to be used with
///   FireMonkey forms.
/// </summary>
unit AT.MacOS.AlertDelegate;

interface

uses
  Macapi.CocoaTypes, Macapi.AppKit, FMX.Forms, System.TypInfo,
  Macapi.CoreFoundation, Macapi.ObjCRuntime, Macapi.ObjectiveC,
  Macapi.Foundation;

type
  TATAlertClosedEvent = reference to procedure(AAlert: NSAlert; AReturnCode:
     Integer);

  IATAlertDelegate = interface(NSObject)
    ['{02A082A3-DCFF-4F47-8511-6CD0E748EEE0}']
    procedure alertDidEnd(alert: Pointer; ReturnCode: NSInteger; contextInfo:
        Pointer); cdecl;
  end;

  /// <summary>
  ///   Defines a delegate that allows an alert sheet to be used with
  ///   FireMonkey forms.
  /// </summary>
  TATAlertDelegate = class(TOCLocal)
  strict private
    FOnAlertClosed: TATAlertClosedEvent;
    function GetSelector: Pointer; protected
    function GetSelectorString: PAnsiChar; virtual;
  public
    constructor Create(const AOnAlertClosed: TATAlertClosedEvent = NIL);
    destructor Destroy; override;
    function GetObjectiveCClass: PTypeInfo; override;
    procedure alertDidEnd(alert: Pointer; ReturnCode: NSInteger; contextInfo:
        Pointer); cdecl;
    property ObjectID: Pointer read GetObjectID;
    property Selector: Pointer read GetSelector;
    property SelectorString: PAnsiChar read GetSelectorString;
  end;

implementation

uses
  FMX.Platform.Mac;

constructor TATAlertDelegate.Create(const AOnAlertClosed: TATAlertClosedEvent =
    NIL);
begin
  inherited Create;
  FOnAlertClosed := AOnAlertClosed;
end;

destructor TATAlertDelegate.Destroy;
begin
  CFRelease(GetObjectID);
  inherited;
end;

function TATAlertDelegate.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IATAlertDelegate);
end;

function TATAlertDelegate.GetSelector: Pointer;
begin
  Result := sel_getUid(Self.SelectorString);
end;

function TATAlertDelegate.GetSelectorString: PAnsiChar;
begin
  Result := 'alertDidEnd:ReturnCode:contextInfo:';
end;

procedure TATAlertDelegate.alertDidEnd(alert: Pointer; ReturnCode: NSInteger;
    contextInfo: Pointer);
var
  AAlert: NSAlert;
begin
  try
    if (Assigned(alert)) then
      AAlert := TNSAlert.Wrap(alert)
    else
      AAlert := NIL;

    if (Assigned(FOnAlertClosed)) then
      FOnAlertClosed(AAlert, ReturnCode);
  finally
    Destroy;
  end;
end;

end.
