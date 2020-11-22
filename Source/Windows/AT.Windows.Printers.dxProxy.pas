unit AT.Windows.Printers.dxProxy;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Printers, Vcl.Graphics,
  dxPrnDev,
  Spring, Spring.Collections;

type
  TATdxPrintProxy = class( TPrinter )
  strict protected
    function GetAborted: Boolean;
    function GetAutoRefresh: Boolean;
    function GetBinIndex: Integer;
    function GetBins: TStrings;
    function GetCanvas: TCanvas;
    function GetCapabilities: TPrinterCapabilities;
    function GetCollate: Boolean;
    function GetColorMode: Boolean;
    function GetCopies: Integer;
    function GetCurrentDevice: PChar;
    function GetCurrentDriver: PChar;
    function GetCurrentPort: PChar;
    function GetDefaultDMPaper: Integer;
    function GetDeviceMode: PDeviceMode;
    function GetDuplex: TdxDuplexMode;
    function GetFileName: string;
    function GetFonts: TStrings;
    function GetHandle: HDC;
    function GetHDeviceMode: THandle;
    function GetIsDefault: Boolean;
    function GetIsDeviceModePersistent: Boolean;
    function GetIsInitialized: Boolean;
    function GetIsNetwork: Boolean;
    function GetMaxCopies: LongInt;
    function GetMaxExtentX: Integer;
    function GetMaxExtentY: Integer;
    function GetMinExtentX: Integer;
    function GetMinExtentY: Integer;
    function GetOnNewPage: TNotifyEvent;
    function GetOnPrinterChange: TNotifyEvent;
    function GetOnRefresh: TNotifyEvent;
    function GetOrientation: TPrinterOrientation;
    function GetPageHeight: Integer;
    function GetPageHeightLoMetric: Integer;
    function GetPageNumber: Integer;
    function GetPageWidth: Integer;
    function GetPageWidthLoMetric: Integer;
    function GetPaperCount: Integer;
    function GetPaperIndex: Integer;
    function GetPapers: TStrings;
    function GetPhysOffsetX: Integer;
    function GetPhysOffsetY: Integer;
    function GetPrinterCount: Integer;
    function GetPrinterIndex: Integer;
    function GetPrinterInfos( Index: Integer ): TdxPrintDeviceInfo;
    function GetPrinters: TStrings;
    function GetPrinting: Boolean;
    function GetTitle: string;
    procedure SetAutoRefresh( const Value: Boolean );
    procedure SetBinIndex( const Value: Integer );
    procedure SetCollate( const Value: Boolean );
    procedure SetColorMode( const Value: Boolean );
    procedure SetCopies( const Value: Integer );
    procedure SetDuplex( const Value: TdxDuplexMode );
    procedure SetFileName( const Value: string );
    procedure SetIsDefault( const Value: Boolean );
    procedure SetIsDeviceModePersistent( const Value: Boolean );
    procedure SetOnNewPage( const Value: TNotifyEvent );
    procedure SetOnPrinterChange( const Value: TNotifyEvent );
    procedure SetOnRefresh( const Value: TNotifyEvent );
    procedure SetOrientation( const Value: TPrinterOrientation );
    procedure SetPaperIndex( const Value: Integer );
    procedure SetPrinterIndex( const Value: Integer );
    procedure SetTitle( const Value: string );
  public
    procedure Abort; reintroduce;
    function BeginDoc: Integer; reintroduce; overload;
    procedure EndDoc; reintroduce;
    function FindBin( ABin: Integer ): Integer; overload;
    function FindBin( const AName: string ): Integer; overload;
    function FindPaper( ADMPaper: Integer ): Integer; overload;
    function FindPaper( AWidth, AHeight: Integer ): Integer; overload;
    function FindPaper( const AName: string ): Integer; overload;
    function FindPaper( const ASize: TPoint ): Integer; overload;
    function FindPrintDevice( ADevice, APort: PChar ): Integer;
    function IsAutoSelectBin( AIndex: Integer ): Boolean;
    function IsDeviceModeChanged: Boolean;
    function IsEnvelopePaper( AIndex: Integer ): Boolean;
    function IsSupportColoration: Boolean;
    function IsSupportDuplex: Boolean;
    function IsUserPaperSize( AIndex: Integer ): Boolean;
    function IsUserPaperSource( AIndex: Integer ): Boolean;
    procedure NewPage; reintroduce;
    procedure Refresh; reintroduce;
    procedure ResetDC( IsForced: Boolean );
    procedure ResetPrintDevice;
    function SelectBin( Value: Integer ): Boolean; overload;
    function SelectBin( const AName: string ): Boolean; overload;
    function SelectPaper( ADMPaper: Integer ): Boolean; overload;
    function SelectPaper( var AWidth, AHeight: Integer )
        : Boolean; overload;
    function SelectPaper( const AName: string ): Boolean; overload;
    property  Aborted: Boolean
        read  GetAborted;
    property  AutoRefresh: Boolean
        read  GetAutoRefresh
        write SetAutoRefresh;
    property  BinIndex: Integer
        read  GetBinIndex
        write SetBinIndex;
    property  Bins: TStrings
        read  GetBins;
    property  Canvas: TCanvas
        read  GetCanvas;
    property  Capabilities: TPrinterCapabilities
        read  GetCapabilities;
    property  Collate: Boolean
        read  GetCollate
        write SetCollate;
    property  ColorMode: Boolean
        read  GetColorMode
        write SetColorMode;
    property  Copies: Integer
        read  GetCopies
        write SetCopies;
    property  CurrentDevice: PChar
        read  GetCurrentDevice;
    property  CurrentDriver: PChar
        read  GetCurrentDriver;
    property  CurrentPort: PChar
        read  GetCurrentPort;
    property  DefaultDMPaper: Integer
        read  GetDefaultDMPaper;
    property  DeviceMode: PDeviceMode
        read  GetDeviceMode;
    property  Duplex: TdxDuplexMode
        read  GetDuplex
        write SetDuplex;
    property  FileName: string
        read  GetFileName
        write SetFileName;
    property  Fonts: TStrings
        read  GetFonts;
    property  Handle: HDC
        read  GetHandle;
    property  HDeviceMode: THandle
        read  GetHDeviceMode;
    property  IsDefault: Boolean
        read  GetIsDefault
        write SetIsDefault;
    property  IsDeviceModePersistent: Boolean
        read  GetIsDeviceModePersistent
        write SetIsDeviceModePersistent;
    property  IsInitialized: Boolean
        read  GetIsInitialized;
    property  IsNetwork: Boolean
        read  GetIsNetwork;
    property  MaxCopies: LongInt
        read  GetMaxCopies;
    property  MaxExtentX: Integer
        read  GetMaxExtentX;
    property  MaxExtentY: Integer
        read  GetMaxExtentY;
    property  MinExtentX: Integer
        read  GetMinExtentX;
    property  MinExtentY: Integer
        read  GetMinExtentY;
    property  Orientation: TPrinterOrientation
        read  GetOrientation
        write SetOrientation;
    property  PageHeight: Integer
        read  GetPageHeight;
    property  PageHeightLoMetric: Integer
        read  GetPageHeightLoMetric;
    property  PageNumber: Integer
        read  GetPageNumber;
    property  PageWidth: Integer
        read  GetPageWidth;
    property  PageWidthLoMetric: Integer
        read  GetPageWidthLoMetric;
    property  PaperCount: Integer
        read  GetPaperCount;
    property  PaperIndex: Integer
        read  GetPaperIndex
        write SetPaperIndex;
    property  Papers: TStrings
        read  GetPapers;
    property  PhysOffsetX: Integer
        read  GetPhysOffsetX;
    property  PhysOffsetY: Integer
        read  GetPhysOffsetY;
    property  PrinterCount: Integer
        read  GetPrinterCount;
    property  PrinterIndex: Integer
        read  GetPrinterIndex
        write SetPrinterIndex;
    property  PrinterInfos[ Index: Integer ]: TdxPrintDeviceInfo
        read  GetPrinterInfos;
    property  Printers: TStrings
        read  GetPrinters;
    property  Printing: Boolean
        read  GetPrinting;
    property  Title: string
        read  GetTitle
        write SetTitle;
    property  OnNewPage: TNotifyEvent
        read  GetOnNewPage
        write SetOnNewPage;
    property  OnPrinterChange: TNotifyEvent
        read  GetOnPrinterChange
        write SetOnPrinterChange;
    property  OnRefresh: TNotifyEvent
        read  GetOnRefresh
        write SetOnRefresh;
  end;

function ATdxPrintProxy: TATdxPrintProxy;
function Printer: TATdxPrintProxy;

implementation

uses
  System.SysUtils, System.UITypes,
  AT.GarbageCollector;

var
  gPrintProxy: TATdxPrintProxy;

function ATdxPrintProxy: TATdxPrintProxy;
begin

  if ( NOT Assigned( gPrintProxy ) ) then
    gPrintProxy := TATdxPrintProxy.Create;

  Result := gPrintProxy;

end;

function Printer: TATdxPrintProxy;
begin
  Result := ATdxPrintProxy;
end;


procedure TATdxPrintProxy.Abort;
begin

  dxPrintDevice.Abort;

end;

function TATdxPrintProxy.BeginDoc: Integer;
begin

  Result := dxPrintDevice.BeginDoc;

end;

procedure TATdxPrintProxy.EndDoc;
begin

  dxPrintDevice.EndDoc;

end;

function TATdxPrintProxy.FindBin( ABin: Integer ): Integer;
begin

  Result := dxPrintDevice.FindBin( ABin );

end;

function TATdxPrintProxy.FindBin( const AName: string ): Integer;
begin

  Result := dxPrintDevice.FindBin( AName );

end;

function TATdxPrintProxy.FindPaper( ADMPaper: Integer ): Integer;
begin

  Result := dxPrintDevice.FindPaper( ADMPaper );

end;

function TATdxPrintProxy.FindPaper( AWidth,
  AHeight: Integer ): Integer;
begin

  Result := dxPrintDevice.FindPaper( AWidth, AHeight );

end;

function TATdxPrintProxy.FindPaper( const AName: string ): Integer;
begin

  Result := dxPrintDevice.FindPaper( AName );

end;

function TATdxPrintProxy.FindPaper( const ASize: TPoint ): Integer;
begin

  Result := dxPrintDevice.FindPaper( ASize );

end;

function TATdxPrintProxy.FindPrintDevice( ADevice,
  APort: PChar ): Integer;
begin

  Result := dxPrintDevice.FindPrintDevice( ADevice, APort );

end;

function TATdxPrintProxy.GetAborted: Boolean;
begin

  Result := dxPrintDevice.Aborted;

end;

function TATdxPrintProxy.GetAutoRefresh: Boolean;
begin

  Result := dxPrintDevice.AutoRefresh;

end;

function TATdxPrintProxy.GetBinIndex: Integer;
begin

  Result := dxPrintDevice.BinIndex;

end;

function TATdxPrintProxy.GetBins: TStrings;
begin

  Result := dxPrintDevice.Bins;

end;

function TATdxPrintProxy.GetCanvas: TCanvas;
begin

  Result := dxPrintDevice.Canvas;

end;

function TATdxPrintProxy.GetCapabilities: TPrinterCapabilities;
var
  AdxCaps: TdxPrinterCapabilities;
begin

  Result := [ ];

  AdxCaps := dxPrintDevice.Capabilities;

  if ( TdxPrinterCapability.pcCopies IN AdxCaps ) then
    Include( Result, TPrinterCapability.pcCopies );

  if ( TdxPrinterCapability.pcOrientation IN AdxCaps ) then
    Include( Result, TPrinterCapability.pcOrientation );

  if ( TdxPrinterCapability.pcCollation IN AdxCaps ) then
    Include( Result, TPrinterCapability.pcCollation );

end;

function TATdxPrintProxy.GetCollate: Boolean;
begin

  Result := dxPrintDevice.Collate;

end;

function TATdxPrintProxy.GetColorMode: Boolean;
begin

  Result := dxPrintDevice.ColorMode;

end;

function TATdxPrintProxy.GetCopies: Integer;
begin

  Result := dxPrintDevice.Copies;

end;

function TATdxPrintProxy.GetCurrentDevice: PChar;
begin

  Result := dxPrintDevice.CurrentDevice;

end;

function TATdxPrintProxy.GetCurrentDriver: PChar;
begin

  Result := dxPrintDevice.CurrentDriver;

end;

function TATdxPrintProxy.GetCurrentPort: PChar;
begin

  Result := dxPrintDevice.CurrentPort;

end;

function TATdxPrintProxy.GetDefaultDMPaper: Integer;
begin

  Result := dxPrintDevice.DefaultDMPaper;

end;

function TATdxPrintProxy.GetDeviceMode: PDeviceMode;
begin

  Result := dxPrintDevice.DeviceMode;

end;

function TATdxPrintProxy.GetDuplex: TdxDuplexMode;
begin

  Result := dxPrintDevice.Duplex;

end;

function TATdxPrintProxy.GetFileName: string;
begin

  Result := dxPrintDevice.FileName;

end;

function TATdxPrintProxy.GetFonts: TStrings;
begin

  Result := dxPrintDevice.Fonts;

end;

function TATdxPrintProxy.GetHandle: HDC;
begin

  Result := dxPrintDevice.Handle;

end;

function TATdxPrintProxy.GetHDeviceMode: THandle;
begin

  Result := dxPrintDevice.HDeviceMode;

end;

function TATdxPrintProxy.GetIsDefault: Boolean;
begin

  Result := dxPrintDevice.IsDefault;

end;

function TATdxPrintProxy.GetIsDeviceModePersistent: Boolean;
begin

  Result := dxPrintDevice.IsDeviceModePersistent;

end;

function TATdxPrintProxy.GetIsInitialized: Boolean;
begin

  Result := dxPrintDevice.IsInitialized;

end;

function TATdxPrintProxy.GetIsNetwork: Boolean;
begin

  Result := dxPrintDevice.IsNetwork;

end;

function TATdxPrintProxy.GetMaxCopies: LongInt;
begin

  Result := dxPrintDevice.MaxCopies;

end;

function TATdxPrintProxy.GetMaxExtentX: Integer;
begin

  Result := dxPrintDevice.MaxExtentX;

end;

function TATdxPrintProxy.GetMaxExtentY: Integer;
begin

  Result := dxPrintDevice.MaxExtentY;

end;

function TATdxPrintProxy.GetMinExtentX: Integer;
begin

  Result := dxPrintDevice.MinExtentX;

end;

function TATdxPrintProxy.GetMinExtentY: Integer;
begin

  Result := dxPrintDevice.MinExtentY;

end;

function TATdxPrintProxy.GetOnNewPage: TNotifyEvent;
begin

  Result := dxPrintDevice.OnNewPage;

end;

function TATdxPrintProxy.GetOnPrinterChange: TNotifyEvent;
begin

  Result := dxPrintDevice.OnPrinterChange;

end;

function TATdxPrintProxy.GetOnRefresh: TNotifyEvent;
begin

  Result := dxPrintDevice.OnRefresh;

end;

function TATdxPrintProxy.GetOrientation: TPrinterOrientation;
var
  AOrient: TPrinterOrientation;
begin

  case dxPrintDevice.Orientation of
    TdxPrinterOrientation.poPortrait:
      AOrient := TPrinterOrientation.poPortrait;

    TdxPrinterOrientation.poLandscape:
      AOrient := TPrinterOrientation.poLandscape;

  else
    AOrient := TPrinterOrientation.poPortrait;
  end;

  Result := AOrient;

end;

function TATdxPrintProxy.GetPageHeight: Integer;
begin

  Result := dxPrintDevice.PageHeight;

end;

function TATdxPrintProxy.GetPageHeightLoMetric: Integer;
begin

  Result := dxPrintDevice.PageHeightLoMetric;

end;

function TATdxPrintProxy.GetPageNumber: Integer;
begin

  Result := dxPrintDevice.PageNumber;

end;

function TATdxPrintProxy.GetPageWidth: Integer;
begin

  Result := dxPrintDevice.PageWidth;

end;

function TATdxPrintProxy.GetPageWidthLoMetric: Integer;
begin

  Result := dxPrintDevice.PageWidthLoMetric;

end;

function TATdxPrintProxy.GetPaperCount: Integer;
begin

  Result := dxPrintDevice.PaperCount;

end;

function TATdxPrintProxy.GetPaperIndex: Integer;
begin

  Result := dxPrintDevice.PaperIndex;

end;

function TATdxPrintProxy.GetPapers: TStrings;
begin

  Result := dxPrintDevice.Papers;

end;

function TATdxPrintProxy.GetPhysOffsetX: Integer;
begin

  Result := dxPrintDevice.PhysOffsetX;

end;

function TATdxPrintProxy.GetPhysOffsetY: Integer;
begin

  Result := dxPrintDevice.PhysOffsetY;

end;

function TATdxPrintProxy.GetPrinterCount: Integer;
begin

  Result := dxPrintDevice.PrinterCount;

end;

function TATdxPrintProxy.GetPrinterIndex: Integer;
begin

  Result := dxPrintDevice.PrinterIndex;

end;

function TATdxPrintProxy.GetPrinterInfos( Index: Integer )
    : TdxPrintDeviceInfo;
begin

  Result := dxPrintDevice.PrinterInfos[ Index ];

end;

function TATdxPrintProxy.GetPrinters: TStrings;
begin

  Result := dxPrintDevice.Printers;

end;

function TATdxPrintProxy.GetPrinting: Boolean;
begin

  Result := dxPrintDevice.Printing;

end;

function TATdxPrintProxy.GetTitle: string;
begin

  Result := dxPrintDevice.Title;

end;

function TATdxPrintProxy.IsAutoSelectBin( AIndex: Integer ): Boolean;
begin

  Result := dxPrintDevice.IsAutoSelectBin( AIndex );

end;

function TATdxPrintProxy.IsDeviceModeChanged: Boolean;
begin

  Result := dxPrintDevice.IsDeviceModeChanged;

end;

function TATdxPrintProxy.IsEnvelopePaper( AIndex: Integer ): Boolean;
begin

  Result := dxPrintDevice.IsEnvelopePaper( AIndex );

end;

function TATdxPrintProxy.IsSupportColoration: Boolean;
begin

  Result := dxPrintDevice.IsSupportColoration;

end;

function TATdxPrintProxy.IsSupportDuplex: Boolean;
begin

  Result := dxPrintDevice.IsSupportDuplex;

end;

function TATdxPrintProxy.IsUserPaperSize( AIndex: Integer ): Boolean;
begin

  Result := dxPrintDevice.IsUserPaperSize( AIndex );

end;

function TATdxPrintProxy.IsUserPaperSource( AIndex: Integer )
    : Boolean;
begin

  Result := dxPrintDevice.IsUserPaperSource( AIndex );

end;

procedure TATdxPrintProxy.NewPage;
begin

  dxPrintDevice.NewPage;

end;

procedure TATdxPrintProxy.Refresh;
begin

  dxPrintDevice.Refresh;

end;

procedure TATdxPrintProxy.ResetDC( IsForced: Boolean );
begin

  dxPrintDevice.ResetDC( IsForced );

end;

procedure TATdxPrintProxy.ResetPrintDevice;
begin

  dxPrintDevice.ResetPrintDevice;

end;

function TATdxPrintProxy.SelectBin( Value: Integer ): Boolean;
begin

  Result := dxPrintDevice.SelectBin( Value );

end;

function TATdxPrintProxy.SelectBin( const AName: string ): Boolean;
begin

  Result := dxPrintDevice.SelectBin( AName );

end;

function TATdxPrintProxy.SelectPaper( ADMPaper: Integer ): Boolean;
begin

  Result := dxPrintDevice.SelectPaper( ADMPaper );

end;

function TATdxPrintProxy.SelectPaper( var AWidth,
  AHeight: Integer ): Boolean;
begin

  Result := dxPrintDevice.SelectPaper( AWidth, AHeight );

end;

function TATdxPrintProxy.SelectPaper( const AName: string ): Boolean;
begin

  Result := dxPrintDevice.SelectPaper( AName );

end;

procedure TATdxPrintProxy.SetAutoRefresh( const Value: Boolean );
begin

  dxPrintDevice.AutoRefresh := Value;

end;

procedure TATdxPrintProxy.SetBinIndex( const Value: Integer );
begin

  dxPrintDevice.BinIndex := Value;

end;

procedure TATdxPrintProxy.SetCollate( const Value: Boolean );
begin

  dxPrintDevice.Collate := Value;

end;

procedure TATdxPrintProxy.SetColorMode( const Value: Boolean );
begin

  dxPrintDevice.ColorMode := Value;

end;

procedure TATdxPrintProxy.SetCopies( const Value: Integer );
begin

  dxPrintDevice.Copies := Value;

end;

procedure TATdxPrintProxy.SetDuplex( const Value: TdxDuplexMode );
begin

  dxPrintDevice.Duplex := Value;

end;

procedure TATdxPrintProxy.SetFileName( const Value: string );
begin

  dxPrintDevice.FileName := Value;

end;

procedure TATdxPrintProxy.SetIsDefault( const Value: Boolean );
begin

  dxPrintDevice.IsDefault := Value;

end;

procedure TATdxPrintProxy.SetIsDeviceModePersistent( const Value
      : Boolean );
begin

  dxPrintDevice.IsDeviceModePersistent := Value;

end;

procedure TATdxPrintProxy.SetOnNewPage( const Value: TNotifyEvent );
begin

  dxPrintDevice.OnNewPage := Value;

end;

procedure TATdxPrintProxy.SetOnPrinterChange( const Value
      : TNotifyEvent );
begin

  dxPrintDevice.OnPrinterChange := Value;

end;

procedure TATdxPrintProxy.SetOnRefresh( const Value: TNotifyEvent );
begin

  dxPrintDevice.OnRefresh := Value;

end;

procedure TATdxPrintProxy.SetOrientation( const Value
      : TPrinterOrientation );
var
  AOrient: TdxPrinterOrientation;
begin

  case Value of
    TPrinterOrientation.poPortrait:
      AOrient := TdxPrinterOrientation.poPortrait;

    TPrinterOrientation.poLandscape:
      AOrient := TdxPrinterOrientation.poLandscape;

  else

    exit;

  end;

  dxPrintDevice.Orientation := AOrient;

end;

procedure TATdxPrintProxy.SetPaperIndex( const Value: Integer );
begin

  dxPrintDevice.PaperIndex := Value;

end;

procedure TATdxPrintProxy.SetPrinterIndex( const Value: Integer );
begin

  dxPrintDevice.PrinterIndex := Value;

end;

procedure TATdxPrintProxy.SetTitle( const Value: string );
begin

  dxPrintDevice.Title := Value;

end;


end.
