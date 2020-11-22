// ******************************************************************
//
// Program Name   : $ProgramName$
// Platform(s)    : $Platforms$
// Framework      : VCL
//
// Filename       : AT.$ShortName$.ObjectServices.pas
// File Version   : 1.00
// Date Created   : $CreateDate$
// Author         : Matthew Vesperman
//
// Description:
//
// Object RTTI services class.
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
///   Defines an object RTTI services class.
/// </summary>
unit AT.ShortName.ObjectServices;

interface

uses
  System.Rtti;

type
  /// <summary>
  ///   Object RTTI services class.
  /// </summary>
  TATObjectServices = class(TObject)
  public
    /// <summary>
    ///   Executes AObject's method named AMethod using RTTI.
    /// </summary>
    /// <param name="AObject">
    ///   A reference to a TObject descendant that contains the
    ///   method to call.
    /// </param>
    /// <param name="AMethod">
    ///   The name of the method to call.
    /// </param>
    /// <returns>
    ///   TRUE if the method call was successful, FALSE otherwise.
    /// </returns>
    /// <remarks>
    ///   <para>
    ///     This overloaded version of ExecuteObjectMethod is used
    ///     to call a method that does NOT require any parameters.
    ///   </para>
    ///   <para>
    ///     This overloaded version of ExecuteObjectMethod can only
    ///     be used to call procedure type methods that do NOT
    ///     return a result value.
    ///   </para>
    /// </remarks>
    class function ExecuteObjectMethod(AObject: TObject;
        const AMethod: String): Boolean; overload;
    /// <summary>
    ///   Executes AObject's method named AMethod using RTTI.
    /// </summary>
    /// <param name="AObject">
    ///   A reference to a TObject descendant that contains the
    ///   method to call.
    /// </param>
    /// <param name="AMethod">
    ///   The name of the method to call.
    /// </param>
    /// <param name="AArgs">
    ///   An array of TValues that provide AMethod's parameters.
    /// </param>
    /// <returns>
    ///   TRUE if the method call was successful, FALSE otherwise.
    /// </returns>
    /// <remarks>
    ///   <para>
    ///     This overloaded version of ExecuteObjectMethod is used
    ///     to call a method that requires parameters.
    ///   </para>
    ///   <para>
    ///     This overloaded version of ExecuteObjectMethod can only
    ///     be used to call procedure type methods that do NOT
    ///     return a result value.
    ///   </para>
    /// </remarks>
    class function ExecuteObjectMethod(AObject: TObject;
        const AMethod: String;
        const AArgs: array of TValue): Boolean; overload;
    /// <summary>
    ///   Executes AObject's method named AMethod using RTTI.
    /// </summary>
    /// <param name="AObject">
    ///   A reference to a TObject descendant that contains the
    ///   method to call.
    /// </param>
    /// <param name="AMethod">
    ///   The name of the method to call.
    /// </param>
    /// <param name="AArgs">
    ///   An array of TValues that provide AMethod's parameters.
    /// </param>
    /// <param name="AResult">
    ///   <para>
    ///     If the call to ExecuteObjectMethod succeeds this will
    ///     contain the method call's returned value (if any).
    ///   </para>
    ///   <para>
    ///     If the call to ExecuteObjectMethod fails this will be
    ///     set to NIL.
    ///   </para>
    /// </param>
    /// <returns>
    ///   TRUE if the method call was successful, FALSE otherwise.
    /// </returns>
    /// <remarks>
    ///   <para>
    ///     This overloaded version of ExecuteObjectMethod is used
    ///     to call a method that requires parameters.
    ///   </para>
    ///   <para>
    ///     This overloaded version of ExecuteObjectMethod can only
    ///     be used to call procedure type methods that do NOT
    ///     return a result value as well as function type methods
    ///     that do return a result value..
    ///   </para>
    /// </remarks>
    class function ExecuteObjectMethod(AObject: TObject;
        const AMethod: String; const AArgs: array of TValue;
        out AResult: TValue): Boolean; overload;
    /// <summary>
    ///   Returns the value of AObject's AProperty property using
    ///   RTTI.
    /// </summary>
    /// <param name="AObject">
    ///   A reference to a TObject descendant that contains the
    ///   property to check
    /// </param>
    /// <param name="AProperty">
    ///   The name of AObject's property to retrieve the value from.
    /// </param>
    /// <param name="AValue">
    ///   <para>
    ///     If the call to GetObjectPropValue succeeds this
    ///     contains the property's value.
    ///   </para>
    ///   <para>
    ///     If the call to GetObjectPropValue fails this will be
    ///     set to NIL.
    ///   </para>
    /// </param>
    /// <returns>
    ///   TRUE if the method call was successful, FALSE otherwise.
    /// </returns>
    class function GetObjectPropValue(AObject: TObject;
        const AProperty: String; out AValue: TValue): Boolean;
    /// <summary>
    ///   Invokes AObject's TNotifyEvent AEventName handler using
    ///   RTTI.
    /// </summary>
    /// <param name="AObject">
    ///   A reference to a TObject descendant that contains the
    ///   TNotifyEvent handler you wish to invoke.
    /// </param>
    /// <param name="AEventName">
    ///   The name of the TNotifyEvent handler you wish to call.
    /// </param>
    /// <returns>
    ///   TRUE if the method call was successful, FALSE otherwise.
    /// </returns>
    class function InvokeNotifyEvent(AObject: TObject;
        const AEventName: String): Boolean;
    /// <summary>
    ///   Sets the caption property of AObject to ACaption using
    ///   RTTI.
    /// </summary>
    /// <param name="AObject">
    ///   A reference to a TObject that contains a caption you wish
    ///   to change.
    /// </param>
    /// <param name="ACaption">
    ///   A string containing the new caption for AObject.
    /// </param>
    class procedure SetObjectCaption(AObject: TObject;
        const ACaption: String);
    /// <summary>
    ///   Sets the checked property of AObject to ACheck using RTTI.
    /// </summary>
    /// <param name="AObject">
    ///   A reference to a TObject that contains a checked property
    ///   you wish to change.
    /// </param>
    /// <param name="ACheck">
    ///   A boolean value to set AObject's checked property to.
    /// </param>
    class procedure SetObjectChecked(AObject: TObject;
        const ACheck: Boolean);
    /// <summary>
    ///   Sets the enabled property of AObject to AEnable using RTTI.
    /// </summary>
    /// <param name="AObject">
    ///   A reference to a TObject that contains a enabled property
    ///   you wish to change.
    /// </param>
    /// <param name="AEnable">
    ///   A boolean value to set AObject's enabled property to.
    /// </param>
    class procedure SetObjectEnabled(AObject: TObject;
        const AEnable: Boolean);
    /// <summary>
    ///   Sets the hint property of AObject to AHint using RTTI.
    /// </summary>
    /// <param name="AObject">
    ///   A reference to a TObject that contains a caption you wish
    ///   to change.
    /// </param>
    /// <param name="AHint">
    ///   A string containing the new hint for AObject.
    /// </param>
    class procedure SetObjectHint(AObject: TObject;
        const AHint: String);
    /// <summary>
    ///   Sets the AProperty property of AObject to AValue using
    ///   RTTI.
    /// </summary>
    /// <param name="AObject">
    ///   A reference to a TObject descendant that contains the
    ///   property you wish to change.invoke.
    /// </param>
    /// <param name="AProperty">
    ///   The name of the property to change.
    /// </param>
    /// <param name="AValue">
    ///   The new value for the property.
    /// </param>
    /// <returns>
    ///   TRUE if the method call was successful, FALSE otherwise.
    /// </returns>
    class function SetObjectPropValue(AObject: TObject;
        const AProperty: String; const AValue: TValue): Boolean;
    /// <summary>
    ///   Sets the caption property of AObject to ACaption using
    ///   RTTI.
    /// </summary>
    /// <param name="AObject">
    ///   A reference to a TObject that contains a caption you wish
    ///   to change.
    /// </param>
    /// <param name="ACheck">
    ///   A boolean value to set AObject's checked property to.
    /// </param>
    class procedure SetObjectVisible(AObject: TObject;
        const AVisible: Boolean);
  end;

/// <summary>
///   Returns a reference to the ObjectServices global object.
/// </summary>
function ObjectServices: TATObjectServices;

implementation

uses
  AT.GarbageCollector, AT.Rtti;

const
  /// <summary>
  ///   Property Name: Caption
  /// </summary>
  cPropCaption = 'Caption';
  /// <summary>
  ///   Property Name: Checked
  /// </summary>
  cPropChecked = 'Checked';
  /// <summary>
  ///   Property Name: Enabled
  /// </summary>
  cPropEnabled = 'Enabled';
  /// <summary>
  ///   Property Name: Hint
  /// </summary>
  cPropHint    = 'Hint';
  /// <summary>
  ///   Property Name: Visible
  /// </summary>
  cPropVisible = 'Visible';


var
  /// <summary>
  ///   Module level garbage collector object.
  /// </summary>
  MGC: IATGarbageCollector;
  /// <summary>
  ///   Holds a reference to the global ObjectServices object.
  /// </summary>
  AObjServices: TATObjectServices;

function ObjectServices: TATObjectServices;
begin
  if (NOT Assigned(AObjServices)) then
    begin
      AObjServices := TATGC.Collect(TATObjectServices.Create, MGC);
    end;

  Result := AObjServices;
end;

{ TATObjectServices }
class function TATObjectServices.ExecuteObjectMethod(AObject: TObject;
    const AMethod: String): Boolean;
var
  ARes: TValue;
begin
  Result := TATObjectServices.ExecuteObjectMethod(AObject, AMethod,
      [], ARes);
end;

class function TATObjectServices.ExecuteObjectMethod(AObject: TObject;
    const AMethod: String; const AArgs: array of TValue): Boolean;
var
  ARes: TValue;
begin
  Result := TATObjectServices.ExecuteObjectMethod(AObject, AMethod,
      AArgs, ARes);
end;

class function TATObjectServices.ExecuteObjectMethod(AObject: TObject;
    const AMethod: String; const AArgs: array of TValue;
    out AResult: TValue): Boolean;
begin
  if (NOT Assigned(AObject)) then
    Exit(False);

  Result := AT.Rtti.ExecuteMethod(AObject, AMethod, AArgs, AResult);
end;

class function TATObjectServices.GetObjectPropValue(AObject: TObject;
    const AProperty: String; out AValue: TValue): Boolean;
begin
  if (NOT Assigned(AObject)) then
    Exit(False);

  Result := AT.Rtti.GetPropertyValue(AObject, AProperty, AValue);
end;

class function TATObjectServices.InvokeNotifyEvent(AObject: TObject;
    const AEventName: String): Boolean;
begin
  if (NOT Assigned(AObject)) then
    Exit(False);

  Result := AT.Rtti.InvokeNotifyEvent(AObject, AEventName);
end;

class procedure TATObjectServices.SetObjectCaption(AObject: TObject;
    const ACaption: String);
begin
  if (NOT Assigned(AObject)) then
    Exit;

  TATObjectServices.SetObjectPropValue(AObject, cPropCaption,
      ACaption);
end;

class procedure TATObjectServices.SetObjectChecked(AObject: TObject;
    const ACheck: Boolean);
begin
  if (NOT Assigned(AObject)) then
    Exit;

  TATObjectServices.SetObjectPropValue(AObject, cPropChecked, ACheck);
end;

class procedure TATObjectServices.SetObjectEnabled(AObject: TObject;
    const AEnable: Boolean);
begin
  if (NOT Assigned(AObject)) then
    Exit;

  TATObjectServices.SetObjectPropValue(AObject, cPropEnabled,
      AEnable);
end;

class procedure TATObjectServices.SetObjectHint(AObject: TObject;
    const AHint: String);
begin
  if (NOT Assigned(AObject)) then
    Exit;

  TATObjectServices.SetObjectPropValue(AObject, cPropHint, AHint);
end;

class function TATObjectServices.SetObjectPropValue(AObject: TObject;
    const AProperty: String; const AValue: TValue): Boolean;
begin
  if (NOT Assigned(AObject)) then
    Exit(False);

  Result := AT.Rtti.SetPropertyValue(AObject, AProperty, AValue);
end;

class procedure TATObjectServices.SetObjectVisible(AObject: TObject;
    const AVisible: Boolean);
begin
  if (NOT Assigned(AObject)) then
    Exit;

  TATObjectServices.SetObjectPropValue(AObject, cPropVisible,
      AVisible);
end;

end.
