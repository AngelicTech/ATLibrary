unit AT.Vcl.DX.NativeFileSelector.Reg;

interface

uses
  Vcl.ImgList,
  cxPropEditors;

type
  TATdxNativeFileSelectorImageIndexProperty = class(TImageIndexProperty)
  public
    function GetImages: TCustomImageList; override;
  end;


procedure Register;


implementation

uses
  System.Classes, System.UITypes, ComponentDesigner,
  DesignIntf, AT.Vcl.DX.NativeFileSelector, FiltEdit;

procedure Register;
begin
  RegisterComponents('AT DevExpress', [TATdxNativeFileSelector]);
  RegisterPropertyEditor(TypeInfo(TImageIndex), TATdxNativeFileSelector, '', TATdxNativeFileSelectorImageIndexProperty);
  RegisterPropertyEditor(TypeInfo(String), TATdxNativeFileSelector, 'Filter', TFilterProperty);
end;


{ TATdxNativeFileSelectorImageIndexProperty }

function TATdxNativeFileSelectorImageIndexProperty.GetImages: TCustomImageList;
begin

  Result := TATdxNativeFileSelector(GetComponent(0)).Images;

end;

end.
