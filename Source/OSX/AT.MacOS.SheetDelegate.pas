// ******************************************************************
//
// Program Name   : Angelic Tech Mac OS X Library
// Program Version: 2017
// Platform(s)    : OS X
// Framework      : FireMonkey
//
// Filename       : AT.MacOS.SheetDelegate.pas
// File Version   : 2017.04
// Date Created   : 13-Apr-2017
// Author         : Matthew Vesperman
//
// Description:
//
// Defines a delegate code that allows a sheet window to be used with
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
///   Defines a delegate code that allows a sheet window to be used
///   with FireMonkey forms.
/// </summary>
unit AT.MacOS.SheetDelegate;

interface

uses
  Macapi.CocoaTypes, Macapi.AppKit, FMX.Forms, System.TypInfo,
  Macapi.CoreFoundation, Macapi.ObjCRuntime, Macapi.ObjectiveC,
  Macapi.Foundation;

type
  TATSheetCloseEvent = reference to procedure(ASheet: TCommonCustomForm;
    AReturnCode: Integer);
  TATSheetClosedEvent = reference to procedure(AReturnCode: Integer);

  IATSheetDelegate = interface(NSObject)
    ['{5097C6A4-ECCF-4EFD-AADB-0F8704B5497A}']
    procedure sheetDidEnd(sheet: Pointer; ReturnCode: NSInteger; contextInfo:
        Pointer); cdecl;
  end;

  /// <summary>
  ///   Defines a delegate code that allows a sheet window to be used
  ///   with FireMonkey forms.
  /// </summary>
  TATSheetDelegate = class(TOCLocal)
  strict private
    FOnSheetClose: TATSheetCloseEvent;
    FOnSheetClosed: TATSheetClosedEvent;
    function GetSelector: Pointer; protected
    function GetSelectorString: PAnsiChar; virtual;
  public
    constructor Create(const AOnSheetClose: TATSheetCloseEvent = NIL; const
        AOnSheetClosed: TATSheetClosedEvent = NIL);
    destructor Destroy; override;
    function GetObjectiveCClass: PTypeInfo; override;
    procedure sheetDidEnd(sheet: Pointer; ReturnCode: NSInteger; contextInfo:
        Pointer); cdecl;
    property ObjectID: Pointer read GetObjectID;
    property Selector: Pointer read GetSelector;
    property SelectorString: PAnsiChar read GetSelectorString;
  end;

implementation

uses
  FMX.Platform.Mac;

constructor TATSheetDelegate.Create(const AOnSheetClose: TATSheetCloseEvent =
    NIL; const AOnSheetClosed: TATSheetClosedEvent = NIL);
begin
  inherited Create;
  FOnSheetClose := AOnSheetClose;
  FOnSheetClosed := AOnSheetClosed;
end;

destructor TATSheetDelegate.Destroy;
begin
  CFRelease(GetObjectID);
  inherited;
end;

function TATSheetDelegate.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IATSheetDelegate);
end;

function TATSheetDelegate.GetSelector: Pointer;
begin
  Result := sel_getUid(Self.SelectorString);
end;

function TATSheetDelegate.GetSelectorString: PAnsiChar;
begin
  Result := 'sheetDidEnd:ReturnCode:contextInfo:';
end;

procedure TATSheetDelegate.sheetDidEnd(sheet: Pointer; ReturnCode: NSInteger;
    contextInfo: Pointer);
var
  ANSWindow: NSWindow;
  ASheet  : TCommonCustomForm;
begin
  try
    if (Assigned(sheet)) then
      begin
        ANSWindow := TNSWindow.Wrap(sheet);
        ASheet := TMacWindowHandle.FindForm(ANSWindow);
      end
    else
      ASheet := nil;

    if (Assigned(FOnSheetClose)) then
      FOnSheetClose(ASheet, ReturnCode);

    ASheet.DisposeOf;

    if (Assigned(FOnSheetClosed)) then
      FOnSheetClosed(ReturnCode);
  finally
    Destroy;
  end;
end;

end.
