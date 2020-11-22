unit AT.DNA.VCL.Dlg.Activation;

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
  cxEdit, dxGDIPlusClasses, Vcl.ExtCtrls, cxLabel, cxGroupBox,
  Vcl.StdCtrls, cxButtons, dxBevel, cxTextEdit, cxMaskEdit,
  cxButtonEdit, System.ImageList, Vcl.ImgList, System.Actions,
  Vcl.ActnList, Vcl.StdActns, dxSkinsdxBarPainter, dxBar, cxClasses,
  dxTaskbarProgress;

type
  TDNAActivationDlg = class(TDNABaseDlg)
    actClearConfirmEmail: TAction;
    actClearConfirmPwd: TAction;
    actClearEmail: TAction;
    actClearPwd: TAction;
    actPwdConfirmVisible: TAction;
    actPwdVisible: TAction;
    bevContentSep: TdxBevel;
    lblConfirmEmail: TcxLabel;
    lblConfirmPwd: TcxLabel;
    lblEmail: TcxLabel;
    lblPassword: TcxLabel;
    txtConfirmEmail: TcxButtonEdit;
    txtConfirmPassword: TcxButtonEdit;
    txtEmail: TcxButtonEdit;
    txtPassword: TcxButtonEdit;
    procedure actClearConfirmEmailExecute(Sender: TObject);
    procedure actClearConfirmPwdExecute(Sender: TObject);
    procedure actClearEmailExecute(Sender: TObject);
    procedure actClearPwdExecute(Sender: TObject);
    procedure actPwdConfirmVisibleExecute(Sender: TObject);
    procedure actPwdConfirmVisibleUpdate(Sender: TObject);
    procedure actPwdVisibleExecute(Sender: TObject);
    procedure actPwdVisibleUpdate(Sender: TObject);
  strict private
    /// <summary>
    ///   Stores the value of the ActivationCode property.
    /// </summary>
    FActivationCode: string;
    /// <summary>
    ///   EmailAddress property getter.
    /// </summary>
    function GetEmailAddress: String;
    /// <summary>
    ///   Password property getter.
    /// </summary>
    function GetPassword: string;
    /// <summary>
    ///   ActivationCode property setter.
    /// </summary>
    procedure SetActivationCode(const Value: string);
    /// <summary>
    ///   EmailAddress property setter.
    /// </summary>
    procedure SetEmailAddress(const Value: String);
    /// <summary>
    ///   Password property setter.
    /// </summary>
    procedure SetPassword(const Value: string);
  strict protected
    procedure InitControls; override;
    procedure InitFields; override;
    function ValidateFields: Boolean; override;
  published
    /// <summary>
    ///   Gets/Sets the activation code for the dialog box.
    /// </summary>
    property ActivationCode: string read FActivationCode
      write SetActivationCode;
    /// <summary>
    ///   Gets/Sets the email address field of the dialog box.
    /// </summary>
    property EmailAddress: String read GetEmailAddress
      write SetEmailAddress;
    /// <summary>
    ///   Gets/Sets the password field of the dialog box.
    /// </summary>
    property Password: string read GetPassword write SetPassword;
  end;

var
  DNAActivationDlg: TDNAActivationDlg;

implementation

{$R *.dfm}

uses
  System.UITypes, AT.XPlatform.Internet, AT.DNA.ResourceStrings;


procedure TDNAActivationDlg.actClearConfirmEmailExecute(Sender: TObject);
begin
  EmptyTextField(txtConfirmEmail);
end;

procedure TDNAActivationDlg.actClearConfirmPwdExecute(Sender: TObject);
begin
  EmptyTextField(txtConfirmPassword);
end;

procedure TDNAActivationDlg.actClearEmailExecute(Sender: TObject);
begin
  EmptyTextField(txtEmail);
end;

procedure TDNAActivationDlg.actClearPwdExecute(Sender: TObject);
begin
  EmptyTextField(txtPassword);
end;

procedure TDNAActivationDlg.actPwdConfirmVisibleExecute(Sender: TObject);
begin
  case txtConfirmPassword.Properties.EchoMode of
    eemNormal: txtConfirmPassword.Properties.EchoMode := eemPassword;
    eemPassword: txtConfirmPassword.Properties.EchoMode := eemNormal;
  end;
end;

procedure TDNAActivationDlg.actPwdConfirmVisibleUpdate(Sender: TObject);
var
  AAct: TAction;
begin
  AAct := (Sender AS TAction);

  case txtConfirmPassword.Properties.EchoMode of
    eemNormal: SetPwdActionMode(AAct, False);
    eemPassword: SetPwdActionMode(AAct, True);
  end;
end;

procedure TDNAActivationDlg.actPwdVisibleExecute(Sender: TObject);
begin
  case txtPassword.Properties.EchoMode of
    eemNormal: txtPassword.Properties.EchoMode := eemPassword;
    eemPassword: txtPassword.Properties.EchoMode := eemNormal;
  end;
end;

procedure TDNAActivationDlg.actPwdVisibleUpdate(Sender: TObject);
var
  AAct: TAction;
begin
  AAct := (Sender AS TAction);

  case txtPassword.Properties.EchoMode of
    eemNormal: SetPwdActionMode(AAct, False);
    eemPassword: SetPwdActionMode(AAct, True);
  end;
end;

function TDNAActivationDlg.GetEmailAddress: String;
begin
  Result := TrimTextField(txtEmail);  //Return the email address...
end;

function TDNAActivationDlg.GetPassword: string;
begin
  Result := TrimTextField(txtPassword); //Return the password...
end;

procedure TDNAActivationDlg.InitControls;
begin
  inherited InitControls; //call inherited...

  //Set OK button caption to 'Activate'...
  btnOK.Caption := rstrActivate;

  ActiveControl := txtEmail;  //set focus to email address field...
end;

procedure TDNAActivationDlg.InitFields;
begin
  inherited InitFields; //call inherited...

  //Set all fields to empty string...
  ActivationCode := EmptyStr;
  EmailAddress := EmptyStr;
  Password := EmptyStr;
end;

procedure TDNAActivationDlg.SetActivationCode(const Value: string);
begin
  //Store activation code...
  FActivationCode := Value;

  //Set dialog caption to include activation code...
  Self.Caption := Format(rstrActivateCapFmt, [Value]);
end;

procedure TDNAActivationDlg.SetEmailAddress(const Value: String);
begin
  //Set email and confirm email to value...
  txtEmail.Text := Value.Trim;
  txtConfirmEmail.Text := Value.Trim;
end;

procedure TDNAActivationDlg.SetPassword(const Value: string);
begin
  //Set pwd and confirm pwd fields to value...
  txtPassword.Text := Value.Trim;
  txtConfirmPassword.Text := Value.Trim;
end;

function TDNAActivationDlg.ValidateFields: Boolean;
var
  AEmail, AConfirmEmail, APwd, AConfirmPwd: String;
begin
  //Check if email address is empty...
  AEmail := TrimTextField(txtEmail);
  if (AEmail.IsEmpty) then
    begin
      //Email address is blank, inform user...
      MessageDlg(rstrValEmailEmpty, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtEmail.SetFocus;  //Set focus to email address...
      Exit(False);        //Validation failure...
    end;

  //Check format of email address...
  if (NOT CheckEmailFormat(AEmail)) then
    begin
      //Email address format invalid, inform user...
      MessageDlg(rstrValEmailInvalid, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtEmail.SetFocus;  //Set focus to email address...
      Exit(False);        //Validation failure...
    end;

  //Check if confirm email address is empty...
  AConfirmEmail := TrimTextField(txtConfirmEmail);
  if (AConfirmEmail.IsEmpty) then
    begin
      //Confirm email is blank, inform user...
      MessageDlg(rstrValEmailConfirmEmpty, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtConfirmEmail.SetFocus;   //Set focus to confirm email...
      Exit(False);                //Validation failure...
    end;

  //Check format of confirm email...
  if (NOT CheckEmailFormat(AConfirmEmail)) then
    begin
      //Confirm email format invalid...
      MessageDlg(rstrValEmailConfirmInvalid, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtConfirmEmail.SetFocus; //Set focus to confirm email...
      Exit(False);              //Validation failure...
    end;

  //Check if email and confirm email are the same, case-insensitive...
  if (CompareText(AEmail, AConfirmEmail) <> 0) then
    begin
      //Emails do not match, inform user...
      MessageDlg(rstrValEmailMismatch, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtConfirmEmail.SetFocus; //Set focus to confirm email...
      Exit(False);              //Validation failure...
    end;

  //Check if password is empty...
  APwd := TrimTextField(txtPassword);
  if (APwd.IsEmpty) then
    begin
      //Password is blank, inform user...
      MessageDlg(rstrValPwdEmpty, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtPassword.SetFocus; //Set focus to password...
      Exit(False);          //Validation failure...
    end;

  //Check for valid password...
  if (NOT IsPasswordValid(APwd)) then
    begin
      //Password is invalid...
      MessageDlg(rstrValPwdInvalid, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtPassword.SetFocus; //Set focus to password...
      Exit(False);              //Validation failure...
    end;

  //Check if confirm password is blank...
  AConfirmPwd := TrimTextField(txtConfirmPassword);
  if (AConfirmPwd.IsEmpty) then
    begin
      //Confirm pwd is blank, inform user...
      MessageDlg(rstrValPwdConfirmEmpty, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtConfirmPassword.SetFocus;  //Set focus to confirm pwd...
      Exit(False);                  //Validation failure...
    end;

  //Check if pwd and confirm pwd match, case-sensitive...
  if (APwd.CompareTo(AConfirmPwd) <> 0) then
    begin
      //Passwords do NOT match, inform user...
      MessageDlg(rstrValPwdMismatch, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtPassword.SetFocus; //Set focus to password field...
      Exit(False);          //Validation failure...
    end;

  Result := inherited ValidateFields; //call inherited...
end;

end.
