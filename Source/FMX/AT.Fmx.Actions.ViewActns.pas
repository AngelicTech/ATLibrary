unit AT.Fmx.Actions.ViewActns;

interface

uses
  System.Classes, System.UITypes, Fmx.StdActns, AT.Fmx.Actions.Consts;

type
  [ComponentPlatformsAttribute(pidATActionsPlatforms)]
  TATVewAction = class(TViewAction)
  strict private
    FAndroidImageIndex: TImageIndex;
    FAndroidText: String;
    FiOSImageIndex: TImageIndex;
    FiOSText: String;
    FLinuxImageIndex: TImageIndex;
    FLinuxShortCut: System.Classes.TShortCut;
    FLinuxText: String;
    FOSXImageIndex: TImageIndex;
    FOSXShortCut: System.Classes.TShortCut;
    FOSXText: String;
    FWindowsImageIndex: TImageIndex;
    FWindowsShortCut: System.Classes.TShortCut;
    FWindowsText: String;
    function _AndroidImgIdxIsStored: Boolean;
    function _AndroidTextIsStored: Boolean;
    function _iOSImgIdxIsStored: Boolean;
    function _iOSTextIsStored: Boolean;
    function _LinuxImgIdxIsStored: Boolean;
    function _LinuxShortCutIsStored: Boolean;
    function _LinuxTextIsStored: Boolean;
    function _OSXImgIdxIsStored: Boolean;
    function _OSXShortCutIsStored: Boolean;
    function _OSXTextIsStored: Boolean;
    function _WinImgIdxIsStored: Boolean;
    function _WinShortCutIsStored: Boolean;
    function _WinTextIsStored: Boolean;
  strict protected
    procedure SetAndroidImageIndex(const Value: TImageIndex);
    procedure SetAndroidText(const Value: String);
    procedure SetiOSImageIndex(const Value: TImageIndex);
    procedure SetiOSText(const Value: String);
    procedure SetLinuxImageIndex(const Value: TImageIndex);
    procedure SetLinuxShortCut(Value: System.Classes.TShortCut);
    procedure SetLinuxText(const Value: String);
    procedure SetOSXImageIndex(const Value: TImageIndex);
    procedure SetOSXShortCut(Value: System.Classes.TShortCut);
    procedure SetOSXText(const Value: String);
    procedure SetWindowsImageIndex(const Value: TImageIndex);
    procedure SetWindowsShortCut(Value: System.Classes.TShortCut);
    procedure SetWindowsText(const Value: String);
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property AndroidImageIndex: TImageIndex
        read FAndroidImageIndex write SetAndroidImageIndex
        stored _AndroidImgIdxIsStored default -1;
    property AndroidText: String
        read FAndroidText write SetAndroidText
        stored _AndroidTextIsStored;
    property iOSImageIndex: TImageIndex
        read FiOSImageIndex write SetiOSImageIndex
        stored _iOSImgIdxIsStored default -1;
    property iOSText: String
        read FiOSText write SetiOSText stored _iOSTextIsStored;
    property LinuxImageIndex: TImageIndex
        read FLinuxImageIndex write SetLinuxImageIndex
        stored _LinuxImgIdxIsStored default -1;
    property LinuxShortCut: System.Classes.TShortCut
        read FLinuxShortCut write SetLinuxShortCut
        stored _LinuxShortCutIsStored default 0;
    property LinuxText: String
        read FLinuxText write SetLinuxText stored _LinuxTextIsStored;
    property OSXImageIndex: TImageIndex
        read FOSXImageIndex write SetOSXImageIndex
        stored _OSXImgIdxIsStored default -1;
    property OSXShortCut: System.Classes.TShortCut
        read FOSXShortCut write SetOSXShortCut
        stored _OSXShortCutIsStored default 0;
    property OSXText: String
        read FOSXText write SetOSXText stored _OSXTextIsStored;
    property WindowsImageIndex: TImageIndex
        read FWindowsImageIndex write SetWindowsImageIndex
        stored _WinImgIdxIsStored default -1;
    property WindowsShortCut: System.Classes.TShortCut
        read FWindowsShortCut write SetWindowsShortCut
        stored _WinShortCutIsStored default 0;
    property WindowsText: String
        read FWindowsText write SetWindowsText
        stored _WinTextIsStored;
  end;

implementation

uses
  System.SysUtils, System.Actions, FMX.ActnList;


constructor TATVewAction.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FAndroidImageIndex := -1;
  FAndroidText := EmptyStr;

  FiOSImageIndex := -1;
  FiOSText := EmptyStr;

  FLinuxImageIndex := -1;
  FLinuxShortCut := 0;
  FLinuxText := EmptyStr;

  FOSXImageIndex := -1;
  FOSXShortCut := 0;
  FOSXText := EmptyStr;

  FWindowsImageIndex := -1;
  FWindowsShortCut := 0;
  FWindowsText := EmptyStr;
end;

procedure TATVewAction.Loaded;
begin
  inherited Loaded;

  if (NOT (csDesigning IN ComponentState)) then
    begin
      {$IF Defined(ANDROID)}

        if (_AndroidImgIdxIsStored) then
          ImageIndex := FAndroidImageIndex;
        if (_AndroidTextIsStored) then
          Text := AndroidText;

      {$ELSEIF Defined(IOS)}

        if (_iOSImgIdxIsStored) then
          ImageIndex := FiOSImageIndex;
        if (_iOSTextIsStored) then
          Text := iOSText;

      {$ELSEIF Defined(LINUX)}

        if (_LinuxImgIdxIsStored) then
          ImageIndex := FLinuxImageIndex;
        if (_LinuxShortCutIsStored) then
          ShortCut := FLinuxShortCut;
        if (_LinuxTextIsStored) then
          Text := LinuxText;

      {$ELSEIF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}

        if (_OSXImgIdxIsStored) then
          ImageIndex := FOSXImageIndex;
        if (_OSXShortCutIsStored) then
          ShortCut := FOSXShortCut;
        if (_OSXTextIsStored) then
          Text := OSXText;

      {$ELSEIF Defined(MSWINDOWS)}

        if (_WinImgIdxIsStored) then
          ImageIndex := FWindowsImageIndex;
        if (_WinShortCutIsStored) then
          ShortCut := FWindowsShortCut;
        if (_WinTextIsStored) then
          Text := WindowsText;

      {$ENDIF}
    end;
end;

procedure TATVewAction.SetAndroidImageIndex(const Value: TImageIndex);
begin
  if (Value <> FAndroidImageIndex) then
    begin
      FAndroidImageIndex := Value;

      {$IF Defined(ANDROID)}
      if (NOT (csDesigning IN ComponentState)) then
        ImageIndex := FAndroidImageIndex;
      {$ENDIF}

      Change;
    end;
end;

procedure TATVewAction.SetAndroidText(const Value: String);
begin
  if (Value <> FAndroidText) then
    begin
      FAndroidText := Value;

      {$IF Defined(ANDROID)}
      if (NOT (csDesigning IN ComponentState)) then
        Text := FAndroidText;
      {$ENDIF}

      Change;
    end;
end;

procedure TATVewAction.SetiOSImageIndex(const Value: TImageIndex);
begin
  FiOSImageIndex := Value;
  if (Value <> FiOSImageIndex) then
    begin
      FiOSImageIndex := Value;

      {$IF Defined(IOS)}
      if (NOT (csDesigning IN ComponentState)) then
        ImageIndex := FiOSImageIndex;
      {$ENDIF}

      Change;
    end;
end;

procedure TATVewAction.SetiOSText(const Value: String);
begin
  if (Value <> FiOSText) then
    begin
      FiOSText := Value;

      {$IF Defined(IOS)}
      if (NOT (csDesigning IN ComponentState)) then
        Text := FiOSText;
      {$ENDIF}

      Change;
    end;
end;

procedure TATVewAction.SetLinuxImageIndex(const Value: TImageIndex);
begin
  if (Value <> FLinuxImageIndex) then
    begin
      FLinuxImageIndex := Value;

      {$IF Defined(LINUX)}
      if (NOT (csDesigning IN ComponentState)) then
        ImageIndex := FLinuxImageIndex;
      {$ENDIF}

      Change;
    end;
end;

procedure TATVewAction.SetLinuxShortCut(Value: System.Classes.TShortCut);
begin
  if (Value <> FLinuxShortCut) then
    begin
      FLinuxShortCut := Value;

      {$IF Defined(LINUX)}
      if (NOT (csDesigning IN ComponentState)) then
        ShortCut := FLinuxShortCut;
      {$ENDIF}

      Change;
    end;
end;

procedure TATVewAction.SetLinuxText(const Value: String);
begin
  if (Value <> FLinuxText) then
    begin
      FLinuxText := Value;

      {$IF Defined(LINUX)}
      if (NOT (csDesigning IN ComponentState)) then
        Text := FLinuxText;
      {$ENDIF}

      Change;
    end;
end;

procedure TATVewAction.SetOSXImageIndex(const Value: TImageIndex);
begin
  if (Value <> FOSXImageIndex) then
    begin
      FOSXImageIndex := Value;

      {$IF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}
      if (NOT (csDesigning IN ComponentState)) then
        ImageIndex := FOSXImageIndex;
      {$ENDIF}

      Change;
    end;
end;

procedure TATVewAction.SetOSXShortCut(Value: System.Classes.TShortCut);
begin
  if (Value <> FOSXShortCut) then
    begin
      FOSXShortCut := Value;

      {$IF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}
      if (NOT (csDesigning IN ComponentState)) then
        ShortCut := FOSXShortCut;
      {$ENDIF}

      Change;
    end;
end;

procedure TATVewAction.SetOSXText(const Value: String);
begin
  if (Value <> FOSXText) then
    begin
      FOSXText := Value;

      {$IF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}
      if (NOT (csDesigning IN ComponentState)) then
        Text := FOSXText;
      {$ENDIF}

      Change;
    end;
end;

procedure TATVewAction.SetWindowsImageIndex(const Value: TImageIndex);
begin
  if (Value <> FWindowsImageIndex) then
    begin
      FWindowsImageIndex := Value;

      {$IF Defined(MSWINDOWS)}
      if (NOT (csDesigning IN ComponentState)) then
        ImageIndex := FWindowsImageIndex;
      {$ENDIF}

      Change;
    end;
end;

procedure TATVewAction.SetWindowsShortCut(Value:
    System.Classes.TShortCut);
begin
  if (Value <> FWindowsShortCut) then
    begin
      FWindowsShortCut := Value;

      {$IF Defined(MSWINDOWS)}
      if (NOT (csDesigning IN ComponentState)) then
        ShortCut := FWindowsShortCut;
      {$ENDIF}

      Change;
    end;
end;

procedure TATVewAction.SetWindowsText(const Value: String);
begin
  if (Value <> FWindowsText) then
    begin
      FWindowsText := Value;

      {$IF Defined(MSWINDOWS)}
      if (NOT (csDesigning IN ComponentState)) then
        Text := FWindowsText;
      {$ENDIF}

      Change;
    end;
end;

function TATVewAction._AndroidImgIdxIsStored: Boolean;
begin
  Result := (FAndroidImageIndex <> -1);
end;

function TATVewAction._AndroidTextIsStored: Boolean;
begin
  Result := (NOT FAndroidText.IsEmpty);
end;

function TATVewAction._iOSImgIdxIsStored: Boolean;
begin
  Result := (FiOSImageIndex <> -1);
end;

function TATVewAction._iOSTextIsStored: Boolean;
begin
  Result := (NOT FiOSText.IsEmpty);
end;

function TATVewAction._LinuxImgIdxIsStored: Boolean;
begin
  Result := (FLinuxImageIndex <> -1);
end;

function TATVewAction._LinuxShortCutIsStored: Boolean;
begin
  Result := (FLinuxShortCut <> 0);
end;

function TATVewAction._LinuxTextIsStored: Boolean;
begin
  Result := (NOT FLinuxText.IsEmpty);
end;

function TATVewAction._OSXImgIdxIsStored: Boolean;
begin
  Result := (FOSXImageIndex <> -1);
end;

function TATVewAction._OSXShortCutIsStored: Boolean;
begin
  Result := (FOSXShortCut <> 0);
end;

function TATVewAction._OSXTextIsStored: Boolean;
begin
  Result := (NOT FOSXText.IsEmpty);
end;

function TATVewAction._WinImgIdxIsStored: Boolean;
begin
  Result := (FWindowsImageIndex <> -1);
end;

function TATVewAction._WinShortCutIsStored: Boolean;
begin
  Result := (FWindowsShortCut <> 0);
end;

function TATVewAction._WinTextIsStored: Boolean;
begin
  Result := (NOT FWindowsText.IsEmpty);
end;

end.
