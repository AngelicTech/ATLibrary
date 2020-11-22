//************************************************************************
//
// Program Name   : @Library
// Program Version: 1.00
// Platforms      : Win32, Win64
// Framework      : VCL, FireMonkey
// Filename       : AT.Config.Storage.XML.pas
// File Version   : 1.10
// Date Created   : 01-AUG-2014
// Author         : Matthew S. Vesperman
//
// Description:
//
// XML config storage class.
//
// Revision History:
//
// v1.00   :   Initial version
// v1.10   :   Added DeleteSection method
//
//************************************************************************
//
// COPYRIGHT © 2014 Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
//************************************************************************

unit AT.Config.Storage.XML;

interface

uses
  System.Classes, AT.Config.Storage.Custom, System.SysUtils, OXmlPDOM,
  AT.Config.Storage.Intf;

type
  TATConfigXMLStorage = class(TATCustomConfigStorage,
      ICfgStgDelete, ICfgStgQuery, ICfgStgRead, ICfgStgWrite)
  strict private
    FFileName: TFileName;
    FXMLDoc: IXMLDocument;
    FXMLRoot: PXMLNode;
  strict protected
    function CreateNewConfig(const sFileName: TFileName): Boolean; virtual;
    function GetEntry(const sSection, sEntry: String; var AEntry: PXMLNode; const
        AutoCreate: Boolean = True): Boolean; virtual;
    function GetSection(const sSection: String; var ASection: PXMLNode; const
        AutoCreate: Boolean = True): Boolean; virtual;
    function HasEntry(const sSection: String; const sEntry: String): Boolean;
        virtual;
    function HasSection(const sSection: String): Boolean; virtual;
    function LoadConfig(const sFileName: TFileName): Boolean; virtual;
    function ReadValue(const sSection: String; sEntry: String; var AValue:
        String): Boolean; virtual;
    procedure ReloadConfig; virtual;
    function SaveConfig: Boolean; virtual;
    procedure WriteValue(const sSection: String; const sEntry: String; const
        sValue: String); virtual;
  public
    constructor Create; overload; override;
    constructor Create(const sFileName: TFileName); overload; virtual;
    destructor Destroy; override;
    procedure DeleteEntry(const sSection: String; const sEntry: String);
        override;
    procedure DeleteSection(const sSection: String); override;
    function ReadBoolean(const sSection: String; const sEntry: String; const
        bDefault: Boolean): Boolean; override;
    function ReadCurrency(const sSection: String; const sEntry: String; const
        cDefault: Currency): Currency; override;
    function ReadDate(const sSection: String; const sEntry: String; const
        dtDefault: TDateTime): TDateTime; override;
    function ReadDateTime(const sSection: String; const sEntry: String; const
        dtDefault: TDateTime): TDateTime; override;
    function ReadDouble(const sSection: String; const sEntry: String; const
        rDefault: Double): Double; override;
    function ReadInteger(const sSection: String; const sEntry: String; const
        iDefault: Integer): Integer; override;
    function ReadString(const sSection, sEntry, sDefault: String): string; override;
    function ReadTime(const sSection: String; const sEntry: String; const
        dtDefault: TDateTime): TDateTime; override;
    procedure WriteBoolean(const sSection: String; const sEntry: String; const
        bValue: Boolean); override;
    procedure WriteCurrency(const sSection: String; const sEntry: String; const
        cValue: Currency); override;
    procedure WriteDate(const sSection: String; const sEntry: String; const
        dtValue: TDateTime); override;
    procedure WriteDateTime(const sSection: String; const sEntry: String; const
        dtValue: TDateTime); override;
    procedure WriteDouble(const sSection: String; const sEntry: String; const
        rValue: Double); override;
    procedure WriteInteger(const sSection: String; const sEntry: String; const
        iValue: Integer); override;
    procedure WriteString(const sSection: String; const sEntry: String; const
        sValue: String); override;
    procedure WriteTime(const sSection: String; const sEntry: String; const
        dtValue: TDateTime); override;
  published
    property FileName: TFileName read FFileName write FFileName;
  end;

implementation

uses
  OXmlUtils, AT.Validate, AT.XPlatform;

const
  cCfgCRLF = #13#10;
  cCfgRootNode = 'configuration';
  cCfgLastMod = 'last-modified';
  cCfgPlatform = 'platform';
  cCfgFramework = 'framework';
  cCfgHostName = 'hostname';
  cCfgOSUser = 'os-user';
  cCFGSectNode = 'section';
  cCfgEntrNode = 'entry';
  cCfgAttrKey = 'key';
  cCfgAttrValue = 'value';
  cCfgTrueValue = 'True';
  cCfgFalseValue = 'False';

resourcestring
  resCfgHdrComnt1 =
    '**********************************************************************************';
  resCfgHdrComnt2 =
    ' UNLESS INSTRUCTED TO DO SO, DO NOT MAKE ANY MANUAL CHANGES TO THIS FILE.         ';
  resCfgHdrComnt3 =
    ' DOING SO CAN MAKE YOUR SOFTWARE RUN INCORRECTLY, OR COULD EVEN MAKE IT UNUSABLE. ';
  resCfgHdrComnt4 =
    ' IF YOU MAKE MANUAL CHANGES YOU DO SO AT YOUR OWN RISK!                           ';
  resCfgHdrComnt5 =
    '**********************************************************************************';

{
***************************** TATConfigXMLStorage ******************************
}
constructor TATConfigXMLStorage.Create;
begin
  inherited Create;
end;

constructor TATConfigXMLStorage.Create(const sFileName: TFileName);
begin
  Self.Create;
  Self.FileName := sFileName;

  FXMLDoc := CreateXMLDoc(cCfgRootNode, True);

  FXMLDoc.WhiteSpaceHandling := wsTrim;
  FXMLDoc.WriterSettings.IndentType := itIndent;
  FXMLDoc.WriterSettings.LineBreak := lbCRLF;

  if (FileExists(Self.FileName)) then
    begin
      LoadConfig(Self.FileName);
    end
  else
    begin
      CreateNewConfig(Self.FileName);
    end;

end;

destructor TATConfigXMLStorage.Destroy;
begin
  SaveConfig;

  inherited Destroy;
end;

function TATConfigXMLStorage.CreateNewConfig(const sFileName: TFileName):
    Boolean;
var
  ANode: PXMLNode;
begin

  Result := False;

  if (Assigned(FXMLDoc)) then

    begin

      Self.FFileName := sFileName;

      FXMLRoot := FXMLDoc.DocumentElement;

      ANode := FXMLDoc.CreateComment(resCfgHdrComnt1);
      FXMLRoot.AppendChild(ANode);
      ANode := FXMLDoc.CreateComment(resCfgHdrComnt2);
      FXMLRoot.AppendChild(ANode);
      ANode := FXMLDoc.CreateComment(resCfgHdrComnt3);
      FXMLRoot.AppendChild(ANode);
      ANode := FXMLDoc.CreateComment(resCfgHdrComnt4);
      FXMLRoot.AppendChild(ANode);
      ANode := FXMLDoc.CreateComment(resCfgHdrComnt5);
      FXMLRoot.AppendChild(ANode);

      Self.SaveConfig;

    end;
end;

procedure TATConfigXMLStorage.DeleteEntry(const sSection: String; const sEntry:
    String);
var
  BOk   : Boolean;
  AEntry: PXMLNode;
begin

  BOk := GetEntry(sSection, sEntry, AEntry);

  if (BOk) then
    begin
      AEntry.DeleteSelf;

      Self.SaveConfig;
      Self.ReloadConfig;
    end;
end;

procedure TATConfigXMLStorage.DeleteSection(const sSection: String);
var
  BOk   : Boolean;
  ASection: PXMLNode;
begin

  BOk := GetSection(sSection, ASection);

  if (BOk) then
    begin
      ASection.DeleteSelf;

      Self.SaveConfig;
      Self.ReloadConfig;
    end;
end;

function TATConfigXMLStorage.GetEntry(const sSection, sEntry: String; var
    AEntry: PXMLNode; const AutoCreate: Boolean = True): Boolean;
var
  ASection: PXMLNode;
  ANode   : PXMLNode;
  AAttr   : PXMLNode;
begin

  AEntry := NIL;

  if (GetSection(sSection, ASection)) then
    begin

      ANode := NIL;

      while (ASection.GetNextChild(ANode)) do
        begin

          if ((ANode.NodeType = ntElement) AND (ANode.NodeName = cCfgEntrNode))
          then
            begin

              AAttr := NIL;

              while (ANode.GetNextAttribute(AAttr)) do
                begin
                  if ((AAttr.NodeName = cCfgAttrKey) AND
                      (AAttr.NodeValue = sEntry)) then
                    begin
                      AEntry := ANode;
                      Break;
                    end;
                end;
            end;
          if (Assigned(AEntry)) then
            Break;

        end;

      if (AutoCreate AND (NOT Assigned(AEntry)) ) then
        begin
          AEntry := ASection.AddChild(cCfgEntrNode);
          AEntry.AddAttribute(cCfgAttrKey, sEntry);
        end;
    end;
  Result := (Assigned(AEntry));
end;

function TATConfigXMLStorage.GetSection(const sSection: String; var ASection:
    PXMLNode; const AutoCreate: Boolean = True): Boolean;
var
  ANode: PXMLNode;
  AAttr: PXMLNode;
begin

  ASection := NIL;

  if (Assigned(FXMLRoot)) then
    begin

      ANode := NIL;

      while (FXMLRoot.GetNextChild(ANode)) do
        begin

          if ((ANode.NodeType = ntElement) AND (ANode.NodeName = cCFGSectNode))
          then
            begin

              AAttr := NIL;

              while (ANode.GetNextAttribute(AAttr)) do
                begin

                  if ((AAttr.NodeName = cCfgAttrKey) AND
                      (AAttr.NodeValue = sSection)) then
                    begin
                      ASection := ANode;
                      Break;
                    end;
                end;
            end;

          if (Assigned(ASection)) then
            Break;

        end;

      if ( AutoCreate AND (NOT Assigned(ASection)) ) then
        begin
          ASection := FXMLRoot.AddChild(cCFGSectNode);
          ASection.AddAttribute(cCfgAttrKey, sSection);
        end;
    end;

  Result := (Assigned(ASection));
end;

function TATConfigXMLStorage.HasEntry(const sSection: String; const sEntry:
    String): Boolean;
var
  AEntry: PXMLNode;
begin

  Result := Self.GetEntry(sSection, sEntry, AEntry);

end;

function TATConfigXMLStorage.HasSection(const sSection: String): Boolean;
var
  ASection: PXMLNode;
begin
  Result := Self.GetSection(sSection, ASection, False);
end;

function TATConfigXMLStorage.LoadConfig(const sFileName: TFileName): Boolean;
begin
  Result := False;

  if (Assigned(FXMLDoc)) then
    begin

      FFileName := sFileName;

      FXMLDoc.Clear(True);

      FXMLDoc.LoadFromFile(Self.FileName);

      FXMLRoot := FXMLDoc.DocumentElement;

      Result := True;
    end;

end;

function TATConfigXMLStorage.ReadBoolean(const sSection: String; const sEntry:
    String; const bDefault: Boolean): Boolean;
var
  sValue: String;
begin

  if (ReadValue(sSection, sEntry, sValue)) then
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

function TATConfigXMLStorage.ReadCurrency(const sSection: String; const sEntry:
    String; const cDefault: Currency): Currency;
var
  sValue: String;
begin

  if (ReadValue(sSection, sEntry, sValue)) then
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

function TATConfigXMLStorage.ReadDate(const sSection: String; const sEntry:
    String; const dtDefault: TDateTime): TDateTime;
var
  sValue: String;
begin

  if (ReadValue(sSection, sEntry, sValue)) then
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

function TATConfigXMLStorage.ReadDateTime(const sSection: String; const sEntry:
    String; const dtDefault: TDateTime): TDateTime;
var
  sValue: String;
begin

  if (ReadValue(sSection, sEntry, sValue)) then
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

function TATConfigXMLStorage.ReadDouble(const sSection: String; const sEntry:
    String; const rDefault: Double): Double;
var
  sValue: String;
begin

  if (ReadValue(sSection, sEntry, sValue)) then
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

function TATConfigXMLStorage.ReadInteger(const sSection: String; const sEntry:
    String; const iDefault: Integer): Integer;
var
  rValue: Double;
  sValue: String;
begin

  if (ReadValue(sSection, sEntry, sValue)) then
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

function TATConfigXMLStorage.ReadString(const sSection, sEntry, sDefault:
    String): string;
var
  sValue: String;
begin

  sValue := sDefault;

  if (ReadValue(sSection, sEntry, sValue)) then
    begin

      Result := sValue;

    end
  else
    begin

      Result := sDefault;

    end;

end;

function TATConfigXMLStorage.ReadTime(const sSection: String; const sEntry:
    String; const dtDefault: TDateTime): TDateTime;
var
  sValue: String;
begin

  if (ReadValue(sSection, sEntry, sValue)) then
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

function TATConfigXMLStorage.ReadValue(const sSection: String; sEntry: String;
    var AValue: String): Boolean;
var
  AEntry: PXMLNode;
begin
  ReloadConfig;

  Result := GetEntry(sSection, sEntry, AEntry);

  if (Result) then
    begin
      Result := AEntry.HasAttribute(cCfgAttrValue);

      if (Result) then
        AValue := AEntry.Attributes[cCfgAttrValue];
    end;
end;

procedure TATConfigXMLStorage.ReloadConfig;
begin
  Self.LoadConfig(Self.FileName);
end;

function TATConfigXMLStorage.SaveConfig: Boolean;
var
  ADT   : TDateTime;
  SDT   : String;
  AArch: TATAppArchitecture;
  sArch: string;
  AFwk: TATAppFramework;
  sFwk: string;
  sHostName: String;
  sOSUser: String;
begin
  Result := False;

  if (Assigned(FXMLDoc)) then
    begin
      ADT := Now;
      SDT := DateTimeToStr(ADT);

      FXMLRoot.Attributes[cCfgLastMod] := SDT;

      {$IF Defined(ISAPI_APP)}
      sArch := 'ISAPI Module';
      {$ELSE}
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
      {$ENDIF}

      AFwk := AT.XPlatform.GetFrameworkType;
      case AFwk of
        fwkNone : sFwk := 'None';
        fwkVCL : sFwk := 'VCL';
        fwkFMX : sFwk := 'FireMonkey';
        fwkIW14: sFwk := 'IntraWeb';
      end;

      sHostName := AT.XPlatform.GetComputerName;
      sOSUser := AT.XPlatform.GetOSUserName;

      FXMLRoot.Attributes[cCfgPlatform] := sArch;
      FXMLRoot.Attributes[cCfgFramework] := sFwk;
      FXMLRoot.Attributes[cCfgHostName] := sHostName;
      FXMLRoot.Attributes[cCfgOSUser] := sOSUser;

      FXMLDoc.SaveToFile(Self.FileName);

      Result := True;
    end;
end;

procedure TATConfigXMLStorage.WriteBoolean(const sSection: String; const
    sEntry: String; const bValue: Boolean);
var
  sValue: String;
begin

  if (bValue) then
    sValue := cCfgTrueValue
  else
    sValue := cCfgFalseValue;

  WriteValue(sSection, sEntry, sValue);

end;

procedure TATConfigXMLStorage.WriteCurrency(const sSection: String; const
    sEntry: String; const cValue: Currency);
var
  sValue: String;
begin

  sValue := CurrToStr(cValue);

  WriteValue(sSection, sEntry, sValue);

end;

procedure TATConfigXMLStorage.WriteDate(const sSection: String; const sEntry:
    String; const dtValue: TDateTime);
var
  sValue: String;
begin

  sValue := DateToStr(dtValue);

  WriteValue(sSection, sEntry, sValue);

end;

procedure TATConfigXMLStorage.WriteDateTime(const sSection: String; const
    sEntry: String; const dtValue: TDateTime);
var
  sValue: String;
begin

  sValue := DateTimeToStr(dtValue);

  WriteValue(sSection, sEntry, sValue);

end;

procedure TATConfigXMLStorage.WriteDouble(const sSection: String; const sEntry:
    String; const rValue: Double);
var
  sValue: String;
begin

  sValue := FloatToStr(rValue);

  WriteValue(sSection, sEntry, sValue);

end;

procedure TATConfigXMLStorage.WriteInteger(const sSection: String; const
    sEntry: String; const iValue: Integer);
var
  sValue: String;
begin

  sValue := IntToStr(iValue);

  WriteValue(sSection, sEntry, sValue);

end;

procedure TATConfigXMLStorage.WriteString(const sSection: String; const sEntry:
    String; const sValue: String);
begin

  WriteValue(sSection, sEntry, sValue);

end;

procedure TATConfigXMLStorage.WriteTime(const sSection: String; const sEntry:
    String; const dtValue: TDateTime);
var
  sValue: String;
begin

  sValue := TimeToStr(dtValue);

  WriteValue(sSection, sEntry, sValue);

end;

procedure TATConfigXMLStorage.WriteValue(const sSection: String; const sEntry:
    String; const sValue: String);
var
  BOk   : Boolean;
  AEntry: PXMLNode;
begin

  BOk := GetEntry(sSection, sEntry, AEntry);

  if (BOk) then
    begin

      AEntry.Attributes[cCfgAttrValue] := sValue;

      Self.SaveConfig;
      Self.ReloadConfig;
    end;

end;

initialization

RegisterClass(TATConfigXMLStorage);

end.
