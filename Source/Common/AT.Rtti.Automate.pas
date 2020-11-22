// ******************************************************************
//
// Program Name   : AT Library
// Platform(s)    : Android, iOS, Linux, MacOS, Windows
// Framework      : Console, FMX, VCL
//
// Filename       : AT.Rtti.Automate.pas
// Date Created   : 22-Nov-2020
// Author         : Matthew Vesperman
//
// Description:
//
// Defines managed record types to manage RTTI objects.
//
// Revision History:
//
// v1.00   :   Initial version
//
// ******************************************************************
//
// COPYRIGHT © 2020 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

/// <summary>
///   Defines managed record types to manage RTTI objects.
/// </summary>
unit AT.Rtti.Automate;

interface

uses
  System.Classes, System.SysUtils, System.Rtti;

type
  TATRttiAutoFreeCtx = record
  private
    FContext: TRttiContext;
  public
    constructor Create(var AContext: TRttiContext);
    class operator Initialize(out ADest: TATRttiAutoFreeCtx);
    class operator Finalize(var ADest: TATRttiAutoFreeCtx);
    class operator Assign(var ADest: TATRttiAutoFreeCtx;
      const [ref] ASrc: TATRttiAutoFreeCtx);
  end;

implementation

constructor TATRttiAutoFreeCtx.Create(var AContext: TRttiContext);
begin
  FContext := AContext;
end;

class operator TATRttiAutoFreeCtx.Initialize(out ADest: TATRttiAutoFreeCtx);
begin
  FillChar(ADest.FContext, SizeOf(TRttiContext), 0);// := nil;
end;

class operator TATRttiAutoFreeCtx.Finalize(var ADest: TATRttiAutoFreeCtx);
begin
  ADest.FContext.Free;
end;

class operator TATRttiAutoFreeCtx.Assign(var ADest: TATRttiAutoFreeCtx;
  const [ref] ASrc: TATRttiAutoFreeCtx);
begin
  raise EInvalidOperation.Create(
    'TATRttiAutoFreeCtx records cannot be copied')
end;

end.
