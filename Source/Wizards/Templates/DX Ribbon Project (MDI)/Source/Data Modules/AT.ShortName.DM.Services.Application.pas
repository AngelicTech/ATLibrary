// ******************************************************************
//
// Program Name   : $ProgramName$
// Platform(s)    : $Platforms$
// Framework      : VCL
//
// Filename       : AT.$ShortName$.DM.Services.Application.pas/.dfm
// File Version   : 1.00
// Date Created   : $CreateDate$
// Author         : Matthew Vesperman
//
// Description:
//
// $ProgramName$'s global app services data module.
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
///   $ProgramName$'s global app services data module.
/// </summary>
unit AT.ShortName.DM.Services.Application;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.AppEvnts;

type
  /// <summary>
  ///   Global app services data module.
  /// </summary>
  TdmAppServices = class(TDataModule)
    aeMain: TApplicationEvents;
    /// <summary>
    ///   The application's OnIdle event handler.
    /// </summary>
    procedure aeMainIdle(Sender: TObject; var Done: Boolean);
    /// <summary>
    ///   Data module's OnCreate event handler.
    /// </summary>
    /// <remarks>
    ///   Initializes the AppServices data module.
    /// </remarks>
    procedure DataModuleCreate(Sender: TObject);
  strict protected
    /// <summary>
    ///   ActiveChild property getter.
    /// </summary>
    function GetActiveChild: TCustomForm;
    /// <summary>
    ///   HasActiveChild property getter.
    /// </summary>
    function GetHasActiveChild: Boolean;
    /// <summary>
    ///   MainForm property getter.
    /// </summary>
    function GetMainForm: TForm;
  public
    /// <summary>
    ///   Determines if the currently active MDI child form supports
    ///   an interface.
    /// </summary>
    /// <param name="IID">
    ///   The GUID of the interface to check for.
    /// </param>
    /// <param name="AIntf">
    ///   Receives a reference to the interface if the active child
    ///   form supports it.
    /// </param>
    /// <returns>
    ///   FALSE if there is no active child, otherwise returns the
    ///   result of checking if the active form supports the desired
    ///   interface.
    /// </returns>
    function ActiveChildSupports(IID: TGUID; out AIntf): Boolean;
    /// <summary>
    ///   Opens the local help file and displays its table of
    ///   contents.
    /// </summary>
    procedure HelpShowTOC;
    /// <summary>
    ///   Determines if the main form supports an interface.
    /// </summary>
    /// <param name="IID">
    ///   The GUID of the interface to check for.
    /// </param>
    /// <param name="AIntf">
    ///   Receives a reference to the interface if the main form
    ///   supports it.
    /// </param>
    /// <returns>
    ///   FALSE if there is no main form, otherwise returns the
    ///   result of checking if the main form supports the desired
    ///   interface.
    /// </returns>
    function MainFormSupports(IID: TGUID; out AIntf): Boolean;
    /// <summary>
    ///   Returns a reference to the currently active MDI child form
    ///   if one exists, NIL otherwise.
    /// </summary>
    property ActiveChild: TCustomForm read GetActiveChild;
    /// <summary>
    ///   Returns TRUE if there is an active MDI child form, FALSE
    ///   otherwise.
    /// </summary>
    property HasActiveChild: Boolean read GetHasActiveChild;
    /// <summary>
    ///   Returns a reference to the main form if one exists,
    ///   NIL otherwise.
    /// </summary>
    property MainForm: TForm read GetMainForm;
  end;

var
  /// <summary>
  ///   Holds a reference to the global app services data module.
  /// </summary>
  dmAppServices: TdmAppServices;

/// <summary>
///   Returns a reference to the global app services data module.
/// </summary>
function AppServices: TdmAppServices;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  AT.GarbageCollector, AT.ShortName.Consts,
  AT.ShortName.ResourceStrings, AT.ShortName.Vcl.Dialogs.SplashDX,
  AT.ShortName.DM.Actions;

{$R *.dfm}

var
  /// <summary>
  ///   Module level garbage collector object.
  /// </summary>
  MGC: IATGarbageCollector;

function AppServices: TdmAppServices;
begin
  if (NOT Assigned(dmAppServices)) then
    begin
      dmAppServices := TATGC.Collect(TdmAppServices.Create(NIL), MGC);
    end;

  Result := dmAppServices;
end;

function TdmAppServices.ActiveChildSupports(IID: TGUID;
    out AIntf): Boolean;
begin
  if (NOT Assigned(ActiveChild)) then
    Exit(False);

  Result := Supports(ActiveChild, IID, AIntf);
end;

procedure TdmAppServices.aeMainIdle(Sender: TObject;
    var Done: Boolean);
begin
  Actions.UpdateAllActions;
end;

procedure TdmAppServices.DataModuleCreate(Sender: TObject);
begin
  //Display startup message in splash screen...
  TdlgSplashDX.ChangeStartMessage(rstrStartInitAppSvc,
      cStartMsgDelay);

  //Set application's help filename.
  Application.HelpFile := HelpFileName;
end;

function TdmAppServices.GetActiveChild: TCustomForm;
begin
  if (NOT Assigned(MainForm)) then
    Exit(NIL);

  if (MainForm.MDIChildCount <= 0) then
    Exit(NIL);

  Result := MainForm.ActiveMDIChild;
end;

function TdmAppServices.GetHasActiveChild: Boolean;
begin
  Result := (Assigned(ActiveChild));
end;

function TdmAppServices.GetMainForm: TForm;
begin
  Result := Application.MainForm;
end;

procedure TdmAppServices.HelpShowTOC;
begin
  Application.HelpShowTableOfContents;
end;

function TdmAppServices.MainFormSupports(IID: TGUID;
    out AIntf): Boolean;
begin
  if (NOT Assigned(MainForm)) then
    Exit(False);

  Result := Supports(MainForm, IID, AIntf);
end;


end.
