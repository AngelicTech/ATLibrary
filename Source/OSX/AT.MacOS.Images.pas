//Only compile for the OS X platform.
{$IF ( (NOT Defined(MACOS)) OR (Defined(IOS)) )}
  {$MESSAGE Fatal 'AT.MacOS.Images.pas only compiles for the OS X platform.'}
{$ENDIF}

// ******************************************************************
//
// Program Name   : Angelic Tech Mac OS X Library
// Program Version: 2017
// Platform(s)    : OS X
// Framework      : None
//
// Filename       : AT.MacOS.Images.pas
// File Version   : 2017.04
// Date Created   : 13-Apr-2017
// Author         : Matthew Vesperman
//
// Description:
//
// Functions for creating/manipulating OSX images
//
// Revision History:
//
// v1.00   :   Initial version
//
// ******************************************************************
//
// COPYRIGHT © 2017 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

/// <summary>
///   Contains functions for creating/manipulating OSX images.
/// </summary>
unit AT.MacOS.Images;

interface

uses
  Macapi.AppKit;

/// <summary>Creates an empty NSImage object.
/// </summary>
/// <returns>A reference to a  NSImage interface.
/// </returns>
function CreateNSImage: NSImage; overload;
/// <summary>Creates a NSImage object initialized with the contents of the
///  filename specified by the AFilename parameter.
/// </summary>
/// <returns>A reference to a  NSImage interface.
/// </returns>
/// <param name="AFilename">(String) - The name of the file to load into the
///  NSImage object.</param>
function CreateNSImage(const AFilename: String): NSImage; overload;


implementation

uses
  Macapi.Helpers;

function CreateNSImage: NSImage;
var
  PImg: Pointer;
  AImg: NSImage;
begin
  //Create and wrap an empty NSImage...
  PImg := TNSImage.Alloc.init;
  AImg := TNSImage.Wrap(PImg);

  //Return a reference to the NSImage interface...
  Result := AImg;
end;

function CreateNSImage(const AFilename: String): NSImage;
var
  PImg: Pointer;
  AImg: NSImage;
begin
  //Create and wrap a NSImage loaded with the image specified by
  //the AFilename parameter...
  PImg := TNSImage.Alloc.initWithContentsOfFile(StrToNSStr(AFilename));
  AImg := TNSImage.Wrap(PImg);

  //Return a reference to the NSImage interface...
  Result := AImg;
end;


end.

