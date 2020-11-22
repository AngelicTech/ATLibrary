unit AT.DNA.VCL.Dlg.ForgotPwd;

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
  cxButtons, dxBevel, cxTextEdit, cxMaskEdit, cxButtonEdit,
  dxTaskbarProgress;

type
  TDNAForgotPasswordDlg = class(TDNABaseDlg)
    actClearEmail: TAction;
    lblEmail: TcxLabel;
    txtEmail: TcxButtonEdit;
    procedure actClearEmailExecute(Sender: TObject);
  strict private
    /// <summary>
    ///   Stores the value of the ActivationCode property.
    /// </summary>
    FActivationCode: String;
    /// <summary>
    ///   Email address getter.
    /// </summary>
    function GetEmailAddress: String;
    /// <summary>
    ///   ActivationCode property setter.
    /// </summary>
    procedure SetActivationCode(const Value: String);
    /// <summary>
    ///   EmailAddress property setter.
    /// </summary>
    procedure SetEmailAddress(const Value: String);
  strict protected
    procedure InitControls; override;
    procedure InitFields; override;
    function ValidateFields: Boolean; override;
  published
    /// <summary>
    ///   Sets/Gets the activation code for the dialog box.
    /// </summary>
    property ActivationCode: String read FActivationCode
      write SetActivationCode;
    /// <summary>
    ///   Gets/Sets the email address for the dialog box.
    /// </summary>
    property EmailAddress: String read GetEmailAddress
      write SetEmailAddress;
  end;

var
  DNAForgotPasswordDlg: TDNAForgotPasswordDlg;

implementation

{$R *.dfm}

uses
  System.UITypes, AT.XPlatform.Internet, AT.DNA.ResourceStrings;

procedure TDNAForgotPasswordDlg.actClearEmailExecute(Sender: TObject);
begin
  EmptyTextField(txtEmail);
end;

function TDNAForgotPasswordDlg.GetEmailAddress: String;
begin
  Result := TrimTextField(txtEmail);  //Return the email address...
end;

procedure TDNAForgotPasswordDlg.InitControls;
begin
  inherited InitControls; //Call inherited...

  ActiveControl := txtEmail;  //Set focus to email address field...
end;

procedure TDNAForgotPasswordDlg.InitFields;
begin
  inherited InitFields;   //call inherited...

  //Set all fields to empty string...
  ActivationCode := EmptyStr;
  EmailAddress := EmptyStr;
end;

procedure TDNAForgotPasswordDlg.SetActivationCode
  (const Value: String);
begin
  //Store activation code...
  FActivationCode := Value.Trim;

  //Set dialog caption to include activation code...
  Self.Caption := Format(rstrForgotPwdCapFmt, [FActivationCode]);
end;

procedure TDNAForgotPasswordDlg.SetEmailAddress(const Value: String);
begin
  txtEmail.Text := Value.Trim; //Set email address field...
end;

function TDNAForgotPasswordDlg.ValidateFields: Boolean;
var
  AEmail: String;
begin
  //Check if email address field is empty...
  AEmail := TrimTextField(txtEmail);
  if (AEmail.IsEmpty) then
    begin
      //Email address is blank, inform user...
      MessageDlg(rstrValEmailEmpty, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtEmail.SetFocus;  //Set focus to email address...
      Exit(False);        //Validation failure...
    end;

  //Check email address format...
  if (NOT CheckEmailFormat(AEmail)) then
    begin
      //Email address format incorrect, inform user...
      MessageDlg(rstrValEmailInvalid, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtEmail.SetFocus;  //Set focus to email address...
      Exit(False);        //Validation failure...
    end;

  Result := inherited ValidateFields; //Call inherited...
end;

end.
