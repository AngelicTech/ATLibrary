// ******************************************************************
//
// Program Name   : AT Software_DNA Library
// Program Version: 1.00
// Platform(s)    : OS X, Win32, Win64
// Framework      : FireMonkey
//
// Filenames      : AT.DNA.FMX.Dlg.EvalWarning.pas/.fmx
// File Version   : 1.00
// Date Created   : 29-JUN-2016
// Author         : Matthew S. Vesperman
//
// Description:
//
// Evaluation Warning dialog for Software_DNA - FireMonkey version for
// cross-platform.
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

unit AT.DNA.FMX.Dlg.EvalWarning;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms,
  FMX.Dialogs, FMX.StdCtrls, AT.DNA.FMX.Dlg.Base, System.ImageList,
  FMX.ImgList, FMX.Objects, FMX.Layouts, FMX.Controls.Presentation,
  AT.SoftwareDNA.Types;

type
  TDNAEvalWarnDlg = class(TDNABaseDlg)
    btnActivatePurchase: TButton;
    btnBuyNow: TButton;
    lblEvalMsg: TLabel;
    procedure ActivateButtonClicked(Sender: TObject);
    procedure BuyNowButtonClicked(Sender: TObject);
  strict private
    FActivatePurchaseHandler: TDNAActivatePurchaseHandler;
    /// <summary>
    ///   Stores the value of the ActivationCode property.
    /// </summary>
    FActivationCode: String;
    FBuyNowHandler: TDNABuyNowHandler;
    /// <summary>
    ///   Stores the value of the DaysLeft property.
    /// </summary>
    FDaysLeft: Integer;
    /// <summary>
    ///   Stores the value of the ExpireDate property.
    /// </summary>
    FExpireDate: TDateTime;
    FOnActivatePurchase: TNotifyEvent;
    FOnBuyNow: TNotifyEvent;
    /// <summary>
    ///   A flag indicating if the BeginUpdate method was called.
    /// </summary>
    /// <remarks>
    ///   <para>
    ///     This flag is used by th _UpdateEvalMsg method to
    ///     determine if it should update the warning message.
    ///   </para>
    ///   <para>
    ///     If this field is TRUE then _UpdateEvalMsg will exit
    ///     WITHOUT updating the warning message.
    ///   </para>
    /// </remarks>
    FUpdating: Boolean;
    /// <summary>
    ///   ActivationCode property setter.
    /// </summary>
    procedure SetActivationCode(const Value: String);
    /// <summary>
    ///   DaysLeft property setter.
    /// </summary>
    procedure SetDaysLeft(const Value: Integer);
    /// <summary>
    ///   ExpireDate property setter.
    /// </summary>
    procedure SetExpireDate(const Value: TDateTime);
    /// <summary>
    ///   Update the warning message displayed in the dialog box.
    /// </summary>
    /// <remarks>
    ///   <para>
    ///     If BeginUpdate was called this method will exit without
    ///     updating the warning message.
    ///   </para>
    ///   <para>
    ///     You must call EndUpdate after a call to BeginUpdate to
    ///     make the warning message update.
    ///   </para>
    /// </remarks>
    procedure _UpdateEvalMsg;
  strict protected
    procedure InitControls; override;
    procedure InitFields; override;
  public
    procedure AttachActivatePurchaseHandler(
      AHandler: TDNAActivatePurchaseHandler);
    procedure AttachBuyNowHandler(AHandler: TDNABuyNowHandler);
    /// <summary>
    ///   Sets a flag that tells _UpdateEvalMsg not to update the
    ///   warning message.
    /// </summary>
    /// <remarks>
    ///   A call to BeginUpdate must be paired with a call to
    ///   EndUpdate to force an update to the warning message.
    /// </remarks>
    procedure BeginUpdate; override;
    /// <summary>
    ///   Clears the flag that tells _UpdateEvalMsg to skip updating
    ///   and then forces an update of the warning message by calling
    ///   _UpdateEvalMsg.
    /// </summary>
    /// <remarks>
    ///   A call to BeginUpdate must be paired with a call to
    ///   EndUpdate to force an update to the warning message.
    /// </remarks>
    procedure EndUpdate; override;
  published
    /// <summary>
    ///   Sets/Gets the activation code for the dialog box.
    /// </summary>
    property ActivationCode: String read FActivationCode
      write SetActivationCode;
    /// <summary>
    ///   Sets/Gets the days left data for the dialog box.
    /// </summary>
    property DaysLeft: Integer read FDaysLeft write SetDaysLeft;
    /// <summary>
    ///   Sets/Gets the value of the expire date for the dialog box.
    /// </summary>
    property ExpireDate: TDateTime read FExpireDate
      write SetExpireDate;
    property OnActivatePurchase: TNotifyEvent read FOnActivatePurchase
      write FOnActivatePurchase;
    property OnBuyNow: TNotifyEvent read FOnBuyNow write FOnBuyNow;
  end;

var
  DNAEvalWarnDlg: TDNAEvalWarnDlg;

implementation

uses
  AT.GarbageCollector, AT.DNA.ResourceStrings, System.DateUtils;


{$R *.fmx}

procedure TDNAEvalWarnDlg.ActivateButtonClicked(
    Sender: TObject);
begin
  //Check for OnActivatePurchase handler...
  if (Assigned(FOnActivatePurchase)) then
    FOnActivatePurchase(Self);  //We have one, so call it...

  //Check for activate purchase handler...
  if (Assigned(FActivatePurchaseHandler)) then
    FActivatePurchaseHandler(Self);  //We have one, so call it...
end;

procedure TDNAEvalWarnDlg.AttachActivatePurchaseHandler(
    AHandler: TDNAActivatePurchaseHandler);
begin
  //Set activate purchase handler...
  FActivatePurchaseHandler := AHandler;
end;

procedure TDNAEvalWarnDlg.AttachBuyNowHandler(AHandler:
    TDNABuyNowHandler);
begin
  //Set buy now handler...
  FBuyNowHandler := AHandler;
end;

procedure TDNAEvalWarnDlg.BeginUpdate;
begin
  inherited BeginUpdate;

  //Set flag...
  FUpdating := True;
end;

procedure TDNAEvalWarnDlg.BuyNowButtonClicked(Sender: TObject);
begin
  //Check for OnBuyNow handler...
  if (Assigned(FOnBuyNow)) then
    FOnBuyNow(Self);  //We have one, so call it...

  //Check for buy now handler...
  if (Assigned(FBuyNowHandler)) then
    FBuyNowHandler(Self);  //We have one, so call it...
end;

procedure TDNAEvalWarnDlg.EndUpdate;
begin
  //Clear flag...
  FUpdating := False;

  //Force update...
  _UpdateEvalMsg;

  inherited EndUpdate;
end;

procedure TDNAEvalWarnDlg.InitControls;
begin
  inherited InitControls;     //call inherited...

  btnCancel.Visible := False; //Hide cancel button...

  btnOK.Text := rstrClose;    //Change OK button caption to 'Close'...
end;

procedure TDNAEvalWarnDlg.InitFields;
var
  AGC: IATGarbageCollector;
begin
  inherited InitFields; //call inherited...

  //Set updating flag to FALSE...
  FUpdating := False;

  //Set default property values...
  BeginUpdate;

  TATGC.Cleanup(procedure
    begin
      EndUpdate;
    end, AGC);

  ActivationCode := EmptyStr;
  DaysLeft := -1;
  ExpireDate := Now;
end;

procedure TDNAEvalWarnDlg.SetActivationCode
  (const Value: String);
begin
  // Store activation code...
  FActivationCode := Value;

  // Set dialog caption to include activation code...
  Self.Caption := Format(rstrEvalWarnCapFmt, [Value]);
end;

procedure TDNAEvalWarnDlg.SetDaysLeft(const Value: Integer);
begin
  //Set days left field...
  FDaysLeft := Value;

  //Update warning message...
  _UpdateEvalMsg;
end;

procedure TDNAEvalWarnDlg.SetExpireDate(const Value: TDateTime);
begin
  //Set expire date field...
  FExpireDate := Value;

  //Update warning message...
  _UpdateEvalMsg;
end;

procedure TDNAEvalWarnDlg._UpdateEvalMsg;
var
  AExpiry: String;
  AMsg: string;
begin
  if (FUpdating) then   //Was BeginUpdate called?
    Exit;               //Yes, so exit...

  //Format the expire date as a string...
  AExpiry := FormatDateTime('dddd, dd-mmm-yyyy', ExpireDate);

  btnOK.Visible := (ExpireDate >= DateOf(Now));
  btnCancel.Visible := (NOT btnOK.Visible);

  //Format the warning message...
  if (ExpireDate < DateOf(Now)) then //No days left?

    AMsg := Format(rstrEvalWarnExpire, [Application.Title])

  else if (Self.DaysLeft = 0) then //No days left?

    AMsg := Format(rstrEvalWarnLastDay, [Application.Title, AExpiry])

  else if (Self.DaysLeft = 1) then //Is only 1 day left?

    AMsg := Format(rstrEvalWarnOneDay, [Application.Title, AExpiry])

  else

    AMsg := Format(rstrEvalWarnMultiDay,
            [Application.Title, DaysLeft, AExpiry]);

  //Set warning message...
  lblEvalMsg.Text := AMsg;
end;

end.
