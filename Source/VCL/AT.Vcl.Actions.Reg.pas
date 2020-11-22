unit AT.Vcl.Actions.Reg;

interface


procedure Register;


implementation

uses
  System.Actions, AT.Vcl.Actions.Data, AT.Vcl.Actions;


procedure Register;
begin
  RegisterActions ('Angelic Technology',
      [TATActionAction],
      NIL);
  RegisterActions ('Angelic Technology.Data',
      [TATBooleanDataAction,
       TATDataAction,
       TATDateTimeDataAction,
       TATInt32DataAction,
       TATInt64DataAction,
       TATMultiDataAction,
       TATStrDataAction],
      NIL);
end;




end.