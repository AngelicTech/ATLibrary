unit AT.Wizard.Forms.DXRibbon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxGraphics, cxLookAndFeelPainters, cxLookAndFeels,
  dxCustomWizardControl, dxWizardControl, dxWizardControlForm,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxContainer, cxEdit, cxClasses, dxSkinsForm,
  Vcl.ExtCtrls, Vcl.WinXCtrls, cxLabel, cxTextEdit, cxMaskEdit, cxMemo,
  cxCheckBox, dxToggleSwitch, cxButtonEdit, System.Actions,
  Vcl.ActnList, Vcl.StdActns;

type
  TfrmATDXRibbonProjWiz = class(TdxWizardControlForm)
    wizMain: TdxWizardControl;
    wizpgPgmInfo: TdxWizardControlPage;
    lblProgramName: TcxLabel;
    pnlPgmInfo: TRelativePanel;
    sknctlrMain: TdxSkinController;
    txtProgramName: TcxTextEdit;
    lblPgmShortName: TcxLabel;
    msktxtPgmShortName: TcxMaskEdit;
    lblPgmDescription: TcxLabel;
    memPgmDescription: TcxMemo;
    wizpgPlatforms: TdxWizardControlPage;
    chkPlatformWin32: TdxToggleSwitch;
    pnlPlatforms: TRelativePanel;
    chkPlatformWin64: TdxToggleSwitch;
    wizpgProjInfo: TdxWizardControlPage;
    pnlProjInfo: TRelativePanel;
    lblProjFolder: TcxLabel;
    txtProjFolder: TcxButtonEdit;
    alstMain: TActionList;
    actSelectFolder: TBrowseForFolder;
    txtProjName: TcxTextEdit;
    lblProjName: TcxLabel;
    procedure WizardButtonClicked(Sender: TObject;
      AKind: TdxWizardControlButtonKind; var AHandled: Boolean);
    procedure actSelectFolderAccept(Sender: TObject);
    procedure actSelectFolderBeforeExecute(Sender: TObject);
  strict private
    function GetProjectFolder: String;
    procedure SetProjectFolder(const Value: String);
    function GetPgmDescription: String;
    function GetPgmName: String;
    function GetPgmShortName: String;
    function GetPlatformWin32: Boolean;
    function GetPlatformWin64: Boolean;
    procedure SetPgmDescription(const Value: String);
    procedure SetPgmName(const Value: String);
    procedure SetPgmShortName(const Value: String);
    procedure SetPlatformWin32(const Value: Boolean);
    procedure SetPlatformWin64(const Value: Boolean);
  private
    function GetProjectName: String;
    procedure SetProjectName(const Value: String); protected
    function _BackButtonClicked: Boolean;
    function _CancelButtonClicked: Boolean;
    function _FinishButtonClicked: Boolean;
    function _HelpButtonClicked: Boolean;
    function _NextButtonClicked: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    procedure IntializeWizard;
    property PgmDescription: String read GetPgmDescription write SetPgmDescription;
    property PgmName: String read GetPgmName write SetPgmName;
    property PgmShortName: String read GetPgmShortName write SetPgmShortName;
    property PlatformWin32: Boolean read GetPlatformWin32 write SetPlatformWin32;
    property PlatformWin64: Boolean read GetPlatformWin64 write SetPlatformWin64;
    property ProjectFolder: String read GetProjectFolder write SetProjectFolder;
    property ProjectName: String read GetProjectName write SetProjectName;
  end;

var
  frmATDXRibbonProjWiz: TfrmATDXRibbonProjWiz;

implementation

uses
  System.Rtti, AT.Rtti;

{$R *.dfm}

procedure TfrmATDXRibbonProjWiz.actSelectFolderAccept(
  Sender: TObject);
var
  AFolder: TValue;
begin
  if (AT.Rtti.GetPropertyValue(Sender, 'Folder', AFolder)) then
    ProjectFolder := AFolder.AsString;
end;

procedure TfrmATDXRibbonProjWiz.actSelectFolderBeforeExecute(
  Sender: TObject);
begin
  AT.Rtti.SetPropertyValue(Sender, 'Folder', ProjectFolder);
end;

constructor TfrmATDXRibbonProjWiz.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  IntializeWizard;
end;

procedure TfrmATDXRibbonProjWiz.IntializeWizard;
begin
  PgmDescription := EmptyStr;
  PgmName := EmptyStr;
  PgmShortName := EmptyStr;

  PlatformWin32 := True;
  PlatformWin64 := True;

  ProjectFolder := EmptyStr;
  ProjectName := EmptyStr;

  wizMain.ActivePageIndex := 0;
end;

function TfrmATDXRibbonProjWiz.GetPgmDescription: String;
begin
  Result := memPgmDescription.Lines.Text;
end;

function TfrmATDXRibbonProjWiz.GetPgmName: String;
begin
  Result := txtProgramName.Text;
end;

function TfrmATDXRibbonProjWiz.GetPgmShortName: String;
begin
  Result := msktxtPgmShortName.Text;
end;

function TfrmATDXRibbonProjWiz.GetPlatformWin32: Boolean;
begin
  Result := chkPlatformWin32.Checked;
end;

function TfrmATDXRibbonProjWiz.GetPlatformWin64: Boolean;
begin
  Result := chkPlatformWin64.Checked;
end;

function TfrmATDXRibbonProjWiz.GetProjectFolder: String;
begin
  Result := txtProjFolder.Text;
end;

function TfrmATDXRibbonProjWiz.GetProjectName: String;
begin
  Result := txtProjName.Text;
end;

procedure TfrmATDXRibbonProjWiz.SetPgmDescription(
  const Value: String);
begin
  memPgmDescription.Lines.Text := Value;
end;

procedure TfrmATDXRibbonProjWiz.SetPgmName(const Value: String);
begin
  txtProgramName.Text := Value;
end;

procedure TfrmATDXRibbonProjWiz.SetPgmShortName(const Value: String);
begin
  msktxtPgmShortName.Text := Value;
end;

procedure TfrmATDXRibbonProjWiz.SetPlatformWin32(
  const Value: Boolean);
begin
  chkPlatformWin32.Checked := Value;
end;

procedure TfrmATDXRibbonProjWiz.SetPlatformWin64(
  const Value: Boolean);
begin
  chkPlatformWin64.Checked := Value;
end;

procedure TfrmATDXRibbonProjWiz.SetProjectFolder(const Value: String);
begin
  txtProjFolder.Text := Value;
end;

procedure TfrmATDXRibbonProjWiz.SetProjectName(const Value: String);
begin
  txtProjName.Text := Value;
end;

procedure TfrmATDXRibbonProjWiz.WizardButtonClicked(Sender: TObject;
  AKind: TdxWizardControlButtonKind; var AHandled: Boolean);
begin
  case AKind of
    wcbkBack  : AHandled := _BackButtonClicked;
    wcbkCancel: AHandled := _CancelButtonClicked;
    wcbkFinish: AHandled := _FinishButtonClicked;
    wcbkHelp  : AHandled := _HelpButtonClicked;
    wcbkNext  : AHandled := _NextButtonClicked;
  end;
end;

function TfrmATDXRibbonProjWiz._BackButtonClicked: Boolean;
begin
  Result := False;
end;

function TfrmATDXRibbonProjWiz._CancelButtonClicked: Boolean;
begin
  ModalResult := mrCancel;
  Result := True;
end;

function TfrmATDXRibbonProjWiz._FinishButtonClicked: Boolean;
begin
  ModalResult := mrOk;
  Result := True;
end;

function TfrmATDXRibbonProjWiz._HelpButtonClicked: Boolean;
begin
  Result := False;
end;

function TfrmATDXRibbonProjWiz._NextButtonClicked: Boolean;
begin
  Result := False;
end;

initialization
  frmATDXRibbonProjWiz := TfrmATDXRibbonProjWiz.Create(Application);
finalization
  FreeAndNil(frmATDXRibbonProjWiz);
end.
