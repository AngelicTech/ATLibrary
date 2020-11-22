// ******************************************************************
//
// Program Name   : AT Software_DNA Library
// Program Version:
// Platform(s)    : Win32, Win64, OSX
// Framework      : None
//
// Filename       : AT.SoftwareDNA.Consts.pas
// File Version   : 1.00
// Date Created   : 26-APR-2016
// Author         : Matthew S. Vesperman
//
// Description:
//
// Constants for Software_DNA
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


unit AT.SoftwareDNA.Consts;

interface

//Common constants - platform independent...
const
  /// <summary>
  ///   THE CDM WAS CORRECTLY VALIDATED AND THE LICENSE CONDITIONS
  ///   ARE BEING RESPECTED. IF A SERVER-VALIDATION WAS PERFORMED BY
  ///   THE DNA CLIENT, THEN A NEW CDM WAS CREATED.
  /// </summary>
  ERR_NO_ERROR 					= 0;
  /// <summary>
  ///   This is an Angelic Technology Software_DNA internal error
  ///   code. Indicates a dynamic library function load error.
  /// </summary>
  ERR_DLL_ERROR         = -4466;
  /// <summary>
  ///   THE NUMBER OF PERMITTED ACTIVATIONS WAS EXCEEDED. THE CURRENT
  ///   RE-ACTIVATION WAS ALLOWED. ALL PREVIOUS ACTIVATIONS HAVE BEEN
  ///   DISABLED AND WILL NEED TO BE RE-ACTIVATED.
  /// </summary>
  ERR_ACTIVATIONS_EXCEEDED      = -3;
  /// <summary>
  ///   THE FILE “<PRODUCT_ID&gt;.DNA” WAS FOUND IN THE SAME
  ///   DIRECTORY AS THE SOFTWARE AND WAS AUTHENTICATED. (SEE SECTION
  ///   4 OF THE SOFTWARE_DNA API REFERENCE GUIDE FOR MORE
  ///   INFORMATION ON HOW TO USE THIS ERROR CODE)
  /// </summary>
  ERR_DNA_DISABLE			 	= -2;
  /// <summary>
  ///   A “VALIDATION WARNING LIMIT” HAS BEEN REACHED AND A WARNING
  ///   SHOULD BE GIVEN TO THE USER THAT A VALIDATION MUST OCCUR
  ///   BEFORE THE <EXPIRATION_DATE&gt; IS REACHED.
  /// </summary>
  ERR_VALIDATION_WARNING		= -1;
  /// <summary>
  ///   NO CONNECTION TO SERVER (NO INTERNET, OR A PERSONAL FIREWALL,
  ///   OR A ROUTER, OR A PROXY SERVER MAY CAUSE THIS)
  /// </summary>
  ERR_NO_CONNECTION 	 		= 1;
  /// <summary>
  ///   CONNECTION WITH SERVER WAS LOST
  /// </summary>
  ERR_CONNECTION_LOST 			= 2;
  /// <summary>
  ///   LOCKOUT IN EFFECT – SERVER REFUSED COMMUNICATION
  /// </summary>
  ERR_LOCKOUT 				 	= 3;
  /// <summary>
  ///   THE CDM WAS NOT CREATED ON THE USER’S COMPUTER
  /// </summary>
  ERR_INVALID_CDM 		 		= 4;
  /// <summary>
  ///   BLANK <PRODUCT_KEY&gt; AS PARAMETER TO API
  /// </summary>
  /// <remarks>
  ///   Have discovered that this is also returned if an improper key
  ///   string is passed.
  /// </remarks>
  ERR_INVALID_PRODUCT_KEY 		= 5;
  /// <summary>
  ///   BLANK <ACTIVATION_CODE&gt; AS PARAMETER TO API
  /// </summary>
  ERR_INVALID_ACTIVATION_CODE 	= 6;
  /// <summary>
  ///   BLANK <PASSWORD&gt; OR BLANK <NEW_PASSWORD&gt; AS
  ///   PARAMETER TO API, OR <NEW_PASSWORD&gt; HAS BEEN USED
  ///   BEFORE
  /// </summary>
  ERR_INVALID_PASSWORD 			= 7;
  /// <summary>
  ///   <ACTIVATION CODE&gt; HAS NOT BEEN USED YET
  /// </summary>
  ERR_ACTIVATION_EXPECTED  		= 8;
  /// <summary>
  ///   <ACTIVATION CODE&gt; HAS ALREADY BEEN ACTIVATED
  /// </summary>
  ERR_REACTIVATION_EXPECTED		= 9;
  /// <summary>
  ///   <ACTIVATION_CODE&gt; BANNED AT THE SERVER
  /// </summary>
  ERR_BANNED_ACTIVATION_CODE	= 10;
  /// <summary>
  ///   NO <EMAIL&gt; ADDRESS WAS PROVIDED AT ACTIVATION. PASSWORD
  ///   NOT SENT AS A RESULT OF THE SEND_LOST_PASSWORD API CALL
  /// </summary>
  ERR_NO_EMAIL_PROVIDED			= 11;
  /// <summary>
  ///   BLANK <BUILD_NO&gt; AS PARAMETER TO API
  /// </summary>
  ERR_INVALID_BUILD_NO 			= 12;
  /// <summary>
  ///   AN <EVALUATION_CODE&gt; ALREADY SENT FOR THIS
  ///   <EMAIL&gt; ADDRESS OR THIS <MACHINE_ID&gt; (IF FLAG
  ///   SET)
  /// </summary>
  ERR_EVAL_CODE_ALREADY_SENT 	= 13;
  /// <summary>
  ///   NO <EVALUATION_CODE&gt;S ARE AVAILABLE FOR THIS PRODUCT
  /// </summary>
  ERR_EVAL_CODE_UNAVAILABLE 	= 14;
  /// <summary>
  ///   THE CDM HAS EXPIRED BASED ON THE <EXPIRY_PERIOD&gt; SET
  ///   DURING ACTIVATION PROCESS
  /// </summary>
  ERR_CDM_HAS_EXPIRED 		 	= 15;
  /// <summary>
  ///   THE CODE HAS EXPIRED BASED ON THE <EXPIRY_PERIOD&gt; SET
  ///   AT THE DNA SERVER
  /// </summary>
  ERR_CODE_HAS_EXPIRED 		 	= 16;
  /// <summary>
  ///   THE USER HAS ATTEMPTED TO RE-USE A PASSWORD DURING A
  ///   RE-ACTIVATION. THE USER DID SUPPLY THE CORRECT
  ///   <ACTIVATION_CODE&gt; AND <CURRENT_PASSWORD&gt; FROM THE
  ///   PREVIOUSLY USED <MACHINEID&gt;
  /// </summary>
  ERR_INVALID_NEW_PASSWORD 		= 17;
  /// <summary>
  ///   THE CURRENT USER DOES NOT HAVE “WRITE-PERMISSION” TO THE
  ///   TARGET DIRECTORY FOR THE CDM LICENSE FILE (AS SET BY
  ///   SETCDMPATHNAME)
  /// </summary>
  ERR_CDM_WRITE_PROTECTED       = 18;
  /// <summary>
  ///   MULTI-USER <ACTIVATION CODE&gt; HAS NOT BEEN USED YET;
  ///   THIS IS THE ACTIVATION OF THE 1ST SEAT FOR THIS CODE
  /// </summary>
  ERR_ACTIVATION_EXPECTED_MU    = 19;
  /// <summary>
  ///   MULTI-USER <ACTIVATION CODE> HAS BEEN ACTIVATED ONCE
  ///   (I.E. 1ST SEAT FOR THIS CODE); THIS IS AN ADDITIONAL “SEAT”
  ///   ACTIVATION
  /// </summary>
  ERR_REACTIVATION_EXPECTED_MU  = 20;
  /// <summary>
  ///   THE MAXIMUM NUMBER OF SEATS FOR THIS MULTI-USER CODE HAS BEEN
  ///   EXCEEDED. THE CURRENT ACTIVATION OF AN ADDITIONAL SEAT WAS
  ///   NOT ALLOWED
  /// </summary>
  ERR_ACTIVATIONS_EXCEEDED_MU 	= 21;
  /// <summary>
  ///   USER SELECTED THE “CANCEL” BUTTON IN THE DIALOG BOX
  /// </summary>
  ERR_CANCELLED_BY_USER			= 98;
  /// <summary>
  ///   OPERATION FAILED WITH THE SERVER
  /// </summary>
  ERR_OPERATION_FAILED			= 99;


//Mac OS X specific constants...


{$IF (Defined(MACOS) AND (NOT Defined(IOS)))}
  const
    //Dylib filename...
    //TODO: make sure dylib is deployed to app bundle...
    DNA_LIBNAME = 'libdna.dylib';
    //Dylib MD5 hash...
    //TODO: Make sure this matches the dylib version deployed...
    DNA_MD5 = 'D7726937FE94FDA6F67CEF4A4F4298B2';
{$IFEND}

{$IF (Defined(WIN32))}
  const
    //DLL filename...
    //TODO: make sure dll is deployed with app...
    DNA_LIBNAME = 'dna32.dll';
    //DLL MD5 hash...
    //TODO: Make sure this matches the dll version deployed...
    DNA_MD5 = 'A25256661969E6A13599597FA00436E3';
{$IFEND}

{$IF (Defined(WIN64))}
  const
    //DLL filename...
    //TODO: make sure dll is deployed with app...
    DNA_LIBNAME = 'dna64.dll';
    //DLL MD5 hash...
    //TODO: Make sure this matches the dll version deployed...
    DNA_MD5 = '5A304C147FCA8FD97D41CFDD149B92C7';
{$IFEND}


implementation

end.
