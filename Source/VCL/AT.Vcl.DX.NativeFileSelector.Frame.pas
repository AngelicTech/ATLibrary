unit AT.Vcl.DX.NativeFileSelector.Frame;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.ShlObj,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,
  Vcl.Menus, Vcl.StdCtrls, Vcl.ActnList, Vcl.ImgList,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxShellCommon, cxContainer, cxEdit, cxClasses, cxMaskEdit,
  cxDropDownEdit, cxTextEdit, cxListView, cxShellListView, cxTreeView,
  cxShellTreeView, cxButtons, cxShellControls,
  dxSkinsCore,
  dxLayoutContainer, dxLayoutControlAdapters, dxLayoutcxEditAdapters,
  dxLayoutLookAndFeels, dxBreadcrumbEdit, dxShellBreadcrumbEdit,
  dxLayoutControl;



const
  cAllFilesFilter = 'All Files (*.*)|*.*';



type
  TATFileSelectorViewMode = (
      fsvmUnknown,
      fsvmDetails,
      fsvmList,
      fsvmSmIcons,
      fsvmMedIcons,
      fsvmLgIcons,
      fsvmXLIcons,
      fsvmThumbnails
    );

  TATdxNativeFileSelectorFrame = class(TFrame)
    actAccept: TAction;
    actBCParentFolder: TAction;
    actBCRefresh: TAction;
    actCancel: TAction;
    actCreateFolder: TAction;
    alstFileSelect: TActionList;
    btnAccept: TcxButton;
    btnCancel: TcxButton;
    btnNewFolder: TcxButton;
    btnViewMode: TcxButton;
    cmbFileType: TcxComboBox;
    layFileSelect: TdxLayoutControl;
    laygrpButtons: TdxLayoutGroup;
    laygrpCmdLayout: TdxLayoutGroup;
    laygrpEdits: TdxLayoutGroup;
    laygrpFileSelectGroup_Root: TdxLayoutGroup;
    laygrpShellCtrls: TdxLayoutGroup;
    layitmAcceptBtn: TdxLayoutItem;
    layitmBreadcrumb: TdxLayoutItem;
    layitmCancelBtn: TdxLayoutItem;
    layitmFileName: TdxLayoutItem;
    layitmFileTypeCmb: TdxLayoutItem;
    layitmNewFldrBtn: TdxLayoutItem;
    layitmShellLV: TdxLayoutItem;
    layitmShellTV: TdxLayoutItem;
    layitmViewsBtn: TdxLayoutItem;
    layspc1: TdxLayoutEmptySpaceItem;
    layspc2: TdxLayoutEmptySpaceItem;
    layspc3: TdxLayoutEmptySpaceItem;
    layspc4: TdxLayoutEmptySpaceItem;
    layspc5: TdxLayoutEmptySpaceItem;
    layspltEdits: TdxLayoutSplitterItem;
    layspltShellCtrls: TdxLayoutSplitterItem;
    sbcFileSelect: TdxShellBreadcrumbEdit;
    shllvFileSelect: TcxShellListView;
    shltvFileSelect: TcxShellTreeView;
    txtFileName: TcxTextEdit;
    procedure CmbFileTypeChangeHandler(Sender: TObject);
    procedure EditSplitterCanResizeHandler(Sender: TObject; AItem:
        TdxCustomLayoutItem; var ANewSize: Integer; var AAccept: Boolean);
    procedure ExecuteAcceptButtonAction(Sender: TObject);
    procedure ExecuteBCParentFolderAction(Sender: TObject);
    procedure ExecuteBCRefreshAction(Sender: TObject);
    procedure ExecuteCancelButtonAction(Sender: TObject);
    procedure ExecuteCreateFolderAction(Sender: TObject);
    procedure FileNameChangedHandler(Sender: TObject);
    procedure FileNameKeyPressHandler(Sender: TObject; var Key: Char);
    procedure ShellListAddFolderHandler(Sender: TObject; AFolder: TcxShellFolder;
        var ACanAdd: Boolean);
    procedure ShellListBeforeNavHandler(Sender: TcxCustomShellListView;
        ANewAbsolutePIDL: PItemIDList);
    procedure ShellListExecuteItemHandler(Sender: TObject; APIDL: PItemIDList; var
        AHandled: Boolean);
    procedure ShellListSelectItemHandler(Sender: TObject; Item: TListItem;
        Selected: Boolean);
    procedure UpdateAcceptButtonAction(Sender: TObject);
    procedure UpdateBCParentFolderAction(Sender: TObject);
    procedure UpdateCreateFolderAction(Sender: TObject);
  strict private
    FExtraLargeIconSize: Integer;
    FFilter: String;
    FFilterList: TStringList;
    FLargeIconSize: Integer;
    FMediumIconSize: Integer;
    FOnAcceptButtonClick: TNotifyEvent;
    FOnCancelButtonClick: TNotifyEvent;
    FOnExecuteItem: TcxShellExecuteItemEvent;
    FSkipFNChgHandler: Boolean;
    FZipFilesAreFolders: Boolean;
    function _CanAddFile(AFolder: TcxShellFolder): Boolean;
    function _CanAddFolder(AFolder: TcxShellFolder): Boolean;
    procedure _ProcessFilters;
    procedure _ResetIconSpacing(AThmbSz: Integer);
  strict protected
    procedure DoAcceptButtonClick;
    procedure DoCancelButtonClick;
    function GetAcceptButtonCaption: String;
    function GetAcceptButtonHint: String;
    function GetAcceptButtonImageIndex: System.UITypes.TImageIndex;
    function GetAcceptButtonWidth: Integer;
    function GetBreadCrumbBar: TdxShellBreadcrumbEdit;
    function GetCanBrowseParentFolder: Boolean;
    function GetCancelButtonCaption: String;
    function GetCancelButtonHint: String;
    function GetCancelButtonImageIndex: System.UITypes.TImageIndex;
    function GetCancelButtonVisible: Boolean;
    function GetCancelButtonWidth: Integer;
    function GetCanCreateNewFolder: Boolean; virtual;
    function GetCurrentPath: String;
    function GetExtraLargeIconSize: Integer;
    function GetFileName: System.SysUtils.TFileName;
    function GetFilter: String;
    function GetFilterIndex: Integer;
    function GetImages: TCustomImageList;
    function GetLargeIconSize: Integer;
    function GetLayoutLookAndFeel: TdxCustomLayoutLookAndFeel;
    function GetListView: TcxShellListView;
    function GetMediumIconSize: Integer;
    function GetNewFolderButtonCaption: String;
    function GetNewFolderButtonHint: String;
    function GetNewFolderButtonVisible: Boolean;
    function GetNewFolderButtonWidth: Integer;
    function GetNewFolderImageIndex: System.UITypes.TImageIndex;
    function GetParentFolderButtonHint: String;
    function GetParentFolderImageIndex: System.UITypes.TImageIndex;
    function GetRefreshButtonHint: String;
    function GetRefreshImageIndex: System.UITypes.TImageIndex;
    function GetTreeView: TcxShellTreeView;
    function GetViewMode: TATFileSelectorViewMode;
    function GetViewsButtonHint: String;
    function GetViewsDropDownMenu: TComponent;
    function GetViewsImageIndex: System.UITypes.TImageIndex;
    function GetZipFilesAreFolders: Boolean;
    procedure SetAcceptButtonCaption(const Value: String);
    procedure SetAcceptButtonHint(const Value: String);
    procedure SetAcceptButtonImageIndex(const Value: System.UITypes.TImageIndex);
    procedure SetAcceptButtonWidth(const Value: Integer);
    procedure SetCancelButtonCaption(const Value: String);
    procedure SetCancelButtonHint(const Value: String);
    procedure SetCancelButtonImageIndex(const Value: System.UITypes.TImageIndex);
    procedure SetCancelButtonVisible(const Value: Boolean);
    procedure SetCancelButtonWidth(const Value: Integer);
    procedure SetCurrentPath(const Value: String);
    procedure SetExtraLargeIconSize(const Value: Integer);
    procedure SetFileName(const Value: System.SysUtils.TFileName);
    procedure SetFilter(const Value: String);
    procedure SetFilterIndex(const Value: Integer);
    procedure SetImages(const Value: TCustomImageList);
    procedure SetLargeIconSize(const Value: Integer);
    procedure SetLayoutLookAndFeel(const Value: TdxCustomLayoutLookAndFeel);
    procedure SetMediumIconSize(const Value: Integer);
    procedure SetNewFolderButtonCaption(const Value: String);
    procedure SetNewFolderButtonHint(const Value: String);
    procedure SetNewFolderButtonVisible(const Value: Boolean);
    procedure SetNewFolderButtonWidth(const Value: Integer);
    procedure SetNewFolderImageIndex(const Value: System.UITypes.TImageIndex);
    procedure SetParentFolderButtonHint(const Value: String);
    procedure SetParentFolderImageIndex(const Value: System.UITypes.TImageIndex);
    procedure SetRefreshButtonHint(const Value: String);
    procedure SetRefreshImageIndex(const Value: System.UITypes.TImageIndex);
    procedure SetViewMode(const Value: TATFileSelectorViewMode);
    procedure SetViewsButtonHint(const Value: String);
    procedure SetViewsDropDownMenu(const Value: TComponent);
    procedure SetViewsImageIndex(const Value: System.UITypes.TImageIndex);
    procedure SetZipFilesAreFolders(const Value: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure BrowseParentFolder;
    function CreateNewFolder: Boolean; overload;
    function CreateNewFolder(out NewPath: String): Boolean; overload;
    procedure RefreshLists;
    property CanBrowseParentFolder: Boolean read GetCanBrowseParentFolder;
    property CanCreateNewFolder: Boolean read GetCanCreateNewFolder;
  published
    property AcceptButtonCaption: String read GetAcceptButtonCaption write
        SetAcceptButtonCaption;
    property AcceptButtonHint: String read GetAcceptButtonHint write
        SetAcceptButtonHint;
    property AcceptButtonImageIndex: System.UITypes.TImageIndex read GetAcceptButtonImageIndex
        write SetAcceptButtonImageIndex;
    property AcceptButtonWidth: Integer read GetAcceptButtonWidth write
        SetAcceptButtonWidth;
    property BreadCrumbBar: TdxShellBreadcrumbEdit read GetBreadCrumbBar;
    property CancelButtonCaption: String read GetCancelButtonCaption write
        SetCancelButtonCaption;
    property CancelButtonHint: String read GetCancelButtonHint write
        SetCancelButtonHint;
    property CancelButtonImageIndex: System.UITypes.TImageIndex read GetCancelButtonImageIndex
        write SetCancelButtonImageIndex;
    property CancelButtonVisible: Boolean read GetCancelButtonVisible write
        SetCancelButtonVisible;
    property CancelButtonWidth: Integer read GetCancelButtonWidth write
        SetCancelButtonWidth;
    property CurrentPath: String read GetCurrentPath write SetCurrentPath;
    property ExtraLargeIconSize: Integer read GetExtraLargeIconSize write
        SetExtraLargeIconSize default 256;
    property FileName: System.SysUtils.TFileName read GetFileName write SetFileName;
    property Filter: String read GetFilter write SetFilter;
    property FilterIndex: Integer read GetFilterIndex write SetFilterIndex;
    property Images: TCustomImageList read GetImages write SetImages;
    property LargeIconSize: Integer read GetLargeIconSize write SetLargeIconSize
        default 96;
    property LayoutLookAndFeel: TdxCustomLayoutLookAndFeel read
        GetLayoutLookAndFeel write SetLayoutLookAndFeel;
    property ListView: TcxShellListView read GetListView;
    property MediumIconSize: Integer read GetMediumIconSize write SetMediumIconSize
        default 64;
    property NewFolderButtonCaption: String read GetNewFolderButtonCaption write
        SetNewFolderButtonCaption;
    property NewFolderButtonHint: String read GetNewFolderButtonHint write
        SetNewFolderButtonHint;
    property NewFolderButtonVisible: Boolean read GetNewFolderButtonVisible write
        SetNewFolderButtonVisible;
    property NewFolderButtonWidth: Integer read GetNewFolderButtonWidth write
        SetNewFolderButtonWidth;
    property NewFolderImageIndex: System.UITypes.TImageIndex read GetNewFolderImageIndex write
        SetNewFolderImageIndex;
    property ParentFolderButtonHint: String read GetParentFolderButtonHint write
        SetParentFolderButtonHint;
    property ParentFolderImageIndex: System.UITypes.TImageIndex read GetParentFolderImageIndex
        write SetParentFolderImageIndex;
    property RefreshButtonHint: String read GetRefreshButtonHint write
        SetRefreshButtonHint;
    property RefreshImageIndex: System.UITypes.TImageIndex read GetRefreshImageIndex write
        SetRefreshImageIndex;
    property TreeView: TcxShellTreeView read GetTreeView;
    property ViewMode: TATFileSelectorViewMode read GetViewMode write SetViewMode;
    property ViewsButtonHint: String read GetViewsButtonHint write
        SetViewsButtonHint;
    property ViewsDropDownMenu: TComponent read GetViewsDropDownMenu write
        SetViewsDropDownMenu;
    property ViewsImageIndex: System.UITypes.TImageIndex read GetViewsImageIndex write
        SetViewsImageIndex;
    property ZipFilesAreFolders: Boolean read GetZipFilesAreFolders write
        SetZipFilesAreFolders;
    property OnAcceptButtonClick: TNotifyEvent read FOnAcceptButtonClick write
        FOnAcceptButtonClick;
    property OnCancelButtonClick: TNotifyEvent read FOnCancelButtonClick write
        FOnCancelButtonClick;
    property OnExecuteItem: TcxShellExecuteItemEvent read FOnExecuteItem write
        FOnExecuteItem;
  end;


implementation

{$R *.dfm}

uses
  Winapi.CommCtrl,
  System.StrUtils, System.Types, System.IOUtils, System.Math;



constructor TATdxNativeFileSelectorFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FFilterList := TStringList.Create;

  FExtraLargeIconSize := 256;
  FLargeIconSize := 96;
  FMediumIconSize := 64;

  Filter := cAllFilesFilter;

  FSkipFNChgHandler := False;
  FZipFilesAreFolders := False;

  FileName := EmptyStr;
end;

destructor TATdxNativeFileSelectorFrame.Destroy;
begin
  FreeAndNil(FFilterList);

  inherited;
end;

procedure TATdxNativeFileSelectorFrame.BrowseParentFolder;
begin

  if (CanBrowseParentFolder) then
    sbcFileSelect.BrowseParent;

end;

procedure TATdxNativeFileSelectorFrame.CmbFileTypeChangeHandler(Sender: TObject);
var
  AKey: String;
  AVal: String;
  Idx: Integer;
begin
  Idx := cmbFileType.ItemIndex;

  if (Idx < 0) then
    exit;

  AKey := cmbFileType.Properties.Items[Idx];

  Idx := FFilterList.IndexOfName(AKey);

  if (Idx < 0) then
    exit;

  AVal := FFilterList.Values[AKey];

  shllvFileSelect.Options.FileMask := AVal;
end;

function TATdxNativeFileSelectorFrame.CreateNewFolder: Boolean;
var
  AJunk: String;
begin
  Result := CreateNewFolder(AJunk);
end;

function TATdxNativeFileSelectorFrame.CreateNewFolder(out NewPath: String): Boolean;
var
  ACurrPath: String;
  AItem: TListItem;
  ANewName: String;
  ANewPath: String;
  Cnt: Integer;
  Idx: Integer;
begin
  if (NOT CanCreateNewFolder) then
    exit(False);

  ACurrPath := ListView.AbsolutePath;

  ACurrPath := IncludeTrailingPathDelimiter(ACurrPath);

  ANewName := 'New folder';
  ANewPath := Format('%s%s', [ACurrPath, ANewName]);

  if (TDirectory.Exists(ANewPath)) then
    begin
      Idx := 0;

      repeat
        Inc(Idx);

        ANewName := Format('New folder (%d)', [Idx]);
        ANewPath := Format('%s%s', [ACurrPath, ANewName]);
      until (NOT TDirectory.Exists(ANewPath));
    end;

  try
    TDirectory.CreateDirectory(ANewPath);
  except
    exit(False);
  end;

  NewPath := ANewPath;
  Result := True;

  ListView.UpdateContent;

  Cnt := ListView.InnerListView.Items.Count;

  for Idx := 0 to (Cnt - 1) do
    begin

      AItem := ListView.InnerListView.Items.Item[Idx];

      if (SameText(ANewName, AItem.Caption)) then
        begin
          AItem.EditCaption;
          break;
        end;
    end;
end;

procedure TATdxNativeFileSelectorFrame.DoAcceptButtonClick;
begin
  if (Assigned(FOnAcceptButtonClick)) then
    FOnAcceptButtonClick(Self);
end;

procedure TATdxNativeFileSelectorFrame.DoCancelButtonClick;
begin
  if (Assigned(FOnCancelButtonClick)) then
    FOnCancelButtonClick(Self);
end;

procedure TATdxNativeFileSelectorFrame.EditSplitterCanResizeHandler(Sender:
    TObject; AItem: TdxCustomLayoutItem; var ANewSize: Integer; var AAccept:
    Boolean);
begin
  if (AItem = layitmFileTypeCmb) then
    begin
      AAccept := ( (ANewSize <= 350) AND (ANewSize >= 200) );
    end;
end;

procedure TATdxNativeFileSelectorFrame.ExecuteAcceptButtonAction(Sender: TObject);
begin
  DoAcceptButtonClick;
end;

procedure TATdxNativeFileSelectorFrame.ExecuteBCParentFolderAction(Sender: TObject);
begin
  BrowseParentFolder;
end;

procedure TATdxNativeFileSelectorFrame.ExecuteBCRefreshAction(Sender: TObject);
begin
  RefreshLists;
end;

procedure TATdxNativeFileSelectorFrame.ExecuteCancelButtonAction(Sender: TObject);
begin
  DoCancelButtonClick;
end;

procedure TATdxNativeFileSelectorFrame.ExecuteCreateFolderAction(Sender: TObject);
begin
  CreateNewFolder;
end;

procedure TATdxNativeFileSelectorFrame.FileNameChangedHandler(Sender: TObject);
begin
  if (FSkipFNChgHandler) then
    Exit;

  shllvFileSelect.InnerListView.ClearSelection;
end;

procedure TATdxNativeFileSelectorFrame.FileNameKeyPressHandler(Sender: TObject; var Key:
    Char);
begin
  case Key of
    #13: actAccept.Execute;
  end;
end;

function TATdxNativeFileSelectorFrame.GetAcceptButtonCaption: String;
begin
  Result := actAccept.Caption;
end;

function TATdxNativeFileSelectorFrame.GetAcceptButtonHint: String;
begin
  Result := actAccept.Hint;
end;

function TATdxNativeFileSelectorFrame.GetAcceptButtonImageIndex: System.UITypes.TImageIndex;
begin
  Result := actAccept.ImageIndex;
end;

function TATdxNativeFileSelectorFrame.GetAcceptButtonWidth: Integer;
begin
  Result := btnAccept.Width;
end;

function TATdxNativeFileSelectorFrame.GetBreadCrumbBar: TdxShellBreadcrumbEdit;
begin
  Result := sbcFileSelect;
end;

function TATdxNativeFileSelectorFrame.GetCanBrowseParentFolder: Boolean;
begin

  if (NOT Assigned(sbcFileSelect.Selected)) then
    exit(False);

  if (NOT Assigned(sbcFileSelect.Selected.Parent)) then
    exit(False);

  Result := True;

end;

function TATdxNativeFileSelectorFrame.GetCancelButtonCaption: String;
begin
  Result := actCancel.Caption;
end;

function TATdxNativeFileSelectorFrame.GetCancelButtonHint: String;
begin
  Result := actCancel.Hint;
end;

function TATdxNativeFileSelectorFrame.GetCancelButtonImageIndex: System.UITypes.TImageIndex;
begin
  Result := actCancel.ImageIndex;
end;

function TATdxNativeFileSelectorFrame.GetCancelButtonVisible: Boolean;
begin
  Result := layitmCancelBtn.Visible;
end;

function TATdxNativeFileSelectorFrame.GetCancelButtonWidth: Integer;
begin
  Result := btnCancel.Width;
end;

function TATdxNativeFileSelectorFrame.GetCanCreateNewFolder: Boolean;
var
  ACurrPath: String;
begin
  if (NOT Assigned(ListView)) then
    exit (False);

  ACurrPath := ListView.AbsolutePath;

  if (ACurrPath.IsEmpty) then
    exit(False);

  Result := TDirectory.Exists(ACurrPath);
end;

function TATdxNativeFileSelectorFrame.GetCurrentPath: String;
begin
  Result := shllvFileSelect.AbsolutePath;
end;

function TATdxNativeFileSelectorFrame.GetExtraLargeIconSize: Integer;
begin
  Result := FExtraLargeIconSize;
end;

function TATdxNativeFileSelectorFrame.GetFileName: System.SysUtils.TFileName;
var
  AExt: String;
  AFileName: String;
  AFld: TcxShellFolder;
  AFolder: String;
  AName: String;
  Idx: Integer;
begin
  AFileName := txtFileName.Text;

  if (NOT AFileName.IsEmpty) then
    begin
      AFolder := ExtractFilePath(AFileName);
      AName := ExtractFileName(AFileName);

      if ( (AFolder.IsEmpty) AND (NOT AName.IsEmpty) ) then
        begin
          AFolder := IncludeTrailingPathDelimiter(CurrentPath);
          AFileName := Format('%s%s', [AFolder, AName]);
        end;

      exit(AFileName);
    end
  else
    begin

      Idx := shllvFileSelect.InnerListView.ItemIndex;

      if (Idx < 0) then
        exit(EmptyStr);

      AFld := shllvFileSelect.Folders[Idx];

      if (NOT AFld.IsFolder) then
        begin

          AFileName := AFld.PathName;

          exit(AFileName);

        end;

      AExt := ExtractFileExt(AFld.PathName);

      if ( (SameText(AExt, '.zip')) AND (NOT ZipFilesAreFolders) ) then
        begin

          AFileName := AFld.PathName;

          exit(AFileName);

        end;

    end;

  Result := EmptyStr;

end;

function TATdxNativeFileSelectorFrame.GetFilter: String;
begin
  Result := FFilter;
end;

function TATdxNativeFileSelectorFrame.GetFilterIndex: Integer;
begin
  if (cmbFileType.ItemIndex < 0) then
    Result := 1
  else
    Result := cmbFileType.ItemIndex + 1;
end;

function TATdxNativeFileSelectorFrame.GetImages: TCustomImageList;
begin
  Result := alstFileSelect.Images;
end;

function TATdxNativeFileSelectorFrame.GetLargeIconSize: Integer;
begin
  Result := FLargeIconSize;
end;

function TATdxNativeFileSelectorFrame.GetLayoutLookAndFeel: TdxCustomLayoutLookAndFeel;
begin
  Result := layFileSelect.LookAndFeel;
end;

function TATdxNativeFileSelectorFrame.GetListView: TcxShellListView;
begin
  Result := shllvFileSelect;
end;

function TATdxNativeFileSelectorFrame.GetMediumIconSize: Integer;
begin
  Result := FMediumIconSize;
end;

function TATdxNativeFileSelectorFrame.GetNewFolderButtonCaption: String;
begin
  Result := actCreateFolder.Caption;
end;

function TATdxNativeFileSelectorFrame.GetNewFolderButtonHint: String;
begin
  Result := actCreateFolder.Hint;
end;

function TATdxNativeFileSelectorFrame.GetNewFolderButtonVisible: Boolean;
begin
  Result := actCreateFolder.Visible;
end;

function TATdxNativeFileSelectorFrame.GetNewFolderButtonWidth: Integer;
begin
  Result := btnNewFolder.Width;
end;

function TATdxNativeFileSelectorFrame.GetNewFolderImageIndex: System.UITypes.TImageIndex;
begin
  Result := actCreateFolder.ImageIndex;
end;

function TATdxNativeFileSelectorFrame.GetParentFolderButtonHint: String;
begin
  Result := actBCParentFolder.Hint;
end;

function TATdxNativeFileSelectorFrame.GetParentFolderImageIndex: System.UITypes.TImageIndex;
begin
  Result := actBCParentFolder.ImageIndex;
end;

function TATdxNativeFileSelectorFrame.GetRefreshButtonHint: String;
begin
  Result := actBCRefresh.Hint;
end;

function TATdxNativeFileSelectorFrame.GetRefreshImageIndex: System.UITypes.TImageIndex;
begin
  Result := actBCRefresh.ImageIndex;
end;

function TATdxNativeFileSelectorFrame.GetTreeView: TcxShellTreeView;
begin
  Result := shltvFileSelect;
end;

function TATdxNativeFileSelectorFrame.GetViewMode: TATFileSelectorViewMode;
var
  AThmHgt: Integer;
  AThmWid: Integer;
begin

  case shllvFileSelect.ViewStyle of
    vsReport   : Result := fsvmDetails;
    vsList     : Result := fsvmList;
    vsSmallIcon: Result := fsvmSmIcons;
    vsIcon     :
        begin

          if (NOT shllvFileSelect.ThumbnailOptions.ShowThumbnails) then
            exit(fsvmMedIcons);

          AThmHgt := shllvFileSelect.ThumbnailOptions.Height;
          AThmWid := shllvFileSelect.ThumbnailOptions.Width;

          if ( (AThmHgt = FMediumIconSize) AND
               (AThmWid = FMediumIconSize) ) then
            exit(fsvmMedIcons);

          if ( (AThmHgt = FLargeIconSize) AND (AThmWid = FLargeIconSize) ) then
            exit(fsvmLgIcons);

          if ( (AThmHgt = FExtraLargeIconSize) AND
               (AThmWid = FExtraLargeIconSize) ) then
            exit(fsvmXLIcons);

          Result := fsvmThumbnails;

        end;
  else
    Result := fsvmUnknown;
  end;

end;

function TATdxNativeFileSelectorFrame.GetViewsButtonHint: String;
begin
  Result := btnViewMode.Hint;
end;

function TATdxNativeFileSelectorFrame.GetViewsDropDownMenu: TComponent;
begin
  Result := btnViewMode.DropDownMenu;
end;

function TATdxNativeFileSelectorFrame.GetViewsImageIndex: System.UITypes.TImageIndex;
begin
  Result := btnViewMode.OptionsImage.ImageIndex;
end;

function TATdxNativeFileSelectorFrame.GetZipFilesAreFolders: Boolean;
begin
  Result := FZipFilesAreFolders;
end;

procedure TATdxNativeFileSelectorFrame.RefreshLists;
begin
  sbcFileSelect.Refresh;
  shltvFileSelect.Refresh;
  shltvFileSelect.Refresh;
end;

procedure TATdxNativeFileSelectorFrame.SetAcceptButtonCaption(const Value: String);
begin
  actAccept.Caption := Value;
end;

procedure TATdxNativeFileSelectorFrame.SetAcceptButtonHint(const Value: String);
begin
  actAccept.Hint := Value;
end;

procedure TATdxNativeFileSelectorFrame.SetAcceptButtonImageIndex(const Value: System.UITypes.TImageIndex);
begin
  actAccept.ImageIndex := Value;
end;

procedure TATdxNativeFileSelectorFrame.SetAcceptButtonWidth(const Value: Integer);
begin
  btnAccept.Width := Value;
end;

procedure TATdxNativeFileSelectorFrame.SetCancelButtonCaption(const Value: String);
begin
  actCancel.Caption := Value;
end;

procedure TATdxNativeFileSelectorFrame.SetCancelButtonHint(const Value: String);
begin
  actCancel.Hint := Value;
end;

procedure TATdxNativeFileSelectorFrame.SetCancelButtonImageIndex(const Value: System.UITypes.TImageIndex);
begin
  actCancel.ImageIndex := Value;
end;

procedure TATdxNativeFileSelectorFrame.SetCancelButtonVisible(const Value: Boolean);
begin
  layitmCancelBtn.Visible := Value;
end;

procedure TATdxNativeFileSelectorFrame.SetCancelButtonWidth(const Value: Integer);
begin
  btnCancel.Width := Value;
end;

procedure TATdxNativeFileSelectorFrame.SetCurrentPath(const Value: String);
begin
  shllvFileSelect.AbsolutePath := Value;
end;

procedure TATdxNativeFileSelectorFrame.SetExtraLargeIconSize(const Value: Integer);
var
  AVal: Integer;
begin
  AVal := System.Math.Max(32, Value);

  if (ViewMode = fsvmXLIcons) then
    begin

      ListView.ThumbnailOptions.Height := AVal;
      ListView.ThumbnailOptions.Width := AVal;

      _ResetIconSpacing(AVal);

    end;

  FExtraLargeIconSize := AVal;
end;

procedure TATdxNativeFileSelectorFrame.SetFileName(const Value: System.SysUtils.TFileName);
begin
  txtFileName.Text := Value;
end;

procedure TATdxNativeFileSelectorFrame.SetFilter(const Value: String);
begin
  if (Value.IsEmpty) then
    FFilter := cAllFilesFilter
  else if (Pos('|', Value) <= 0) then
    FFilter := cAllFilesFilter
  else
    FFilter := Trim(Value);

  _ProcessFilters;
end;

procedure TATdxNativeFileSelectorFrame.SetFilterIndex(const Value: Integer);
begin
  if (cmbFileType.Properties.Items.Count < 1) then
    exit;

  if (Value < 1) then
    cmbFileType.ItemIndex := 0
  else if (Value > cmbFileType.Properties.Items.Count) then
    cmbFileType.ItemIndex := 0
  else
    cmbFileType.ItemIndex := Value - 1;
end;

procedure TATdxNativeFileSelectorFrame.SetImages(const Value: TCustomImageList);
begin
  alstFileSelect.Images := Value;
  btnAccept.OptionsImage.Images := Value;
  btnCancel.OptionsImage.Images := Value;
  btnNewFolder.OptionsImage.Images := Value;
  btnViewMode.OptionsImage.Images := Value;
  sbcFileSelect.Properties.ButtonImages := Value;
end;

procedure TATdxNativeFileSelectorFrame.SetLargeIconSize(const Value: Integer);
var
  AVal: Integer;
begin
  AVal := System.Math.Max(24, Value);

  if (ViewMode = fsvmLgIcons) then
    begin

      ListView.ThumbnailOptions.Height := AVal;
      ListView.ThumbnailOptions.Width := AVal;

      _ResetIconSpacing(AVal);

    end;

  FLargeIconSize := AVal;
end;

procedure TATdxNativeFileSelectorFrame.SetLayoutLookAndFeel(const Value:
    TdxCustomLayoutLookAndFeel);
begin
  layFileSelect.LookAndFeel := Value;
end;

procedure TATdxNativeFileSelectorFrame.SetMediumIconSize(const Value: Integer);
var
  AVal: Integer;
begin
  AVal := System.Math.Max(16, Value);

  if (ViewMode = fsvmMedIcons) then
    begin

      ListView.ThumbnailOptions.Height := AVal;
      ListView.ThumbnailOptions.Width := AVal;

      _ResetIconSpacing(AVal);

    end;

  FMediumIconSize := AVal;
end;

procedure TATdxNativeFileSelectorFrame.SetNewFolderButtonCaption(const Value: String);
begin
  actCreateFolder.Caption := Value;
end;

procedure TATdxNativeFileSelectorFrame.SetNewFolderButtonHint(const Value: String);
begin
  actCreateFolder.Hint := Value;
end;

procedure TATdxNativeFileSelectorFrame.SetNewFolderButtonVisible(const Value: Boolean);
begin
  actCreateFolder.Visible := Value;
end;

procedure TATdxNativeFileSelectorFrame.SetNewFolderButtonWidth(const Value: Integer);
begin
  btnNewFolder.Width := Value;
end;

procedure TATdxNativeFileSelectorFrame.SetNewFolderImageIndex(const Value: System.UITypes.TImageIndex);
begin
  actCreateFolder.ImageIndex := Value;
end;

procedure TATdxNativeFileSelectorFrame.SetParentFolderButtonHint(const Value: String);
begin
  actBCParentFolder.Hint := Value;
end;

procedure TATdxNativeFileSelectorFrame.SetParentFolderImageIndex(const Value: System.UITypes.TImageIndex);
begin
  actBCParentFolder.ImageIndex := Value;
end;

procedure TATdxNativeFileSelectorFrame.SetRefreshButtonHint(const Value: String);
begin
  actBCRefresh.Hint := Value;
end;

procedure TATdxNativeFileSelectorFrame.SetRefreshImageIndex(const Value: System.UITypes.TImageIndex);
begin
  actBCRefresh.ImageIndex := Value;
end;

procedure TATdxNativeFileSelectorFrame.SetViewMode(const Value: TATFileSelectorViewMode);
var
  AThmbSz: Integer;
begin

  case Value of
    fsvmUnknown   : exit;
    fsvmDetails   : shllvFileSelect.ViewStyle := vsReport;
    fsvmList      : shllvFileSelect.ViewStyle := vsList;
    fsvmSmIcons   : shllvFileSelect.ViewStyle := vsSmallIcon;
    fsvmMedIcons,
    fsvmLgIcons,
    fsvmXLIcons   :
        begin
          shllvFileSelect.ViewStyle := vsIcon;

          if (Value = fsvmMedIcons) then
            AThmbSz := MediumIconSize
          else if (Value =  fsvmLgIcons) then
            AThmbSz := LargeIconSize
          else if (Value = fsvmXLIcons) then
            AThmbSz := ExtraLargeIconSize
          else
            exit;

          shllvFileSelect.ThumbnailOptions.ShowThumbnails := True;
          shllvFileSelect.ThumbnailOptions.Height := AThmbSz;
          shllvFileSelect.ThumbnailOptions.Width := AThmbSz;

          _ResetIconSpacing(AThmbSz);
        end;
    fsvmThumbnails: shllvFileSelect.ThumbnailOptions.ShowThumbnails := True;
  end;

  shllvFileSelect.Repaint;

end;

procedure TATdxNativeFileSelectorFrame.SetViewsButtonHint(const Value: String);
begin
  btnViewMode.Hint := Value;
end;

procedure TATdxNativeFileSelectorFrame.SetViewsDropDownMenu(const Value: TComponent);
begin
  btnViewMode.DropDownMenu := Value;
end;

procedure TATdxNativeFileSelectorFrame.SetViewsImageIndex(const Value: System.UITypes.TImageIndex);
begin
  btnViewMode.OptionsImage.ImageIndex := Value;
end;

procedure TATdxNativeFileSelectorFrame.SetZipFilesAreFolders(const Value: Boolean);
begin
  FZipFilesAreFolders := Value;
end;

procedure TATdxNativeFileSelectorFrame.ShellListAddFolderHandler(Sender: TObject; AFolder:
    TcxShellFolder; var ACanAdd: Boolean);
var
  AFilter: String;
begin

  AFilter := shllvFileSelect.Options.FileMask;

  if (ContainsText(AFilter, '*.*')) then
    ACanAdd := True
  else if (AFolder.IsFolder) then
    ACanAdd := _CanAddFolder(AFolder)
  else
    ACanAdd := _CanAddFile(AFolder);

end;

procedure TATdxNativeFileSelectorFrame.ShellListBeforeNavHandler(Sender:
    TcxCustomShellListView; ANewAbsolutePIDL: PItemIDList);
var
  AExt: String;
  AHandled: Boolean;
  AName: String;
begin

  AName := GetPidlName(ANewAbsolutePIDL);
  AExt := ExtractFileExt(AName);

  if ( (SameText(AExt, '.zip')) AND (NOT ZipFilesAreFolders) ) then
    begin

      AHandled := False;
      ShellListExecuteItemHandler(shllvFileSelect, ANewAbsolutePIDL, AHandled);

      if (AHandled) then
        Abort;

    end;

end;

procedure TATdxNativeFileSelectorFrame.ShellListExecuteItemHandler(Sender: TObject; APIDL:
    PItemIDList; var AHandled: Boolean);
begin
  if (Assigned(FOnExecuteItem)) then
    FOnExecuteItem(Sender, APIDL, AHandled);
end;

procedure TATdxNativeFileSelectorFrame.ShellListSelectItemHandler(Sender: TObject; Item:
    TListItem; Selected: Boolean);
var
  AExt: String;
  AFolder: TcxShellFolder;
  Idx: Integer;
begin

  if ( (NOT Assigned(Item)) OR (NOT Selected) ) then
    exit;

  Idx := Item.Index;

  AFolder := shllvFileSelect.Folders[Idx];

  if (NOT AFolder.IsFolder) then
    begin
      FSkipFNChgHandler := True;

      try
        txtFileName.Text := ExtractFileName(AFolder.PathName);
      finally
        FSkipFNChgHandler := False;
      end;

      Exit;
    end;

  AExt := ExtractFileExt(AFolder.PathName);

  if ( (SameText(AExt, '.zip')) AND (NOT ZipFilesAreFolders) ) then
    begin
      FSkipFNChgHandler := True;

      try
        txtFileName.Text := ExtractFileName(AFolder.PathName);
      finally
        FSkipFNChgHandler := False;
      end;

      Exit;
    end;

end;

procedure TATdxNativeFileSelectorFrame.UpdateAcceptButtonAction(Sender:
    TObject);
var
  AValue: String;
begin
  AValue := txtFileName.Text;

  (Sender AS TAction).Enabled := (NOT AValue.IsEmpty);
end;

procedure TATdxNativeFileSelectorFrame.UpdateBCParentFolderAction(Sender: TObject);
begin
  (Sender AS TAction).Enabled := CanBrowseParentFolder;
end;

procedure TATdxNativeFileSelectorFrame.UpdateCreateFolderAction(Sender: TObject);
var
  bEnable: Boolean;
begin
  bEnable := CanCreateNewFolder;

  (Sender AS TAction).Enabled := bEnable;
end;

function TATdxNativeFileSelectorFrame._CanAddFile(AFolder: TcxShellFolder): Boolean;
var
  AExt: String;
  AFilter: String;
  AFName: String;
  AStrArray: TStringDynArray;
  ASubFilter: String;
  Idx: Integer;
begin

  Result := True;

  if (AFolder.IsFolder) then
    exit( _CanAddFolder(AFolder) );


  AFName := AFolder.PathName;

  AExt := ExtractFileExt(AFName);

  AFilter := shllvFileSelect.Options.FileMask;

  if (Pos(';', AFilter) > 0) then
    begin

      AStrArray := SplitString(AFilter, ';');

      for Idx := Low(AStrArray) to High(AStrArray) do
        begin

          ASubFilter := AStrArray[Idx];
          Result := EndsText(AExt, ASubFilter);

          if (Result) then
            break;

        end;

    end
  else
    begin

      Result := EndsText(AExt, AFilter);

    end;

end;

function TATdxNativeFileSelectorFrame._CanAddFolder(AFolder: TcxShellFolder): Boolean;
var
  AExt: String;
  AFilter: String;
  AFName: String;
  AStrArray: TStringDynArray;
  ASubFilter: String;
  Idx: Integer;
begin

  Result := True;

  if ( NOT AFolder.IsFolder) then
    exit( _CanAddFile(AFolder) );


  if (ZipFilesAreFolders) then
    exit(True);

  AFName := AFolder.PathName;

  AExt := ExtractFileExt(AFName);

  if (SameText(AExt, '.zip')) then
    begin

      AFilter := shllvFileSelect.Options.FileMask;

      if (Pos(';', AFilter) > 0) then
        begin

          AStrArray := SplitString(AFilter, ';');

          for Idx := Low(AStrArray) to High(AStrArray) do
            begin

              ASubFilter := AStrArray[Idx];
              Result := EndsText(AExt, ASubFilter);

              if (Result) then
                break;

            end;

        end
      else
        begin

          Result := EndsText(AExt, AFilter);

        end;

    end
  else
    begin

      Result := True;

    end;

end;

procedure TATdxNativeFileSelectorFrame._ProcessFilters;
var
  AAddValue: Boolean;
  ALimit: Integer;
  AName: String;
  AStrArray: TStringDynArray;
  AValue: String;
  Idx: Integer;
begin
  if (FFilter.IsEmpty) then
    FFilter := cAllFilesFilter
  else if (Pos('|', FFilter) <= 0) then
    FFilter := cAllFilesFilter;

  AStrArray := SplitString(FFilter, '|');

  if (Length(AStrArray) < 2) then
    exit;

  FFilterList.Clear;
  cmbFileType.Properties.Items.Clear;

  ALimit := High(AStrArray);
  Idx := Low(AStrArray);

  repeat

    AName := AStrArray[Idx];

    Inc(Idx);

    if (Idx <= ALimit) then
      begin

        AValue := AStrArray[Idx];
        AAddValue := True;

      end
    else
      begin

        AValue := EmptyStr;
        AAddValue := False;

      end;

    if (AAddValue) then
      begin

        FFilterList.AddPair(AName, AValue);
        cmbFileType.Properties.Items.Add(AName);

      end;

    Inc(Idx);

  until (Idx > ALimit);

  FilterIndex := 1;

end;

procedure TATdxNativeFileSelectorFrame._ResetIconSpacing(AThmbSz: Integer);
var
  AHandle: HWND;
begin
  AHandle := shllvFileSelect.InnerListView.Handle;

  if (shllvFileSelect.ThumbnailOptions.ShowThumbnails) then
    begin
      ListView_SetIconSpacing(AHandle, AThmbSz + 13, AThmbSz + 40);
    end
  else
    begin
      SendMessage(AHandle, LVM_SETICONSPACING, 0, LPARAM(-1));
    end;
end;

end.
