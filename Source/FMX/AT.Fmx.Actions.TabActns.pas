unit AT.Fmx.Actions.TabActns;

interface

uses
  System.Classes, System.UITypes, FMX.TabControl, AT.Fmx.Actions.Consts;

type
  [ComponentPlatformsAttribute(pidATActionsPlatforms)]
  TATChangeTabAction = class(TChangeTabAction)
  strict private
    FAndroidText: String;
    FiOSText: String;
    FLinuxHint: String;
    FLinuxShortCut: System.Classes.TShortCut;
    FLinuxText: String;
    FOSXHint: String;
    FOSXShortCut: System.Classes.TShortCut;
    FOSXText: String;
    FWindowsHint: String;
    FWindowsShortCut: System.Classes.TShortCut;
    FWindowsText: String;
    function _AndroidTextIsStored: Boolean;
    function _iOSTextIsStored: Boolean;
    function _LinuxHintIsStored: Boolean;
    function _LinuxShortCutIsStored: Boolean;
    function _LinuxTextIsStored: Boolean;
    function _OSXHintIsStored: Boolean;
    function _OSXShortCutIsStored: Boolean;
    function _OSXTextIsStored: Boolean;
    function _WinHintIsStored: Boolean;
    function _WinShortCutIsStored: Boolean;
    function _WinTextIsStored: Boolean;
  strict protected
    procedure SetAndroidText(const Value: String);
    procedure SetiOSText(const Value: String);
    procedure SetLinuxHint(const Value: String);
    procedure SetLinuxShortCut(Value: System.Classes.TShortCut);
    procedure SetLinuxText(const Value: String);
    procedure SetOSXHint(const Value: String);
    procedure SetOSXShortCut(Value: System.Classes.TShortCut);
    procedure SetOSXText(const Value: String);
    procedure SetWindowsHint(const Value: String);
    procedure SetWindowsShortCut(Value: System.Classes.TShortCut);
    procedure SetWindowsText(const Value: String);
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property AndroidText: String read FAndroidText write SetAndroidText stored
        _AndroidTextIsStored;
    property iOSText: String read FiOSText write SetiOSText stored
        _iOSTextIsStored;
    property LinuxHint: String read FLinuxHint write SetLinuxHint stored
        _LinuxHintIsStored;
    property LinuxShortCut: System.Classes.TShortCut read FLinuxShortCut write
        SetLinuxShortCut stored _LinuxShortCutIsStored default 0;
    property LinuxText: String read FLinuxText write SetLinuxText stored
        _LinuxTextIsStored;
    property OSXHint: String read FOSXHint write SetOSXHint stored
        _OSXHintIsStored;
    property OSXShortCut: System.Classes.TShortCut read FOSXShortCut write
        SetOSXShortCut stored _OSXShortCutIsStored default 0;
    property OSXText: String read FOSXText write SetOSXText stored
        _OSXTextIsStored;
    property WindowsHint: String read FWindowsHint write SetWindowsHint stored
        _WinHintIsStored;
    property WindowsShortCut: System.Classes.TShortCut read FWindowsShortCut
        write SetWindowsShortCut stored _WinShortCutIsStored default 0;
    property WindowsText: String read FWindowsText write SetWindowsText stored
        _WinTextIsStored;
  end;

  [ComponentPlatformsAttribute(pidATActionsPlatforms)]
  TATNextTabAction = class(TNextTabAction)
  strict private
    FAndroidText: String;
    FiOSText: String;
    FLinuxHint: String;
    FLinuxShortCut: System.Classes.TShortCut;
    FLinuxText: String;
    FOSXHint: String;
    FOSXShortCut: System.Classes.TShortCut;
    FOSXText: String;
    FWindowsHint: String;
    FWindowsShortCut: System.Classes.TShortCut;
    FWindowsText: String;
    function _AndroidTextIsStored: Boolean;
    function _iOSTextIsStored: Boolean;
    function _LinuxHintIsStored: Boolean;
    function _LinuxShortCutIsStored: Boolean;
    function _LinuxTextIsStored: Boolean;
    function _OSXHintIsStored: Boolean;
    function _OSXShortCutIsStored: Boolean;
    function _OSXTextIsStored: Boolean;
    function _WinHintIsStored: Boolean;
    function _WinShortCutIsStored: Boolean;
    function _WinTextIsStored: Boolean;
  strict protected
    procedure SetAndroidText(const Value: String);
    procedure SetiOSText(const Value: String);
    procedure SetLinuxHint(const Value: String);
    procedure SetLinuxShortCut(Value: System.Classes.TShortCut);
    procedure SetLinuxText(const Value: String);
    procedure SetOSXHint(const Value: String);
    procedure SetOSXShortCut(Value: System.Classes.TShortCut);
    procedure SetOSXText(const Value: String);
    procedure SetWindowsHint(const Value: String);
    procedure SetWindowsShortCut(Value: System.Classes.TShortCut);
    procedure SetWindowsText(const Value: String);
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property AndroidText: String read FAndroidText write SetAndroidText stored
        _AndroidTextIsStored;
    property iOSText: String read FiOSText write SetiOSText stored
        _iOSTextIsStored;
    property LinuxHint: String read FLinuxHint write SetLinuxHint stored
        _LinuxHintIsStored;
    property LinuxShortCut: System.Classes.TShortCut read FLinuxShortCut write
        SetLinuxShortCut stored _LinuxShortCutIsStored default 0;
    property LinuxText: String read FLinuxText write SetLinuxText stored
        _LinuxTextIsStored;
    property OSXHint: String read FOSXHint write SetOSXHint stored
        _OSXHintIsStored;
    property OSXShortCut: System.Classes.TShortCut read FOSXShortCut write
        SetOSXShortCut stored _OSXShortCutIsStored default 0;
    property OSXText: String read FOSXText write SetOSXText stored
        _OSXTextIsStored;
    property WindowsHint: String read FWindowsHint write SetWindowsHint stored
        _WinHintIsStored;
    property WindowsShortCut: System.Classes.TShortCut read FWindowsShortCut
        write SetWindowsShortCut stored _WinShortCutIsStored default 0;
    property WindowsText: String read FWindowsText write SetWindowsText stored
        _WinTextIsStored;
  end;

  [ComponentPlatformsAttribute(pidATActionsPlatforms)]
  TATPreviousTabAction = class(TPreviousTabAction)
  strict private
    FAndroidText: String;
    FiOSText: String;
    FLinuxHint: String;
    FLinuxShortCut: System.Classes.TShortCut;
    FLinuxText: String;
    FOSXHint: String;
    FOSXShortCut: System.Classes.TShortCut;
    FOSXText: String;
    FWindowsHint: String;
    FWindowsShortCut: System.Classes.TShortCut;
    FWindowsText: String;
    function _AndroidTextIsStored: Boolean;
    function _iOSTextIsStored: Boolean;
    function _LinuxHintIsStored: Boolean;
    function _LinuxShortCutIsStored: Boolean;
    function _LinuxTextIsStored: Boolean;
    function _OSXHintIsStored: Boolean;
    function _OSXShortCutIsStored: Boolean;
    function _OSXTextIsStored: Boolean;
    function _WinHintIsStored: Boolean;
    function _WinShortCutIsStored: Boolean;
    function _WinTextIsStored: Boolean;
  strict protected
    procedure SetAndroidText(const Value: String);
    procedure SetiOSText(const Value: String);
    procedure SetLinuxHint(const Value: String);
    procedure SetLinuxShortCut(Value: System.Classes.TShortCut);
    procedure SetLinuxText(const Value: String);
    procedure SetOSXHint(const Value: String);
    procedure SetOSXShortCut(Value: System.Classes.TShortCut);
    procedure SetOSXText(const Value: String);
    procedure SetWindowsHint(const Value: String);
    procedure SetWindowsShortCut(Value: System.Classes.TShortCut);
    procedure SetWindowsText(const Value: String);
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property AndroidText: String read FAndroidText write SetAndroidText stored
        _AndroidTextIsStored;
    property iOSText: String read FiOSText write SetiOSText stored
        _iOSTextIsStored;
    property LinuxHint: String read FLinuxHint write SetLinuxHint stored
        _LinuxHintIsStored;
    property LinuxShortCut: System.Classes.TShortCut read FLinuxShortCut write
        SetLinuxShortCut stored _LinuxShortCutIsStored default 0;
    property LinuxText: String read FLinuxText write SetLinuxText stored
        _LinuxTextIsStored;
    property OSXHint: String read FOSXHint write SetOSXHint stored
        _OSXHintIsStored;
    property OSXShortCut: System.Classes.TShortCut read FOSXShortCut write
        SetOSXShortCut stored _OSXShortCutIsStored default 0;
    property OSXText: String read FOSXText write SetOSXText stored
        _OSXTextIsStored;
    property WindowsHint: String read FWindowsHint write SetWindowsHint stored
        _WinHintIsStored;
    property WindowsShortCut: System.Classes.TShortCut read FWindowsShortCut
        write SetWindowsShortCut stored _WinShortCutIsStored default 0;
    property WindowsText: String read FWindowsText write SetWindowsText stored
        _WinTextIsStored;
  end;

implementation

uses
  System.SysUtils, System.Actions;


{ TATChangeTabAction }
{$region 'TATChangeTabAction'}
constructor TATChangeTabAction.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FAndroidText := EmptyStr;

  FiOSText := EmptyStr;

  FLinuxHint := EmptyStr;
  FLinuxShortCut := 0;
  FLinuxText := EmptyStr;

  FOSXHint := EmptyStr;
  FOSXShortCut := 0;
  FOSXText := EmptyStr;

  FWindowsHint := EmptyStr;
  FWindowsShortCut := 0;
  FWindowsText := EmptyStr;
end;

procedure TATChangeTabAction.Loaded;
begin
  inherited Loaded;

  if (NOT (csDesigning IN ComponentState)) then
    begin
      {$IF Defined(ANDROID)}

        if (_AndroidTextIsStored) then
          CustomText := AndroidText;

      {$ELSEIF Defined(IOS)}

        if (_iOSTextIsStored) then
          CustomText := iOSText;

      {$ELSEIF Defined(LINUX)}

        if (_LinuxHintIsStored) then
          Hint := FLinuxHint;
        if (_LinuxShortCutIsStored) then
          ShortCut := FLinuxShortCut;
        if (_LinuxTextIsStored) then
          CustomText := LinuxText;

      {$ELSEIF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}

        if (_OSXHintIsStored) then
          Hint := FOSXHint;
        if (_OSXShortCutIsStored) then
          ShortCut := FOSXShortCut;
        if (_OSXTextIsStored) then
          CustomText := OSXText;

      {$ELSEIF Defined(MSWINDOWS)}

        if (_WinHintIsStored) then
          Hint := FWindowsHint;
        if (_WinShortCutIsStored) then
          ShortCut := FWindowsShortCut;
        if (_WinTextIsStored) then
          CustomText := WindowsText;

      {$ENDIF}
    end;
end;

procedure TATChangeTabAction.SetAndroidText(const Value: String);
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

procedure TATChangeTabAction.SetiOSText(const Value: String);
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

procedure TATChangeTabAction.SetLinuxHint(const Value: String);
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

procedure TATChangeTabAction.SetLinuxShortCut(Value: System.Classes.TShortCut);
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

procedure TATChangeTabAction.SetLinuxText(const Value: String);
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

procedure TATChangeTabAction.SetOSXHint(const Value: String);
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

procedure TATChangeTabAction.SetOSXShortCut(Value: System.Classes.TShortCut);
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

procedure TATChangeTabAction.SetOSXText(const Value: String);
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

procedure TATChangeTabAction.SetWindowsHint(const Value: String);
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

procedure TATChangeTabAction.SetWindowsShortCut(Value:
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

procedure TATChangeTabAction.SetWindowsText(const Value: String);
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

function TATChangeTabAction._AndroidTextIsStored: Boolean;
begin
  Result := (NOT FAndroidText.IsEmpty);
end;

function TATChangeTabAction._iOSTextIsStored: Boolean;
begin
  Result := (NOT FiOSText.IsEmpty);
end;

function TATChangeTabAction._LinuxHintIsStored: Boolean;
begin
  Result := (NOT FLinuxHint.IsEmpty);
end;

function TATChangeTabAction._LinuxShortCutIsStored: Boolean;
begin
  Result := (FLinuxShortCut <> 0);
end;

function TATChangeTabAction._LinuxTextIsStored: Boolean;
begin
  Result := (NOT FLinuxText.IsEmpty);
end;

function TATChangeTabAction._OSXHintIsStored: Boolean;
begin
  Result := (NOT FOSXHint.IsEmpty);
end;

function TATChangeTabAction._OSXShortCutIsStored: Boolean;
begin
  Result := (FOSXShortCut <> 0);
end;

function TATChangeTabAction._OSXTextIsStored: Boolean;
begin
  Result := (NOT FOSXText.IsEmpty);
end;

function TATChangeTabAction._WinHintIsStored: Boolean;
begin
  Result := (NOT FWindowsHint.IsEmpty);
end;

function TATChangeTabAction._WinShortCutIsStored: Boolean;
begin
  Result := (FWindowsShortCut <> 0);
end;

function TATChangeTabAction._WinTextIsStored: Boolean;
begin
  Result := (NOT FWindowsText.IsEmpty);
end;
{$endregion}

{ TATNextTabAction }
{$region 'TATNextTabAction'}
constructor TATNextTabAction.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FAndroidText := EmptyStr;

  FiOSText := EmptyStr;

  FLinuxHint := EmptyStr;
  FLinuxShortCut := 0;
  FLinuxText := EmptyStr;

  FOSXHint := EmptyStr;
  FOSXShortCut := 0;
  FOSXText := EmptyStr;

  FWindowsHint := EmptyStr;
  FWindowsShortCut := 0;
  FWindowsText := EmptyStr;
end;

procedure TATNextTabAction.Loaded;
begin
  inherited Loaded;

  if (NOT (csDesigning IN ComponentState)) then
    begin
      {$IF Defined(ANDROID)}

        if (_AndroidTextIsStored) then
          CustomText := AndroidText;

      {$ELSEIF Defined(IOS)}

        if (_iOSTextIsStored) then
          CustomText := iOSText;

      {$ELSEIF Defined(LINUX)}

        if (_LinuxHintIsStored) then
          Hint := FLinuxHint;
        if (_LinuxShortCutIsStored) then
          ShortCut := FLinuxShortCut;
        if (_LinuxTextIsStored) then
          CustomText := LinuxText;

      {$ELSEIF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}

        if (_OSXHintIsStored) then
          Hint := FOSXHint;
        if (_OSXShortCutIsStored) then
          ShortCut := FOSXShortCut;
        if (_OSXTextIsStored) then
          CustomText := OSXText;

      {$ELSEIF Defined(MSWINDOWS)}

        if (_WinHintIsStored) then
          Hint := FWindowsHint;
        if (_WinShortCutIsStored) then
          ShortCut := FWindowsShortCut;
        if (_WinTextIsStored) then
          CustomText := WindowsText;

      {$ENDIF}
    end;
end;

procedure TATNextTabAction.SetAndroidText(const Value: String);
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

procedure TATNextTabAction.SetiOSText(const Value: String);
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

procedure TATNextTabAction.SetLinuxHint(const Value: String);
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

procedure TATNextTabAction.SetLinuxShortCut(Value: System.Classes.TShortCut);
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

procedure TATNextTabAction.SetLinuxText(const Value: String);
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

procedure TATNextTabAction.SetOSXHint(const Value: String);
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

procedure TATNextTabAction.SetOSXShortCut(Value: System.Classes.TShortCut);
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

procedure TATNextTabAction.SetOSXText(const Value: String);
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

procedure TATNextTabAction.SetWindowsHint(const Value: String);
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

procedure TATNextTabAction.SetWindowsShortCut(Value:
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

procedure TATNextTabAction.SetWindowsText(const Value: String);
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

function TATNextTabAction._AndroidTextIsStored: Boolean;
begin
  Result := (NOT FAndroidText.IsEmpty);
end;

function TATNextTabAction._iOSTextIsStored: Boolean;
begin
  Result := (NOT FiOSText.IsEmpty);
end;

function TATNextTabAction._LinuxHintIsStored: Boolean;
begin
  Result := (NOT FLinuxHint.IsEmpty);
end;

function TATNextTabAction._LinuxShortCutIsStored: Boolean;
begin
  Result := (FLinuxShortCut <> 0);
end;

function TATNextTabAction._LinuxTextIsStored: Boolean;
begin
  Result := (NOT FLinuxText.IsEmpty);
end;

function TATNextTabAction._OSXHintIsStored: Boolean;
begin
  Result := (NOT FOSXHint.IsEmpty);
end;

function TATNextTabAction._OSXShortCutIsStored: Boolean;
begin
  Result := (FOSXShortCut <> 0);
end;

function TATNextTabAction._OSXTextIsStored: Boolean;
begin
  Result := (NOT FOSXText.IsEmpty);
end;

function TATNextTabAction._WinHintIsStored: Boolean;
begin
  Result := (NOT FWindowsHint.IsEmpty);
end;

function TATNextTabAction._WinShortCutIsStored: Boolean;
begin
  Result := (FWindowsShortCut <> 0);
end;

function TATNextTabAction._WinTextIsStored: Boolean;
begin
  Result := (NOT FWindowsText.IsEmpty);
end;
{$endregion}

{ TATPreviousTabAction }
{$region 'TATPreviousTabAction'}
constructor TATPreviousTabAction.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FAndroidText := EmptyStr;

  FiOSText := EmptyStr;

  FLinuxHint := EmptyStr;
  FLinuxShortCut := 0;
  FLinuxText := EmptyStr;

  FOSXHint := EmptyStr;
  FOSXShortCut := 0;
  FOSXText := EmptyStr;

  FWindowsHint := EmptyStr;
  FWindowsShortCut := 0;
  FWindowsText := EmptyStr;
end;

procedure TATPreviousTabAction.Loaded;
begin
  inherited Loaded;

  if (NOT (csDesigning IN ComponentState)) then
    begin
      {$IF Defined(ANDROID)}

        if (_AndroidTextIsStored) then
          CustomText := AndroidText;

      {$ELSEIF Defined(IOS)}

        if (_iOSTextIsStored) then
          CustomText := iOSText;

      {$ELSEIF Defined(LINUX)}

        if (_LinuxHintIsStored) then
          Hint := FLinuxHint;
        if (_LinuxShortCutIsStored) then
          ShortCut := FLinuxShortCut;
        if (_LinuxTextIsStored) then
          CustomText := LinuxText;

      {$ELSEIF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}

        if (_OSXHintIsStored) then
          Hint := FOSXHint;
        if (_OSXShortCutIsStored) then
          ShortCut := FOSXShortCut;
        if (_OSXTextIsStored) then
          CustomText := OSXText;

      {$ELSEIF Defined(MSWINDOWS)}

        if (_WinHintIsStored) then
          Hint := FWindowsHint;
        if (_WinShortCutIsStored) then
          ShortCut := FWindowsShortCut;
        if (_WinTextIsStored) then
          CustomText := WindowsText;

      {$ENDIF}
    end;
end;

procedure TATPreviousTabAction.SetAndroidText(const Value: String);
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

procedure TATPreviousTabAction.SetiOSText(const Value: String);
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

procedure TATPreviousTabAction.SetLinuxHint(const Value: String);
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

procedure TATPreviousTabAction.SetLinuxShortCut(Value: System.Classes.TShortCut);
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

procedure TATPreviousTabAction.SetLinuxText(const Value: String);
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

procedure TATPreviousTabAction.SetOSXHint(const Value: String);
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

procedure TATPreviousTabAction.SetOSXShortCut(Value: System.Classes.TShortCut);
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

procedure TATPreviousTabAction.SetOSXText(const Value: String);
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

procedure TATPreviousTabAction.SetWindowsHint(const Value: String);
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

procedure TATPreviousTabAction.SetWindowsShortCut(Value:
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

procedure TATPreviousTabAction.SetWindowsText(const Value: String);
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

function TATPreviousTabAction._AndroidTextIsStored: Boolean;
begin
  Result := (NOT FAndroidText.IsEmpty);
end;

function TATPreviousTabAction._iOSTextIsStored: Boolean;
begin
  Result := (NOT FiOSText.IsEmpty);
end;

function TATPreviousTabAction._LinuxHintIsStored: Boolean;
begin
  Result := (NOT FLinuxHint.IsEmpty);
end;

function TATPreviousTabAction._LinuxShortCutIsStored: Boolean;
begin
  Result := (FLinuxShortCut <> 0);
end;

function TATPreviousTabAction._LinuxTextIsStored: Boolean;
begin
  Result := (NOT FLinuxText.IsEmpty);
end;

function TATPreviousTabAction._OSXHintIsStored: Boolean;
begin
  Result := (NOT FOSXHint.IsEmpty);
end;

function TATPreviousTabAction._OSXShortCutIsStored: Boolean;
begin
  Result := (FOSXShortCut <> 0);
end;

function TATPreviousTabAction._OSXTextIsStored: Boolean;
begin
  Result := (NOT FOSXText.IsEmpty);
end;

function TATPreviousTabAction._WinHintIsStored: Boolean;
begin
  Result := (NOT FWindowsHint.IsEmpty);
end;

function TATPreviousTabAction._WinShortCutIsStored: Boolean;
begin
  Result := (FWindowsShortCut <> 0);
end;

function TATPreviousTabAction._WinTextIsStored: Boolean;
begin
  Result := (NOT FWindowsText.IsEmpty);
end;
{$endregion}

end.
