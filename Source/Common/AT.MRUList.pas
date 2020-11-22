//************************************************************************
//
// Program Name   : AT Library
// Platform(s)    : Android, iOS, Linux, MacOS, Windows
// Framework      : Console, FMX, VCL
//
// Filename       : AT.MRUList.pas
// Date Created   : 05-AUG-2014
// Author         : Matthew Vesperman
//
// Description:
//
// Most-Recently-Used (MRU) File List.
//
// Revision History:
//
// v1.00   :   Initial version
// v1.10   :   (14-AUG-2014) Added MRU Listeners...
//
//************************************************************************
//
// COPYRIGHT © 2014 Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
//************************************************************************

/// <summary>
///   Most-Recently-Used (MRU) File List.
/// </summary>
unit AT.MRUList;

interface

uses
{$IFDEF MACOS}
  AT.MacOS.Config.Storage.Custom, AT.MacOS.Config.Storage.XML,
{$ELSE}
  AT.Config.Storage.Custom, AT.Config.Storage.XML,
{$ENDIF}
  System.Classes, System.SysUtils, System.Generics.Collections,
  Spring, Spring.Collections;


type
  /// <summary>
  ///   Raised when there is an internal error in the TATMRUList class.
  /// </summary>
  EATMRUInternalError = class(Exception)
  end;

  /// <summary>
  ///   Raised when an attempt is made to assign a capacity less than 1 to a
  ///   TATMRUList object.
  /// </summary>
  EATMRUInvalidCapacity = class(Exception)
  end;

  /// <summary>
  ///   Raised if an invalid (empty string) caption is passed to TATMRUList
  ///   methods that accept a caption parameter.
  /// </summary>
  EATMRUInvalidCaption = class(Exception)
  end;

  /// <summary>
  ///   Raised if an invalid (empty string) filename is passed to TATMRUList
  ///   methods that accept a filename parameter.
  /// </summary>
  EATMRUInvalidFilename = class(Exception)
  end;

  /// <summary>
  ///   Raised when an index that is not in the range (0 &lt;= Index &lt; Count)
  ///   is passed to TATMRUList methods/properties that accept an Index
  ///   parameter.
  /// </summary>
  EATMRUInvalidIndex = class(Exception)
  end;

  /// <summary>
  ///   Raised by TATMRUList when it needs to read from/write to the
  ///   ConfigStorage and none has been assigned (ConfigStorage = NIL)
  /// </summary>
  EATMRUNoConfigStorage = class(Exception)
  end;

  TATMRUListListener = reference to procedure (ASender: TObject);
  TATMRUListenerPair = TPair<String, TATMRUListListener>;


  /// <summary>
  ///   Defines a record to hold a MRU List Item.
  /// </summary>
  TATMRUItem = record
    Caption: string;
    Filename: string;
  end;

  /// <summary>
  ///   Defines a class to store a list of TATMRUItems.
  /// </summary>
  TATMRUList = class(TObject)
  strict private
    FAutoSave: Boolean;
    FCapacity: Integer;
    FConfigStorage: TATCustomConfigStorage;
    FMRUList: IList<TATMRUItem>;
    FMRUListeners: IDictionary<String, TATMRUListListener>;
    FOnMRUListChanged: TNotifyEvent;
    FSectionName: string;
    function GetCount: Integer;
    function GetItems(Index: Integer): TATMRUItem;
    procedure SetCapacity(Value: Integer);
    procedure SetItems(Index: Integer; Value: TATMRUItem);
    function _CheckCaption(ACaption: String): Boolean;
    function _CheckFilename(AFilename: String): Boolean;
    function _CheckIndexValue(AIndex: Integer): Boolean;
    function _CheckMRUList: Boolean;
    function _CheckStorage: Boolean;
    procedure _DoAutoSave;
    procedure _DoClear;
    procedure _DoMRUListChanged;
    procedure _LoadListFromStorage(ASection: String; AStorage:
        TATCustomConfigStorage);
    procedure _RaiseIndexError;
    procedure _RaiseInternalError;
    procedure _RaiseInvalidCapacity;
    procedure _RaiseInvalidCaption;
    procedure _RaiseInvalidFilename;
    procedure _RaiseNoConfigStorage;
    procedure _SaveListToStorage(ASection: String; AStorage:
        TATCustomConfigStorage);
  public
    constructor Create(AConfigStorage: TATCustomConfigStorage; ASectionName:
        String = 'MRU'; ACapacity: Integer = 10; AAutoSave: Boolean = True);
        overload;
    destructor Destroy; override;
    procedure Add(ACaption, AFilename: string);
    function AddListener(AListener: TATMRUListListener; var AKey: TGuid):
        Boolean;
    procedure Clear;
    function GetItem(AIndex: Integer): TATMRUItem;
    function GetItemByCaption(ACaption: String; var AItem: TATMRUItem): Boolean;
    function GetItemByFilename(AFilename: string; var AItem: TATMRUItem):
        Boolean;
    function GetItemIndexByCaption(ACaption: String): Integer;
    function GetItemIndexByFilename(AFilename: string): Integer;
    procedure LoadList(ASectionName: String = ''; AStorage:
        TATCustomConfigStorage = NIL);
    procedure RemoveItem(AIndex: Integer);
    procedure RemoveItemByCaption(ACaption: String);
    procedure RemoveItemByFilename(AFilename: string);
    procedure RemoveListener(AKey: TGuid);
    procedure SaveList(ASectionName: String = ''; AStorage:
        TATCustomConfigStorage = NIL);
    property AutoSave: Boolean read FAutoSave write FAutoSave default True;
    property Capacity: Integer read FCapacity write SetCapacity default 10;
    property ConfigStorage: TATCustomConfigStorage read FConfigStorage write
        FConfigStorage default NIL;
    property Count: Integer read GetCount;
    property Items[Index: Integer]: TATMRUItem read GetItems write SetItems;
        default;
    property SectionName: string read FSectionName write FSectionName;
    property OnMRUListChanged: TNotifyEvent read FOnMRUListChanged write
        FOnMRUListChanged;
  end;

implementation

//Error resource strings...
resourcestring
  rstrATMRUIdxOutOfBounds = 'List Index Out of Bounds';
  rstrATMRUIntError       = 'AT.MRU Internal Error';
  rstrATMRUIntStgExists   = 'MRU Internal Storage Object Already Exists';
  rstrATMRUInvCapacity    = 'MRU Capacity Must Be <= 1';
  rstrATMRUInvCaption     = 'The Caption Parameter Can Not Be Blank.';
  rstrATMRUInvFilename    = 'The Filename Parameter Can Not Be Blank.';
  rstrATMRUNoCfgFName     = 'MRU Storage File Name Not Specified';
  rstrATMRUNoCfgStg       = 'MRU Config Storage Not Specified';

{
********************************** TATMRUList **********************************
}
constructor TATMRUList.Create(AConfigStorage: TATCustomConfigStorage;
    ASectionName: String = 'MRU'; ACapacity: Integer = 10; AAutoSave: Boolean =
    True);
var
  AOwnership: TDictionaryOwnerships;
begin
  //Call inherited create constructor...
  inherited Create;

  //Initialize property fields...
  FAutoSave := AAutoSave;
  FCapacity := ACapacity;
  FConfigStorage := AConfigStorage;
  FSectionName := ASectionName;

  //Create internal MRU list object...
  FMRUList := TCollections.CreateList<TATMRUItem>;

  //Create internal listeners list...
  AOwnership := [];
  FMRUListeners := TCollections.CreateDictionary<String, TATMRUListListener>(AOwnership);

  //If a storage was specified then...
  if (_CheckStorage) then
    begin
      //Load the list from SectionName in ConfigStorage...
      LoadList(SectionName, ConfigStorage);
    end;
end;

destructor TATMRUList.Destroy;
begin
  SaveList(SectionName, ConfigStorage);

  //Clear the MRU list...
  _DoClear;

  //Call the inherited Destroy destructor...
  inherited Destroy;
end;

procedure TATMRUList.Add(ACaption, AFilename: string);
var
  AItem: TATMRUItem;//Temporary MRUListItem storage...
  Idx1, Idx2: Integer;  //Temp index values...
begin
  //Ensure that the internal MRUList exists...
  if (NOT _CheckMRUList) then
    _RaiseInternalError;  //if not, raise EATMRUInternalError...

  //Check if ACaption is valid...
  if (NOT _CheckCaption(ACaption)) then
    _RaiseInvalidCaption;  //If not then raise EATMRUInvalidCaption exception...

  //Check if AFilename is valid...
  if (NOT _CheckFilename(AFilename)) then
    _RaiseInvalidFilename;  //If not raise EATMRUInvalidFilename exception...

  //Check if item already exists...
  Idx1 := GetItemIndexByCaption(ACaption);    //Try to find ACaption...
  Idx2 := GetItemIndexByFilename(AFilename);  //Try to find AFilename...

  if ( (Idx1 <> -1) AND (Idx1 = Idx2) ) then //If we found a match...
    begin
      FMRUList.Move(Idx1, 0); //Move item to top of list...
    end
  else                //no match found...
    begin
      //Set temp item fields...
      AItem.Caption := ACaption;
      AItem.Filename := AFilename;

      //Insert new item at top of list...
      FMRUList.Insert(0, AItem);

      //Do we need to chop off the last item?
      if (Count > Capacity) then
        FMRUList.Delete(Capacity);  //Yes, delete last item...
    end;

  _DoAutoSave;  //Try to AutoSave...

  _DoMRUListChanged;  //Fire OnMRUListChanged event...
end;

function TATMRUList.AddListener(AListener: TATMRUListListener; var AKey:
    TGuid): Boolean;
begin
  if (NOT Assigned(AListener)) then
    Exit(False);

  AKey := TGuid.NewGuid;

  FMRUListeners.Add(AKey.ToString, AListener);

  AListener(Self);

  Result := True
end;

procedure TATMRUList.Clear;
begin
  //Ensure that the internal MRUList exists...
  if (NOT _CheckMRUList) then
    _RaiseInternalError;  //if not, raise EATMRUInternalError...

  _DoClear; //Clear the MRU list...

  _DoAutoSave;  //Try to AutoSave...

  _DoMRUListChanged;  //Fire OnMRUListChanged event...
end;

function TATMRUList.GetCount: Integer;
begin
  //Ensure that the internal MRUList exists...
  if (NOT _CheckMRUList) then
    _RaiseInternalError;  //if not, raise EATMRUInternalError...

  Result := FMRUList.Count; //Return the number of items in the list...
end;

function TATMRUList.GetItem(AIndex: Integer): TATMRUItem;
begin
  //Ensure that the internal MRUList exists...
  if (NOT _CheckMRUList) then
    _RaiseInternalError;  //if not, raise EATMRUInternalError...

  //Check if AIndex is in the range (0 <= AIndex < Count)...
  if (NOT _CheckIndexValue(AIndex)) then
    _RaiseIndexError; //if not, raise EATMRUInvalidIndex...

  Result := Items[AIndex];  //Return the MRU item at AIndex...
end;

function TATMRUList.GetItemByCaption(ACaption: String; var AItem: TATMRUItem):
    Boolean;
var
  Idx: Integer; //Temporary index storage...
begin
  //Ensure that the internal MRUList exists...
  if (NOT _CheckMRUList) then
    _RaiseInternalError;  //if not, raise EATMRUInternalError...

  //Check if ACaption is valid...
  if (NOT _CheckCaption(ACaption)) then
    _RaiseInvalidCaption;  //If not then raise EATMRUInvalidCaption exception...

  //Set Result to False, this is the default and will be returned if no
  //match can be found...
  Result := False;

  //Iterate over the MRU list items, starting at index 0...
  for Idx := 0  to (Count - 1) do
    begin
      //Determine if the caption of Items[Idx] matches ACaption...
      Result := (Items[Idx].Caption = ACaption);

      //If a match was found...
      if (Result) then
        begin
          //Set the AItem variable's fields...
          AItem.Caption := Items[Idx].Caption;
          AItem.Filename := Items[Idx].Filename;

          //Exit and return the value of Result. (Should be True)...
          Exit(Result);
        end;
    end;
end;

function TATMRUList.GetItemByFilename(AFilename: string; var AItem:
    TATMRUItem): Boolean;
var
  Idx: Integer; //Temporary index storage...
begin
  //Ensure that the internal MRUList exists...
  if (NOT _CheckMRUList) then
    _RaiseInternalError;  //if not, raise EATMRUInternalError...

  //Check if AFilename is valid...
  if (NOT _CheckFilename(AFilename)) then
    _RaiseInvalidFilename;  //If not raise EATMRUInvalidFilename exception...

  //Set Result to False, this is the default and will be returned if no
  //match can be found...
  Result := False;

  //Iterate over the MRU list items, starting at index 0...
  for Idx := 0  to (Count - 1) do
    begin
      //Determine if the filename of Items[Idx] matches AFilename...
      Result := (Items[Idx].Filename = AFilename);

      //If a match was found...
      if (Result) then
        begin
          //Set the AItem variable's fields...
          AItem.Caption := Items[Idx].Caption;
          AItem.Filename := Items[Idx].Filename;

          //Exit and return the value of Result. (Should be True)...
          Exit(Result);
        end;
    end;
end;

function TATMRUList.GetItemIndexByCaption(ACaption: String): Integer;
var
  Idx: Integer; //Temporary index storage...
begin
  //Ensure that the internal MRUList exists...
  if (NOT _CheckMRUList) then
    _RaiseInternalError;  //if not, raise EATMRUInternalError...

  //Check if ACaption is valid...
  if (NOT _CheckCaption(ACaption)) then
    _RaiseInvalidCaption;  //If not then raise EATMRUInvalidCaption exception...

  //Iterate over the MRU list items, starting at index 0...
  for Idx := 0  to (Count - 1) do
    begin
      //Checi if Items[Idx[.Caption equals ACaption...
      if (Items[Idx].Caption = ACaption) then
        Exit(Idx);  //Match found, return Index value...
    end;
  Result := -1; //No match found, return -1...
end;

function TATMRUList.GetItemIndexByFilename(AFilename: string): Integer;
var
  Idx: Integer; //Temporary index storage...
begin
  //Ensure that the internal MRUList exists...
  if (NOT _CheckMRUList) then
    _RaiseInternalError;  //if not, raise EATMRUInternalError...

  //Check if AFilename is valid...
  if (NOT _CheckFilename(AFilename)) then
    _RaiseInvalidFilename;  //If not raise EATMRUInvalidFilename exception...

  //Iterate over the MRU list items, starting at index 0...
  for Idx := 0  to (Count - 1) do
    begin
      //Checi if Items[Idx[.Filename equals AFilename...
      if (Items[Idx].Filename = AFilename) then
        Exit(Idx);  //Match found, return Index value...
    end;
  Result := -1; //No match found, return -1...
end;

function TATMRUList.GetItems(Index: Integer): TATMRUItem;
begin
  //Ensure that the internal MRUList exists...
  if (NOT _CheckMRUList) then
    _RaiseInternalError;  //if not, raise EATMRUInternalError...

  //Check if Index is in the range (0 <= Index < Count)...
  if (NOT _CheckIndexValue(Index)) then
    _RaiseIndexError; //if not, raise EATMRUInvalidIndex...

  Result := FMRUList.Items[Index];  //Return the MRU list item at Index...
end;

procedure TATMRUList.LoadList(ASectionName: String = ''; AStorage:
    TATCustomConfigStorage = NIL);
var
  AActiveStg: TATCustomConfigStorage;
  AActiveSec: String;
begin
  //Ensure that the internal MRUList exists...
  if (NOT _CheckMRUList) then
    _RaiseInternalError;  //if not, raise EATMRUInternalError...

  //Assign AStorage param to temp local var...
  AActiveStg := AStorage;

  //if NO storage object was specified...
  if (NOT Assigned(AActiveStg)) then
    begin
      //Check if there is an object assigned to the
      //ConfigStorage property...
      if (NOT _CheckStorage) then
        begin
          //No config storage, raise EATMRUNoConfigStorage exception...
          _RaiseNoConfigStorage;
        end;

      //Assign ConfigStorage property to temp local var...
      AActiveStg := FConfigStorage;
    end;

  //Was the section name param specified? (not empty string)...
  if (ASectionName <> '') then
    AActiveSec := ASectionName  //Yes, use the param value...
  else
    AActiveSec := FSectionName; //No, use the SectionName property...

  //Is the section name local var still empty string?
  if (AActiveSec = '') then
    AActiveSec := 'MRU';  //Yes, default to 'MRU'...

  //Load the list from storage...
  _LoadListFromStorage(AActiveSec, AActiveStg);
end;

procedure TATMRUList.RemoveItem(AIndex: Integer);
begin
  //Ensure that the internal MRUList exists...
  if (NOT _CheckMRUList) then
    _RaiseInternalError;  //if not, raise EATMRUInternalError...

  //Check if AIndex is in the range (0 <= AIndex < Count)...
  if (NOT _CheckIndexValue(AIndex)) then
    _RaiseIndexError; //if not, raise EATMRUInvalidIndex...

  FMRUList.Delete(AIndex);  //Delete item at AIndex...

  _DoMRUListChanged;
end;

procedure TATMRUList.RemoveItemByCaption(ACaption: String);
var
  Idx: Integer; //Temporary index storage...
begin
  //Attempt to find the item by its caption...
  Idx := GetItemIndexByCaption(ACaption);

  //Check to see if the index returned by GetItemIndexByCaption
  //is in the range (0 <= Idx < Count)...
  if (_CheckIndexValue(Idx)) then
    FMRUList.Delete(Idx); //Idx is in range, so remove the item at Idx...
end;

procedure TATMRUList.RemoveItemByFilename(AFilename: string);
var
  Idx: Integer; //Temporary index storage...
begin
  //Attempt to find the item by its caption...
  Idx := GetItemIndexByFilename(AFilename);

  //Check to see if the index returned by GetItemIndexByFilename
  //is in the range (0 <= Idx < Count)...
  if (_CheckIndexValue(Idx)) then
    FMRUList.Delete(Idx); //Idx is in range, so remove the item at Idx...
end;

procedure TATMRUList.RemoveListener(AKey: TGuid);
begin
  if (NOT FMRUListeners.ContainsKey(AKey.ToString)) then
    Exit;

  FMRUListeners.Remove(AKey.ToString);
end;

procedure TATMRUList.SaveList(ASectionName: String = ''; AStorage:
    TATCustomConfigStorage = NIL);
var
  AActiveStg: TATCustomConfigStorage;
  AActiveSec: String;
begin
  //Ensure that the internal MRUList exists...
  if (NOT _CheckMRUList) then
    _RaiseInternalError;  //if not, raise EATMRUInternalError...

  //Assign AStorage param to temp local var...
  AActiveStg := AStorage;

  //if NO storage object was specified...
  if (NOT Assigned(AActiveStg)) then
    begin
      //Check if there is an object assigned to the
      //ConfigStorage property...
      if (NOT _CheckStorage) then
        begin
          //No config storage, raise EATMRUNoConfigStorage exception...
          _RaiseNoConfigStorage;
        end;

      //Assign ConfigStorage property to temp local var...
      AActiveStg := FConfigStorage;
    end;

  //Was the section name param specified? (not empty string)...
  if (ASectionName <> '') then
    AActiveSec := ASectionName  //Yes, use the param value...
  else
    AActiveSec := FSectionName; //No, use the SectionName property...

  //Is the section name local var still empty string?
  if (AActiveSec = '') then
    AActiveSec := 'MRU';  //Yes, default to 'MRU'...

  //Write the list to storage...
  _SaveListToStorage(AActiveSec, AActiveStg);
end;

procedure TATMRUList.SetCapacity(Value: Integer);
var
  ARemoveCount: Integer;
begin
  //Ensure that the internal MRUList exists...
  if (NOT _CheckMRUList) then
    _RaiseInternalError;  //if not, raise EATMRUInternalError...

  //Check if new value is less than 1...
  if (Value < 1) then
    _RaiseInvalidCapacity;  //Value is < 1, so raise EATMRUInvalidCapacity...

  //Check if the new value is less than the old value...
  if (Value < Count) then
    begin
      //New value is less than old value so we need to remove the list's tail...

      //Calculate number of items to remove...
      ARemoveCount := Count - Value;

      //Delete the list's tail...
      FMRUList.DeleteRange(Value, ARemoveCount);
    end;

  FCapacity := Value; //Save the new value...

  _DoAutoSave;  //Try to AutoSave...

  _DoMRUListChanged;  //Fire OnMRUListChanged event...
end;

procedure TATMRUList.SetItems(Index: Integer; Value: TATMRUItem);
begin
  //Ensure that the internal MRUList exists...
  if (NOT _CheckMRUList) then
    _RaiseInternalError;  //if not, raise EATMRUInternalError...

  //Check if Index is in the range (0 <= Index < Count)...
  if (NOT _CheckIndexValue(Index)) then
    _RaiseIndexError; //if not, raise EATMRUInvalidIndex...

  FMRUList.Items[Index] := Value; //Change the Item at Index...

  _DoAutoSave;  //Try to AutoSave...

  _DoMRUListChanged;  //Fire OnMRUListChanged event...
end;

function TATMRUList._CheckCaption(ACaption: String): Boolean;
begin
  //Check if ACaption is NOT an empty string...
  Result := (ACaption <> '');
end;

function TATMRUList._CheckFilename(AFilename: String): Boolean;
begin
  //Check if AFilename is NOT an empty string...
  Result := (AFilename <> '');
end;

function TATMRUList._CheckIndexValue(AIndex: Integer): Boolean;
begin
  //Ensure AIndex is in the range (0 <= AIndex < Count)...
  Result := ( (AIndex >= 0) AND (AIndex < Count) );
end;

function TATMRUList._CheckMRUList: Boolean;
begin
  //Ensure the internal MRU list was created...
  Result := (Assigned(FMRUList));
end;

function TATMRUList._CheckStorage: Boolean;
begin
  //Ensure the ConfigStorage object has an object assigned to it...
  Result := (Assigned(FConfigStorage));
end;

procedure TATMRUList._DoAutoSave;
begin
  //If we are to AutoSave the list then...
  if (AutoSave) then
  begin
    //Save the list to SectionName in ConfigStorage...
    SaveList(SectionName, ConfigStorage);
  end;
end;

procedure TATMRUList._DoClear;
begin
  if (NOT _CheckMRUList) then
    _RaiseInternalError;  //if not, raise EATMRUInternalError...

  FMRUList.Clear; //Clear the internal MRU list.
end;

procedure TATMRUList._DoMRUListChanged;
var
  AAction : TAction<TATMRUListenerPair>;
begin
  //If a handler is assigned to the OnMRUListChanged event...
  if (Assigned(FOnMRUListChanged)) then
    FOnMRUListChanged(Self);  //Fire the event...

  //Process Listeners...
  if (FMRUListeners.Count > 0) then
    begin

      AAction := procedure(const Pair: TATMRUListenerPair)
                 begin
                   Pair.Value(Self);
                 end;

      FMRUListeners.ForEach(AAction);
    end;
end;

procedure TATMRUList._LoadListFromStorage(ASection: String; AStorage:
    TATCustomConfigStorage);
var
  ACnt: Integer;
  Idx: Integer;
  AKey1: String;
  AKey2: String;
  AVal1: String;
  AVal2: String;
  AItem: TATMRUItem;
begin
  _DoClear;  //Clear List...

  //Get number of saved items...
  ACnt := AStorage.ReadInteger(ASection, 'Count', 0);

  FCapacity := AStorage.ReadInteger(ASection, 'Capacity', 10);

  //Iterate over items in storage...
  for Idx := 0 to (ACnt - 1) do
    begin
      //Generate storage key names...
      AKey1 := Format('Caption%d', [Idx]);
      AKey2 := Format('Filename%d', [Idx]);

      //Read storage data...
      AVal1 := AStorage.ReadString(ASection, AKey1, '');
      AVal2 := AStorage.ReadString(ASection, AKey2, '');

      //Ensure we have a caption and filename...
      if ( (AVal1 <> '') AND (AVal2 <> '') ) then
        begin
          //Assign data to temp item...
          AItem.Caption := AVal1;
          AItem.Filename := AVal2;

          //Add item to list...
          FMRUList.Add(AItem);
        end;
    end;

  _DoMRUListChanged;
end;

procedure TATMRUList._RaiseIndexError;
begin
  raise EATMRUInvalidIndex.Create(rstrATMRUIdxOutOfBounds);
end;

procedure TATMRUList._RaiseInternalError;
begin
  raise EATMRUInternalError.Create(rstrATMRUIntError);
end;

procedure TATMRUList._RaiseInvalidCapacity;
begin
  raise EATMRUInvalidCapacity.Create(rstrATMRUInvCapacity);
end;

procedure TATMRUList._RaiseInvalidCaption;
begin
  raise EATMRUInvalidCaption.Create(rstrATMRUInvCaption);
end;

procedure TATMRUList._RaiseInvalidFilename;
begin
  raise EATMRUInvalidFilename.Create(rstrATMRUInvFilename);
end;

procedure TATMRUList._RaiseNoConfigStorage;
begin
  raise EATMRUNoConfigStorage.Create(rstrATMRUNoCfgStg);
end;

procedure TATMRUList._SaveListToStorage(ASection: String; AStorage:
    TATCustomConfigStorage);
var
  ACnt: Integer;
  Idx: Integer;
  AKey1: String;
  AKey2: String;
  AItem: TATMRUItem;
begin
  //Remove storage entries...
  AStorage.DeleteSection(ASection);

  //Write number of saved items...
  ACnt := Count;
  AStorage.WriteInteger(ASection, 'Count', ACnt);

  AStorage.WriteInteger(ASection, 'Capacity', Capacity);

  //Iterate over items in list...
  for Idx := 0 to (ACnt - 1) do
    begin
      //Generate storage key names...
      AKey1 := Format('Caption%d', [Idx]);
      AKey2 := Format('Filename%d', [Idx]);

      //Get an item from the list...
      AItem := Items[Idx];

      //Write storage data...
      AStorage.WriteString(ASection, AKey1, AItem.Caption);
      AStorage.WriteString(ASection, AKey2, AItem.Filename);
    end;
end;

//end _DoMRUListChanged method...


end.
