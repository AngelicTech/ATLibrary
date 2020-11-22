// ******************************************************************
//
// Program Name   : Single Instance Framework
// Platform(s)    : Linux64
// Framework      : FMX
//
// Filename       : AT.SingleInstance.Linux.pas
// File Version   : 1.00
// Date Created   : 07-Dec-2017
// Author         : Matthew Vesperman
//
// Description:
//
// Defines the single instance checking class for the Linux64
// platform.
//
// Revision History:
//
// v1.00   :   Initial version
//
// ******************************************************************
//
// COPYRIGHT © 2017 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

//Only compile for the LINUX platform.
{$IF NOT Defined(LINUX)}
  {$MESSAGE Fatal 'AT.SingleInstance.Linux.pas only compiles for the LINUX platform.'}
{$ENDIF}

/// <summary>
///   Defines the single instance checking class for the Linux64
///   platform.
/// </summary>
unit AT.SingleInstance.Linux;

interface

uses
  System.Classes, AT.SingleInstance.Base;

type
  /// <summary>
  ///   Defines the buffer type used for the memory mapped file that
  ///   is used to share data between different running instances of
  ///   the application.
  /// </summary>
  TATMapBuffer = record
    /// <summary>
    ///   The process id (PID) of the first running instance of the
    ///   application.
    /// </summary>
    FirstInstancePID: Integer;
    /// <summary>
    ///   Holds the command line parameters from another instance.
    /// </summary>
    Value: array[0..8192] of char;
  end;
  /// <summary>
  ///   A pointer to a TATMapBuffer variable.
  /// </summary>
  PATMapBuffer = ^TATMapBuffer;

  /// <summary>
  ///   Defines an interface to access the ParamsAvailable method for
  ///   the Linux specific single instance class.
  /// </summary>
  IATLinuxSingleInstance = interface(IInterface)
    ['{193CE321-5853-41F1-A94F-319AC6412073}']
    procedure ParamsAvailable;
  end;

  /// <summary>
  ///   The single instance checking class for the Linux64 platform.
  /// </summary>
  /// <seealso cref="AT.SingleInstance.Base|TATCustomSingleInstance">
  ///   TATCustomSingleInstance
  /// </seealso>
  TATLinuxSingleInstance = class(TATCustomSingleInstance,
      IATLinuxSingleInstance)
  strict private
    /// <summary>
    ///   Stores a reference to a TFileStream that is used to
    ///   create/access the memory mapped file on the Linux64
    ///   platform.
    /// </summary>
    FMapFile: TFileStream;
    /// <summary>
    ///   A pointer to the memory mapped file, referenced as a
    ///   TATMapBuffer object.
    /// </summary>
    FMemMap: PATMapBuffer;
  strict protected
    /// <seealso cref="AT.SingleInstance.Base|TATCustomSingleInstance.GetIsFirstInstance">
    ///   TATCustomSingleInstance.GetIsFirstInstance
    /// </seealso>
    function GetIsFirstInstance: Boolean; override;
    /// <summary>
    ///   Called by the ListenCallback procedure to process the
    ///   command line parameters that were saved to the memory
    ///   mapped file.
    /// </summary>
    procedure ParamsAvailable;
  public
    /// <summary>
    ///   The class' constructor method.
    /// </summary>
    constructor Create; override;
    /// <summary>
    ///   The class' destructor method.
    /// </summary>
    destructor Destroy; override;
    /// <seealso cref="AT.SingleInstance.Base|TATCustomSingleInstance.CheckSingleInstance(string,Boolean,Integer)">
    ///   TATCustomSingleInstance.CheckSingleInstance
    /// </seealso>
    class function CheckSingleInstance(const AppID: String;
        out IsFirst: Boolean; out Err: Integer): Boolean; override;
    /// <seealso cref="AT.SingleInstance.Base|TATCustomSingleInstance.SendParamStrings">
    ///   TATCustomSingleInstance.SendParamStrings
    /// </seealso>
    procedure SendParamStrings; override;
    /// <seealso cref="AT.SingleInstance.Base|TATCustomSingleInstance.StartListening">
    ///   TATCustomSingleInstance.StartListening
    /// </seealso>
    procedure StartListening; override;
  end;

implementation

uses
  System.SysUtils, System.IOUtils, Posix.Semaphore, Posix.SysMman,
  Posix.SysTypes, Posix.Unistd, Posix.Signal, Posix.Fcntl,
  Posix.Errno, AT.SingleInstance;


var
  /// <summary>
  ///   Stores a pointer to the Linux semaphore object used to detect
  ///   another running instance.
  /// </summary>
  MSemaphore: Psem_t;
  /// <summary>
  ///   Stores the AppID that was passed to CheckSingleInstance.
  /// </summary>
  MAppID: String;
  /// <summary>
  ///   Stores a flag indicating if this is the first instance.
  /// </summary>
  MIsFirstInstance: Boolean;
  /// <summary>
  ///   Stores the filename of the memory mapped file.
  /// </summary>
  MMapName: String;
  /// <summary>
  ///   Stores the name of the semaphore object.
  /// </summary>
  MSemName: RawByteString;

/// <summary>
///   The method that is called when the SIGUSR1 signal is received.
/// </summary>
procedure ListenCallback(SigNum: Integer); cdecl;
var
  AIntf: IATLinuxSingleInstance;
begin
  case SigNum of
    //Is the signal SIGUSR1???
    SIGUSR1:
      begin
        //Yes, now does the SingleInstance support the
        //IATLinuxSingleInstance interface???
        if (Supports(SingleInstance, IATLinuxSingleInstance,
            AIntf)) then
          AIntf.ParamsAvailable;  //Yes, call ParamsAvailable method...
      end;
  end;
end;

constructor TATLinuxSingleInstance.Create;
var
  ATmpPath: String;
begin
  inherited;

  //Get the path to the temp folder...
  ATmpPath := TPath.GetTempPath;
  ATmpPath := IncludeTrailingPathDelimiter(ATmpPath);

  //Generate the filename for the memory mapped file...
  MMapName := Format('%s%s.InstanceMap.tmp', [ATmpPath, MAppID]);

  //Initialize the FMapFile variable to NIL...
  FMapFile := NIL;

end;

destructor TATLinuxSingleInstance.Destroy;
var
  AFirstPID: Integer;
begin
  //Was the memory mapped file successfully mapped???
  if (Assigned(FMemMap)) then
    begin
      //Yes, so get the PID for the first running instance...
      AFirstPID := FMemMap.FirstInstancePID;

      //Unmap the memory mapped file...
      munmap(FMemMap, SizeOf(TATMapBuffer));

      //Set the variable to NIL...
      FMemMap := NIL;
    end
  else
    AFirstPID := -1;  //No, so we assume that there is no PID to use...

  //Was the file successfully opened???
  if (Assigned(FMapFile)) then
    begin
      //Yes, so close and free it...
      FreeAndNil(FMapFile);
    end;

  //Is our PID the same as the first instance PID???
  //and if so, does the map file exist???
  if ( (getpid = AFirstPID) AND (TFile.Exists(MMapName)) ) then
    begin
      //Yes to both. Since we are the first instance, we need to make
      //sure that the map file is removed from the temp folder...
      TFile.Delete(MMapName);
    end;

  inherited;
end;

class function TATLinuxSingleInstance.CheckSingleInstance(
  const AppID: String; out IsFirst: Boolean;
  out Err: Integer): Boolean;
begin
  //Save the AppID...
  MAppID := AppID;

  //Did we already allocate a semaphore???
  if (Assigned(MSemaphore)) then
    begin
      //Yes, return the previous values...
      IsFirst := MIsFirstInstance;
      Err := 0;
      Exit(True);
    end;

  //Generate the name for the semaphore object (as RawByteString)...
  MSemName := RawByteString(Format('/%s', [AppID]));

  //Attempt to create a semaphore object...
  MSemaphore := sem_open(@MSemName[1], (O_CREAT OR O_EXCL));

  //This is the first instance as long as the semaphore did not
  //fail to be created...
  MIsFirstInstance := (NOT (MSemaphore = SEM_FAILED));

  //Is this the first instance???
  if (NOT MIsFirstInstance) then
    Err := GetLastError //No, get the last error number...
  else
    Err := 0; //Yes, there is no error...

  //Tell the caller if this is the first instance...
  IsFirst := MIsFirstInstance;

  //Call was successful...
  Result := True;
end;

function TATLinuxSingleInstance.GetIsFirstInstance: Boolean;
begin
  Result := MIsFirstInstance;
end;

procedure TATLinuxSingleInstance.ParamsAvailable;
var
  AParams: TStrings;
  Cnt: Integer;
  Idx: Integer;
  AHandler: TATSingleInstanceHandler;
begin
//  Was the memory mapped file properly assigned???
  if (Assigned(FMemMap)) then
    begin
      //Yes, so create a stringlist to hold the command line params...
      AParams := TStringList.Create;

      try

        //Set the stringlist's text to the value in the memory mapped
        //file...
        AParams.Text := String(FMemMap.Value);

        //Get the number of handlers in the dictionary...
        Cnt := SingleInstance.Handlers.Count;

        //For all of the handlers do the following...
        for Idx := 0 to (Cnt - 1) do
          begin
            //Get a reference to the handler...
            AHandler :=
                SingleInstance.Handlers.Values.ElementAt(Idx);

            //If the reference is valid...
            if (Assigned(AHandler)) then
              AHandler(AParams);  //call the handler...
          end;

      finally

        AParams.Free;

      end;

    end;
end;

procedure TATLinuxSingleInstance.SendParamStrings;
var
  AStrings: TStrings;
  Idx: Integer;
  AMapFile: TFileStream;
  AMemMap: PATMapBuffer;
begin
  AMemMap := NIL;

  //Create a stringlist to hold the command line params...
  AStrings := TStringList.Create;

  try

    //For all of the param strings...
    for Idx := 0 to ParamCount do
      AStrings.Add(ParamStr(Idx));  //add it to the stringlist...

    //Open the map file as read/write and don't lock it...
    AMapFile := TFileStream.Create(MMapName,
        (fmOpenReadWrite OR fmShareDenyNone));

    //Map the file to memory...
    AMemMap := mmap(NIL, SizeOf(TATMapBuffer),
      (PROT_READ OR PROT_WRITE), MAP_SHARED, AMapFile.Handle, 0);

    //Was the file properly mapped???
    if (Assigned(AMemMap)) then
      begin
        //Yes, so copy the stringlist's text to the memory mapped
        //file...
        StrPLCopy(AMemMap.Value, AStrings.Text, High(AMemMap.Value));
      end;

    //Send the SIGUSR1 signal to the first instance PID that
    //was in the memory mapped file...
    kill(AMemMap.FirstInstancePID, SIGUSR1);

  finally

    //If the file was previously mapped...
    if (Assigned(AMemMap)) then
      begin
        //Unmap it...
        munmap(AMemMap, SizeOf(TATMapBuffer));

        //And set the variable to NIL...
        AMemMap := NIL;
      end;

    //Close and free the TFileStream...
    FreeAndNil(AMapFile);

    //Free the stringlist...
    FreeAndNil(AStrings);

  end;
end;

procedure TATLinuxSingleInstance.StartListening;
var
  AMapData: TATMapBuffer;
begin
  //Make sure the AMapData variable is set to all zeros (cleared)...
  FillChar(AMapData, SizeOf(TATMapBuffer), 0);

  //Open the map file as read/write, unlocked...
  FMapFile := TFileStream.Create(MMapName,
      (fmCreate OR fmShareDenyNone));

  //Make sure we are at the beginning of file...
  FMapFile.Position := 0;
  //Write the empty data buffer to the file...
  FMapFile.Write(AMapData, SizeOf(AMapData));
  //Return to the beginning of the file...
  FMapFile.Position := 0;

  //Map the file to memory...
  FMemMap := mmap(NIL, SizeOf(TATMapBuffer),
      (PROT_READ OR PROT_WRITE), MAP_SHARED, FMapFile.Handle, 0);

  //Save our PID as the first instance PID...
  FMemMap.FirstInstancePID := getpid;

  //Assign the ListenCallbak procedure as the callback for the
  //SIGUSR1 signal...
  signal(SIGUSR1, ListenCallback);
end;

initialization

  //Initialize module level variable...
  MSemaphore := NIL;
  MAppID := EmptyStr;
  MIsFirstInstance := False;

finalization

  //If the semaphore was properly created...
  if (Assigned(MSemaphore)) then
    begin
      //Close the semaphore...
      sem_close(MSemaphore^);

      //Unlink from it...
      sem_unlink(@MSemName[1]);

      //and set the variable to NIL...
      MSemaphore := NIL;
    end;

end.
