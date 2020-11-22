unit AT.OTA.Repository.Wizard.DXRibbon;

interface

uses
  System.Classes, Winapi.Windows, ToolsAPI, PlatformAPI,
  PlatformConst;

type
  TATDXRibbonRepositoryWizard = class(TNotifierObject, IOTAWizard,
      IOTARepositoryWizard, IOTARepositoryWizard60,
      IOTARepositoryWizard80, IOTAProjectWizard,
      IOTAProjectWizard100)
  strict protected
    function _CloseCurrentProject: Boolean;
    procedure _CreateNewProject(const AFolder: String;
        const AName: String);
  public
    { IOTAWizard }
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
    procedure Execute;
    { IOTARepositoryWizard }
    function GetAuthor: String;
    function GetComment: String;
    function GetGlyph: Cardinal;
    function GetPage: String;
    // IOTARepositoryWizard60
    function GetDesigner: String;
    // IOTARepositoryWizard80
    function GetGalleryCategory: IOTAGalleryCategory;
    function GetPersonality: String;
    // IOTAProjectWizard
    // IOTAProjectWizard100
    function IsVisible(Project: IOTAProject): Boolean;
  end;


procedure Register;


implementation

uses
  AT.Wizard.Forms.DXRibbon, VCL.Controls, VCL.Dialogs,
  System.SysUtils, AT.OTA.Repository.Wizard.Creator.Project;


const
  cIDString = 'AT.OTA.Repository.Wizard.DXRibbonProject';
  cRepoPage = 'Angelic Technology';
  cWizName  = 'Angelic Technology DX Ribbon Project';

resourcestring
  rstrAuthor  = 'Angelic Technology';
  rstrComment = 'Creates a new DevExpress ribbon based project for ' +
                'Angelic Technology.';


procedure Register;
begin
  RegisterPackageWizard(TATDXRibbonRepositoryWizard.Create);
end;

{ TATDXRibbonRepositoryWizard }

procedure TATDXRibbonRepositoryWizard.Execute;
begin
  frmATDXRibbonProjWiz.IntializeWizard;

  if (frmATDXRibbonProjWiz.ShowModal = mrOk) then
    begin
      if (NOT _CloseCurrentProject) then
        Exit;

      _CreateNewProject(frmATDXRibbonProjWiz.ProjectFolder,
          frmATDXRibbonProjWiz.ProjectName);
    end;
end;

function TATDXRibbonRepositoryWizard.GetAuthor: String;
begin
  Result := rstrAuthor;
end;

function TATDXRibbonRepositoryWizard.GetComment: String;
begin
  Result := rstrComment;
end;

function TATDXRibbonRepositoryWizard.GetDesigner: String;
begin
  Result := dVCL;
end;

function TATDXRibbonRepositoryWizard.GetGalleryCategory: IOTAGalleryCategory;
begin
  Result := (BorlandIDEServices As IOTAGalleryCategoryManager).
      FindCategory(cRepoPage);
end;

function TATDXRibbonRepositoryWizard.GetGlyph: Cardinal;
begin
  Result := LoadIcon(hInstance, 'RepositoryWizardProjectIcon')
end;

function TATDXRibbonRepositoryWizard.GetIDString: string;
begin
  Result := cIDString;
end;

function TATDXRibbonRepositoryWizard.GetName: string;
begin
  Result := cWizName;
end;

function TATDXRibbonRepositoryWizard.GetPage: String;
begin
  Result := cRepoPage;
end;

function TATDXRibbonRepositoryWizard.GetPersonality: String;
begin
  Result := sDelphiPersonality;
end;

function TATDXRibbonRepositoryWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

function TATDXRibbonRepositoryWizard.IsVisible(
  Project: IOTAProject): Boolean;
begin
  Result := True;
end;

function TATDXRibbonRepositoryWizard._CloseCurrentProject: Boolean;
var
  ModSvc: IOTAModuleServices;
begin
  if (NOT Supports(BorlandIDEServices, IOTAModuleServices, ModSvc)) then
    Exit(False);

  Result := ModSvc.CloseAll;
end;

procedure TATDXRibbonRepositoryWizard._CreateNewProject(
    const AFolder: String; const AName: String);
var
  ModSvc: IOTAModuleServices;
  Module: IOTAModule;
  AFName: String;
  AProj: IOTAProject;
  APlatforms: IOTAProjectPlatforms;
  Idx: Integer;
  AOpts: IOTAProjectOptions;
begin
  if (NOT Supports(BorlandIDEServices, IOTAModuleServices, ModSvc)) then
    Exit;

  Module := ModSvc.CreateModule(TATOTACustomProjectCreator.Create);

  AFName := IncludeTrailingPathDelimiter(AFolder);
  AFName := Format('%s%s', [AFName, AName]);

  Module.FileName := AName;

  if (NOT Supports(Module, IOTAProject, AProj)) then
    Exit;

  if (NOT Supports(AProj, IOTAProjectPlatforms, APlatforms)) then
    Exit;

  APlatforms.Enabled['Win64'] := frmATDXRibbonProjWiz.PlatformWin64;
  APlatforms.Enabled['Win32'] := frmATDXRibbonProjWiz.PlatformWin32;

  if (NOT Supports(AProj, IOTAProjectOptions, AOpts)) then
    Exit;

  ShowMessage('Here');

  ShowMessage(AOpts.TargetName);

//  for Idx := 0 to (AConfigs.ConfigurationCount - 1) do
//    ShowMessage(AConfigs.Configurations[Idx].Name);



end;

end.
