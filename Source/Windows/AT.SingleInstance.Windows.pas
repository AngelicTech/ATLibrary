// ******************************************************************
//
// Program Name   : Single Instance Framework
// Platform(s)    : Win32, Win64
// Framework      : FMX
//
// Filename       : AT.SingleInstance.Windows.pas
// File Version   : 1.00
// Date Created   : 08-Dec-2017
// Author         : Matthew Vesperman
//
// Description:
//
// Defines the single instance checking class for the Win32 and Win64
// platforms.
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

//Only compile for the Windows platform.
{$IF NOT Defined(MSWINDOWS)}
  {$MESSAGE Fatal 'AT.SingleInstance.Windows.pas only compiles for the WINDOWS platform.'}
{$ENDIF}

/// <summary>
///   Defines the single instance checking class for the Win32 and
///   Win64 platforms.
/// </summary>
unit AT.SingleInstance.Windows;

interface

uses
  AT.SingleInstance.Base, Winapi.Windows, Winapi.Messages;

type
  /// <summary>
  ///   Defines the buffer type to be used for the memory mapped file
  ///   that is used to share data between different running
  ///   instances of the application.
  /// </summary>
  TATMapBuffer = record
    /// <summary>
    ///   The message handlingmethod handle for the first running
    ///   instance of the application.
    /// </summary>
    FirstInstanceHWnd: HWND;
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
  ///   The single instance checking class for the Win32 and Win64
  ///   platforms.
  /// </summary>
  /// <seealso cref="AT.SingleInstance.Base|TATCustomSingleInstance">
  ///   TATCustomSingleInstance
  /// </seealso>
  TATWindowsSingleInstance = class(TATCustomSingleInstance)
  strict private
    /// <summary>
    ///   Stores a handle to the class' internal message handling
    ///   method.
    /// </summary>
    FHWnd: HWND;
    /// <summary>
    ///   Stores a pointer to the memory mapped file view, referenced
    ///   as a TATMapBuffer.
    /// </summary>
    FMapBuffer: PATMapBuffer;
    /// <summary>
    ///   Stores a handle to the memory mapped file.
    /// </summary>
    FMemMap: THandle;
    /// <summary>
    ///   Stores the identifier associated with the class' registered
    ///   system message.
    /// </summary>
    FMsg: Cardinal;
  strict protected
    /// <seealso cref="AT.SingleInstance.Base|TATCustomSingleInstance.GetIsFirstInstance">
    ///   TATCustomSingleInstance.GetIsFirstInstance
    /// </seealso>
    function GetIsFirstInstance: Boolean; override;
    /// <summary>
    ///   Returns the identifier associated with our custom message.
    /// </summary>
    function GetMessageID: Cardinal; override;
    /// <summary>
    ///   The class' message handling callback method.
    /// </summary>
    procedure WndLoop(var Msg: TMessage);
    /// <summary>
    ///   Creates the application's memory mapped file in the system
    ///   paging area.
    /// </summary>
    procedure _CreateMemoryMap;
    /// <summary>
    ///   Initializes the class' internal message handler.
    /// </summary>
    procedure _InitMessageLoop;
    /// <summary>
    ///   Opens the application's memory mapped file.
    /// </summary>
    procedure _OpenMemoryMap;
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
  System.SysUtils, System.SyncObjs, System.Classes, AT.SingleInstance;


//type
//  TATDataArray = array[0..8192] of char;

var
  /// <summary>
  ///   Stores a reference to the application's named mutex object.
  /// </summary>
  MMutex: TMutex;
  /// <summary>
  ///   Stores the AppID that was passed to CheckSingleInstance.
  /// </summary>
  MAppID: String;
  /// <summary>
  ///   Stores a flag indicating if this is the first instance.
  /// </summary>
  MIsFirstInstance: Boolean;
  /// <summary>
  ///   Stores the name of the memory mapped file.
  /// </summary>
  MMapName: String;
  /// <summary>
  ///   Stores the name of the registered custom message.
  /// </summary>
  MMsgName: String;


constructor TATWindowsSingleInstance.Create;
begin
  inherited;

  //Initialize internal fields...
  FMemMap := 0;
  FMapBuffer := NIL;

  //Generate a name for the memory mapped file...
  MMapName := Format('%s.InstanceMap', [MAppID]);

  //Generate a name for our custom message...
  MMsgName := Format('%s.InstanceMsg', [MAppID]);

  //Register our custom message with windows...
  FMsg := RegisterWindowMessage(PChar(MMsgName));
end;

destructor TATWindowsSingleInstance.Destroy;
begin
  //Do we have a valid view into our memory mapped file???
  if (Assigned(FMapBuffer)) then
    begin
      //Yes, so unmap the view and set variable to NIL...
      UnmapViewOfFile(FMapBuffer);
      FMapBuffer := NIL;
    end;

  //Do we have a valid handle to the memory mapped file???
  if (FMemMap <> 0) then
    begin
      //Yes, so close the handle and set the variable to 0...
      CloseHandle(FMemMap);
      FMemMap := 0;
    end;

  //Remove our internal message handler (if one was allocated)...
  DeallocateHWnd(FHWnd);

  inherited;
end;

class function TATWindowsSingleInstance.CheckSingleInstance(
  const AppID: String; out IsFirst: Boolean;
  out Err: Integer): Boolean;
begin
  //Save the AppID...
  MAppID := AppID;

  //Did we already allocate a mutex???
  if (Assigned(MMutex)) then
    begin
      //Yes, return the previous values...
      IsFirst := MIsFirstInstance;
      Err := 0;
      Exit(True);
    end;

  //Create a mutex object for our application...
  MMutex := TMutex.Create(NIL, True, AppID);

  //Retrieve the last OS error...
  Err := GetLastError;

  //Was a mutext successfully created???
  if (NOT Assigned(MMutex)) then
    begin
      //No, so the call failed...
      MIsFirstInstance := False;
      IsFirst := False;
      Exit(False);
    end;

  //If the Err is 0 then we are the first instance...
  MIsFirstInstance := (Err = 0);

  //Tell caller if this is the first instance...
  IsFirst := MIsFirstInstance;

  //Call was successful...
  Result := True;
end;

function TATWindowsSingleInstance.GetIsFirstInstance: Boolean;
begin
  Result := MIsFirstInstance;
end;

function TATWindowsSingleInstance.GetMessageID: Cardinal;
begin
  //Return the identifier associated with our custom message...
  Result := FMsg;
end;

procedure TATWindowsSingleInstance.SendParamStrings;
var
  AStrings: TStrings;
  Idx: Integer;
  AHWnd: HWND;
begin
  //Create a stringlist to hold the param strings...
  AStrings := TStringList.Create;

  try

    //For all param strings...
    for Idx := 0 to ParamCount do
      AStrings.Add(ParamStr(Idx));    //add it to the stringlist...

    //Open the memory mapped file...
    _OpenMemoryMap;

    //Do we have a reference to the memory mapped file view???
    if (Assigned(FMapBuffer)) then
      begin
        //Yes, so get the handle of the first instance message loop...
        AHWnd := FMapBuffer.FirstInstanceHWnd;

        //Is the handle valid???
        if (AHWnd = 0) then
          begin
            //No, so we will just use the broadcast address...
            AHWnd := HWND_BROADCAST;
          end;

        //Copy the stringlist's text value to the memory mapped file...
        StrPLCopy(FMapBuffer.Value, AStrings.Text,
            High(FMapBuffer.Value));
      end
    else
      begin
        //No, so we will just use the broadcast address...
        AHWnd := HWND_BROADCAST;
      end;

    //Post a message informing the first instance that we
    //are telling it to handle the params...
    PostMessage(AHWnd, MessageID, 0, ParamCount);

  finally

    //Free the stringlist...
    FreeAndNil(AStrings);

  end;
end;

procedure TATWindowsSingleInstance.StartListening;
begin

  //Create the memory mapped file...
  _CreateMemoryMap;

  //Initialize our internal message handler...
  _InitMessageLoop;

end;

procedure TATWindowsSingleInstance.WndLoop(var Msg: TMessage);
var
  AParams: TStrings;
  Cnt: Integer;
  Idx: Integer;
  AHandler: TATSingleInstanceHandler;
begin
  //Did we receive our custom message???
  if (Msg.Msg = MessageID) then
    begin
      //Yes, is the memory mapped file view valid???
      if (Assigned(FMapBuffer)) then
        begin
          //Yes, create a stringlist to get the params...
          AParams := TStringList.Create;

          try

            //Copy the params out of the memory mapped file into our
            //stringlist...
            AParams.Text := String(FMapBuffer.Value);

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

            //Free the stringlist...
            AParams.Free;

          end;

        end;

      //Indicate that we handled the message...
      Msg.Result := 0;
    end
  else
    begin
      //This is NOT our message so pass it to the default window
      //procedure...
      Msg.Result := DefWindowProc(FHWnd, Msg.Msg, Msg.WParam,
          Msg.LParam);
    end;
end;

procedure TATWindowsSingleInstance._CreateMemoryMap;
begin
  //Create a memory mapped file with the size of our  TATMapBuffer
  //in the system paging file...
  FMemMap := CreateFileMapping(
      INVALID_HANDLE_VALUE,
      NIL,
      PAGE_READWRITE,
      0,
      SizeOf(TATMapBuffer),
      PChar(MMapName));

  //If we were not successful then exit...
  if (FMemMap = 0) then
    Exit;

  //Map a view of our memory mapped file with the size of our
  //TATMapBuffer...
  FMapBuffer := MapViewOfFile(
      FMemMap,
      FILE_MAP_ALL_ACCESS,
      0,
      0,
      SizeOf(TATMapBuffer));

  //If we did not get a valid map view then exit...
  if (NOT Assigned(FMapBuffer)) then
    Exit;

  //Initialize our memory mapped file to all zeros...
  FillChar(FMapBuffer^, SizeOf(TATMapBuffer), 0);
end;

procedure TATWindowsSingleInstance._InitMessageLoop;
begin
  //Allocate our message handler...
  FHWnd := AllocateHWnd(WndLoop);

  //If the map buffer was created...
  if (Assigned(FMapBuffer)) then
    begin
      //Store the handle to our message handler into the
      //memory mapped file so other instances can message us
      //directly and avoid the cost of a broadcast...
      FMapBuffer.FirstInstanceHWnd := FHWnd;
    end;
end;

procedure TATWindowsSingleInstance._OpenMemoryMap;
begin
  //Open our memory mapped file in the system paging file...
  FMemMap := OpenFileMapping(
      FILE_MAP_ALL_ACCESS,
      False,
      PChar(MMapName));

  //If we did not get a valid handle then exit...
  if (FMemMap = 0) then
    Exit;


  //Map a view of our memory mapped file with the size of our
  //TATMapBuffer...
  FMapBuffer := MapViewOfFile(
      FMemMap,
      FILE_MAP_ALL_ACCESS,
      0,
      0,
      SizeOf(TATMapBuffer));
end;

initialization

  //Initialize module level variables...
  MMutex := NIL;
  MAppID := EmptyStr;
  MIsFirstInstance := False;

finalization

  //Did we allocate a mutex???
  if (Assigned(MMutex)) then
    FreeAndNil(MMutex); //Yes, so free it...

end.
