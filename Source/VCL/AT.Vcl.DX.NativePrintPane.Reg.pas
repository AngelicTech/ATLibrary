unit AT.Vcl.DX.NativePrintPane.Reg;

interface

uses
  Vcl.ImgList,
  cxPropEditors;

type
  TATdxNativePrintPaneImageIndexProperty = class(TImageIndexProperty)
  public
    function GetImages: TCustomImageList; override;
  end;


procedure Register;


implementation

uses
  System.Classes, System.UITypes, ComponentDesigner,
  DesignIntf, AT.Vcl.DX.NativePrintPane;

procedure Register;
begin
  RegisterComponents('AT DevExpress', [TATdxNativePrintPane]);
  RegisterPropertyEditor(TypeInfo(TImageIndex), TATdxNativePrintPane, '', TATdxNativePrintPaneImageIndexProperty);
end;


{ TATdxNativePrintPaneImageIndexProperty }

function TATdxNativePrintPaneImageIndexProperty.GetImages: TCustomImageList;
begin

  Result := TATdxNativePrintPane(GetComponent(0)).Images;

end;

end.
