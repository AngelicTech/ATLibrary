unit AT.Fmx.Actions.Reg;

interface

procedure Register;

implementation

uses
  System.SysUtils, System.Actions, AT.Fmx.Actions.Base,
  AT.Fmx.Actions.Bind, AT.Fmx.Actions.Control, AT.Fmx.Actions.Data,
  AT.Fmx.Actions.ValueRange, AT.Fmx.Actions.EditActns,
  AT.Fmx.Actions.FileActns, AT.Fmx.Actions.MediaLibrary,
  AT.Fmx.Actions.PhoneDialer, AT.Fmx.Actions.TabActns,
  AT.Fmx.Actions.ViewActns, AT.Fmx.Actions.WindowActns;

procedure Register;
begin
  RegisterActions('Angelic Technology',
      [TATAction, TATControlAction, TATValueRangeAction],
      NIL);

  RegisterActions('Angelic Technology.Data',
      [TATBooleanDataAction,
       TATDataAction,
       TATDateTimeDataAction,
       TATInt32DataAction,
       TATInt64DataAction,
       TATMultiDataAction,
       TATStrDataAction
      ],
      NIL);

  RegisterActions('Angelic Technology.Edit', [TATVirtualKeyboard],
      NIL);

  RegisterActions('Angelic Technology.File', [TATFileExit], NIL);

  RegisterActions('Angelic Technology.LiveBindings',
      [TATFMXBindNavigateFirst,
       TATFMXBindNavigatePrior,
       TATFMXBindNavigateNext,
       TATFMXBindNavigateLast,
       TATFMXBindNavigateInsert,
       TATFMXBindNavigateDelete,
       TATFMXBindNavigateEdit,
       TATFMXBindNavigatePost,
       TATFMXBindNavigateCancel,
       TATFMXBindNavigateRefresh,
       TATFMXBindNavigateApplyUpdates,
       TATFMXBindNavigateCancelUpdates
      ],
      NIL);

  RegisterActions('Angelic Technology.Media Library',
      [TATTakePhotoFromLibraryAction,
       TATTakePhotoFromCameraAction,
       TATShowShareSheetAction,
       TATMediaPlayerStart,
       TATMediaPlayerStop,
       TATMediaPlayerPlayPause,
       TATMediaPlayerCurrentTime,
       TATMediaPlayerVolume
      ],
      NIL);

  RegisterActions('Angelic Technology.Phone Dialer',
      [TATPhoneCallAction], NIL);

  RegisterActions('Angelic Technology.Tab',
      [TATChangeTabAction, TATNextTabAction, TATPreviousTabAction],
      NIL);

  RegisterActions('Angelic Technology.View', [TATVewAction], NIL);

  RegisterActions('Angelic Technology.Window', [TATWindowClose], NIL);
end;

end.
