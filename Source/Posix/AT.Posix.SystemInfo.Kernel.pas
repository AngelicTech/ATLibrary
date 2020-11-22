unit AT.Posix.SystemInfo.Kernel;

interface

//todo:
{$IF ( (NOT Defined(ANDROID)) AND (NOT Defined(LINUX)) )}
function HostID: Integer;
function Hostname: String;
function MaxExecArgs: Integer;
function MaxOpenFiles: Integer;
function MaxProcesses: Integer;
function MaxVNodes: Integer;
function OSRelease: String;
function OSRevision: Integer;
function OSType: String;
function OSVersion: String;
function SystemSecurityLvl: Integer;
function YPDomainName: String;
{$ENDIF}

implementation

{$IF ( (NOT Defined(ANDROID)) AND (NOT Defined(LINUX)) )}
uses
  AT.Posix.SystemInfo, Posix.SysTypes, Posix.SysSysctl;

function HostID: Integer;
begin
  Result := _SysCtlInt(CTL_KERN, KERN_HOSTID);
end;

function Hostname: String;
begin
  Result := _SysCtlString(CTL_KERN, KERN_HOSTNAME);
end;

function MaxExecArgs: Integer;
begin
  Result := _SysCtlInt(CTL_KERN, KERN_ARGMAX);
end;

function MaxOpenFiles: Integer;
begin
  Result := _SysCtlInt(CTL_KERN, KERN_MAXFILES);
end;

function MaxProcesses: Integer;
begin
  Result := _SysCtlInt(CTL_KERN, KERN_MAXPROC);
end;

function MaxVNodes: Integer;
begin
  Result := _SysCtlInt(CTL_KERN, KERN_MAXVNODES);
end;

function OSRelease: String;
begin
  Result := _SysCtlString(CTL_KERN, KERN_OSRELEASE);
end;

function OSRevision: Integer;
begin
  Result := _SysCtlInt(CTL_KERN, KERN_OSREV);
end;

function OSType: String;
begin
  Result := _SysCtlString(CTL_KERN, KERN_OSTYPE);
end;

function OSVersion: String;
begin
  Result := _SysCtlString(CTL_KERN, KERN_VERSION);
end;

function SystemSecurityLvl: Integer;
begin
  Result := _SysCtlInt(CTL_KERN, KERN_SECURELVL);
end;

function YPDomainName: String;
begin
  Result := _SysCtlString(CTL_KERN, KERN_NISDOMAINNAME);
end;
{$ENDIF}

end.
