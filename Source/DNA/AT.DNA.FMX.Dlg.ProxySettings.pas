// ******************************************************************
//
// Program Name   : AT Software_DNA Library
// Program Version: 1.00
// Platform(s)    : OS X, Win32, Win64
// Framework      : FireMonkey
//
// Filenames      : AT.DNA.FMX.Dlg.ProxySettings.pas/.fmx
// File Version   : 1.20
// Date Created   : 04-MAY-2016
// Author         : Matthew S. Vesperman
//
// Description:
//
// Proxy settings dialog for Software_DNA - FireMonkey version for
// cross-platform.
//
// Revision History:
//
// v1.00   :   Initial version
// v1.10   :   01-JUN-2016
//               + text field trimming
// v1.20   :   01-JUL-2016
//               * Implemented resource strings
//
// ******************************************************************
//
// COPYRIGHT © 2015 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

unit AT.DNA.FMX.Dlg.ProxySettings;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms,
  FMX.Dialogs, FMX.StdCtrls, AT.DNA.FMX.Dlg.Base, FMX.EditBox,
  FMX.SpinBox, FMX.Edit, FMX.Objects, System.ImageList, FMX.ImgList,
  FMX.TMSHTMLText, FMX.Layouts, FMX.Controls.Presentation;

type
  /// <summary>
  ///   Proxy settings dialog for Software_DNA.
  /// </summary>
  TDNAProxySettingsDlg = class(TDNABaseDlg)
    btnClearPwd: TClearEditButton;
    btnClearServer: TClearEditButton;
    btnClearUser: TClearEditButton;
    btnShowPwd: TPasswordEditButton;
    gbxAuthenticate: TGroupBox;
    lblPassword: TLabel;
    lblServerName: TLabel;
    lblServerPort: TLabel;
    lblUserName: TLabel;
    seServerPort: TSpinBox;
    txtPassword: TEdit;
    txtServerName: TEdit;
    txtUserName: TEdit;
  strict private
    /// <summary>
    ///   Password property getter.
    /// </summary>
    function GetPassword: String;
    /// <summary>
    ///   Port property getter.
    /// </summary>
    function GetPort: String;
    /// <summary>
    ///   PortNum property getter.
    /// </summary>
    function GetPortNum: Integer;
    /// <summary>
    ///   Server property getter.
    /// </summary>
    function GetServer: String;
    /// <summary>
    ///   Username property getter.
    /// </summary>
    function GetUsername: String;
    /// <summary>
    ///   Password property setter.
    /// </summary>
    procedure SetPassword(const Value: String);
    /// <summary>
    ///   Port property setter.
    /// </summary>
    procedure SetPort(const Value: String);
    /// <summary>
    ///   PortNum property setter.
    /// </summary>
    procedure SetPortNum(const Value: Integer);
    /// <summary>
    ///   Server property setter.
    /// </summary>
    procedure SetServer(const Value: String);
    /// <summary>
    ///   Username property setter.
    /// </summary>
    procedure SetUsername(const Value: String);
    /// <summary>
    ///   Checks for valid proxy server settings.
    /// </summary>
    /// <returns>
    ///   TRUE if all settings are correct, FALSE otherwise.
    /// </returns>
    function _CheckProxy: Boolean;
    {$IF Defined(MSWINDOWS)}
    /// <summary>
    ///   Retrieves the proxy server password from the license file.
    /// </summary>
    function _GetCurrentPassword: String;
    /// <summary>
    ///   Retrieves the proxy server host from the license file.
    /// </summary>
    function _GetCurrentServerName: String;
    /// <summary>
    ///   Retrieves the proxy server port from the license file.
    /// </summary>
    function _GetCurrentServerPort: string;
    /// <summary>
    ///   Retrieves the proxy server username from the license file.
    /// </summary>
    function _GetCurrentUsername: String;
    {$IFEND}
  strict protected
    procedure InitControls; override;
    procedure InitFields; override;
    function ValidateFields: Boolean; override;
  published
    /// <summary>
    ///   Gets/sets the password field of the dialog box.
    /// </summary>
    property Password: String read GetPassword write SetPassword;
    /// <summary>
    ///   Gets/sets the port field of the dialog box as a string.
    /// </summary>
    property Port: String read GetPort write SetPort;
    /// <summary>
    ///   Gets/sets the port field of the dialog box as an integer.
    /// </summary>
    property PortNum: Integer read GetPortNum write SetPortNum;
    /// <summary>
    ///   Gets/sets the server name field of the dialog box.
    /// </summary>
    property Server: String read GetServer write SetServer;
    /// <summary>
    ///   Gets/sets the username field of the dialog box.
    /// </summary>
    property Username: String read GetUsername write SetUsername;
  end;

var
  DNAProxySettingsDlg: TDNAProxySettingsDlg;

implementation

{$R *.fmx}

uses
  AT.GarbageCollector, AT.SoftwareDNA.XPlatform, AT.SoftwareDNA.Types,
  AT.DNA.ResourceStrings, IdBaseComponent, IdComponent, IdHTTP, 
  IdTCPConnection, IdTCPClient;

function TDNAProxySettingsDlg.GetPassword: String;
begin
  Result := txtPassword.Text.Trim; //Return the password field...
end;

function TDNAProxySettingsDlg.GetPort: String;
begin
  Result := seServerPort.Text.Trim;  //Return the port field...
end;

function TDNAProxySettingsDlg.GetPortNum: Integer;
begin
  //Try to convert the port to an integer...
  if (NOT TryStrToInt(Port, Result)) then
    Result := 80; //Convert failed so return default of '80'...
end;

function TDNAProxySettingsDlg.GetServer: String;
begin
  Result := txtServerName.Text.Trim; //Return the server name field...
end;

function TDNAProxySettingsDlg.GetUsername: String;
begin
  Result := txtUserName.Text.Trim;  //Return the username field...
end;

procedure TDNAProxySettingsDlg.InitControls;
begin
  inherited InitControls; //call inherited...

  txtServerName.SetFocus; //Set focus to server name field...
end;

procedure TDNAProxySettingsDlg.InitFields;
begin
  inherited InitFields;  //call inherited...

  //Set fields to either the value contained in the license file
  //or the default value of empty string...
  {$IF Defined(MSWINDOWS)}
    Password := _GetCurrentPassword;
    Port := _GetCurrentServerPort;
    Server := _GetCurrentServerName;
    Username := _GetCurrentUsername;
  {$ELSE}
    //todo: InitFields - figure out loading for OS X.
    Password := EmptyStr;
    Port := EmptyStr;
    Server := EmptyStr;
    Username := EmptyStr;
  {$IFEND}
end;

procedure TDNAProxySettingsDlg.SetPassword(const Value: String);
begin
  txtPassword.Text := Value.Trim;  //Set the poassword field value...
end;

procedure TDNAProxySettingsDlg.SetPort(const Value: String);
var
  APort: Integer;
begin
  //Try to convert value to integer...
  if (NOT TryStrToInt(Value.Trim, APort)) then
    APort := 80;  //Failed use default of 80...

  PortNum := APort; //Set PortNum property value...
end;

procedure TDNAProxySettingsDlg.SetPortNum(const Value: Integer);
begin
  seServerPort.Value := Value;  //Set port number field...
end;

procedure TDNAProxySettingsDlg.SetServer(const Value: String);
begin
  txtServerName.Text := Value.Trim;  //Set server name field...
end;

procedure TDNAProxySettingsDlg.SetUsername(const Value: String);
begin
  txtUserName.Text := Value.Trim;  //Set user name field...
end;

function TDNAProxySettingsDlg.ValidateFields: Boolean;
var
  AServerName, AUserName, APwd: String;
begin
  //Check for empty server name field...
  AServerName := txtServerName.Text.Trim;
  if (AServerName.IsEmpty) then
    begin
      //Server name field is blank, inform user...
      MessageDlg(rstrValProxyHostEmpty, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtServerName.SetFocus; //Set focus to server name field...
      Exit(False);            //Validation failure...
    end;

  //Check for empty user name field...
  AUserName := txtUserName.Text.Trim;
  if (AUserName.IsEmpty) then
    begin
      //User name field is blank, inform user...
      MessageDlg(rstrValProxyUserEmpty, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtUserName.SetFocus;   //Set focus to user name field...
      Exit(False);            //Validation failure...
    end;

  //Check if password field is empty...
  APwd := txtPassword.Text.Trim;
  if (APwd.IsEmpty) then
    begin
      //Password field is blank, inform user...
      MessageDlg(rstrValPwdEmpty, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtPassword.SetFocus; //Set focus to password field...
      Exit(False);          //Validation failure...
    end;

  // todo: debug _CheckProxy...
  //Try to check for valid proxy server...
  if (NOT _CheckProxy) then
    begin
  // Invalid proxy server values, inform user...
      MessageDlg(rstrValProxyInvalid, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtServerName.SetFocus; //Set focus to server name field...
      Exit(False);            //Validation failure...
  end;

  Result := inherited ValidateFields;  //call inherited...
end;

function TDNAProxySettingsDlg._CheckProxy: Boolean;
{$IF Defined(MSWINDOWS)}
var
  HTTPCon: TIdHTTP;
  AGC: IATGarbageCollector;
{$IFEND}
begin
  {$IF Defined(MSWINDOWS)}
    //Create a HTTP connection...
    HTTPCon := TATGC.Collect(TIdHTTP.Create(NIL), AGC);

    //Assign cleanup routine...
    TATGC.Cleanup(
      procedure
      begin
        //Do we have a HTTP connection???
        if (Assigned(HTTPCon)) then
          begin
            //Yes, if connected then disconnect...
            if (HTTPCon.Connected) then
              HTTPCon.Disconnect;
          end;
      end, AGC);

    //Set HTTP connection proxy params...
    HTTPCon.ProxyParams.ProxyServer := Server;
    HTTPCon.ProxyParams.ProxyPort := PortNum;
    HTTPCon.ProxyParams.BasicAuthentication := True;
    HTTPCon.ProxyParams.ProxyUsername := Username;
    HTTPCon.ProxyParams.ProxyPassword := Password;

    //Attempt to make a connection to google.com
    HTTPCon.HandleRedirects := True;
    HTTPCon.ConnectTimeout := 1000;
    HTTPCon.Request.Connection := 'close';
    HTTPCon.Head('http://google.com');

    //Return true if response code is 200, false otherwise...
    Result := (HTTPCon.ResponseCode = 200);
  {$ELSE}
    //todo: _CheckProxy - figure out implementation for OS X...
    Result := True;
  {$IFEND}
end;

{$IF Defined(MSWINDOWS)}
function TDNAProxySettingsDlg._GetCurrentPassword: String;
var
  Err: Integer;
  sResult: String;
begin
  //Try to get the proxy pwd from the license file...
  if (NOT DNAParam(TDNAParams.parmProxyPassword, sResult, Err)) then
    sResult := EmptyStr; //Failed, use empty string...

  Result := sResult;  //Return result...
end;

function TDNAProxySettingsDlg._GetCurrentServerName: String;
var
  Err: Integer;
  sResult: String;
begin
  //Try to get proxy server from license file...
  if (NOT DNAParam(TDNAParams.parmProxyServer, sResult, Err)) then
    sResult := EmptyStr;  //Failed use empty string...

  Result := sResult;  //Return result...
end;

function TDNAProxySettingsDlg._GetCurrentServerPort: string;
var
  Err: Integer;
  sResult: String;
begin
  //Try to get proxy port from license file...
  if (NOT DNAParam(TDNAParams.parmProxyPort, sResult, Err)) then
    sResult := ('80');  //Failed use '80'...

  //Check if sResult is either empty of '0'...
  if ((sResult = EmptyStr) OR (sResult = '0')) then
    Exit('80'); //sResult is either empty or '0', change to '80'...

  Result := sResult;  //Return result...
end;

function TDNAProxySettingsDlg._GetCurrentUsername: String;
var
  Err: Integer;
  sResult: String;
begin
  //Try to get proxy user name from license file...
  if (NOT DNAParam(TDNAParams.parmProxyUserName, sResult, Err)) then
    sResult := EmptyStr;  //Failed use empty string...

  Result := sResult;  //Return result...
end;
{$IFEND}

end.
