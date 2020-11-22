unit AT.DNA.VCL.Dlg.RequestEval;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
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
  cxButtons, dxBevel, dxTaskbarProgress, cxTextEdit, cxMaskEdit,
  cxButtonEdit;

type
  TDNARequestEvalDlg = class(TDNABaseDlg)
    actClearConfirmEmail: TAction;
    actClearEmail: TAction;
    lblConfirmEmail: TcxLabel;
    lblEmail: TcxLabel;
    txtConfirmEmail: TcxButtonEdit;
    txtEmail: TcxButtonEdit;
    procedure actClearConfirmEmailExecute(Sender: TObject);
    procedure actClearEmailExecute(Sender: TObject);
  strict private
    /// <summary>
    ///   EmailAddress property getter.
    /// </summary>
    /// <seealso cref="EmailAddress" />
    function GetEmailAddress: String;
    /// <summary>
    ///   EmailAddress property setter.
    /// </summary>
    /// <seealso cref="EmailAddress" />
    procedure SetEmailAddress(const Value: String);
  strict protected
    procedure InitControls; override;
    procedure InitFields; override;
    function ValidateFields: Boolean; override;
  published
    /// <summary>
    ///   Gets/Sets the email address field of the dialog box.
    /// </summary>
    property EmailAddress: String read GetEmailAddress
      write SetEmailAddress;
  end;

var
  DNARequestEvalDlg: TDNARequestEvalDlg;

implementation

{$R *.dfm}

uses
  System.UITypes, AT.XPlatform.Internet, AT.DNA.ResourceStrings;


procedure TDNARequestEvalDlg.actClearConfirmEmailExecute(Sender: TObject);
begin
  EmptyTextField(txtConfirmEmail);
end;

procedure TDNARequestEvalDlg.actClearEmailExecute(Sender: TObject);
begin
  EmptyTextField(txtEmail);
end;

function TDNARequestEvalDlg.GetEmailAddress: String;
begin
  //Return the email address...
  Result := TrimTextField(txtEmail);
end;

procedure TDNARequestEvalDlg.InitControls;
begin
  inherited InitControls;  //call inherited...

  aCTIVEcONTROL := txtEmail;   //Set the focus to the email address field...
end;

procedure TDNARequestEvalDlg.InitFields;
begin
  inherited InitFields; //call inherited...

  //Init the email address field to empty string...
  EmailAddress := EmptyStr;
end;

procedure TDNARequestEvalDlg.SetEmailAddress(const Value: String);
begin
  //Set both the email and confirm email fields to Value...
  txtEmail.Text := Value.Trim;
  txtConfirmEmail.Text := Value.Trim;
end;

function TDNARequestEvalDlg.ValidateFields: Boolean;
var
  AEmail, AConfirmEmail: String;
begin
  //Check if email control is empty...
  AEmail := TrimTextField(txtEmail);
  if (AEmail.IsEmpty) then
    begin
      //Email control is blank so inform user...
      MessageDlg(rstrValEmailEmpty, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtEmail.SetFocus;  //Set focus to email control
      Exit(False);        //Validation failure...
    end;

  //Ensure email address is valid...
  if (NOT CheckEmailFormat(AEmail)) then
    begin
      //Invalid email address, inform user...
      MessageDlg(rstrValEmailInvalid, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtEmail.SetFocus;  //Set focus to email control...
      Exit(False);        //Validation failure...
    end;

  //Check if confirm email control is empty...
  AConfirmEmail := TrimTextField(txtConfirmEmail);
  if (AConfirmEmail.IsEmpty) then
    begin
      //Confirm email control is blank, inform user...
      MessageDlg(rstrValEmailConfirmEmpty, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtConfirmEmail.SetFocus; //Set focus to confirm email control..
      Exit(False);              //Validation failure...
    end;

  //Ensure confirm email address is valid...
  if (NOT CheckEmailFormat(AConfirmEmail)) then
    begin
      //Invalid confirm email address, inform user...
      MessageDlg(rstrValEmailConfirmInvalid, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtConfirmEmail.SetFocus; //Set focus to confirm email control..
      Exit(False);              //Validation failure...
    end;

  //Ensure email and confirm email values are the same...
  //NOT case-sensitive...
  if (CompareText(AEmail, AConfirmEmail) <> 0) then
    begin
      //Email addresses do NOT match, inform user...
      MessageDlg(rstrValEmailMismatch, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtConfirmEmail.SetFocus; //Set focus to confirm email control..
      Exit(False);              //Validation failure...
    end;

  //Call inherited...
  Result := inherited ValidateFields;
end;

end.

