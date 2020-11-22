// ******************************************************************
//
// Program Name   : Angelic Tech Common Library
// Program Version: 2017
// Platform(s)    : Android, iOS, Linux, OS X, Windows
// Framework      : None
//
// Filename       : AT.Rtti.pas
// File Version   : 2017.04
// Date Created   : 11-Apr-2017
// Author         : Matthew Vesperman
//
// Description:
//
// Runtime Type Information (RTTI) routines.
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
///   Contains runtime-type-information routines.
/// </summary>
unit AT.Rtti;

interface

uses
  System.Rtti;


/// <summary>
///   Executes a class method using RTTI.
/// </summary>
/// <param name="AClass">
///   The class whose method you wish to invoke.
/// </param>
/// <param name="AMethod">
///   The name of the method to invoke.
/// </param>
/// <param name="AArgs">
///   An array of values to pass to the method. (The method's
///   parameter values.)
/// </param>
/// <param name="AResult">
///   A variable to receive the result (if any) returned by the
///   method.
/// </param>
/// <returns>
///   Returns TRUE if the method was successfully executed, FALSE
///   otherwise.
/// </returns>
function ExecuteClassMethod(AClass: TClass; AMethod: String;
  const AArgs: array of TValue; var AResult: TValue): Boolean;
/// <summary>
///   Executes an object's method using RTTI.
/// </summary>
/// <param name="AObject">
///   The object whose method you wish to invoke.
/// </param>
/// <param name="AMethod">
///   The name of the method to invoke.
/// </param>
/// <param name="AArgs">
///   An array of values to pass to the method. (The method's
///   parameter values.)
/// </param>
/// <param name="AResult">
///   A variable to receive the result (if any) returned by the
///   method.
/// </param>
/// <returns>
///   Returns TRUE if the method was successfully executed, FALSE
///   otherwise.
/// </returns>
function ExecuteMethod(AObject: TObject; AMethod: String;
  const AArgs: array of TValue; var AResult: TValue): Boolean;
/// <summary>
///   Retrieve the class type for any class that ends in Name.
/// </summary>
/// <param name="Name">
///   The ending of the class name you are looking for.
/// </param>
/// <param name="AClass">
///   A variable to receive the class.
/// </param>
/// <returns>
///   TRUE if a class that ends in Name is found, FALSE otherwise.
/// </returns>
function FindAnyClass(const Name: string; out AClass: TClass): Boolean;
/// <summary>
///   Returns the property value of an object.
/// </summary>
/// <param name="AObject">
///   The object whose property value you wish to retrieve.
/// </param>
/// <param name="AProperty">
///   The name of the property to retrieve.
/// </param>
/// <param name="AValue">
///   A variable to receive the property's value .
/// </param>
/// <returns>
///   Returns TRUE if the property was successfully retrieved, FALSE
///   otherwise.
/// </returns>
function GetPropertyValue(AObject: TObject; AProperty: String;
  var AValue: TValue): Boolean;
/// <summary>
///   Determines if an object has a desired method.
/// </summary>
/// <param name="AObject">
///   The object you wish to check for a desired method.
/// </param>
/// <param name="AMethod">
///   The name of the method you are trying to find.
/// </param>
/// <returns>
///   Returns TRUE if <i>AObject</i> has a method named <i>AMethod</i>
///   , FALSE otherwise.
/// </returns>
function HasMethod(AObject: TObject; AMethod: String): Boolean;
/// <summary>
///   Determines if an object has a desired property.
/// </summary>
/// <param name="AObject">
///   The object you wish to check for a desired property.
/// </param>
/// <param name="AProperty">
///   The name of the property you are trying to find.
/// </param>
/// <returns>
///   Returns TRUE if <i>AObject</i> has a property named <i>
///   AProperty</i> , FALSE otherwise.
/// </returns>
function HasProperty(AObject: TObject; AProperty: String): Boolean;
function InvokeNotifyEvent(AObject: TObject; AEventName: String): Boolean;
/// <summary>
///   Sets the property value of an object.
/// </summary>
/// <param name="AObject">
///   The object whose property value you wish to change.
/// </param>
/// <param name="AProperty">
///   The name of the property to change.
/// </param>
/// <param name="AValue">
///   The value to set into the property
/// </param>
/// <returns>
///   Returns TRUE if the property was successfully changed, FALSE
///   otherwise.
/// </returns>
/// <remarks>
///   An event may be passed by first assigning it to a TValue
///   variable using the TValue.From&lt;T&gt;(const Value: T) class
///   method. <br />
/// </remarks>
/// <example>
///   <code lang="Delphi">//Set an event handler.
/// var
///   AValue: TValue;
/// begin
///   AValue := TValue.From&lt;TNotifyEvent&gt;(Self.OnButtonListChanged);
///   SetPropertyValue(FButtons, 'OnChange', AValue);
/// end;</code>
/// </example>
function SetPropertyValue(AObject: TObject; AProperty: String;
  const AValue: TValue): Boolean;


implementation

uses
  System.SysUtils, System.StrUtils, System.Classes, System.TypInfo,
  AT.Rtti.Automate;


function ExecuteClassMethod(AClass: TClass; AMethod: String;
  const AArgs: array of TValue; var AResult: TValue): Boolean;
var
  AContext: TRttiContext;
  AType: TRttiType;
  AMeth: TRttiMethod;
begin
  //Get rtti context...
  AContext := TRttiContext.Create;
  var ACtxAutoFree := TATRttiAutoFreeCtx.Create(AContext);

  //Attempt to use rtti...
  //Try to get the type info for AClass...
  AType := AContext.GetType(AClass.ClassInfo);

  //Did we get type info for AClass???
  if (NOT Assigned(AType)) then
    begin
      //No assign NIL to AResult...
      AResult := NIL;
      //Exit, return failure...
      Exit(False);
    end;

  //Attempt to get the method named in AMethod...
  AMeth := AType.GetMethod(AMethod);

  //Did we get a reference to the method???
  if (NOT Assigned(AMeth)) then
    begin
      //No assign NIL to AResult...
      AResult := NIL;
      //Exit, return failure...
      Exit(False);
    end;

  //Invoke the method and set AResult...
  AResult := AMeth.Invoke(AClass, AArgs);

  //Indicate success...
  Result := True;

end;

function ExecuteMethod(AObject: TObject; AMethod: String;
  const AArgs: array of TValue; var AResult: TValue): Boolean;
var
  AContext: TRttiContext;
  AType: TRttiType;
  AMeth: TRttiMethod;
begin
  //Get rtti context...
  AContext := TRttiContext.Create;
  var ACtxAutoFree := TATRttiAutoFreeCtx.Create(AContext);

  //Attempt to use rtti...
  //Try to get the type info for AObject...
  AType := AContext.GetType(AObject.ClassInfo);

  //Did we get type info for AObject???
  if (NOT Assigned(AType)) then
    begin
      //No assign NIL to AResult...
      AResult := NIL;
      //Exit, return failure...
      Exit(False);
    end;

  //Attempt to get the method named in AMethod...
  AMeth := AType.GetMethod(AMethod);

  //Did we get a reference to the method???
  if (NOT Assigned(AMeth)) then
    begin
      //No assign NIL to AResult...
      AResult := NIL;
      //Exit, return failure...
      Exit(False);
    end;

  //Invoke the method and set AResult...
  AResult := AMeth.Invoke(AObject, AArgs);

  //Indicate success...
  Result := True;
end;

function FindAnyClass(const Name: string;
    out AClass: TClass): Boolean;
var
  AContext: TRttiContext;
  AType: TRttiType;
  AList: TArray<TRttiType>;
begin
  //Create RTTI context object...
  AContext := TRttiContext.Create;
  var ACtxAutoFree := TATRttiAutoFreeCtx.Create(AContext);

  //Get a list of all class types...
  AList := AContext.GetTypes;

  //Iterate over class type list...
  for AType in AList do
    begin
      //Do we have a class that matches our search criteria???
      if ( (AType.IsInstance) AND (EndsText(Name, AType.Name)) ) then
        begin
          //Yes, return it and exit...
          AClass := AType.AsInstance.MetaClassType;
          Exit(True);
        end;
    end;

  //Nothing found...
  Result := False;
end;

function GetPropertyValue(AObject: TObject; AProperty: String;
  var AValue: TValue): Boolean;
begin
  //Get rtti context...
  var AContext := TRttiContext.Create;
  var ACtxAutoFree := TATRttiAutoFreeCtx.Create(AContext);

  //Attempt to use rtti...
  //Try to get the type info for AObject...
  var AType := AContext.GetType(AObject.ClassInfo);

  //Did we get type info for AObject???
  if (NOT Assigned(AType)) then
    begin
      //No assign NIL to AValue...
      AValue := NIL;
      //Exit, return failure...
      Exit(False);
    end;

  //Attempt to access the property named in AProperty...
  var AProp := AType.GetProperty(AProperty);

  //Did we get a reference to the property???
  if (NOT Assigned(AProp)) then
    begin
      //No assign NIL to AValue...
      AValue := NIL;
      //Exit, return failure...
      Exit(False);
    end;

  //Can the property be read???
  if (NOT AProp.IsReadable) then
    begin
      //No assign NIL to AValue...
      AValue := NIL;
      //Exit, return failure...
      Exit(False);
    end;

  //Get the property's value and assign it to AValue...
  AValue := AProp.GetValue(AObject);

  //Indicate success...
  Result := True;
end;

function HasMethod(AObject: TObject; AMethod: String): Boolean;
var
  AContext: TRttiContext;
  AType: TRttiType;
  AMeth: TRttiMethod;
begin
  //Get rtti context...
  AContext := TRttiContext.Create;
  var ACtxAutoFree := TATRttiAutoFreeCtx.Create(AContext);

  //Attempt to use rtti...
  //Try to get the type info for AObject...
  AType := AContext.GetType(AObject.ClassInfo);

  //Did we get type info for AObject???
  if (NOT Assigned(AType)) then
    Exit(False);  //No return false...

  //Attempt to get method named in AMethod...
  AMeth := AType.GetMethod(AMethod);

  //Indicate if we found the method...
  Result := Assigned(AMeth);
end;

function HasProperty(AObject: TObject; AProperty: String): Boolean;
var
  AContext: TRttiContext;
  AType: TRttiType;
  AProp: TRttiProperty;
begin
  //Get rtti context...
  AContext := TRttiContext.Create;
  var ACtxAutoFree := TATRttiAutoFreeCtx.Create(AContext);

  //Attempt to use rtti...
  //Try to get the type info for AObject...
  AType := AContext.GetType(AObject.ClassInfo);

  //Did we get type info for AObject???
  if (NOT Assigned(AType)) then
    Exit(False);  //No, return False...

  //Attempt to get property name in AProperty...
  AProp := AType.GetProperty(AProperty);

  //Indicate if we found the property...
  Result := Assigned(AProp);
end;

function InvokeNotifyEvent(AObject: TObject; AEventName: String): Boolean;
var
  AContext: TRttiContext;
  AType: TRttiType;
  AProp: TRttiProperty;
  AMethod: TValue;
  AMethodType: TRttiInvokableType;
begin
  AContext := TRttiContext.Create;
  var ACtxAutoFree := TATRttiAutoFreeCtx.Create(AContext);

  AType := AContext.GetType(AObject.ClassInfo);
  if (NOT Assigned(AType)) then
    Exit(False);

  AProp := AType.GetProperty(AEventName);
  if (NOT Assigned(AProp)) then
    Exit(False);

  if (NOT (AProp.PropertyType.TypeKind = tkMethod)) then
    Exit(False);

  AMethod := AProp.GetValue(AObject);

  if (AMethod.IsEmpty) then
    Exit(False);

  AType := AContext.GetType(AMethod.TypeInfo);

  if (NOT Assigned(AType)) then
    Exit(False);

  if (NOT (AType IS TRttiInvokableType)) then
    Exit(False);

  AMethodType := (AType AS TRttiInvokableType);

  AMethodType.Invoke(AMethod, [AObject]);

  Result := True;
end;

function SetPropertyValue(AObject: TObject; AProperty: String;
  const AValue: TValue): Boolean;
var
  AContext: TRttiContext;
  AType: TRttiType;
  AProp: TRttiProperty;
begin
  //Get rtti context...
  AContext := TRttiContext.Create;
  var ACtxAutoFree := TATRttiAutoFreeCtx.Create(AContext);

  //Attempt to use rtti...
  //Try to get the type info for AObject...
  AType := AContext.GetType(AObject.ClassInfo);

  //Did we get type info for AObject???
  if (NOT Assigned(AType)) then
    Exit(False);  //No, return False...

  //Attempt to get the property named in AProperty...
  AProp := AType.GetProperty(AProperty);

  //Did we get a reference to the property???
  if (NOT Assigned(AProp)) then
    Exit(False);  //No, return false...

  //Is the property writable???
  if (NOT AProp.IsWritable) then
    Exit(False);  //No, return False...

  //Attempt to set the property value...
  AProp.SetValue(AObject, AValue);

  //Indicate success..
  Result := True;
end;


end.
