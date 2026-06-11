-- ***************************************
-- VCLua Form tool
-- Copyright (C) 2013-2026 Hi-Project Ltd.
-- ***************************************
-- Dialog for designer/grid settings.

local util = require "util"

local M = {}

local function makeLabel(parent, name, caption, left, top)
  local l = VCL.Label(parent, name)
  l._ = { Left = left, Top = top + 4, Width = 120, Height = 20, Caption = caption }
  return l
end

local function makeEdit(parent, name, text, left, top, width)
  local e = VCL.Edit(parent, name)
  e._ = { Left = left, Top = top, Width = width or 120, Height = 24, Text = tostring(text or "") }
  return e
end

local function makeButton(parent, name, caption, left, top, width)
  local b = VCL.Button(parent, name)
  b._ = { Left = left, Top = top, Width = width or 70, Height = 24, Caption = caption }
  return b
end

local function makeCheck(parent, name, caption, checked, left, top)
  local c = VCL.CheckBox(parent, name)
  c._ = { Left = left, Top = top, Width = 180, Height = 24, Caption = caption, Checked = checked and true or false }
  return c
end

local function addComboItem(combo, item)
  item = tostring(item)
  if not combo then return false end
  local ok = pcall(function() combo.Items:Add(item) end)
  if ok then return true end
  ok = pcall(function() combo.Items.Add(combo.Items, item) end)
  if ok then return true end
  return false
end

local function fillCombo(combo, items, value)
  local text = tostring(value or "")
  pcall(function() combo.Items:Clear() end)
  pcall(function() combo.Items.Clear(combo.Items) end)
  local foundIndex = nil
  for i, item in ipairs(items or {}) do
    addComboItem(combo, item)
    if tostring(item) == text then foundIndex = i - 1 end
  end
  pcall(function() combo.Text = text end)
  if foundIndex then pcall(function() combo.ItemIndex = foundIndex end) end
end

local function comboValue(combo, default)
  local s = nil
  pcall(function() s = combo.Text end)
  if s == nil or tostring(s) == "" then return default end
  return tostring(s)
end

local function makeCombo(parent, name, value, left, top, width, items)
  local c = VCL.ComboBox(parent, name)
  c._ = { Left = left, Top = top, Width = width or 120, Height = 24, Text = tostring(value or "") }
  pcall(function() c.Style = "csDropDownList" end)
  fillCombo(c, items or {}, value)
  return c
end

local function normalizeShape(s)
  s = tostring(s or "dot"):lower()
  if s == "dots" then s = "dot" end
  if s == "cross" or s == "line" or s == "dot" then return s end
  return "dot"
end

local function normalizeSize(s, default)
  local n = util.parseNumber(s, default or 8)
  n = math.max(1, math.floor(n or default or 8))
  return n
end

local function pickColor(owner, edit)
  local current = util.parseColor(edit.Text, edit.Text)
  local dlg

  local ok = pcall(function() dlg = VCL.ColorDialog(owner, "dlgColor") end)
  if not ok or not dlg then ok = pcall(function() dlg = VCL.ColorDialog(owner) end) end
  if not ok or not dlg then ok = pcall(function() dlg = VCL.ColorDialog() end) end
  if not ok or not dlg then
    print("ColorDialog is not available in this VCLua build; edit the color text manually.")
    return
  end

  pcall(function() dlg.Color = current end)
  local executed = false
  ok = pcall(function() executed = dlg:Execute() end)
  if ok and executed then
    local c = current
    pcall(function() c = dlg.Color end)
    edit.Text = util.colorToString(c)
  end
  pcall(function() dlg:Free() end)
end

function M.show(project, applyCallback)
  project.designer = project.designer or {}
  project.designer.grid = project.designer.grid or {}
  project.designer.selection = project.designer.selection or {}
  local grid = project.designer.grid
  local selection = project.designer.selection

  local f = VCL.Form()
  f._ = {
    Caption = "Designer options",
    Width = 455,
    Height = 440,
    Position = "poScreenCenter",
    BorderStyle = "bsDialog",
  }

  local y = 16
  local cbVisible = makeCheck(f, "optGridVisible", "Show grid", grid.visible, 20, y); y = y + 28
  local cbSnap = makeCheck(f, "optGridSnap", "Snap to grid", grid.snap, 20, y); y = y + 34

  makeLabel(f, "lblSize", "Grid size", 20, y)
  local cmbSize = makeCombo(f, "cmbGridSize", grid.size or 8, 150, y, 90, { 4, 8, 10, 16, 20 })
  makeLabel(f, "lblSizeHint", "px", 250, y)
  y = y + 32

  makeLabel(f, "lblShape", "Shape", 20, y)
  local cmbShape = makeCombo(f, "cmbGridShape", normalizeShape(grid.shape), 150, y, 120, { "dot", "cross", "line" })
  y = y + 32

  makeLabel(f, "lblColor", "Grid color", 20, y)
  local edColor = makeEdit(f, "edGridColor", util.colorToString(grid.color or 0x00A0A0A0), 150, y, 140)
  local btnGridColor = makeButton(f, "btnGridColor", "Pick...", 300, y, 70)
  y = y + 32

  makeLabel(f, "lblMajorEvery", "Major every", 20, y)
  local cmbMajorEvery = makeCombo(f, "cmbMajorEvery", grid.majorEvery or 5, 150, y, 90, { 2, 4, 5, 8, 10 })
  y = y + 32

  makeLabel(f, "lblMajorColor", "Major color", 20, y)
  local edMajorColor = makeEdit(f, "edMajorColor", util.colorToString(grid.majorColor or 0x00606060), 150, y, 140)
  local btnMajorColor = makeButton(f, "btnMajorColor", "Pick...", 300, y, 70)
  y = y + 32

  makeLabel(f, "lblBg", "Canvas background", 20, y)
  local edBg = makeEdit(f, "edBackground", util.colorToString(grid.backgroundColor or "clBtnFace"), 150, y, 140)
  local btnBgColor = makeButton(f, "btnBgColor", "Pick...", 300, y, 70)
  y = y + 34

  makeLabel(f, "lblMoveFrame", "Move frame", 20, y)
  local edMoveFrame = makeEdit(f, "edMoveFrame", util.colorToString(selection.moveColor or "clHighlight"), 150, y, 140)
  local btnMoveFrame = makeButton(f, "btnMoveFrame", "Pick...", 300, y, 70)
  y = y + 32

  makeLabel(f, "lblResizeFrame", "Resize frame", 20, y)
  local edResizeFrame = makeEdit(f, "edResizeFrame", util.colorToString(selection.resizeColor or "clRed"), 150, y, 140)
  local btnResizeFrame = makeButton(f, "btnResizeFrame", "Pick...", 300, y, 70)
  y = y + 34

  local info = VCL.Label(f, "lblInfo")
  info._ = {
    Left = 20,
    Top = y,
    Width = 405,
    Height = 36,
    Caption = "Colors can also be typed: clWhite, clBtnFace, 0x00A0A0A0, #A0A0A0",
  }
  y = y + 48

  local btnApply = makeButton(f, "btnApplyOptions", "Apply", 100, y, 80)
  btnApply.Height = 28

  local btnOK = makeButton(f, "btnOKOptions", "OK", 190, y, 80)
  btnOK.Height = 28

  local btnCancel = makeButton(f, "btnCancelOptions", "Cancel", 280, y, 80)
  btnCancel.Height = 28

  local function apply()
    grid.visible = cbVisible.Checked and true or false
    grid.snap = cbSnap.Checked and true or false
    grid.size = normalizeSize(comboValue(cmbSize, grid.size or 8), grid.size or 8)
    grid.shape = normalizeShape(comboValue(cmbShape, grid.shape or "dot"))
    grid.color = util.parseColor(edColor.Text, grid.color or 0x00A0A0A0)
    grid.majorEvery = normalizeSize(comboValue(cmbMajorEvery, grid.majorEvery or 5), grid.majorEvery or 5)
    grid.majorColor = util.parseColor(edMajorColor.Text, grid.majorColor or 0x00606060)
    grid.backgroundColor = util.parseColor(edBg.Text, grid.backgroundColor or "clBtnFace")
    selection.moveColor = util.parseColor(edMoveFrame.Text, selection.moveColor or "clHighlight")
    selection.resizeColor = util.parseColor(edResizeFrame.Text, selection.resizeColor or "clRed")
    if applyCallback then applyCallback() end
  end

  btnGridColor.OnClick = function() pickColor(f, edColor) end
  btnMajorColor.OnClick = function() pickColor(f, edMajorColor) end
  btnBgColor.OnClick = function() pickColor(f, edBg) end
  btnMoveFrame.OnClick = function() pickColor(f, edMoveFrame) end
  btnResizeFrame.OnClick = function() pickColor(f, edResizeFrame) end

  btnApply.OnClick = function() apply() end
  btnOK.OnClick = function()
    apply()
    f:Close()
  end
  btnCancel.OnClick = function() f:Close() end

  f:ShowModal()
end

return M
