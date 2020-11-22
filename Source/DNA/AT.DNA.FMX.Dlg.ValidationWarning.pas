// ******************************************************************
//
// Program Name   : AT Software_DNA Library
// Program Version: 1.00
// Platform(s)    : OS X, Win32, Win64
// Framework      : FireMonkey
//
// Filenames      : AT.DNA.FMX.Dlg.ValidationWarning.pas/.fmx
// File Version   : 1.20
// Date Created   : 04-MAY-2016
// Author         : Matthew S. Vesperman
//
// Description:
//
// Validation warning dialog for Software_DNA - FireMonkey version for
// cross-platform.
//
// Revision History:
//
// v1.00   :   Initial version
// v1.10   :   02-JUN-2016
//               + text field trimming
// v1.20   :   02-JUL-2016
//               * Implemented resource strings
//
// ******************************************************************
//
// COPYRIGHT © 2015 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************


unit AT.DNA.FMX.Dlg.ValidationWarning;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms,
  FMX.Dialogs, FMX.StdCtrls, AT.DNA.FMX.Dlg.Base, System.ImageList,
  FMX.ImgList, FMX.Objects, FMX.Layouts, FMX.Controls.Presentation;

type
  TDNAValidationWarnDlg = class(TDNABaseDlg)
    lblWarnMsg: TLabel;
  strict private
    /// <summary>
    ///   Stores the value of the ActivationCode property.
    /// </summary>
    FActivationCode: String;
    /// <summary>
    ///   Stores the value of the DaysLeft property.
    /// </summary>
    FDaysLeft: Integer;
    /// <summary>
    ///   Stores the value of the ExpireDate property.
    /// </summary>
    FExpireDate: TDateTime;
    /// <summary>
    ///   A flag indicating if the BeginUpdate method was called.
    /// </summary>
    /// <remarks>
    ///   <para>
    ///     This flag is used by th _UpdateWarnMsg method to
    ///     determine if it should update the warning message.
    ///   </para>
    ///   <para>
    ///     If this field is TRUE then _UpdateWarnMsg will exit
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
    procedure _UpdateWarnMsg;
  strict protected
    procedure InitControls; override;
    procedure InitFields; override;
  public
    /// <summary>
    ///   Sets a flag that tells _UpdateWarnMsg not to update the
    ///   warning message.
    /// </summary>
    /// <remarks>
    ///   A call to BeginUpdate must be paired with a call to
    ///   EndUpdate to force an update to the warning message.
    /// </remarks>
    procedure BeginUpdate; override;
    /// <summary>
    ///   Clears the flag that tells _UpdateWarnMsg to skip updating
    ///   and then forces an update of the warning message by calling
    ///   _UpdateWarnMsg.
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
  end;

var
  DNAValidationWarnDlg: TDNAValidationWarnDlg;

implementation

uses
  AT.GarbageCollector, AT.DNA.ResourceStrings;


{$R *.fmx}

procedure TDNAValidationWarnDlg.BeginUpdate;
begin
  inherited BeginUpdate;

  //Set flag...
  FUpdating := True;
end;

procedure TDNAValidationWarnDlg.EndUpdate;
begin
  //Clear flag...
  FUpdating := False;

  //Force update...
  _UpdateWarnMsg;

  inherited EndUpdate;
end;

procedure TDNAValidationWarnDlg.InitControls;
begin
  inherited InitControls;     //call inherited...

  btnCancel.Visible := False; //Hide cancel button...

  btnOK.Text := rstrClose;      //Change OK button caption to 'Close'...
end;

procedure TDNAValidationWarnDlg.InitFields;
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

procedure TDNAValidationWarnDlg.SetActivationCode
  (const Value: String);
begin
  // Store activation code...
  FActivationCode := Value;

  // Set dialog caption to include activation code...
  Self.Caption := Format(rstrVWarnDlgCapFmt, [Value]);
end;

procedure TDNAValidationWarnDlg.SetDaysLeft(const Value: Integer);
begin
  //Set days left field...
  FDaysLeft := Value;

  //Update warning message...
  _UpdateWarnMsg;
end;

procedure TDNAValidationWarnDlg.SetExpireDate(const Value: TDateTime);
begin
  //Set expire date field...
  FExpireDate := Value;

  //Update warning message...
  _UpdateWarnMsg;
end;

procedure TDNAValidationWarnDlg._UpdateWarnMsg;
var
  ADaysSuffix: String;
  AExpiry: String;
  AMsg: string;
begin
  if (FUpdating) then   //Was BeginUpdate called?
    Exit;               //Yes, o exit...

  if (Self.DaysLeft = 1) then //Is only 1 day left?
    ADaysSuffix := EmptyStr   //Yes, there is no suffix...
  else
    ADaysSuffix := rstrDaysSuffix;       //No, set suffix to 's'...

  //Format the expire date as a string...
  AExpiry := FormatDateTime('dddd, dd-mmm-yyyy', ExpireDate);

  //Format the warning message...
  //Format the warning message...
  AMsg := Format(rstrVWarnDlgMsg,
    [Application.Title, DaysLeft, ADaysSuffix, AExpiry]);

  //Set warning message...
  lblWarnMsg.Text := AMsg;
end;

end.
