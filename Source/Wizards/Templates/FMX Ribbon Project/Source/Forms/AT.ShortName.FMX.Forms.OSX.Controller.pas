//Only compile for the OS X platform.
{$IF ( (NOT Defined(MACOS)) OR (Defined(IOS)) )}
  {$MESSAGE Fatal 'AT.ShortName.FMX.Forms.OSX.Controller.pas only compiles for the OS X platform.'}
{$ENDIF}

unit AT.ShortName.FMX.Forms.OSX.Controller;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics,
  FMX.Dialogs, FMX.Menus;

type
  TfrmOSXController = class(TForm)
    mniApp: TMenuItem;
    mniAppAbout: TMenuItem;
    mniAppExit: TMenuItem;
    mniAppHide: TMenuItem;
    mniAppHideOthers: TMenuItem;
    mniAppPreferences: TMenuItem;
    mniAppSep1: TMenuItem;
    mniAppSep2: TMenuItem;
    mniAppSep3: TMenuItem;
    mniHelp: TMenuItem;
    mnuMain: TMainMenu;
    procedure FormShow(Sender: TObject);
  strict protected
    function GetMainForm: TCustomForm;
    procedure _CreateMainForm;
    procedure _InitControllerForm;
  public
    constructor Create(AOwner: TComponent); override;
    property MainForm: TCustomForm read GetMainForm;
  end;

var
  frmOSXController: TfrmOSXController;


implementation

{$R *.fmx}

uses
  FMX.Platform.Mac, AT.ShortName.DM.Actions, AT.FMX.MacOS.Forms,
  AT.ShortName.FMX.Forms.Main, Macapi.AppKit;

constructor TfrmOSXController.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  _InitControllerForm;
  _CreateMainForm;
end;

procedure TfrmOSXController.FormShow(Sender: TObject);
begin
  HideFormFromShowAllWindows(Self);
end;

function TfrmOSXController.GetMainForm: TCustomForm;
begin
  Result := frmMain;
end;

procedure TfrmOSXController._CreateMainForm;
begin
  Application.CreateForm(TfrmMain, frmMain);
end;

procedure TfrmOSXController._InitControllerForm;
var
  ALeft: Integer;
  ATop: Integer;
begin
  //Turn off all border icons.
  BorderIcons := [];

  //Turn off the border.
  BorderStyle := TFmxFormBorderStyle.None;

  //Make window transparent.
  Transparency := True;

  ALeft := Screen.Width DIV 2;
  ATop := Screen.Height DIV 2;

  //Make window 0x0 pixels in size and move it to the center
  //of the screen.
  SetBounds(ALeft, ATop, 0, 0);

  Self.Caption := Application.Title;
end;

end.
