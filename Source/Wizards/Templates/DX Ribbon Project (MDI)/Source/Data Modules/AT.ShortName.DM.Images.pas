// ******************************************************************
//
// Program Name   : $ProgramName$
// Platform(s)    : $Platforms$
// Framework      : VCL
//
// Filename       : AT.$ShortName$.DM.Images.pas/.dfm
// File Version   : 1.00
// Date Created   : $CreateDate$
// Author         : Matthew Vesperman
//
// Description:
//
// $ProgramName$'s global images.
//
// Revision History:
//
// v1.00   :   Initial version
// v1.10   :   11-SEP-2017
//             + Document type icons (large and small).
//
// ******************************************************************
//
// COPYRIGHT © $Year$ - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

/// <summary>
///   $ProgramName$'s global images.
/// </summary>
unit AT.ShortName.DM.Images;

interface

uses
  System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls,
  cxImageList, cxGraphics;

type
  /// <summary>
  ///   Global images data module class.
  /// </summary>
  TdmImages = class(TDataModule)
    ilstDocTypeLg: TcxImageList;
    ilstDocTypeSm: TcxImageList;
    ilstLarge: TcxImageList;
    ilstSmall: TcxImageList;
    /// <summary>
    ///   Data module's OnCreate event handler.
    /// </summary>
    /// <remarks>
    ///   Initializes the Images data module.
    /// </remarks>
    procedure DataModuleCreate(Sender: TObject);
  strict protected
    /// <summary>
    ///   DocTypeLarge property getter.
    /// </summary>
    /// <returns>
    ///   A reference to the data module's Large Document Types image
    ///   list.
    /// </returns>
    function GetDocTypeLarge: TcxImageList;
    /// <summary>
    ///   DocTypeSmall property getter.
    /// </summary>
    /// <returns>
    ///   A reference to the data module's Small Document Types image
    ///   list.
    /// </returns>
    function GetDocTypeSmall: TcxImageList;
    /// <summary>
    ///   Large property getter.
    /// </summary>
    /// <returns>
    ///   A reference to the data module's Large image list.
    /// </returns>
    function GetLarge: TcxImageList;
    /// <summary>
    ///   Small property getter.
    /// </summary>
    /// <returns>
    ///   A reference to the data module's Small image list.
    /// </returns>
    function GetSmall: TcxImageList;
  public
    /// <summary>
    ///   A reference to the data module's Large Document Types image
    ///   list.
    /// </summary>
    property DocTypeLarge: TcxImageList read GetDocTypeLarge;
    /// <summary>
    ///   A reference to the data module's Small Document Types image
    ///   list.
    /// </summary>
    property DocTypeSmall: TcxImageList read GetDocTypeSmall;
    /// <summary>
    ///   A reference to the data module's Large image list.
    /// </summary>
    property Large: TcxImageList read GetLarge;
    /// <summary>
    ///   A reference to the data module's Small image list.
    /// </summary>
    property Small: TcxImageList read GetSmall;
  end;

var
  /// <summary>
  ///   Holds a reference to the global Images data module.
  /// </summary>
  dmImages: TdmImages;

/// <summary>
///   Returns a reference to the global Images data module.
/// </summary>
function Images: TdmImages;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  AT.GarbageCollector, AT.ShortName.ResourceStrings,
  AT.ShortName.Vcl.Dialogs.SplashDX, AT.ShortName.Consts;

{$R *.dfm}

var
  /// <summary>
  ///   Module level garbage collector object.
  /// </summary>
  MGC: IATGarbageCollector;

function Images: TdmImages;
begin
  if (NOT Assigned(dmImages)) then
    begin
      dmImages := TATGC.Collect(TdmImages.Create(NIL), MGC);
    end;

  Result := dmImages;
end;

procedure TdmImages.DataModuleCreate(Sender: TObject);
begin
  //Display startup message in splash screen...
  TdlgSplashDX.ChangeStartMessage(rstrStartInitImages,
      cStartMsgDelay);
end;

function TdmImages.GetDocTypeLarge: TcxImageList;
begin
  Result := ilstDocTypeLg;
end;

function TdmImages.GetDocTypeSmall: TcxImageList;
begin
  Result := ilstDocTypeSm;
end;

function TdmImages.GetLarge: TcxImageList;
begin
  Result := ilstLarge;
end;

function TdmImages.GetSmall: TcxImageList;
begin
  Result := ilstSmall;
end;

end.
