unit AT.Fmx.Actions.PhoneDialer;

interface

uses
  System.Classes, System.UITypes, FMX.PhoneDialer.Actions,
  AT.Fmx.Actions.Consts;

type
  [ComponentPlatformsAttribute(pidATActionsPlatforms)]
  TATPhoneCallAction = class(TPhoneCallAction)
  strict private
    FAndroidImageIndex: TImageIndex;
    FAndroidText: String;
    FiOSImageIndex: TImageIndex;
    FiOSText: String;
    FLinuxHint: String;
    FLinuxImageIndex: TImageIndex;
    FLinuxShortCut: System.Classes.TShortCut;
    FLinuxText: String;
    FOSXHint: String;
    FOSXImageIndex: TImageIndex;
    FOSXShortCut: System.Classes.TShortCut;
    FOSXText: String;
    FWindowsHint: String;
    FWindowsImageIndex: TImageIndex;
    FWindowsShortCut: System.Classes.TShortCut;
    FWindowsText: String;
    function _AndroidImgIdxIsStored: Boolean;
    function _AndroidTextIsStored: Boolean;
    function _iOSImgIdxIsStored: Boolean;
    function _iOSTextIsStored: Boolean;
    function _LinuxHintIsStored: Boolean;
    function _LinuxImgIdxIsStored: Boolean;
    function _LinuxShortCutIsStored: Boolean;
    function _LinuxTextIsStored: Boolean;
    function _OSXHintIsStored: Boolean;
    function _OSXImgIdxIsStored: Boolean;
    function _OSXShortCutIsStored: Boolean;
    function _OSXTextIsStored: Boolean;
    function _WinHintIsStored: Boolean;
    function _WinImgIdxIsStored: Boolean;
    function _WinShortCutIsStored: Boolean;
    function _WinTextIsStored: Boolean;
  strict protected
    procedure SetAndroidImageIndex(const Value: TImageIndex);
    procedure SetAndroidText(const Value: String);
    procedure SetiOSImageIndex(const Value: TImageIndex);
    procedure SetiOSText(const Value: String);
    procedure SetLinuxHint(const Value: String);
    procedure SetLinuxImageIndex(const Value: TImageIndex);
    procedure SetLinuxShortCut(Value: System.Classes.TShortCut);
    procedure SetLinuxText(const Value: String);
    procedure SetOSXHint(const Value: String);
    procedure SetOSXImageIndex(const Value: TImageIndex);
    procedure SetOSXShortCut(Value: System.Classes.TShortCut);
    procedure SetOSXText(const Value: String);
    procedure SetWindowsHint(const Value: String);
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
    property LinuxHint: String
        read FLinuxHint write SetLinuxHint stored _LinuxHintIsStored;
    property LinuxImageIndex: TImageIndex
        read FLinuxImageIndex write SetLinuxImageIndex
        stored _LinuxImgIdxIsStored default -1;
    property LinuxShortCut: System.Classes.TShortCut
        read FLinuxShortCut write SetLinuxShortCut
        stored _LinuxShortCutIsStored default 0;
    property LinuxText: String
        read FLinuxText write SetLinuxText stored _LinuxTextIsStored;
    property OSXHint: String
        read FOSXHint write SetOSXHint stored _OSXHintIsStored;
    property OSXImageIndex: TImageIndex
        read FOSXImageIndex write SetOSXImageIndex
        stored _OSXImgIdxIsStored default -1;
    property OSXShortCut: System.Classes.TShortCut
        read FOSXShortCut write SetOSXShortCut
        stored _OSXShortCutIsStored default 0;
    property OSXText: String
        read FOSXText write SetOSXText stored _OSXTextIsStored;
    property WindowsHint: String
        read FWindowsHint write SetWindowsHint
        stored _WinHintIsStored;
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
  System.SysUtils, System.Actions;


constructor TATPhoneCallAction.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FAndroidImageIndex := -1;
  FAndroidText := EmptyStr;

  FiOSImageIndex := -1;
  FiOSText := EmptyStr;

  FLinuxHint := EmptyStr;
  FLinuxImageIndex := -1;
  FLinuxShortCut := 0;
  FLinuxText := EmptyStr;

  FOSXHint := EmptyStr;
  FOSXImageIndex := -1;
  FOSXShortCut := 0;
  FOSXText := EmptyStr;

  FWindowsHint := EmptyStr;
  FWindowsImageIndex := -1;
  FWindowsShortCut := 0;
  FWindowsText := EmptyStr;
end;

procedure TATPhoneCallAction.Loaded;
begin
  inherited Loaded;

  if (NOT (csDesigning IN ComponentState)) then
    begin
      {$IF Defined(ANDROID)}

        if (_AndroidImgIdxIsStored) then
          ImageIndex := FAndroidImageIndex;
        if (_AndroidTextIsStored) then
          CustomText := AndroidText;

      {$ELSEIF Defined(IOS)}

        if (_iOSImgIdxIsStored) then
          ImageIndex := FiOSImageIndex;
        if (_iOSTextIsStored) then
          CustomText := iOSText;

      {$ELSEIF Defined(LINUX)}

        if (_LinuxHintIsStored) then
          Hint := FLinuxHint;
        if (_LinuxImgIdxIsStored) then
          ImageIndex := FLinuxImageIndex;
        if (_LinuxShortCutIsStored) then
          ShortCut := FLinuxShortCut;
        if (_LinuxTextIsStored) then
          CustomText := LinuxText;

      {$ELSEIF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}

        if (_OSXHintIsStored) then
          Hint := FOSXHint;
        if (_OSXImgIdxIsStored) then
          ImageIndex := FOSXImageIndex;
        if (_OSXShortCutIsStored) then
          ShortCut := FOSXShortCut;
        if (_OSXTextIsStored) then
          CustomText := OSXText;

      {$ELSEIF Defined(MSWINDOWS)}

        if (_WinHintIsStored) then
          Hint := FWindowsHint;
        if (_WinImgIdxIsStored) then
          ImageIndex := FWindowsImageIndex;
        if (_WinShortCutIsStored) then
          ShortCut := FWindowsShortCut;
        if (_WinTextIsStored) then
          CustomText := WindowsText;

      {$ENDIF}
    end;
end;

procedure TATPhoneCallAction.SetAndroidImageIndex(const Value: TImageIndex);
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

procedure TATPhoneCallAction.SetAndroidText(const Value: String);
begin
  if (Value <> FAndroidText) then
    begin
      FAndroidText := Value;

      {$IF Defined(ANDROID)}
      if (NOT (csDesigning IN ComponentState)) then
        CustomText := FAndroidText;
      {$ENDIF}

      Change;
    end;
end;

procedure TATPhoneCallAction.SetiOSImageIndex(const Value: TImageIndex);
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

procedure TATPhoneCallAction.SetiOSText(const Value: String);
begin
  if (Value <> FiOSText) then
    begin
      FiOSText := Value;

      {$IF Defined(IOS)}
      if (NOT (csDesigning IN ComponentState)) then
        CustomText := FiOSText;
      {$ENDIF}

      Change;
    end;
end;

procedure TATPhoneCallAction.SetLinuxHint(const Value: String);
begin
  if (Value <> FLinuxHint) then
    begin
      FLinuxHint := Value;

      {$IF Defined(LINUX)}
      if (NOT (csDesigning IN ComponentState)) then
        Hint := FLinuxHint;
      {$ENDIF}

      Change;
    end;
end;

procedure TATPhoneCallAction.SetLinuxImageIndex(const Value: TImageIndex);
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

procedure TATPhoneCallAction.SetLinuxShortCut(Value: System.Classes.TShortCut);
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

procedure TATPhoneCallAction.SetLinuxText(const Value: String);
begin
  if (Value <> FLinuxText) then
    begin
      FLinuxText := Value;

      {$IF Defined(LINUX)}
      if (NOT (csDesigning IN ComponentState)) then
        CustomText := FLinuxText;
      {$ENDIF}

      Change;
    end;
end;

procedure TATPhoneCallAction.SetOSXHint(const Value: String);
begin
  if (Value <> FOSXHint) then
    begin
      FOSXHint := Value;

      {$IF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}
      if (NOT (csDesigning IN ComponentState)) then
        Hint := FOSXHint;
      {$ENDIF}

      Change;
    end;
end;

procedure TATPhoneCallAction.SetOSXImageIndex(const Value: TImageIndex);
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

procedure TATPhoneCallAction.SetOSXShortCut(Value: System.Classes.TShortCut);
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

procedure TATPhoneCallAction.SetOSXText(const Value: String);
begin
  if (Value <> FOSXText) then
    begin
      FOSXText := Value;

      {$IF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}
      if (NOT (csDesigning IN ComponentState)) then
        CustomText := FOSXText;
      {$ENDIF}

      Change;
    end;
end;

procedure TATPhoneCallAction.SetWindowsHint(const Value: String);
begin
  if (Value <> FWindowsHint) then
    begin
      FWindowsHint := Value;

      {$IF Defined(MSWINDOWS)}
      if (NOT (csDesigning IN ComponentState)) then
        Hint := FWindowsHint;
      {$ENDIF}

      Change;
    end;
end;

procedure TATPhoneCallAction.SetWindowsImageIndex(const Value: TImageIndex);
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

procedure TATPhoneCallAction.SetWindowsShortCut(Value:
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

procedure TATPhoneCallAction.SetWindowsText(const Value: String);
begin
  if (Value <> FWindowsText) then
    begin
      FWindowsText := Value;

      {$IF Defined(MSWINDOWS)}
      if (NOT (csDesigning IN ComponentState)) then
        CustomText := FWindowsText;
      {$ENDIF}

      Change;
    end;
end;

function TATPhoneCallAction._AndroidImgIdxIsStored: Boolean;
begin
  Result := (FAndroidImageIndex <> -1);
end;

function TATPhoneCallAction._AndroidTextIsStored: Boolean;
begin
  Result := (NOT FAndroidText.IsEmpty);
end;

function TATPhoneCallAction._iOSImgIdxIsStored: Boolean;
begin
  Result := (FiOSImageIndex <> -1);
end;

function TATPhoneCallAction._iOSTextIsStored: Boolean;
begin
  Result := (NOT FiOSText.IsEmpty);
end;

function TATPhoneCallAction._LinuxHintIsStored: Boolean;
begin
  Result := (NOT FLinuxHint.IsEmpty);
end;

function TATPhoneCallAction._LinuxImgIdxIsStored: Boolean;
begin
  Result := (FLinuxImageIndex <> -1);
end;

function TATPhoneCallAction._LinuxShortCutIsStored: Boolean;
begin
  Result := (FLinuxShortCut <> 0);
end;

function TATPhoneCallAction._LinuxTextIsStored: Boolean;
begin
  Result := (NOT FLinuxText.IsEmpty);
end;

function TATPhoneCallAction._OSXHintIsStored: Boolean;
begin
  Result := (NOT FOSXHint.IsEmpty);
end;

function TATPhoneCallAction._OSXImgIdxIsStored: Boolean;
begin
  Result := (FOSXImageIndex <> -1);
end;

function TATPhoneCallAction._OSXShortCutIsStored: Boolean;
begin
  Result := (FOSXShortCut <> 0);
end;

function TATPhoneCallAction._OSXTextIsStored: Boolean;
begin
  Result := (NOT FOSXText.IsEmpty);
end;

function TATPhoneCallAction._WinHintIsStored: Boolean;
begin
  Result := (NOT FWindowsHint.IsEmpty);
end;

function TATPhoneCallAction._WinImgIdxIsStored: Boolean;
begin
  Result := (FWindowsImageIndex <> -1);
end;

function TATPhoneCallAction._WinShortCutIsStored: Boolean;
begin
  Result := (FWindowsShortCut <> 0);
end;

function TATPhoneCallAction._WinTextIsStored: Boolean;
begin
  Result := (NOT FWindowsText.IsEmpty);
end;

end.