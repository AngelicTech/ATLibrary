// ******************************************************************
//
// Program Name   : AT Library
// Platform(s)    : Android, iOS, Linux, MacOS, Windows
// Framework      : Console, FMX, VCL
//
// Filename       : AT.Config.Storage.SQLite3.pas
// Date Created   : 12-AUG-2016
// Author         : Matthew Vesperman
//
// Description:
//
// SQLite3 config storage class.
//
// Revision History:
//
// v1.00   :   Initial version
//
// ******************************************************************
//
// COPYRIGHT © 2016 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

/// <summary>
///   SQLite 3 based configuration storage class.
/// </summary>
unit AT.Config.Storage.SQLite3;

interface

uses
  {$IF Defined(MACOS) AND NOT Defined(IOS)}
  Macapi.Foundation, Macapi.Helpers,
  {$ENDIF}
  System.Classes, AT.Config.Storage.Custom, System.SysUtils,
  Data.DB, DBAccess, AT.GarbageCollector, System.SyncObjs,
  Uni, UniProvider, SQLiteUniProvider, AT.Config.Storage.Intf;

type
  EATCfgSQLite3Encrypted = class(Exception)
  end;

  EATCfgSQLite3InvalidKey = class(Exception)
  end;

  TATConfigSQLite3Storage = class(TATCustomConfigStorage,
      ICfgStgDelete, ICfgStgQuery, ICfgStgRead, ICfgStgWrite)
  strict private
    FProvider: TSQLiteUniProvider;
    FConnection: TUniConnection;
    FEncryptionKey: string;
    FFileName: string;
    FGC: IATGarbageCollector;
    {$IF Defined(MSWINDOWS)}
    FMutex: TMutex;
    {$ENDIF}
    {$IF Defined(MACOS) AND NOT Defined(IOS)}
    FLocked: Boolean;
    FMutex: NSDistributedLock;
    {$ENDIF}
    FMutexName: String;
    function _CreateConnection: TUniConnection;
  strict protected
    procedure _EnsureTablesExist;
    function GetConnection: TUniConnection; virtual;
    procedure _CreateNewConfig; virtual;
    procedure _DeleteEntry(const ASection, AKey: String);
    procedure _DeleteSection(const ASection: String);
    procedure _InsertOrUpdateAppOption(
        const ASection, AKey, AData: String);
    procedure _InsertOrUpdateKVPair(
        const ATableName, AKey, AData: String); virtual;
    procedure _LoadConfig; virtual;
    function _ReadValue(const sSection: String; sEntry: String;
        out AValue: String): Boolean; virtual;
    procedure _SetConnSpecificOption(const AKey: String;
        const AValue: String);
    procedure _UpdateDBLog; virtual;
    procedure _WriteValue(const sSection: String;
        const sEntry: String; const sValue: String); virtual;
    property Connection: TUniConnection read GetConnection;
    {$IF Defined(MSWINDOWS)}
    property Mutex: TMutex read FMutex;
    {$ENDIF}
    {$IF Defined(MACOS) AND NOT Defined(IOS)}
    property Mutex: NSDistributedLock read FMutex;
    {$ENDIF}
    property MutexName: String read FMutexName write FMutexName;
  public
    constructor Create; overload; override;
    constructor Create(const AFilename, AMutexName: String;
        const AEncryptionKey: String = ''); overload; virtual;
    destructor Destroy; override;
    procedure BeginUpdate; override;
    procedure DeleteEntry(const sSection: String;
        const sEntry: String); override;
    procedure DeleteSection(const sSection: String); override;
    procedure EndUpdate; override;
    function HasEntry(const sSection: String;
        const sEntry: String): Boolean; virtual;
    function HasSection(const sSection: String): Boolean; virtual;
    function ReadBoolean(const sSection: String; const sEntry: String;
        const bDefault: Boolean): Boolean; override;
    function ReadCurrency(const sSection: String;
        const sEntry: String;
        const cDefault: Currency): Currency; override;
    function ReadDate(const sSection: String; const sEntry: String;
        const dtDefault: TDateTime): TDateTime; override;
    function ReadDateTime(const sSection: String;
        const sEntry: String;
        const dtDefault: TDateTime): TDateTime; override;
    function ReadDouble(const sSection: String; const sEntry: String;
        const rDefault: Double): Double; override;
    function ReadInteger(const sSection: String; const sEntry: String;
        const iDefault: Integer): Integer; override;
    function ReadString(const sSection, sEntry, sDefault: String):
        string; override;
    function ReadTime(const sSection: String; const sEntry: String;
        const dtDefault: TDateTime): TDateTime; override;
    procedure WriteBoolean(const sSection: String;
        const sEntry: String; const bValue: Boolean); override;
    procedure WriteCurrency(const sSection: String;
        const sEntry: String; const cValue: Currency); override;
    procedure WriteDate(const sSection: String; const sEntry: String;
        const dtValue: TDateTime); override;
    procedure WriteDateTime(const sSection: String;
        const sEntry: String; const dtValue: TDateTime); override;
    procedure WriteDouble(const sSection: String;
        const sEntry: String; const rValue: Double); override;
    procedure WriteInteger(const sSection: String;
        const sEntry: String; const iValue: Integer); override;
    procedure WriteString(const sSection: String;
        const sEntry: String; const sValue: String); override;
    procedure WriteTime(const sSection: String; const sEntry: String;
        const dtValue: TDateTime); override;
  published
    property FileName: string read FFileName write FFileName;
  end;

implementation

uses
  OXmlUtils, AT.Validate, AT.XPlatform;

const
  cCRLF = #13#10;

  cCfgEncyptAlgorithm = 'leAES256';

  cCfgTblAppOpts = 'AppOptions';
  cCfgTblDBInfo  = 'DBInfo';
  cCfgTblDBLog   = 'DBLog';

  cDBIDataSignature = 'ATConfig';
  cDBIDataVersion   = '2017.06';

  cDBIKeySignature = 'Signature';
  cDBIKeyVersion   = 'Version';

  cFldCreateDT   = 'CreateDT';
  cFldData       = 'Data';
  cFldHasEntry   = 'HasEntry';
  cFldHasSection = 'HasSection';
  cFldID         = 'ID';
  cFldKey        = 'Key';
  cFldLastModDT  = 'LastModDT';
  cFldSection    = 'Section';

  cKVFramework = 'framework';
  cKVHostName  = 'hostname';
  cKVLastMod   = 'last-modified';
  cKVOSUser    = 'os-user';
  cKVPlatform  = 'platform';

  cParmCreateDT  = 'CreateDT';
  cParmData      = 'Data';
  cParmFieldName = 'FieldName';
  cParmID        = 'ID';
  cParmKey       = 'Key';
  cParmLastModDT = 'LastModDT';
  cParmSection   = 'Section';
  cParmTblName   = 'TableName';

  cSQLCreateTbls = 'CREATE TABLE IF NOT EXISTS ' + cCfgTblDBInfo +
                   '(' + cCRLF +
                   cFldKey + ' TEXT PRIMARY KEY UNIQUE NOT NULL,' +
                   cCRLF +
                   cFldData + ' TEXT);' + cCRLF +
                   'CREATE TABLE IF NOT EXISTS ' + cCfgTblDBLog +
                   '(' + cCRLF +
                   cFldKey + ' TEXT PRIMARY KEY UNIQUE NOT NULL,' +
                   cCRLF +
                   cFldData + ' TEXT);' + cCRLF +
                   'CREATE TABLE IF NOT EXISTS ' + cCfgTblAppOpts +
                   '(' + cCRLF +
                   cFldID + ' TEXT PRIMARY KEY UNIQUE NOT NULL,' +
                   cCRLF +
                   cFldSection + ' TEXT NOT NULL,' + cCRLF +
                   cFldKey + ' TEXT NOT NULL,' + cCRLF +
                   cFldData + ' TEXT,' + cCRLF +
                   cFldCreateDT + ' DATETIME NOT NULL,' + cCRLF +
                   cFldLastModDT + ' DATETIME NOT NULL);';
  cSQLDeleteEntry = 'DELETE FROM AppOptions WHERE ( (' +
                    cFldSection + ' = :' + cParmSection + ') AMD (' +
                    cFldKey + ' = :' + cParmKey + ') );';
  cSQLDelSection = 'DELETE FROM AppOptions WHERE (' +
                   cFldSection + ' = :' + cParmSection + ');';
  cSQLHasEntry = 'SELECT Count(ID) AS &' + cParmFieldName +
                 ' FROM AppOptions WHERE ( (' +
                 cFldSection + ' = :' + cParmSection + ') AND (' +
                 cFldKey + ' = :' + cParmKey + ') );';
  cSQLHasSection = 'SELECT Count(ID) AS &' + cParmFieldName +
                   ' FROM AppOptions WHERE ( ' +
                   cFldSection + ' = :' + cParmSection + ');';
  cSQLInsAO = 'INSERT OR IGNORE INTO AppOptions (' +
                 cFldID + ', ' + cFldSection + ', ' + cFldKey +
                 ', ' + cFldData + ', ' + cFldCreateDT + ', ' +
                 cFldLastModDT + ')' +
                ' VALUES (:' + cParmID + ', :' + cParmSection +
                ', :' + cParmKey + ', :' + cParmData +
                ', :' + cParmCreateDT + ', :' + cParmLastModDT + ');';
  cSQLInsUpdKV = 'INSERT OR IGNORE INTO &' + cParmTblName + ' (' +
                cFldKey + ', ' + cFldData + ')' +
                ' VALUES (:' + cParmKey + ', :' + cParmData + ');' +
                cCRLF +
                'UPDATE &' + cParmTblName +
                ' SET ' + cFldData + ' = :' + cParmData +
                ' WHERE (' + cFldKey + ' = :' + cParmKey + ');';
  cSQLSelAppOpt = 'SELECT ' + cFldData + ' FROM AppOptions WHERE ' +
                  '( (' + cFldSection + ' = :' + cParmSection + ') ' +
                  ' AND (' + cFldKey + ' = :' + cParmKey + ') );';
  cSQLUpdAO = 'UPDATE AppOptions' +
              ' SET ' + cFldData + ' = :' + cParmData + ', ' +
              cFldLastModDT + ' = :' + cParmLastModDT +
              ' WHERE ( (' + cFldSection + ' = :' + cParmSection +
              ') AND (' + cFldKey + ' = :' + cParmKey + ') );';

  cValFalse = 'False';
  cValTrue = 'True';


constructor TATConfigSQLite3Storage.Create;
begin
  inherited Create;
end;

constructor TATConfigSQLite3Storage.Create(
    const AFilename, AMutexName: String;
    const AEncryptionKey: String = '');
begin
  Self.Create;

  FileName := AFilename;

  FEncryptionKey := AEncryptionKey;
  FMutexName := AMutexName;

  {$IF Defined(MSWINDOWS)}
  FMutex := TMutex.Create(NIL, False, FMutexName);
  {$ENDIF}

  {$IF Defined(MACOS) AND NOT Defined(IOS)}
  FLocked := False;
  FMutexName := Format('%s.lock', [AFilename]);
  FMutex := TNSDistributedLock.Wrap(
      TNSDistributedLock.Alloc.initWithPath(StrToNSStr(FMutexName)));
  {$ENDIF}


  if (NOT FileExists(FileName)) then
    _CreateNewConfig;

  _LoadConfig;
end;

destructor TATConfigSQLite3Storage.Destroy;
begin
  if (NOT Updating) then
    BeginUpdate;

  _UpdateDBLog;

  if (Updating) then
    EndUpdate;

  {$IF Defined(MSWINDOWS)}
  FMutex.Free;
  {$ENDIF}


  inherited Destroy;
end;

procedure TATConfigSQLite3Storage.BeginUpdate;
begin
  if (Updating) then
    Exit;

  inherited BeginUpdate;

  {$IF Defined(MSWINDOWS)}
  FMutex.Acquire;
  {$ENDIF}

  {$IF Defined(MACOS) AND NOT Defined(IOS)}
  while (NOT FMutex.tryLock) do
    Sleep(10);

  FLocked := True;
  {$ENDIF}

  if (NOT Connection.InTransaction) then
    Connection.StartTransaction;
end;

procedure TATConfigSQLite3Storage.DeleteEntry(const sSection: String;
    const sEntry: String);
var
  AGC: IATGarbageCollector;
begin
  if (NOT Updating) then
    begin
      BeginUpdate;

      TATGC.Cleanup(procedure
        begin
          EndUpdate;
        end, AGC);
    end;

  _DeleteEntry(sSection, sEntry);
end;

procedure TATConfigSQLite3Storage.DeleteSection(
    const sSection: String);
var
  AGC: IATGarbageCollector;
begin
  if (NOT Updating) then
    begin
      BeginUpdate;

      TATGC.Cleanup(procedure
        begin
          EndUpdate;
        end, AGC);
    end;

  _DeleteSection(sSection);

  EndUpdate;
end;

procedure TATConfigSQLite3Storage.EndUpdate;
begin
  if (NOT Updating) then
    Exit;

  if (Connection.InTransaction) then
    Connection.Commit;

  _UpdateDBLog;

  {$IF Defined(MSWINDOWS)}
  FMutex.Release;
  {$ENDIF}

  {$IF Defined(MACOS) AND NOT Defined(IOS)}
  if (FLocked) then
    FMutex.unlock;

  FLocked := False;
  {$ENDIF}

  inherited EndUpdate;
end;

function TATConfigSQLite3Storage.GetConnection: TUniConnection;
begin
  if (NOT Assigned(FConnection)) then
    FConnection := _CreateConnection;

  Result := FConnection;
end;

function TATConfigSQLite3Storage.HasEntry(const sSection: String;
    const sEntry: String): Boolean;
var
  AGC: IATGarbageCollector;
  AQry: TUniQuery;
begin

  AQry := TATGC.Collect(TUniQuery.Create(NIL), AGC);
  AQry.Connection := Connection;
  AQry.SQL.Text := cSQLHasEntry;
  AQry.ParamByName(cParmSection).AsString := sSection;
  AQry.ParamByName(cParmKey).AsString := sEntry;

  AQry.MacroByName(cParmFieldName).AsString := cFldHasEntry;

  AQry.Prepare;
  TATGC.Cleanup(procedure
    begin
      AQry.Close;
      AQry.UnPrepare;
    end, AGC);

  AQry.Open;

  Result := ( (AQry.RecordCount > 0) AND
              (AQry.FieldByName(cFldHasEntry).AsInteger > 0) );
end;

function TATConfigSQLite3Storage.HasSection(
    const sSection: String): Boolean;
var
  AGC: IATGarbageCollector;
  AQry: TUniQuery;
begin
  AQry := TATGC.Collect(TUniQuery.Create(NIL), AGC);
  AQry.Connection := Connection;
  AQry.SQL.Text := cSQLHasSection;
  AQry.ParamByName(cParmSection).AsString := sSection;

  AQry.MacroByName(cParmFieldName).AsString := cFldHasSection;

  AQry.Prepare;
  TATGC.Cleanup(procedure
    begin
      AQry.Close;
      AQry.UnPrepare;
    end, AGC);

  AQry.Open;

  Result := ( (AQry.RecordCount > 0) AND
              (AQry.FieldByName(cFldHasSection).AsInteger > 0) );
end;

function TATConfigSQLite3Storage.ReadBoolean(const sSection: String;
    const sEntry: String; const bDefault: Boolean): Boolean;
var
  sValue: String;
begin
  if (_ReadValue(sSection, sEntry, sValue)) then
    begin
      if (IsStrBoolean(sValue)) then
        begin
          Result := IsStrBooleanTrue(sValue);
        end
      else
        begin
          Result := bDefault;
        end;
    end
  else
    begin
      Result := bDefault;
    end;
end;

function TATConfigSQLite3Storage.ReadCurrency(const sSection: String;
    const sEntry: String; const cDefault: Currency): Currency;
var
  sValue: String;
begin
  if (_ReadValue(sSection, sEntry, sValue)) then
    begin
      if (IsStrCurrency(sValue)) then
        begin
          Result := StrToCurr(sValue);
        end
      else
        begin
          Result := cDefault;
        end;
    end
  else
    begin
      Result := cDefault;
    end;
end;

function TATConfigSQLite3Storage.ReadDate(const sSection: String;
    const sEntry: String; const dtDefault: TDateTime): TDateTime;
var
  sValue: String;
begin
  if (_ReadValue(sSection, sEntry, sValue)) then
    begin
      if (IsStrDate(sValue)) then
        begin
          Result := StrToDate(sValue);
        end
      else
        begin
          Result := dtDefault;
        end;
    end
  else
    begin
      Result := dtDefault;
    end;
end;

function TATConfigSQLite3Storage.ReadDateTime(const sSection: String;
    const sEntry: String; const dtDefault: TDateTime): TDateTime;
var
  sValue: String;
begin
  if (_ReadValue(sSection, sEntry, sValue)) then
    begin
      if (IsStrDateTime(sValue)) then
        begin
          Result := StrToDateTime(sValue);
        end
      else
        begin
          Result := dtDefault;
        end;
    end
  else
    begin
      Result := dtDefault;
    end;
end;

function TATConfigSQLite3Storage.ReadDouble(const sSection: String;
    const sEntry: String; const rDefault: Double): Double;
var
  sValue: String;
begin
  if (_ReadValue(sSection, sEntry, sValue)) then
    begin
      if (IsStrReal(sValue)) then
        begin
          Result := StrToFloat(sValue);
        end
      else
        begin
          Result := rDefault;
        end;
    end
  else
    begin
      Result := rDefault;
    end;
end;

function TATConfigSQLite3Storage.ReadInteger(const sSection: String;
    const sEntry: String; const iDefault: Integer): Integer;
var
  rValue: Double;
  sValue: String;
begin
  if (_ReadValue(sSection, sEntry, sValue)) then
    begin
      if (IsStrInteger(sValue)) then
        begin
          Result := StrToInt(sValue);
        end
      else if (IsStrReal(sValue)) then
        begin
          rValue := StrToFloat(sValue);
          Result := Trunc(rValue);
        end
      else
        begin
          Result := iDefault;
        end;
    end
  else
    begin
      Result := iDefault;
    end;
end;

function TATConfigSQLite3Storage.ReadString(const sSection, sEntry,
    sDefault: String): string;
var
  sValue: String;
begin
  sValue := sDefault;
  if (_ReadValue(sSection, sEntry, sValue)) then
    begin
      Result := sValue;
    end
  else
    begin
      Result := sDefault;
    end;
end;

function TATConfigSQLite3Storage.ReadTime(const sSection: String;
    const sEntry: String; const dtDefault: TDateTime): TDateTime;
var
  sValue: String;
begin
  if (_ReadValue(sSection, sEntry, sValue)) then
    begin
      if (IsStrTime(sValue)) then
        begin
          Result := StrToTime(sValue);
        end
      else
        begin
          Result := dtDefault;
        end;
    end
  else
    begin
      Result := dtDefault;
    end;
end;

procedure TATConfigSQLite3Storage.WriteBoolean(const sSection: String;
    const sEntry: String; const bValue: Boolean);
var
  sValue: String;
begin
  if (bValue) then
    sValue := cValTrue
  else
    sValue := cValFalse;

  _WriteValue(sSection, sEntry, sValue);
end;

procedure TATConfigSQLite3Storage.WriteCurrency(
    const sSection: String; const sEntry: String;
    const cValue: Currency);
var
  sValue: String;
begin
  sValue := CurrToStr(cValue);

  _WriteValue(sSection, sEntry, sValue);
end;

procedure TATConfigSQLite3Storage.WriteDate(const sSection: String;
    const sEntry: String; const dtValue: TDateTime);
var
  sValue: String;
begin
  sValue := DateToStr(dtValue);

  _WriteValue(sSection, sEntry, sValue);
end;

procedure TATConfigSQLite3Storage.WriteDateTime(
    const sSection: String; const sEntry: String;
    const dtValue: TDateTime);
var
  sValue: String;
begin
  sValue := DateTimeToStr(dtValue);

  _WriteValue(sSection, sEntry, sValue);
end;

procedure TATConfigSQLite3Storage.WriteDouble(const sSection: String;
    const sEntry: String; const rValue: Double);
var
  sValue: String;
begin
  sValue := FloatToStr(rValue);

  _WriteValue(sSection, sEntry, sValue);
end;

procedure TATConfigSQLite3Storage.WriteInteger(const sSection: String;
    const sEntry: String; const iValue: Integer);
var
  sValue: String;
begin
  sValue := IntToStr(iValue);

  _WriteValue(sSection, sEntry, sValue);
end;

procedure TATConfigSQLite3Storage.WriteString(const sSection: String;
    const sEntry: String; const sValue: String);
begin
  _WriteValue(sSection, sEntry, sValue);
end;

procedure TATConfigSQLite3Storage.WriteTime(const sSection: String;
    const sEntry: String; const dtValue: TDateTime);
var
  sValue: String;
begin
  sValue := TimeToStr(dtValue);

  _WriteValue(sSection, sEntry, sValue);
end;

procedure TATConfigSQLite3Storage._EnsureTablesExist;
begin
  Connection.StartTransaction;

  Connection.ExecSQL(cSQLCreateTbls);
  _InsertOrUpdateKVPair(cCfgTblDBInfo, cDBIKeySignature, cDBIDataSignature);
  _InsertOrUpdateKVPair(cCfgTblDBInfo, cDBIKeyVersion, cDBIDataVersion);

  Connection.Commit;

  _UpdateDBLog;
end;

function TATConfigSQLite3Storage._CreateConnection: TUniConnection;
begin
  FProvider := TATGC.Collect(TSQLiteUniProvider.Create(NIL), FGC);

  Result := TATGC.Collect(TUniConnection.Create(NIL), FGC);

  Result.ProviderName := 'SQLite';

  Result.Database := FileName;
  Result.DataTypeMap.AddFieldNameRule('CreateDT', ftDateTime);
  Result.DataTypeMap.AddFieldNameRule('LastModDT', ftDateTime);
  Result.LoginPrompt := False;
  Result.Options.AllowImplicitConnect := False;

  with Result.SpecificOptions do
    begin
      Values['Direct'] := 'True';
      Values['EnableSharedCache'] := 'True';
      Values['EncryptionAlgorithm'] := cCfgEncyptAlgorithm;
      Values['EncryptionKey'] := FEncryptionKey;
      Values['ForceCreateDatabase'] := 'False';
      Values['ReadUncommitted'] := 'True';
    end;
end;

procedure TATConfigSQLite3Storage._CreateNewConfig;
var
  AGC: IATGarbageCollector;
begin
  _SetConnSpecificOption('ForceCreateDatabase', 'True');

  Connection.Open;
  TATGC.Cleanup(procedure
    begin
      Connection.Close;
    end, AGC);

  _EnsureTablesExist;

  if (NOT FEncryptionKey.IsEmpty) then
    TLiteUtils.EncryptDatabase(Connection, FEncryptionKey);

  Connection.Close;
end;

procedure TATConfigSQLite3Storage._DeleteEntry(
    const ASection, AKey: String);
var
  AGC: IATGarbageCollector;
  AQry: TUniSQL;
begin
  AQry := TATGC.Collect(TUniSQL.Create(NIL), AGC);
  AQry.Connection := Connection;

  AQry.SQL.Text := cSQLDeleteEntry;
  AQry.ParamByName(cParmSection).AsString := ASection;
  AQry.ParamByName(cParmKey).AsString := AKey;

  AQry.Prepare;
  TATGC.Cleanup(procedure
    begin
      AQry.UnPrepare;
    end, AGC);

  AQry.Execute;
end;

procedure TATConfigSQLite3Storage._DeleteSection(
    const ASection: String);
var
  AGC: IATGarbageCollector;
  AQry: TUniSQL;
begin
  AQry := TATGC.Collect(TUniSQL.Create(NIL), AGC);
  AQry.Connection := Connection;

  AQry.SQL.Text := cSQLDelSection;
  AQry.ParamByName(cParmSection).AsString := ASection;

  AQry.Prepare;
  TATGC.Cleanup(procedure
    begin
      AQry.UnPrepare;
    end, AGC);

  AQry.Execute;
end;

procedure TATConfigSQLite3Storage._InsertOrUpdateAppOption(
    const ASection, AKey, AData: String);
var
  AGC: IATGarbageCollector;
  AQry: TUniSQL;
  ADT: TDateTime;
begin
  AQry := TATGC.Collect(TUniSQL.Create(NIL), AGC);
  AQry.Connection := Connection;

  ADT := Now;

  if (HasEntry(ASection, AKey)) then
    begin
      AQry.SQL.Text := cSQLUpdAO;
      AQry.ParamByName(cParmSection).AsString := ASection;
      AQry.ParamByName(cParmKey).AsString := AKey;
      AQry.ParamByName(cParmData).AsString := AData;
      AQry.ParamByName(cParmLastModDT).AsDateTime := ADT;
    end
  else
    begin
      AQry.SQL.Text := cSQLInsAO;
      AQry.ParamByName(cParmID).AsString := TGUID.NewGuid.ToString;
      AQry.ParamByName(cParmSection).AsString := ASection;
      AQry.ParamByName(cParmKey).AsString := AKey;
      AQry.ParamByName(cParmData).AsString := AData;
      AQry.ParamByName(cParmCreateDT).AsDateTime := ADT;
      AQry.ParamByName(cParmLastModDT).AsDateTime := ADT;
    end;

  AQry.Prepare;
  TATGC.Cleanup(procedure
    begin
      AQry.UnPrepare;
    end, AGC);

  AQry.Execute;
end;

procedure TATConfigSQLite3Storage._InsertOrUpdateKVPair(
    const ATableName, AKey, AData: String);
var
  AGC: IATGarbageCollector;
  AQry: TUniSQL;
begin
  AQry := TATGC.Collect(TUniSQL.Create(NIL), AGC);
  AQry.Connection := Connection;

//Todo: fix parameterized query...
//  AQry.SQL.Text := cSQLInsUpdKV;
//  AQry.ParamByName(cParmKey).AsString := AKey;
//  AQry.ParamByName(cParmData).AsString := AData;
//
//  AQry.MacroByName(cParmTblName).AsString := ATableName;

  AQry.SQL.Clear;
  AQry.SQL.Add(Format('INSERT OR IGNORE INTO %s', [ATableName]));
  AQry.SQL.Add('(Key, Data)');
  AQry.SQL.Add(Format('VALUES( ''%s'', ''%s'');', [AKey, AData]));
  AQry.SQL.Add(Format('UPDATE %s', [ATableName]));
  AQry.SQL.Add(Format('SET Data = ''%s''', [AData]));
  AQry.SQL.Add(Format('WHERE (Key = ''%s'')', [AKey]));


  AQry.Prepare;
  TATGC.Cleanup(procedure
    begin
      AQry.UnPrepare;
    end, AGC);

  AQry.Execute;
end;

procedure TATConfigSQLite3Storage._LoadConfig;
begin
  _SetConnSpecificOption('ForceCreateDatabase', 'False');

  try
    Connection.Open;
  except
    if (NOT FEncryptionKey.IsEmpty)  then
      begin
        _SetConnSpecificOption('EncryptionKey', EmptyStr);
        try
          Connection.Open;
          TLiteUtils.EncryptDatabase(Connection, FEncryptionKey);
          _SetConnSpecificOption('EncryptionKey', FEncryptionKey);
        except
          raise EATCfgSQLite3InvalidKey.Create(
              'Invalid encryption key supplied.');
        end;
      end
    else
      raise EATCfgSQLite3Encrypted.Create(
          'Configuration database is encrypted.');
  end;

  _EnsureTablesExist;
end;

function TATConfigSQLite3Storage._ReadValue(const sSection: String;
    sEntry: String; out AValue: String): Boolean;
var
  AGC: IATGarbageCollector;
  AQry: TUniQuery;
  AFld: TField;
begin
  AQry := TATGC.Collect(TUniQuery.Create(NIL), AGC);
  AQry.Connection := Connection;

  AQry.SQL.Text := cSQLSelAppOpt;
  AQry.ParamByName(cParmSection).AsString := sSection;
  AQry.ParamByName(cParmKey).AsString := sEntry;

  AQry.Prepare;
  TATGC.Cleanup(procedure
    begin
      AQry.Close;
      AQry.UnPrepare;
    end, AGC);

  AQry.Open;

  if (AQry.RecordCount <= 0) then
    Exit(False);

  AFld := AQry.FieldByName(cFldData);

  if (NOT Assigned(AFld))then
    Exit(False);

  if (AFld.IsNull) then
    Exit(False);

  AValue := AFld.AsString;
  Result := True;
end;

procedure TATConfigSQLite3Storage._SetConnSpecificOption(const AKey,
  AValue: String);
begin
  if (AKey.IsEmpty) then
    Exit;

  Connection.SpecificOptions.Values[AKey] := AValue;
end;

procedure TATConfigSQLite3Storage._UpdateDBLog;
var
  AGC: IATGarbageCollector;
  ADT   : TDateTime;
  SDT   : String;
  AArch: TATAppArchitecture;
  sArch: string;
  AFwk: TATAppFramework;
  sFwk: string;
  sHostName: String;
  sOSUser: String;
begin
  if (NOT Connection.InTransaction) then
    begin
      Connection.StartTransaction;
      TATGC.Cleanup(procedure
        begin
          Connection.Commit;
        end, AGC);
    end;

  ADT := Now;
  SDT := DateTimeToStr(ADT);
  _InsertOrUpdateKVPair(cCfgTblDBLog, cKVLastMod, SDT);

  AArch := AT.XPlatform.GetAppArchitecture;
  case AArch of
    archUnknown: sArch := '';
    archMacOS32: sArch := 'OSX32';
    archMacOS64: sArch := 'OSX64';
    archAndroid: sArch := 'Android';
    archIOS: sArch := 'iOS';
    archWin32: sArch := 'Win32';
    archWin64: sArch := 'Win64';
  end;
  _InsertOrUpdateKVPair(cCfgTblDBLog, cKVPlatform, sArch);

  AFwk := AT.XPlatform.GetFrameworkType;
  case AFwk of
    fwkNone: sFwk := 'None';
    fwkVCL: sFwk := 'VCL';
    fwkFMX: sFwk := 'FireMonkey';
  end;
  _InsertOrUpdateKVPair(cCfgTblDBLog, cKVFramework, sFwk);

  sHostName := AT.XPlatform.GetComputerName;
  _InsertOrUpdateKVPair(cCfgTblDBLog, cKVHostName, sHostName);

  sOSUser := AT.XPlatform.GetOSUserName;
  _InsertOrUpdateKVPair(cCfgTblDBLog, cKVOSUser, sOSUser);

end;

procedure TATConfigSQLite3Storage._WriteValue(const sSection: String;
    const sEntry: String; const sValue: String);
var
  AGC: IATGarbageCollector;
begin
  if (NOT Updating) then
    begin
      BeginUpdate;

      TATGC.Cleanup(procedure
        begin
          EndUpdate;
        end, AGC);
    end;

  _InsertOrUpdateAppOption(sSection, sEntry, sValue);
end;

initialization

RegisterClass(TATConfigSQLite3Storage);

end.
