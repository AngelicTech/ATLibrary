unit AT.Vcl.DX.SpreadSheet.ActionsReg;

interface


procedure Register;


implementation

uses
  System.Actions, AT.Vcl.DX.SpreadSheet.Actions;


procedure Register;
begin
  RegisterActions ('Angelic Technology.DX.SpreadSheet',
      [TATdxSpreadSheetCalcStatus],
      NIL);

  RegisterActions ('Angelic Technology.DX.SpreadSheet.Home.Cells',
      [TATdxSpreadSheetDeleteCells,
      TATdxSpreadSheetInsertCells,
      TATdxSpreadSheetLockCells],
      NIL);

  RegisterActions ('Angelic Technology.DX.SpreadSheet.Home.Clipboard',
      [TATdxSpreadSheetPasteSpecial],
      NIL);

  RegisterActions ('Angelic Technology.DX.SpreadSheet.Home.Editing',
      [TATdxSpreadSheetFillData,
      TATdxSpreadSheetFindAndReplace,
      TATdxSpreadSheetSelectAll,
      TATdxSpreadSheetSelectNone,
      TATdxSpreadSheetRenameSheet],
      NIL);

  RegisterActions ('Angelic Technology.DX.SpreadSheet.Home.Number',
      [TATdxSpreadSheetNumberFormatGeneralAction,
      TATdxSpreadSheetNumberFormatNumberAction,
      TATdxSpreadSheetNumberFormatCurrencyAction,
      TATdxSpreadSheetNumberFormatAccountingAction,
      TATdxSpreadSheetNumberFormatDateAction,
      TATdxSpreadSheetNumberFormatTimeAction,
      TATdxSpreadSheetNumberFormatPercentAction,
      TATdxSpreadSheetNumberFormatFractionAction,
      TATdxSpreadSheetNumberFormatScientificAction,
      TATdxSpreadSheetNumberFormatTextAction],
      NIL);

  RegisterActions ('Angelic Technology.DX.SpreadSheet.Insert.Text',
      [TATdxSpreadSheetInsertTextBox,
      TATdxSpreadSheetEditTextBox,
      TATdxSpreadSheetInsertShape,
      TATdxSpreadSheetEditShape,
      TATdxSpreadSheetInsertPicture,
      TATdxSpreadSheetEditPicture],
      NIL);

  RegisterActions ('Angelic Technology.DX.SpreadSheet.Page Layout.Sheet Options',
      [TATdxSpreadSheetGridlinesPrint,
      TATdxSpreadSheetGridlinesView,
      TATdxSpreadSheetHeadingsPrint,
      TATdxSpreadSheetHeadingsView],
      NIL);

  RegisterActions ('Angelic Technology.DX.SpreadSheet.Formulas.Function Library',
      [TATdxSpreadSheetInsertFunction],
      NIL);

  RegisterActions ('Angelic Technology.DX.SpreadSheet.Formulas.Formula Options',
      [TATdxSpreadSheetShowFormulas,
      TATdxSpreadSheetAutoCalc],
      NIL);

  RegisterActions ('Angelic Technology.DX.SpreadSheet.Formulas.Calculation',
      [TATdxSpreadSheetCalcNow],
      NIL);

  RegisterActions ('Angelic Technology.DX.SpreadSheet.Review.Changes',
      [TATdxSpreadSheetProtectSheet,
      TATdxSpreadSheetProtectWorkbook],
      NIL);

  RegisterActions ('Angelic Technology.DX.SpreadSheet.Dialogs',
      [TATdxSpreadSheetFormatCellsNumberDialogAction,
      TATdxSpreadSheetFormatCellsAlignDialogAction,
      TATdxSpreadSheetFormatCellsFontDialogAction,
      TATdxSpreadSheetFormatCellsFillDialogAction,
      TATdxSpreadSheetFormatCellsProtectDialogAction],
      NIL);
end;

end.
