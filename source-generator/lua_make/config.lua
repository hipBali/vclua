-- **************************************************** --
--                                                      --
-- VCLua 1.1 Class source generator CONFIG              --
--                                                      --
-- (C) 2018-2024 Hi-Project Ltd.                        --
--                                                      --
-- **************************************************** --

-- linux
-- local LAZPATH = "/usr/share/lazarus/2.2.6/"
-- local FPCSOURCE = "/usr/share/fpcsrc/3.2.2/"

-- windows
local LAZPATH = "f:/Work/Dev/lazarus2/"
local FPCSOURCE = LAZPATH.."fpc/3.2.2/source/"

fpcSrc = {
	["Classes"] 	= FPCSOURCE.."rtl/objpas/classes/classesh.inc",
	["SysUtils"] 	= FPCSOURCE.."rtl/objpas/sysutils/sysutilh.inc",
	["StdCtrls"] 	= LAZPATH.."lcl/stdctrls.pp",
	["ExtCtrls"] 	= LAZPATH.."lcl/extctrls.pp",
	["Toolwin"] 	= LAZPATH.."lcl/toolwin.pp",
	["ComCtrls"] 	= LAZPATH.."lcl/comctrls.pp",
	["Controls"] 	= LAZPATH.."lcl/controls.pp",
	["CustApp"] 	= FPCSOURCE.."packages/fcl-base/src/custapp.pp",
	["Forms"] 		= LAZPATH.."lcl/forms.pp",
	["FPCanvas"] 	= FPCSOURCE.."packages/fcl-image/src/fpcanvas.pp",
	["Graphics"] 	= LAZPATH.."lcl/graphics.pp",
	["ActnList"]	= LAZPATH.."lcl/actnlist.pas",
	["ImgList"] 	= LAZPATH.."lcl/imglist.pp",
	["Menus"] 		= LAZPATH.."lcl/menus.pp",
	["Buttons"] 	= LAZPATH.."lcl/buttons.pp",
	["MaskEdit"] 	= LAZPATH.."lcl/maskedit.pp",
	["CheckLst"] 	= LAZPATH.."lcl/checklst.pas",
	["PopupNotifier"] 	= LAZPATH.."lcl/popupnotifier.pas",
	["DateTimePicker"] 	= LAZPATH.."/components/datetimectrls/datetimepicker.pas",
	["Spin"] 	= LAZPATH.."lcl/spin.pp",
	["Arrow"] 	= LAZPATH.."lcl/arrow.pp",
	["Calendar"] 	= LAZPATH.."lcl/calendar.pp",
	["GroupedEdit"]	= LAZPATH.."lcl/groupededit.pp",
	["EditBtn"] 	= LAZPATH.."lcl/editbtn.pas",
	["FileCtrl"] 	= LAZPATH.."lcl/filectrl.pas",
	["Dialogs"] 	= LAZPATH.."lcl/dialogs.pp",
	["Grids"] 	= LAZPATH.."lcl/grids.pas",
	["ColorBox"] 	= LAZPATH.."lcl/colorbox.pas",
	["IniFiles"] 	= FPCSOURCE.."packages/fcl-base/src/inifiles.pp",
	["ValEdit"] 	= LAZPATH.."lcl/valedit.pas",
	["TextStrings"] 	= LAZPATH.."/components/lazutils/textstrings.pas",

	["CollectionPropEditForm"]	= LAZPATH.."components/ideintf/collectionpropeditform.pas",
	["PropEdits"]			= LAZPATH.."components/ideintf/propedits.pp",
	["OIFavoriteProperties"]	= LAZPATH.."components/ideintf/oifavoriteproperties.pas",
	["ObjectInspector"]		= LAZPATH.."components/ideintf/objectinspector.pp",
	["RTTICtrls"]			= LAZPATH.."components/rtticontrols/rttictrls.pas",
	["RTTIGrids"]			= LAZPATH.."components/rtticontrols/rttigrids.pas",
}

toInfer = {
  {ref = "System", src = FPCSOURCE.."rtl/inc/systemh.inc"},
  {ref = "Types", src = FPCSOURCE.."rtl/objpas/types.pp"},
  {ref = "FPImage", src = FPCSOURCE.."packages/fcl-image/src/fpimage.pp"},
  {ref = "LCLType", src = LAZPATH.."lcl/lcltype.pp"},
  {ref = "GraphType", src = LAZPATH.."components/lazutils/graphtype.pp"},
}

-- name: vclua class name
-- src:  source class name		parentclass: the owner/parent class
-- ref:  module reference(s), first must export 'src', required!
-- base: basic class (even if creatable, no name or init supported, but single param of type parentclass is required for constructor (else use nv))
-- 
-- noparent: not parented. Only descendants of Control can be parented
-- nv:		 non visible, no parent
-- nocreate: no create method for this class. Currently only those classes can be Create'd which inherit TComponent or are non visible
-- impl: implements method from funcdef.lua/function_defnitions
-- canvas: publish canvas property (usually not needed since public properties are available, just add parent with Canvas to config)
-- form: use CreateNew instead Create
-- wclass: item class for collections
-- globals: table of global vars to export, values are types; if nonstrings, T#NAME is assumed

classes = {
	------------------------------------------------------------------
	{ name = "Persistent", src = "TPersistent", ref="Classes", nocreate=true },
	{ name = "FPCustomFont", src = "TFPCustomFont", ref = "FPCanvas", base=true, nocreate=true },
	{ name = "Exception", src = "Exception", fptype = "Exception", ref="SysUtils", nocreate=true },
	{ unit = "Collection", ref = "Classes",
		classes = {
			{ name = "CollectionItem", src = "TCollectionItem", nocreate=true },
			{ name = "Collection", src = "TCollection", base=true, nocreate=true },
		}
	},
	{ unit = "Stream", ref = "Classes", implref = "LuaComponent",
		classes = {
			{ name = "Stream", src = "TStream", base=true, nocreate=true },
			{ name = "CustomMemoryStream", src = "TCustomMemoryStream", base=true, nocreate=true },
			{ name = "MemoryStream", src = "TMemoryStream", nv=true, noparent=true, impl="LoadFromHex" },
		}
	},
	-- TStrings and descenants
	{ name = "Strings", src = "TStrings", ref="Classes", nv=true, nocreate=true },
	{ name = "StringList", src = "TStringList", ref="Classes", nv=true, noparent=true },
	{ name = "TextStrings", src = "TTextStrings", ref="TextStrings", nv=true, noparent=true },

	-- graphics    
	{ name = "Graphic", src = "TGraphic", ref = "Graphics", base=true, nocreate=true },
	{ name = "Font", src = "TFont", ref = "Graphics", implref = "LCLType", base=true, nocreate=true },
	{ name = "Pen", src = "TPen", ref = "Graphics", base=true, nocreate=true },
	{ name = "Canvas", src = "TCanvas", ref = "Graphics", base=true, nocreate=true, impl = "SetPixel", },
	{ name = "Picture", src = "TPicture", ref = "Graphics", nv=true, noparent=true },
	{ name = "RasterImage", src = "TRasterImage", ref = "Graphics", implref = "LCLType", base=true, nocreate=true },
	{ unit = "Bitmap", ref = "Graphics", implref = "LCLType",
		classes = {
			{ name = "CustomBitmap", src = "TCustomBitmap", nv=true, noparent=true, nocreate=true },
			{ name = "Bitmap", src = "TBitmap", nv=true, noparent=true },
		}
	},
	{ name = "Brush", src = "TBrush", ref = "Graphics", base=true, nocreate=true },

	{ name = "Component", src = "TComponent", ref="Classes", nocreate=true },
	-- imagelist
	{ name = "ImageList", src = "TCustomImageList", ref = "ImgList, Controls", noparent=true},
	-- actions
	{ name = "BasicAction", src = "TBasicAction", ref="Classes", noparent=true},
	{ unit = "ActionList", ref = "ActnList", -- include = "{$i src/inc/actionlist.inc}",
		classes = {
			{ name = "ContainedAction", src = "TContainedAction",  noparent=true },
			{ name = "Action", src = "TCustomAction",  noparent=true },
			{ name = "ActionList", src = "TCustomActionList", noparent=true	},
		}
	},
	-- menus
	{ unit = "Menu", ref = "Menus", implref = "LCLType",
		classes = {
			{ name = "Menu", src = "TMenu"},
			{ name = "PopupMenu", src = "TPopupMenu"},
			{ name = "MenuItem", src = "TMenuItem", noparent=true,},
			{ name = "MainMenu", src = "TMainMenu"},
		}
	},

	-- controls
	{ name = "ControlChildSizing", src = "TControlChildSizing", ref = "Controls", implref = "LuaWinControl", noparent=true},
	{ name = "Control", src = "TControl", ref = "Controls", nocreate=true},
	{ name = "WinControl", src = "TWinControl", ref = "Controls", implref = "LuaDrag", nocreate=true},
	{ name = "GraphicControl", src = "TGraphicControl", ref = "Controls", nocreate=true},
	{ name = "CustomControl", src = "TCustomControl", ref = "Controls", nocreate=true},
	{ unit = "Drag", ref = "Controls",
		classes = {
			{ name = "DragObject", src = "TDragObject", parentclass='TControl', base=true},
			{ name = "DragControlObject", src = "TDragControlObject", parentclass='TControl', base=true},
			{ name = "DragControlObjectEx", src = "TDragControlObjectEx", parentclass='TControl', base=true},
			{ name = "DragDockObject", src = "TDragDockObject", parentclass='TControl', base=true},
			{ name = "DragDockObjectEx", src = "TDragDockObjectEx", parentclass='TControl', base=true},
			{ name = "DockZone", src = "TDockZone", nocreate=true},
			{ name = "DockManager", src = "TDockManager", nocreate=true},
			{ name = "DockTree", src = "TDockTree", nocreate=true},
		}
	},

	-- forms
	{ name = "CustomApplication", src = "TCustomApplication", ref = "CustApp", implref = "singleinstance", nocreate=true },
	{ name = "Application", src = "TApplication", ref = "Forms", implref = "LCLType", noparent=true, globals={Application=1} },
	{ name = "Monitor", src = "TMonitor", ref = "Forms", implref = "LCLType", nocreate=true},
	{ name = "ScrollBox", src = "TScrollingWinControl", ref = "Forms", },
	{ unit = "Form", ref = "Forms", implref = "LCLType",
		classes = {
			{ name = "CustomForm", src = "TCustomForm", nocreate=true },
			{ name = "Form", src = "TForm", form=true },
		},
	},
	{ name = "Screen", src = "TScreen", ref = "Forms", implref = "LCLType", nocreate=true, globals={Screen=1}},

	-- standard controls
	{ name = "ListBox", src = "TCustomListBox", ref = "StdCtrls" },
	{ name = "ComboBox", src = "TCustomComboBox", ref = "StdCtrls" },
	{ name = "Edit", src = "TCustomEdit", ref = "StdCtrls" },
	{ name = "Memo", src = "TCustomMemo", ref = "StdCtrls" },
	{ name = "StaticText", src = "TCustomStaticText", ref = "StdCtrls" },
	{ name = "Button", src = "TCustomButton", ref = "StdCtrls" },
	{ name = "CheckBox", src = "TCustomCheckBox", ref = "StdCtrls" },
	{ name = "ToggleBox", src = "TToggleBox", ref = "StdCtrls" },
	{ name = "GroupBox", src = "TGroupBox", ref = "StdCtrls" },
	{ name = "RadioButton", src = "TRadioButton", ref = "StdCtrls" },
	{ name = "Label", src = "TCustomLabel", ref = "StdCtrls" },
	-- ext controls
	{ name = "Notebook", src = "TNotebook", ref = "ExtCtrls" },
	{ name = "Timer", src = "TTimer", ref = "ExtCtrls", noparent=true  },
	{ name = "IdleTimer", src = "TCustomIdleTimer", ref = "ExtCtrls", noparent=true },
	{ name = "Shape", src = "TShape", ref = "ExtCtrls" },
	{ name = "Splitter", src = "TCustomSplitter", ref = "ExtCtrls" },
	{ name = "PaintBox", src = "TPaintBox", ref = "ExtCtrls" },
	{ name = "Image", src = "TCustomImage", ref = "ExtCtrls" },
	{ name = "Bevel", src = "TBevel", ref = "ExtCtrls" },
	{ name = "RadioGroup", src = "TCustomRadioGroup", ref = "ExtCtrls" },
	{ name = "CheckGroup", src = "TCustomCheckGroup", ref = "ExtCtrls" },
	{ name = "BoundLabel", src = "TBoundLabel", ref = "ExtCtrls" },
	{ name = "LabeledEdit", src = "TCustomLabeledEdit", ref = "ExtCtrls" },
	{ name = "Panel", src = "TCustomPanel", ref = "ExtCtrls" },
	{ name = "TrayIcon", src = "TCustomTrayIcon", ref = "ExtCtrls", implref = "LCLType", noparent=true },
	-- com controls
	{ name = "TrackBar", src = "TCustomTrackBar", ref = "ComCtrls" },
	{ name = "ProgressBar", src = "TCustomProgressBar", ref = "ComCtrls" },
	
	{ unit = "StatusBar", ref = "ComCtrls",
		classes = {
			{ name = "StatusPanel", src = "TStatusPanel", noparent=true, nocreate=true},
			{ name = "StatusPanels", src = "TStatusPanels", noparent=true, nocreate=true, parentclass="TStatusBar", wclass="TStatusPanel"},
			{ name = "StatusBar", src = "TStatusBar"},
		}
	},
	
	{ name = "ToolWindow", src = "TToolWindow", ref = "Toolwin", nocreate=true },
	{ unit = "ToolBar", ref = "ComCtrls",
		classes = {
			{ name = "ToolButton", src = "TToolButton" },
			{ name = "ToolBar", src = "TToolBar" },
		}
	},
	{ name = "CoolBar", src = "TCustomCoolBar", ref = "ComCtrls" },
	{ name = "UpDown", src = "TUpDown", ref = "ComCtrls" },
	
	{ unit = "TabControl", ref = "ComCtrls",
		classes = {
			{ name = "CustomPage", src = "TCustomPage", nocreate=true },
			{ name = "TabSheet", src = "TTabSheet" },
			{ name = "CustomTabControl", src = "TCustomTabControl", nocreate=true },
			{ name = "TabControl", src = "TTabControl" },
			{ name = "PageControl", src = "TPageControl" },
		},
	},
	{ name = "HeaderControl", src = "TCustomHeaderControl", ref = "ComCtrls" },
	{ unit = "TreeView", ref = "ComCtrls",
		classes = {
			{ name = "TreeNode", src = "TTreeNode", noparent=true, parentclass="TTreeNodes", nocreate=true},
			{ name = "TreeNodes", src = "TTreeNodes", noparent=true, parentclass="TCustomTreeView", nocreate=true},
			{ name = "TreeView", src = "TCustomTreeView"},
		},
	},
	{ unit = "ListView", ref = "ComCtrls",
		classes = {
			{ name = "ListItem", src = "TListItem", noparent=true, parentclass="TListItems", nocreate=true},
			{ name = "ListItems", src = "TListItems", noparent=true, parentclass="TCustomListView", nocreate=true},
			{ name = "ListView", src = "TCustomListView"},
		},
	},
	-- buttons
	{ name = "BitBtn", src = "TCustomBitBtn", ref = "Buttons" },
	{ name = "SpeedButton", src = "TCustomSpeedButton", ref = "Buttons" },
	-- maskedit
	{ name = "MaskEdit", src = "TCustomMaskEdit", ref = "MaskEdit" },
	-- checklistbox
	{ name = "CheckListBox", src = "TCustomCheckListBox", ref = "CheckLst"},


	-- popupnotifier
	{ name = "PopupNotifier", src = "TPopupNotifier", ref = "PopupNotifier", noparent=true, },
	-- datetimepicker
	{ name = "DateTimePicker", src = "TCustomDateTimePicker", ref = "DateTimePicker" },
	-- spin
	{ name = "FloatSpinEdit", src = "TCustomFloatSpinEdit", ref = "Spin" },
	{ name = "SpinEdit", src = "TSpinEdit", ref = "Spin" },
	-- arrow
	{ name = "Arrow", src = "TArrow", ref = "Arrow" },
	-- calendar
	{ name = "Calendar", src = "TCustomCalendar", ref = "Calendar" },
	-- editbtn
	{ name = "CustomAbstractGroupedEdit", src = "TCustomAbstractGroupedEdit", ref = "GroupedEdit", nocreate=true },
	{ name = "EditButton", src = "TCustomEditButton", ref = "EditBtn" },
	{ name = "FileNameEdit", src = "TFileNameEdit", ref = "EditBtn" },
	{ name = "DirectoryEdit", src = "TDirectoryEdit", ref = "EditBtn" },
	{ name = "DateEdit", src = "TDateEdit", ref = "EditBtn" },
	{ name = "TimeEdit", src = "TTimeEdit", ref = "EditBtn" },
	{ name = "CalcEdit", src = "TCalcEdit", ref = "EditBtn" },
	-- filectrl
	
	-- grids
	{ unit = "DrawGrid", ref = "Grids",
		classes = {
			{ name = "CustomGrid", src = "TCustomGrid", nocreate=true },
			{ name = "DrawGrid", src = "TCustomDrawGrid" },
		},
	},
	{ unit = "StringGrid", ref = "Grids",
		classes = {
			{ name = "GridColumn", src = "TGridColumn", noparent=true, parentclass="TCollection", nocreate=true},
			{ name = "GridColumns", src = "TGridColumns", noparent=true, parentclass="TCustomStringGrid", nocreate=true},--, wclass="TGridColumn"
			{ name = "StringGrid", src = "TCustomStringGrid",
			  impl="GetCells, SetCells, GetSelectedCell"},
		},
	},
	
	-- valuelisteditor
	{ name = "ValueListEditor", src = "TValueListEditor", ref = "ValEdit"},
	-- dialogs
	{ unit = "CommonDialogs", ref = "Dialogs",
		classes = {
			{ name = "ColorButton", src = "TColorButton", },
			{ name = "CommonDialog", src = "TCommonDialog", nocreate=true },
			{ name = "FileDialog", src = "TFileDialog", nocreate=true },
			{ name = "OpenDialog", src = "TOpenDialog", noparent=true },
			{ name = "SaveDialog", src = "TSaveDialog", noparent=true },
			{ name = "SelectDirectoryDialog", src = "TSelectDirectoryDialog", noparent=true },
			{ name = "ColorDialog", src = "TColorDialog", noparent=true },
			{ name = "FontDialog", src = "TFontDialog", noparent=true },
			{ name = "FindDialog", src = "TFindDialog", noparent=true },
			{ name = "ReplaceDialog", src = "TReplaceDialog", noparent=true },
		},
	},
	-- colorbox
	{ name = "ColorBox", src = "TCustomColorBox", ref = "ColorBox" },
	{ name = "ColorListBox", src = "TColorListBox", ref = "ColorBox" },

	--RTTI
	{ name = "CollectionPropertyEditorForm", src = "TCollectionPropertyEditorForm", ref = "CollectionPropEditForm", nocreate=true },
	{ unit = "PropEdits", ref = "PropEdits",
		classes = {
			{ name = "PropertyEditorHook", src = "TPropertyEditorHook", nocreate=true },
			{ name = "PropertyEditor", src = "TPropertyEditor", nocreate=true },
			{ name = "CollectionPropertyEditor", src = "TCollectionPropertyEditor", nocreate=true },
		},
	},
	{ unit = "OIFavoriteProperties", ref = "OIFavoriteProperties", implref = "LCLPlatformDef",
		classes = {
			{ name = "OIFavoriteProperty", src = "TOIFavoriteProperty", nocreate=true },
			{ name = "OIRestrictedProperty", src = "TOIRestrictedProperty", nocreate=true },
			{ name = "OIFavoriteProperties", src = "TOIFavoriteProperties", nocreate=true },
		},
	},
	{ unit = "ObjectInspector", ref = "ObjectInspector",
		classes = {
			{ name = "OIPropertyGridRow", src = "TOIPropertyGridRow", nocreate=true },
			{ name = "OICustomPropertyGrid", src = "TOICustomPropertyGrid", nocreate=true },
			{ name = "CustomPropertiesGrid", src = "TCustomPropertiesGrid", nocreate=true },
		},
	},
	{ unit = "RTTICtrls", ref = "RTTICtrls",
		classes = {
			{ name = "AliasStrings", src = "TAliasStrings", nv=true, noparent=true },
		},
	},
	{ unit = "PropertyGrid", ref = "RTTIGrids",
		classes = {
			{ name = "TIPropertyGrid", src = "TTIPropertyGrid" },
			{ name = "TIGridProperty", src = "TTIGridProperty", nocreate=true },
			{ name = "TICustomGrid", src = "TTICustomGrid", nocreate=true },
			{ name = "TIGrid", src = "TTIGrid" },
		},
	},
}	

eventRefs = {
  Forms = "LCLType",
}
eventImplRefs = {
}

