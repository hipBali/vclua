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
local LAZPATH = "/work/tools/lazarus/"
local FPCSOURCE = "/work/tools/lazarus/fpc/3.2.2/source/"

fpcSrc = {
	["Default"] 	= FPCSOURCE.."rtl/objpas/classes/classesh.inc",
	["StdCtrls"] 	= LAZPATH.."lcl/stdctrls.pp",
	["ExtCtrls"] 	= LAZPATH.."lcl/extctrls.pp",
	["ComCtrls"] 	= LAZPATH.."lcl/comctrls.pp",
	["Controls"] 	= LAZPATH.."lcl/controls.pp",
	["Forms"] 		= LAZPATH.."lcl/forms.pp",
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
	["EditBtn"] 	= LAZPATH.."lcl/editbtn.pas",
	["FileCtrl"] 	= LAZPATH.."lcl/filectrl.pas",
	["Dialogs"] 	= LAZPATH.."lcl/dialogs.pp",
	["Grids"] 	= LAZPATH.."lcl/grids.pas",
	["ColorBox"] 	= LAZPATH.."lcl/colorbox.pas",
	["IniFiles"] 	= FPCSOURCE.."packages/fcl-base/src/inifiles.pp",
	["ValEdit"] 	= LAZPATH.."lcl/valedit.pas",
	["TextStrings"] 	= LAZPATH.."/components/lazutils/textstrings.pas",
}

toInfer = {
	["System"]    = FPCSOURCE.."rtl/inc/systemh.inc",
	["Types"]     = FPCSOURCE.."rtl/objpas/types.pp",
	["LCLType"]   = LAZPATH.."lcl/lcltype.pp",
	["GraphType"] = LAZPATH.."components/lazutils/graphtype.pp",
}

-- name: vclua class name
-- src:  source class name		parentclass: the owner/parent class
-- ref:  module reference(s), first must export 'src'
-- base: basic class (even if creatable, no parent, name or init supported)
-- 
-- noparent: not parented. Only descendants of Control can be parented
-- nv:		 non visible
-- nocreate: no create method for this class. Currently only those classes can be Create'd which inherit TComponent or are non visible
-- impl: implements method from funcdef.lua/function_defnitions
-- canvas: has canvas
-- form: use CreateNew instead Create
-- wclass: item class for collections
-- allowtemps: map from method names to comma-sep variable names
---- each variable of said method would be allowed to receive plain Lua tables in addition to variables of its type
---- table is converted to assignable type and the temporary is Free'd after the method to avoid memory leak


classes = {
	
	-- classes
	-- built-in
	-- { name = "Stream", src = "TStream", base=true, nocreate=true },
	-- { name = "Strings", src = "TStrings", nocreate=true },
	------------------------------------------------------------------
	-- TStrings and descenants
	{ name = "Strings", src = "TStrings", nv=true, nocreate=true },
	{ name = "StringList", src = "TStringList", classparent="TStrings", nv=true, noparent=true },
	{ name = "TextStrings", src = "TTextStrings", ref="TextStrings", nv=true, noparent=true },

	-- graphics    
	{ name = "Graphic", src = "TGraphic", ref = "Graphics", base=true, nocreate=true },
	{ name = "Font", src = "TFont", ref = "Graphics", base=true, nocreate=true },
	{ name = "Pen", src = "TPen", ref = "Graphics", base=true, nocreate=true },
	{ name = "Canvas", src = "TCanvas", ref = "Graphics", base=true, nocreate=true, impl = "SetPixel", },
	{ name = "Picture", src = "TPicture", ref = "Graphics", nv=true, noparent=true },
	{ name = "RasterImage", src = "TRasterImage", ref = "Graphics", implref = "LCLType", base=true, nocreate=true },
	{ unit = "Bitmap", ref = "Graphics",
		classes = {
			{ name = "CustomBitmap", src = "TCustomBitmap", nv=true, noparent=true, nocreate=true },
			{ name = "Bitmap", src = "TBitmap", nv=true, noparent=true },
		}
	},
	{ name = "Brush", src = "TBrush", ref = "Graphics", base=true, nocreate=true },

	-- imagelist
	{ name = "ImageList", src = "TCustomImageList", ref = "ImgList, Controls", noparent=true},
	-- actions
	{ name = "BasicAction", src = "TBasicAction", ref="Default", noparent=true},
	{ unit = "ActionList", ref = "ActnList", -- include = "{$i src/inc/actionlist.inc}",
		classes = {
			{ name = "ContainedAction", src = "TContainedAction",  noparent=true },
			{ name = "Action", src = "TCustomAction",  noparent=true },
			{ name = "ActionList", src = "TCustomActionList", noparent=true	},
		}
	},
	-- menus
	{ unit = "Menu", ref = "Menus",
		classes = {
			{ name = "Menu", src = "TMenu"},
			{ name = "PopupMenu", src = "TPopupMenu"},
			{ name = "MenuItem", src = "TMenuItem", noparent=true,},
			{ name = "MainMenu", src = "TMainMenu"},
		}
	},

	-- controls
	{ name = "Control", src = "TControl", ref = "Controls"},

	-- forms
	{ name = "Application", src = "TApplication", ref = "Forms", implref = "LCLType", noparent=true  },
	{ name = "Form", src = "TCustomForm", ref = "Forms", implref = "LCLType", canvas=true, form=true},
	{ name = "ScrollBox", src = "TScrollBox", ref = "Forms", canvas=true, },

	-- standard controls
	{ name = "ListBox", src = "TCustomListBox", ref = "StdCtrls", canvas=true,},
	{ name = "ComboBox", src = "TCustomComboBox", ref = "StdCtrls" },
	{ name = "Edit", src = "TCustomEdit", ref = "StdCtrls" },
	{ name = "Memo", src = "TCustomMemo", ref = "StdCtrls" },
	{ name = "StaticText", src = "TCustomStaticText", ref = "StdCtrls" },
	{ name = "Button", src = "TCustomButton", ref = "StdCtrls" },
	{ name = "CheckBox", src = "TCustomCheckBox", ref = "StdCtrls" },
	{ name = "ToggleBox", src = "TToggleBox", ref = "StdCtrls" },
	{ name = "GroupBox", src = "TGroupBox", ref = "StdCtrls" },
	{ name = "RadioButton", src = "TRadioButton", ref = "StdCtrls" },
	{ name = "Label", src = "TCustomLabel", ref = "StdCtrls", canvas=true, },
	-- ext controls
	{ name = "Notebook", src = "TNotebook", ref = "ExtCtrls" },
	{ name = "Timer", src = "TTimer", ref = "ExtCtrls", noparent=true  },
	{ name = "IdleTimer", src = "TCustomIdleTimer", ref = "ExtCtrls", noparent=true },
	{ name = "Shape", src = "TShape", ref = "ExtCtrls", canvas=true, },
	{ name = "Splitter", src = "TCustomSplitter", ref = "ExtCtrls", canvas=true, },
	{ name = "PaintBox", src = "TPaintBox", ref = "ExtCtrls" },
	{ name = "Image", src = "TCustomImage", ref = "ExtCtrls", canvas=true, },
	{ name = "Bevel", src = "TBevel", ref = "ExtCtrls" },
	{ name = "RadioGroup", src = "TCustomRadioGroup", ref = "ExtCtrls" },
	{ name = "CheckGroup", src = "TCustomCheckGroup", ref = "ExtCtrls" },
	{ name = "BoundLabel", src = "TBoundLabel", ref = "ExtCtrls" },
	{ name = "LabeledEdit", src = "TCustomLabeledEdit", ref = "ExtCtrls" },
	{ name = "Panel", src = "TCustomPanel", ref = "ExtCtrls", canvas=true, },
	{ name = "TrayIcon", src = "TCustomTrayIcon", ref = "ExtCtrls", noparent=true, canvas=true, },
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
	
	{ unit = "ToolBar", ref = "ComCtrls", canvas=true,
		classes = {
			{ name = "ToolButton", src = "TToolButton" },
			{ name = "ToolBar", src = "TToolBar" },
		}
	},
	{ name = "CoolBar", src = "TCustomCoolBar", ref = "ComCtrls", canvas=true, },
	{ name = "UpDown", src = "TUpDown", ref = "ComCtrls" },
	
	{ unit = "TabControl", ref = "ComCtrls",
		classes = {
			{ name = "TabSheet", src = "TTabSheet" },
			{ name = "TabControl", src = "TCustomTabControl" },
			{ name = "PageControl", src = "TPageControl" },
		},
	},
	{ name = "HeaderControl", src = "TCustomHeaderControl", ref = "ComCtrls" },
	{ unit = "TreeView", ref = "ComCtrls", canvas=true,
		classes = {
			{ name = "TreeNode", src = "TTreeNode", noparent=true, parentclass="TTreeNodes", nocreate=true},
			{ name = "TreeNodes", src = "TTreeNodes", noparent=true, parentclass="TCustomTreeView", nocreate=true},
			{ name = "TreeView", src = "TCustomTreeView"},
		},
	},
	{ unit = "ListView", ref = "ComCtrls", canvas=true,
		classes = {
			{ name = "ListItem", src = "TListItem", noparent=true, parentclass="TListItems", nocreate=true},
			{ name = "ListItems", src = "TListItems", noparent=true, parentclass="TCustomListView", nocreate=true},
			{ name = "ListView", src = "TCustomListView"},
		},
	},
	-- buttons
	{ name = "BitBtn", src = "TBitBtn", ref = "Buttons" },
	{ name = "SpeedButton", src = "TSpeedButton", ref = "Buttons" },
	-- maskedit
	{ name = "MaskEdit", src = "TMaskEdit", ref = "MaskEdit" },
	-- checklistbox
	{ name = "CheckListBox", src = "TCustomCheckListBox", ref = "CheckLst"},


	-- popupnotifier
	{ name = "PopupNotifier", src = "TPopupNotifier", ref = "PopupNotifier", noparent=true, },
	-- datetimepicker
	{ name = "DateTimePicker", src = "TDateTimePicker", ref = "DateTimePicker" },
	-- spin
	{ name = "FloatSpinEdit", src = "TCustomFloatSpinEdit", ref = "Spin" },
	{ name = "SpinEdit", src = "TSpinEdit", ref = "Spin" },
	-- arrow
	{ name = "Arrow", src = "TArrow", ref = "Arrow" },
	-- calendar
	{ name = "Calendar", src = "TCustomCalendar", ref = "Calendar" },
	-- editbtn
	{ name = "EditButton", src = "TCustomEditButton", ref = "EditBtn" },
	{ name = "FileNameEdit", src = "TCustomEditButton", ref = "EditBtn" },
	{ name = "DirectoryEdit", src = "TCustomEditButton", ref = "EditBtn" },
	{ name = "DateEdit", src = "TCustomEditButton", ref = "EditBtn" },
	{ name = "TimeEdit", src = "TCustomEditButton", ref = "EditBtn" },
	{ name = "CalcEdit", src = "TCustomEditButton", ref = "EditBtn" },
	-- filectrl
	
	-- grids
	{ unit = "DrawGrid", ref = "Grids",
		classes = {
			{ name = "CustomGrid", src = "TCustomGrid", nocreate=true },
			{ name = "DrawGrid", src = "TCustomDrawGrid", canvas=true },
		},
	},
	{ unit = "StringGrid", ref = "Grids",
		classes = {
			{ name = "GridColumn", src = "TGridColumn", noparent=true, parentclass="TCollection", nocreate=true},
			{ name = "GridColumns", src = "TGridColumns", noparent=true, parentclass="TCustomStringGrid", nocreate=true},--, wclass="TGridColumn"
			{ name = "StringGrid", src = "TCustomStringGrid", canvas=true, allowtemps={Rows="ret",Cols="ret"},
			  impl="GetCells, SetCells, GetSelectedCell"},
		},
	},
	
	-- valuelisteditor
	{ name = "ValueListEditor", src = "TValueListEditor", ref = "ValEdit" , canvas=true},
	-- dialogs
	{ unit = "CommonDialogs", ref = "Dialogs",
		classes = {
			{ name = "ColorButton", src = "TColorButton", },
			{ name = "OpenDialog", src = "TOpenDialog", noparent=true, impl = "DialogExecute" },
			{ name = "SaveDialog", src = "TSaveDialog", noparent=true, impl = "DialogExecute" },
			{ name = "SelectDirectoryDialog", src = "TSelectDirectoryDialog", noparent=true, impl = "DialogExecute" },
			{ name = "ColorDialog", src = "TColorDialog", noparent=true, impl = "DialogExecute" },
			{ name = "FontDialog", src = "TFontDialog", noparent=true, impl = "DialogExecute" },
			{ name = "FindDialog", src = "TFindDialog", noparent=true,  },
			{ name = "ReplaceDialog", src = "TFindDialog", noparent=true,  },
		},
	},
	-- colorbox
	{ name = "ColorBox", src = "TCustomColorBox", ref = "ColorBox" },
	{ name = "ColorListBox", src = "TColorListBox", ref = "ColorBox" },

}	


