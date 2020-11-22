// ******************************************************************
//
// Program Name   : AT Software_DNA Library
// Program Version: 
// Platform(s)    : Win32, Win64, OSX
// Framework      : None
//
// Filename       : AT.SoftwareDNA.Types.pas
// File Version   : 1.00
// Date Created   : 26-APR-2016
// Author         : Matthew S. Vesperman
//
// Description:
//
// Types for SoftwareDNA.
//
// Revision History:
//
// v1.00   :   Initial version
//
// ******************************************************************
//
// COPYRIGHT © 2015 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************


unit AT.SoftwareDNA.Types;

interface

{$IF Defined(FMX)}
uses
  FMX.Forms;
{$ELSE}
uses
  Vcl.Forms;
{$IFEND}

type
  /// <summary>
  ///   Enum to specify the language for DNASetLanguage.
  /// </summary>
  TDNALanguage = (
    /// <summary>
    ///   English
    /// </summary>
    langEnglish,
    /// <summary>
    ///   French
    /// </summary>
    langFrench,
    /// <summary>
    ///   German
    /// </summary>
    langGerman,
    /// <summary>
    ///   Italian
    /// </summary>
    langItalian);


  /// <summary>
  ///   Enum to specify Param for DNAParam to lookup.
  /// </summary>
  TDNAParams = (
    /// <summary>
    ///   <ACTIVATION_CODE> IN CDM
    /// </summary>
    parmActivationCode,
    /// <summary>
    ///   <PRODUCT_TAG> IN CDM
    /// </summary>
    parmWebLink,
    /// <summary>
    ///   <MM/DD/YYYY> DATE OF ACTIVATION BASED ON THE USER’S
    ///   COMPUTER CLOCK
    /// </summary>
    parmActivationDate,
    /// <summary>
    ///   <MM/DD/YYYY> DATE OF ACTIVATION BASED ON THE DNA
    ///   SERVER CLOCK (EDT)
    /// </summary>
    parmServerActivationDate,
    /// <summary>
    ///   EMAIL ASSOCIATED WITH ACTIVATION CODE IF PROVIDED, OR ELSE
    ///   <BLANK>
    /// </summary>
    parmEmail,
    /// <summary>
    ///   <MM/DD/YYYY> DATE OF LAST RE-ACTIVATION WITH DNA
    ///   SERVER
    /// </summary>
    parmReactivationDate,
    /// <summary>
    ///   <MM/DD/YYYY> DATE OF LAST VALIDATION WITH DNA SERVER
    /// </summary>
    parmValidationDate,
    /// <summary>
    ///   PROTECTION LEVEL ASSIGNED TO SOFTWARE BY DNA SERVER
    /// </summary>
    parmProtectionLevel,
    /// <summary>
    ///   <MM/DD/YYYY> DATE THE CODE WILL EXPIRE OR
    ///   <BLANK> IF CODE NEVER EXPIRES
    /// </summary>
    parmExpiryDate,
    /// <summary>
    ///   <MM/DD/YYYY> DATE FOR THE NEXT MANDATORY DNA SERVER
    ///   VALIDATION – LEVEL 3 ONLY
    /// </summary>
    parmValidationLimit,
    /// <summary>
    ///   <MM/DD/YYYY> DATE PRIOR TO VALIDATION_LIMIT PROVIDED
    ///   AS A WARNING. STARTING ON THIS DATE, <br />API CALLS WILL
    ///   RETURN THE ERROR CODE “-1” ERR_VALIDATION_WARNING
    /// </summary>
    parmValidationWarning,
    /// <summary>
    ///   <BLANK> IF ACTIVATION CODE, OR “1” IF EVALUATION CODE
    /// </summary>
    parmEvalCode,
    /// <summary>
    ///   WILL RETURN THE SEAT SETTING FOR THIS ACTIVATION CODE
    ///   (AVAILABLE IN A FUTURE RELEASE)
    /// </summary>
    parmSeats,
    /// <summary>
    ///   <LICENSE_DATA> FOR THIS ACTIVATION CODE, OR
    ///   <BLANK>
    /// </summary>
    parmLicenseData,
    /// <summary>
    ///   WINDOWS INFORMATION FROM THE USER’S COMPUTER
    /// </summary>
    parmComputerName,
    /// <summary>
    ///   VERSION OF THE DNA.DLL (EX: “3.40”)
    /// </summary>
    parmClientVersion,
    /// <summary>
    ///   SERVER NAME OR ADDRESS FOR THE PROXY SERVER AS PROVIDED BY
    ///   THE USER
    /// </summary>
    parmProxyServer,
    /// <summary>
    ///   PROXY SERVER PORT AS PROVIDED BY THE USER
    /// </summary>
    parmProxyPort,
    /// <summary>
    ///   “USERNAME” FOR AUTHENTICATION BY PROXY SERVER AS PROVIDED
    ///   BY THE USER
    /// </summary>
    parmProxyUserName,
    /// <summary>
    ///   “PASSWORD” FOR AUTHENTICATION BY PROXY SERVER AS PROVIDED
    ///   BY THE USER
    /// </summary>
    parmProxyPassword,
    /// <summary>
    ///   RETURNS VALUE OF USERAGENT WHICH IS “SOFTWAREDNA/1.0”
    /// </summary>
    parmProxyUserAgent,
    /// <summary>
    ///   <para>
    ///     IF “1”, DLL IS USING THE INTERNET EXPLORER SETTINGS, IF
    ///     ANY
    ///   </para>
    ///   <para>
    ///     IF “0”, DLL IS USING THE MANUALLY SET PROXY SETTINGS IF
    ///     ANY
    ///   </para>
    /// </summary>
    parmProxyUseIESettings,
    /// <summary>
    ///   <para>
    ///     <BLANK> IF “ANTI-FRAUD” IS NOT SELECTED
    ///   </para>
    ///   <para>
    ///     <BLANK> IF CODE HAS BEEN SUCCESSFULLY VALIDATED
    ///     DURING THE 45 TO 60 DAY PERIOD AFTER INITIAL ACTIVATION
    ///   </para>
    ///   <para>
    ///     “1” IF CODE HAS NOT YET SUCCESSFULLY BEEN VALIDATED.
    ///     THIS WILL BE RETURNED DURING THE ENTIRE 60
    ///   </para>
    ///   <para>
    ///     DAY PERIOD UP TO THE TIME OF SUCCESSFUL VALIDATION.
    ///   </para>
    /// </summary>
    parmAntiFraud,
    /// <summary>
    ///   WILL RETURN THE VALUE EMBEDDED IN THE LAST ERROR MESSAGE
    ///   FROM SOFTWARE_DNA: <br />• FOR “VALIDATION WARNING”, WILL
    ///   RETURN <MM/DD/YYYY>, DATE OF EXPIRATION <br />• FOR
    ///   “LOCKOUT”, WILL RETURN THE DATE AND TIME <MM/DD/YYYY
    ///   HH:MM:SS>, THE END DATE/TIME OF THE LOCKOUT PERIOD
    /// </summary>
    parmLastResultValue
  );


  //Callback types...

  /// <summary>
  ///   Defines a procedure type that can be attached to the
  ///   Evaluation Notice and Evaluation Expired dialogs
  ///   to handle clicks on the Activate Purchase button.
  /// </summary>
  TDNAActivatePurchaseHandler = reference to procedure
    (AForm: TCustomForm);
  /// <summary>
  ///   Defines a procedure type that can be attached to the
  ///   Evaluation Notice and Evaluation Expired dialogs
  ///   to handle clicks on the Buy Now! button.
  /// </summary>
  TDNABuyNowHandler = reference to procedure(AForm: TCustomForm);
  /// <summary>
  ///   Defines a procedure type that can be attached to the dialog
  ///   to handle clicks on the forgot password button.
  /// </summary>
  /// <seealso cref="AttachForgotPwdHandler" />
  TDNAForgotPwdHandler = reference to procedure(AForm: TCustomForm);
  /// <summary>
  ///   Defines a procedure type that can be attached to the dialog
  ///   to handle clicks on the proxy settings button.
  /// </summary>
  TDNAProxySettingHandler = reference to procedure
    (AForm: TCustomForm);
  /// <summary>
  ///   Defines a procedure type that can be attached to the dialog
  ///   to handle clicks on the request evaluation button.
  /// </summary>
  TDNARequestEvalHandler = reference to procedure(AForm: TCustomForm);


implementation

end.
