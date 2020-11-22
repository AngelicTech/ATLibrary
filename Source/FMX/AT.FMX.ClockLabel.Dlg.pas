unit AT.FMX.ClockLabel.Dlg;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, AT.FMX.ClockLabel;

type
  TATFMXClockLabelDlg = class(TForm)
    txtFormat: TEdit;
    lblFormat: TLabel;
    btnOK: TButton;
    btnCancel: TButton;
    btnPreview: TButton;
    clklblPreview: TATFMXClockLabel;
    procedure btnPreviewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure txtFormatChange(Sender: TObject);
  strict private
    function GetFormat: String;
    procedure SetFormat(const Value: String);
    procedure UpdateClockLabelFormat;
  public
    property Format: String read GetFormat write SetFormat;
  end;

var
  ATFMXClockLabelDlg: TATFMXClockLabelDlg;

implementation

{$R *.fmx}

procedure TATFMXClockLabelDlg.btnPreviewClick(Sender: TObject);
begin
  UpdateClockLabelFormat;
end;

procedure TATFMXClockLabelDlg.FormCreate(Sender: TObject);
begin
  Format := '';
end;

function TATFMXClockLabelDlg.GetFormat: String;
begin
  Result := txtFormat.Text;
end;

procedure TATFMXClockLabelDlg.SetFormat(const Value: String);
begin
  txtFormat.Text := Value;
  UpdateClockLabelFormat;
end;

procedure TATFMXClockLabelDlg.txtFormatChange(Sender: TObject);
begin
  UpdateClockLabelFormat;
end;

procedure TATFMXClockLabelDlg.UpdateClockLabelFormat;
begin
  clklblPreview.Format := Format;
end;

end.
