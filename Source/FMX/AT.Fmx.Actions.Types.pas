unit AT.Fmx.Actions.Types;

interface

type
  TATBoolDataAfterChangedEvent = procedure(Sender: TObject;
      const Value: Boolean) of object;
  TATBoolDataBeforeChangedEvent = procedure(Sender: TObject;
      const OldValue: Boolean; const NewValue: Boolean) of object;
  TATDataAfterChangedEvent = procedure(Sender: TObject;
      const Value: Variant) of object;
  TATDataBeforeChangedEvent = procedure(Sender: TObject;
      const OldValue: Variant; const NewValue: Variant) of object;
  TATDateTimeDataAfterChangedEvent = procedure(Sender: TObject;
      const Value: TDateTime) of object;
  TATDateTimeDataBeforeChangedEvent = procedure(Sender: TObject;
      const OldValue: TDateTime; const NewValue: TDateTime) of object;
  TATInt32DataAfterChangedEvent = procedure(Sender: TObject;
      const Value: Int32) of object;
  TATInt32DataBeforeChangedEvent = procedure(Sender: TObject;
      const OldValue: Integer; const NewValue: Integer) of object;
  TATInt64DataAfterChangedEvent = procedure(Sender: TObject;
      const Value: Int64) of object;
  TATInt64DataBeforeChangedEvent = procedure(Sender: TObject;
      const OldValue: Int64; const NewValue: Int64) of object;
  TATStrDataAfterChangedEvent = procedure(Sender: TObject;
      const Value: String) of object;
  TATStrDataBeforeChangedEvent = procedure(Sender: TObject;
      const OldValue: String; const NewValue: String) of object;



implementation

end.
