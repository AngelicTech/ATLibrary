// ****************************************************************************
//
// Program Name   : AT Library
// Program Version: 1.00
// Platform(s)    : Win32, Win64, OSX, Android, iOS
// Framework      : FireMonkey
//
// Filename       : AT.XPlatform.Audio.pas
// File Version   : 1.00
// Date Created   : 09-OCT-2015
// Author         : Matthew S. Vesperman
//
// Description:
//
// Contains the necessary classes and support routines/data to implement an
//   audio manager for cross-platform use on Android, iOS, OSX, Win32 and Win64.
//
//  Default sound file deployment locations:
//    Android:  assets/internal/
//    iOS    :  StartUp/Documents/
//    OSX    :  Contents/Resources/
//    Windows:  (no default)
//
// Revision History:
//
// v1.00   :   Initial version
//
// ****************************************************************************
//
// COPYRIGHT © 2015 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ****************************************************************************


{ TODO 1 -oMSV -cBug Fixes : Need to figure out fix for iOS Simulator. }

unit AT.XPlatform.Audio;

interface
uses
  //Android only uses...
  {$IFDEF ANDROID}
  Androidapi.JNI.Media, FMX.Helpers.Android, Androidapi.JNI.JavaTypes,
  Androidapi.JNI.GraphicsContentViewText, Androidapi.JNIBridge,
  Androidapi.Helpers,
  {$ENDIF}

  //iOS only uses...
  {$IFDEF IOS}
  Macapi.CoreFoundation, FMX.Platform.iOS, iOSapi.CocoaTypes, iOSapi.Foundation,
  iOSapi.AVFoundation,
  {$ENDIF}

  //OSX only uses...
  {$IFNDEF IOS} {$IFDEF MACOS}
  Macapi.CoreFoundation, FMX.Platform.Mac, Macapi.CocoaTypes, Macapi.AppKit,
  Macapi.Foundation, Macapi.Helpers,
  {$ENDIF} {$ENDIF}

  //Win32, Win64 only uses...
  {$IFDEF MSWINDOWS}
  MMSystem,
  {$ENDIF}

  //Common uses...
  FMX.Dialogs, FMX.Forms, AT.GarbageCollector, Spring, Spring.Collections,
  System.SysUtils, System.Types, System.UITypes, System.Classes;


//Type definitions...
type
  /// <summary>TATSoundData
  /// Stores data for a sound file.
  /// </summary>
  TATSoundData = class
  strict private
    FFilename: String;
    FID: Integer;
    FName: String;
    FNameExt: String;
  public
    /// <summary>TATSoundData.Create (constructor)
    /// </summary>
    /// <param name="AName"> (String) The name to use when referencing the
    ///  sound.<param>
    /// <param name="AFilename"> (String) The filename (with path) for the
    ///  sound.</param>
    /// <param name="ANameExt"> (String) The filename (without path) for the
    ///  sound.</param>
    /// <param name="AID"> (Integer) The ID for the sound.</param>
    /// <remarks>AID is only used on Android and iOS. On all other platforms ID
    ///  is -1.</remarks>
    constructor Create(AName, AFilename, ANameExt: String; AID: Integer);
    /// <summary>TATSoundData.Destroy (destructor)</summary>
    destructor Destroy; override;
    /// <summary>TATSoundData.Filename - The sound's filename with path
    ///  information.</summary>
    /// type:String
    property Filename: String read FFilename write FFilename;
    /// <summary>TATSoundData.ID - The ID for the sound.</summary>
    /// <remarks>ID is only used on Android and
    ///  iOS. On all other platforms ID  is -1.</remarks>
    /// type:Integer
    property ID: Integer read FID write FID;
    /// <summary>TATSoundData.Name - The name to use when referencing the
    ///  sound.</summary>
    /// type:String
    property Name: String read FName write FName;
    /// <summary>TATSoundData.NameExt - The sound's filename without path
    ///  information.</summary>
    /// type:String
    property NameExt: String read FNameExt write FNameExt;
  end;

  {$IFDEF ANDROID}
  /// <summary>TOnSpoolLoadCallback - Used to indicate when a sound file has
  /// completed loading on the Android platform.</summary>
  TOnSpoolLoadCallback = class(TJavaLocal, JSoundPool_OnLoadCompleteListener)
  public
    /// <summary>TOnSpoolLoadCallback.OnLoadComplete - Callback to indicate
    ///  when a sound file has been loaded on the Android platform.</summary>
    /// <param name="soundPool"> (JSoundPool) </param>
    /// <param name="sampleId"> (Integer) </param>
    /// <param name="Status"> (Integer) </param>
    procedure OnLoadComplete(soundPool: JSoundPool; sampleId: Integer; Status:
       Integer); cdecl;
  end;
  {$ENDIF}

  /// <summary>IATAudioManager - Audio Manage Interface.</summary>
  IATAudioManager = interface(IInterface)
    ['{B272DE0F-C772-4C11-B2B8-4BDEDD5B4167}']
    function AddSound(Name, Filename: String): Boolean;
    procedure DeleteSound(Index: Integer); overload;
    procedure DeleteSound(Name: String); overload;
    function GetSound(Index: Integer): TATSoundData; overload;
    function GetSound(Name: String): TATSoundData; overload;
    function GetSoundCount: Integer;
    procedure PlaySound(Index: Integer); overload;
    procedure PlaySound(Name: String); overload;
  end;

  /// <summary>TATAudioManager - Manages a list of audio files.</summary>
  TATAudioManager = class(TInterfacedObject, IATAudioManager)
  //Android only code...
  {$IFDEF ANDROID}
  strict private
    /// <summary>TATAudioManager.FAudioMgr - References the Android audio
    ///  manager.</summary>
    /// type:JAudioManager
    FAudioMgr: JAudioManager;
    /// <summary>TATAudioManager.FSoundPool - References an Android audio pool
    ///  object.</summary>
    /// type:JSoundPool
    FSoundPool: JSoundPool;
    procedure __AddSound_Android(var AID: Integer; Filename: String);
    procedure __Create_Android;
    procedure __DeleteSound_Android(AID: Integer);
    procedure __Destroy_Android;
    procedure __PlaySound_Android(AID: Integer);
  {$ENDIF}
  //iOS only code...
  {$IFDEF IOS}
  strict private
    procedure __AddSound_IOS(var AID: Integer; Filename: String);
    procedure __DeleteSound_IOS(AID: Integer);
    procedure __PlaySound_IOS(AID: Integer);
  {$ENDIF}
  //OSX only code...
  {$IFNDEF IOS} {$IFDEF MACOS}
  strict private
    procedure __AddSound_OSX(var AID: Integer);
    procedure __PlaySound_OSX(AFilename: String);
  {$ENDIF} {$ENDIF}
  //Win32,Win64 only code...
  {$IFDEF MSWINDOWS}
  strict private
    procedure __AddSound_Windows(var AID: Integer);
    procedure __PlaySound_Windows(AFilename: String);
  {$ENDIF}
  strict private
    /// <summary>TATAudioManager.FSounds - The dictionary object to store sound
    ///  data.</summary>
    /// type:IDictionary<String, TATSoundData>
    FSounds: IDictionary<String, TATSoundData>;
    /// <summary>TATAudioManager.GetSoundCount - Returns the number of sounds
    ///  saved in the audio manager.</summary>
    /// <returns> Integer</returns>
    function GetSoundCount: Integer;
    /// <summary>TATAudioManager.GetSoundNameByIndex - Returns the name of a
    ///  sound by its index number.</summary>
    /// <returns> String</returns>
    /// <param name="Index"> (Integer) </param>
    function GetSoundNameByIndex(Index: Integer): String;
  public
    /// <summary>TATAudioManager.Create (constructor)</summary>
    constructor Create;
    /// <summary>TATAudioManager.Destroy (destructor)</summary>
    destructor Destroy; override;
    /// <summary>TATAudioManager.AddSound - Adds a sound to the audio manager.
    ///  </summary>
    /// <returns> Boolean - True if sound was added to the audio manager, False
    /// otherwise.</returns>
    /// <param name="Name"> (String) - The name to use when referencing the
    ///  sound.</param>
    /// <param name="Filename"> (String) - The filename of the sound with path
    ///  information.</param>
    function AddSound(Name, Filename: String): Boolean;
    /// <summary>TATAudioManager.DeleteSound - Removes a sound (by index
    ///  number) from the audio manager</summary>
    /// <param name="Index"> (Integer) </param>
    procedure DeleteSound(Index: Integer); overload;
    /// <summary>TATAudioManager.DeleteSound - Removes a sound (by reference
    ///  name) from the audio manager</summary>
    /// <param name="Name"> (String) </param>
    procedure DeleteSound(Name: String); overload;
    /// <summary>TATAudioManager.GetSound - Retrieves (by index) the sound
    ///  object for a managed sound.</summary>
    /// <returns> TATSoundData</returns>
    /// <param name="Index"> (Integer) </param>
    function GetSound(Index: Integer): TATSoundData; overload;
    /// <summary>TATAudioManager.GetSound - Retrieves (by reference name) the
    ///  sound object for a managed sound.</summary>
    /// <returns> TATSoundData</returns>
    /// <param name="Name"> (String) </param>
    function GetSound(Name: String): TATSoundData; overload;
    /// <summary>TATAudioManager.PlaySound - Plays a sound by index.</summary>
    /// <returns> TATSoundData</returns>
    /// <param name="Index"> (Integer) </param>
    procedure PlaySound(Index: Integer); overload;
    /// <summary>TATAudioManager.PlaySound - Plays a sound by reference name.
    ///  </summary>
    /// <returns> TATSoundData</returns>
    /// <param name="Name"> (String) </param>
    procedure PlaySound(Name: String); overload;
    /// <summary>TATAudioManager.SoundExists - Check if a sound exists in the
    ///  audio manager.</summary>
    /// <returns> Boolean - True if the sound is stored in the audio manager,
    ///  False otherwise.</returns>
    /// <param name="Name"> (String) The sound's reference name.</param>
    function SoundExists(Name: String): Boolean;
    /// <summary>TATAudioManager.SoundCount - The number of sounds managed by
    ///  the audio manager.</summary>
    /// type:Integer
    property SoundCount: Integer read GetSoundCount;
    /// <summary>TATAudioManager.Sounds - Read-Only list of sounds. (By index
    ///  number)</summary>
    /// type:TATSoundData
    /// <param name="Index"> (Integer) </param>
    property Sounds[Index: Integer]: TATSoundData read GetSound;
    /// <summary>TATAudioManager.SoundsByName - Read-Only list of sounds. (By
    ///  reference name)</summary>
    /// type:TATSoundData
    /// <param name="Name"> (String) </param>
    property SoundsByName[Name: String]: TATSoundData read GetSound;
  end;

/// <summary>procedure PlaySound - Plays a sound file.</summary>
/// <param name="Filename"> (String) The filename (with path information) of
///  the sound to play.</param>
procedure PlaySound(Filename: String);

{$IFDEF MSWINDOWS}
/// <summary>procedure PlayResourceSound - Plays a sound resource.</summary>
/// <param name="ResourceName"> (String) The name of the sound resource to
///  play.</param>
procedure PlayResourceSound(ResourceName: String);
{$ENDIF}

var
  /// <summary>ATAudioManager - The default audio manager object.</summary>
  /// type:TATAudioManager
  ATAudioManager: TATAudioManager;

implementation

//Android only module-level definitions.
{$IFDEF ANDROID}
var
  /// <summary>FLoaded - A flag indicating if a sound file was loaded.</summary>
  /// type:Boolean
  FLoaded: Boolean;
{$ENDIF}

//iOS only module-level definitions...
{$IFDEF IOS}
const
  //AudioToolbox library path...
  _libATB = '/System/Library/Frameworks/AudioToolbox.framework/AudioToolbox';

  procedure AudioServicesPlaySystemSound(inSystemSoundID: Integer); cdecl;
            external _libATB name 'AudioServicesPlaySystemSound';
  procedure AudioServicesCreateSystemSoundID(inFileURL: CFURLRef; var
            SystemSoundID: PInteger); cdecl; external _libATB name
            'AudioServicesCreateSystemSoundID';
  procedure AudioServicesDisposeSystemSoundID( inSystemSoundID: integer );
            cdecl; external _libATB name 'AudioServicesDisposeSystemSoundID';
  procedure AudioServicesAddSystemSoundCompletion (inSystemSoundID : integer;
            inRunLoop: CFRunLoopRef; inRunLoopMode : CFStringRef;
            inCompletionRoutine: Pointer; inClientData : CFURLRef); cdecl;
            external _libATB name 'AudioServicesAddSystemSoundCompletion';


  /// <summary>procedure IOSCompleteProc - Callback routine indicating when a
  ///  sound file is done playing.</summary>
  /// <param name="SystemSoundID"> (Integer) </param>
  /// <param name="AData"> (Pointer) </param>
  procedure IOSCompleteProc(SystemSoundID: Integer; var AData: Pointer);
  begin
    //Completion code goes here...
  end;
{$ENDIF}



{ TATSoundData }

constructor TATSoundData.Create(AName, AFilename, ANameExt: String;
  AID: Integer);
begin
  //Initialize sound data fields...
  FName := AName;
  FFilename := AFilename;
  FNameExt := ANameExt;
  FID := AID;
end;

destructor TATSoundData.Destroy;
begin
  inherited;
end;


//Android Only...
{$IFDEF ANDROID}
{ TATSoundData }
procedure TOnSpoolLoadCallback.OnLoadComplete(soundPool: JSoundPool; sampleId:
   Integer; Status: Integer);
begin
  FLoaded := True;  //file is done loading...
end;
{$ENDIF}


{ TATAudioManager }

function TATAudioManager.AddSound(Name, Filename: String): Boolean;
var
  //Common vars...
  ASound: TATSoundData;
  ANameExt: String;
  AID: Integer;
begin
  //Make sure we have a name and filename...
  if ( (Name = '') OR (Filename = '') ) then
    Exit(False);

  //Make sure filename actually exists...
  if (NOT FileExists(Filename)) then
    Exit(False);

  //Check if sound name already exists...
  if (SoundExists(Name)) then
    begin       //yes...
      DeleteSound(Name);                //Delete the existing sound data...
      Exit(AddSound(Name, Filename));   //Add new (updated) sound data...
    end;


  //Android only...
  {$IFDEF ANDROID}
  __AddSound_Android(AID, Filename);
  {$ENDIF}


  //iOS only...
  {$IFDEF IOS}
  __AddSound_IOS(AID, Filename);
  {$ENDIF}


  //OSX only...
  {$IFNDEF IOS} {$IFDEF MACOS}
  __AddSound_OSX(AID);
  {$ENDIF} {$ENDIF}


  //Win32,Win64 only...
  {$IFDEF MSWINDOWS}
  __AddSound_Windows(AID);
  {$ENDIF}


  //Save sound data...
  ANameExt := ExtractFileName(Filename);
  ASound := TATSoundData.Create(Name, Filename, ANameExt, AID);

  //Add sound to dictionary...
  FSounds.Add(Name, ASound);

  Result := True; //Success...
end;

constructor TATAudioManager.Create;
begin
  //Create dictionary...
  FSounds := TCollections.CreateDictionary<String, TATSoundData>
    ([doOwnsValues]);

  //Android only code...
  {$IFDEF ANDROID}
  __Create_Android;
  {$ENDIF}
end;

procedure TATAudioManager.DeleteSound(Index: Integer);
var
  AName: String;
begin
  //Make sure index is valid...
  if ( (Index < 0) OR (Index >= Self.SoundCount) ) then
    Exit;

  //Get the sound's reference name...
  AName := GetSoundNameByIndex(Index);

  //Make sure the name is valid...
  if (AName = '') then
    Exit;

  //Delete the sound by name...
  DeleteSound(AName);
end;

procedure TATAudioManager.DeleteSound(Name: String);
var
  ASound: TATSoundData;
begin
  //Make sure the name is valid...
  if (Name = '') then
    Exit;

  //Retrieve the sound by name...
  ASound := FSounds.Items[Name];

  //Make sure the sound object is valid...
  if (NOT Assigned(ASound)) then
    Exit;


  //Android only...
  {$IFDEF ANDROID}
  __DeleteSound_Android(ASound.ID);
  {$ENDIF}

  {$IFDEF IOS}
  __DeleteSound_IOS(ASound.ID);
  {$ENDIF}

  FSounds.Remove(Name);
end;

destructor TATAudioManager.Destroy;
begin
  //Android only...
  {$IFDEF ANDROID}
  __Destroy_Android;
  {$ENDIF}

  //Clear sounds dictionary...
  FSounds.Clear;

  inherited;
end;

function TATAudioManager.GetSound(Name: String): TATSoundData;
begin
  //Check for valid name...
  if (Name = '') then
    Exit(NIL);

  //Attempt to retrieve the sound data...
  Result := FSounds.Items[Name];
end;

function TATAudioManager.GetSound(Index: Integer): TATSoundData;
var
  AName: String;
begin
  //Check for valid index...
  if ( (Index < 0) AND (Index >= SoundCount) ) then
    Exit(NIL);

  //Get the sound reference name...
  AName := GetSoundNameByIndex(Index);

  //Check for valid name...
  if (AName = '') then
    Exit(NIL);

  //Retrieve the sound data by name...
  Result := GetSound(AName);
end;

function TATAudioManager.GetSoundCount: Integer;
begin
  //Return the number of sound data records...
  Result := FSounds.Count;
end;

function TATAudioManager.GetSoundNameByIndex(Index: Integer): String;
begin
  //Make sure Index is valid...
  if ( (Index < 0) AND (Index >= SoundCount) ) then
    Exit('');

  //Retrieve the name key for the sound at Index...
  Result := FSounds.Keys.ElementAt(Index);
end;

procedure TATAudioManager.PlaySound(Index: Integer);
var
  AName: string;
begin
  //Make sure index is valid...
  if ( (Index < 0) AND (Index >= SoundCount) ) then
    Exit;

  //Get the name of the sound...
  AName := GetSoundNameByIndex(Index);

  //Make sure name is valid...
  if (AName = '') then
    Exit;

  //Play the sound...
  PlaySound(AName);
end;

procedure TATAudioManager.PlaySound(Name: String);
var
  ASound: TATSoundData;
begin
  //Make sure reference name is valid...
  if (Name = '') then
    Exit;

  //Attempt to retrieve sound data...
  ASound := FSounds.Items[Name];

  //Is sound data valid...
  if (NOT Assigned(ASound)) then
    Exit;

  //Android version...
  {$IFDEF ANDROID}
  __PlaySound_Android(ASound.ID);
  {$ENDIF}

  {$IFDEF IOS}
  __PlaySound_IOS(ASound.ID);
  {$ENDIF}

  //Mac OSX version...
  {$IFNDEF IOS} {$IFDEF MACOS}
  __PlaySound_OSX(ASound.Filename);
  {$ENDIF} {$ENDIF}


  //Windows version...
  {$IFDEF MSWINDOWS}
  __PlaySound_Windows(ASound.Filename);
  {$ENDIF}
end;

function TATAudioManager.SoundExists(Name: String): Boolean;
begin
  //Make sure name is valid...
  if (Name ='') then
    Exit(False);

  //Check if key name exists...
  Result := FSounds.Keys.Contains(Name);
end;

{$IFDEF ANDROID}
procedure TATAudioManager.__AddSound_Android(var AID: Integer; Filename:
    String);
var
  FOnLoaded: JSoundPool_OnLoadCompleteListener;
begin
  //Andoid only code...
  FLoaded := False;    //sound not yet loaded...

  //Setup andoid load callback...
  FOnLoaded := TJSoundPool_OnLoadCompleteListener.Wrap((
       TOnSpoolLoadCallback.Create AS ILocalObject).GetObjectID);
  FSoundPool.setOnLoadCompleteListener(FOnLoaded);

  //Load sound into android sound system...
  AID := FSoundPool.load(StringToJString(Filename), 0);
  while (NOT FLoaded) do
    begin
      //make sure app is responsive until sound loads...
      Sleep(10);
      Application.ProcessMessages;
    end;
end;

procedure TATAudioManager.__Create_Android;
begin
  //Init loaded flag...
  FLoaded := False;

  //Create Android audio manager...
  FAudioMgr := TJAudioManager.Wrap((SharedActivity.getSystemService(
     TJContext.JavaClass.AUDIO_SERVICE) AS ILocalObject).GetObjectID);

  //Create Android sound pool...
  FSoundPool := TJSoundPool.JavaClass.init(4,
     TJAudioManager.JavaClass.STREAM_MUSIC, 0);
end;

procedure TATAudioManager.__DeleteSound_Android(AID: Integer);
begin
  //Unload the sound...
  FSoundPool.unload(AID);
end;

procedure TATAudioManager.__Destroy_Android;
var
  Idx: Integer;
  ASound: TATSoundData;
begin
  //Unload all sounds...
  for Idx := 0 to (Self.SoundCount - 1) do
    begin
      ASound := Sounds[Idx];
      if (Assigned(ASound)) then
        begin
          FSoundPool.unload(ASound.ID);
        end;
    end;

  //Free Android objects...
  FreeAndNil(FSoundPool);
  FreeAndNil(FAudioMgr);
end;

procedure TATAudioManager.__PlaySound_Android(AID: Integer);
var
  ACurrVol, AMaxVol, AVol: Double;
begin
  //Get current & max volumes...
  ACurrVol := FAudioMgr.getStreamVolume(TJAudioManager.JavaClass.STREAM_MUSIC);
  AMaxVol := FAudioMgr.getStreamMaxVolume(
     TJAudioManager.JavaClass.STREAM_MUSIC);

  //Calc volume...
  AVol := ACurrVol / AMaxVol;

  //Play sound...
  FSoundPool.play(AID, AVol, AVol, 1, 0, 1);
end;
{$ENDIF}

{$IFDEF IOS}
procedure TATAudioManager.__AddSound_IOS(var AID: Integer; Filename: String);
var
  ANSFilename: CFStringRef;
  ANSURL: CFURLRef;
begin
  //iOS only code...
  //Build iOS filename string/url...
  ANSFilename := CFStringCreateWithCharacters(NIL, PChar(Filename), Length(
     Filename));
  ANSURL := CFURLCreateWithFileSystemPath(NIL, ANSFilename,
     kCFURLPOSIXPathStyle, False);

  //Load sound into iOS sound system.
  AudioServicesCreateSystemSoundID(ANSURL, PInteger(AID));
  AudioServicesAddSystemSoundCompletion(AID, NIL, NIL, @IOSCompleteProc, NIL);
end;
procedure TATAudioManager.__DeleteSound_IOS(AID: Integer);
begin
  //Unload sound...
  AudioServicesDisposeSystemSoundID(AID);
end;


procedure TATAudioManager.__PlaySound_IOS(AID: Integer);
begin
  //Set completion handler...
  AudioServicesAddSystemSoundCompletion(AID, NIL, NIL, @IOSCompleteProc,
     NIL);

  //Play the sound...
  AudioServicesPlaySystemSound(AID);
end;
{$ENDIF}

{$IFNDEF IOS} {$IFDEF MACOS}
procedure TATAudioManager.__AddSound_OSX(var AID: Integer);
begin
  //OSX only code...
  AID := -1;
end;

procedure TATAudioManager.__PlaySound_OSX(AFilename: String);
var
  ANSSound: NSSound;
begin
  //Make sure file exists...
  if (NOT FileExists(AFilename)) then
    Exit;

  //Allocate NSSound object...
  ANSSound := TNSSound.Alloc;
  try
    //Load sound file...
    ANSSound.initWithContentsOfFile(StrToNSStr(AFilename), True);

    //Don't loop...
    ANSSound.setLoops(False);

    //Play sound...
    ANSSound.play;
  finally
    //Release memory...
    ANSSound.release;
  end;
end;
{$ENDIF} {$ENDIF}

{$IFDEF MSWINDOWS}
procedure TATAudioManager.__AddSound_Windows(var AID: Integer);
begin
  //Wind32, Win64 only code...
  AID := -1;
end;

procedure TATAudioManager.__PlaySound_Windows(AFilename: String);
var
  AFlags: Cardinal;
begin
  //Make sure file exists...
  if (NOT FileExists(AFilename)) then
    Exit;

  //Calculate flags...
  AFlags := SND_NODEFAULT OR SND_ASYNC OR SND_FILENAME;

  //Play sound file...
  MMSystem.PlaySound(PChar(AFilename), HInstance, AFlags);
end;
{$ENDIF}

procedure PlaySound(Filename: String);
begin
  //Add sound to manager...
  if (ATAudioManager.AddSound(Filename, Filename)) then
    begin
      //Play sound...
      ATAudioManager.PlaySound(Filename);
    end;
end;

{$IFDEF MSWINDOWS}
procedure PlayResourceSound(ResourceName: String);
var
  AFlags: Cardinal;
begin
  //Make sure resource name is not blank...
  if (ResourceName = '') then
    Exit;

  //Calculate flags...
  AFlags := SND_NODEFAULT OR SND_ASYNC OR SND_RESOURCE;

  //Play sound...
  MMSystem.PlaySound(PChar(ResourceName), HInstance, AFlags);
end;
{$ENDIF}


initialization
  //Create default audio manager...
  ATAudioManager := TATAudioManager.Create;
finalization
  //Free default manager...
  FreeAndNil(ATAudioManager)
end.
