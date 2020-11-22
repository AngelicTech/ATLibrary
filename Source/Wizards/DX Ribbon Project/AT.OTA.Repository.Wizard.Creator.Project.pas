unit AT.OTA.Repository.Wizard.Creator.Project;

interface

uses
  ToolsAPI;

type
  TATOTACustomProjectFile = class(TInterfacedObject, IOTAFile)
    // IOTAFile
  strict protected
    function GetSource: string;
    function GetAge: TDateTime;
  public
    property Source: string read GetSource;
    property Age: TDateTime read GetAge;
  end;

  TATOTACustomProjectCreator = class(TInterfacedObject, IOTACreator,
      IOTAProjectCreator50, IOTAProjectCreator80,
      IOTAProjectCreator)
  strict protected
    // IOTACreator
    function GetCreatorType: string; virtual;
    function GetExisting: Boolean; virtual;
    function GetFileSystem: string; virtual;
    function GetOwner: IOTAModule; virtual;
    function GetUnnamed: Boolean; virtual;
    // IOTAProjectCreator
    function GetFileName: string; virtual;
    function GetOptionFileName: string; // deprecated;
    function GetShowSource: Boolean; virtual;
    function NewOptionSource(const ProjectName: string): IOTAFile; // deprecated;
    function NewProjectSource(const ProjectName: string): IOTAFile; virtual;
    procedure NewDefaultModule; // deprecated;
    procedure NewProjectResource(const Project: IOTAProject); virtual;
    // IOTAProjectCreator50
    procedure NewDefaultProjectModule(const Project: IOTAProject); virtual;
    // IOTAProjectCreator80
    function GetProjectPersonality: string;
  public
    constructor Create; virtual;
  end;

implementation

uses
  System.SysUtils;

{ TATOTACustomProjectFile }

function TATOTACustomProjectFile.GetAge: TDateTime;
begin
  Result := -1;
end;

function TATOTACustomProjectFile.GetSource: string;
begin
  Result := 'Code';
end;

{ TATOTACustomProjectCreator }

constructor TATOTACustomProjectCreator.Create;
begin
  inherited Create;
end;

function TATOTACustomProjectCreator.GetCreatorType: string;
begin
  Result := sApplication;
end;

function TATOTACustomProjectCreator.GetExisting: Boolean;
begin
  Result := False;
end;

function TATOTACustomProjectCreator.GetFileName: string;
begin
  Result := EmptyStr;
end;

function TATOTACustomProjectCreator.GetFileSystem: string;
begin
  Result := EmptyStr;
end;

function TATOTACustomProjectCreator.GetOptionFileName: string;
begin
  Result := EmptyStr;
end;

function TATOTACustomProjectCreator.GetOwner: IOTAModule;
begin
  Result := GetActiveProject;
end;

function TATOTACustomProjectCreator.GetProjectPersonality: string;
begin
  Result := sDelphiPersonality;
end;

function TATOTACustomProjectCreator.GetShowSource: Boolean;
begin
  Result := False;
end;

function TATOTACustomProjectCreator.GetUnnamed: Boolean;
begin
  Result := True;
end;

procedure TATOTACustomProjectCreator.NewDefaultModule;
begin
  // do nothing
end;

procedure TATOTACustomProjectCreator.NewDefaultProjectModule(
  const Project: IOTAProject);
begin
  // do nothing
end;

function TATOTACustomProjectCreator.NewOptionSource(
  const ProjectName: string): IOTAFile;
begin
  Result := NIL;
end;

procedure TATOTACustomProjectCreator.NewProjectResource(
  const Project: IOTAProject);
begin
  // do nothing
end;

function TATOTACustomProjectCreator.NewProjectSource(
  const ProjectName: string): IOTAFile;
begin
  Result := TATOTACustomProjectFile.Create; //NIL;
end;

end.
