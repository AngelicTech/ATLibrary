unit AT.FMX.ClockLabel.Editors;

interface

uses
  DesignEditors, DesignIntf;

type
  TATFMXClockLabelComponentEditor = class(TComponentEditor)
  strict private
    procedure ShowDesigner;
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  TATFMXClockLabelPropertyEditor = class(TStringProperty)
  strict private
    procedure ShowDesigner;
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

procedure Register;

implementation

uses
  System.SysUtils, System.UITypes, AT.FMX.ClockLabel,
  AT.FMX.ClockLabel.Dlg, AT.GarbageCollector;

procedure Register;
begin
  RegisterComponentEditor(TATFMXClockLabel, TATFMXClockLabelComponentEditor);
  RegisterPropertyEditor(TypeInfo(string), TATFMXClockLabel, 'Format',
     TATFMXClockLabelPropertyEditor);
end;

//TATFMXClockLabelComponentEditor

procedure TATFMXClockLabelComponentEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    0: ShowDesigner;
  else
    raise ENotImplemented.Create('TATFMXClockLabel has only one verb ' +
       '(Index = 0) supported');
  end;
end;

function TATFMXClockLabelComponentEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := '&Show Editor';
  else
    raise ENotImplemented.Create('TATFMXClockLabel has only one verb ' +
       '(Index = 0) supported');
  end;
end;

function TATFMXClockLabelComponentEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

procedure TATFMXClockLabelComponentEditor.ShowDesigner;
var
  AFrm: TATFMXClockLabelDlg;
  AGC: IATGarbageCollector;
begin
  AFrm := TATGC.Collect(TATFMXClockLabelDlg.Create(NIL), AGC);

  AFrm.Format := (Component AS TATFMXClockLabel).Format;

  if (AFrm.ShowModal = mrOK) then
    begin
      (Component AS TATFMXClockLabel).Format := AFrm.Format;
      Designer.Modified;
    end;
end;

//TATFMXClockLabelPropertyEditor

procedure TATFMXClockLabelPropertyEditor.Edit;
begin
  ShowDesigner;
end;

function TATFMXClockLabelPropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

procedure TATFMXClockLabelPropertyEditor.ShowDesigner;
var
  AFrm: TATFMXClockLabelDlg;
  AGC: IATGarbageCollector;
begin
  AFrm := TATGC.Collect(TATFMXClockLabelDlg.Create(NIL), AGC);

  AFrm.Format := GetStrValue;

  if (AFrm.ShowModal = mrOK) then
    begin
      SetStrValue(AFrm.Format);
    end;
end;

end.
