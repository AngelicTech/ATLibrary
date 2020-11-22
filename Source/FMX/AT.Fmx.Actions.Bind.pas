unit AT.Fmx.Actions.Bind;

interface

uses
  System.Classes, System.UITypes, AT.Fmx.Actions.Consts,
  FMX.Bind.Navigator;

type
  [ComponentPlatformsAttribute(pidATActionsPlatforms)]
  TATFMXBindNavigateApplyUpdates = class(TFMXBindNavigateApplyUpdates)
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

  [ComponentPlatformsAttribute(pidATActionsPlatforms)]
  TATFMXBindNavigateCancel = class(TFMXBindNavigateCancel)
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

  [ComponentPlatformsAttribute(pidATActionsPlatforms)]
  TATFMXBindNavigateCancelUpdates = class(TFMXBindNavigateCancelUpdates)
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

  [ComponentPlatformsAttribute(pidATActionsPlatforms)]
  TATFMXBindNavigateDelete = class(TFMXBindNavigateDelete)
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

  [ComponentPlatformsAttribute(pidATActionsPlatforms)]
  TATFMXBindNavigateEdit = class(TFMXBindNavigateEdit)
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

  [ComponentPlatformsAttribute(pidATActionsPlatforms)]
  TATFMXBindNavigateFirst = class(TFMXBindNavigateFirst)
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

  [ComponentPlatformsAttribute(pidATActionsPlatforms)]
  TATFMXBindNavigateInsert = class(TFMXBindNavigateInsert)
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

  [ComponentPlatformsAttribute(pidATActionsPlatforms)]
  TATFMXBindNavigateLast = class(TFMXBindNavigateLast)
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

  [ComponentPlatformsAttribute(pidATActionsPlatforms)]
  TATFMXBindNavigateNext = class(TFMXBindNavigateNext)
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

  [ComponentPlatformsAttribute(pidATActionsPlatforms)]
  TATFMXBindNavigatePost = class(TFMXBindNavigatePost)
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

  [ComponentPlatformsAttribute(pidATActionsPlatforms)]
  TATFMXBindNavigatePrior = class(TFMXBindNavigatePrior)
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

  [ComponentPlatformsAttribute(pidATActionsPlatforms)]
  TATFMXBindNavigateRefresh = class(TFMXBindNavigateRefresh)
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
  System.SysUtils, System.Actions, FMX.ActnList;


{ TATFMXBindNavigateApplyUpdates }
{$region 'TATFMXBindNavigateApplyUpdates'}
constructor TATFMXBindNavigateApplyUpdates.Create(AOwner: TComponent);
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

procedure TATFMXBindNavigateApplyUpdates.Loaded;
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

        if (_LinuxHintIsStored) then
          Hint := FLinuxHint;
        if (_LinuxImgIdxIsStored) then
          ImageIndex := FLinuxImageIndex;
        if (_LinuxShortCutIsStored) then
          ShortCut := FLinuxShortCut;
        if (_LinuxTextIsStored) then
          Text := LinuxText;

      {$ELSEIF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}

        if (_OSXHintIsStored) then
          Hint := FOSXHint;
        if (_OSXImgIdxIsStored) then
          ImageIndex := FOSXImageIndex;
        if (_OSXShortCutIsStored) then
          ShortCut := FOSXShortCut;
        if (_OSXTextIsStored) then
          Text := OSXText;

      {$ELSEIF Defined(MSWINDOWS)}

        if (_WinHintIsStored) then
          Hint := FWindowsHint;
        if (_WinImgIdxIsStored) then
          ImageIndex := FWindowsImageIndex;
        if (_WinShortCutIsStored) then
          ShortCut := FWindowsShortCut;
        if (_WinTextIsStored) then
          Text := WindowsText;

      {$ENDIF}
    end;
end;

procedure TATFMXBindNavigateApplyUpdates.SetAndroidImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateApplyUpdates.SetAndroidText(const Value: String);
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

procedure TATFMXBindNavigateApplyUpdates.SetiOSImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateApplyUpdates.SetiOSText(const Value: String);
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

procedure TATFMXBindNavigateApplyUpdates.SetLinuxHint(const Value: String);
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

procedure TATFMXBindNavigateApplyUpdates.SetLinuxImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateApplyUpdates.SetLinuxShortCut(Value: System.Classes.TShortCut);
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

procedure TATFMXBindNavigateApplyUpdates.SetLinuxText(const Value: String);
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

procedure TATFMXBindNavigateApplyUpdates.SetOSXHint(const Value: String);
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

procedure TATFMXBindNavigateApplyUpdates.SetOSXImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateApplyUpdates.SetOSXShortCut(Value: System.Classes.TShortCut);
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

procedure TATFMXBindNavigateApplyUpdates.SetOSXText(const Value: String);
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

procedure TATFMXBindNavigateApplyUpdates.SetWindowsHint(const Value: String);
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

procedure TATFMXBindNavigateApplyUpdates.SetWindowsImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateApplyUpdates.SetWindowsShortCut(Value:
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

procedure TATFMXBindNavigateApplyUpdates.SetWindowsText(const Value: String);
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

function TATFMXBindNavigateApplyUpdates._AndroidImgIdxIsStored: Boolean;
begin
  Result := (FAndroidImageIndex <> -1);
end;

function TATFMXBindNavigateApplyUpdates._AndroidTextIsStored: Boolean;
begin
  Result := (NOT FAndroidText.IsEmpty);
end;

function TATFMXBindNavigateApplyUpdates._iOSImgIdxIsStored: Boolean;
begin
  Result := (FiOSImageIndex <> -1);
end;

function TATFMXBindNavigateApplyUpdates._iOSTextIsStored: Boolean;
begin
  Result := (NOT FiOSText.IsEmpty);
end;

function TATFMXBindNavigateApplyUpdates._LinuxHintIsStored: Boolean;
begin
  Result := (NOT FLinuxHint.IsEmpty);
end;

function TATFMXBindNavigateApplyUpdates._LinuxImgIdxIsStored: Boolean;
begin
  Result := (FLinuxImageIndex <> -1);
end;

function TATFMXBindNavigateApplyUpdates._LinuxShortCutIsStored: Boolean;
begin
  Result := (FLinuxShortCut <> 0);
end;

function TATFMXBindNavigateApplyUpdates._LinuxTextIsStored: Boolean;
begin
  Result := (NOT FLinuxText.IsEmpty);
end;

function TATFMXBindNavigateApplyUpdates._OSXHintIsStored: Boolean;
begin
  Result := (NOT FOSXHint.IsEmpty);
end;

function TATFMXBindNavigateApplyUpdates._OSXImgIdxIsStored: Boolean;
begin
  Result := (FOSXImageIndex <> -1);
end;

function TATFMXBindNavigateApplyUpdates._OSXShortCutIsStored: Boolean;
begin
  Result := (FOSXShortCut <> 0);
end;

function TATFMXBindNavigateApplyUpdates._OSXTextIsStored: Boolean;
begin
  Result := (NOT FOSXText.IsEmpty);
end;

function TATFMXBindNavigateApplyUpdates._WinHintIsStored: Boolean;
begin
  Result := (NOT FWindowsHint.IsEmpty);
end;

function TATFMXBindNavigateApplyUpdates._WinImgIdxIsStored: Boolean;
begin
  Result := (FWindowsImageIndex <> -1);
end;

function TATFMXBindNavigateApplyUpdates._WinShortCutIsStored: Boolean;
begin
  Result := (FWindowsShortCut <> 0);
end;

function TATFMXBindNavigateApplyUpdates._WinTextIsStored: Boolean;
begin
  Result := (NOT FWindowsText.IsEmpty);
end;
{$endregion}

{ TATFMXBindNavigateCancel }
{$region 'TATFMXBindNavigateCancel'}
constructor TATFMXBindNavigateCancel.Create(AOwner: TComponent);
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

procedure TATFMXBindNavigateCancel.Loaded;
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

        if (_LinuxHintIsStored) then
          Hint := FLinuxHint;
        if (_LinuxImgIdxIsStored) then
          ImageIndex := FLinuxImageIndex;
        if (_LinuxShortCutIsStored) then
          ShortCut := FLinuxShortCut;
        if (_LinuxTextIsStored) then
          Text := LinuxText;

      {$ELSEIF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}

        if (_OSXHintIsStored) then
          Hint := FOSXHint;
        if (_OSXImgIdxIsStored) then
          ImageIndex := FOSXImageIndex;
        if (_OSXShortCutIsStored) then
          ShortCut := FOSXShortCut;
        if (_OSXTextIsStored) then
          Text := OSXText;

      {$ELSEIF Defined(MSWINDOWS)}

        if (_WinHintIsStored) then
          Hint := FWindowsHint;
        if (_WinImgIdxIsStored) then
          ImageIndex := FWindowsImageIndex;
        if (_WinShortCutIsStored) then
          ShortCut := FWindowsShortCut;
        if (_WinTextIsStored) then
          Text := WindowsText;

      {$ENDIF}
    end;
end;

procedure TATFMXBindNavigateCancel.SetAndroidImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateCancel.SetAndroidText(const Value: String);
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

procedure TATFMXBindNavigateCancel.SetiOSImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateCancel.SetiOSText(const Value: String);
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

procedure TATFMXBindNavigateCancel.SetLinuxHint(const Value: String);
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

procedure TATFMXBindNavigateCancel.SetLinuxImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateCancel.SetLinuxShortCut(Value: System.Classes.TShortCut);
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

procedure TATFMXBindNavigateCancel.SetLinuxText(const Value: String);
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

procedure TATFMXBindNavigateCancel.SetOSXHint(const Value: String);
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

procedure TATFMXBindNavigateCancel.SetOSXImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateCancel.SetOSXShortCut(Value: System.Classes.TShortCut);
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

procedure TATFMXBindNavigateCancel.SetOSXText(const Value: String);
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

procedure TATFMXBindNavigateCancel.SetWindowsHint(const Value: String);
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

procedure TATFMXBindNavigateCancel.SetWindowsImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateCancel.SetWindowsShortCut(Value:
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

procedure TATFMXBindNavigateCancel.SetWindowsText(const Value: String);
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

function TATFMXBindNavigateCancel._AndroidImgIdxIsStored: Boolean;
begin
  Result := (FAndroidImageIndex <> -1);
end;

function TATFMXBindNavigateCancel._AndroidTextIsStored: Boolean;
begin
  Result := (NOT FAndroidText.IsEmpty);
end;

function TATFMXBindNavigateCancel._iOSImgIdxIsStored: Boolean;
begin
  Result := (FiOSImageIndex <> -1);
end;

function TATFMXBindNavigateCancel._iOSTextIsStored: Boolean;
begin
  Result := (NOT FiOSText.IsEmpty);
end;

function TATFMXBindNavigateCancel._LinuxHintIsStored: Boolean;
begin
  Result := (NOT FLinuxHint.IsEmpty);
end;

function TATFMXBindNavigateCancel._LinuxImgIdxIsStored: Boolean;
begin
  Result := (FLinuxImageIndex <> -1);
end;

function TATFMXBindNavigateCancel._LinuxShortCutIsStored: Boolean;
begin
  Result := (FLinuxShortCut <> 0);
end;

function TATFMXBindNavigateCancel._LinuxTextIsStored: Boolean;
begin
  Result := (NOT FLinuxText.IsEmpty);
end;

function TATFMXBindNavigateCancel._OSXHintIsStored: Boolean;
begin
  Result := (NOT FOSXHint.IsEmpty);
end;

function TATFMXBindNavigateCancel._OSXImgIdxIsStored: Boolean;
begin
  Result := (FOSXImageIndex <> -1);
end;

function TATFMXBindNavigateCancel._OSXShortCutIsStored: Boolean;
begin
  Result := (FOSXShortCut <> 0);
end;

function TATFMXBindNavigateCancel._OSXTextIsStored: Boolean;
begin
  Result := (NOT FOSXText.IsEmpty);
end;

function TATFMXBindNavigateCancel._WinHintIsStored: Boolean;
begin
  Result := (NOT FWindowsHint.IsEmpty);
end;

function TATFMXBindNavigateCancel._WinImgIdxIsStored: Boolean;
begin
  Result := (FWindowsImageIndex <> -1);
end;

function TATFMXBindNavigateCancel._WinShortCutIsStored: Boolean;
begin
  Result := (FWindowsShortCut <> 0);
end;

function TATFMXBindNavigateCancel._WinTextIsStored: Boolean;
begin
  Result := (NOT FWindowsText.IsEmpty);
end;
{$endregion}

{ TATFMXBindNavigateCancelUpdates }
{$region 'TATFMXBindNavigateCancelUpdates'}
constructor TATFMXBindNavigateCancelUpdates.Create(AOwner: TComponent);
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

procedure TATFMXBindNavigateCancelUpdates.Loaded;
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

        if (_LinuxHintIsStored) then
          Hint := FLinuxHint;
        if (_LinuxImgIdxIsStored) then
          ImageIndex := FLinuxImageIndex;
        if (_LinuxShortCutIsStored) then
          ShortCut := FLinuxShortCut;
        if (_LinuxTextIsStored) then
          Text := LinuxText;

      {$ELSEIF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}

        if (_OSXHintIsStored) then
          Hint := FOSXHint;
        if (_OSXImgIdxIsStored) then
          ImageIndex := FOSXImageIndex;
        if (_OSXShortCutIsStored) then
          ShortCut := FOSXShortCut;
        if (_OSXTextIsStored) then
          Text := OSXText;

      {$ELSEIF Defined(MSWINDOWS)}

        if (_WinHintIsStored) then
          Hint := FWindowsHint;
        if (_WinImgIdxIsStored) then
          ImageIndex := FWindowsImageIndex;
        if (_WinShortCutIsStored) then
          ShortCut := FWindowsShortCut;
        if (_WinTextIsStored) then
          Text := WindowsText;

      {$ENDIF}
    end;
end;

procedure TATFMXBindNavigateCancelUpdates.SetAndroidImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateCancelUpdates.SetAndroidText(const Value: String);
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

procedure TATFMXBindNavigateCancelUpdates.SetiOSImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateCancelUpdates.SetiOSText(const Value: String);
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

procedure TATFMXBindNavigateCancelUpdates.SetLinuxHint(const Value: String);
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

procedure TATFMXBindNavigateCancelUpdates.SetLinuxImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateCancelUpdates.SetLinuxShortCut(Value: System.Classes.TShortCut);
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

procedure TATFMXBindNavigateCancelUpdates.SetLinuxText(const Value: String);
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

procedure TATFMXBindNavigateCancelUpdates.SetOSXHint(const Value: String);
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

procedure TATFMXBindNavigateCancelUpdates.SetOSXImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateCancelUpdates.SetOSXShortCut(Value: System.Classes.TShortCut);
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

procedure TATFMXBindNavigateCancelUpdates.SetOSXText(const Value: String);
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

procedure TATFMXBindNavigateCancelUpdates.SetWindowsHint(const Value: String);
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

procedure TATFMXBindNavigateCancelUpdates.SetWindowsImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateCancelUpdates.SetWindowsShortCut(Value:
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

procedure TATFMXBindNavigateCancelUpdates.SetWindowsText(const Value: String);
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

function TATFMXBindNavigateCancelUpdates._AndroidImgIdxIsStored: Boolean;
begin
  Result := (FAndroidImageIndex <> -1);
end;

function TATFMXBindNavigateCancelUpdates._AndroidTextIsStored: Boolean;
begin
  Result := (NOT FAndroidText.IsEmpty);
end;

function TATFMXBindNavigateCancelUpdates._iOSImgIdxIsStored: Boolean;
begin
  Result := (FiOSImageIndex <> -1);
end;

function TATFMXBindNavigateCancelUpdates._iOSTextIsStored: Boolean;
begin
  Result := (NOT FiOSText.IsEmpty);
end;

function TATFMXBindNavigateCancelUpdates._LinuxHintIsStored: Boolean;
begin
  Result := (NOT FLinuxHint.IsEmpty);
end;

function TATFMXBindNavigateCancelUpdates._LinuxImgIdxIsStored: Boolean;
begin
  Result := (FLinuxImageIndex <> -1);
end;

function TATFMXBindNavigateCancelUpdates._LinuxShortCutIsStored: Boolean;
begin
  Result := (FLinuxShortCut <> 0);
end;

function TATFMXBindNavigateCancelUpdates._LinuxTextIsStored: Boolean;
begin
  Result := (NOT FLinuxText.IsEmpty);
end;

function TATFMXBindNavigateCancelUpdates._OSXHintIsStored: Boolean;
begin
  Result := (NOT FOSXHint.IsEmpty);
end;

function TATFMXBindNavigateCancelUpdates._OSXImgIdxIsStored: Boolean;
begin
  Result := (FOSXImageIndex <> -1);
end;

function TATFMXBindNavigateCancelUpdates._OSXShortCutIsStored: Boolean;
begin
  Result := (FOSXShortCut <> 0);
end;

function TATFMXBindNavigateCancelUpdates._OSXTextIsStored: Boolean;
begin
  Result := (NOT FOSXText.IsEmpty);
end;

function TATFMXBindNavigateCancelUpdates._WinHintIsStored: Boolean;
begin
  Result := (NOT FWindowsHint.IsEmpty);
end;

function TATFMXBindNavigateCancelUpdates._WinImgIdxIsStored: Boolean;
begin
  Result := (FWindowsImageIndex <> -1);
end;

function TATFMXBindNavigateCancelUpdates._WinShortCutIsStored: Boolean;
begin
  Result := (FWindowsShortCut <> 0);
end;

function TATFMXBindNavigateCancelUpdates._WinTextIsStored: Boolean;
begin
  Result := (NOT FWindowsText.IsEmpty);
end;
{$endregion}

{ TATFMXBindNavigateDelete }
{$region 'TATFMXBindNavigateDelete'}
constructor TATFMXBindNavigateDelete.Create(AOwner: TComponent);
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

procedure TATFMXBindNavigateDelete.Loaded;
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

        if (_LinuxHintIsStored) then
          Hint := FLinuxHint;
        if (_LinuxImgIdxIsStored) then
          ImageIndex := FLinuxImageIndex;
        if (_LinuxShortCutIsStored) then
          ShortCut := FLinuxShortCut;
        if (_LinuxTextIsStored) then
          Text := LinuxText;

      {$ELSEIF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}

        if (_OSXHintIsStored) then
          Hint := FOSXHint;
        if (_OSXImgIdxIsStored) then
          ImageIndex := FOSXImageIndex;
        if (_OSXShortCutIsStored) then
          ShortCut := FOSXShortCut;
        if (_OSXTextIsStored) then
          Text := OSXText;

      {$ELSEIF Defined(MSWINDOWS)}

        if (_WinHintIsStored) then
          Hint := FWindowsHint;
        if (_WinImgIdxIsStored) then
          ImageIndex := FWindowsImageIndex;
        if (_WinShortCutIsStored) then
          ShortCut := FWindowsShortCut;
        if (_WinTextIsStored) then
          Text := WindowsText;

      {$ENDIF}
    end;
end;

procedure TATFMXBindNavigateDelete.SetAndroidImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateDelete.SetAndroidText(const Value: String);
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

procedure TATFMXBindNavigateDelete.SetiOSImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateDelete.SetiOSText(const Value: String);
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

procedure TATFMXBindNavigateDelete.SetLinuxHint(const Value: String);
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

procedure TATFMXBindNavigateDelete.SetLinuxImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateDelete.SetLinuxShortCut(Value: System.Classes.TShortCut);
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

procedure TATFMXBindNavigateDelete.SetLinuxText(const Value: String);
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

procedure TATFMXBindNavigateDelete.SetOSXHint(const Value: String);
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

procedure TATFMXBindNavigateDelete.SetOSXImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateDelete.SetOSXShortCut(Value: System.Classes.TShortCut);
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

procedure TATFMXBindNavigateDelete.SetOSXText(const Value: String);
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

procedure TATFMXBindNavigateDelete.SetWindowsHint(const Value: String);
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

procedure TATFMXBindNavigateDelete.SetWindowsImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateDelete.SetWindowsShortCut(Value:
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

procedure TATFMXBindNavigateDelete.SetWindowsText(const Value: String);
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

function TATFMXBindNavigateDelete._AndroidImgIdxIsStored: Boolean;
begin
  Result := (FAndroidImageIndex <> -1);
end;

function TATFMXBindNavigateDelete._AndroidTextIsStored: Boolean;
begin
  Result := (NOT FAndroidText.IsEmpty);
end;

function TATFMXBindNavigateDelete._iOSImgIdxIsStored: Boolean;
begin
  Result := (FiOSImageIndex <> -1);
end;

function TATFMXBindNavigateDelete._iOSTextIsStored: Boolean;
begin
  Result := (NOT FiOSText.IsEmpty);
end;

function TATFMXBindNavigateDelete._LinuxHintIsStored: Boolean;
begin
  Result := (NOT FLinuxHint.IsEmpty);
end;

function TATFMXBindNavigateDelete._LinuxImgIdxIsStored: Boolean;
begin
  Result := (FLinuxImageIndex <> -1);
end;

function TATFMXBindNavigateDelete._LinuxShortCutIsStored: Boolean;
begin
  Result := (FLinuxShortCut <> 0);
end;

function TATFMXBindNavigateDelete._LinuxTextIsStored: Boolean;
begin
  Result := (NOT FLinuxText.IsEmpty);
end;

function TATFMXBindNavigateDelete._OSXHintIsStored: Boolean;
begin
  Result := (NOT FOSXHint.IsEmpty);
end;

function TATFMXBindNavigateDelete._OSXImgIdxIsStored: Boolean;
begin
  Result := (FOSXImageIndex <> -1);
end;

function TATFMXBindNavigateDelete._OSXShortCutIsStored: Boolean;
begin
  Result := (FOSXShortCut <> 0);
end;

function TATFMXBindNavigateDelete._OSXTextIsStored: Boolean;
begin
  Result := (NOT FOSXText.IsEmpty);
end;

function TATFMXBindNavigateDelete._WinHintIsStored: Boolean;
begin
  Result := (NOT FWindowsHint.IsEmpty);
end;

function TATFMXBindNavigateDelete._WinImgIdxIsStored: Boolean;
begin
  Result := (FWindowsImageIndex <> -1);
end;

function TATFMXBindNavigateDelete._WinShortCutIsStored: Boolean;
begin
  Result := (FWindowsShortCut <> 0);
end;

function TATFMXBindNavigateDelete._WinTextIsStored: Boolean;
begin
  Result := (NOT FWindowsText.IsEmpty);
end;
{$endregion}

{ TATFMXBindNavigateEdit }
{$region 'TATFMXBindNavigateEdit'}
constructor TATFMXBindNavigateEdit.Create(AOwner: TComponent);
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

procedure TATFMXBindNavigateEdit.Loaded;
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

        if (_LinuxHintIsStored) then
          Hint := FLinuxHint;
        if (_LinuxImgIdxIsStored) then
          ImageIndex := FLinuxImageIndex;
        if (_LinuxShortCutIsStored) then
          ShortCut := FLinuxShortCut;
        if (_LinuxTextIsStored) then
          Text := LinuxText;

      {$ELSEIF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}

        if (_OSXHintIsStored) then
          Hint := FOSXHint;
        if (_OSXImgIdxIsStored) then
          ImageIndex := FOSXImageIndex;
        if (_OSXShortCutIsStored) then
          ShortCut := FOSXShortCut;
        if (_OSXTextIsStored) then
          Text := OSXText;

      {$ELSEIF Defined(MSWINDOWS)}

        if (_WinHintIsStored) then
          Hint := FWindowsHint;
        if (_WinImgIdxIsStored) then
          ImageIndex := FWindowsImageIndex;
        if (_WinShortCutIsStored) then
          ShortCut := FWindowsShortCut;
        if (_WinTextIsStored) then
          Text := WindowsText;

      {$ENDIF}
    end;
end;

procedure TATFMXBindNavigateEdit.SetAndroidImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateEdit.SetAndroidText(const Value: String);
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

procedure TATFMXBindNavigateEdit.SetiOSImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateEdit.SetiOSText(const Value: String);
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

procedure TATFMXBindNavigateEdit.SetLinuxHint(const Value: String);
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

procedure TATFMXBindNavigateEdit.SetLinuxImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateEdit.SetLinuxShortCut(Value: System.Classes.TShortCut);
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

procedure TATFMXBindNavigateEdit.SetLinuxText(const Value: String);
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

procedure TATFMXBindNavigateEdit.SetOSXHint(const Value: String);
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

procedure TATFMXBindNavigateEdit.SetOSXImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateEdit.SetOSXShortCut(Value: System.Classes.TShortCut);
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

procedure TATFMXBindNavigateEdit.SetOSXText(const Value: String);
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

procedure TATFMXBindNavigateEdit.SetWindowsHint(const Value: String);
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

procedure TATFMXBindNavigateEdit.SetWindowsImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateEdit.SetWindowsShortCut(Value:
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

procedure TATFMXBindNavigateEdit.SetWindowsText(const Value: String);
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

function TATFMXBindNavigateEdit._AndroidImgIdxIsStored: Boolean;
begin
  Result := (FAndroidImageIndex <> -1);
end;

function TATFMXBindNavigateEdit._AndroidTextIsStored: Boolean;
begin
  Result := (NOT FAndroidText.IsEmpty);
end;

function TATFMXBindNavigateEdit._iOSImgIdxIsStored: Boolean;
begin
  Result := (FiOSImageIndex <> -1);
end;

function TATFMXBindNavigateEdit._iOSTextIsStored: Boolean;
begin
  Result := (NOT FiOSText.IsEmpty);
end;

function TATFMXBindNavigateEdit._LinuxHintIsStored: Boolean;
begin
  Result := (NOT FLinuxHint.IsEmpty);
end;

function TATFMXBindNavigateEdit._LinuxImgIdxIsStored: Boolean;
begin
  Result := (FLinuxImageIndex <> -1);
end;

function TATFMXBindNavigateEdit._LinuxShortCutIsStored: Boolean;
begin
  Result := (FLinuxShortCut <> 0);
end;

function TATFMXBindNavigateEdit._LinuxTextIsStored: Boolean;
begin
  Result := (NOT FLinuxText.IsEmpty);
end;

function TATFMXBindNavigateEdit._OSXHintIsStored: Boolean;
begin
  Result := (NOT FOSXHint.IsEmpty);
end;

function TATFMXBindNavigateEdit._OSXImgIdxIsStored: Boolean;
begin
  Result := (FOSXImageIndex <> -1);
end;

function TATFMXBindNavigateEdit._OSXShortCutIsStored: Boolean;
begin
  Result := (FOSXShortCut <> 0);
end;

function TATFMXBindNavigateEdit._OSXTextIsStored: Boolean;
begin
  Result := (NOT FOSXText.IsEmpty);
end;

function TATFMXBindNavigateEdit._WinHintIsStored: Boolean;
begin
  Result := (NOT FWindowsHint.IsEmpty);
end;

function TATFMXBindNavigateEdit._WinImgIdxIsStored: Boolean;
begin
  Result := (FWindowsImageIndex <> -1);
end;

function TATFMXBindNavigateEdit._WinShortCutIsStored: Boolean;
begin
  Result := (FWindowsShortCut <> 0);
end;

function TATFMXBindNavigateEdit._WinTextIsStored: Boolean;
begin
  Result := (NOT FWindowsText.IsEmpty);
end;
{$endregion}

{ TATFMXBindNavigateFirst }
{$region 'TATFMXBindNavigateFirst'}
constructor TATFMXBindNavigateFirst.Create(AOwner: TComponent);
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

procedure TATFMXBindNavigateFirst.Loaded;
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

        if (_LinuxHintIsStored) then
          Hint := FLinuxHint;
        if (_LinuxImgIdxIsStored) then
          ImageIndex := FLinuxImageIndex;
        if (_LinuxShortCutIsStored) then
          ShortCut := FLinuxShortCut;
        if (_LinuxTextIsStored) then
          Text := LinuxText;

      {$ELSEIF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}

        if (_OSXHintIsStored) then
          Hint := FOSXHint;
        if (_OSXImgIdxIsStored) then
          ImageIndex := FOSXImageIndex;
        if (_OSXShortCutIsStored) then
          ShortCut := FOSXShortCut;
        if (_OSXTextIsStored) then
          Text := OSXText;

      {$ELSEIF Defined(MSWINDOWS)}

        if (_WinHintIsStored) then
          Hint := FWindowsHint;
        if (_WinImgIdxIsStored) then
          ImageIndex := FWindowsImageIndex;
        if (_WinShortCutIsStored) then
          ShortCut := FWindowsShortCut;
        if (_WinTextIsStored) then
          Text := WindowsText;

      {$ENDIF}
    end;
end;

procedure TATFMXBindNavigateFirst.SetAndroidImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateFirst.SetAndroidText(const Value: String);
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

procedure TATFMXBindNavigateFirst.SetiOSImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateFirst.SetiOSText(const Value: String);
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

procedure TATFMXBindNavigateFirst.SetLinuxHint(const Value: String);
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

procedure TATFMXBindNavigateFirst.SetLinuxImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateFirst.SetLinuxShortCut(Value: System.Classes.TShortCut);
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

procedure TATFMXBindNavigateFirst.SetLinuxText(const Value: String);
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

procedure TATFMXBindNavigateFirst.SetOSXHint(const Value: String);
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

procedure TATFMXBindNavigateFirst.SetOSXImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateFirst.SetOSXShortCut(Value: System.Classes.TShortCut);
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

procedure TATFMXBindNavigateFirst.SetOSXText(const Value: String);
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

procedure TATFMXBindNavigateFirst.SetWindowsHint(const Value: String);
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

procedure TATFMXBindNavigateFirst.SetWindowsImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateFirst.SetWindowsShortCut(Value:
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

procedure TATFMXBindNavigateFirst.SetWindowsText(const Value: String);
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

function TATFMXBindNavigateFirst._AndroidImgIdxIsStored: Boolean;
begin
  Result := (FAndroidImageIndex <> -1);
end;

function TATFMXBindNavigateFirst._AndroidTextIsStored: Boolean;
begin
  Result := (NOT FAndroidText.IsEmpty);
end;

function TATFMXBindNavigateFirst._iOSImgIdxIsStored: Boolean;
begin
  Result := (FiOSImageIndex <> -1);
end;

function TATFMXBindNavigateFirst._iOSTextIsStored: Boolean;
begin
  Result := (NOT FiOSText.IsEmpty);
end;

function TATFMXBindNavigateFirst._LinuxHintIsStored: Boolean;
begin
  Result := (NOT FLinuxHint.IsEmpty);
end;

function TATFMXBindNavigateFirst._LinuxImgIdxIsStored: Boolean;
begin
  Result := (FLinuxImageIndex <> -1);
end;

function TATFMXBindNavigateFirst._LinuxShortCutIsStored: Boolean;
begin
  Result := (FLinuxShortCut <> 0);
end;

function TATFMXBindNavigateFirst._LinuxTextIsStored: Boolean;
begin
  Result := (NOT FLinuxText.IsEmpty);
end;

function TATFMXBindNavigateFirst._OSXHintIsStored: Boolean;
begin
  Result := (NOT FOSXHint.IsEmpty);
end;

function TATFMXBindNavigateFirst._OSXImgIdxIsStored: Boolean;
begin
  Result := (FOSXImageIndex <> -1);
end;

function TATFMXBindNavigateFirst._OSXShortCutIsStored: Boolean;
begin
  Result := (FOSXShortCut <> 0);
end;

function TATFMXBindNavigateFirst._OSXTextIsStored: Boolean;
begin
  Result := (NOT FOSXText.IsEmpty);
end;

function TATFMXBindNavigateFirst._WinHintIsStored: Boolean;
begin
  Result := (NOT FWindowsHint.IsEmpty);
end;

function TATFMXBindNavigateFirst._WinImgIdxIsStored: Boolean;
begin
  Result := (FWindowsImageIndex <> -1);
end;

function TATFMXBindNavigateFirst._WinShortCutIsStored: Boolean;
begin
  Result := (FWindowsShortCut <> 0);
end;

function TATFMXBindNavigateFirst._WinTextIsStored: Boolean;
begin
  Result := (NOT FWindowsText.IsEmpty);
end;
{$endregion}

{ TATFMXBindNavigateInsert }
{$region 'TATFMXBindNavigateInsert'}
constructor TATFMXBindNavigateInsert.Create(AOwner: TComponent);
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

procedure TATFMXBindNavigateInsert.Loaded;
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

        if (_LinuxHintIsStored) then
          Hint := FLinuxHint;
        if (_LinuxImgIdxIsStored) then
          ImageIndex := FLinuxImageIndex;
        if (_LinuxShortCutIsStored) then
          ShortCut := FLinuxShortCut;
        if (_LinuxTextIsStored) then
          Text := LinuxText;

      {$ELSEIF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}

        if (_OSXHintIsStored) then
          Hint := FOSXHint;
        if (_OSXImgIdxIsStored) then
          ImageIndex := FOSXImageIndex;
        if (_OSXShortCutIsStored) then
          ShortCut := FOSXShortCut;
        if (_OSXTextIsStored) then
          Text := OSXText;

      {$ELSEIF Defined(MSWINDOWS)}

        if (_WinHintIsStored) then
          Hint := FWindowsHint;
        if (_WinImgIdxIsStored) then
          ImageIndex := FWindowsImageIndex;
        if (_WinShortCutIsStored) then
          ShortCut := FWindowsShortCut;
        if (_WinTextIsStored) then
          Text := WindowsText;

      {$ENDIF}
    end;
end;

procedure TATFMXBindNavigateInsert.SetAndroidImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateInsert.SetAndroidText(const Value: String);
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

procedure TATFMXBindNavigateInsert.SetiOSImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateInsert.SetiOSText(const Value: String);
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

procedure TATFMXBindNavigateInsert.SetLinuxHint(const Value: String);
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

procedure TATFMXBindNavigateInsert.SetLinuxImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateInsert.SetLinuxShortCut(Value: System.Classes.TShortCut);
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

procedure TATFMXBindNavigateInsert.SetLinuxText(const Value: String);
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

procedure TATFMXBindNavigateInsert.SetOSXHint(const Value: String);
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

procedure TATFMXBindNavigateInsert.SetOSXImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateInsert.SetOSXShortCut(Value: System.Classes.TShortCut);
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

procedure TATFMXBindNavigateInsert.SetOSXText(const Value: String);
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

procedure TATFMXBindNavigateInsert.SetWindowsHint(const Value: String);
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

procedure TATFMXBindNavigateInsert.SetWindowsImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateInsert.SetWindowsShortCut(Value:
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

procedure TATFMXBindNavigateInsert.SetWindowsText(const Value: String);
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

function TATFMXBindNavigateInsert._AndroidImgIdxIsStored: Boolean;
begin
  Result := (FAndroidImageIndex <> -1);
end;

function TATFMXBindNavigateInsert._AndroidTextIsStored: Boolean;
begin
  Result := (NOT FAndroidText.IsEmpty);
end;

function TATFMXBindNavigateInsert._iOSImgIdxIsStored: Boolean;
begin
  Result := (FiOSImageIndex <> -1);
end;

function TATFMXBindNavigateInsert._iOSTextIsStored: Boolean;
begin
  Result := (NOT FiOSText.IsEmpty);
end;

function TATFMXBindNavigateInsert._LinuxHintIsStored: Boolean;
begin
  Result := (NOT FLinuxHint.IsEmpty);
end;

function TATFMXBindNavigateInsert._LinuxImgIdxIsStored: Boolean;
begin
  Result := (FLinuxImageIndex <> -1);
end;

function TATFMXBindNavigateInsert._LinuxShortCutIsStored: Boolean;
begin
  Result := (FLinuxShortCut <> 0);
end;

function TATFMXBindNavigateInsert._LinuxTextIsStored: Boolean;
begin
  Result := (NOT FLinuxText.IsEmpty);
end;

function TATFMXBindNavigateInsert._OSXHintIsStored: Boolean;
begin
  Result := (NOT FOSXHint.IsEmpty);
end;

function TATFMXBindNavigateInsert._OSXImgIdxIsStored: Boolean;
begin
  Result := (FOSXImageIndex <> -1);
end;

function TATFMXBindNavigateInsert._OSXShortCutIsStored: Boolean;
begin
  Result := (FOSXShortCut <> 0);
end;

function TATFMXBindNavigateInsert._OSXTextIsStored: Boolean;
begin
  Result := (NOT FOSXText.IsEmpty);
end;

function TATFMXBindNavigateInsert._WinHintIsStored: Boolean;
begin
  Result := (NOT FWindowsHint.IsEmpty);
end;

function TATFMXBindNavigateInsert._WinImgIdxIsStored: Boolean;
begin
  Result := (FWindowsImageIndex <> -1);
end;

function TATFMXBindNavigateInsert._WinShortCutIsStored: Boolean;
begin
  Result := (FWindowsShortCut <> 0);
end;

function TATFMXBindNavigateInsert._WinTextIsStored: Boolean;
begin
  Result := (NOT FWindowsText.IsEmpty);
end;
{$endregion}

{ TATFMXBindNavigateLast }
{$region 'TATFMXBindNavigateLast'}
constructor TATFMXBindNavigateLast.Create(AOwner: TComponent);
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

procedure TATFMXBindNavigateLast.Loaded;
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

        if (_LinuxHintIsStored) then
          Hint := FLinuxHint;
        if (_LinuxImgIdxIsStored) then
          ImageIndex := FLinuxImageIndex;
        if (_LinuxShortCutIsStored) then
          ShortCut := FLinuxShortCut;
        if (_LinuxTextIsStored) then
          Text := LinuxText;

      {$ELSEIF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}

        if (_OSXHintIsStored) then
          Hint := FOSXHint;
        if (_OSXImgIdxIsStored) then
          ImageIndex := FOSXImageIndex;
        if (_OSXShortCutIsStored) then
          ShortCut := FOSXShortCut;
        if (_OSXTextIsStored) then
          Text := OSXText;

      {$ELSEIF Defined(MSWINDOWS)}

        if (_WinHintIsStored) then
          Hint := FWindowsHint;
        if (_WinImgIdxIsStored) then
          ImageIndex := FWindowsImageIndex;
        if (_WinShortCutIsStored) then
          ShortCut := FWindowsShortCut;
        if (_WinTextIsStored) then
          Text := WindowsText;

      {$ENDIF}
    end;
end;

procedure TATFMXBindNavigateLast.SetAndroidImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateLast.SetAndroidText(const Value: String);
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

procedure TATFMXBindNavigateLast.SetiOSImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateLast.SetiOSText(const Value: String);
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

procedure TATFMXBindNavigateLast.SetLinuxHint(const Value: String);
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

procedure TATFMXBindNavigateLast.SetLinuxImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateLast.SetLinuxShortCut(Value: System.Classes.TShortCut);
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

procedure TATFMXBindNavigateLast.SetLinuxText(const Value: String);
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

procedure TATFMXBindNavigateLast.SetOSXHint(const Value: String);
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

procedure TATFMXBindNavigateLast.SetOSXImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateLast.SetOSXShortCut(Value: System.Classes.TShortCut);
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

procedure TATFMXBindNavigateLast.SetOSXText(const Value: String);
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

procedure TATFMXBindNavigateLast.SetWindowsHint(const Value: String);
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

procedure TATFMXBindNavigateLast.SetWindowsImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateLast.SetWindowsShortCut(Value:
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

procedure TATFMXBindNavigateLast.SetWindowsText(const Value: String);
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

function TATFMXBindNavigateLast._AndroidImgIdxIsStored: Boolean;
begin
  Result := (FAndroidImageIndex <> -1);
end;

function TATFMXBindNavigateLast._AndroidTextIsStored: Boolean;
begin
  Result := (NOT FAndroidText.IsEmpty);
end;

function TATFMXBindNavigateLast._iOSImgIdxIsStored: Boolean;
begin
  Result := (FiOSImageIndex <> -1);
end;

function TATFMXBindNavigateLast._iOSTextIsStored: Boolean;
begin
  Result := (NOT FiOSText.IsEmpty);
end;

function TATFMXBindNavigateLast._LinuxHintIsStored: Boolean;
begin
  Result := (NOT FLinuxHint.IsEmpty);
end;

function TATFMXBindNavigateLast._LinuxImgIdxIsStored: Boolean;
begin
  Result := (FLinuxImageIndex <> -1);
end;

function TATFMXBindNavigateLast._LinuxShortCutIsStored: Boolean;
begin
  Result := (FLinuxShortCut <> 0);
end;

function TATFMXBindNavigateLast._LinuxTextIsStored: Boolean;
begin
  Result := (NOT FLinuxText.IsEmpty);
end;

function TATFMXBindNavigateLast._OSXHintIsStored: Boolean;
begin
  Result := (NOT FOSXHint.IsEmpty);
end;

function TATFMXBindNavigateLast._OSXImgIdxIsStored: Boolean;
begin
  Result := (FOSXImageIndex <> -1);
end;

function TATFMXBindNavigateLast._OSXShortCutIsStored: Boolean;
begin
  Result := (FOSXShortCut <> 0);
end;

function TATFMXBindNavigateLast._OSXTextIsStored: Boolean;
begin
  Result := (NOT FOSXText.IsEmpty);
end;

function TATFMXBindNavigateLast._WinHintIsStored: Boolean;
begin
  Result := (NOT FWindowsHint.IsEmpty);
end;

function TATFMXBindNavigateLast._WinImgIdxIsStored: Boolean;
begin
  Result := (FWindowsImageIndex <> -1);
end;

function TATFMXBindNavigateLast._WinShortCutIsStored: Boolean;
begin
  Result := (FWindowsShortCut <> 0);
end;

function TATFMXBindNavigateLast._WinTextIsStored: Boolean;
begin
  Result := (NOT FWindowsText.IsEmpty);
end;
{$endregion}

{ TATFMXBindNavigateNext }
{$region 'TATFMXBindNavigateNext'}
constructor TATFMXBindNavigateNext.Create(AOwner: TComponent);
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

procedure TATFMXBindNavigateNext.Loaded;
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

        if (_LinuxHintIsStored) then
          Hint := FLinuxHint;
        if (_LinuxImgIdxIsStored) then
          ImageIndex := FLinuxImageIndex;
        if (_LinuxShortCutIsStored) then
          ShortCut := FLinuxShortCut;
        if (_LinuxTextIsStored) then
          Text := LinuxText;

      {$ELSEIF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}

        if (_OSXHintIsStored) then
          Hint := FOSXHint;
        if (_OSXImgIdxIsStored) then
          ImageIndex := FOSXImageIndex;
        if (_OSXShortCutIsStored) then
          ShortCut := FOSXShortCut;
        if (_OSXTextIsStored) then
          Text := OSXText;

      {$ELSEIF Defined(MSWINDOWS)}

        if (_WinHintIsStored) then
          Hint := FWindowsHint;
        if (_WinImgIdxIsStored) then
          ImageIndex := FWindowsImageIndex;
        if (_WinShortCutIsStored) then
          ShortCut := FWindowsShortCut;
        if (_WinTextIsStored) then
          Text := WindowsText;

      {$ENDIF}
    end;
end;

procedure TATFMXBindNavigateNext.SetAndroidImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateNext.SetAndroidText(const Value: String);
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

procedure TATFMXBindNavigateNext.SetiOSImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateNext.SetiOSText(const Value: String);
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

procedure TATFMXBindNavigateNext.SetLinuxHint(const Value: String);
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

procedure TATFMXBindNavigateNext.SetLinuxImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateNext.SetLinuxShortCut(Value: System.Classes.TShortCut);
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

procedure TATFMXBindNavigateNext.SetLinuxText(const Value: String);
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

procedure TATFMXBindNavigateNext.SetOSXHint(const Value: String);
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

procedure TATFMXBindNavigateNext.SetOSXImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateNext.SetOSXShortCut(Value: System.Classes.TShortCut);
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

procedure TATFMXBindNavigateNext.SetOSXText(const Value: String);
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

procedure TATFMXBindNavigateNext.SetWindowsHint(const Value: String);
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

procedure TATFMXBindNavigateNext.SetWindowsImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateNext.SetWindowsShortCut(Value:
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

procedure TATFMXBindNavigateNext.SetWindowsText(const Value: String);
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

function TATFMXBindNavigateNext._AndroidImgIdxIsStored: Boolean;
begin
  Result := (FAndroidImageIndex <> -1);
end;

function TATFMXBindNavigateNext._AndroidTextIsStored: Boolean;
begin
  Result := (NOT FAndroidText.IsEmpty);
end;

function TATFMXBindNavigateNext._iOSImgIdxIsStored: Boolean;
begin
  Result := (FiOSImageIndex <> -1);
end;

function TATFMXBindNavigateNext._iOSTextIsStored: Boolean;
begin
  Result := (NOT FiOSText.IsEmpty);
end;

function TATFMXBindNavigateNext._LinuxHintIsStored: Boolean;
begin
  Result := (NOT FLinuxHint.IsEmpty);
end;

function TATFMXBindNavigateNext._LinuxImgIdxIsStored: Boolean;
begin
  Result := (FLinuxImageIndex <> -1);
end;

function TATFMXBindNavigateNext._LinuxShortCutIsStored: Boolean;
begin
  Result := (FLinuxShortCut <> 0);
end;

function TATFMXBindNavigateNext._LinuxTextIsStored: Boolean;
begin
  Result := (NOT FLinuxText.IsEmpty);
end;

function TATFMXBindNavigateNext._OSXHintIsStored: Boolean;
begin
  Result := (NOT FOSXHint.IsEmpty);
end;

function TATFMXBindNavigateNext._OSXImgIdxIsStored: Boolean;
begin
  Result := (FOSXImageIndex <> -1);
end;

function TATFMXBindNavigateNext._OSXShortCutIsStored: Boolean;
begin
  Result := (FOSXShortCut <> 0);
end;

function TATFMXBindNavigateNext._OSXTextIsStored: Boolean;
begin
  Result := (NOT FOSXText.IsEmpty);
end;

function TATFMXBindNavigateNext._WinHintIsStored: Boolean;
begin
  Result := (NOT FWindowsHint.IsEmpty);
end;

function TATFMXBindNavigateNext._WinImgIdxIsStored: Boolean;
begin
  Result := (FWindowsImageIndex <> -1);
end;

function TATFMXBindNavigateNext._WinShortCutIsStored: Boolean;
begin
  Result := (FWindowsShortCut <> 0);
end;

function TATFMXBindNavigateNext._WinTextIsStored: Boolean;
begin
  Result := (NOT FWindowsText.IsEmpty);
end;
{$endregion}

{ TATFMXBindNavigatePost }
{$region 'TATFMXBindNavigatePost'}
constructor TATFMXBindNavigatePost.Create(AOwner: TComponent);
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

procedure TATFMXBindNavigatePost.Loaded;
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

        if (_LinuxHintIsStored) then
          Hint := FLinuxHint;
        if (_LinuxImgIdxIsStored) then
          ImageIndex := FLinuxImageIndex;
        if (_LinuxShortCutIsStored) then
          ShortCut := FLinuxShortCut;
        if (_LinuxTextIsStored) then
          Text := LinuxText;

      {$ELSEIF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}

        if (_OSXHintIsStored) then
          Hint := FOSXHint;
        if (_OSXImgIdxIsStored) then
          ImageIndex := FOSXImageIndex;
        if (_OSXShortCutIsStored) then
          ShortCut := FOSXShortCut;
        if (_OSXTextIsStored) then
          Text := OSXText;

      {$ELSEIF Defined(MSWINDOWS)}

        if (_WinHintIsStored) then
          Hint := FWindowsHint;
        if (_WinImgIdxIsStored) then
          ImageIndex := FWindowsImageIndex;
        if (_WinShortCutIsStored) then
          ShortCut := FWindowsShortCut;
        if (_WinTextIsStored) then
          Text := WindowsText;

      {$ENDIF}
    end;
end;

procedure TATFMXBindNavigatePost.SetAndroidImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigatePost.SetAndroidText(const Value: String);
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

procedure TATFMXBindNavigatePost.SetiOSImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigatePost.SetiOSText(const Value: String);
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

procedure TATFMXBindNavigatePost.SetLinuxHint(const Value: String);
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

procedure TATFMXBindNavigatePost.SetLinuxImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigatePost.SetLinuxShortCut(Value: System.Classes.TShortCut);
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

procedure TATFMXBindNavigatePost.SetLinuxText(const Value: String);
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

procedure TATFMXBindNavigatePost.SetOSXHint(const Value: String);
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

procedure TATFMXBindNavigatePost.SetOSXImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigatePost.SetOSXShortCut(Value: System.Classes.TShortCut);
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

procedure TATFMXBindNavigatePost.SetOSXText(const Value: String);
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

procedure TATFMXBindNavigatePost.SetWindowsHint(const Value: String);
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

procedure TATFMXBindNavigatePost.SetWindowsImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigatePost.SetWindowsShortCut(Value:
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

procedure TATFMXBindNavigatePost.SetWindowsText(const Value: String);
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

function TATFMXBindNavigatePost._AndroidImgIdxIsStored: Boolean;
begin
  Result := (FAndroidImageIndex <> -1);
end;

function TATFMXBindNavigatePost._AndroidTextIsStored: Boolean;
begin
  Result := (NOT FAndroidText.IsEmpty);
end;

function TATFMXBindNavigatePost._iOSImgIdxIsStored: Boolean;
begin
  Result := (FiOSImageIndex <> -1);
end;

function TATFMXBindNavigatePost._iOSTextIsStored: Boolean;
begin
  Result := (NOT FiOSText.IsEmpty);
end;

function TATFMXBindNavigatePost._LinuxHintIsStored: Boolean;
begin
  Result := (NOT FLinuxHint.IsEmpty);
end;

function TATFMXBindNavigatePost._LinuxImgIdxIsStored: Boolean;
begin
  Result := (FLinuxImageIndex <> -1);
end;

function TATFMXBindNavigatePost._LinuxShortCutIsStored: Boolean;
begin
  Result := (FLinuxShortCut <> 0);
end;

function TATFMXBindNavigatePost._LinuxTextIsStored: Boolean;
begin
  Result := (NOT FLinuxText.IsEmpty);
end;

function TATFMXBindNavigatePost._OSXHintIsStored: Boolean;
begin
  Result := (NOT FOSXHint.IsEmpty);
end;

function TATFMXBindNavigatePost._OSXImgIdxIsStored: Boolean;
begin
  Result := (FOSXImageIndex <> -1);
end;

function TATFMXBindNavigatePost._OSXShortCutIsStored: Boolean;
begin
  Result := (FOSXShortCut <> 0);
end;

function TATFMXBindNavigatePost._OSXTextIsStored: Boolean;
begin
  Result := (NOT FOSXText.IsEmpty);
end;

function TATFMXBindNavigatePost._WinHintIsStored: Boolean;
begin
  Result := (NOT FWindowsHint.IsEmpty);
end;

function TATFMXBindNavigatePost._WinImgIdxIsStored: Boolean;
begin
  Result := (FWindowsImageIndex <> -1);
end;

function TATFMXBindNavigatePost._WinShortCutIsStored: Boolean;
begin
  Result := (FWindowsShortCut <> 0);
end;

function TATFMXBindNavigatePost._WinTextIsStored: Boolean;
begin
  Result := (NOT FWindowsText.IsEmpty);
end;
{$endregion}

{ TATFMXBindNavigatePrior }
{$region 'TATFMXBindNavigatePrior'}
constructor TATFMXBindNavigatePrior.Create(AOwner: TComponent);
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

procedure TATFMXBindNavigatePrior.Loaded;
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

        if (_LinuxHintIsStored) then
          Hint := FLinuxHint;
        if (_LinuxImgIdxIsStored) then
          ImageIndex := FLinuxImageIndex;
        if (_LinuxShortCutIsStored) then
          ShortCut := FLinuxShortCut;
        if (_LinuxTextIsStored) then
          Text := LinuxText;

      {$ELSEIF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}

        if (_OSXHintIsStored) then
          Hint := FOSXHint;
        if (_OSXImgIdxIsStored) then
          ImageIndex := FOSXImageIndex;
        if (_OSXShortCutIsStored) then
          ShortCut := FOSXShortCut;
        if (_OSXTextIsStored) then
          Text := OSXText;

      {$ELSEIF Defined(MSWINDOWS)}

        if (_WinHintIsStored) then
          Hint := FWindowsHint;
        if (_WinImgIdxIsStored) then
          ImageIndex := FWindowsImageIndex;
        if (_WinShortCutIsStored) then
          ShortCut := FWindowsShortCut;
        if (_WinTextIsStored) then
          Text := WindowsText;

      {$ENDIF}
    end;
end;

procedure TATFMXBindNavigatePrior.SetAndroidImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigatePrior.SetAndroidText(const Value: String);
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

procedure TATFMXBindNavigatePrior.SetiOSImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigatePrior.SetiOSText(const Value: String);
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

procedure TATFMXBindNavigatePrior.SetLinuxHint(const Value: String);
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

procedure TATFMXBindNavigatePrior.SetLinuxImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigatePrior.SetLinuxShortCut(Value: System.Classes.TShortCut);
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

procedure TATFMXBindNavigatePrior.SetLinuxText(const Value: String);
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

procedure TATFMXBindNavigatePrior.SetOSXHint(const Value: String);
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

procedure TATFMXBindNavigatePrior.SetOSXImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigatePrior.SetOSXShortCut(Value: System.Classes.TShortCut);
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

procedure TATFMXBindNavigatePrior.SetOSXText(const Value: String);
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

procedure TATFMXBindNavigatePrior.SetWindowsHint(const Value: String);
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

procedure TATFMXBindNavigatePrior.SetWindowsImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigatePrior.SetWindowsShortCut(Value:
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

procedure TATFMXBindNavigatePrior.SetWindowsText(const Value: String);
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

function TATFMXBindNavigatePrior._AndroidImgIdxIsStored: Boolean;
begin
  Result := (FAndroidImageIndex <> -1);
end;

function TATFMXBindNavigatePrior._AndroidTextIsStored: Boolean;
begin
  Result := (NOT FAndroidText.IsEmpty);
end;

function TATFMXBindNavigatePrior._iOSImgIdxIsStored: Boolean;
begin
  Result := (FiOSImageIndex <> -1);
end;

function TATFMXBindNavigatePrior._iOSTextIsStored: Boolean;
begin
  Result := (NOT FiOSText.IsEmpty);
end;

function TATFMXBindNavigatePrior._LinuxHintIsStored: Boolean;
begin
  Result := (NOT FLinuxHint.IsEmpty);
end;

function TATFMXBindNavigatePrior._LinuxImgIdxIsStored: Boolean;
begin
  Result := (FLinuxImageIndex <> -1);
end;

function TATFMXBindNavigatePrior._LinuxShortCutIsStored: Boolean;
begin
  Result := (FLinuxShortCut <> 0);
end;

function TATFMXBindNavigatePrior._LinuxTextIsStored: Boolean;
begin
  Result := (NOT FLinuxText.IsEmpty);
end;

function TATFMXBindNavigatePrior._OSXHintIsStored: Boolean;
begin
  Result := (NOT FOSXHint.IsEmpty);
end;

function TATFMXBindNavigatePrior._OSXImgIdxIsStored: Boolean;
begin
  Result := (FOSXImageIndex <> -1);
end;

function TATFMXBindNavigatePrior._OSXShortCutIsStored: Boolean;
begin
  Result := (FOSXShortCut <> 0);
end;

function TATFMXBindNavigatePrior._OSXTextIsStored: Boolean;
begin
  Result := (NOT FOSXText.IsEmpty);
end;

function TATFMXBindNavigatePrior._WinHintIsStored: Boolean;
begin
  Result := (NOT FWindowsHint.IsEmpty);
end;

function TATFMXBindNavigatePrior._WinImgIdxIsStored: Boolean;
begin
  Result := (FWindowsImageIndex <> -1);
end;

function TATFMXBindNavigatePrior._WinShortCutIsStored: Boolean;
begin
  Result := (FWindowsShortCut <> 0);
end;

function TATFMXBindNavigatePrior._WinTextIsStored: Boolean;
begin
  Result := (NOT FWindowsText.IsEmpty);
end;
{$endregion}

{ TATFMXBindNavigateRefresh }
{$region 'TATFMXBindNavigateRefresh'}
constructor TATFMXBindNavigateRefresh.Create(AOwner: TComponent);
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

procedure TATFMXBindNavigateRefresh.Loaded;
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

        if (_LinuxHintIsStored) then
          Hint := FLinuxHint;
        if (_LinuxImgIdxIsStored) then
          ImageIndex := FLinuxImageIndex;
        if (_LinuxShortCutIsStored) then
          ShortCut := FLinuxShortCut;
        if (_LinuxTextIsStored) then
          Text := LinuxText;

      {$ELSEIF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}

        if (_OSXHintIsStored) then
          Hint := FOSXHint;
        if (_OSXImgIdxIsStored) then
          ImageIndex := FOSXImageIndex;
        if (_OSXShortCutIsStored) then
          ShortCut := FOSXShortCut;
        if (_OSXTextIsStored) then
          Text := OSXText;

      {$ELSEIF Defined(MSWINDOWS)}

        if (_WinHintIsStored) then
          Hint := FWindowsHint;
        if (_WinImgIdxIsStored) then
          ImageIndex := FWindowsImageIndex;
        if (_WinShortCutIsStored) then
          ShortCut := FWindowsShortCut;
        if (_WinTextIsStored) then
          Text := WindowsText;

      {$ENDIF}
    end;
end;

procedure TATFMXBindNavigateRefresh.SetAndroidImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateRefresh.SetAndroidText(const Value: String);
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

procedure TATFMXBindNavigateRefresh.SetiOSImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateRefresh.SetiOSText(const Value: String);
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

procedure TATFMXBindNavigateRefresh.SetLinuxHint(const Value: String);
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

procedure TATFMXBindNavigateRefresh.SetLinuxImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateRefresh.SetLinuxShortCut(Value: System.Classes.TShortCut);
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

procedure TATFMXBindNavigateRefresh.SetLinuxText(const Value: String);
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

procedure TATFMXBindNavigateRefresh.SetOSXHint(const Value: String);
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

procedure TATFMXBindNavigateRefresh.SetOSXImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateRefresh.SetOSXShortCut(Value: System.Classes.TShortCut);
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

procedure TATFMXBindNavigateRefresh.SetOSXText(const Value: String);
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

procedure TATFMXBindNavigateRefresh.SetWindowsHint(const Value: String);
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

procedure TATFMXBindNavigateRefresh.SetWindowsImageIndex(const Value: TImageIndex);
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

procedure TATFMXBindNavigateRefresh.SetWindowsShortCut(Value:
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

procedure TATFMXBindNavigateRefresh.SetWindowsText(const Value: String);
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

function TATFMXBindNavigateRefresh._AndroidImgIdxIsStored: Boolean;
begin
  Result := (FAndroidImageIndex <> -1);
end;

function TATFMXBindNavigateRefresh._AndroidTextIsStored: Boolean;
begin
  Result := (NOT FAndroidText.IsEmpty);
end;

function TATFMXBindNavigateRefresh._iOSImgIdxIsStored: Boolean;
begin
  Result := (FiOSImageIndex <> -1);
end;

function TATFMXBindNavigateRefresh._iOSTextIsStored: Boolean;
begin
  Result := (NOT FiOSText.IsEmpty);
end;

function TATFMXBindNavigateRefresh._LinuxHintIsStored: Boolean;
begin
  Result := (NOT FLinuxHint.IsEmpty);
end;

function TATFMXBindNavigateRefresh._LinuxImgIdxIsStored: Boolean;
begin
  Result := (FLinuxImageIndex <> -1);
end;

function TATFMXBindNavigateRefresh._LinuxShortCutIsStored: Boolean;
begin
  Result := (FLinuxShortCut <> 0);
end;

function TATFMXBindNavigateRefresh._LinuxTextIsStored: Boolean;
begin
  Result := (NOT FLinuxText.IsEmpty);
end;

function TATFMXBindNavigateRefresh._OSXHintIsStored: Boolean;
begin
  Result := (NOT FOSXHint.IsEmpty);
end;

function TATFMXBindNavigateRefresh._OSXImgIdxIsStored: Boolean;
begin
  Result := (FOSXImageIndex <> -1);
end;

function TATFMXBindNavigateRefresh._OSXShortCutIsStored: Boolean;
begin
  Result := (FOSXShortCut <> 0);
end;

function TATFMXBindNavigateRefresh._OSXTextIsStored: Boolean;
begin
  Result := (NOT FOSXText.IsEmpty);
end;

function TATFMXBindNavigateRefresh._WinHintIsStored: Boolean;
begin
  Result := (NOT FWindowsHint.IsEmpty);
end;

function TATFMXBindNavigateRefresh._WinImgIdxIsStored: Boolean;
begin
  Result := (FWindowsImageIndex <> -1);
end;

function TATFMXBindNavigateRefresh._WinShortCutIsStored: Boolean;
begin
  Result := (FWindowsShortCut <> 0);
end;

function TATFMXBindNavigateRefresh._WinTextIsStored: Boolean;
begin
  Result := (NOT FWindowsText.IsEmpty);
end;
{$endregion}

end.