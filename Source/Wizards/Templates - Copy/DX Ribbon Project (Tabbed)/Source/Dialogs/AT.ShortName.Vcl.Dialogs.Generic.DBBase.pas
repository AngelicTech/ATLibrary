// ******************************************************************
//
// Program Name   : $ProgramName$
// Platform(s)    : $Platforms$
// Framework      : VCL
//
// Filename       : AT.$ShortName$.Vcl.Dialogs.Generic.DBBase.pas/.dfm
// File Version   : 1.00
// Date Created   : $CreateDate$
// Author         : Matthew Vesperman
//
// Description:
//
// $ProgramName$'s base generic dataset aware dialog box class.
//
// Revision History:
//
// v1.00   :   Initial version
//
// ******************************************************************
//
// COPYRIGHT © $Year$ - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

/// <summary>
///   $ProgramName$'s base generic dataset aware dialog box class.
/// </summary>
unit AT.ShortName.Vcl.Dialogs.Generic.DBBase;

interface

uses
  System.Classes, AT.ShortName.Vcl.Dialogs.Generic.Base, dxSkinsCore,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  dxBarBuiltInMenu, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, cxGraphics, cxControls,Data.DB,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.WinXCtrls, cxPC, Vcl.Controls;

type
  /// <summary>
  ///   Generic dataset aware dialog box base class.
  /// </summary>
  TdlgGenericDBBase = class(TdlgGenericBase)
    dsDlg: TDataSource;
  strict private
    /// <summary>
    ///   Stores a reference to a TDataSet descendant.
    /// </summary>
    FDataSet: TDataSet;
  strict protected
    /// <summary>
    ///   DataSet property setter.
    /// </summary>
    procedure SetDataSet(const Value: TDataSet); virtual;
    /// <summary>
    ///   Implements the logic for the dialog's Cancel button.
    /// </summary>
    /// <remarks>
    ///   If there is a dataset attached to the dialog any changes
    ///   will be canceled before the inherited code is called.
    /// </remarks>
    procedure _CancelClicked; override;
    /// <summary>
    ///   Implements the logic for the dialog's Ok button.
    /// </summary>
    /// <remarks>
    ///   If there is a dataset attached to the dialog any changes
    ///   will be posted before the inherited code is called.
    /// </remarks>
    procedure _OkClicked; override;
  public
    /// <summary>
    ///   References a TDataSet descendant.
    /// </summary>
    property DataSet: TDataSet read FDataSet write SetDataSet;
  end;

var
  dlgGenericDBBase: TdlgGenericDBBase;

implementation

{$R *.dfm}

procedure TdlgGenericDBBase.SetDataSet(const Value: TDataSet);
begin
  FDataSet := Value;
  dsDlg.DataSet := Value;
end;

procedure TdlgGenericDBBase._CancelClicked;
begin
  if (Assigned(FDataSet)) then
    FDataSet.Cancel;

  inherited _CancelClicked;
end;

procedure TdlgGenericDBBase._OkClicked;
begin
  if (Assigned(FDataSet)) then
    FDataSet.Post;

  inherited _OkClicked;
end;

end.
