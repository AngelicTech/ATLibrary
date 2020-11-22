// ******************************************************************
//
// Program Name   : Single Instance Framework
// Platform(s)    : Android, iOS, OSX, Linux64, Win32, Win64
// Framework      : FMX
//
// Filename       : AT.SingleInstance.Base.pas
// File Version   : 1.00
// Date Created   : 07-Dec-2017
// Author         : Matthew Vesperman
//
// Description:
//
// Base class and types for the single instance checking framework.
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
///   Defines the base class and types for the single instance
///   checking framework.
/// </summary>
unit AT.SingleInstance.Base;

interface

uses
  System.Classes, Spring.Collections;

type
  /// <summary>
  ///   Defines the single instance handler procedure that is used to
  ///   receive command line parameters from additional instances.
  /// </summary>
  /// <remarks>
  ///   <para>
  ///     The framework calls these handlers to inform the app when
  ///     command line parameters are received.
  ///   </para>
  ///   <para>
  ///     Handlers are registered by calling
  ///     SingleInstance.AddHandler and passing a reference to the
  ///     handler.
  ///   </para>
  /// </remarks>
  TATSingleInstanceHandler = reference to procedure(
      AParams: TStrings);

  /// <summary>
  ///   The base single instance checking class.
  /// </summary>
  /// <remarks>
  ///   <para>
  ///     This class provides valid methods and properties for use
  ///     with platforms that the framework is not designed to work
  ///     with (or make no sense to use with).
  ///   </para>
  ///   <para>
  ///     Descendant classes are provided for use with Linux, OS X
  ///     and Windows. All other platforms use this base class by
  ///     default.
  ///   </para>
  /// </remarks>
  TATCustomSingleInstance = class(TInterfacedObject)
  strict private
    /// <summary>
    ///   References a dictionary that holds the parameter handlers.
    /// </summary>
    /// <seealso cref="AT.SingleInstance.Base|TATCustomSingleInstance.Handlers">
    ///   TATCustomSingleInstance.Handlers
    /// </seealso>
    FHandlers: IDictionary<TGUID, TATSingleInstanceHandler>;
  strict protected
    /// <summary>
    ///   Returns a reference to the handlers dictionary.
    /// </summary>
    /// <seealso cref="AT.SingleInstance.Base|TATCustomSingleInstance.Handlers">
    ///   TATCustomSingleInstance.Handlers
    /// </seealso>
    function GetHandlers: IDictionary<TGUID, TATSingleInstanceHandler>;
        virtual;
    /// <summary>
    ///   Returns the value of the IsFirstInstance property.
    /// </summary>
    /// <remarks>
    ///   Overridden in descendant classes to return the proper value
    ///   for a given platform.
    /// </remarks>
    /// <seealso cref="AT.SingleInstance.Base|TATCustomSingleInstance.IsFirstInstance">
    ///   TATCustomSingleInstance.IsFirstInstance
    /// </seealso>
    function GetIsFirstInstance: Boolean; virtual;
    /// <summary>
    ///   Returns the value of the MessageID property.
    /// </summary>
    /// <remarks>
    ///   <para>
    ///     Not all platforms use this property. The default value
    ///     is 0.
    ///   </para>
    ///   <para>
    ///     This method is overridden in descendant classes that
    ///     require the use of the MessageID property.
    ///   </para>
    /// </remarks>
    /// <seealso cref="AT.SingleInstance.Base|TATCustomSingleInstance.MessageID">
    ///   TATCustomSingleInstance.MessageID
    /// </seealso>
    function GetMessageID: Cardinal; virtual;
    /// <summary>
    ///   Stores a MessageID number for those platforms that require
    ///   it.
    /// </summary>
    /// <remarks>
    ///   Most platforms don't use this property. On those platforms
    ///   the value is 0.
    /// </remarks>
    property MessageID: Cardinal read GetMessageID;
  public
    /// <summary>
    ///   The class' constructor method.
    /// </summary>
    constructor Create; virtual;
    /// <summary>
    ///   Adds a handler to the params handlers dictionary.
    /// </summary>
    /// <param name="AHandler">
    ///   A reference to a procedure to be called when command line
    ///   parameters a received from new instances.
    /// </param>
    /// <returns>
    ///   A GUID that uniquely identifies the handler in the
    ///   dictionary.
    /// </returns>
    /// <remarks>
    ///   If you wish to be able to delete the handler from the
    ///   dictionary at a later time then you should save the return
    ///   value from this method.
    /// </remarks>
    function AddHandler(AHandler: TATSingleInstanceHandler): TGUID;
        virtual;
    /// <summary>
    ///   Class function that is used to detrmine if the current
    ///   instance is the first running instance of the app.
    /// </summary>
    /// <param name="AppID">
    ///   <para>
    ///     A string that uniquely identifies the application.
    ///   </para>
    ///   <para>
    ///     Note: I recommend the use of a GUID string here.
    ///   </para>
    /// </param>
    /// <param name="IsFirst">
    ///   Receives a value that indicates if this is the first
    ///   instance.
    /// </param>
    /// <param name="Err">
    ///   Receives any applicable error codes.
    /// </param>
    /// <returns>
    ///   True if the function call was successful, false otherwise.
    /// </returns>
    /// <remarks>
    ///   This class function provides a base default for platforms
    ///   that the framework was not designed to work with (or ones
    ///   that it makes no sense to use with).
    /// </remarks>
    class function CheckSingleInstance(const AppID: String; out IsFirst:
        Boolean; out Err: Integer): Boolean; virtual;
    /// <summary>
    ///   Sends the command line parameters from this instance to the
    ///   first instance.
    /// </summary>
    /// <remarks>
    ///   This method does nothing in the base class.
    /// </remarks>
    procedure SendParamStrings; virtual;
    /// <summary>
    ///   Starts the listening mechanism that is used to wait for
    ///   command line parameters.
    /// </summary>
    /// <remarks>
    ///   This method does nothing in the base class.
    /// </remarks>
    procedure StartListening; virtual;
    /// <summary>
    ///   A reference to the dictionary that holds the param string
    ///   handlers.
    /// </summary>
    property Handlers: IDictionary<TGUID, TATSingleInstanceHandler>
        read GetHandlers;
    /// <summary>
    ///   A flag that indicates if the current instance was the first
    ///   instance to run.
    /// </summary>
    property IsFirstInstance: Boolean read GetIsFirstInstance;
  end;

implementation

uses
  System.SysUtils;

constructor TATCustomSingleInstance.Create;
begin
  inherited;

  //Create the handler dictionary...
  FHandlers := TCollections.CreateDictionary<TGUID,
      TATSingleInstanceHandler>([]);
end;

function TATCustomSingleInstance.AddHandler(AHandler:
    TATSingleInstanceHandler): TGUID;
begin
  //Create a new GUID and set it as the result value...
  CreateGUID(Result);

  //Add the handler to the dictionary using the GUID as the key...
  Handlers[Result] := AHandler;
end;

class function TATCustomSingleInstance.CheckSingleInstance(const
    AppID: String; out IsFirst: Boolean; out Err: Integer): Boolean;
begin
  //There is NO instance checking in the base class so return working
  //default values...
  IsFirst := True;  //All instances are considered first instances...
  Err := 0;         //There is no error to report...
  Result := True;   //function call succeeded...
end;

function TATCustomSingleInstance.GetHandlers: IDictionary<TGUID,
    TATSingleInstanceHandler>;
begin
  //Return a reference to the handlers dictionary...
  Result := FHandlers;
end;

function TATCustomSingleInstance.GetIsFirstInstance: Boolean;
begin
  //Base class is always a first instance...
  Result := True;
end;

function TATCustomSingleInstance.GetMessageID: Cardinal;
begin
  //No message id, so return 0...
  Result := 0;
end;

procedure TATCustomSingleInstance.SendParamStrings;
begin
  // Do nothing...
end;

procedure TATCustomSingleInstance.StartListening;
begin
  // Do nothing...
end;

end.
