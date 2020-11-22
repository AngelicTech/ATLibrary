// ****************************************************************************
//
// Program Name   : AT Library
// Program Version: 1.00
// Platform(s)    : OSX
// Framework      : FireMonkey
//
// Filename       : AT.MacOS.AlertDelegate.pas
// File Version   : 1.00
// Date Created   : 16-AUG-2015
// Author         : Matthew S. Vesperman
//
// Description:
//
// This code unit defines a delegate that allows an alert sheet
// to be used with FireMonkey forms.
//
// Revision History:
//
// v1.00   :   Initial version
//
// ****************************************************************************
//
// COPYRIGHT © 2015 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ****************************************************************************


unit AT.MacOS.PanelDelegates;

interface

uses
  Macapi.CocoaTypes, Macapi.AppKit, FMX.Forms, System.TypInfo,
  Macapi.CoreFoundation, Macapi.ObjCRuntime, Macapi.ObjectiveC,
  Macapi.Foundation;

type
  TATOpenPanelClosedEvent = reference to procedure(APanel: NSOpenPanel;
     AReturnCode: Integer);
  TATSavePanelClosedEvent = reference to procedure(APanel: NSSavePanel;
     AReturnCode: Integer);

  IATPanelDelegate = interface(NSObject)
    ['{21EAF06C-8A97-41A9-994D-C4A42F90417A}']
    procedure panelDidEnd(alert: Pointer; ReturnCode: NSInteger; contextInfo:
        Pointer); cdecl;
  end;

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
