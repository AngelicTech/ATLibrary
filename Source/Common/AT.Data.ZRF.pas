//****************************************************************************
//
// Program Name   : AT Library
// Program Version: 1.00
// Filename       : AT.Data.ZRF.pas
// File Version   : 2.00
// Date Created   : 22-JUL-2014
// Author         : Matthew S. Vesperman
//
// Description:
//
// Zipped-Resource-File class.
//
// Revision History:
//
// v1.00   :   (22-JUL-2014)
//             Initial version
//
// v2.00   :   (30-OCT-2014)
//             * Changed to TComponent based class.
//             + Added file type & version validation. (Manual in apps)
//
//****************************************************************************
//
// COPYRIGHT © 2014 Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
//****************************************************************************

unit AT.Data.ZRF;

interface

uses
  System.SysUtils, System.Classes, System.Zip;

type
  TATZRF = class(TComponent)
  strict private
    FActive: Boolean;
    FFilename: string;
    FMsgProc: TProc<String>;
    FZRFFile: TZipFile;
  private
    procedure _DoStartMessage(AValue: String);
    function _GetActive: Boolean;
    function _GetResourcesLoaded: Boolean;
    function _GetResourceString(AResourceName: String; AStripSpecialChars:
        Boolean = True): string;
    function _StripSpecialChars(AValue: String): string;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CloseResourceFile;
    function GetHTMLResourceString(AResourceName: String; AStripSpecialChars:
        Boolean = True): string;
    function GetTextResourceString(AResourceName: String; AStripSpecialChars:
        Boolean = True): string;
    function GetXMLResourceString(AResourceName: String; AStripSpecialChars:
        Boolean = True): string;
    function IsValidZRF(AApp, AVersion: string): Boolean;
    function LoadResourceFile(AFilename: String): Boolean;
    function LoadResourceIntoStream(AResourceName: string; var AStream:
        TStream): Boolean;
    procedure RegisterStartMessageHandler(AMsgProc: TProc<String>);
    function ResourceExists(AResourceName: String): Boolean;
  published
    property Active: Boolean read _GetActive;
    property ResourcesLoaded: Boolean read _GetResourcesLoaded;
  end;

var
  ATZRF: TATZRF;

implementation

uses AT.GarbageCollector;

{
************************************ TATZRF ************************************
}
constructor TATZRF.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
    FActive := False;
    FFilename := '';
    FZRFFile := TZipFile.Create;
end;

destructor TATZRF.Destroy;
begin
  FreeAndNil(FZRFFile);
  inherited Destroy;
end;

procedure TATZRF.CloseResourceFile;
begin
  if (Assigned(FZRFFile)) then
    begin
      FZRFFile.Close;
      FActive := False;
    end;
end;

function TATZRF.GetHTMLResourceString(AResourceName: String;
    AStripSpecialChars: Boolean = True): string;
begin
  Result := _GetResourceString(AResourceName, AStripSpecialChars);
end;

function TATZRF.GetTextResourceString(AResourceName: String;
    AStripSpecialChars: Boolean = True): string;
begin
  Result := _GetResourceString(AResourceName, AStripSpecialChars);
end;

function TATZRF.GetXMLResourceString(AResourceName: String; AStripSpecialChars:
    Boolean = True): string;
begin
  Result := _GetResourceString(AResourceName, AStripSpecialChars);
end;

function TATZRF.IsValidZRF(AApp, AVersion: string): Boolean;
var
  AComment: string;
  ARecord: TStringList;
  AGC: IATGarbageCollector;
  AFileType: string;
  AAppCode: string;
  AVer: string;
begin
  Result := ( (Assigned(FZRFFile)) AND
              (FZRFFile.Comment <> '') );

  if (Result) then
    begin
      AComment := FZRFFile.Comment;
      AComment := Trim(AComment);
      AComment := StringReplace(AComment, #13, '', [rfReplaceAll]);
      AComment := StringReplace(AComment, #10, '', [rfReplaceAll]);

      if (AComment = '') then
        Exit(False);

      ARecord := TATGC.Collect(TStringList.Create, AGC);
      ARecord.Delimiter := '|';
      ARecord.StrictDelimiter := True;
      ARecord.DelimitedText := AComment;

      if (ARecord.IndexOfName('type') < 0) then
        Exit(False);
      if (ARecord.IndexOfName('app') < 0) then
        Exit(False);
      if (ARecord.IndexOfName('ver') < 0) then
        Exit(False);

      AFileType := ARecord.Values['type'];
      AAppCode := ARecord.Values['app'];
      AVer := ARecord.Values['ver'];

      Result := ( (AFileType.ToLower = 'zrf') AND
                  (AAppCode.ToLower = AApp.ToLower) AND
                  (AVer.ToLower = AVersion.ToLower)
                );
    end;
end;

function TATZRF.LoadResourceFile(AFilename: String): Boolean;
begin
  if (NOT Assigned(FZRFFile)) then
    Exit(False);

  if (AFilename = '') then
    Exit(False);

  if (NOT FileExists(AFilename)) then
    Exit(False);

  if (AFilename = FFilename) then
    Exit(False);

  if (NOT FZRFFile.IsValid(AFilename)) then
    Exit(False);

  _DoStartMessage('Loading application resources.');

  CloseResourceFile;

  FZRFFile.Open(AFilename, zmRead);

  FActive := (FZRFFile.Mode <> zmClosed);
  if (FActive) then
    FFilename := FFilename
  else
    FFilename := '';

  Result := FActive;
end;

function TATZRF.LoadResourceIntoStream(AResourceName: string; var AStream:
    TStream): Boolean;
var
  ALocalHeader: TZipHeader;
begin
  if (NOT Assigned(AStream)) then
    Exit(False);

  if (NOT Active) then
    Exit(False);

  if (NOT ResourceExists(AResourceName)) then
    Exit(False);

  FZRFFile.Read(AResourceName, AStream, ALocalHeader);

  Result := True;
end;

procedure TATZRF.RegisterStartMessageHandler(AMsgProc: TProc<String>);
begin
  FMsgProc := AMsgProc;
end;

function TATZRF.ResourceExists(AResourceName: String): Boolean;
begin
  if (NOT Active) then
    Exit(False);

  if (NOT ResourcesLoaded) then
    Exit(False);

  Result := (FZRFFile.IndexOf(AResourceName) > -1);
end;

procedure TATZRF._DoStartMessage(AValue: String);
begin
  if (Assigned(FMsgProc)) then
    FMsgProc(AValue);
end;

function TATZRF._GetActive: Boolean;
begin
  Result := FActive;
end;

function TATZRF._GetResourcesLoaded: Boolean;
begin
  Result := (Assigned(FZRFFile) AND Active);
end;

function TATZRF._GetResourceString(AResourceName: String; AStripSpecialChars:
    Boolean = True): string;
var
  AGC: IATGarbageCollector;
  AStrm: TStream;
  ALocalHeader: TZipHeader;
begin
  if (NOT ResourcesLoaded) then
    Exit('');

  if (NOT ResourceExists(AResourceName)) then
    Exit ('');

  AStrm := TATGC.Collect(TStringStream.Create(''), AGC);

  FZRFFile.Read(AResourceName, AStrm, ALocalHeader);

  if (AStrm.Size <= 0) then
    Exit('');

  AStrm.Seek(0, 0);

  Result := (AStrm AS TStringStream).DataString;

  if (AStripSpecialChars) then
    Result := _StripSpecialChars(Result);
end;

function TATZRF._StripSpecialChars(AValue: String): string;
var
  ACh: Char;
begin
  Result := '';

  for ACh in AValue do
    begin
      if ((ACh <> #9) AND (ACh <> #10) AND (ACh <> #13)) then
        Result := Result + ACh;
    end;

end;

initialization
  ATZRF := TATZRF.Create(NIL);
finalization
  ATZRF.Free;
end.
