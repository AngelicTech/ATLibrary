// ******************************************************************
//
// Program Name   : Angelic Tech Library
// Platform(s)    : Windows
// Framework      : VCL
//
// Filename       : AT.Vcl.Dialogs.SplashDX.pas/.dfm
// Date Created   : 11-May-2020
// Author         : Matthew Vesperman
//
// Description:
//
// Defines a form class to display an application splash screen.
//
// Revision History:
//
// v1.00   :   Initial version
//
// ******************************************************************
//
// COPYRIGHT © 2020 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

/// <summary>
///   Defines a form class to display an application splash screen.
/// </summary>
unit AT.Vcl.Dialogs.SplashDX;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.WinXCtrls, Vcl.ActnList, Vcl.Menus, Vcl.StdCtrls,
  dxSkinsCore, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinPumpkin,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  dxSkinTheBezier, dxSkinOffice2019Colorful,
  dxGDIPlusClasses, dxActivityIndicator, dxBar, dxCoreGraphics,
  dxLayoutcxEditAdapters, dxLayoutContainer, dxLayoutControl,
  dxLayoutLookAndFeels, dxLayoutControlAdapters,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxLabel, cxImage, cxClasses, RzStatus,
  cxButtons, dxSkinBasic, dxSkinOffice2019Black,
  dxSkinOffice2019DarkGray, dxSkinOffice2019White;

type
  /// <summary>
  ///   An enumeration to set the splash screen background color.
  /// </summary>
  TSplashBackgroundColor = (
    /// <summary>
    ///   A standard blue background.
    /// </summary>
    sbcBlue,
    /// <summary>
    ///   A standard green background.
    /// </summary>
    sbcGreen,
    /// <summary>
    ///   A standard orange background.
    /// </summary>
    sbcOrange,
    /// <summary>
    ///   A standard purple background.
    /// </summary>
    sbcPurple,
    /// <summary>
    ///   A standard white background.
    /// </summary>
    sbcWhite,
    /// <summary>
    ///   A standard yellow background.
    /// </summary>
    sbcYellow,
    /// <summary>
    ///   Use a custom color defined by the CustomBackgroundColor
    ///   property of the TdlgSplashDX class for the background color
    ///   and a foreground color specified by the
    ///   CustomForegroundColor property.
    /// </summary>
    sbcCustom );

  /// <summary>
  ///   An enumeration to set the type of animated indicator for the
  ///   splash screen.
  /// </summary>
  TSplashIndicatorType = ( sitCircularDots, sitElasticCircle,
    sitGravityDots, sitHorizontalDots );


  /// <summary>
  ///   An enumeration to display the display mode of the spash
  ///   screen.
  /// </summary>
  TSplashMode = (
    /// <summary>
    ///   Display the splash screen as a dialog box.
    /// </summary>
    smDialog,
    /// <summary>
    ///   Display the splash screen as a floating, always on top,
    ///   window with no border/title.
    /// </summary>
    smSplash );


  /// <summary>
  ///   An enumeration of possible social icons to display when the
  ///   splash screen is in dialog box mode.
  /// </summary>
  TSplashSocialIcon = (
    /// <summary>
    ///   Display a facebook icon.
    /// </summary>
    siFacebook,
    /// <summary>
    ///   Deprecated since Google+ is no longer active. (Only exists
    ///   for backwards compatibility, no G+ icon will be displayed.)
    /// </summary>
    siGooglePlus,
    /// <summary>
    ///   Display a linkedin icon.
    /// </summary>
    siLinkedIn,
    /// <summary>
    ///   Display a skype icon.
    /// </summary>
    siSkype,
    /// <summary>
    ///   Display a twitter icon.
    /// </summary>
    siTwitter,
    /// <summary>
    ///   Display a youtube icon.
    /// </summary>
    siYoutube,
    /// <summary>
    ///   Display an icon for email based support.
    /// </summary>
    siEmailSupport,
    /// <summary>
    ///   Display an icon for the product page url.
    /// </summary>
    siProductPage,
    /// <summary>
    ///   Display an icon for the peer support forum.
    /// </summary>
    siSupportForum,
    /// <summary>
    ///   Display an icon for the main company website.
    /// </summary>
    siWebsite );

  /// <summary>
  ///   Specifies the set of social icons to display when the splash
  ///   screen is in dialog box mode.
  /// </summary>
  /// <remarks>
  ///   In order for the social icon t display, the matching xxxURL
  ///   property needs to be set to a non-empty string.
  /// </remarks>
  TSplashSocialIcons = set of TSplashSocialIcon;

  /// <summary>
  ///   Defines a splash screen form class.
  /// </summary>
  TdlgSplashDX = class( TForm )
    actEmailSupport: TAction;
    actFacebook: TAction;
    actGooglePlus: TAction;
    actindSplash: TdxActivityIndicator;
    actLinkedIn: TAction;
    actProductPage: TAction;
    actSkype: TAction;
    actSupportForum: TAction;
    actTwitter: TAction;
    actWebsite: TAction;
    actYoutube: TAction;
    alstSplash: TActionList;
    btnEmailSupport: TcxButton;
    btnFacebook: TcxButton;
    btnLinkedIn: TcxButton;
    btnProductPage: TcxButton;
    btnSkype: TcxButton;
    btnSupportForum: TcxButton;
    btnTwitter: TcxButton;
    btnWebsite: TcxButton;
    btnYoutube: TcxButton;
    FooterRight: TdxLayoutGroup;
    Image1: TImage;
    layAbout: TdxLayoutControl;
    laygrpAbout_Root: TdxLayoutGroup;
    laygrpFooter: TdxLayoutGroup;
    laygrpSocial: TdxLayoutGroup;
    layitmAppTitle: TdxLayoutItem;
    layitmAppVersion: TdxLayoutItem;
    layitmATLogo: TdxLayoutItem;
    layitmContents: TdxLayoutItem;
    layitmCopyright: TdxLayoutItem;
    layitmCredits: TdxLayoutItem;
    layitmEmailSupportBtn: TdxLayoutItem;
    layitmFacebookBtn: TdxLayoutItem;
    layitmLinkedInBtn: TdxLayoutItem;
    layitmProductPageBtn: TdxLayoutItem;
    layitmSkypeBtn: TdxLayoutItem;
    layitmSplashActInd: TdxLayoutItem;
    layitmStartMsg: TdxLayoutItem;
    layitmSupportForumBtn: TdxLayoutItem;
    layitmTwitterBtn: TdxLayoutItem;
    layitmWebsiteBtn: TdxLayoutItem;
    layitmYoutubeBtn: TdxLayoutItem;
    laylfSplash: TdxLayoutLookAndFeelList;
    laylfsSplashSkin: TdxLayoutSkinLookAndFeel;
    laysepitm1: TdxLayoutSeparatorItem;
    lblAppTitle: TcxLabel;
    lblContents: TcxLabel;
    lblCopyright: TcxLabel;
    lblCredits: TcxLabel;
    lblStartMsg: TcxLabel;
    lblVersion: TcxLabel;
    pnlSplash: TPanel;
    verinfSplash: TRzVersionInfo;
    procedure ExecuteSocialIconAction( Sender: TObject );
    procedure UpdateSocialIconAction( Sender: TObject );
  strict private
    FAnimationRestartDelay: Integer;
    FAnimationTime: Integer;
    FArcThickness: Integer;
    FCustomBackgroundColor: TColor;
    FCustomForegroundColor: TColor;
    FDotColor: TdxAlphaColor;
    FDotCount: Integer;
    FDotSize: Integer;
    FEmailSupportURL: String;
    FFacebookURL: String;
    FGooglePlusURL: String;
    FIndicatorType: TSplashIndicatorType;
    FLinkedInURL: String;
    FProductPageURL: String;
    FSkypeURL: String;
    FSocialIcons: TSplashSocialIcons;
    FSplashBackgroundColor: TSplashBackgroundColor;
    FSplashMode: TSplashMode;
    FSupportForumURL: String;
    FTwitterURL: String;
    FVersion: String;
    FWebsiteURL: String;
    FYoutubeURL: String;
  strict protected
    procedure CreateParams( var Params: TCreateParams ); override;
    function GetAnimationRestartDelay: Integer;
    function GetAnimationTime: Integer;
    function GetAppTitle: String;
    function GetArcThickness: Integer;
    function GetContents: String;
    function GetCopyright: String;
    function GetCredits: String;
    function GetCustomBackgroundColor: TColor;
    function GetCustomForegroundColor: TColor;
    function GetDotCount: Integer;
    function GetDotSize: Integer;
    function GetEmailSupportURL: String;
    function GetFacebookURL: String;
    function GetGooglePlusURL: String;
    function GetIndicatorType: TSplashIndicatorType;
    function GetLinkedInURL: String;
    function GetProductPageURL: String;
    function GetSkypeURL: String;
    function GetSocialIcons: TSplashSocialIcons;
    function GetSplashBackgroundColor: TSplashBackgroundColor;
    function GetSplashMode: TSplashMode;
    function GetStartMessage: String;
    function GetSupportForumURL: String;
    function GetTwitterURL: String;
    function GetVersion: String;
    function GetWebsiteURL: String;
    function GetYoutubeURL: String;
    procedure SetAnimationRestartDelay( const Value: Integer );
    procedure SetAnimationTime( const Value: Integer );
    procedure SetAppTitle( const Value: String );
    procedure SetArcThickness( const Value: Integer );
    procedure SetContents( const Value: String );
    procedure SetCopyright( const Value: String );
    procedure SetCredits( const Value: String );
    procedure SetCustomBackgroundColor( const Value: TColor );
    procedure SetCustomForegroundColor( const Value: TColor );
    procedure SetDotCount( const Value: Integer );
    procedure SetDotSize( const Value: Integer );
    procedure SetEmailSupportURL( const Value: String );
    procedure SetFacebookURL( const Value: String );
    procedure SetGooglePlusURL( const Value: String );
    procedure SetIndicatorType( const Value: TSplashIndicatorType );
    procedure SetLinkedInURL( const Value: String );
    procedure SetProductPageURL( const Value: String );
    procedure SetSkypeURL( const Value: String );
    procedure SetSocialIcons( const Value: TSplashSocialIcons );
    procedure SetSplashBackgroundColor( const Value
          : TSplashBackgroundColor );
    procedure SetSplashMode( const Value: TSplashMode );
    procedure SetStartMessage( const Value: String );
    procedure SetSupportForumURL( const Value: String );
    procedure SetTwitterURL( const Value: String );
    procedure SetVersion( const Value: String );
    procedure SetWebsiteURL( const Value: String );
    procedure SetYoutubeURL( const Value: String );
    procedure _LoadAppTitleFromVerInfo;
    procedure _LoadCopyrightFromVerInfo;
    procedure _LoadVersionFromVerInfo;
    class procedure _SplashSleep( const ASleepValue: Integer );
    procedure _UpdateIndicatorColors( const AColor: TColor );
    procedure _UpdateIndicatorProperties;
    procedure _UpdateSplashBackground;
    procedure _UpdateSplashForegroundColors;
    procedure _UpdateSplashMode;
  public
    constructor Create( AOwner: TComponent ); override;
    class procedure ChangeStartMessage( const AValue: String = '';
      const ASleepValue: Integer = 0 );
    class procedure FreeAndNilSplash;
    class procedure HideSplash( const ASleepValue: Integer = 200 );
    procedure LoadVersionInfo;
    class function ShowSplash( const ABackgroundColor
          : TSplashBackgroundColor = sbcWhite;
      const AIndicatorType: TSplashIndicatorType = sitHorizontalDots;
      const AUseVerInfo: Boolean = True ): TdlgSplashDX; overload;
    class function ShowSplash( const ASplashMode: TSplashMode;
      const ABackgroundColor: TSplashBackgroundColor = sbcWhite;
      const AIndicatorType: TSplashIndicatorType = sitHorizontalDots;
      const AUseVerInfo: Boolean = True ): TdlgSplashDX; overload;
    procedure UpdateSocialActions;
    property  AnimationRestartDelay: Integer
        read  GetAnimationRestartDelay
        write SetAnimationRestartDelay;
    property  AnimationTime: Integer
        read  GetAnimationTime
        write SetAnimationTime;
    property  AppTitle: String
        read  GetAppTitle
        write SetAppTitle;
    property  ArcThickness: Integer
        read  GetArcThickness
        write SetArcThickness;
    property  Contents: String
        read  GetContents
        write SetContents;
    property  Copyright: String
        read  GetCopyright
        write SetCopyright;
    property  Credits: String
        read  GetCredits
        write SetCredits;
    property  CustomBackgroundColor: TColor
        read  GetCustomBackgroundColor
        write SetCustomBackgroundColor;
    property  CustomForegroundColor: TColor
        read  GetCustomForegroundColor
        write SetCustomForegroundColor;
    property  DotCount: Integer
        read  GetDotCount
        write SetDotCount;
    property  DotSize: Integer
        read  GetDotSize
        write SetDotSize;
    property  EmailSupportURL: String
        read  GetEmailSupportURL
        write SetEmailSupportURL;
    property  FacebookURL: String
        read  GetFacebookURL
        write SetFacebookURL;
    property  GooglePlusURL: String
        read  GetGooglePlusURL
        write SetGooglePlusURL;
    property  IndicatorType: TSplashIndicatorType
        read  GetIndicatorType
        write SetIndicatorType;
    property  LinkedInURL: String
        read  GetLinkedInURL
        write SetLinkedInURL;
    property  ProductPageURL: String
        read  GetProductPageURL
        write SetProductPageURL;
    property  SkypeURL: String
        read  GetSkypeURL
        write SetSkypeURL;
    property  SocialIcons: TSplashSocialIcons
        read  GetSocialIcons
        write SetSocialIcons;
    property  SplashBackgroundColor: TSplashBackgroundColor
        read  GetSplashBackgroundColor
        write SetSplashBackgroundColor;
    property  SplashMode: TSplashMode
        read  GetSplashMode
        write SetSplashMode;
    property  StartMessage: String
        read  GetStartMessage
        write SetStartMessage;
    property  SupportForumURL: String
        read  GetSupportForumURL
        write SetSupportForumURL;
    property  TwitterURL: String
        read  GetTwitterURL
        write SetTwitterURL;
    property  Version: String
        read  GetVersion
        write SetVersion;
    property  WebsiteURL: String
        read  GetWebsiteURL
        write SetWebsiteURL;
    property  YoutubeURL: String
        read  GetYoutubeURL
        write SetYoutubeURL;
  end;

function SplashDialog: TdlgSplashDX;

implementation

uses
  System.Rtti,
  AT.GarbageCollector, AT.Rtti, AT.XPlatform.Internet;

{$R *.dfm}

var
  dlgSplashDX: TdlgSplashDX;

function SplashDialog: TdlgSplashDX;
begin
  if ( NOT Assigned( dlgSplashDX ) ) then
    begin
      dlgSplashDX := TdlgSplashDX.Create( Application );
    end;

  Result := dlgSplashDX;
end;

constructor TdlgSplashDX.Create( AOwner: TComponent );
begin
  inherited Create( AOwner );

  AppTitle := Application.Title;
  Copyright := EmptyStr;
  Contents := EmptyStr;
  Credits := EmptyStr;
  StartMessage := EmptyStr;
  Version := EmptyStr;

  FSplashMode := smSplash;
  _UpdateSplashMode;

  FCustomBackgroundColor := clBtnFace;
  FCustomForegroundColor := clWindowText;
  FSplashBackgroundColor := sbcWhite;
  _UpdateSplashBackground;

  FSocialIcons := [ siEmailSupport, siWebsite ];

  FEmailSupportURL := 'mailto:support@angelictech.com';
  FFacebookURL := EmptyStr;
  FGooglePlusURL := EmptyStr;
  FLinkedInURL := EmptyStr;
  FProductPageURL := EmptyStr;
  FSkypeURL := EmptyStr;
  FSupportForumURL := EmptyStr;
  FTwitterURL := EmptyStr;
  FYoutubeURL := EmptyStr;
  FWebsiteURL := 'http://angelictech.com';

  FAnimationRestartDelay := 0;
  FAnimationTime := 2000;
  FArcThickness := 3;
  FDotCount := 5;
  FDotSize := 6;
  IndicatorType := sitHorizontalDots;

end;

class procedure TdlgSplashDX.ChangeStartMessage( const AValue
      : String = ''; const ASleepValue: Integer = 0 );
begin
  SplashDialog.StartMessage := AValue;
  _SplashSleep( ASleepValue );
end;

procedure TdlgSplashDX.CreateParams( var Params: TCreateParams );
const
  CS_DROPSHADOW = $00020000;
begin
  inherited CreateParams( Params );

  Params.Style := WS_POPUP;
  Params.WindowClass.Style := Params.WindowClass.Style OR
      CS_DROPSHADOW;
end;

procedure TdlgSplashDX.ExecuteSocialIconAction( Sender: TObject );
var
  ATag: TValue;
  AIconTag: TSplashSocialIcon;
  AURL: String;
begin
  if ( NOT AT.Rtti.GetPropertyValue( Sender, 'Tag', ATag ) ) then
    Exit;

  AIconTag := TSplashSocialIcon( ATag.AsInteger );

  case AIconTag of
    siFacebook:
      AURL := FFacebookURL;
    siGooglePlus:
      AURL := FGooglePlusURL;
    siLinkedIn:
      AURL := FLinkedInURL;
    siSkype:
      AURL := FSkypeURL;
    siTwitter:
      AURL := FTwitterURL;
    siYoutube:
      AURL := FYoutubeURL;
    siEmailSupport:
      AURL := FEmailSupportURL;
    siProductPage:
      AURL := FProductPageURL;
    siSupportForum:
      AURL := FSupportForumURL;
    siWebsite:
      AURL := FWebsiteURL;
  else
    AURL := EmptyStr;
  end;

  if ( AURL.IsEmpty ) then
    Exit;

  OpenURL( AURL );
end;

class procedure TdlgSplashDX.FreeAndNilSplash;
begin

  if ( Assigned( dlgSplashDX ) ) then
    begin
      dlgSplashDX.Release;
      dlgSplashDX := NIL;
    end;

end;

function TdlgSplashDX.GetAnimationRestartDelay: Integer;
begin
  Result := FAnimationRestartDelay;
end;

function TdlgSplashDX.GetAnimationTime: Integer;
begin
  Result := FAnimationTime;
end;

function TdlgSplashDX.GetAppTitle: String;
begin
  Result := lblAppTitle.Caption;
end;

function TdlgSplashDX.GetArcThickness: Integer;
begin
  Result := FArcThickness;
end;

function TdlgSplashDX.GetContents: String;
begin
  Result := lblContents.Caption;
end;

function TdlgSplashDX.GetCopyright: String;
begin
  Result := lblCopyright.Caption;
end;

function TdlgSplashDX.GetCredits: String;
begin
  Result := lblCredits.Caption;
end;

function TdlgSplashDX.GetCustomBackgroundColor: TColor;
begin
  Result := FCustomBackgroundColor;
end;

function TdlgSplashDX.GetCustomForegroundColor: TColor;
begin
  Result := FCustomForegroundColor;
end;

function TdlgSplashDX.GetDotCount: Integer;
begin
  Result := FDotCount;
end;

function TdlgSplashDX.GetDotSize: Integer;
begin
  Result := FDotSize;
end;

function TdlgSplashDX.GetEmailSupportURL: String;
begin
  Result := FEmailSupportURL;
end;

function TdlgSplashDX.GetFacebookURL: String;
begin
  Result := FFacebookURL;
end;

function TdlgSplashDX.GetGooglePlusURL: String;
begin
  Result := FGooglePlusURL;
end;

function TdlgSplashDX.GetIndicatorType: TSplashIndicatorType;
begin
  Result := FIndicatorType;
end;

function TdlgSplashDX.GetLinkedInURL: String;
begin
  Result := FLinkedInURL;
end;

function TdlgSplashDX.GetProductPageURL: String;
begin
  Result := FProductPageURL;
end;

function TdlgSplashDX.GetSkypeURL: String;
begin
  Result := FSkypeURL;
end;

function TdlgSplashDX.GetSocialIcons: TSplashSocialIcons;
begin
  Result := FSocialIcons;
end;

function TdlgSplashDX.GetSplashBackgroundColor
    : TSplashBackgroundColor;
begin
  Result := FSplashBackgroundColor;
end;

function TdlgSplashDX.GetSplashMode: TSplashMode;
begin
  Result := FSplashMode;
end;

function TdlgSplashDX.GetStartMessage: String;
begin
  Result := lblStartMsg.Caption;
end;

function TdlgSplashDX.GetSupportForumURL: String;
begin
  Result := FSupportForumURL;
end;

function TdlgSplashDX.GetTwitterURL: String;
begin
  Result := FTwitterURL;
end;

function TdlgSplashDX.GetVersion: String;
begin
  Result := FVersion;
end;

function TdlgSplashDX.GetWebsiteURL: String;
begin
  Result := FWebsiteURL;
end;

function TdlgSplashDX.GetYoutubeURL: String;
begin
  Result := FYoutubeURL;
end;

class procedure TdlgSplashDX.HideSplash( const ASleepValue
      : Integer = 200 );
begin
  _SplashSleep( ASleepValue );
  SplashDialog.Hide;
end;

procedure TdlgSplashDX.LoadVersionInfo;
begin
  _LoadAppTitleFromVerInfo;
  _LoadCopyrightFromVerInfo;
  _LoadVersionFromVerInfo;
end;

procedure TdlgSplashDX.SetAnimationRestartDelay( const Value
      : Integer );
begin
  FAnimationRestartDelay := Value;
end;

procedure TdlgSplashDX.SetAnimationTime( const Value: Integer );
begin
  FAnimationTime := Value;
end;

procedure TdlgSplashDX.SetAppTitle( const Value: String );
begin
  lblAppTitle.Caption := Value;
end;

procedure TdlgSplashDX.SetArcThickness( const Value: Integer );
begin
  FArcThickness := Value;
end;

procedure TdlgSplashDX.SetContents( const Value: String );
begin
  lblContents.Caption := Value;
end;

procedure TdlgSplashDX.SetCopyright( const Value: String );
begin
  lblCopyright.Caption := Value;
end;

procedure TdlgSplashDX.SetCredits( const Value: String );
begin
  lblCredits.Caption := Value;
end;

procedure TdlgSplashDX.SetCustomBackgroundColor( const Value
      : TColor );
begin
  FCustomBackgroundColor := Value;
  FSplashBackgroundColor := sbcCustom;
  _UpdateSplashBackground;
end;

procedure TdlgSplashDX.SetCustomForegroundColor( const Value
      : TColor );
begin
  FCustomForegroundColor := Value;
end;

procedure TdlgSplashDX.SetDotCount( const Value: Integer );
begin
  FDotCount := Value;
end;

procedure TdlgSplashDX.SetDotSize( const Value: Integer );
begin
  FDotSize := Value;
end;

procedure TdlgSplashDX.SetEmailSupportURL( const Value: String );
begin
  FEmailSupportURL := Value;
end;

procedure TdlgSplashDX.SetFacebookURL( const Value: String );
begin
  FFacebookURL := Value;
end;

procedure TdlgSplashDX.SetGooglePlusURL( const Value: String );
begin
  FGooglePlusURL := Value;
end;

procedure TdlgSplashDX.SetIndicatorType( const Value
      : TSplashIndicatorType );
var
  AClass: TdxActivityIndicatorPropertiesClass;
begin
  FIndicatorType := Value;

  case Value of
    sitCircularDots:
      AClass := TdxActivityIndicatorCircularDotsProperties;
    sitElasticCircle:
      AClass := TdxActivityIndicatorElasticCircleProperties;
    sitGravityDots:
      AClass := TdxActivityIndicatorGravityDotsProperties;
    sitHorizontalDots:
      AClass := TdxActivityIndicatorHorizontalDotsProperties;
  else
    AClass := TdxActivityIndicatorHorizontalDotsProperties;
  end;

  actindSplash.PropertiesClass := AClass;

  _UpdateIndicatorProperties;
end;

procedure TdlgSplashDX.SetLinkedInURL( const Value: String );
begin
  FLinkedInURL := Value;
end;

procedure TdlgSplashDX.SetProductPageURL( const Value: String );
begin
  FProductPageURL := Value;
end;

procedure TdlgSplashDX.SetSkypeURL( const Value: String );
begin
  FSkypeURL := Value;
end;

procedure TdlgSplashDX.SetSocialIcons( const Value
      : TSplashSocialIcons );
begin
  FSocialIcons := Value;
end;

procedure TdlgSplashDX.SetSplashBackgroundColor( const Value
      : TSplashBackgroundColor );
begin
  FSplashBackgroundColor := Value;
  _UpdateSplashBackground;
end;

procedure TdlgSplashDX.SetSplashMode( const Value: TSplashMode );
begin
  FSplashMode := Value;

  _UpdateSplashMode;
end;

procedure TdlgSplashDX.SetStartMessage( const Value: String );
begin
  lblStartMsg.Caption := Value;
end;

procedure TdlgSplashDX.SetSupportForumURL( const Value: String );
begin
  FSupportForumURL := Value;
end;

procedure TdlgSplashDX.SetTwitterURL( const Value: String );
begin
  FTwitterURL := Value;
end;

procedure TdlgSplashDX.SetVersion( const Value: String );
begin
  FVersion := Value;
  lblVersion.Caption := Value;
end;

procedure TdlgSplashDX.SetWebsiteURL( const Value: String );
begin
  FWebsiteURL := Value;
end;

procedure TdlgSplashDX.SetYoutubeURL( const Value: String );
begin
  FYoutubeURL := Value;
end;

class function TdlgSplashDX.ShowSplash( const ABackgroundColor
      : TSplashBackgroundColor = sbcWhite;
  const AIndicatorType: TSplashIndicatorType = sitHorizontalDots;
  const AUseVerInfo: Boolean = True ): TdlgSplashDX;
begin
  Result := SplashDialog;

  if ( Result.Showing ) then
    TdlgSplashDX.HideSplash;

  if ( AUseVerInfo ) then
    Result.LoadVersionInfo;

  Result.SplashBackgroundColor := ABackgroundColor;
  Result.SplashMode := smSplash;

  Result.IndicatorType := AIndicatorType;

  Result.Show;
end;

class function TdlgSplashDX.ShowSplash( const ASplashMode
      : TSplashMode; const ABackgroundColor
      : TSplashBackgroundColor = sbcWhite;
  const AIndicatorType: TSplashIndicatorType = sitHorizontalDots;
  const AUseVerInfo: Boolean = True ): TdlgSplashDX;
begin
  Result := SplashDialog;

  Result.SplashMode := ASplashMode;

  if ( Result.Showing ) then
    TdlgSplashDX.HideSplash;

  if ( AUseVerInfo ) then
    Result.LoadVersionInfo;

  Result.SplashBackgroundColor := ABackgroundColor;

  Result.IndicatorType := AIndicatorType;

  case ASplashMode of
    smDialog:
      Result.ShowModal;
    smSplash:
      Result.Show;
  end;
end;

procedure TdlgSplashDX.UpdateSocialActions;
begin
  actEmailSupport.Update;
  actFacebook.Update;
  actGooglePlus.Update;
  actLinkedIn.Update;
  actProductPage.Update;
  actSkype.Update;
  actSupportForum.Update;
  actTwitter.Update;
  actWebsite.Update;
  actYoutube.Update;
end;

procedure TdlgSplashDX.UpdateSocialIconAction( Sender: TObject );
var
  ATag: TValue;
  AIconTag: TSplashSocialIcon;
  ALayItm: TdxLayoutItem;
  AURL: String;
  AOk: Boolean;
begin
  if ( NOT AT.Rtti.GetPropertyValue( Sender, 'Tag', ATag ) ) then
    Exit;

  AIconTag := TSplashSocialIcon( ATag.AsInteger );

  case AIconTag of
    siFacebook:
      begin
        AURL := FFacebookURL;
        ALayItm := layitmFacebookBtn;
      end;
    siGooglePlus:
      begin
        AURL := FGooglePlusURL;
        ALayItm := NIL;
      end;
    siLinkedIn:
      begin
        AURL := FLinkedInURL;
        ALayItm := layitmLinkedInBtn;
      end;
    siSkype:
      begin
        AURL := FSkypeURL;
        ALayItm := layitmSkypeBtn;
      end;
    siTwitter:
      begin
        AURL := FTwitterURL;
        ALayItm := layitmTwitterBtn;
      end;
    siYoutube:
      begin
        AURL := FYoutubeURL;
        ALayItm := layitmYoutubeBtn;
      end;
    siEmailSupport:
      begin
        AURL := FEmailSupportURL;
        ALayItm := layitmEmailSupportBtn;
      end;
    siProductPage:
      begin
        AURL := FProductPageURL;
        ALayItm := layitmProductPageBtn;
      end;
    siSupportForum:
      begin
        AURL := FSupportForumURL;
        ALayItm := layitmSupportForumBtn;
      end;
    siWebsite:
      begin
        AURL := FWebsiteURL;
        ALayItm := layitmWebsiteBtn;
      end;
  else
    AURL := EmptyStr;
    ALayItm := NIL;
  end;

  AOk := ( ( AIconTag IN SocialIcons ) AND ( NOT AURL.IsEmpty ) );

  SetPropertyValue( Sender, 'Enabled', AOk );
  SetPropertyValue( Sender, 'Visible', AOk );

  if ( Assigned( ALayItm ) ) then
    SetPropertyValue( ALayItm, 'Visible', AOk );

end;

procedure TdlgSplashDX._LoadAppTitleFromVerInfo;
begin
  AppTitle := verinfSplash.ProductName;
end;

procedure TdlgSplashDX._LoadCopyrightFromVerInfo;
var
  AFileVer: String;
  ABitness: String;
begin
  AFileVer := verinfSplash.FileVersion;
  ABitness := verinfSplash.GetCustomKeyValue( 'Bitness' );

  if ( ABitness.IsEmpty ) then
    Copyright := Format( '%s' + #13 + '%s',
      [ AFileVer, verinfSplash.Copyright ] )
  else
    Copyright := Format( '%s (%sbit)' + #13 + '%s',
      [ AFileVer, ABitness, verinfSplash.Copyright ] );
end;

procedure TdlgSplashDX._LoadVersionFromVerInfo;
begin
  Version := verinfSplash.ProductVersion;
end;

class procedure TdlgSplashDX._SplashSleep( const ASleepValue
      : Integer );
var
  Idx: Integer;
begin
  for Idx := 0 to ( ASleepValue - 1 ) do
    begin
      Application.ProcessMessages;
      Sleep( 1 );
    end;
end;

procedure TdlgSplashDX._UpdateIndicatorColors( const AColor: TColor );
begin
  FDotColor := dxColorToAlphaColor( AColor );

  _UpdateIndicatorProperties;
end;

procedure TdlgSplashDX._UpdateIndicatorProperties;
var
  AProps: TdxActivityIndicatorProperties;
begin
  AProps := actindSplash.Properties;

  SetPropertyValue( AProps, 'AnimationRestartDelay',
    FAnimationRestartDelay );
  SetPropertyValue( AProps, 'AnimationTime', FAnimationTime );
  SetPropertyValue( AProps, 'ArcColor', FDotColor );
  SetPropertyValue( AProps, 'ArcThickness', FArcThickness );
  SetPropertyValue( AProps, 'DotColor', FDotColor );
  SetPropertyValue( AProps, 'DotCount', FDotCount );
  SetPropertyValue( AProps, 'DotSize', FDotSize );
end;

procedure TdlgSplashDX._UpdateSplashBackground;
var
  AColor: TColor;
begin
  case FSplashBackgroundColor of
    sbcBlue:
      AColor := $009A572B;
    sbcGreen:
      AColor := $00467321;
    sbcOrange:
      AColor := $002A47B7;
    sbcPurple:
      AColor := $007B3980;
    sbcWhite:
      AColor := clWhite;
    sbcYellow:
      AColor := $003EA5EA;
    sbcCustom:
      AColor := FCustomBackgroundColor;
  else
    AColor := clWhite;
  end;

  pnlSplash.Color := AColor;

  _UpdateSplashForegroundColors;
end;

procedure TdlgSplashDX._UpdateSplashForegroundColors;
var
  AColor: TColor;
begin
  case FSplashBackgroundColor of
    sbcBlue, sbcGreen, sbcOrange, sbcPurple:
      AColor := clWhite;
    sbcYellow, sbcWhite:
      AColor := clBlack;
    sbcCustom:
      AColor := FCustomForegroundColor;
  else
    AColor := clBlack;
  end;

  lblAppTitle.Style.Font.Color := AColor;
  lblContents.Style.Font.Color := AColor;
  lblCopyright.Style.Font.Color := AColor;
  lblCredits.Style.Font.Color := AColor;
  lblStartMsg.Style.Font.Color := AColor;
  lblVersion.Style.Font.Color := AColor;

  _UpdateIndicatorColors( AColor );
end;

procedure TdlgSplashDX._UpdateSplashMode;
begin
  case FSplashMode of
    smDialog:
      begin
        Self.BorderIcons := [ biSystemMenu ];
        Self.BorderStyle := bsSingle;
        // Self.Position := poMainFormCenter;
        Self.ClientHeight := 548;
      end;

    smSplash:
      begin
        Self.BorderIcons := [ ];
        Self.BorderStyle := bsNone;
        // Self.Position := poScreenCenter;
        Self.ClientHeight := 510;
      end;
  end;

  layitmCredits.Visible := ( FSplashMode = smDialog );
  laygrpSocial.Visible := ( FSplashMode = smDialog );
  laysepitm1.Visible := ( FSplashMode = smDialog );
  layitmSplashActInd.Visible := ( FSplashMode = smSplash );
  layitmStartMsg.Visible := ( FSplashMode = smSplash );
end;

end.
