// ******************************************************************
//
// Program Name   : Angelic Tech Common Library
// Platform(s)    : Android, iOS, Linux, OS X, Windows
// Framework      : Console, FMX, VCL
//
// Filename       : AT.GarbageCollector.pas
// Date Created   : 10-Apr-2017
// Author         : Matthew Vesperman
//
// Description:
//
// Automatic garbage collection routines.
//
// Revision History:
//
// v1.00   : 10-Apr-2017 - Initial version
// v1.10   : 10-Aug-2017 - Changed to stack based from list based.
//
// ******************************************************************
//
// COPYRIGHT © 2017 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

/// <summary>
///   Contains automatic garbage collection routines/classes.
/// </summary>
unit AT.GarbageCollector;

interface

uses
  System.SysUtils, Spring, Spring.Collections;

type
  /// <summary>
  ///   Garbage collector interface.
  /// </summary>
  IATGarbageCollector = interface(IInterface)
    ['{5D630F38-3194-4851-AD9F-B2D8EADCA711}']
    /// <summary>
    ///   Adds an object to the garbage collector.
    /// </summary>
    function Add(AObject: TObject): TObject; overload;
    /// <summary>
    ///   Adds a procedure to the garbage collector.
    /// </summary>
    /// <remarks>
    ///   This method allows calling code to specify cleanup code
    ///   blocks via anonymous methods.
    /// </remarks>
    procedure Add(AProc: TProc); overload;
  end;

  /// <summary>
  ///   Exception class - thrown when no object is passed to the
  ///   garbage collector's add method.
  /// </summary>
  EATGCNoObjectException = class(Exception);

  /// <summary>
  ///   Exception class - thrown when no method is passed to the
  ///   garbage collector's add method.
  /// </summary>
  EATGCNoProcedureException = class(Exception);

  /// <summary>
  ///   Garbage collector class.
  /// </summary>
  TATGC = class(TInterfacedObject, IATGarbageCollector)
  private
    /// <summary>
    ///   Internal list of objects to free upon destruction of
    ///   garbage collector object.
    /// </summary>
    FFreeList: IStack<TObject>;
  public
    /// <summary>
    ///   Creates and initializes a garbage collector object.
    /// </summary>
    constructor Create;
    /// <summary>
    ///   Adds an object to the garbage collector's internal list.
    /// </summary>
    /// <param name="AObject">
    ///   The object instance to add to the garbage collector's
    ///   internal list.
    /// </param>
    /// <exception cref="AT.GarbageCollector|EATGCNoObjectException">
    ///   Raised when AObject parameter is NIL.
    /// </exception>
    function Add(AObject: TObject): TObject; overload;
    /// <summary>
    ///   Adds a TProc method to the garbage collector's internal
    ///   list.
    /// </summary>
    /// <param name="AProc">
    ///   The method to add to the garbage collector's internal list.
    /// </param>
    /// <exception cref="AT.GarbageCollector|EATGCNoProcedureException">
    ///   Raised when no method is passed in AProc parameter.
    /// </exception>
    procedure Add(AProc: TProc); overload;
    /// <summary>
    ///   Class method to add a cleanup procedure to a garbage
    ///   collector. This will create a garbage collector object if
    ///   AGC is NIL.
    /// </summary>
    /// <param name="AProc">
    ///   The procedure to add to the garbage collector.
    /// </param>
    /// <param name="AGC">
    ///   The garbage collector to add the procedure to. If NIL then
    ///   a new garbage collector object will be created.
    /// </param>
    /// <exception cref="AT.GarbageCollector|EATGCNoProcedureException">
    ///   Raised when no method is passed in AProc parameter.
    /// </exception>
    class procedure Cleanup(AProc: TProc; var AGC: IATGarbageCollector);
    /// <typeparam name="T">
    ///   The type of the object being passed into the Collect class
    ///   method.
    /// </typeparam>
    /// <param name="AObject">
    ///   An object of type &lt;T&gt; to add to the garbage
    ///   collector.
    /// </param>
    /// <param name="AGC">
    ///   A variable pointing to a garbage collector instance. If the
    ///   variable is NIL then a new garbage collector will be
    ///   created and assigned to the variable.
    /// </param>
    /// <returns>
    ///   Returns the object passed in as AObject.
    /// </returns>
    /// <exception cref="AT.GarbageCollector|EATGCNoObjectException">
    ///   Raised when AObject parameter is NIL.
    /// </exception>
    class function Collect<T: class>(AObject: T; var AGC:
       IATGarbageCollector): T;
  end;

resourcestring
  /// <summary>
  ///   Resource string for EATGCNoProcedureException.
  /// </summary>
  rstrAddNoMethod = 'No method passed to garbage collector.';
  /// <summary>
  ///   Resource string for EATGCNoObjectException.
  /// </summary>
  rstrAddNoObject = 'No object passed to garbage collector.';

implementation

uses
  System.Classes;

type
  /// <summary>
  ///   Wrapper class to contain TProc methods for garbage collector
  ///   to run at destruction of garbage collector.
  /// </summary>
  TATGCProcRun = class(TObject)
  private
    /// <summary>
    ///   Points to a TProc based anonymous method.
    /// </summary>
    FProc: TProc;
  public
    /// <summary>
    ///   Creates and initializes a wrapper object around a TProc
    ///   anonymous method.
    /// </summary>
    /// <param name="AProc">
    ///   The anonymous method to run when the wrapper object is
    ///   destroyed.
    /// </param>
    constructor Create(AProc: TProc);
    /// <summary>
    ///   Runs the anonymous method assigned to the wrapper and then
    ///   destroys the wrapper object.
    /// </summary>
    destructor Destroy; override;
  end;

//class TATGCProcRun
constructor TATGCProcRun.Create(AProc: TProc);
begin
  //Assign anonymous method to TProc field...
  FProc := AProc;
end;

destructor TATGCProcRun.Destroy;
begin
  //if FProc fied contains an anonymous method....
  if (Assigned(FProc)) then
    FProc();  //Run the method...

  //Call the inherited destructor...
  inherited Destroy;
end;

//class TATGC

constructor TATGC.Create;
begin
  //Create a collection to hold objects to free...
  FFreeList := TCollections.CreateStack<TObject>(True);
end;

function TATGC.Add(AObject: TObject): TObject;
begin
  //Was a valid object passed to add method???
  if (NOT Assigned(AObject)) then
    begin
      //No, raise exception...
      raise EATGCNoObjectException.Create(rstrAddNoObject);
    end;

  //Add object to the internal FreeList collection...
  FFreeList.Push(AObject);

  //Return the object passed in AObject parameter...
  Result := AObject;
end;

procedure TATGC.Add(AProc: TProc);
begin
  //Was a valid procedure passed to add method???
  if (NOT Assigned(AProc)) then
    begin
      //No, raise exception...
      raise EATGCNoProcedureException.Create(rstrAddNoMethod);
    end;

  //Add AProc to the garbage collector...
  Add(TATGCProcRun.Create(AProc));
end;

class procedure TATGC.Cleanup(AProc: TProc; var AGC: IATGarbageCollector);
begin
  //Do we have a garbage collector instance???
  if (NOT Assigned(AGC)) then
    begin
      //No, create a new one...
      AGC := TATGC.Create;
    end;

  //Add AProc to the garbage collector...
  AGC.Add(AProc)
end;

class function TATGC.Collect<T>(AObject: T; var AGC: IATGarbageCollector): T;
begin
  //Do we have a garbage collector instance???
  if (NOT Assigned(AGC)) then
    begin
      //No, create a new one...
      AGC := TATGC.Create;
    end;

  //Add AObject to the garbage collector...
  Result := AGC.Add(AObject) AS T;
end;

end.
