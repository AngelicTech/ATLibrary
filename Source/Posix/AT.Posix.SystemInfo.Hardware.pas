unit AT.Posix.SystemInfo.Hardware;

interface

//todo:
{$IF ( (NOT Defined(ANDROID)) AND (NOT Defined(LINUX)) )}
function AvailCPUCount: Integer;
function BusFrequency: Int64;
function CacheLineSize: Int64;
function CPUCount: Integer;
function CPUFrequency: Int64;
function DiskNames: String;
function DiskStats: String;
function Epoch: Integer;
function FloatingPoint: Integer;
function HasFloatingPoint: Boolean;
function HasVectorUnit: Boolean;
function L1DCacheSize: Int64;
function L1ICacheSize: Int64;
function L2CacheSize: Int64;
function L2Settings: Int64;
function L3CacheSize: Int64;
function L3Settings: Int64;
function LogicalCPUCount: Integer;
function LogicalCPUMaxCount: Integer;
function MachineArchitecture: String;
function MachineByteOrder: Integer;
function MachineClass: String;
function MachineModel: String;
function PageSize: Integer;
function PhysicalCPUCount: Integer;
function PhysicalCPUMaxCount: Integer;
function SystemMemory: Int64;
function TotalMemory: Int64;
function TBFrequency: Int64;
function UserMemory: Int64;
function VectorUnit: Integer;
{$ENDIF}

implementation

{$IF ( (NOT Defined(ANDROID)) AND (NOT Defined(LINUX)) )}
uses
  AT.Posix.SystemInfo, Posix.SysTypes, Posix.SysSysctl;

function AvailCPUCount: Integer;
begin
  Result := _SysCtlInt(CTL_HW, HW_AVAILCPU);
end;

function BusFrequency: Int64;
begin
  Result := _SysCtlInt64(CTL_HW, HW_BUS_FREQ);
end;

function CacheLineSize: Int64;
begin
  Result := _SysCtlInt64(CTL_HW, HW_CACHELINE);
end;

function CPUCount: Integer;
begin
  Result := _SysCtlInt(CTL_HW, HW_NCPU);
end;

function CPUFrequency: Int64;
begin
  Result := _SysCtlInt64(CTL_HW, HW_CPU_FREQ);
end;

function DiskNames: String;
begin
  //todo: get disk names...
  Result := _SysCtlString(CTL_HW, HW_DISKNAMES);
end;

function DiskStats: String;
begin
  Result := ''
  //todo: get disk stats...
end;

function Epoch: Integer;
begin
  Result := _SysCtlInt(CTL_HW, HW_EPOCH);
end;

function FloatingPoint: Integer;
begin
  //todo: get proper floating point value...
  Result := _SysCtlInt('hw.floatingpoint'); //CTL_HW, HW_FLOATINGPT);
end;

function HasFloatingPoint: Boolean;
begin
  Result := (FloatingPoint <> 0);
end;

function HasVectorUnit: Boolean;
begin
  Result := (VectorUnit <> 0);
end;

function L1DCacheSize: Int64;
begin
  Result := _SysCtlInt64(CTL_HW, HW_L1DCACHESIZE);
end;

function L1ICacheSize: Int64;
begin
  Result := _SysCtlInt64(CTL_HW, HW_L1ICACHESIZE);
end;

function L2CacheSize: Int64;
begin
  Result := _SysCtlInt64(CTL_HW, HW_L2CACHESIZE);
end;

function L2Settings: Int64;
begin
  Result := _SysCtlInt64(CTL_HW, HW_L2SETTINGS);
end;

function L3CacheSize: Int64;
begin
  Result := _SysCtlInt64(CTL_HW, HW_L3CACHESIZE);
end;

function L3Settings: Int64;
begin
  Result := _SysCtlInt64(CTL_HW, HW_L3SETTINGS);
end;

function LogicalCPUCount: Integer;
begin
  Result := _SysCtlInt('hw.logicalcpu');
end;

function LogicalCPUMaxCount: Integer;
begin
  Result := _SysCtlInt('hw.logicalcpu_max');
end;

function MachineArchitecture: String;
begin
  //todo: get machine arch...;
  Result := _SysCtlString('hw.machinearch'); //CTL_HW, HW_MACHINE_ARCH);
end;

function MachineByteOrder: Integer;
begin
  Result := _SysCtlInt(CTL_HW, HW_BYTEORDER);
end;

function MachineClass: String;
begin
  Result := _SysCtlString(CTL_HW, HW_MACHINE);
end;

function MachineModel: String;
begin
  Result := _SysCtlString(CTL_HW, HW_MODEL);
end;

function PageSize: Integer;
begin
  Result := _SysCtlInt(CTL_HW, HW_PAGESIZE);
end;

function PhysicalCPUCount: Integer;
begin
  Result := _SysCtlInt('hw.physicalcpu');
end;

function PhysicalCPUMaxCount: Integer;
begin
  Result := _SysCtlInt('hw.physicalcpu_max');
end;

function SystemMemory: Int64;
begin
  Result := _SysCtlInt64(CTL_HW, HW_MEMSIZE);
end;

function TBFrequency: Int64;
begin
  Result := _SysCtlInt64(CTL_HW, HW_TB_FREQ);
end;

function TotalMemory: Int64;
begin
  Result := _SysCtlInt64(CTL_HW, HW_PHYSMEM);
end;

function UserMemory: Int64;
begin
  Result := _SysCtlInt64(CTL_HW, HW_USERMEM);
end;

function VectorUnit: Integer;
begin
  Result := _SysCtlInt(CTL_HW, HW_VECTORUNIT);
end;

{$ENDIF}



end.
