-- ***************************************
-- VCLua Form tool
-- Copyright (C) 2013-2026 Hi-Project Ltd.
-- ***************************************
-- Help and about dialogs for the VCLua form editor.

local M = {}

local HELP_LINES = {
  "VCLua - Form editor shortcuts",
  "",
  "File",
  "  Ctrl+O          Open .vclform",
  "  Ctrl+S          Save .vclform",
  "",
  "View",
  "  F5              Show / focus edited form",
  "  F4              Show / hide property panel",
  "",
  "Selection / edit",
  "  F2              Rename selected control",
  "  Delete          Delete selected control/subtree",
  "  Ctrl+D          Duplicate selected control/subtree",
  "  Ctrl+C          Copy selected control/subtree",
  "  Ctrl+X          Cut selected control/subtree",
  "  Ctrl+V          Paste into selected target",
  "  Esc             Cancel pending cut",
  "",
  "Designer mouse",
  "  Click           Select control",
  "  Ctrl+drag       Move selected control",
  "  Ctrl+Shift+drag Resize selected control / Form1",
  "",
  "Keyboard layout",
  "  Arrow           Move 1 px",
  "  Shift+Arrow     Move by grid size",
  "  Ctrl+Arrow      Resize 1 px",
  "  Ctrl+Shift+Arrow Resize by grid size",
  "  Ctrl+E          Center in parent",
  "  Ctrl+Shift+R    Fix layout / bring back inside parent",
  "",
  "Tree",
  "  Alt+Up          Move node up / update TabOrder",
  "  Alt+Down        Move node down / update TabOrder",
  "  Tree drag/drop  Reorder or reparent to valid container",
  "",
  "Palette",
  "  Double click    Add component to selected target",
  "  Enter           Add component to selected target",
  "  Drag to form    Add component at drop position",
  "",
  "Grid / options",
  "  Ctrl+G          Toggle snap-to-grid",
  "  Alt+G           Cycle grid size",
  "  Ctrl+Shift+G    Grid is always ON",
  "",
  "Export",
  "  File / Export Lua module...",
  "  File / Export JSON...",
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
    Caption = "Shortcuts",
    Width = 520,
    Height = 520,
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
  btnClose._ = { Left = 410, Top = 8, Width = 90, Height = 28, Caption = "Close" }
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
    Width = 360,
    Height = 160,
    Position = "poScreenCenter",
    BorderStyle = "bsDialog",
  }

  local title = VCL.Label(f, "aboutTitle")
  title._ = {
    Left = 24,
    Top = 24,
    Width = 300,
    Height = 24,
    Caption = "VCLua - Form editor v1.0",
  }

  local info = VCL.Label(f, "aboutInfo")
  info._ = {
    Left = 24,
    Top = 56,
    Width = 300,
    Height = 24,
    Caption = "Visual form designer for VCLua",
  }

  local btn = VCL.Button(f, "btnAboutOk")
  btn._ = { Left = 135, Top = 96, Width = 90, Height = 28, Caption = "OK" }
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
