// ******************************************************************
//
// Program Name   : $ProgramName$
// Platform(s)    : $Platforms$
// Framework      : VCL
//
// Filename       : AT.$ShortName$.Vcl.Dialogs.SplashDX.pas/.dfm
// File Version   : 1.00
// Date Created   : $CreateDate$
// Author         : Matthew Vesperman
//
// Description:
//
// $ProgramName$'s startup splash screen dialog class.
//
// Revision History:
//
// v1.00   :   Initial version
//
// ******************************************************************
//
// COPYRIGHT © $Year$ - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

/// <summary>
///   $ProgramName$'s startup splash screen dialog class.
/// </summary>
unit AT.ShortName.Vcl.Dialogs.SplashDX;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, Vcl.Graphics,
  Vcl.Forms, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxGraphics,
  dxCoreGraphics, cxControls, cxContainer, cxEdit, dxSkinscxPCPainter,
  dxSkinsdxBarPainter, RzStatus, System.Classes, System.Actions,
  Vcl.ActnList, dxBar, cxClasses, dxGDIPlusClasses, Vcl.Controls,
  Vcl.ExtCtrls, dxActivityIndicator, cxLabel, Vcl.WinXCtrls,
  AT.Vcl.Actions.Data;

type
  /// <summary>
  ///   Defines the possible background colors for the startup splash
  ///   screen dialog.
  /// </summary>
  TSplashBackgroundColor = (
    /// <summary>
    ///   Specifies a blue background for the splash screen.
    /// </summary>
    sbcBlue,
    /// <summary>
    ///   Specifies a green background for the splash screen.
    /// </summary>
    sbcGreen,
    /// <summary>
    ///   Specifies a orange background for the splash screen.
    /// </summary>
    sbcOrange,
    /// <summary>
    ///   Specifies a purple background for the splash screen.
    /// </summary>
    sbcPurple,
    /// <summary>
    ///   Specifies a white background for
    ///   the splash screen.
    /// </summary>
    sbcWhite,
    /// <summary>
    ///   Specifies a yellow background for the splash screen.
    /// </summary>
    sbcYellow,
    /// <summary>
    ///   Indicates that the background color is specified by the
    ///   CustomBackgroundColor property.
    /// </summary>
    sbcCustom);

  /// <summary>
  ///   Specifies the type of animated indicator to display in the
  ///   splash dialog.
  /// </summary>
  TSplashIndicatorType = (
    sitCircularDots,
    sitElasticCircle,
    sitGravityDots,
    sitHorizontalDots);

  /// <summary>
  ///   Specifies the mode of the splash dialog.
  /// </summary>
  TSplashMode = (
    /// <summary>
    ///   The splash screen is displayed as a modal dialog box. <br />
    ///   Use this mode as a program about box.
    /// </summary>
    smDialog,
    /// <summary>
    ///   This splash screen is displayed as a modeless splash
    ///   window. <br />Use this mode at program startup to indicate
    ///   progress.
    /// </summary>
    smSplash);

  /// <summary>
  ///   Indicates types of social media icons to display in the
  ///   splash dialog when it is used in dialog box mode.
  /// </summary>
  TSplashSocialIcon = (
    siFacebook,
    siGooglePlus,
    siLinkedIn,
    siSkype,
    siTwitter,
    siYoutube,
    siEmailSupport,
    siProductPage,
    siSupportForum,
    siWebsite);

  /// <summary>
  ///   Indicates the set of social media icons to display in the
  ///   splash dialog when displayed in dialog box mode.
  /// </summary>
  TSplashSocialIcons = set of TSplashSocialIcon;


  /// <summary>
  ///   Defines a splash/about dialog box class.
  /// </summary>
  /// <remarks>
  ///   <para>
  ///     When the SplashMode is smDialog then the Social Icons and
  ///     Credits are shown while the activity indicator and the
  ///     start message are hidden. In this mode there is no border
  ///     and the dialog is shown as a normal top-most window.
  ///   </para>
  ///   <para>
  ///     When the SplashMode is smSplash then the activity
  ///     indicator and start message are shown while the credits
  ///     and social icons are hidden. In this mode the splash is
  ///     shown with a dialog border and is shown modally.
  ///   </para>
  /// </remarks>
  TdlgSplashDX = class(TForm)
    actEmailSupport: TATInt32DataAction;
    actFacebook: TATInt32DataAction;
    actGooglePlus: TATInt32DataAction;
    actindSplash: TdxActivityIndicator;
    actLinkedIn: TATInt32DataAction;
    actProductPage: TATInt32DataAction;
    actSkype: TATInt32DataAction;
    actSupportForum: TATInt32DataAction;
    actTwitter: TATInt32DataAction;
    actWebsite: TATInt32DataAction;
    actYoutube: TATInt32DataAction;
    alstSplash: TActionList;
    bardockSocial: TdxBarDockControl;
    barmgrSplash: TdxBarManager;
    barSplash: TdxBar;
    cmdClose: TdxBarLargeButton;
    cmdEmailSupport: TdxBarLargeButton;
    cmdFacebook: TdxBarLargeButton;
    cmdGPlus: TdxBarLargeButton;
    cmdLinkedIn: TdxBarLargeButton;
    cmdProductPage: TdxBarLargeButton;
    cmdSkype: TdxBarLargeButton;
    cmdSupportForum: TdxBarLargeButton;
    cmdTwitter: TdxBarLargeButton;
    cmdWebsite: TdxBarLargeButton;
    cmdYoutube: TdxBarLargeButton;
    imgLogo: TImage;
    lblAppTitle: TcxLabel;
    lblContents: TcxLabel;
    lblCopyright: TcxLabel;
    lblCredits: TcxLabel;
    lblStartMsg: TcxLabel;
    lblVersion: TcxLabel;
    pnlSplash: TRelativePanel;
    verinfSplash: TRzVersionInfo;
    /// <summary>
    ///   Opens a URL associated with a social media icon action.
    /// </summary>
    procedure ExecuteSocialIconAction(Sender: TObject);
    /// <summary>
    ///   Updates the state of a social media icon action.
    /// </summary>
    procedure UpdateSocialIconAction(Sender: TObject);
  strict private
    /// <summary>
    ///   Stores the activity indicator's AnimationRestartDelay
    ///   value.
    /// </summary>
    FAnimationRestartDelay: Integer;
    /// <summary>
    ///   Stores the activity indicator's AnimationTime value.
    /// </summary>
    FAnimationTime: Integer;
    /// <summary>
    ///   Stores the activity indicator's ArcThickness value.
    /// </summary>
    FArcThickness: Integer;
    /// <summary>
    ///   Stores a custom color for the splash screen's background.
    /// </summary>
    FCustomBackgroundColor: TColor;
    /// <summary>
    ///   Stores a custom color for the splash screen's
    ///   foreground/fonts.
    /// </summary>
    FCustomForegroundColor: TColor;
    /// <summary>
    ///   Stores the activity indicator's DotColor value.
    /// </summary>
    FDotColor: TdxAlphaColor;
    /// <summary>
    ///   Stores the activity indicator's DotCount value.
    /// </summary>
    FDotCount: Integer;
    /// <summary>
    ///   Stores the activity indicator's DotSize value.
    /// </summary>
    FDotSize: Integer;
    /// <summary>
    ///   Stores the URL for support email.
    /// </summary>
    FEmailSupportURL: String;
    /// <summary>
    ///   Stores the URL for Facebook.
    /// </summary>
    FFacebookURL: String;
    /// <summary>
    ///   Stores the URL for Google+.
    /// </summary>
    FGooglePlusURL: String;
    /// <summary>
    ///   Stores the type of activity indicator to use in the splash
    ///   screen.
    /// </summary>
    FIndicatorType: TSplashIndicatorType;
    /// <summary>
    ///   Stores the URL for LinkedIn.
    /// </summary>
    FLinkedInURL: String;
    /// <summary>
    ///   Stores the URL for the product information page.
    /// </summary>
    FProductPageURL: String;
    /// <summary>
    ///   Stores the URL for Skype.
    /// </summary>
    FSkypeURL: String;
    /// <summary>
    ///   Stores the set of social media icons to display in the
    ///   splash dialog.
    /// </summary>
    FSocialIcons: TSplashSocialIcons;
    /// <summary>
    ///   Stores the predefined background color to use.
    /// </summary>
    FSplashBackgroundColor: TSplashBackgroundColor;
    /// <summary>
    ///   Stores the mode of the splash dialog.
    /// </summary>
    FSplashMode: TSplashMode;
    /// <summary>
    ///   Stores the URL for the peer support forum.
    /// </summary>
    FSupportForumURL: String;
    /// <summary>
    ///   Stores the URL for Twitter.
    /// </summary>
    FTwitterURL: String;
    /// <summary>
    ///   Stores the text for the product version.
    /// </summary>
    FVersion: String;
    /// <summary>
    ///   Stores the URL for the website home page.
    /// </summary>
    FWebsiteURL: String;
    /// <summary>
    ///   Stores the URL for Youtube.
    /// </summary>
    FYoutubeURL: String;
  strict protected
    /// <summary>
    ///   Initializes the window-creation parameter record when the
    ///   form window is created.
    /// </summary>
    procedure CreateParams(var Params: TCreateParams); override;
    /// <summary>
    ///   AnimationRestartDelay property getter.
    /// </summary>
    function GetAnimationRestartDelay: Integer;
    /// <summary>
    ///   AnimationTime property getter.
    /// </summary>
    function GetAnimationTime: Integer;
    /// <summary>
    ///   AppTitle property getter.
    /// </summary>
    function GetAppTitle: String;
    /// <summary>
    ///   ArcThickness property getter.
    /// </summary>
    function GetArcThickness: Integer;
    /// <summary>
    ///   Contents property getter.
    /// </summary>
    function GetContents: String;
    /// <summary>
    ///   Copyright property getter.
    /// </summary>
    function GetCopyright: String;
    /// <summary>
    ///   Credits property getter.
    /// </summary>
    function GetCredits: String;
    /// <summary>
    ///   CustomBackgroundColor property getter.
    /// </summary>
    function GetCustomBackgroundColor: TColor;
    /// <summary>
    ///   CustomForegroundColor property getter.
    /// </summary>
    function GetCustomForegroundColor: TColor;
    /// <summary>
    ///   DotCount property getter.
    /// </summary>
    function GetDotCount: Integer;
    /// <summary>
    ///   DotSize property getter.
    /// </summary>
    function GetDotSize: Integer;
    /// <summary>
    ///   EmailSupportURL property getter.
    /// </summary>
    function GetEmailSupportURL: String;
    /// <summary>
    ///   FacebookURL property getter.
    /// </summary>
    function GetFacebookURL: String;
    /// <summary>
    ///   GooglePlusURL property getter.
    /// </summary>
    function GetGooglePlusURL: String;
    /// <summary>
    ///   IndicatorType property getter.
    /// </summary>
    function GetIndicatorType: TSplashIndicatorType;
    /// <summary>
    ///   LinkedInURL property getter.
    /// </summary>
    function GetLinkedInURL: String;
    /// <summary>
    ///   ProductPageURL property getter.
    /// </summary>
    function GetProductPageURL: String;
    /// <summary>
    ///   SkypeURL property getter.
    /// </summary>
    function GetSkypeURL: String;
    /// <summary>
    ///   SociaIcons property getter.
    /// </summary>
    function GetSocialIcons: TSplashSocialIcons;
    /// <summary>
    ///   SplashBackgroundColor property getter.
    /// </summary>
    function GetSplashBackgroundColor: TSplashBackgroundColor;
    /// <summary>
    ///   SplashMode property getter.
    /// </summary>
    function GetSplashMode: TSplashMode;
    /// <summary>
    ///   StartMessage property getter.
    /// </summary>
    function GetStartMessage: String;
    /// <summary>
    ///   SupportForumURL property getter.
    /// </summary>
    function GetSupportForumURL: String;
    /// <summary>
    ///   TwitterURL property getter.
    /// </summary>
    function GetTwitterURL: String;
    /// <summary>
    ///   Version property getter.
    /// </summary>
    function GetVersion: String;
    /// <summary>
    ///   WebsiteURL property getter.
    /// </summary>
    function GetWebsiteURL: String;
    /// <summary>
    ///   YoutubeURL property getter.
    /// </summary>
    function GetYoutubeURL: String;
    /// <summary>
    ///   AnimationRestartDelay property setter.
    /// </summary>
    procedure SetAnimationRestartDelay(const Value: Integer);
    /// <summary>
    ///   AnimationTime property setter.
    /// </summary>
    procedure SetAnimationTime(const Value: Integer);
    /// <summary>
    ///   AppTitle property setter.
    /// </summary>
    procedure SetAppTitle(const Value: String);
    /// <summary>
    ///   ArcThickness property setter.
    /// </summary>
    procedure SetArcThickness(const Value: Integer);
    /// <summary>
    ///   Contents property setter.
    /// </summary>
    procedure SetContents(const Value: String);
    /// <summary>
    ///   Copyright property setter.
    /// </summary>
    procedure SetCopyright(const Value: String);
    /// <summary>
    ///   Credits property setter.
    /// </summary>
    procedure SetCredits(const Value: String);
    /// <summary>
    ///   CustomBackgroundColor property setter.
    /// </summary>
    procedure SetCustomBackgroundColor(const Value: TColor);
    /// <summary>
    ///   CustomForegroundColor property setter.
    /// </summary>
    procedure SetCustomForegroundColor(const Value: TColor);
    /// <summary>
    ///   DotCount property setter.
    /// </summary>
    procedure SetDotCount(const Value: Integer);
    /// <summary>
    ///   DotSize property setter.
    /// </summary>
    procedure SetDotSize(const Value: Integer);
    /// <summary>
    ///   EmailSupportURL property setter.
    /// </summary>
    procedure SetEmailSupportURL(const Value: String);
    /// <summary>
    ///   FacebookURL property setter.
    /// </summary>
    procedure SetFacebookURL(const Value: String);
    /// <summary>
    ///   GooglePlusURL property setter.
    /// </summary>
    procedure SetGooglePlusURL(const Value: String);
    /// <summary>
    ///   IndicatorType property setter.
    /// </summary>
    procedure SetIndicatorType(const Value: TSplashIndicatorType);
    /// <summary>
    ///   LinkedInURL property setter.
    /// </summary>
    procedure SetLinkedInURL(const Value: String);
    /// <summary>
    ///   ProductPageURL property setter.
    /// </summary>
    procedure SetProductPageURL(const Value: String);
    /// <summary>
    ///   SkypeURL property setter.
    /// </summary>
    procedure SetSkypeURL(const Value: String);
    /// <summary>
    ///   SocialIcons property setter.
    /// </summary>
    procedure SetSocialIcons(const Value: TSplashSocialIcons);
    /// <summary>
    ///   SplashBackgroundColor property setter.
    /// </summary>
    procedure SetSplashBackgroundColor(const Value:
        TSplashBackgroundColor);
    /// <summary>
    ///   SplashMode property setter.
    /// </summary>
    procedure SetSplashMode(const Value: TSplashMode);
    /// <summary>
    ///   StartMessage property setter.
    /// </summary>
    procedure SetStartMessage(const Value: String);
    /// <summary>
    ///   SupportForumURL property setter.
    /// </summary>
    procedure SetSupportForumURL(const Value: String);
    /// <summary>
    ///   TwitterURL property setter.
    /// </summary>
    procedure SetTwitterURL(const Value: String);
    /// <summary>
    ///   Version property setter.
    /// </summary>
    procedure SetVersion(const Value: String);
    /// <summary>
    ///   WebsiteURL property setter.
    /// </summary>
    procedure SetWebsiteURL(const Value: String);
    /// <summary>
    ///   YoutubeURL property setter.
    /// </summary>
    procedure SetYoutubeURL(const Value: String);
    /// <summary>
    ///   Loads the AppTitle property from the application's VerInfo
    ///   resource data.
    /// </summary>
    procedure _LoadAppTitleFromVerInfo;
    /// <summary>
    ///   Loads the Copyright property from the application's VerInfo
    ///   resource data and properly formats it.
    /// </summary>
    /// <remarks>
    ///   <para>
    ///     The executable file's compiled version number is added
    ///     to the copyright information.
    ///   </para>
    ///   <para>
    ///     If the VerInfo resource has a Bitness property the the
    ///     bitness (32 or 64) of the application is added to the
    ///     copyright.
    ///   </para>
    /// </remarks>
    procedure _LoadCopyrightFromVerInfo;
    /// <summary>
    ///   Loads the  property from the application's VerInfo
    ///   resource data.
    /// </summary>
    procedure _LoadVersionFromVerInfo;
    /// <summary>
    ///   Allows the app to continue processing/act
    ///   responsively/update its display, while waiting the
    ///   specified number of milliseconds.
    /// </summary>
    /// <param name="ASleepValue">
    ///   The number of milliseconds to sleep.
    /// </param>
    /// <remarks>
    ///   This is used to make startup message visible long enough to
    ///   be read.
    /// </remarks>
    class procedure _SplashSleep(const ASleepValue: Integer);
    /// <summary>
    ///   Updates the activity indicator's color properties.
    /// </summary>
    procedure _UpdateIndicatorColors(const AColor: TColor);
    /// <summary>
    ///   Updates the activity indicator's properties.
    /// </summary>
    procedure _UpdateIndicatorProperties;
    /// <summary>
    ///   Updates the splash dialogs background color based on the
    ///   SplashBackgroundColor property.
    /// </summary>
    /// <remarks>
    ///   <para>
    ///     If the SplashBackgroundColor is set to sbcCustom then
    ///     the background color is set to the color specified by
    ///     the CustomBackgroundColor, otherwise it is set to the
    ///     appropriate predefined color constant.
    ///   </para>
    ///   <para>
    ///     This method also forces an update to the appropriate
    ///     foreground color.
    ///   </para>
    /// </remarks>
    procedure _UpdateSplashBackground;
    /// <summary>
    ///   Updates the foreground colors to the appropriate color for
    ///   the background color that the dialog box is using.
    /// </summary>
    /// <remarks>
    ///   If the SplashBackgroundColor is set to sbcCustom then the
    ///   foreground color is set to the color specified by the
    ///   CustomForegroundColor, otherwise it is set to the
    ///   appropriate predefined color constant.
    /// </remarks>
    procedure _UpdateSplashForegroundColors;
    /// <summary>
    ///   Updates the splash control properties to the appropriate
    ///   values for the specified SplashMode.
    /// </summary>
    procedure _UpdateSplashMode;
  public
    /// <summary>
    ///   Creates and initializes a TdlgSplashDX instance.
    /// </summary>
    /// <remarks>
    ///   Pass a single Component as a parameter to provide the form
    ///   with an Owner (usually the application) that is responsible
    ///   for freeing it. This is the most commonly used constructor
    ///   syntax.
    /// </remarks>
    constructor Create(AOwner: TComponent); override;
    /// <summary>
    ///   Changes the splash dialog's start message, optionally
    ///   sleeping for the specified number of milliseconds.
    /// </summary>
    /// <param name="AValue">
    ///   A string to display as a start message.
    /// </param>
    /// <param name="ASleepValue">
    ///   The number of milliseconds to wait. The default value of
    ///   this parameter is 0 which means do not wait.
    /// </param>
    class procedure ChangeStartMessage(const AValue: String = '';
        const ASleepValue: Integer = 0);
    /// <summary>
    ///   Hides the splash dialog after waiting the specified number
    ///   of milliseconds.
    /// </summary>
    /// <param name="ASleepValue">
    ///   <para>
    ///     The number of milliseconds to wait before closing the
    ///     splash screen.
    ///   </para>
    ///   <para>
    ///     The default value is 200 milliseconds. Pass 0 to hide
    ///     immediately.
    ///   </para>
    /// </param>
    class procedure HideSplash(const ASleepValue: Integer = 200);
    /// <summary>
    ///   Loads the app title, version and copyright information from
    ///   the executable's VerInfo res
    /// </summary>
    procedure LoadVersionInfo;
    /// <summary>
    ///   Displays the splash screen.
    /// </summary>
    /// <param name="ABackgroundColor">
    ///   Specifies the SplashBackgroundColor constant to use.
    /// </param>
    /// <param name="AIndicatorType">
    ///   Specifies the type of activity indicator to use.
    /// </param>
    /// <param name="AUseVerInfo">
    ///   Set this parameter to TRUE to load the app title, version
    ///   and copyright info from the VerInfo resource. Pass FALSE to
    ///   ignore the VerInfo resource.
    /// </param>
    /// <returns>
    ///   A reference to the global splash screen object.
    /// </returns>
    class function ShowSplash(
        const ABackgroundColor: TSplashBackgroundColor = sbcWhite;
        const AIndicatorType: TSplashIndicatorType = sitHorizontalDots;
        const AUseVerInfo: Boolean = True): TdlgSplashDX; overload;
    /// <summary>
    ///   Displays the splash screen using the specified SplashMode.
    /// </summary>
    /// <param name="ASplashMode">
    ///   Specifies the splash mode to use to display the splash
    ///   screen.
    /// </param>
    /// <param name="ABackgroundColor">
    ///   Specifies the SplashBackgroundColor constant to use.
    /// </param>
    /// <param name="AIndicatorType">
    ///   Specifies the type of activity indicator to use.
    /// </param>
    /// <param name="AUseVerInfo">
    ///   Set this parameter to TRUE to load the app title, version
    ///   and copyright info from the VerInfo resource. Pass FALSE to
    ///   ignore the VerInfo resource.
    /// </param>
    /// <returns>
    ///   A reference to the global splash screen object.
    /// </returns>
    class function ShowSplash(const ASplashMode: TSplashMode;
        const ABackgroundColor: TSplashBackgroundColor = sbcWhite;
        const AIndicatorType: TSplashIndicatorType = sitHorizontalDots;
        const AUseVerInfo: Boolean = True): TdlgSplashDX; overload;
    /// <summary>
    ///   Specifies the delay between animation loops, in
    ///   milliseconds.
    /// </summary>
    /// <remarks>
    ///   This property only affects the following IndicatorType
    ///   property values: sitCircularDots, sitGravityDots or
    ///   sitHorizontalDots.
    /// </remarks>
    property AnimationRestartDelay: Integer
        read GetAnimationRestartDelay
        write SetAnimationRestartDelay;
    /// <summary>
    ///   Specifies the duration of an animation loop, in
    ///   milliseconds.
    /// </summary>
    /// <remarks>
    ///   This property affects all IndicatorType property values.
    /// </remarks>
    property AnimationTime: Integer read GetAnimationTime
        write SetAnimationTime;
    /// <summary>
    ///   Specifies the name of the application (product name).
    /// </summary>
    property AppTitle: String read GetAppTitle write SetAppTitle;
    /// <summary>
    ///   Specifies the arc line thickness, in pixels.
    /// </summary>
    /// <remarks>
    ///   This property only affects the sitElasticCircle Indicator
    ///   property type.
    /// </remarks>
    property ArcThickness: Integer read GetArcThickness
        write SetArcThickness;
    /// <summary>
    ///   Specifies additional content to show in the splash dialog.
    /// </summary>
    property Contents: String read GetContents write SetContents;
    /// <summary>
    ///   Specifies the copyright information to display.
    /// </summary>
    property Copyright: String read GetCopyright write SetCopyright;
    /// <summary>
    ///   Specifies additional credits to display in the splash
    ///   dialog.
    /// </summary>
    /// <remarks>
    ///   This content is only displayed when the SplashMode is
    ///   smDialog.
    /// </remarks>
    property Credits: String read GetCredits write SetCredits;
    /// <summary>
    ///   Specifies the splash dialog background color to use when
    ///   the SplashBackgroundColor is sbcCustom.
    /// </summary>
    property CustomBackgroundColor: TColor
        read GetCustomBackgroundColor write SetCustomBackgroundColor;
    /// <summary>
    ///   Specifies the splash dialog foreground color to use when
    ///   the SplashBackgroundColor is sbcCustom.
    /// </summary>
    property CustomForegroundColor: TColor
        read GetCustomForegroundColor write SetCustomForegroundColor;
    /// <summary>
    ///   Specifies the number of dots used in the animation.
    /// </summary>
    /// <remarks>
    ///   This property only affects the following IndicatorType
    ///   property values: sitCircularDots, sitGravityDots or
    ///   sitHorizontalDots.
    /// </remarks>
    property DotCount: Integer read GetDotCount write SetDotCount;
    /// <summary>
    ///   Specifies the dot size (diameter), in pixels.
    /// </summary>
    /// <remarks>
    ///   This property only affects the following IndicatorType
    ///   property values: sitCircularDots, sitGravityDots or
    ///   sitHorizontalDots.
    /// </remarks>
    property DotSize: Integer read GetDotSize write SetDotSize;
    /// <summary>
    ///   Specifies the URL to launch to email support.
    /// </summary>
    property EmailSupportURL: String read GetEmailSupportURL
        write SetEmailSupportURL;
    /// <summary>
    ///   Specifies the URL to a Facebook page.
    /// </summary>
    property FacebookURL: String read GetFacebookURL
        write SetFacebookURL;
    /// <summary>
    ///   Specifies the YRL to a Google+ account/page.
    /// </summary>
    property GooglePlusURL: String read GetGooglePlusURL
        write SetGooglePlusURL;
    /// <summary>
    ///   Specifies the type of activity indicator to display.
    /// </summary>
    /// <remarks>
    ///   The activity indicator is only displayed when the
    ///   SplashMode is smSplash.
    /// </remarks>
    property IndicatorType: TSplashIndicatorType read GetIndicatorType
        write SetIndicatorType;
    /// <summary>
    ///   Specifies the URL to a LinkedIn account.
    /// </summary>
    property LinkedInURL: String read GetLinkedInURL
        write SetLinkedInURL;
    /// <summary>
    ///   Specifies the URL to the product information page.
    /// </summary>
    property ProductPageURL: String read GetProductPageURL
        write SetProductPageURL;
    /// <summary>
    ///   Specifies a Skype URL.
    /// </summary>
    property SkypeURL: String read GetSkypeURL write SetSkypeURL;
    /// <summary>
    ///   Specifies which social media icons to display when the
    ///   SplashMode property is smDialog.
    /// </summary>
    /// <remarks>
    ///   Social icons are only displayed when SplashMode is
    ///   smDialog.
    /// </remarks>
    property SocialIcons: TSplashSocialIcons read GetSocialIcons
        write SetSocialIcons;
    /// <summary>
    ///   Specifies the splash screen's background color.
    /// </summary>
    property SplashBackgroundColor: TSplashBackgroundColor
        read GetSplashBackgroundColor write SetSplashBackgroundColor;
    /// <summary>
    ///   Specifies the splash dialog's mode.
    /// </summary>
    property SplashMode: TSplashMode read GetSplashMode
        write SetSplashMode;
    /// <summary>
    ///   Specifies the current start message to display when the
    ///   SplashMode is set to smSplash.
    /// </summary>
    /// <remarks>
    ///   Start messages are only shown when SplashMode is smSplash.
    /// </remarks>
    property StartMessage: String read GetStartMessage
        write SetStartMessage;
    /// <summary>
    ///   Specifies the URL to the peer support form.
    /// </summary>
    property SupportForumURL: String read GetSupportForumURL
        write SetSupportForumURL;
    /// <summary>
    ///   Specifies the URL to a Twitter account.
    /// </summary>
    property TwitterURL: String read GetTwitterURL
        write SetTwitterURL;
    /// <summary>
    ///   Specifies the version string.
    /// </summary>
    property Version: String read GetVersion write SetVersion;
    /// <summary>
    ///   Specifies the URL for the website home page.
    /// </summary>
    property WebsiteURL: String read GetWebsiteURL
        write SetWebsiteURL;
    /// <summary>
    ///   Specifies the URL to a Youtube channel.
    /// </summary>
    property YoutubeURL: String read GetYoutubeURL
        write SetYoutubeURL;
  end;

/// <summary>
///   Returns a reference to the global Splash Dialog.
/// </summary>
function SplashDialog: TdlgSplashDX;

implementation

uses
  AT.GarbageCollector, System.Rtti, AT.Rtti, AT.XPlatform.Internet;

{$R *.dfm}

var
  /// <summary>
  ///   Module level garbage collector object.
  /// </summary>
  MGC: IATGarbageCollector;
  /// <summary>
  ///   Holds a reference to the global Splash Dialog.
  /// </summary>
  dlgSplashDX: TdlgSplashDX;

function SplashDialog: TdlgSplashDX;
begin
  if (NOT Assigned(dlgSplashDX)) then
    begin
      dlgSplashDX := TATGC.Collect(TdlgSplashDX.Create(NIL), MGC);
    end;

  Result := dlgSplashDX;
end;

constructor TdlgSplashDX.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

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

  FSocialIcons := [siEmailSupport, siWebsite];

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

class procedure TdlgSplashDX.ChangeStartMessage(
    const AValue: String = ''; const ASleepValue: Integer = 0);
begin
  SplashDialog.StartMessage := AValue;
  _SplashSleep(ASleepValue);
end;

procedure TdlgSplashDX.CreateParams(var Params: TCreateParams);
const
  CS_DROPSHADOW = $00020000;
begin
  inherited CreateParams(Params);

  Params.Style := WS_POPUP;
  Params.WindowClass.style := Params.WindowClass.style OR
                              CS_DROPSHADOW;
end;

procedure TdlgSplashDX.ExecuteSocialIconAction(Sender: TObject);
var
  ATag: TValue;
  AIconTag: TSplashSocialIcon;
  AURL: String;
begin
  if (NOT AT.Rtti.GetPropertyValue(Sender, 'Tag', ATag)) then
    Exit;

  AIconTag := TSplashSocialIcon(ATag.AsInteger);

  case AIconTag of
    siFacebook    : AURL := FFacebookURL;
    siGooglePlus  : AURL := FGooglePlusURL;
    siLinkedIn    : AURL := FLinkedInURL;
    siSkype       : AURL := FSkypeURL;
    siTwitter     : AURL := FTwitterURL;
    siYoutube     : AURL := FYoutubeURL;
    siEmailSupport: AURL := FEmailSupportURL;
    siProductPage : AURL := FProductPageURL;
    siSupportForum: AURL := FSupportForumURL;
    siWebsite     : AURL := FWebsiteURL;
  else
    AURL := EmptyStr;
  end;

  if (AURL.IsEmpty) then
    Exit;

  OpenURL(AURL);
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

function TdlgSplashDX.GetSplashBackgroundColor:
    TSplashBackgroundColor;
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

class procedure TdlgSplashDX.HideSplash(
    const ASleepValue: Integer = 200);
begin
  _SplashSleep(ASleepValue);
  SplashDialog.Hide;
end;

procedure TdlgSplashDX.LoadVersionInfo;
begin
  _LoadAppTitleFromVerInfo;
  _LoadCopyrightFromVerInfo;
  _LoadVersionFromVerInfo;
end;

procedure TdlgSplashDX.SetAnimationRestartDelay(const Value: Integer);
begin
  FAnimationRestartDelay := Value;
end;

procedure TdlgSplashDX.SetAnimationTime(const Value: Integer);
begin
  FAnimationTime := Value;
end;

procedure TdlgSplashDX.SetAppTitle(const Value: String);
begin
  lblAppTitle.Caption := Value;
end;

procedure TdlgSplashDX.SetArcThickness(const Value: Integer);
begin
  FArcThickness := Value;
end;

procedure TdlgSplashDX.SetContents(const Value: String);
begin
  lblContents.Caption := Value;
end;

procedure TdlgSplashDX.SetCopyright(const Value: String);
begin
  lblCopyright.Caption := Value;
end;

procedure TdlgSplashDX.SetCredits(const Value: String);
begin
  lblCredits.Caption := Value;
end;

procedure TdlgSplashDX.SetCustomBackgroundColor(const Value: TColor);
begin
  FCustomBackgroundColor := Value;
  FSplashBackgroundColor := sbcCustom;
  _UpdateSplashBackground;
end;

procedure TdlgSplashDX.SetCustomForegroundColor(const Value: TColor);
begin
  FCustomForegroundColor := Value;
end;

procedure TdlgSplashDX.SetDotCount(const Value: Integer);
begin
  FDotCount := Value;
end;

procedure TdlgSplashDX.SetDotSize(const Value: Integer);
begin
  FDotSize := Value;
end;

procedure TdlgSplashDX.SetEmailSupportURL(const Value: String);
begin
  FEmailSupportURL := Value;
end;

procedure TdlgSplashDX.SetFacebookURL(const Value: String);
begin
  FFacebookURL := Value;
end;

procedure TdlgSplashDX.SetGooglePlusURL(const Value: String);
begin
  FGooglePlusURL := Value;
end;

procedure TdlgSplashDX.SetIndicatorType(const Value:
    TSplashIndicatorType);
var
  AClass: TdxActivityIndicatorPropertiesClass;
begin
  FIndicatorType := Value;

  case Value of
    sitCircularDots  :
      AClass := TdxActivityIndicatorCircularDotsProperties;

    sitElasticCircle :
      AClass := TdxActivityIndicatorElasticCircleProperties;

    sitGravityDots   :
      AClass := TdxActivityIndicatorGravityDotsProperties;

    sitHorizontalDots:
      AClass := TdxActivityIndicatorHorizontalDotsProperties;
  else
    AClass := TdxActivityIndicatorHorizontalDotsProperties;
  end;

  actindSplash.PropertiesClass := AClass;

  _UpdateIndicatorProperties;
end;

procedure TdlgSplashDX.SetLinkedInURL(const Value: String);
begin
  FLinkedInURL := Value;
end;

procedure TdlgSplashDX.SetProductPageURL(const Value: String);
begin
  FProductPageURL := Value;
end;

procedure TdlgSplashDX.SetSkypeURL(const Value: String);
begin
  FSkypeURL := Value;
end;

procedure TdlgSplashDX.SetSocialIcons(const Value:
    TSplashSocialIcons);
begin
  FSocialIcons := Value;
end;

procedure TdlgSplashDX.SetSplashBackgroundColor(const Value:
    TSplashBackgroundColor);
begin
  FSplashBackgroundColor := Value;
  _UpdateSplashBackground;
end;

procedure TdlgSplashDX.SetSplashMode(const Value: TSplashMode);
begin
  FSplashMode := Value;

  _UpdateSplashMode;
end;

procedure TdlgSplashDX.SetStartMessage(const Value: String);
begin
  lblStartMsg.Caption := Value;
end;

procedure TdlgSplashDX.SetSupportForumURL(const Value: String);
begin
  FSupportForumURL := Value;
end;

procedure TdlgSplashDX.SetTwitterURL(const Value: String);
begin
  FTwitterURL := Value;
end;

procedure TdlgSplashDX.SetVersion(const Value: String);
begin
  FVersion := Value;
  lblVersion.Caption := Value;
end;

procedure TdlgSplashDX.SetWebsiteURL(const Value: String);
begin
  FWebsiteURL := Value;
end;

procedure TdlgSplashDX.SetYoutubeURL(const Value: String);
begin
  FYoutubeURL := Value;
end;

class function TdlgSplashDX.ShowSplash(
    const ABackgroundColor: TSplashBackgroundColor = sbcWhite;
    const AIndicatorType: TSplashIndicatorType = sitHorizontalDots;
    const AUseVerInfo: Boolean = True): TdlgSplashDX;
begin
  Result := SplashDialog;

  if (Result.Showing) then
    TdlgSplashDX.HideSplash;

  if (AUseVerInfo) then
    Result.LoadVersionInfo;

  Result.SplashBackgroundColor := ABackgroundColor;
  Result.SplashMode := smSplash;

  Result.IndicatorType := AIndicatorType;

  Result.Show;
end;

class function TdlgSplashDX.ShowSplash(
    const ASplashMode: TSplashMode;
    const ABackgroundColor: TSplashBackgroundColor = sbcWhite;
    const AIndicatorType: TSplashIndicatorType = sitHorizontalDots;
    const AUseVerInfo: Boolean = True): TdlgSplashDX;
begin
  Result := SplashDialog;

  Result.SplashMode := ASplashMode;

  if (Result.Showing) then
    TdlgSplashDX.HideSplash;

  if (AUseVerInfo) then
    Result.LoadVersionInfo;

  Result.SplashBackgroundColor := ABackgroundColor;

  Result.IndicatorType := AIndicatorType;

  case ASplashMode of
    smDialog: Result.ShowModal;
    smSplash: Result.Show;
  end;
end;

procedure TdlgSplashDX.UpdateSocialIconAction(Sender: TObject);
var
  AValue: TValue;
  AIcon: TSplashSocialIcon;
  AURL: String;
  AOk: Boolean;
begin
  if (NOT AT.Rtti.GetPropertyValue(Sender, 'Data', AValue)) then
    Exit;

  AIcon := TSplashSocialIcon(AValue.AsInteger);

  case AIcon of
    siFacebook    : AURL := FFacebookURL;
    siGooglePlus  : AURL := FGooglePlusURL;
    siLinkedIn    : AURL := FLinkedInURL;
    siSkype       : AURL := FSkypeURL;
    siTwitter     : AURL := FTwitterURL;
    siYoutube     : AURL := FYoutubeURL;
    siEmailSupport: AURL := FEmailSupportURL;
    siProductPage : AURL := FProductPageURL;
    siSupportForum: AURL := FSupportForumURL;
    siWebsite     : AURL := FWebsiteURL;
  else
    AURL := EmptyStr;
  end;

  AOk := ( (AIcon IN SocialIcons) AND (NOT AURL.IsEmpty) );

  SetPropertyValue(Sender, 'Enabled', AOk);
  SetPropertyValue(Sender, 'Visible', AOk);
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
  ABitness := verinfSplash.GetCustomKeyValue('Bitness');

  if (ABitness.IsEmpty) then
    Copyright := Format('%s' + #13 + '%s',
                        [AFileVer, verinfSplash.Copyright])
  else
    Copyright := Format('%s (%sbit)' + #13 + '%s',
                        [AFileVer, ABitness, verinfSplash.Copyright]);
end;

procedure TdlgSplashDX._LoadVersionFromVerInfo;
begin
  Version := verinfSplash.ProductVersion;
end;

class procedure TdlgSplashDX._SplashSleep(const ASleepValue: Integer);
var
  Idx: Integer;
begin
  for Idx := 0 to (ASleepValue - 1) do
    begin
      Application.ProcessMessages;
      Sleep(1);
    end;
end;

procedure TdlgSplashDX._UpdateIndicatorColors(const AColor: TColor);
begin
  FDotColor := dxColorToAlphaColor(AColor);

  _UpdateIndicatorProperties;
end;

procedure TdlgSplashDX._UpdateIndicatorProperties;
var
  AProps: TdxActivityIndicatorProperties;
begin
  AProps := actindSplash.Properties;

  SetPropertyValue(AProps, 'AnimationRestartDelay',
      FAnimationRestartDelay);
  SetPropertyValue(AProps, 'AnimationTime', FAnimationTime);
  SetPropertyValue(AProps, 'ArcColor', FDotColor);
  SetPropertyValue(AProps, 'ArcThickness', FArcThickness);
  SetPropertyValue(AProps, 'DotColor', FDotColor);
  SetPropertyValue(AProps, 'DotCount', FDotCount);
  SetPropertyValue(AProps, 'DotSize', FDotSize);
end;

procedure TdlgSplashDX._UpdateSplashBackground;
var
  AColor: TColor;
begin
  case FSplashBackgroundColor of
    sbcBlue  : AColor := $009A572B;
    sbcGreen : AColor := $00467321;
    sbcOrange: AColor := $002A47B7;
    sbcPurple: AColor := $007B3980;
    sbcWhite : AColor := clWhite;
    sbcYellow: AColor := $003EA5EA;
    sbcCustom: AColor := FCustomBackgroundColor;
  else
    AColor := clWhite;
  end;

  pnlSplash.Color := AColor;
  barSplash.Color := AColor;

  _UpdateSplashForegroundColors;
end;

procedure TdlgSplashDX._UpdateSplashForegroundColors;
var
  AColor: TColor;
begin
  case FSplashBackgroundColor of
    sbcBlue,
    sbcGreen,
    sbcOrange,
    sbcPurple : AColor := clWhite;
    sbcYellow,
    sbcWhite  : AColor := clBlack;
    sbcCustom : AColor := FCustomForegroundColor;
  else
    AColor := clBlack;
  end;

  lblAppTitle.Style.Font.Color := AColor;
  lblContents.Style.Font.Color := AColor;
  lblCopyright.Style.Font.Color := AColor;
  lblCredits.Style.Font.Color := AColor;
  lblStartMsg.Style.Font.Color := AColor;
  lblVersion.Style.Font.Color := AColor;

  _UpdateIndicatorColors(AColor);
end;

procedure TdlgSplashDX._UpdateSplashMode;
begin
  case FSplashMode of
    smDialog: begin
                Self.BorderIcons := [biSystemMenu];
                Self.BorderStyle := bsSingle;
                Self.ClientHeight := 548;
              end;

    smSplash: begin
                Self.BorderIcons := [];
                Self.BorderStyle := bsNone;
                Self.ClientHeight := 510;
              end;
  end;

  barSplash.Visible := (FSplashMode = smDialog);
  lblCredits.Visible := (FSplashMode = smDialog);
  actindSplash.Visible := (FSplashMode = smSplash);
  lblStartMsg.Visible := (FSplashMode = smSplash);
end;

end.
