unit AT.Fmx.Actions.MediaLibrary;

interface

uses
  System.Classes, System.UITypes, AT.Fmx.Actions.Consts, FMX.Media,
  FMX.MediaLibrary.Actions;

type
  [ComponentPlatformsAttribute(pidATActionsPlatforms)]
  TATMediaPlayerCurrentTime = class(TMediaPlayerCurrentTime)
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
    property AndroidText: String
        read FAndroidText write SetAndroidText
        stored _AndroidTextIsStored;
    property iOSText: String
        read FiOSText write SetiOSText stored _iOSTextIsStored;
    property LinuxHint: String
        read FLinuxHint write SetLinuxHint stored _LinuxHintIsStored;
    property LinuxShortCut: System.Classes.TShortCut
        read FLinuxShortCut write SetLinuxShortCut
        stored _LinuxShortCutIsStored default 0;
    property LinuxText: String
        read FLinuxText write SetLinuxText stored _LinuxTextIsStored;
    property OSXHint: String
        read FOSXHint write SetOSXHint stored _OSXHintIsStored;
    property OSXShortCut: System.Classes.TShortCut
        read FOSXShortCut write SetOSXShortCut
        stored _OSXShortCutIsStored default 0;
    property OSXText: String
        read FOSXText write SetOSXText stored _OSXTextIsStored;
    property WindowsHint: String
        read FWindowsHint write SetWindowsHint
        stored _WinHintIsStored;
    property WindowsShortCut: System.Classes.TShortCut
        read FWindowsShortCut write SetWindowsShortCut
        stored _WinShortCutIsStored default 0;
    property WindowsText: String
        read FWindowsText write SetWindowsText
        stored _WinTextIsStored;
  end;

  [ComponentPlatformsAttribute(pidATActionsPlatforms)]
  TATMediaPlayerPlayPause = class(TMediaPlayerPlayPause)
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
    property AndroidText: String
        read FAndroidText write SetAndroidText
        stored _AndroidTextIsStored;
    property iOSText: String
        read FiOSText write SetiOSText stored _iOSTextIsStored;
    property LinuxHint: String
        read FLinuxHint write SetLinuxHint stored _LinuxHintIsStored;
    property LinuxShortCut: System.Classes.TShortCut
        read FLinuxShortCut write SetLinuxShortCut
        stored _LinuxShortCutIsStored default 0;
    property LinuxText: String
        read FLinuxText write SetLinuxText stored _LinuxTextIsStored;
    property OSXHint: String
        read FOSXHint write SetOSXHint stored _OSXHintIsStored;
    property OSXShortCut: System.Classes.TShortCut
        read FOSXShortCut write SetOSXShortCut
        stored _OSXShortCutIsStored default 0;
    property OSXText: String
        read FOSXText write SetOSXText stored _OSXTextIsStored;
    property WindowsHint: String
        read FWindowsHint write SetWindowsHint
        stored _WinHintIsStored;
    property WindowsShortCut: System.Classes.TShortCut
        read FWindowsShortCut write SetWindowsShortCut
        stored _WinShortCutIsStored default 0;
    property WindowsText: String
        read FWindowsText write SetWindowsText
        stored _WinTextIsStored;
  end;

  [ComponentPlatformsAttribute(pidATActionsPlatforms)]
  TATMediaPlayerStart = class(TMediaPlayerStart)
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
    property AndroidText: String
        read FAndroidText write SetAndroidText
        stored _AndroidTextIsStored;
    property iOSText: String
        read FiOSText write SetiOSText stored _iOSTextIsStored;
    property LinuxHint: String
        read FLinuxHint write SetLinuxHint stored _LinuxHintIsStored;
    property LinuxShortCut: System.Classes.TShortCut
        read FLinuxShortCut write SetLinuxShortCut
        stored _LinuxShortCutIsStored default 0;
    property LinuxText: String
        read FLinuxText write SetLinuxText stored _LinuxTextIsStored;
    property OSXHint: String
        read FOSXHint write SetOSXHint stored _OSXHintIsStored;
    property OSXShortCut: System.Classes.TShortCut
        read FOSXShortCut write SetOSXShortCut
        stored _OSXShortCutIsStored default 0;
    property OSXText: String
        read FOSXText write SetOSXText stored _OSXTextIsStored;
    property WindowsHint: String
        read FWindowsHint write SetWindowsHint
        stored _WinHintIsStored;
    property WindowsShortCut: System.Classes.TShortCut
        read FWindowsShortCut write SetWindowsShortCut
        stored _WinShortCutIsStored default 0;
    property WindowsText: String
        read FWindowsText write SetWindowsText
        stored _WinTextIsStored;
  end;

  [ComponentPlatformsAttribute(pidATActionsPlatforms)]
  TATMediaPlayerStop = class(TMediaPlayerStop)
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
    property AndroidText: String
        read FAndroidText write SetAndroidText
        stored _AndroidTextIsStored;
    property iOSText: String
        read FiOSText write SetiOSText stored _iOSTextIsStored;
    property LinuxHint: String
        read FLinuxHint write SetLinuxHint stored _LinuxHintIsStored;
    property LinuxShortCut: System.Classes.TShortCut
        read FLinuxShortCut write SetLinuxShortCut
        stored _LinuxShortCutIsStored default 0;
    property LinuxText: String
        read FLinuxText write SetLinuxText stored _LinuxTextIsStored;
    property OSXHint: String
        read FOSXHint write SetOSXHint stored _OSXHintIsStored;
    property OSXShortCut: System.Classes.TShortCut
        read FOSXShortCut write SetOSXShortCut
        stored _OSXShortCutIsStored default 0;
    property OSXText: String
        read FOSXText write SetOSXText stored _OSXTextIsStored;
    property WindowsHint: String
        read FWindowsHint write SetWindowsHint
        stored _WinHintIsStored;
    property WindowsShortCut: System.Classes.TShortCut
        read FWindowsShortCut write SetWindowsShortCut
        stored _WinShortCutIsStored default 0;
    property WindowsText: String
        read FWindowsText write SetWindowsText
        stored _WinTextIsStored;
  end;

  [ComponentPlatformsAttribute(pidATActionsPlatforms)]
  TATMediaPlayerVolume = class(TMediaPlayerVolume)
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
    property AndroidText: String
        read FAndroidText write SetAndroidText
        stored _AndroidTextIsStored;
    property iOSText: String
        read FiOSText write SetiOSText stored _iOSTextIsStored;
    property LinuxHint: String
        read FLinuxHint write SetLinuxHint stored _LinuxHintIsStored;
    property LinuxShortCut: System.Classes.TShortCut
        read FLinuxShortCut write SetLinuxShortCut
        stored _LinuxShortCutIsStored default 0;
    property LinuxText: String
        read FLinuxText write SetLinuxText stored _LinuxTextIsStored;
    property OSXHint: String
        read FOSXHint write SetOSXHint stored _OSXHintIsStored;
    property OSXShortCut: System.Classes.TShortCut
        read FOSXShortCut write SetOSXShortCut
        stored _OSXShortCutIsStored default 0;
    property OSXText: String
        read FOSXText write SetOSXText stored _OSXTextIsStored;
    property WindowsHint: String
        read FWindowsHint write SetWindowsHint
        stored _WinHintIsStored;
    property WindowsShortCut: System.Classes.TShortCut
        read FWindowsShortCut write SetWindowsShortCut
        stored _WinShortCutIsStored default 0;
    property WindowsText: String
        read FWindowsText write SetWindowsText
        stored _WinTextIsStored;
  end;

  [ComponentPlatformsAttribute(pidATActionsPlatforms)]
  TATShowShareSheetAction = class(TShowShareSheetAction)
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
  TATTakePhotoFromCameraAction = class(TTakePhotoFromCameraAction)
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
  TATTakePhotoFromLibraryAction = class(TTakePhotoFromLibraryAction)
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


{ TATMediaPlayerCurrentTime }
{$region 'TATMediaPlayerCurrentTime'}
constructor TATMediaPlayerCurrentTime.Create(AOwner: TComponent);
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

procedure TATMediaPlayerCurrentTime.Loaded;
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

procedure TATMediaPlayerCurrentTime.SetAndroidText(const Value: String);
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

procedure TATMediaPlayerCurrentTime.SetiOSText(const Value: String);
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

procedure TATMediaPlayerCurrentTime.SetLinuxHint(const Value: String);
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

procedure TATMediaPlayerCurrentTime.SetLinuxShortCut(Value: System.Classes.TShortCut);
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

procedure TATMediaPlayerCurrentTime.SetLinuxText(const Value: String);
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

procedure TATMediaPlayerCurrentTime.SetOSXHint(const Value: String);
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

procedure TATMediaPlayerCurrentTime.SetOSXShortCut(Value: System.Classes.TShortCut);
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

procedure TATMediaPlayerCurrentTime.SetOSXText(const Value: String);
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

procedure TATMediaPlayerCurrentTime.SetWindowsHint(const Value: String);
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

procedure TATMediaPlayerCurrentTime.SetWindowsShortCut(Value:
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

procedure TATMediaPlayerCurrentTime.SetWindowsText(const Value: String);
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

function TATMediaPlayerCurrentTime._AndroidTextIsStored: Boolean;
begin
  Result := (NOT FAndroidText.IsEmpty);
end;

function TATMediaPlayerCurrentTime._iOSTextIsStored: Boolean;
begin
  Result := (NOT FiOSText.IsEmpty);
end;

function TATMediaPlayerCurrentTime._LinuxHintIsStored: Boolean;
begin
  Result := (NOT FLinuxHint.IsEmpty);
end;

function TATMediaPlayerCurrentTime._LinuxShortCutIsStored: Boolean;
begin
  Result := (FLinuxShortCut <> 0);
end;

function TATMediaPlayerCurrentTime._LinuxTextIsStored: Boolean;
begin
  Result := (NOT FLinuxText.IsEmpty);
end;

function TATMediaPlayerCurrentTime._OSXHintIsStored: Boolean;
begin
  Result := (NOT FOSXHint.IsEmpty);
end;

function TATMediaPlayerCurrentTime._OSXShortCutIsStored: Boolean;
begin
  Result := (FOSXShortCut <> 0);
end;

function TATMediaPlayerCurrentTime._OSXTextIsStored: Boolean;
begin
  Result := (NOT FOSXText.IsEmpty);
end;

function TATMediaPlayerCurrentTime._WinHintIsStored: Boolean;
begin
  Result := (NOT FWindowsHint.IsEmpty);
end;

function TATMediaPlayerCurrentTime._WinShortCutIsStored: Boolean;
begin
  Result := (FWindowsShortCut <> 0);
end;

function TATMediaPlayerCurrentTime._WinTextIsStored: Boolean;
begin
  Result := (NOT FWindowsText.IsEmpty);
end;
{$endregion}

{ TATMediaPlayerPlayPause }
{$region 'TATMediaPlayerPlayPause'}
constructor TATMediaPlayerPlayPause.Create(AOwner: TComponent);
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

procedure TATMediaPlayerPlayPause.Loaded;
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

procedure TATMediaPlayerPlayPause.SetAndroidText(const Value: String);
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

procedure TATMediaPlayerPlayPause.SetiOSText(const Value: String);
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

procedure TATMediaPlayerPlayPause.SetLinuxHint(const Value: String);
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

procedure TATMediaPlayerPlayPause.SetLinuxShortCut(Value: System.Classes.TShortCut);
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

procedure TATMediaPlayerPlayPause.SetLinuxText(const Value: String);
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

procedure TATMediaPlayerPlayPause.SetOSXHint(const Value: String);
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

procedure TATMediaPlayerPlayPause.SetOSXShortCut(Value: System.Classes.TShortCut);
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

procedure TATMediaPlayerPlayPause.SetOSXText(const Value: String);
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

procedure TATMediaPlayerPlayPause.SetWindowsHint(const Value: String);
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

procedure TATMediaPlayerPlayPause.SetWindowsShortCut(Value:
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

procedure TATMediaPlayerPlayPause.SetWindowsText(const Value: String);
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

function TATMediaPlayerPlayPause._AndroidTextIsStored: Boolean;
begin
  Result := (NOT FAndroidText.IsEmpty);
end;

function TATMediaPlayerPlayPause._iOSTextIsStored: Boolean;
begin
  Result := (NOT FiOSText.IsEmpty);
end;

function TATMediaPlayerPlayPause._LinuxHintIsStored: Boolean;
begin
  Result := (NOT FLinuxHint.IsEmpty);
end;

function TATMediaPlayerPlayPause._LinuxShortCutIsStored: Boolean;
begin
  Result := (FLinuxShortCut <> 0);
end;

function TATMediaPlayerPlayPause._LinuxTextIsStored: Boolean;
begin
  Result := (NOT FLinuxText.IsEmpty);
end;

function TATMediaPlayerPlayPause._OSXHintIsStored: Boolean;
begin
  Result := (NOT FOSXHint.IsEmpty);
end;

function TATMediaPlayerPlayPause._OSXShortCutIsStored: Boolean;
begin
  Result := (FOSXShortCut <> 0);
end;

function TATMediaPlayerPlayPause._OSXTextIsStored: Boolean;
begin
  Result := (NOT FOSXText.IsEmpty);
end;

function TATMediaPlayerPlayPause._WinHintIsStored: Boolean;
begin
  Result := (NOT FWindowsHint.IsEmpty);
end;

function TATMediaPlayerPlayPause._WinShortCutIsStored: Boolean;
begin
  Result := (FWindowsShortCut <> 0);
end;

function TATMediaPlayerPlayPause._WinTextIsStored: Boolean;
begin
  Result := (NOT FWindowsText.IsEmpty);
end;
{$endregion}

{ TATMediaPlayerStart }
{$region 'TATMediaPlayerStart'}
constructor TATMediaPlayerStart.Create(AOwner: TComponent);
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

procedure TATMediaPlayerStart.Loaded;
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

procedure TATMediaPlayerStart.SetAndroidText(const Value: String);
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

procedure TATMediaPlayerStart.SetiOSText(const Value: String);
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

procedure TATMediaPlayerStart.SetLinuxHint(const Value: String);
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

procedure TATMediaPlayerStart.SetLinuxShortCut(Value: System.Classes.TShortCut);
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

procedure TATMediaPlayerStart.SetLinuxText(const Value: String);
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

procedure TATMediaPlayerStart.SetOSXHint(const Value: String);
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

procedure TATMediaPlayerStart.SetOSXShortCut(Value: System.Classes.TShortCut);
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

procedure TATMediaPlayerStart.SetOSXText(const Value: String);
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

procedure TATMediaPlayerStart.SetWindowsHint(const Value: String);
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

procedure TATMediaPlayerStart.SetWindowsShortCut(Value:
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

procedure TATMediaPlayerStart.SetWindowsText(const Value: String);
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

function TATMediaPlayerStart._AndroidTextIsStored: Boolean;
begin
  Result := (NOT FAndroidText.IsEmpty);
end;

function TATMediaPlayerStart._iOSTextIsStored: Boolean;
begin
  Result := (NOT FiOSText.IsEmpty);
end;

function TATMediaPlayerStart._LinuxHintIsStored: Boolean;
begin
  Result := (NOT FLinuxHint.IsEmpty);
end;

function TATMediaPlayerStart._LinuxShortCutIsStored: Boolean;
begin
  Result := (FLinuxShortCut <> 0);
end;

function TATMediaPlayerStart._LinuxTextIsStored: Boolean;
begin
  Result := (NOT FLinuxText.IsEmpty);
end;

function TATMediaPlayerStart._OSXHintIsStored: Boolean;
begin
  Result := (NOT FOSXHint.IsEmpty);
end;

function TATMediaPlayerStart._OSXShortCutIsStored: Boolean;
begin
  Result := (FOSXShortCut <> 0);
end;

function TATMediaPlayerStart._OSXTextIsStored: Boolean;
begin
  Result := (NOT FOSXText.IsEmpty);
end;

function TATMediaPlayerStart._WinHintIsStored: Boolean;
begin
  Result := (NOT FWindowsHint.IsEmpty);
end;

function TATMediaPlayerStart._WinShortCutIsStored: Boolean;
begin
  Result := (FWindowsShortCut <> 0);
end;

function TATMediaPlayerStart._WinTextIsStored: Boolean;
begin
  Result := (NOT FWindowsText.IsEmpty);
end;
{$endregion}

{ TATMediaPlayerStop }
{$region 'TATMediaPlayerStop'}
constructor TATMediaPlayerStop.Create(AOwner: TComponent);
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

procedure TATMediaPlayerStop.Loaded;
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

procedure TATMediaPlayerStop.SetAndroidText(const Value: String);
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

procedure TATMediaPlayerStop.SetiOSText(const Value: String);
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

procedure TATMediaPlayerStop.SetLinuxHint(const Value: String);
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

procedure TATMediaPlayerStop.SetLinuxShortCut(Value: System.Classes.TShortCut);
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

procedure TATMediaPlayerStop.SetLinuxText(const Value: String);
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

procedure TATMediaPlayerStop.SetOSXHint(const Value: String);
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

procedure TATMediaPlayerStop.SetOSXShortCut(Value: System.Classes.TShortCut);
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

procedure TATMediaPlayerStop.SetOSXText(const Value: String);
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

procedure TATMediaPlayerStop.SetWindowsHint(const Value: String);
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

procedure TATMediaPlayerStop.SetWindowsShortCut(Value:
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

procedure TATMediaPlayerStop.SetWindowsText(const Value: String);
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

function TATMediaPlayerStop._AndroidTextIsStored: Boolean;
begin
  Result := (NOT FAndroidText.IsEmpty);
end;

function TATMediaPlayerStop._iOSTextIsStored: Boolean;
begin
  Result := (NOT FiOSText.IsEmpty);
end;

function TATMediaPlayerStop._LinuxHintIsStored: Boolean;
begin
  Result := (NOT FLinuxHint.IsEmpty);
end;

function TATMediaPlayerStop._LinuxShortCutIsStored: Boolean;
begin
  Result := (FLinuxShortCut <> 0);
end;

function TATMediaPlayerStop._LinuxTextIsStored: Boolean;
begin
  Result := (NOT FLinuxText.IsEmpty);
end;

function TATMediaPlayerStop._OSXHintIsStored: Boolean;
begin
  Result := (NOT FOSXHint.IsEmpty);
end;

function TATMediaPlayerStop._OSXShortCutIsStored: Boolean;
begin
  Result := (FOSXShortCut <> 0);
end;

function TATMediaPlayerStop._OSXTextIsStored: Boolean;
begin
  Result := (NOT FOSXText.IsEmpty);
end;

function TATMediaPlayerStop._WinHintIsStored: Boolean;
begin
  Result := (NOT FWindowsHint.IsEmpty);
end;

function TATMediaPlayerStop._WinShortCutIsStored: Boolean;
begin
  Result := (FWindowsShortCut <> 0);
end;

function TATMediaPlayerStop._WinTextIsStored: Boolean;
begin
  Result := (NOT FWindowsText.IsEmpty);
end;
{$endregion}

{ TATMediaPlayerVolume }
{$region 'TATMediaPlayerVolume'}
constructor TATMediaPlayerVolume.Create(AOwner: TComponent);
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

procedure TATMediaPlayerVolume.Loaded;
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

procedure TATMediaPlayerVolume.SetAndroidText(const Value: String);
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

procedure TATMediaPlayerVolume.SetiOSText(const Value: String);
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

procedure TATMediaPlayerVolume.SetLinuxHint(const Value: String);
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

procedure TATMediaPlayerVolume.SetLinuxShortCut(Value: System.Classes.TShortCut);
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

procedure TATMediaPlayerVolume.SetLinuxText(const Value: String);
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

procedure TATMediaPlayerVolume.SetOSXHint(const Value: String);
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

procedure TATMediaPlayerVolume.SetOSXShortCut(Value: System.Classes.TShortCut);
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

procedure TATMediaPlayerVolume.SetOSXText(const Value: String);
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

procedure TATMediaPlayerVolume.SetWindowsHint(const Value: String);
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

procedure TATMediaPlayerVolume.SetWindowsShortCut(Value:
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

procedure TATMediaPlayerVolume.SetWindowsText(const Value: String);
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

function TATMediaPlayerVolume._AndroidTextIsStored: Boolean;
begin
  Result := (NOT FAndroidText.IsEmpty);
end;

function TATMediaPlayerVolume._iOSTextIsStored: Boolean;
begin
  Result := (NOT FiOSText.IsEmpty);
end;

function TATMediaPlayerVolume._LinuxHintIsStored: Boolean;
begin
  Result := (NOT FLinuxHint.IsEmpty);
end;

function TATMediaPlayerVolume._LinuxShortCutIsStored: Boolean;
begin
  Result := (FLinuxShortCut <> 0);
end;

function TATMediaPlayerVolume._LinuxTextIsStored: Boolean;
begin
  Result := (NOT FLinuxText.IsEmpty);
end;

function TATMediaPlayerVolume._OSXHintIsStored: Boolean;
begin
  Result := (NOT FOSXHint.IsEmpty);
end;

function TATMediaPlayerVolume._OSXShortCutIsStored: Boolean;
begin
  Result := (FOSXShortCut <> 0);
end;

function TATMediaPlayerVolume._OSXTextIsStored: Boolean;
begin
  Result := (NOT FOSXText.IsEmpty);
end;

function TATMediaPlayerVolume._WinHintIsStored: Boolean;
begin
  Result := (NOT FWindowsHint.IsEmpty);
end;

function TATMediaPlayerVolume._WinShortCutIsStored: Boolean;
begin
  Result := (FWindowsShortCut <> 0);
end;

function TATMediaPlayerVolume._WinTextIsStored: Boolean;
begin
  Result := (NOT FWindowsText.IsEmpty);
end;
{$endregion}

{ TATShowShareSheetAction }
{$region 'TATShowShareSheetAction'}
constructor TATShowShareSheetAction.Create(AOwner: TComponent);
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

procedure TATShowShareSheetAction.Loaded;
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

procedure TATShowShareSheetAction.SetAndroidImageIndex(const Value: TImageIndex);
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

procedure TATShowShareSheetAction.SetAndroidText(const Value: String);
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

procedure TATShowShareSheetAction.SetiOSImageIndex(const Value: TImageIndex);
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

procedure TATShowShareSheetAction.SetiOSText(const Value: String);
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

procedure TATShowShareSheetAction.SetLinuxHint(const Value: String);
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

procedure TATShowShareSheetAction.SetLinuxImageIndex(const Value: TImageIndex);
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

procedure TATShowShareSheetAction.SetLinuxShortCut(Value: System.Classes.TShortCut);
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

procedure TATShowShareSheetAction.SetLinuxText(const Value: String);
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

procedure TATShowShareSheetAction.SetOSXHint(const Value: String);
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

procedure TATShowShareSheetAction.SetOSXImageIndex(const Value: TImageIndex);
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

procedure TATShowShareSheetAction.SetOSXShortCut(Value: System.Classes.TShortCut);
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

procedure TATShowShareSheetAction.SetOSXText(const Value: String);
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

procedure TATShowShareSheetAction.SetWindowsHint(const Value: String);
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

procedure TATShowShareSheetAction.SetWindowsImageIndex(const Value: TImageIndex);
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

procedure TATShowShareSheetAction.SetWindowsShortCut(Value:
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

procedure TATShowShareSheetAction.SetWindowsText(const Value: String);
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

function TATShowShareSheetAction._AndroidImgIdxIsStored: Boolean;
begin
  Result := (FAndroidImageIndex <> -1);
end;

function TATShowShareSheetAction._AndroidTextIsStored: Boolean;
begin
  Result := (NOT FAndroidText.IsEmpty);
end;

function TATShowShareSheetAction._iOSImgIdxIsStored: Boolean;
begin
  Result := (FiOSImageIndex <> -1);
end;

function TATShowShareSheetAction._iOSTextIsStored: Boolean;
begin
  Result := (NOT FiOSText.IsEmpty);
end;

function TATShowShareSheetAction._LinuxHintIsStored: Boolean;
begin
  Result := (NOT FLinuxHint.IsEmpty);
end;

function TATShowShareSheetAction._LinuxImgIdxIsStored: Boolean;
begin
  Result := (FLinuxImageIndex <> -1);
end;

function TATShowShareSheetAction._LinuxShortCutIsStored: Boolean;
begin
  Result := (FLinuxShortCut <> 0);
end;

function TATShowShareSheetAction._LinuxTextIsStored: Boolean;
begin
  Result := (NOT FLinuxText.IsEmpty);
end;

function TATShowShareSheetAction._OSXHintIsStored: Boolean;
begin
  Result := (NOT FOSXHint.IsEmpty);
end;

function TATShowShareSheetAction._OSXImgIdxIsStored: Boolean;
begin
  Result := (FOSXImageIndex <> -1);
end;

function TATShowShareSheetAction._OSXShortCutIsStored: Boolean;
begin
  Result := (FOSXShortCut <> 0);
end;

function TATShowShareSheetAction._OSXTextIsStored: Boolean;
begin
  Result := (NOT FOSXText.IsEmpty);
end;

function TATShowShareSheetAction._WinHintIsStored: Boolean;
begin
  Result := (NOT FWindowsHint.IsEmpty);
end;

function TATShowShareSheetAction._WinImgIdxIsStored: Boolean;
begin
  Result := (FWindowsImageIndex <> -1);
end;

function TATShowShareSheetAction._WinShortCutIsStored: Boolean;
begin
  Result := (FWindowsShortCut <> 0);
end;

function TATShowShareSheetAction._WinTextIsStored: Boolean;
begin
  Result := (NOT FWindowsText.IsEmpty);
end;
{$endregion}

{ TATTakePhotoFromCameraAction }
{$region 'TATTakePhotoFromCameraAction'}
constructor TATTakePhotoFromCameraAction.Create(AOwner: TComponent);
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

procedure TATTakePhotoFromCameraAction.Loaded;
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

procedure TATTakePhotoFromCameraAction.SetAndroidImageIndex(const Value: TImageIndex);
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

procedure TATTakePhotoFromCameraAction.SetAndroidText(const Value: String);
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

procedure TATTakePhotoFromCameraAction.SetiOSImageIndex(const Value: TImageIndex);
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

procedure TATTakePhotoFromCameraAction.SetiOSText(const Value: String);
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

procedure TATTakePhotoFromCameraAction.SetLinuxHint(const Value: String);
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

procedure TATTakePhotoFromCameraAction.SetLinuxImageIndex(const Value: TImageIndex);
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

procedure TATTakePhotoFromCameraAction.SetLinuxShortCut(Value: System.Classes.TShortCut);
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

procedure TATTakePhotoFromCameraAction.SetLinuxText(const Value: String);
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

procedure TATTakePhotoFromCameraAction.SetOSXHint(const Value: String);
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

procedure TATTakePhotoFromCameraAction.SetOSXImageIndex(const Value: TImageIndex);
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

procedure TATTakePhotoFromCameraAction.SetOSXShortCut(Value: System.Classes.TShortCut);
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

procedure TATTakePhotoFromCameraAction.SetOSXText(const Value: String);
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

procedure TATTakePhotoFromCameraAction.SetWindowsHint(const Value: String);
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

procedure TATTakePhotoFromCameraAction.SetWindowsImageIndex(const Value: TImageIndex);
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

procedure TATTakePhotoFromCameraAction.SetWindowsShortCut(Value:
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

procedure TATTakePhotoFromCameraAction.SetWindowsText(const Value: String);
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

function TATTakePhotoFromCameraAction._AndroidImgIdxIsStored: Boolean;
begin
  Result := (FAndroidImageIndex <> -1);
end;

function TATTakePhotoFromCameraAction._AndroidTextIsStored: Boolean;
begin
  Result := (NOT FAndroidText.IsEmpty);
end;

function TATTakePhotoFromCameraAction._iOSImgIdxIsStored: Boolean;
begin
  Result := (FiOSImageIndex <> -1);
end;

function TATTakePhotoFromCameraAction._iOSTextIsStored: Boolean;
begin
  Result := (NOT FiOSText.IsEmpty);
end;

function TATTakePhotoFromCameraAction._LinuxHintIsStored: Boolean;
begin
  Result := (NOT FLinuxHint.IsEmpty);
end;

function TATTakePhotoFromCameraAction._LinuxImgIdxIsStored: Boolean;
begin
  Result := (FLinuxImageIndex <> -1);
end;

function TATTakePhotoFromCameraAction._LinuxShortCutIsStored: Boolean;
begin
  Result := (FLinuxShortCut <> 0);
end;

function TATTakePhotoFromCameraAction._LinuxTextIsStored: Boolean;
begin
  Result := (NOT FLinuxText.IsEmpty);
end;

function TATTakePhotoFromCameraAction._OSXHintIsStored: Boolean;
begin
  Result := (NOT FOSXHint.IsEmpty);
end;

function TATTakePhotoFromCameraAction._OSXImgIdxIsStored: Boolean;
begin
  Result := (FOSXImageIndex <> -1);
end;

function TATTakePhotoFromCameraAction._OSXShortCutIsStored: Boolean;
begin
  Result := (FOSXShortCut <> 0);
end;

function TATTakePhotoFromCameraAction._OSXTextIsStored: Boolean;
begin
  Result := (NOT FOSXText.IsEmpty);
end;

function TATTakePhotoFromCameraAction._WinHintIsStored: Boolean;
begin
  Result := (NOT FWindowsHint.IsEmpty);
end;

function TATTakePhotoFromCameraAction._WinImgIdxIsStored: Boolean;
begin
  Result := (FWindowsImageIndex <> -1);
end;

function TATTakePhotoFromCameraAction._WinShortCutIsStored: Boolean;
begin
  Result := (FWindowsShortCut <> 0);
end;

function TATTakePhotoFromCameraAction._WinTextIsStored: Boolean;
begin
  Result := (NOT FWindowsText.IsEmpty);
end;
{$endregion}

{ TATTakePhotoFromLibraryAction }
{$region 'TATTakePhotoFromLibraryAction'}
constructor TATTakePhotoFromLibraryAction.Create(AOwner: TComponent);
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

procedure TATTakePhotoFromLibraryAction.Loaded;
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

procedure TATTakePhotoFromLibraryAction.SetAndroidImageIndex(const Value: TImageIndex);
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

procedure TATTakePhotoFromLibraryAction.SetAndroidText(const Value: String);
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

procedure TATTakePhotoFromLibraryAction.SetiOSImageIndex(const Value: TImageIndex);
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

procedure TATTakePhotoFromLibraryAction.SetiOSText(const Value: String);
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

procedure TATTakePhotoFromLibraryAction.SetLinuxHint(const Value: String);
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

procedure TATTakePhotoFromLibraryAction.SetLinuxImageIndex(const Value: TImageIndex);
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

procedure TATTakePhotoFromLibraryAction.SetLinuxShortCut(Value: System.Classes.TShortCut);
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

procedure TATTakePhotoFromLibraryAction.SetLinuxText(const Value: String);
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

procedure TATTakePhotoFromLibraryAction.SetOSXHint(const Value: String);
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

procedure TATTakePhotoFromLibraryAction.SetOSXImageIndex(const Value: TImageIndex);
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

procedure TATTakePhotoFromLibraryAction.SetOSXShortCut(Value: System.Classes.TShortCut);
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

procedure TATTakePhotoFromLibraryAction.SetOSXText(const Value: String);
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

procedure TATTakePhotoFromLibraryAction.SetWindowsHint(const Value: String);
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

procedure TATTakePhotoFromLibraryAction.SetWindowsImageIndex(const Value: TImageIndex);
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

procedure TATTakePhotoFromLibraryAction.SetWindowsShortCut(Value:
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

procedure TATTakePhotoFromLibraryAction.SetWindowsText(const Value: String);
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

function TATTakePhotoFromLibraryAction._AndroidImgIdxIsStored: Boolean;
begin
  Result := (FAndroidImageIndex <> -1);
end;

function TATTakePhotoFromLibraryAction._AndroidTextIsStored: Boolean;
begin
  Result := (NOT FAndroidText.IsEmpty);
end;

function TATTakePhotoFromLibraryAction._iOSImgIdxIsStored: Boolean;
begin
  Result := (FiOSImageIndex <> -1);
end;

function TATTakePhotoFromLibraryAction._iOSTextIsStored: Boolean;
begin
  Result := (NOT FiOSText.IsEmpty);
end;

function TATTakePhotoFromLibraryAction._LinuxHintIsStored: Boolean;
begin
  Result := (NOT FLinuxHint.IsEmpty);
end;

function TATTakePhotoFromLibraryAction._LinuxImgIdxIsStored: Boolean;
begin
  Result := (FLinuxImageIndex <> -1);
end;

function TATTakePhotoFromLibraryAction._LinuxShortCutIsStored: Boolean;
begin
  Result := (FLinuxShortCut <> 0);
end;

function TATTakePhotoFromLibraryAction._LinuxTextIsStored: Boolean;
begin
  Result := (NOT FLinuxText.IsEmpty);
end;

function TATTakePhotoFromLibraryAction._OSXHintIsStored: Boolean;
begin
  Result := (NOT FOSXHint.IsEmpty);
end;

function TATTakePhotoFromLibraryAction._OSXImgIdxIsStored: Boolean;
begin
  Result := (FOSXImageIndex <> -1);
end;

function TATTakePhotoFromLibraryAction._OSXShortCutIsStored: Boolean;
begin
  Result := (FOSXShortCut <> 0);
end;

function TATTakePhotoFromLibraryAction._OSXTextIsStored: Boolean;
begin
  Result := (NOT FOSXText.IsEmpty);
end;

function TATTakePhotoFromLibraryAction._WinHintIsStored: Boolean;
begin
  Result := (NOT FWindowsHint.IsEmpty);
end;

function TATTakePhotoFromLibraryAction._WinImgIdxIsStored: Boolean;
begin
  Result := (FWindowsImageIndex <> -1);
end;

function TATTakePhotoFromLibraryAction._WinShortCutIsStored: Boolean;
begin
  Result := (FWindowsShortCut <> 0);
end;

function TATTakePhotoFromLibraryAction._WinTextIsStored: Boolean;
begin
  Result := (NOT FWindowsText.IsEmpty);
end;
{$endregion}



end.