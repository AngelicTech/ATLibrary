// ******************************************************************
//
// Program Name   : $ProgramName$
// Platform(s)    : $Platforms$
// Framework      : VCL
//
// Filename       : $ProjectName$.dpr
// File Version   : 1.00
// Date Created   : $CreateDate$
// Author         : Matthew Vesperman
//
// Description:
//
// $Description$
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
///   $ProgramName$'s main namspace.
/// </summary>
program ProjectName;

uses
  {$IFDEF EurekaLog}
  EMemLeaks,
  EResLeaks,
  EDialogWinAPIMSClassic,
  EDialogWinAPIEurekaLogDetailed,
  EDialogWinAPIStepsToReproduce,
  EDebugExports,
  EFixSafeCallException,
  EMapWin32,
  EAppVCL,
  ExceptionLog7,
  {$ENDIF EurekaLog}
  System.Classes,
  Vcl.Forms,
  dxSkinsForm,
  Vcl.HtmlHelpViewer,
  AT.ShortName.Attribs in 'Code Files\AT.ShortName.Attribs.pas',
  AT.ShortName.Config.Consts in 'Code Files\AT.ShortName.Config.Consts.pas',
  AT.ShortName.Config in 'Code Files\AT.ShortName.Config.pas',
  AT.ShortName.Consts in 'Code Files\AT.ShortName.Consts.pas',
  AT.ShortName.Intf in 'Code Files\AT.ShortName.Intf.pas',
  AT.ShortName.ObjectServices in 'Code Files\AT.ShortName.ObjectServices.pas',
  AT.ShortName.ResourceStrings in 'Code Files\AT.ShortName.ResourceStrings.pas',
  AT.ShortName.Types in 'Code Files\AT.ShortName.Types.pas',
  AT.ShortName.DM.Actions in 'Data Modules\AT.ShortName.DM.Actions.pas' {dmActions: TDataModule},
  AT.ShortName.DM.Images in 'Data Modules\AT.ShortName.DM.Images.pas' {dmImages: TDataModule},
  AT.ShortName.DM.ScreenTips in 'Data Modules\AT.ShortName.DM.ScreenTips.pas' {dmScreenTips: TDataModule},
  AT.ShortName.DM.Services.Application in 'Data Modules\AT.ShortName.DM.Services.Application.pas' {dmAppServices: TDataModule},
  AT.ShortName.DM.Services.Config in 'Data Modules\AT.ShortName.DM.Services.Config.pas' {dmConfigServices: TDataModule},
  AT.ShortName.DM.Services.Dialogs in 'Data Modules\AT.ShortName.DM.Services.Dialogs.pas' {DlgServices: TDataModule},
  AT.ShortName.DM.Services.Themes in 'Data Modules\AT.ShortName.DM.Services.Themes.pas' {dmThemeServices: TDataModule},
  AT.ShortName.Vcl.Dialogs.Generic.Base in 'Dialogs\AT.ShortName.Vcl.Dialogs.Generic.Base.pas' {dlgGenericBase},
  AT.ShortName.Vcl.Dialogs.Generic.DBBase in 'Dialogs\AT.ShortName.Vcl.Dialogs.Generic.DBBase.pas' {dlgGenericDBBase},
  AT.ShortName.Vcl.Dialogs.SplashDX in 'Dialogs\AT.ShortName.Vcl.Dialogs.SplashDX.pas' {dlgSplashDX},
  AT.ShortName.Vcl.Forms.Generic.Base in 'Forms\AT.ShortName.Vcl.Forms.Generic.Base.pas' {frmGenericBase},
  AT.ShortName.Vcl.Forms.Generic.MDIChild in 'Forms\AT.ShortName.Vcl.Forms.Generic.MDIChild.pas' {frmGenericMDIChild},
  AT.ShortName.Vcl.Forms.Main in 'Forms\AT.ShortName.Vcl.Forms.Main.pas' {frmMain},
  AT.ShortName.Vcl.Forms.Ribbon.MDIChild in 'Forms\AT.ShortName.Vcl.Forms.Ribbon.MDIChild.pas' {frmRibbonMDIChild};

{$R *.res}

begin
  //Register the TdxSkinController class with rtti...
  RegisterClass(TdxSkinController);

  //Initialize application object...
  Application.Initialize;

  //Ensure mainform is shown in taskbar...
  Application.MainFormOnTaskbar := True;

  //Set application's title and help filename...
  Application.Title := '$ProgramTitle$';
  Application.HelpFile := HelpFileName;

//  Show splash screen and display initial startup message...
  TdlgSplashDX.ShowSplash(smSplash, sbcBlue);
  TdlgSplashDX.ChangeStartMessage(rstrStartInit, 500);

  //Create Themes data module...
  if (NOT Assigned(dmThemeServices)) then
    Application.CreateForm(TdmThemeServices, dmThemeServices);
  //Create AppServices data module...
  if (NOT Assigned(dmAppServices)) then
    Application.CreateForm(TdmAppServices, dmAppServices);

  //Create Images data module...
  if (NOT Assigned(dmImages)) then
    Application.CreateForm(TdmImages, dmImages);

  //Create ScreenTips data module...
  if (NOT Assigned(dmScreenTips)) then
    Application.CreateForm(TdmScreenTips, dmScreenTips);

  //Create Actions data module...
  if (NOT Assigned(dmActions)) then
    Application.CreateForm(TdmActions, dmActions);

  //Create main form...
  Application.CreateForm(TfrmMain, frmMain);

  //Initialize themeing subsystem...
  ThemeServices._StartupInit;

  //Run application...
  Application.Run;
end.
