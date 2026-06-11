-- ***************************************
-- VCLua Form tool
-- Copyright (C) 2013-2026 Hi-Project Ltd.
-- ***************************************
-- Help and about dialogs for the VCLua form editor.

local M = {}

local HELP_LINES = {
  "VCLua - Form editor help",
  "",
  "Basic workflow",
  "  1. Create a new form or open an existing .vclform file.",
  "  2. Add components from the palette.",
  "  3. Select and arrange controls on the form or in the component tree.",
  "  4. Switch to the Properties tab and edit values in the property grid.",
  "  5. Save the editable .vclform source, then export when required.",
  "",
  "File",
  "  Ctrl+N          New form",
  "  Ctrl+O          Open .vclform",
  "  Ctrl+S          Save .vclform",
  "  Ctrl+Q          Exit",
  "  File / Export Lua module...",
  "  File / Export JSON...",
  "",
  "View and help",
  "  F1              Open this help",
  "  F4              Switch to the Properties tab",
  "  F5              Show / focus the edited form",
  "",
  "Main window",
  "  Object tree     Select, rename, reorder and reparent components",
  "  Components tab  Search and add components from the palette",
  "  Properties tab  Inspect and edit the selected component",
  "  Status line     Shows the current editor operation or setting",
  "",
  "Adding components",
  "  Palette double click or Enter",
  "                  Add component to the selected valid target",
  "  PageControl     Normal controls are placed on its first TabSheet",
  "  ToolBar         Accepts ToolButton children only",
  "  ImageList       Form-level non-visual component",
  "",
  "Selection and property editing",
  "  Form click      Select a control and synchronize the component tree",
  "  Tree click      Select the corresponding control on the form",
  "  F2              Rename selected component",
  "  Properties tab  Edit published and editor-managed properties",
  "  Special editor  Use the ellipsis/editor action on supported properties",
  "",
  "Clipboard and deletion",
  "  Delete          Delete selected component and its subtree",
  "  Ctrl+D          Duplicate selected component and its subtree",
  "  Ctrl+C          Copy selected component and its subtree",
  "  Ctrl+X          Mark selected component for cutting",
  "  Ctrl+V          Paste into the selected valid target",
  "  Esc             Cancel a pending cut",
  "",
  "Mouse editing on the form",
  "  Click           Select control",
  "  Ctrl+drag       Move selected control",
  "  Ctrl+Shift+drag Resize selected control or Form1",
  "",
  "Keyboard layout",
  "  Arrow           Move 1 pixel",
  "  Shift+Arrow     Move by the current grid size",
  "  Ctrl+Arrow      Resize 1 pixel",
  "  Ctrl+Shift+Arrow",
  "                  Resize by the current grid size",
  "  Ctrl+E          Center in parent",
  "  Ctrl+Shift+R    Fix layout and bring control back inside parent",
  "",
  "Component tree and parenting",
  "  Alt+Up          Move node up and update order / TabOrder",
  "  Alt+Down        Move node down and update order / TabOrder",
  "  Tree drag/drop  Reorder or reparent to a valid container",
  "  TabSheet        Can only be placed under a PageControl",
  "  ToolButton      Can only be placed under a ToolBar",
  "  Invalid drops   Are rejected without changing the model",
  "",
  "Grid",
  "  Ctrl+G          Toggle snap-to-grid",
  "  Alt+G           Cycle grid size",
  "  Ctrl+Shift+G    Toggle design grid visibility",
  "  Options / Visible Show or hide the design grid",
  "  Grid drawing    Supported on GroupBox, RadioGroup, CheckGroup",
  "                  and TabSheet design surfaces",
  "",
  "Built-in special editors",
  "  ImageList       Manage image entries",
  "  ToolBar         Manage ToolButton items",
  "  TreeView        Edit tree nodes",
  "  ListView        Edit columns and items",
  "  PageControl     Manage TabSheets",
  "  ActionList      Manage actions and the action image list",
  "  MainMenu        Edit root and child menu items",
  "  PopupMenu       Edit root and child menu items",
  "  Button family   Button, SpeedButton, BitBtn and EditButton helpers",
  "",
  "Actions in design mode",
  "  Action references are stored in the form model.",
  "  The designer does not create a live TAction binding for controls.",
  "  Supported display properties are mirrored from the selected action.",
  "  Button / SpeedButton / BitBtn mirror their supported action values.",
  "  ToolButton also uses the parent ToolBar Images list when available.",
  "  EditButton mirrors Hint, Enabled, Images, ImageIndex and Glyph.",
  "  Menu items receive action values when changes are applied in the editor.",
  "",
  "Saving and export",
  "  .vclform        Editable designer source; use this for later changes",
  "  Lua module      Runtime-oriented Lua representation",
  "  JSON            Interchange representation",
  "  Save and reload important forms after structural editor changes.",
  "",
  "Notes",
  "  ComboBox csDropDownList is handled safely in the designer.",
  "  Menu editor OK and Cancel close the dialog; closing performs no apply.",
  "  Use the component tree when a non-visual component cannot be clicked.",
}
local function fillMemo(memo, lines)
  local ok = pcall(function()
    memo.Lines:Clear()
    for _, line in ipairs(lines) do
      memo.Lines:Add(line)
    end
  end)
  if not ok then
    pcall(function() memo.Lines = lines end)
  end
end

function M.show()
  local f = VCL.Form()
  f._ = {
    Caption = "VCLua Form Editor Help",
    Width = 680,
    Height = 680,
    Position = "poScreenCenter",
  }

  local memo = VCL.Memo(f, "helpMemo")
  memo._ = {
    Align = "alClient",
    ReadOnly = true,
    ScrollBars = "ssAutoBoth",
    WordWrap = false,
  }
  fillMemo(memo, HELP_LINES)

  local bottom = VCL.Panel(f, "helpBottom")
  bottom._ = { Align = "alBottom", Height = 44, Caption = "" }

  local btnClose = VCL.Button(bottom, "btnCloseHelp")
  btnClose._ = { Left = 560, Top = 8, Width = 90, Height = 28, Caption = "Close" }
  pcall(function() btnClose.Cancel = true end)
  pcall(function() btnClose.Default = true end)
  btnClose.OnClick = function() pcall(function() f:Close() end) end

  pcall(function() f.KeyPreview = true end)
  f.OnKeyDown = function(sender, key, shift)
    local s = tostring(key or "")
    if key == 27 or s == "Escape" or s == "Esc" or s == "VK_ESCAPE" then
      pcall(function() f:Close() end)
    end
    return key
  end

  f:ShowModal()
  pcall(function() f:Free() end)
end

function M.about()
  local f = VCL.Form()
  f._ = {
    Caption = "About",
    Width = 440,
    Height = 220,
    Position = "poScreenCenter",
    BorderStyle = "bsDialog",
  }

  local title = VCL.Label(f, "aboutTitle")
  title._ = {
    Left = 24,
    Top = 24,
    Width = 380,
    Height = 24,
    Caption = "VCLua Form Editor",
  }

  local info = VCL.Label(f, "aboutInfo")
  info._ = {
    Left = 24,
    Top = 56,
    Width = 380,
    Height = 48,
    Caption = "Visual form designer for VCLua\nLua 5.4 / Linux development edition",
  }

  local btn = VCL.Button(f, "btnAboutOk")
  btn._ = { Left = 175, Top = 152, Width = 90, Height = 28, Caption = "OK" }
  pcall(function() btn.Default = true end)
  pcall(function() btn.Cancel = true end)
  btn.OnClick = function() pcall(function() f:Close() end) end

  pcall(function() f.KeyPreview = true end)
  f.OnKeyDown = function(sender, key, shift)
    local s = tostring(key or "")
    if key == 27 or key == 13 or s == "Escape" or s == "Esc" or s == "VK_ESCAPE" or s == "Return" or s == "Enter" or s == "VK_RETURN" then
      pcall(function() f:Close() end)
    end
    return key
  end

  f:ShowModal()
  pcall(function() f:Free() end)
end

return M
