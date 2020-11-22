// ******************************************************************
//
// Program Name   : AT Software_DNA Library
// Program Version:
// Platform(s)    : Win32, Win64, OSX
// Framework      : None
//
// Filename       : AT.DNA.ResourceStrings.pas
// File Version   : 1.00
// Date Created   : 28-APR-2016
// Author         : Matthew S. Vesperman
//
// Description:
//
// Resource strings for SoftwareDNA.
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


unit AT.DNA.ResourceStrings;

interface

resourcestring

  //General strings...
  rstrActivate = 'Activate';
  rstrClose = 'Close';
  rstrDeactivate = 'Deactivate';
  rstrNext = 'Next >';
  rstrReactivate = 'Re-Activate';
  rstrRetrieve = 'Retrieve';
  rstrDaysSuffix = 's';
  rstrSave = 'Save';

  //Button strings...
  rstrBtnHidePassword = 'Hide Password';
  rstrBtnShowPassword = 'Show Password';


  //Activation Dialog...
  rstrActivateCap = 'Product Activation';
  rstrActivateCapFmt = 'Product Activation: %s';


  //Activation Code Dialog...
  rstrACodeEvalInsCap = 'Please enter either an Activation or ' +
                        'Evaluation code.';
  rstrACodeEvalInstruct = 'If you do not have an activation code ' +
                          'and wish to evaluate this software, ' +
                          'you may request an evaluation code by ' +
                          'clicking the Request Evaluation button ' +
                          'below.';
  rstrACodeInstruct = 'Your activation code was automatically ' +
                      'delivered to your email inbox after your ' +
                      'purchase.';
  rstrACodeInstructCap = 'Please enter your Activation code.';


  //Deactivation Dialog...
  rstrDActivateCap = 'Deactivate';
  rstrDActivateCapFmt = 'Deactivate: %s';


  //Evaluation Warning Dialog...
  rstrEvalWarnCap = 'Evaluation Notice';
  rstrEvalWarnCapFmt = 'Evaluation Notice: %s';
  rstrEvalWarnExpire = 'You evaluation of %s has expired.' +
                       #13 + #13 +
                       'If you are ready to purchase your license ' +
                       'you may do so by clicking the Buy Now ' +
                       'button below.' +
                       #13 + #13 +
                       'If you have already purchased a license ' +
                       'you may activate it by clicking the ' +
                       'Activate Purchase button below.';
  rstrEvalWarnLastDay = 'You are currently running an evaluation ' +
                        'version of %s and this is your last day.' +
                        #13 + #13 +
                        'Your evaluation will expire after today.' +
                        #13 + #13 +
                        'If you are ready to purchase your license ' +
                        'you may do so by clicking the Buy Now ' +
                        'button below.' +
                        #13 + #13 +
                        'If you have already purchased a license ' +
                        'you may activate it by clicking the ' +
                        'Activate Purchase button below.';
  rstrEvalWarnMultiDay = 'You are currently running an evaluation ' +
                         'version of %s with %d days remaining.' +
                         #13 + #13 +
                         'Your evaluation will expire on' +
                         #13 +
                         '%s' +
                         #13 + #13 +
                         'If you are ready to purchase your ' +
                         'license you may do so by clicking the ' +
                         'Buy Now button below.' +
                         #13 + #13 +
                         'If you have already purchased a license ' +
                         'you may activate it by clicking the ' +
                         'Activate Purchase button below.';
  rstrEvalWarnOneDay = 'You are currently running an evaluation ' +
                       'version of %s with 1 day remaining.' +
                       #13 + #13 +
                       'Your evaluation will expire on' +
                       #13 +
                       '%s' +
                       #13 + #13 +
                       'If you are ready to purchase your license ' +
                       'you may do so by clicking the Buy Now ' +
                       'button below.' +
                       #13 + #13 +
                       'If you have already purchased a license ' +
                       'you may activate it by clicking the ' +
                       'Activate Purchase button below.';


  //Forgot Password Dialog...
  rstrForgotPwdCap = 'Forgot Password';
  rstrForgotPwdCapFmt = 'Forgot Password: %s';


  //Proxy Settings Dialog...


  //Reactivation/Reactivation MU Dialogs...
  rstrRActivateCap = 'Product Re-Activation';
  rstrRActivateCapFmt = 'Product Re-Activation: %s';


  //Validation Warning Dialog...
  rstrVWarnDlgCap = 'Validation Warning';
  rstrVWarnDlgCapFmt = 'Validation Warning: %s';
  rstrVWarnDlgMsg = 'You need to connect to the Internet to ' +
                    'validate your %s license within the next ' +
                    '%d day%s to prevent your activation from ' +
                    'expiring.' + #13 + #13 + 'If you fail to do ' +
                    'so, your activation will expire on' + #13 + '%s';


  //Validation messages...
  rstrValCodeEmpty = 'You must enter a valid code.';
  rstrValCPwdEmpty = 'You must enter your CURRENT password.';
  rstrValCPwdNPwdMatch = 'The NEW password must be different ' +
                          'than your CURRENT password.';
  rstrValEmailConfirmEmpty = 'You must confirm your e-mail address.';
  rstrValEmailConfirmInvalid = 'Your confirmation e-mail address ' +
                               'is not valid.';
  rstrValEmailEmpty = 'You must enter a valid e-mail address.';
  rstrValEmailInvalid = 'Your e-mail address is not valid.';
  rstrValEmailMismatch = 'The e-mail addresses do not match.';
  rstrValNPwdConfirmEmpty = 'You must confirm your NEW password.';
  rstrValNPwdEmpty = 'You must enter a NEW, never before used ' +
                     'password.';
  rstrValNPwdMismatch = 'The NEW passwords do not match.';
  rstrValProxyHostEmpty = 'You must enter a server host name or ' +
                          'ip address.';
  rstrValProxyInvalid = 'The proxy information you entered is ' +
                        'incorrect.' + #13 + #13 + 'Please check ' +
                        'your settings and try again.';
  rstrValProxyUserEmpty = 'You must enter a user name.';
  rstrValPwdConfirmEmpty = 'You must confirm your password.';
  rstrValPwdConfirmWrong = 'You need to confirm the NEW password ' +
                           'not your CURRENT password.';
  rstrValPwdEmpty = 'You must enter a password.';
  rstrValPwdInvalid = 'Your password is not valid.' + #13 + #13 +
                      'Your password must be between 1 and 16 ' +
                      'characters. [A-Z, a-z, 0-9, -, @]';
  rstrValPwdMismatch = 'The passwords do not match.';
  rstrValYPwdEmpty = 'You must enter your password.';


  //SoftwareDNA Messages...
  rstrDNAECodeAlreadySent = 'You have already requested and ' +
                            'activated an evaluation code with ' +
                            'that e-mail address.';
  rstrDNAECodeSendFail = 'Your request has failed, please try ' +
                         'again later.';
  rstrDNAEvalCodeSent = 'Your request was successful, please check ' +
                        'your inbox for the evaluation code.';
  rstrDNALockout = 'Too many activation attempts. Your code has ' +
                   'been locked out until %s.';
  rstrDNANPwdInvalid = 'You have already used the new password you ' +
                        'specified. Please enter a different one.';
  rstrDNAPwdInvalid = 'You did not enter the correct password. ' +
                      'Please try again.';
  rstrDNAPwdSent = 'Your password has been sent.';
  rstrDNAPwdSendFail = 'Error retrieving your password.';
  rstrDNAUnknownError = 'Unknown Error: %d';

implementation

end.

