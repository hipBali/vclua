-- **************************************************** --
--                                                      --
-- VCLua 1.1 Class source generator CONFIG              --
--                                                      --
-- (C) 2018-2023 Hi-Project Ltd.                        --
--                                                      --
-- **************************************************** --

-- linux
local LAZPATH = "/usr/share/lazarus/2.2.6/"
local FPCSOURCE = "/usr/share/fpcsrc/3.2.2/"

-- windows
-- local LAZPATH = "/work/tools/lazarus/"
-- local FPCSOURCE = "/work/tools/lazarus/fpc/3.2.2/source/"

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


-- name: vclua class name
-- src:  source class name		parentclass: the owner/parent class
-- ref:  module reference(s)
-- base: basic class
-- 
-- noparent: not parented
-- nv:		 non visible
-- nocreate: no create method for this class
-- impl: implements method from funcdef.lua/function_defnitions
-- canvas: has canvas
-- form: use CreateNew instead Create


classes = {
	
	-- classes
	-- built-in
	-- { name = "Stream", src = "TStream", base=true, nocreate=true },
	-- { name = "Strings", src = "TStrings", nocreate=true },
	------------------------------------------------------------------
	-- TStrings and descenants
	{ name = "Strings", src = "TStrings",  nv=true, noparent=true },
	{ name = "TextStrings", src = "TTextStrings", ref="TextStrings", nv=true, noparent=true },
	{ name = "StringList", src = "TStringList", classparent="TStrings", nv=true, noparent=true },

	-- controls
	{ name = "Control", src = "TControl", ref = "Controls, Graphics"},
	
	-- graphics    
	{ name = "Bitmap", src = "TBitmap", ref = "Graphics, LCLType", base=true, nocreate=true },
	{ name = "CustomBitmap", src = "TCustomBitmap", ref = "Graphics, LCLType", base=true, nocreate=true },
	{ name = "Graphic", src = "TGraphic", ref = "Graphics, LCLType", base=true, nocreate=true },
	{ name = "Font", src = "TFont", ref = "Graphics", base=true, nocreate=true },
	{ name = "Pen", src = "TPen", ref = "Graphics", base=true, nocreate=true },
	{ name = "Brush", src = "TBrush", ref = "Graphics", base=true, nocreate=true },
	{ name = "Canvas", src = "TCanvas", ref = "Graphics, GraphType", base=true, nocreate=true, impl = "SetPixel", },
	{ name = "Picture", src = "TPicture", ref = "Graphics", base=true, nocreate=true },
	{ name = "RasterImage", src = "TRasterImage", ref = "Graphics, LCLType, Types", base=true, nocreate=true },
	-- { name = "ImageList", src = "TImageList", ref = "Controls", noparent=true},

	-- forms
	{ name = "Application", src = "TApplication", ref = "Forms, LCLType, LMessages, Controls", noparent=true  },
	{ name = "Form", src = "TCustomForm", ref = "Forms, LCLType, LMessages, Controls, Graphics, LuaBitmap", canvas=true, form=true},
	{ name = "ScrollBox", src = "TScrollBox", ref = "Forms, Controls", canvas=true, },
	-- actions
	{ name = "BasicAction", src = "TBasicAction", ref="Default, Controls", noparent=true},
	{ unit = "ActionList", ref = "ActnList, Controls", -- include = "{$i src/inc/actionlist.inc}",
		classes = {
			{ name = "Action", src = "TCustomAction",  noparent=true },
			{ name = "ActionList", src = "TCustomActionList",  noparent=true, 
			  -- impl = "LoadFromTable,GetAction" 
			},
		}
	},
	
	
	-- imagelist
	{ name = "ImageList", src = "TCustomImageList", ref = "ImgList, Controls, Graphics, GraphType", noparent=true},
	-- menus
	{ unit = "Menu", ref = "Menus, Controls, ImgList, LuaImageList",
		classes = {
			{ name = "Menu", src = "TMenu"},
			{ name = "PopupMenu", src = "TPopupMenu"},
			{ name = "MenuItem", src = "TMenuItem", noparent=true,},
			{ name = "MainMenu", src = "TMainMenu", impl = "AddMenu"},
		}
	},
	-- standard controls
	{ name = "ListBox", src = "TCustomListBox", ref = "StdCtrls, Controls", canvas=true,},
	{ name = "ComboBox", src = "TCustomComboBox", ref = "StdCtrls, Controls" },
	{ name = "Edit", src = "TCustomEdit", ref = "StdCtrls, Controls" },
	{ name = "Memo", src = "TCustomMemo", ref = "StdCtrls, Controls" },
	{ name = "StaticText", src = "TCustomStaticText", ref = "StdCtrls, Controls" },
	{ name = "Button", src = "TCustomButton", ref = "StdCtrls, Controls" },
	{ name = "CheckBox", src = "TCustomCheckBox", ref = "StdCtrls, Controls" },
	{ name = "ToggleBox", src = "TToggleBox", ref = "StdCtrls, Controls" },
	{ name = "RadioButton", src = "TRadioButton", ref = "StdCtrls, Controls" },
	{ name = "Label", src = "TCustomLabel", ref = "StdCtrls, Controls", canvas=true, },
	-- ext controls
	{ name = "Notebook", src = "TNotebook", ref = "ExtCtrls, Controls" },
	{ name = "Timer", src = "TTimer", ref = "ExtCtrls, Controls", noparent=true  },
	{ name = "IdleTimer", src = "TCustomIdleTimer", ref = "ExtCtrls, Controls", noparent=true },
	{ name = "Shape", src = "TShape", ref = "ExtCtrls, Controls", canvas=true, },
	{ name = "Splitter", src = "TCustomSplitter", ref = "ExtCtrls, Controls, LuaControl", canvas=true, },
	{ name = "PaintBox", src = "TPaintBox", ref = "ExtCtrls, Controls" },
	{ name = "Image", src = "TCustomImage", ref = "ExtCtrls, Controls", canvas=true, },
	{ name = "Bevel", src = "TBevel", ref = "ExtCtrls, Controls" },
	{ name = "RadioGroup", src = "TCustomRadioGroup", ref = "ExtCtrls, Controls" },
	{ name = "CheckGroup", src = "TCustomCheckGroup", ref = "ExtCtrls, Controls" },
	{ name = "BoundLabel", src = "TBoundLabel", ref = "ExtCtrls, Controls" },
	{ name = "LabeledEdit", src = "TCustomLabeledEdit", ref = "ExtCtrls, Controls" },	
	{ name = "Panel", src = "TCustomPanel", ref = "ExtCtrls, Controls", canvas=true, },
	{ name = "TrayIcon", src = "TCustomTrayIcon", ref = "ExtCtrls, Controls", noparent=true, canvas=true, },
	-- com controls
	{ name = "TrackBar", src = "TCustomTrackBar", ref = "ComCtrls, Controls" },
	{ name = "ProgressBar", src = "TCustomProgressBar", ref = "ComCtrls, Controls" },
	
	{ unit = "StatusBar", ref = "ComCtrls, Controls",
		classes = {
			{ name = "StatusPanel", src = "TStatusPanel", noparent=true, nocreate=true},
			{ name = "StatusPanels", src = "TStatusPanels", noparent=true, nocreate=true, parentclass="TStatusBar", wclass="TStatusPanel"},
			{ name = "StatusBar", src = "TStatusBar", ref = "ComCtrls, Controls" },
		}
	},
	
	{ unit = "ToolBar", ref = "ComCtrls, Controls, ImgList, LuaImageList", canvas=true,
		classes = {
			{ name = "ToolButton", src = "TToolButton", noparent=true,},
			{ name = "ToolBar", src = "TToolBar" },
		}
	},
	{ name = "CoolBar", src = "TCustomCoolBar", ref = "ComCtrls, Controls", canvas=true, },
	{ name = "UpDown", src = "TUpDown", ref = "ComCtrls, Controls" },
	
	{ unit = "TabControl", ref = "ComCtrls, Controls", 
		classes = {
			{ name = "TabSheet", src = "TTabSheet" },
			{ name = "TabControl", src = "TCustomTabControl" },
			{ name = "PageControl", src = "TPageControl" },
		},
	},
	{ name = "HeaderControl", src = "TCustomHeaderControl", ref = "ComCtrls, Controls" },
	{ unit = "TreeView", ref = "ComCtrls, Controls", canvas=true,
		classes = {
			{ name = "TreeNode", src = "TTreeNode", noparent=true, parentclass="TTreeNodes" },
			{ name = "TreeNodes", src = "TTreeNodes", noparent=true, parentclass="TCustomTreeView"},
			{ name = "TreeView", src = "TCustomTreeView"},
		},
	},
	{ unit = "ListView", ref = "ComCtrls, Controls", canvas=true,
		classes = {
			{ name = "ListItem", src = "TListItem", noparent=true, parentclass="TListItems", nocreate=true},
			{ name = "ListItems", src = "TListItems", noparent=true, parentclass="TCustomListView", nocreate=true},
			{ name = "ListView", src = "TCustomListView"},
		},
	},
	-- buttons
	{ name = "BitBtn", src = "TBitBtn", ref = "Buttons, Controls" },
	{ name = "SpeedButton", src = "TSpeedButton", ref = "Buttons, Controls" },
	-- maskedit
	{ name = "MaskEdit", src = "TMaskEdit", ref = "MaskEdit, Controls" },
	-- checklistbox
	{ name = "CheckListBox", src = "TCheckListBox", ref = "CheckLst, Controls" },
	-- popupnotifier
	{ name = "PopupNotifier", src = "TPopupNotifier", ref = "PopupNotifier, Controls", noparent=true, },
	-- datetimepicker
	{ name = "DateTimePicker", src = "TDateTimePicker", ref = "DateTimePicker, Controls" },
	-- spin
	{ name = "SpinEdit", src = "TSpinEdit", ref = "Spin, Controls" },
	{ name = "FloatSpinEdit", src = "TCustomFloatSpinEdit", ref = "Spin, Controls" },
	-- arrow
	{ name = "Arrow", src = "TArrow", ref = "Arrow, Controls" },
	-- calendar
	{ name = "Calendar", src = "TCustomCalendar", ref = "Calendar, Controls" },
	-- editbtn
	{ name = "EditButton", src = "TCustomEditButton", ref = "EditBtn, Controls" },
	{ name = "FileNameEdit", src = "TCustomEditButton", ref = "EditBtn, Controls" },
	{ name = "DirectoryEdit", src = "TCustomEditButton", ref = "EditBtn, Controls" },
	{ name = "DateEdit", src = "TCustomEditButton", ref = "EditBtn, Controls" },
	{ name = "TimeEdit", src = "TCustomEditButton", ref = "EditBtn, Controls" },
	{ name = "CalcEdit", src = "TCustomEditButton", ref = "EditBtn, Controls" },
	-- filectrl
	-- colorbox
	{ name = "ColorBox", src = "TCustomColorBox", ref = "ColorBox, Controls" },
	{ name = "ColorListBox", src = "TColorListBox", ref = "ColorBox, Controls" },
	
	-- grids
	{ unit = "StringGrid", ref = "Grids, Controls", canvas=true,
		classes = {
			{ name = "GridColumn", src = "TGridColumn", noparent=true, parentclass="TCollection", nocreate=true},
			{ name = "GridColumns", src = "TGridColumns", noparent=true, parentclass="TCustomStringGrid", wclass="TGridColumn"},
			{ name = "StringGrid", src = "TCustomStringGrid"},
		},
	},
	{ name = "DrawGrid", src = "TCustomDrawGrid", ref = "Grids, Controls" },
	
	-- dialogs
	{ unit = "CommonDialogs", ref = "Dialogs, Controls",
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

}	

