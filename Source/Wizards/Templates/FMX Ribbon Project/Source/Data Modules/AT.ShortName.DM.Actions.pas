unit AT.ShortName.DM.Actions;

interface

uses
  System.SysUtils, System.Classes, FMX.StdActns, System.Actions,
  FMX.ActnList;

type
  TdmActions = class(TDataModule)
    actAppAbout: TAction;
    actAppExit: TFileExit;
    actAppHide: TFileHideApp;
    actAppHideOthers: TFileHideAppOthers;
    actAppPreferences: TAction;
    alstMain: TActionList;
  strict protected
    procedure InitializeActions;
    procedure _InitActions_Linux;
    procedure _InitActions_OSX;
    procedure _InitActions_Win;
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  dmActions: TdmActions;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses
  FMX.Consts;

{$R *.dfm}

constructor TdmActions.Create(AOwner: TComponent);
begin
  inherited;

  InitializeActions;
end;

procedure TdmActions.InitializeActions;
begin
  {$IF Defined(LINUX)}
  _InitActions_Linux;
  {$ENDIF}
  {$IF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}
  _InitActions_OSX;
  {$ENDIF}
  {$IF Defined(MSWINDOWS)}
  _InitActions_Win
  {$ENDIF}
end;

procedure TdmActions._InitActions_Linux;
begin
  {$IF Defined(MSWINDOWS)}
  //Init linux specific actions here...
  {$ENDIF}
end;

procedure TdmActions._InitActions_OSX;
begin
  {$IF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}
  //Create Cmd+, shortcut and assign it to the Preferences action.
  actAppPreferences.ShortCut := TextToShortcut(SmkcCmd + ',');
  {$ENDIF}
end;

procedure TdmActions._InitActions_Win;
begin
  {$IF Defined(MSWINDOWS)}
  //Init mswindows specific actions here...
  {$ENDIF}
end;

end.
