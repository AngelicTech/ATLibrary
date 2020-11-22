// ******************************************************************
//
// Program Name   : $ProgramName$
// Platform(s)    : $Platforms$
// Framework      : VCL
//
// Filename       : AT.$ShortName$.DM.ScreenTips.pas/.dfm
// File Version   : 1.00
// Date Created   : $CreateDate$
// Author         : Matthew Vesperman
//
// Description:
//
// $ProgramName$'s global screen tips.
//
// Revision History:
//
// v1.00   :   Initial version
//
// ******************************************************************
//
// COPYRIGHT © $Year$ - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

/// <summary>
///   $ProgramName$'s global screen tips.
/// </summary>
unit AT.ShortName.DM.ScreenTips;

interface

uses
  System.Classes, cxClasses, dxScreenTip;

type
  /// <summary>
  ///   Global screen tips data module class.
  /// </summary>
  TdmScreenTips = class(TDataModule)
    stipClipCopy: TdxScreenTip;
    stipClipCut: TdxScreenTip;
    stipClipPaste: TdxScreenTip;
    stipEditRedo: TdxScreenTip;
    stipEditUndo: TdxScreenTip;
    stipHelpContents: TdxScreenTip;
    stipSearchFind: TdxScreenTip;
    stipSearchReplace: TdxScreenTip;
    stipSelect: TdxScreenTip;
    stipSelectAll: TdxScreenTip;
    stipSelectInvert: TdxScreenTip;
    stipSelectNone: TdxScreenTip;
    stipTouchMode: TdxScreenTip;
    stipUIRibbon: TdxScreenTip;
    stipUIRibModeAH: TdxScreenTip;
    stipUIRibModeTC: TdxScreenTip;
    stipUIRibModeTO: TdxScreenTip;
    stipUIStatusBar: TdxScreenTip;
    strepo1: TdxScreenTipRepository;
    /// <summary>
    ///   Data module's OnCreate event handler.
    /// </summary>
    /// <remarks>
    ///   Initializes the Screen Tips data module.
    /// </remarks>
    procedure DataModuleCreate(Sender: TObject);
  end;

var
  /// <summary>
  ///   Holds a reference to the global Screen Tips data module.
  /// </summary>
  dmScreenTips: TdmScreenTips;

/// <summary>
///   Returns a reference to the global Screen Tips data module.
/// </summary>
function ScreenTips: TdmScreenTips
;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  AT.GarbageCollector, AT.ShortName.ResourceStrings,
  AT.ShortName.Vcl.Dialogs.SplashDX, AT.ShortName.Consts;

{$R *.dfm}

var
  /// <summary>
  ///   Module level garbage collector object.
  /// </summary>
  MGC: IATGarbageCollector;


function ScreenTips: TdmScreenTips;
begin
  if (NOT Assigned(dmScreenTips)) then
    begin
      dmScreenTips := TATGC.Collect(TdmScreenTips.Create(NIL), MGC);
    end;

  Result := dmScreenTips;
end;

procedure TdmScreenTips.DataModuleCreate(Sender: TObject);
begin
  //Display startup message in splash screen...
  TdlgSplashDX.ChangeStartMessage(rstrStartInitScrTips,
      cStartMsgDelay);
end;

end.
