unit AT.DNA.VCL.Dlg.ProxySettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  AT.DNA.VCL.Dlg.Base, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxControls, cxContainer,
  cxEdit, dxSkinsdxBarPainter, dxBar, cxClasses, Vcl.StdActns,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
  dxGDIPlusClasses, Vcl.ExtCtrls, cxLabel, cxGroupBox, Vcl.StdCtrls,
  cxButtons, dxBevel, cxSpinEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, dxTaskbarProgress;

type
  TDNAProxySettingsDlg = class(TDNABaseDlg)
    actClearPwd: TAction;
    actClearServer: TAction;
    actClearUser: TAction;
    actPwdVisible: TAction;
    gbxAuthenticate: TcxGroupBox;
    lblPassword: TcxLabel;
    lblServerName: TcxLabel;
    lblServerPort: TcxLabel;
    lblUserName: TcxLabel;
    seServerPort: TcxSpinEdit;
    txtPassword: TcxButtonEdit;
    txtServerName: TcxButtonEdit;
    txtUserName: TcxButtonEdit;
    procedure actClearPwdExecute(Sender: TObject);
    procedure actClearServerExecute(Sender: TObject);
    procedure actClearUserExecute(Sender: TObject);
    procedure actPwdVisibleExecute(Sender: TObject);
    procedure actPwdVisibleUpdate(Sender: TObject);
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

{$R *.dfm}

uses
  AT.GarbageCollector, AT.SoftwareDNA.Windows, AT.SoftwareDNA.Types,
  AT.DNA.ResourceStrings, IdBaseComponent, IdComponent, IdHTTP,
  IdTCPConnection, IdTCPClient, System.UITypes;



procedure TDNAProxySettingsDlg.actClearPwdExecute(Sender: TObject);
begin
  EmptyTextField(txtPassword);
end;

procedure TDNAProxySettingsDlg.actClearServerExecute(Sender: TObject);
begin
  EmptyTextField(txtServerName);
end;

procedure TDNAProxySettingsDlg.actClearUserExecute(Sender: TObject);
begin
  EmptyTextField(txtUserName);
end;

procedure TDNAProxySettingsDlg.actPwdVisibleExecute(Sender: TObject);
begin
  case txtPassword.Properties.EchoMode of
    eemNormal: txtPassword.Properties.EchoMode := eemPassword;
    eemPassword: txtPassword.Properties.EchoMode := eemNormal;
  end;
end;

procedure TDNAProxySettingsDlg.actPwdVisibleUpdate(Sender: TObject);
var
  AAct: TAction;
begin
  AAct := (Sender AS TAction);

  case txtPassword.Properties.EchoMode of
    eemNormal: SetPwdActionMode(AAct, False);
    eemPassword: SetPwdActionMode(AAct, True);
  end;
end;

function TDNAProxySettingsDlg.GetPassword: String;
begin
  Result := TrimTextField(txtPassword); //Return the password field...
end;

function TDNAProxySettingsDlg.GetPort: String;
begin
  Result := TrimTextField(seServerPort);  //Return the port field...
end;

function TDNAProxySettingsDlg.GetPortNum: Integer;
begin
  Result := seServerPort.Value;
end;

function TDNAProxySettingsDlg.GetServer: String;
begin
  Result := TrimTextField(txtServerName); //Return the server name field...
end;

function TDNAProxySettingsDlg.GetUsername: String;
begin
  Result := TrimTextField(txtUserName);  //Return the username field...
end;

procedure TDNAProxySettingsDlg.InitControls;
begin
  inherited InitControls; //call inherited...

  ActiveControl := txtServerName; //Set focus to server name field...
end;

procedure TDNAProxySettingsDlg.InitFields;
begin
  inherited InitFields;  //call inherited...

  //Set fields to either the value contained in the license file
  //or the default value of empty string...
  Password := _GetCurrentPassword;
  Port := _GetCurrentServerPort;
  Server := _GetCurrentServerName;
  Username := _GetCurrentUsername;
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
  AServerName := TrimTextField(txtServerName);
  if (AServerName.IsEmpty) then
    begin
      //Server name field is blank, inform user...
      MessageDlg(rstrValProxyHostEmpty, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtServerName.SetFocus; //Set focus to server name field...
      Exit(False);            //Validation failure...
    end;

  //Check for empty user name field...
  AUserName := TrimTextField(txtUserName);
  if (AUserName.IsEmpty) then
    begin
      //User name field is blank, inform user...
      MessageDlg(rstrValProxyUserEmpty, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtUserName.SetFocus;   //Set focus to user name field...
      Exit(False);            //Validation failure...
    end;

  //Check if password field is empty...
  APwd := TrimTextField(txtPassword);
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
var
  HTTPCon: TIdHTTP;
  AGC: IATGarbageCollector;
begin
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
end;

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

end.

