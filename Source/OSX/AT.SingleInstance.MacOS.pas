// ******************************************************************
//
// Program Name   : Single Instance Framework
// Platform(s)    : OSX
// Framework      : FMX
//
// Filename       : AT.SingleInstance.MacOS.pas
// File Version   : 1.00
// Date Created   : 07-Dec-2017
// Author         : Matthew Vesperman
//
// Description:
//
// Defines the single instance checking class for the OSX platform.
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

//Only compile for the OS X platform.
{$IF ( (NOT Defined(MACOS)) OR (Defined(IOS)) )}
  {$MESSAGE Fatal 'AT.SingleInstance.MacOS.pas only compiles for the OS X platform.'}
{$ENDIF}

/// <summary>
///   Defines the single instance checking class for the OSX
///   platform.
/// </summary>
unit AT.SingleInstance.MacOS;

interface

uses
  AT.SingleInstance.Base, Macapi.CoreFoundation;

type
  /// <summary>
  ///   The single instance checking class for the OSX platform.
  /// </summary>
  /// <seealso cref="AT.SingleInstance.Base|TATCustomSingleInstance">
  ///   TATCustomSingleInstance
  /// </seealso>
  TATMacOSSingleInstance = class(TATCustomSingleInstance)
  strict private
    /// <summary>
    ///   Holds a reference to the local CFMessagePort object.
    /// </summary>
    FLocalPort: CFMessagePortRef;
    /// <summary>
    ///   Holds a reference to the local CFRunLoopSource object.
    /// </summary>
    FRunLoopSrc: CFRunLoopSourceRef;
  strict protected
    /// <seealso cref="AT.SingleInstance.Base|TATCustomSingleInstance.GetIsFirstInstance">
    ///   TATCustomSingleInstance.GetIsFirstInstance
    /// </seealso>
    function GetIsFirstInstance: Boolean; override;
  public
    /// <summary>
    ///   The class' constrcutor method.
    /// </summary>
    constructor Create; override;
    /// <summary>
    ///   The clas' destructor method.
    /// </summary>
    destructor Destroy; override;
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
  System.SysUtils, System.Classes, Macapi.Foundation, Macapi.Helpers,
  System.IOUtils, Spring.Collections, AT.SingleInstance;

type
  /// <summary>
  ///   Defines the buffer type to be used with the core foundation
  ///   messaging system.
  /// </summary>
  TATDataArray = array[0..8192] of char;

var
  /// <summary>
  ///   Stores a reference to a NSDistributedLock (Mutex) object.
  /// </summary>
  MMutex: NSDistributedLock;
  /// <summary>
  ///   Stores the AppID that was passed to CheckSingleInstance.
  /// </summary>
  MAppID: String;
  /// <summary>
  ///   Stores a flag indicating if this is the first instance.
  /// </summary>
  MIsFirstInstance: Boolean;
  /// <summary>
  ///   Holds the name of the port used with the core foundation
  ///   messaging system.
  /// </summary>
  MPortName: String;

/// <summary>
///   The callback function that the core foundation messaging system
///   calls when a new instance sends us a param strings message.
/// </summary>
/// <param name="APort">
///   The local message port that received the message.
/// </param>
/// <param name="AMessageID">
///   An arbitrary integer value assigned to the message by the
///   sender.
/// </param>
/// <param name="AData">
///   The message data.
/// </param>
/// <param name="AInfo">
///   The info member of the CFMessagePortContext structure that was
///   used when creating APort.
/// </param>
/// <returns>
///   Data to send back to the sender of the message. The system
///   releases the returned CFData object. Return NULL if you want an
///   empty reply returned to the sender.
/// </returns>
/// <remarks>
///   If you want the message data to persist beyond this callback,
///   you must explicitly create a copy of data rather than merely
///   retain it; the contents of data will be deallocated after the
///   callback exits.
/// </remarks>
/// <seealso href="https://developer.apple.com/documentation/corefoundation/cfmessageportcallback">
///   CFMessagePortCallBack <br />
/// </seealso>
function ListenCallback(APort: CFMessagePortRef; AMessageID: SInt32;
    AData: CFDataRef; AInfo: Pointer): CFDataRef; cdecl;
var
  ALen: Integer;
  AValue: TATDataArray;
  AParams: TStrings;
  Cnt: Integer;
  Idx: Integer;
  AHandler: TATSingleInstanceHandler;
begin
  Result := NIL;  //We don't need to return anything to the caller...

  //Get the size of the AData object that was sent to us...
  ALen := CFDataGetLength(AData);

  //Copy the data from AData to our own data buffer variable...
  CFDataGetBytes(AData, CFRangeMake(0, ALen), PByte(@AValue[0]));

  //Create a stringlist to hold the parameters...
  AParams := TStringList.Create;

  try

    //Set the stringlist text to the Value variable's contents...
    AParams.Text := String(AValue);

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

constructor TATMacOSSingleInstance.Create;
begin
  inherited Create;

  //Generate a name for the core foundatio messaging system port...
  MPortName := Format('%s.InstancePort', [MAppID]);
end;

destructor TATMacOSSingleInstance.Destroy;
begin
  //If we have a reference to a CFRunLoopSource object...
  if (Assigned(FRunLoopSrc)) then
    CFRelease(FRunLoopSrc); //Release it...

  //If we have a reference to a CFMessagePort object...
  if (Assigned(FLocalPort)) then
    CFRelease(FLocalPort);  //Release it...

  inherited;
end;

class function TATMacOSSingleInstance.CheckSingleInstance(
  const AppID: String; out IsFirst: Boolean;
  out Err: Integer): Boolean;
var
  AFileName: String;
begin
  //Save the AppID...
  MAppID := AppID;

  //Do we already have a Mutex???
  if (Assigned(MMutex)) then
    begin
      //Yes, return the previous values...
      IsFirst := MIsFirstInstance;
      Err := 0;
      Exit(True);
    end;

  //Calculate the name for the Mutex...
  AFileName := TPath.GetTempPath;
  AFileName := IncludeTrailingPathDelimiter(AFileName);

  AFileName := Format('%s%s.instance.lock', [AFileName, AppID]);

  //Create a NSDistributedLock (Mutex) object...
  MMutex := TNSDistributedLock.Wrap(
      TNSDistributedLock.Alloc.initWithPath(
      StrToNSStr(AFileName)));

  //Get the last OS error...
  Err := GetLastError;

  //Was a Mutex created???
  if (NOT Assigned(MMutex)) then
    begin
      //No, then the call failed...
      MIsFirstInstance := False;
      IsFirst := False;
      Exit(False);
    end;

  //This is the first instance if, and only if, we can lock the 
  //Mutex object... 
  MIsFirstInstance := MMutex.tryLock;

  //Return the first instance flag value...
  IsFirst := MIsFirstInstance;

  //Call success...
  Result := True;
end;

function TATMacOSSingleInstance.GetIsFirstInstance: Boolean;
begin
  Result := MIsFirstInstance;
end;

procedure TATMacOSSingleInstance.SendParamStrings;
var
  AMsgID: SInt32;
  ATimeout: CFTimeInterval;
  ARemotePort: CFMessagePortRef;
  AResult: CFDataRef;
  AStrings: TStrings;
  Idx: Integer;
  AValue: TATDataArray;
  ASize: Integer;
  AData: CFDataRef;
begin
  //Set the message id to send to our MessageID property...
  AMsgID := MessageID;

  //Set the timeout for the core foundation messaging system call...
  ATimeout := 10.0;

  //Init variables...
  AResult := NIL;
  ARemotePort := NIL;

  //Create a stringlist to hold the params...
  AStrings := TStringList.Create;

  try

    //For each command line parameter...
    for Idx := 0 to ParamCount do
      AStrings.Add(ParamStr(Idx));  //Add it to the string list...

    //Get the size of outr data buffer...
    ASize := SizeOf(AValue);

    //Set the data buffer to all zeros (empty).
    FillChar(AValue, ASize, 0);

    //Copy the stringlist text into our data buffer...
    StrPLCopy(AValue, AStrings.Text, High(AValue));

    //Create a data object to pass to the core foundation messaging
    //system...
    AData := CFDataCreate(NIL, PByte(@AValue[0]), ASize);

    //Open a core foundation system remote port object that points to
    //the named port...
    ARemotePort := CFMessagePortCreateRemote(
        NIL,
        CFSTR(MPortName));

    //Send our message to the first instance using the core foundation
    //messaging system...
    CFMessagePortSendRequest(ARemotePort, AMsgID, AData, ATimeout,
        ATimeout, NIL, AResult);

  finally
    //Were we sent a result back???    
    if (Assigned(AResult)) then
      CFRelease(AResult); //Yes, release it...

    //If we have a reference to a CFMessagePort object...
    if (Assigned(ARemotePort)) then
      CFRelease(ARemotePort); //release the remote port...
   
    //free our stringlist...
    AStrings.Free;
  end;
end;

procedure TATMacOSSingleInstance.StartListening;
begin
  //Create a core foundation messaging system local port that uses
  //our ListenCallback function to handle received messages on
  //our named port...
  FLocalPort := CFMessagePortCreateLocal(
      NIL,
      CFSTR(MPortName),
      ListenCallback,
      NIL,
      NIL);

  //Create a CFRunLoopSource object...
  FRunLoopSrc := CFMessagePortCreateRunLoopSource(NIL, FLocalPort,
      0);

  //Add our runloop into the messaging system...
  CFRunLoopAddSource(CFRunLoopGetCurrent, FRunLoopSrc,
      kCFRunLoopCommonModes);
end;

initialization

  //Initialize module level variables...
  MMutex := NIL;
  MAppID := EmptyStr;
  MIsFirstInstance := False;

finalization

  //If we are the first instance...
  if (MIsFirstInstance) then
    //Make sure we unlock the mutex before we terminate...
    MMutex.unlock;  

end.
