(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
if (comp.InheritsFrom(TTextStrings)) then
	TextStringsToTable(L,index,Comp)
else
if (comp.InheritsFrom(TStringList)) then
	StringListToTable(L,index,Comp)
else
if (comp.InheritsFrom(TControl)) then
	ControlToTable(L,index,Comp)
else
if (comp.InheritsFrom(TBitmap)) then
	BitmapToTable(L,index,Comp)
else
if (comp.InheritsFrom(TCustomBitmap)) then
	CustomBitmapToTable(L,index,Comp)
else
if (comp.InheritsFrom(TGraphic)) then
	GraphicToTable(L,index,Comp)
else
if (comp.InheritsFrom(TFont)) then
	FontToTable(L,index,Comp)
else
if (comp.InheritsFrom(TPen)) then
	PenToTable(L,index,Comp)
else
if (comp.InheritsFrom(TBrush)) then
	BrushToTable(L,index,Comp)
else
if (comp.InheritsFrom(TCanvas)) then
	CanvasToTable(L,index,Comp)
else
if (comp.InheritsFrom(TPicture)) then
	PictureToTable(L,index,Comp)
else
if (comp.InheritsFrom(TRasterImage)) then
	RasterImageToTable(L,index,Comp)
else
if (comp.InheritsFrom(TApplication)) then
	ApplicationToTable(L,index,Comp)
else
if (comp.InheritsFrom(TForm)) then
	FormToTable(L,index,Comp)
else
if (comp.InheritsFrom(TScrollBox)) then
	ScrollBoxToTable(L,index,Comp)
else
if (comp.InheritsFrom(TBasicAction)) then
	BasicActionToTable(L,index,Comp)
else
if (comp.InheritsFrom(TAction)) then
	ActionToTable(L,index,Comp)
else
if (comp.InheritsFrom(TActionList)) then
	ActionListToTable(L,index,Comp)
else
if (comp.InheritsFrom(TImageList)) then
	ImageListToTable(L,index,Comp)
else
if (comp.InheritsFrom(TMenu)) then
	MenuToTable(L,index,Comp)
else
if (comp.InheritsFrom(TPopupMenu)) then
	PopupMenuToTable(L,index,Comp)
else
if (comp.InheritsFrom(TMenuItem)) then
	MenuItemToTable(L,index,Comp)
else
if (comp.InheritsFrom(TMainMenu)) then
	MainMenuToTable(L,index,Comp)
else
if (comp.InheritsFrom(TListBox)) then
	ListBoxToTable(L,index,Comp)
else
if (comp.InheritsFrom(TComboBox)) then
	ComboBoxToTable(L,index,Comp)
else
if (comp.InheritsFrom(TEdit)) then
	EditToTable(L,index,Comp)
else
if (comp.InheritsFrom(TMemo)) then
	MemoToTable(L,index,Comp)
else
if (comp.InheritsFrom(TStaticText)) then
	StaticTextToTable(L,index,Comp)
else
if (comp.InheritsFrom(TButton)) then
	ButtonToTable(L,index,Comp)
else
if (comp.InheritsFrom(TCheckBox)) then
	CheckBoxToTable(L,index,Comp)
else
if (comp.InheritsFrom(TToggleBox)) then
	ToggleBoxToTable(L,index,Comp)
else
if (comp.InheritsFrom(TRadioButton)) then
	RadioButtonToTable(L,index,Comp)
else
if (comp.InheritsFrom(TLabel)) then
	LabelToTable(L,index,Comp)
else
if (comp.InheritsFrom(TNotebook)) then
	NotebookToTable(L,index,Comp)
else
if (comp.InheritsFrom(TTimer)) then
	TimerToTable(L,index,Comp)
else
if (comp.InheritsFrom(TIdleTimer)) then
	IdleTimerToTable(L,index,Comp)
else
if (comp.InheritsFrom(TShape)) then
	ShapeToTable(L,index,Comp)
else
if (comp.InheritsFrom(TSplitter)) then
	SplitterToTable(L,index,Comp)
else
if (comp.InheritsFrom(TPaintBox)) then
	PaintBoxToTable(L,index,Comp)
else
if (comp.InheritsFrom(TImage)) then
	ImageToTable(L,index,Comp)
else
if (comp.InheritsFrom(TBevel)) then
	BevelToTable(L,index,Comp)
else
if (comp.InheritsFrom(TRadioGroup)) then
	RadioGroupToTable(L,index,Comp)
else
if (comp.InheritsFrom(TCheckGroup)) then
	CheckGroupToTable(L,index,Comp)
else
if (comp.InheritsFrom(TBoundLabel)) then
	BoundLabelToTable(L,index,Comp)
else
if (comp.InheritsFrom(TLabeledEdit)) then
	LabeledEditToTable(L,index,Comp)
else
if (comp.InheritsFrom(TPanel)) then
	PanelToTable(L,index,Comp)
else
if (comp.InheritsFrom(TTrayIcon)) then
	TrayIconToTable(L,index,Comp)
else
if (comp.InheritsFrom(TTrackBar)) then
	TrackBarToTable(L,index,Comp)
else
if (comp.InheritsFrom(TProgressBar)) then
	ProgressBarToTable(L,index,Comp)
else
if (comp.InheritsFrom(TStatusPanel)) then
	StatusPanelToTable(L,index,Comp)
else
if (comp.InheritsFrom(TStatusPanels)) then
	StatusPanelsToTable(L,index,Comp)
else
if (comp.InheritsFrom(TStatusBar)) then
	StatusBarToTable(L,index,Comp)
else
if (comp.InheritsFrom(TToolButton)) then
	ToolButtonToTable(L,index,Comp)
else
if (comp.InheritsFrom(TToolBar)) then
	ToolBarToTable(L,index,Comp)
else
if (comp.InheritsFrom(TCoolBar)) then
	CoolBarToTable(L,index,Comp)
else
if (comp.InheritsFrom(TUpDown)) then
	UpDownToTable(L,index,Comp)
else
if (comp.InheritsFrom(TTabSheet)) then
	TabSheetToTable(L,index,Comp)
else
if (comp.InheritsFrom(TTabControl)) then
	TabControlToTable(L,index,Comp)
else
if (comp.InheritsFrom(TPageControl)) then
	PageControlToTable(L,index,Comp)
else
if (comp.InheritsFrom(THeaderControl)) then
	HeaderControlToTable(L,index,Comp)
else
if (comp.InheritsFrom(TTreeNode)) then
	TreeNodeToTable(L,index,Comp)
else
if (comp.InheritsFrom(TTreeNodes)) then
	TreeNodesToTable(L,index,Comp)
else
if (comp.InheritsFrom(TTreeView)) then
	TreeViewToTable(L,index,Comp)
else
if (comp.InheritsFrom(TListItem)) then
	ListItemToTable(L,index,Comp)
else
if (comp.InheritsFrom(TListItems)) then
	ListItemsToTable(L,index,Comp)
else
if (comp.InheritsFrom(TListView)) then
	ListViewToTable(L,index,Comp)
else
if (comp.InheritsFrom(TBitBtn)) then
	BitBtnToTable(L,index,Comp)
else
if (comp.InheritsFrom(TSpeedButton)) then
	SpeedButtonToTable(L,index,Comp)
else
if (comp.InheritsFrom(TMaskEdit)) then
	MaskEditToTable(L,index,Comp)
else
if (comp.InheritsFrom(TCheckListBox)) then
	CheckListBoxToTable(L,index,Comp)
else
if (comp.InheritsFrom(TPopupNotifier)) then
	PopupNotifierToTable(L,index,Comp)
else
if (comp.InheritsFrom(TDateTimePicker)) then
	DateTimePickerToTable(L,index,Comp)
else
if (comp.InheritsFrom(TSpinEdit)) then
	SpinEditToTable(L,index,Comp)
else
if (comp.InheritsFrom(TFloatSpinEdit)) then
	FloatSpinEditToTable(L,index,Comp)
else
if (comp.InheritsFrom(TArrow)) then
	ArrowToTable(L,index,Comp)
else
if (comp.InheritsFrom(TCalendar)) then
	CalendarToTable(L,index,Comp)
else
if (comp.InheritsFrom(TEditButton)) then
	EditButtonToTable(L,index,Comp)
else
if (comp.InheritsFrom(TFileNameEdit)) then
	FileNameEditToTable(L,index,Comp)
else
if (comp.InheritsFrom(TDirectoryEdit)) then
	DirectoryEditToTable(L,index,Comp)
else
if (comp.InheritsFrom(TDateEdit)) then
	DateEditToTable(L,index,Comp)
else
if (comp.InheritsFrom(TTimeEdit)) then
	TimeEditToTable(L,index,Comp)
else
if (comp.InheritsFrom(TCalcEdit)) then
	CalcEditToTable(L,index,Comp)
else
if (comp.InheritsFrom(TColorBox)) then
	ColorBoxToTable(L,index,Comp)
else
if (comp.InheritsFrom(TColorListBox)) then
	ColorListBoxToTable(L,index,Comp)
else
if (comp.InheritsFrom(TGridColumn)) then
	GridColumnToTable(L,index,Comp)
else
if (comp.InheritsFrom(TGridColumns)) then
	GridColumnsToTable(L,index,Comp)
else
if (comp.InheritsFrom(TStringGrid)) then
	StringGridToTable(L,index,Comp)
else
if (comp.InheritsFrom(TDrawGrid)) then
	DrawGridToTable(L,index,Comp)
else
if (comp.InheritsFrom(TColorButton)) then
	ColorButtonToTable(L,index,Comp)
else
if (comp.InheritsFrom(TOpenDialog)) then
	OpenDialogToTable(L,index,Comp)
else
if (comp.InheritsFrom(TSaveDialog)) then
	SaveDialogToTable(L,index,Comp)
else
if (comp.InheritsFrom(TSelectDirectoryDialog)) then
	SelectDirectoryDialogToTable(L,index,Comp)
else
if (comp.InheritsFrom(TColorDialog)) then
	ColorDialogToTable(L,index,Comp)
else
if (comp.InheritsFrom(TFontDialog)) then
	FontDialogToTable(L,index,Comp)
else
if (comp.InheritsFrom(TFindDialog)) then
	FindDialogToTable(L,index,Comp)
else
if (comp.InheritsFrom(TReplaceDialog)) then
	ReplaceDialogToTable(L,index,Comp)
else