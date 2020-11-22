// ******************************************************************
//
// Program Name   : AT Library
// Program Version:
// Platform(s)    : Win32, Win64
// Framework      : None
//
// Filename       : AT.SoftwareDNA.Windows.pas
// File Version   : 1.00
// Date Created   : 26-APR-2016
// Author         : Matthew S. Vesperman
//
// Description:
//
// Software DNA Interface for Windows
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

unit AT.SoftwareDNA.Windows;

interface


uses

  AT.SoftwareDNA.Types;

function DNAActivate(Key, Code, Email, Password: String;
  out Error: Integer): Boolean;
function DNAActivateOffline(Key, Code: String;
  out Error: Integer): Boolean;
function DNAActivatePurchase(Key: String; UseMachineID: Boolean;
  out Error: Integer): Boolean;
function DNADeactivate(Key, Password: String;
  out Error: Integer): Boolean;
function DNAError(ErrorNo: Integer; out Msg: String): Boolean;
function DNAEvaluateNow(Key: String; out Error: Integer): Boolean;
function DNAInfoTag(Key, Code, Tag: String;
  out Error: Integer): Boolean;
function DNAParam(Param: TDNAParams; out Value: String;
  out Error: Integer): Boolean;
function DNAProtectionOK(Key: String;
  RequestEvalCode, UseMachineID: Boolean; out Error: Integer)
  : Boolean;
function DNAProtectionOK2(Key: String;
  RequestEvalCode, UseMachineID: Boolean; out Error: Integer)
  : Boolean;
function DNAQuery(Key, Code: String; out Error: Integer): Boolean;
function DNAReactivate(Key, Code, OldPwd, NewPwd: String;
  out Error: Integer): Boolean;
function DNASendEvalCode(Key, Email: String; UseMachineID: Boolean;
  out Error: Integer): Boolean;
function DNASendPassword(Key, Code: String;
  out Error: Integer): Boolean;
function DNASetBuildNo(BuildNumber: String;
  out Error: Integer): Boolean;
function DNASetCDMPathName(Folder, FileName: String;
  out Error: Integer; FileExt: String = '.cdm'): Boolean;
function DNASetINIPathName(Folder, FileName: String;
  out Error: Integer; FileExt: String = '.ini'): Boolean;
function DNASetLanguage(Language: TDNALanguage;
  out Error: Integer): Boolean;
function DNASetProxy(Server, Port, UserName, Password: String;
  out Error: Integer): Boolean;
function DNAUseIESettings(UseIESettings: Boolean;
  out Error: Integer): Boolean;
function DNAValidate(Key: String; out Error: Integer): Boolean;
function DNAValidate2(Key: String; out Error: Integer): Boolean;
function DNAValidate3(Key: String; out Error: Integer): Boolean;
function DNAValidate4(Key: String; out Error: Integer): Boolean;
function DNAValidate5(Key: String; out Error: Integer): Boolean;
function DNAValidateCDM(Key: String; out Error: Integer): Boolean;
function DNAValidateCDM2(Key: String; out Error: Integer): Boolean;
function DNAValidateCDM3(Key: String; out Error: Integer): Boolean;
function DNAValidateCDM4(Key: String; out Error: Integer): Boolean;
function DNAValidateCDM5(Key: String; out Error: Integer): Boolean;
function RndValidate(Key: String; out Error: Integer): Boolean;
function RndValidateCDM(Key: String; out Error: Integer): Boolean;

var
  LibHandle: THandle;


implementation


uses
  AT.SoftwareDNA.Consts, System.SysUtils, AT.GarbageCollector,
  Winapi.Windows, AT.DNA.VCL.Dlg.ActivationCode, System.UITypes,
  VCL.Forms, AT.DNA.VCL.Dlg.RequestEval, System.Math,
  System.DateUtils, AT.DNA.VCL.Dlg.ValidationWarning,
  AT.DNA.VCL.Dlg.ProxySettings, VCL.Dialogs,
  AT.DNA.VCL.Dlg.Activation, AT.DNA.VCL.Dlg.Reactivation,
  AT.DNA.VCL.Dlg.ReactivationMU, AT.DNA.VCL.Dlg.ForgotPwd;

type
  TDNA_ActivateFunc = function(ProductKey, ActivationCode, Password,
    Email: PAnsiChar): Integer; stdcall;
  TDNA_ActivateOfflineFunc = function(ProductKey, ActivationCode
    : PAnsiChar): Integer; stdcall;
  TDNA_DeactivateFunc = function(ProductKey, Password: PAnsiChar)
    : Integer; stdcall;
  TDNA_ErrorFunc = function(ErrorNo: Integer; Msg: PAnsiChar;
    MsgSize: Integer): Integer; stdcall;
  TDNA_EvalNowFunc = function(ProductKey: PAnsiChar)
    : Integer; stdcall;
  TDNA_InfoTagFunc = function(ProductKey, ActivationCode,
    Tag: PAnsiChar): Integer; stdcall;
  TDNA_ParamFunc = function(Param, Value: PAnsiChar;
    ValueSize: Integer): Integer; stdcall;
  TDNA_ProtOKFunc = function(ProductKey: PAnsiChar;
    RequestEvalCode, UseMachineID: Integer): Integer; stdcall;
  TDNA_QueryFunc = function(ProductKey, ActivationCode: PAnsiChar)
    : Integer; stdcall;
  TDNA_ReactivateFunc = function(ProductKey, ActivationCode,
    OldPassword, NewPassword: PAnsiChar): Integer; stdcall;
  TDNA_SendEvalCodeFunc = function(ProductKey, Email: PAnsiChar;
    UseMachineID: Integer): Integer stdcall;
  TDNA_SendPwdFunc = function(ProductKey, ActivationCode: PAnsiChar)
    : Integer; stdcall;
  TDNA_SetBuildNoFunc = function(BuildNo: PAnsiChar)
    : Integer; stdcall;
  TDNA_SetPathNameFunc = function(PathName: PAnsiChar)
    : Integer; stdcall;
  TDNA_SetLangFunc = function(Language: Integer): Integer; stdcall;
  TDNA_SetProxyFunc = function(Server, Port, UserName,
    Password: PAnsiChar): Integer; stdcall;
  TDNA_UseIEFunc = function(UseIESettings: Integer): Integer; stdcall;
  TDNA_ValidateFunc = function(ProductKey: PAnsiChar)
    : Integer; stdcall;

var
  _DNA_Activate: TDNA_ActivateFunc;
  _DNA_ActivateOffline: TDNA_ActivateOfflineFunc;
  _DNA_Deactivate: TDNA_DeactivateFunc;
  _DNA_Error: TDNA_ErrorFunc;
  _DNA_EvaluateNow: TDNA_EvalNowFunc;
  _DNA_InfoTag: TDNA_InfoTagFunc;
  _DNA_Param: TDNA_ParamFunc;
  _DNA_ProtectionOK: TDNA_ProtOKFunc;
  _DNA_Query: TDNA_QueryFunc;
  _DNA_Reactivate: TDNA_ReactivateFunc;
  _DNA_SendEvalCode: TDNA_SendEvalCodeFunc;
  _DNA_SendPassword: TDNA_SendPwdFunc;
  _DNA_SetBuildNo: TDNA_SetBuildNoFunc;
  _DNA_SetCDMPathName: TDNA_SetPathNameFunc;
  _DNA_SetINIPathName: TDNA_SetPathNameFunc;
  _DNA_SetLanguage: TDNA_SetLangFunc;
  _DNA_SetProxy: TDNA_SetProxyFunc;
  _DNA_UseIESettings: TDNA_UseIEFunc;
  _DNA_Validate: TDNA_ValidateFunc;
  _DNA_Validate2: TDNA_ValidateFunc;
  _DNA_Validate3: TDNA_ValidateFunc;
  _DNA_Validate4: TDNA_ValidateFunc;
  _DNA_Validate5: TDNA_ValidateFunc;
  _DNA_ValidateCDM: TDNA_ValidateFunc;
  _DNA_ValidateCDM2: TDNA_ValidateFunc;
  _DNA_ValidateCDM3: TDNA_ValidateFunc;
  _DNA_ValidateCDM4: TDNA_ValidateFunc;
  _DNA_ValidateCDM5: TDNA_ValidateFunc;

procedure FillChar(var X: AnsiString; const Dummy: Integer;
  const Value: Char);
var
  Idx: Integer;
begin
  for Idx := Low(X) to High(X) do
    X[Idx] := #0;
end;

procedure _LoadLibrary;
begin
  if (LibHandle = 0) then
    begin
      LibHandle := LoadLibrary(DNA_LIBNAME);
    end;
end;

function _LibraryHandle: THandle;
begin
  if (LibHandle = 0) then
    _LoadLibrary;

  Result := LibHandle;
end;

function _LoadFunction(FunctionName: String): Pointer;
var
  ALibH: THandle;
  AFuncName: String;
begin
  ALibH := _LibraryHandle;

  if (ALibH <> 0) then
    begin
      AFuncName := Format('%s', [FunctionName]);

      Result := GetProcAddress(ALibH, PWideChar(AFuncName));
    end
  else
    Result := NIL;
end;

function _Validate(Key: String; out Error: Integer): Boolean;
var
  Idx: Integer;
begin
  Idx := random(5);
  case Idx of
    0:
      Result := DNAValidate(Key, Error);
    1:
      Result := DNAValidate2(Key, Error);
    2:
      Result := DNAValidate3(Key, Error);
    3:
      Result := DNAValidate4(Key, Error);
    4:
      Result := DNAValidate5(Key, Error);
  else
    Result := DNAValidate(Key, Error);
  end;
end;

function _ValidateCDM(Key: String; out Error: Integer): Boolean;
var
  Idx: Integer;
begin
  Idx := random(5);
  case Idx of
    0:
      Result := DNAValidateCDM(Key, Error);
    1:
      Result := DNAValidateCDM2(Key, Error);
    2:
      Result := DNAValidateCDM3(Key, Error);
    3:
      Result := DNAValidateCDM4(Key, Error);
    4:
      Result := DNAValidateCDM5(Key, Error);
  else
    Result := DNAValidateCDM(Key, Error);
  end;
end;

function _ValidationWarning: Boolean;
var
  Error: Integer;
  ACode: String;
  AAntiFraud: String;
  AExpiry: String;
  dtExpiry: TDateTime;
  ADaysLeft: Integer;
  APLevel: String;
  ADlg: TDNAValidationWarnDlg;
  AGC: IATGarbageCollector;
begin
  if (NOT DNAParam(parmActivationCode, ACode, Error)) then
    Exit(False);

  if (NOT DNAParam(parmAntiFraud, AAntiFraud, Error)) then
    Exit(False);

  if (NOT DNAParam(parmValidationLimit, AExpiry, Error)) then
    Exit(False);

  if (NOT TryStrToDateTime(AExpiry, dtExpiry)) then
    Exit(False);

  ADaysLeft := Ceil(DaySpan(dtExpiry, Now));

  if (AAntiFraud <> '1') then
    begin
      if (NOT DNAParam(parmProtectionLevel, APLevel, Error)) then
        Exit(False);

      if (APLevel <> '3') then
        Exit(True);
    end;

  ADlg := TATGC.Collect(TDNAValidationWarnDlg.Create(NIL), AGC);

  ADlg.BeginUpdate;
  ADlg.ActivationCode := ACode;
  ADlg.DaysLeft := ADaysLeft;
  ADlg.ExpireDate := dtExpiry;
  ADlg.EndUpdate;

  ADlg.ShowModal;

  Result := False;
end;

function _RequestEvalCode(AKey: String; AUseMachineID: Boolean;
  out Error: Integer): Boolean;
var
  ADlg: TDNARequestEvalDlg;
  AGC: IATGarbageCollector;
  AMsg: String;
begin
  if (AKey.IsEmpty) then
    begin
      Error := ERR_INVALID_PRODUCT_KEY;
      Exit(False);
    end;

  ADlg := TATGC.Collect(TDNARequestEvalDlg.Create(NIL), AGC);

  if (ADlg.ShowModal = mrOk) then
    begin
      Result := DNASendEvalCode(AKey, ADlg.EmailAddress,
        AUseMachineID, Error);
      if (Result) then
        begin
          AMsg := 'Your request was successful, please check your ' +
            'inbox for the evaluation code.';
          MessageDlg(AMsg, TMsgDlgType.mtInformation,
            [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
        end
      else
        begin
          ShowMessage(Format('Error: %d', [Error]));
          case Error of
            ERR_EVAL_CODE_ALREADY_SENT:
              AMsg := 'You have already requested and activated ' +
                'an evaluation code with that e-mail address.';
          else
            AMsg := 'Your request has failed, please try again '
              + 'later.';
          end;

          MessageDlg(AMsg, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0,
            TMsgDlgBtn.mbOK);
        end;
    end
  else
    begin
      Error := ERR_CANCELLED_BY_USER;
      Exit(False);
    end;
end;

function _SetProxySettings(out Error: Integer): Boolean;
var
  ADlg: TDNAProxySettingsDlg;
  AGC: IATGarbageCollector;
begin
  ADlg := TATGC.Collect(TDNAProxySettingsDlg.Create(NIL), AGC);

  if (ADlg.ShowModal = mrOk) then
    begin
      if (NOT DNAUseIESettings(False, Error)) then
        Exit(False);

      Exit(DNASetProxy(ADlg.Server, ADlg.Port, ADlg.UserName,
        ADlg.Password, Error))
    end
  else
    begin
      Error := ERR_CANCELLED_BY_USER;
      Exit(False);
    end;
end;

function _GetActivationCode(AKey: String; ARequestEval: Boolean;
  AUseMachineID: Boolean; out ACode: String;
  out Error: Integer): Boolean;
var
  ADlg: TDNAActivationCodeDlg;
  AGC: IATGarbageCollector;
  Err: Integer;
begin
  ADlg := TATGC.Collect(TDNAActivationCodeDlg.Create(NIL), AGC);

  ADlg.EvaluateButtonVisible := ARequestEval;

  if (ARequestEval) then
    begin
      ADlg.AttachRequestEvalHandler(
        procedure(AForm: TCustomForm)
        begin
          _RequestEvalCode(AKey, AUseMachineID, Err);
        end);
    end;

  ADlg.AttachProxySettingHandler(
    procedure(AForm: TCustomForm)
    begin
      _SetProxySettings(Err);
    end);

  Result := (ADlg.ShowModal = mrOk);

  if (Result) then
    begin
      ACode := ADlg.ActivationCode;
      Error := ERR_NO_ERROR;
      Exit(True);
    end
  else
    begin
      ACode := EmptyStr;
      Error := ERR_CANCELLED_BY_USER;
      Exit(False)
    end;
end;

function _PerformActivation(AKey, ACode: String;
out Error: Integer): Boolean;
var
  ADlg: TDNAActivationDlg;
  AGC: IATGarbageCollector;
begin
  ADlg := TATGC.Collect(TDNAActivationDlg.Create(NIL), AGC);

  ADlg.ActivationCode := ACode;

  if (ADlg.ShowModal = mrOk) then
    begin
      Exit(DNAActivate(AKey, ACode, ADlg.EmailAddress,
        ADlg.Password, Error));
    end
  else
    begin
      Error := ERR_CANCELLED_BY_USER;
      Exit(False);
    end;
end;

function _PerformActivationMU(AKey, ACode: String;
out Error: Integer): Boolean;
var
  ADlg: TDNAActivationDlg;
  AGC: IATGarbageCollector;
begin
  ADlg := TATGC.Collect(TDNAActivationDlg.Create(NIL), AGC);

  ADlg.ActivationCode := ACode;

  if (ADlg.ShowModal = mrOk) then
    begin
      Exit(DNAActivate(AKey, ACode, ADlg.EmailAddress,
        ADlg.Password, Error));
    end
  else
    begin
      Error := ERR_CANCELLED_BY_USER;
      Exit(False);
    end;
end;

function _ForgotPwd(AKey, ACode: String; out Error: Integer): Boolean;
var
  AMsg: String;
begin
  if (AKey.IsEmpty) then
    begin
      Error := ERR_INVALID_PRODUCT_KEY;
      Exit(False);
    end;

  if (ACode.IsEmpty) then
    begin
      Error := ERR_INVALID_ACTIVATION_CODE;
      Exit(False);
    end;

  Result := DNASendPassword(AKey, ACode, Error);

  if (Result) then
    begin
      AMsg := 'Your password has been sent.';
      MessageDlg(AMsg, TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK],
        0, TMsgDlgBtn.mbOK);
    end
  else
    begin
      AMsg := 'Error retrieving your password.';
      MessageDlg(AMsg, TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK],
        0, TMsgDlgBtn.mbOK);
    end;
end;

function _PerformReactivation(AKey, ACode: String;
out Error: Integer): Boolean;
var
  ADlg: TDNAReactivationDlg;
  AGC: IATGarbageCollector;
  AMsg: String;
  Err: Integer;
  ALockoutDT: String;
begin
  ADlg := TATGC.Collect(TDNAReactivationDlg.Create(NIL), AGC);

  ADlg.ActivationCode := ACode;

  ADlg.AttachForgotPwdHandler(
    procedure(AForm: TCustomForm)
    begin
      _ForgotPwd(AKey, ACode, Err);
    end);

  if (ADlg.ShowModal = mrOk) then
    begin
      Result := DNAReactivate(AKey, ACode, ADlg.CurrentPassword,
        ADlg.NewPassword, Error);

      if (NOT Result) then
        begin
          case Error of
            ERR_INVALID_PASSWORD:
              AMsg := 'You did not enter the correct password. ' +
                'Please try again.';
            ERR_INVALID_NEW_PASSWORD:
              AMsg := 'You have already used the new password you ' +
                'specified. Please enter a different one.';
            ERR_LOCKOUT:
              begin
                DNAParam(parmLastResultValue, ALockoutDT, Err);
                AMsg := Format('Too many activation attempts. ' +
                  'Your code has been locked out ' + 'until %s.',
                  [ALockoutDT]);
              end;
          else
            AMsg := Format('Unknown Error: %d', [Error]);
          end;

          MessageDlg(AMsg, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0,
            TMsgDlgBtn.mbOK);
          Result := _PerformReactivation(AKey, ACode, Error);
        end;
    end
  else
    begin
      Error := ERR_CANCELLED_BY_USER;
      Exit(False);
    end;
end;

function _PerformReactivationMU(AKey, ACode: String;
out Error: Integer): Boolean;
var
  ADlg: TDNAReactivationMUDlg;
  AGC: IATGarbageCollector;
  AMsg: String;
  Err: Integer;
  ALockoutDT: String;
begin
  ADlg := TATGC.Collect(TDNAReactivationMUDlg.Create(NIL), AGC);

  ADlg.ActivationCode := ACode;

  ADlg.AttachForgotPwdHandler(
    procedure(AForm: TCustomForm)
    begin
      _ForgotPwd(AKey, ACode, Err);
    end);

  if (ADlg.ShowModal = mrOk) then
    begin
      Result := DNAReactivate(AKey, ACode, ADlg.Password,
        EmptyStr, Error);

      if (NOT Result) then
        begin
          case Error of
            ERR_INVALID_PASSWORD:
              AMsg := 'You did not enter the correct password. ' +
                'Please try again.';
            ERR_INVALID_NEW_PASSWORD:
              AMsg := 'You have already used the new password you ' +
                'specified. Please enter a different one.';
            ERR_LOCKOUT:
              begin
                DNAParam(parmLastResultValue, ALockoutDT, Err);
                AMsg := Format('Too many activation attempts. ' +
                  'Your code has been locked out ' + 'until %s.',
                  [ALockoutDT]);
              end;
          else
            AMsg := Format('Unknown Error: %d', [Error]);
          end;

          MessageDlg(AMsg, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0,
            TMsgDlgBtn.mbOK);
          Result := _PerformReactivation(AKey, ACode, Error);
        end;
    end
  else
    begin
      Error := ERR_CANCELLED_BY_USER;
      Exit(False);
    end;
end;

function DNAActivate(Key, Code, Email, Password: String;
out Error: Integer): Boolean;
var
  AKey, ACode, APwd, AEmail: AnsiString;
begin
  if (NOT Assigned(_DNA_Activate)) then
    @_DNA_Activate := _LoadFunction('DNA_Activate');

  if (NOT Assigned(_DNA_Activate)) then
    begin
      Error := ERR_DLL_ERROR;
      Exit(False);
    end;

  AKey := AnsiString(Key);
  ACode := AnsiString(Code);
  APwd := AnsiString(Password);
  AEmail := AnsiString(Email);

  Error := _DNA_Activate(PAnsiChar(AKey), PAnsiChar(ACode),
    PAnsiChar(APwd), PAnsiChar(AEmail));

  Result := (Error = ERR_NO_ERROR);
end;

function DNAActivateOffline(Key, Code: String;
out Error: Integer): Boolean;
var
  AKey, ACode: AnsiString;
begin
  if (NOT Assigned(_DNA_ActivateOffline)) then
    @_DNA_ActivateOffline := _LoadFunction('DNA_ActivateOffline');

  if (NOT Assigned(_DNA_ActivateOffline)) then
    begin
      Error := ERR_DLL_ERROR;
      Exit(False);
    end;

  AKey := AnsiString(Key);
  ACode := AnsiString(Code);

  Error := _DNA_ActivateOffline(PAnsiChar(AKey), PAnsiChar(ACode));

  Result := (Error = ERR_NO_ERROR);
end;

function DNAActivatePurchase(Key: String; UseMachineID: Boolean;
  out Error: Integer): Boolean;
var
  ACode: String;
begin
  if (NOT _GetActivationCode(Key, False, UseMachineID,
    ACode, Error)) then
    Exit(False);

  DNAQuery(Key, ACode, Error);

  case Error of
    ERR_ACTIVATION_EXPECTED:
      Result := _PerformActivation(Key, ACode, Error);
    ERR_ACTIVATION_EXPECTED_MU:
      Result := _PerformActivationMU(Key, ACode, Error);
    ERR_REACTIVATION_EXPECTED:
      Result := _PerformReactivation(Key, ACode, Error);
    ERR_REACTIVATION_EXPECTED_MU:
      Result := _PerformReactivationMU(Key, ACode, Error);
  else
    Exit(False);
  end;
end;

function DNADeactivate(Key, Password: String;
out Error: Integer): Boolean;
var
  AKey, APwd: AnsiString;
begin
  if (NOT Assigned(_DNA_Deactivate)) then
    @_DNA_Deactivate := _LoadFunction('DNA_Deactivate');

  if (NOT Assigned(_DNA_Deactivate)) then
    begin
      Error := ERR_DLL_ERROR;
      Exit(False);
    end;

  AKey := AnsiString(Key);
  APwd := AnsiString(Password);

  Error := _DNA_Deactivate(PAnsiChar(AKey), PAnsiChar(APwd));

  Result := (Error = ERR_NO_ERROR);
end;

function DNAError(ErrorNo: Integer; out Msg: String): Boolean;
var
  AMsg: AnsiString;
  AMsgSize: Integer;
  Error: Integer;
begin
  if (NOT Assigned(_DNA_Error)) then
    @_DNA_Error := _LoadFunction('DNA_Error');

  if (NOT Assigned(_DNA_Error)) then
    Exit(False);

  AMsgSize := 512;
  AMsg := StringOfChar(AnsiChar(#0), AMsgSize);

  Error := _DNA_Error(ErrorNo, PAnsiChar(AMsg), AMsgSize);

  if (Error = ERR_NO_ERROR) then
    begin
      Msg := String(PAnsiChar(AMsg));
    end
  else
    Msg := '';

  Result := (Error = ERR_NO_ERROR);
end;

function DNAEvaluateNow(Key: String; out Error: Integer): Boolean;
var
  AKey: AnsiString;
begin
  if (NOT Assigned(_DNA_EvaluateNow)) then
    @_DNA_EvaluateNow := _LoadFunction('DNA_EvaluateNow');

  if (NOT Assigned(_DNA_EvaluateNow)) then
    begin
      Error := ERR_DLL_ERROR;
      Exit(False);
    end;

  AKey := AnsiString(Key);

  Error := _DNA_EvaluateNow(PAnsiChar(AKey));

  Result := (Error = ERR_NO_ERROR);
end;

function DNAInfoTag(Key, Code, Tag: String;
out Error: Integer): Boolean;
var
  AKey, ACode, ATag: AnsiString;
begin
  if (NOT Assigned(_DNA_InfoTag)) then
    @_DNA_InfoTag := _LoadFunction('DNA_InfoTag');

  if (NOT Assigned(_DNA_InfoTag)) then
    begin
      Error := ERR_DLL_ERROR;
      Exit(False);
    end;

  AKey := AnsiString(Key);
  ACode := AnsiString(Code);
  ATag := AnsiString(Tag);

  Error := _DNA_InfoTag(PAnsiChar(AKey), PAnsiChar(ACode),
    PAnsiChar(ATag));

  Result := (Error = ERR_NO_ERROR);
end;

function DNAParam(Param: TDNAParams; out Value: String;
out Error: Integer): Boolean;
var
  AParam: AnsiString;
  AValue: AnsiString;
  AValueSize: Integer;
begin
  if (NOT Assigned(_DNA_Param)) then
    @_DNA_Param := _LoadFunction('DNA_Param');

  if (NOT Assigned(_DNA_Param)) then
    begin
      Error := ERR_DLL_ERROR;
      Exit(False);
    end;

  case Param of
    parmActivationCode:
      AParam := 'ACTIVATION_CODE';
    parmWebLink:
      AParam := 'WEB_LINK';
    parmActivationDate:
      AParam := 'ACTIVATION_DATE';
    parmServerActivationDate:
      AParam := 'SERVER_ACTIVATION_DATE';
    parmEmail:
      AParam := 'EMAIL';
    parmReactivationDate:
      AParam := 'REACTIVATION_DATE';
    parmValidationDate:
      AParam := 'VALIDATION_DATE';
    parmProtectionLevel:
      AParam := 'PROTECTION_LEVEL';
    parmExpiryDate:
      AParam := 'EXPIRY_DATE';
    parmValidationLimit:
      AParam := 'VALIDATION_LIMIT';
    parmValidationWarning:
      AParam := 'VALIDATION_WARNING';
    parmEvalCode:
      AParam := 'EVAL_CODE';
    parmSeats:
      AParam := 'SEATS';
    parmLicenseData:
      AParam := 'LICENSE_DATA';
    parmComputerName:
      AParam := 'COMPUTER_NAME';
    parmClientVersion:
      AParam := 'CLIENT_VERSION';
    parmProxyServer:
      AParam := 'PROXY_SERVER';
    parmProxyPort:
      AParam := 'PROXY_PORT';
    parmProxyUserName:
      AParam := 'PROXY_USERNAME';
    parmProxyPassword:
      AParam := 'PROXY_PASSWORD';
    parmProxyUserAgent:
      AParam := 'PROXY_USERAGENT';
    parmProxyUseIESettings:
      AParam := 'PROXY_USE_IESETTINGS';
    parmAntiFraud:
      AParam := 'ANTI_FRAUD';
    parmLastResultValue:
      AParam := 'LAST_RESULT_VALUE';
  else
    Exit(False); // should never happen...
  end;

  AValueSize := 512;
  AValue := StringOfChar(AnsiChar(#0), AValueSize);

  Error := _DNA_Param(PAnsiChar(AParam), PAnsiChar(AValue),
    AValueSize);

  if (Error = ERR_NO_ERROR) then
    begin
      Value := String(PAnsiChar(AValue));
    end
  else
    Value := '';

  Result := (Error = ERR_NO_ERROR);
end;

function DNAProtectionOK(Key: String;
RequestEvalCode, UseMachineID: Boolean; out Error: Integer): Boolean;
var
  AKey: AnsiString;
begin
  if (NOT Assigned(_DNA_ProtectionOK)) then
    @_DNA_ProtectionOK := _LoadFunction('DNA_ProtectionOK');

  if (NOT Assigned(_DNA_ProtectionOK)) then
    begin
      Error := ERR_DLL_ERROR;
      Exit(False);
    end;

  AKey := AnsiString(Key);

  Error := _DNA_ProtectionOK(PAnsiChar(AKey),
    Integer(RequestEvalCode), Integer(UseMachineID));

  Result := (Error = ERR_NO_ERROR);
end;

function DNAProtectionOK2(Key: String;
RequestEvalCode, UseMachineID: Boolean; out Error: Integer): Boolean;
var
  ACode: String;
begin
  if (_Validate(Key, Error)) then // try to validate
    Exit(True); // Validation success...

  if (Error = ERR_VALIDATION_WARNING) then
    begin
      _ValidationWarning;
      Exit(True);
    end;

  if (Error <> ERR_INVALID_CDM) then
    Exit(False);

  if (NOT _GetActivationCode(Key, RequestEvalCode, UseMachineID,
    ACode, Error)) then
    Exit(False);

  DNAQuery(Key, ACode, Error);

  case Error of
    ERR_ACTIVATION_EXPECTED:
      Result := _PerformActivation(Key, ACode, Error);
    ERR_ACTIVATION_EXPECTED_MU:
      Result := _PerformActivationMU(Key, ACode, Error);
    ERR_REACTIVATION_EXPECTED:
      Result := _PerformReactivation(Key, ACode, Error);
    ERR_REACTIVATION_EXPECTED_MU:
      Result := _PerformReactivationMU(Key, ACode, Error);
  else
    Exit(False);
  end;

end;

function DNAQuery(Key, Code: String; out Error: Integer): Boolean;
var
  AKey, ACode: AnsiString;
begin
  if (NOT Assigned(_DNA_Query)) then
    @_DNA_Query := _LoadFunction('DNA_Query');

  if (NOT Assigned(_DNA_Query)) then
    begin
      Error := ERR_DLL_ERROR;
      Exit(False);
    end;

  AKey := AnsiString(Key);
  ACode := AnsiString(Code);

  Error := _DNA_Query(PAnsiChar(AKey), PAnsiChar(ACode));

  Result := (Error = ERR_NO_ERROR);
end;

function DNAReactivate(Key, Code, OldPwd, NewPwd: String;
out Error: Integer): Boolean;
var
  AKey, ACode, AOldPwd, ANewPwd: AnsiString;
begin
  if (NOT Assigned(_DNA_Reactivate)) then
    @_DNA_Reactivate := _LoadFunction('DNA_Reactivate');

  if (NOT Assigned(_DNA_Reactivate)) then
    begin
      Error := ERR_DLL_ERROR;
      Exit(False);
    end;

  AKey := AnsiString(Key);
  ACode := AnsiString(Code);
  AOldPwd := AnsiString(OldPwd);
  ANewPwd := AnsiString(NewPwd);

  Error := _DNA_Reactivate(PAnsiChar(AKey), PAnsiChar(ACode),
    PAnsiChar(AOldPwd), PAnsiChar(ANewPwd));

  Result := (Error = ERR_NO_ERROR);
end;

function DNASendEvalCode(Key, Email: String; UseMachineID: Boolean;
out Error: Integer): Boolean;
var
  AKey, AEmail: AnsiString;
begin
  if (NOT Assigned(_DNA_SendEvalCode)) then
    @_DNA_SendEvalCode := _LoadFunction('DNA_SendEvalCode');

  if (NOT Assigned(_DNA_SendEvalCode)) then
    begin
      Error := ERR_DLL_ERROR;
      Exit(False);
    end;

  AKey := AnsiString(Key);
  AEmail := AnsiString(Email);

  Error := _DNA_SendEvalCode(PAnsiChar(AKey), PAnsiChar(AEmail),
    Integer(UseMachineID));

  Result := (Error = ERR_NO_ERROR);
end;

function DNASendPassword(Key, Code: String;
out Error: Integer): Boolean;
var
  AKey, ACode: AnsiString;
begin
  if (NOT Assigned(_DNA_SendPassword)) then
    @_DNA_SendPassword := _LoadFunction('DNA_SendPassword');

  if (NOT Assigned(_DNA_SendPassword)) then
    begin
      Error := ERR_DLL_ERROR;
      Exit(False);
    end;

  AKey := AnsiString(Key);
  ACode := AnsiString(Code);

  Error := _DNA_SendPassword(PAnsiChar(AKey), PAnsiChar(ACode));

  Result := (Error = ERR_NO_ERROR);
end;

function DNASetBuildNo(BuildNumber: String;
out Error: Integer): Boolean;
var
  ABuildNo: AnsiString;
begin
  if (NOT Assigned(_DNA_SetBuildNo)) then
    @_DNA_SetBuildNo := _LoadFunction('DNA_SetBuildNo');

  if (NOT Assigned(_DNA_SetBuildNo)) then
    begin
      Error := ERR_DLL_ERROR;
      Exit(False);
    end;

  ABuildNo := AnsiString(BuildNumber);

  Error := _DNA_SetBuildNo(PAnsiChar(ABuildNo));

  Result := (Error = ERR_NO_ERROR);
end;

function DNASetCDMPathName(Folder, FileName: String;
out Error: Integer; FileExt: String = '.cdm'): Boolean;
var
  AFolder: String;
  AFileName: String;
  APathName: AnsiString;
begin
  if (NOT Assigned(_DNA_SetCDMPathName)) then
    @_DNA_SetCDMPathName := _LoadFunction('DNA_SetCDMPathName');

  if (NOT Assigned(_DNA_SetCDMPathName)) then
    begin
      Error := ERR_DLL_ERROR;
      Exit(False);
    end;

  AFolder := IncludeTrailingPathDelimiter(Folder);

  AFileName := Format('%s%s', [AFolder, FileName]);
  AFileName := ChangeFileExt(AFileName, FileExt);

  APathName := AnsiString(AFileName);

  Error := _DNA_SetCDMPathName(PAnsiChar(APathName));

  Result := (Error = ERR_NO_ERROR);
end;

function DNASetINIPathName(Folder, FileName: String;
out Error: Integer; FileExt: String = '.ini'): Boolean;
var
  AFolder: String;
  AFileName: String;
  APathName: AnsiString;
begin
  if (NOT Assigned(_DNA_SetINIPathName)) then
    @_DNA_SetINIPathName := _LoadFunction('DNA_SetINIPathName');

  if (NOT Assigned(_DNA_SetINIPathName)) then
    begin
      Error := ERR_DLL_ERROR;
      Exit(False);
    end;

  AFolder := IncludeTrailingPathDelimiter(Folder);

  AFileName := Format('%s%s', [AFolder, FileName]);
  AFileName := ChangeFileExt(AFileName, FileExt);

  APathName := AnsiString(AFileName);

  Error := _DNA_SetINIPathName(PAnsiChar(APathName));

  Result := (Error = ERR_NO_ERROR);
end;

function DNASetLanguage(Language: TDNALanguage;
out Error: Integer): Boolean;
var
  ALangID: Integer;
begin
  if (NOT Assigned(_DNA_SetLanguage)) then
    @_DNA_SetLanguage := _LoadFunction('DNA_SetLanguage');

  if (NOT Assigned(_DNA_SetLanguage)) then
    begin
      Error := ERR_DLL_ERROR;
      Exit(False);
    end;

  ALangID := Ord(Language);

  Error := _DNA_SetLanguage(ALangID);

  Result := (Error = ERR_NO_ERROR);
end;

function DNASetProxy(Server, Port, UserName, Password: String;
out Error: Integer): Boolean;
var
  AServer, APort, AUser, APwd: AnsiString;
begin
  if (NOT Assigned(_DNA_SetProxy)) then
    @_DNA_SetProxy := _LoadFunction('DNA_SetProxy');

  if (NOT Assigned(_DNA_SetProxy)) then
    begin
      Error := ERR_DLL_ERROR;
      Exit(False);
    end;

  AServer := AnsiString(Server);
  APort := AnsiString(Port);
  AUser := AnsiString(UserName);
  APwd := AnsiString(Password);

  Error := _DNA_SetProxy(PAnsiChar(AServer), PAnsiChar(APort),
    PAnsiChar(AUser), PAnsiChar(APwd));

  Result := (Error = ERR_NO_ERROR);
end;

function DNAUseIESettings(UseIESettings: Boolean;
out Error: Integer): Boolean;
begin
  if (NOT Assigned(_DNA_UseIESettings)) then
    @_DNA_UseIESettings := _LoadFunction('DNA_UseIESettings');

  if (NOT Assigned(_DNA_UseIESettings)) then
    begin
      Error := ERR_DLL_ERROR;
      Exit(False);
    end;

  Error := _DNA_UseIESettings(Integer(UseIESettings));

  Result := (Error = ERR_NO_ERROR);
end;

function DNAValidate(Key: String; out Error: Integer): Boolean;
var
  AKey: AnsiString;
begin
  if (NOT Assigned(_DNA_Validate)) then
    @_DNA_Validate := _LoadFunction('DNA_Validate');

  if (NOT Assigned(_DNA_Validate)) then
    begin
      Error := ERR_DLL_ERROR;
      Exit(False);
    end;

  AKey := AnsiString(Key);

  Error := _DNA_Validate(PAnsiChar(AKey));

  Result := (Error = ERR_NO_ERROR);
end;

function DNAValidate2(Key: String; out Error: Integer): Boolean;
var
  AKey: AnsiString;
begin
  if (NOT Assigned(_DNA_Validate2)) then
    @_DNA_Validate2 := _LoadFunction('DNA_Validate2');

  if (NOT Assigned(_DNA_Validate2)) then
    begin
      Error := ERR_DLL_ERROR;
      Exit(False);
    end;

  AKey := AnsiString(Key);

  Error := _DNA_Validate2(PAnsiChar(AKey));

  Result := (Error = ERR_NO_ERROR);
end;

function DNAValidate3(Key: String; out Error: Integer): Boolean;
var
  AKey: AnsiString;
begin
  if (NOT Assigned(_DNA_Validate3)) then
    @_DNA_Validate3 := _LoadFunction('DNA_Validate3');

  if (NOT Assigned(_DNA_Validate3)) then
    begin
      Error := ERR_DLL_ERROR;
      Exit(False);
    end;

  AKey := AnsiString(Key);

  Error := _DNA_Validate3(PAnsiChar(AKey));

  Result := (Error = ERR_NO_ERROR);
end;

function DNAValidate4(Key: String; out Error: Integer): Boolean;
var
  AKey: AnsiString;
begin
  if (NOT Assigned(_DNA_Validate4)) then
    @_DNA_Validate4 := _LoadFunction('DNA_Validate4');

  if (NOT Assigned(_DNA_Validate4)) then
    begin
      Error := ERR_DLL_ERROR;
      Exit(False);
    end;

  AKey := AnsiString(Key);

  Error := _DNA_Validate4(PAnsiChar(AKey));

  Result := (Error = ERR_NO_ERROR);
end;

function DNAValidate5(Key: String; out Error: Integer): Boolean;
var
  AKey: AnsiString;
begin
  if (NOT Assigned(_DNA_Validate5)) then
    @_DNA_Validate5 := _LoadFunction('DNA_Validate5');

  if (NOT Assigned(_DNA_Validate5)) then
    begin
      Error := ERR_DLL_ERROR;
      Exit(False);
    end;

  AKey := AnsiString(Key);

  Error := _DNA_Validate5(PAnsiChar(AKey));

  Result := (Error = ERR_NO_ERROR);
end;

function DNAValidateCDM(Key: String; out Error: Integer): Boolean;
var
  AKey: AnsiString;
begin
  if (NOT Assigned(_DNA_ValidateCDM)) then
    @_DNA_ValidateCDM := _LoadFunction('DNA_ValidateCDM');

  if (NOT Assigned(_DNA_ValidateCDM)) then
    begin
      Error := ERR_DLL_ERROR;
      Exit(False);
    end;

  AKey := AnsiString(Key);

  Error := _DNA_ValidateCDM(PAnsiChar(AKey));

  Result := (Error = ERR_NO_ERROR);
end;

function DNAValidateCDM2(Key: String; out Error: Integer): Boolean;
var
  AKey: AnsiString;
begin
  if (NOT Assigned(_DNA_ValidateCDM2)) then
    @_DNA_ValidateCDM2 := _LoadFunction('DNA_ValidateCDM2');

  if (NOT Assigned(_DNA_ValidateCDM2)) then
    begin
      Error := ERR_DLL_ERROR;
      Exit(False);
    end;

  AKey := AnsiString(Key);

  Error := _DNA_ValidateCDM2(PAnsiChar(AKey));

  Result := (Error = ERR_NO_ERROR);
end;

function DNAValidateCDM3(Key: String; out Error: Integer): Boolean;
var
  AKey: AnsiString;
begin
  if (NOT Assigned(_DNA_ValidateCDM3)) then
    @_DNA_ValidateCDM3 := _LoadFunction('DNA_ValidateCDM3');

  if (NOT Assigned(_DNA_ValidateCDM3)) then
    begin
      Error := ERR_DLL_ERROR;
      Exit(False);
    end;

  AKey := AnsiString(Key);

  Error := _DNA_ValidateCDM3(PAnsiChar(AKey));

  Result := (Error = ERR_NO_ERROR);
end;

function DNAValidateCDM4(Key: String; out Error: Integer): Boolean;
var
  AKey: AnsiString;
begin
  if (NOT Assigned(_DNA_ValidateCDM4)) then
    @_DNA_ValidateCDM4 := _LoadFunction('DNA_ValidateCDM4');

  if (NOT Assigned(_DNA_ValidateCDM4)) then
    begin
      Error := ERR_DLL_ERROR;
      Exit(False);
    end;

  AKey := AnsiString(Key);

  Error := _DNA_ValidateCDM4(PAnsiChar(AKey));

  Result := (Error = ERR_NO_ERROR);
end;

function DNAValidateCDM5(Key: String; out Error: Integer): Boolean;
var
  AKey: AnsiString;
begin
  if (NOT Assigned(_DNA_ValidateCDM5)) then
    @_DNA_ValidateCDM5 := _LoadFunction('DNA_ValidateCDM5');

  if (NOT Assigned(_DNA_ValidateCDM5)) then
    begin
      Error := ERR_DLL_ERROR;
      Exit(False);
    end;

  AKey := AnsiString(Key);

  Error := _DNA_ValidateCDM5(PAnsiChar(AKey));

  Result := (Error = ERR_NO_ERROR);
end;

function RndValidate(Key: String; out Error: Integer): Boolean;
begin
  Result := _Validate(Key, Error);
end;

function RndValidateCDM(Key: String; out Error: Integer): Boolean;
begin
  Result := _ValidateCDM(Key, Error);
end;



initialization

LibHandle := 0;

finalization

if (LibHandle <> 0) then
  FreeLibrary(LibHandle);


end.
