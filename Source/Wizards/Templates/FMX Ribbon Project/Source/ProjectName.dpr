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
  System.StartUpCopy,
  FMX.Forms,
  AT.ShortName.Attribs in 'Code Files\AT.ShortName.Attribs.pas',
  AT.ShortName.Config.Consts in 'Code Files\AT.ShortName.Config.Consts.pas',
  AT.ShortName.Config in 'Code Files\AT.ShortName.Config.pas',
  AT.ShortName.Consts in 'Code Files\AT.ShortName.Consts.pas',
  AT.ShortName.ObjectServices in 'Code Files\AT.ShortName.ObjectServices.pas',
  AT.ShortName.ResourceStrings in 'Code Files\AT.ShortName.ResourceStrings.pas',
  AT.ShortName.Types in 'Code Files\AT.ShortName.Types.pas',
  AT.ShortName.Intf in 'Code Files\AT.ShortName.Intf.pas',
  AT.ShortName.DM.Actions in 'Data Modules\AT.ShortName.DM.Actions.pas' {dmActions: TDataModule},
  AT.ShortName.DM.Images in 'Data Modules\AT.ShortName.DM.Images.pas' {dmImages: TDataModule},
  {$IF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}
  AT.ShortName.FMX.Forms.OSX.Controller in 'Forms\AT.ShortName.FMX.Forms.OSX.Controller.pas' {frmOSXController},
  {$ENDIF }
  AT.ShortName.FMX.Forms.Main in 'Forms\AT.ShortName.FMX.Forms.Main.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmActions, dmActions);
  Application.CreateForm(TdmImages, dmImages);
  {$IF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}
  Application.CreateForm(TfrmOSXController, frmOSXController);
  {$ELSE}
  Application.CreateForm(TfrmMain, frmMain);
  {$ENDIF}

  Application.Run;
end.
