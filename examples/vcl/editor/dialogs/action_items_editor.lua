-- ***************************************
-- VCLua Form Editor - ActionList editor
-- ***************************************

local formLoader = require "form_loader"

local M = {}

local MR_OK = 1
local MR_CANCEL = 2

local function clearStrings(stringsObj)
  if not stringsObj then return false end
  local ok = pcall(function() stringsObj:Clear() end)
  if ok then return true end
  ok = pcall(function() stringsObj.Clear(stringsObj) end)
  return ok and true or false
end

local function addString(stringsObj, value)
  if not stringsObj then return false end
  value = tostring(value or "")
  local ok = pcall(function() stringsObj:Add(value) end)
  if ok then return true end
  ok = pcall(function() stringsObj.Add(stringsObj, value) end)
  return ok and true or false
end

local function listClear(lb)
  local items = nil
  pcall(function() items = lb.Items end)
  if items then clearStrings(items) end
end

local function listAdd(lb, value)
  local items = nil
  pcall(function() items = lb.Items end)
  if items then addString(items, value) end
end

local function comboClear(cb)
  if not cb then return end
  local items = nil
  pcall(function() items = cb.Items end)
  if items then clearStrings(items) end
end

local function comboAdd(cb, value)
  if not cb then return end
  local items = nil
  pcall(function() items = cb.Items end)
  if items then addString(items, value) end
end

local function comboIndex(cb)
  local idx = -1
  if cb then pcall(function() idx = tonumber(cb.ItemIndex) or -1 end) end
  return idx
end

local function cloneValue(v)
  if type(v) ~= "table" then return v end
  local r = {}
  for k, vv in pairs(v) do r[k] = cloneValue(vv) end
  return r
end

local function firstNonNil(...)
  for i = 1, select("#", ...) do
    local v = select(i, ...)
    if v ~= nil then return v end
  end
  return nil
end

local function normalizeAction(action)
  action = action or {}
  local name = tostring(firstNonNil(action.Name, action.name, ""))
  local caption = tostring(firstNonNil(action.Caption, action.caption, action.Text, action.text, name))
  local hint = tostring(firstNonNil(action.Hint, action.hint, ""))
  return {
    Name = name,
    Caption = caption,
    Hint = hint,
    ImageIndex = tonumber(firstNonNil(action.ImageIndex, action.imageIndex, action.Imageindex)) or -1,
    Enabled = action.Enabled ~= false,
    Checked = action.Checked == true,
  }
end

local function normalizeActions(actions)
  local out = {}
  for _, action in ipairs(actions or {}) do
    table.insert(out, normalizeAction(cloneValue(action)))
  end
  return out
end

local function nextActionName(actions)
  return "actAction" .. tostring(#(actions or {}) + 1)
end

local function readText(edit)
  local v = ""
  pcall(function() v = edit.Text end)
  return tostring(v or "")
end

local function writeText(edit, value)
  pcall(function() edit.Text = tostring(value or "") end)
end

local function readChecked(check)
  local v = false
  pcall(function() v = check.Checked end)
  return v and true or false
end

local function writeChecked(check, value)
  pcall(function() check.Checked = value and true or false end)
end

local function readNumber(spin, default)
  local v = nil
  pcall(function() v = spin.Value end)
  if tonumber(v) ~= nil then return tonumber(v) end
  pcall(function() v = spin.Text end)
  if tonumber(v) ~= nil then return tonumber(v) end
  return default
end

local function writeNumber(spin, value)
  value = tonumber(value) or -1
  pcall(function() spin.Value = value end)
  pcall(function() spin.Text = tostring(value) end)
end

local function selectedNode(ctx)
  if ctx and type(ctx.getSelectedNode) == "function" then
    local ok, n = pcall(ctx.getSelectedNode)
    if ok then return n end
  end
  return nil
end

local function refreshInspector(ctx, node)
  if ctx and ctx.inspector and selectedNode(ctx) == node then
    pcall(function() ctx.inspector.showNode(node) end)
  end
end

local function status(ctx, text)
  if ctx and type(ctx.setStatus) == "function" then ctx.setStatus(text) end
end

local function currentProject(ctx)
  if ctx and type(ctx.getProject) == "function" then
    local ok, p = pcall(ctx.getProject)
    if ok and p then return p end
  end
  return ctx and ctx.project or nil
end

local function collectImageLists(ctx)
  local out = {}
  local project = currentProject(ctx)
  if not project then return out end

  local root = nil
  if ctx and ctx.model and type(ctx.model.getRoot) == "function" then
    local ok
    ok, root = pcall(function() return ctx.model.getRoot(project) end)
    if not ok then root = nil end
  end
  root = root or (project.forms and project.forms[1])

  local function isImageListNode(n)
    if not n then return false end
    if ctx and ctx.registry and type(ctx.registry.isImageList) == "function" then
      local ok, v = pcall(function() return ctx.registry.isImageList(n.class) end)
      if ok then return v and true or false end
    end
    return n.class == "ImageList"
  end

  local function walk(n)
    if not n then return end
    if isImageListNode(n) then out[#out + 1] = n end
    for _, child in ipairs(n.items or {}) do walk(child) end
  end
  walk(root)
  return out
end

local function fillImageListCombo(cb, lists, currentName)
  comboClear(cb)
  comboAdd(cb, "(none)")
  local selectedIndex = 0
  for i, imgListNode in ipairs(lists or {}) do
    local itemName = tostring(imgListNode.name or imgListNode.class or ("ImageList" .. tostring(i)))
    local count = 0
    if imgListNode.props and type(imgListNode.props.Images) == "table" then
      count = #imgListNode.props.Images
    end
    comboAdd(cb, itemName .. "  (" .. tostring(count) .. ")")
    if itemName == tostring(currentName or "") then selectedIndex = i end
  end
  pcall(function() cb.ItemIndex = selectedIndex end)
end

local function selectedImageListName(cb, lists)
  local idx = comboIndex(cb)
  if idx <= 0 then return nil end
  return lists and lists[idx] and lists[idx].name or nil
end

function M.open(ctx, node)
  if not node or node.class ~= "ActionList" then return false end

  local loaded = formLoader.load("forms/action_items_editor.vclform")
  local form = loaded.form
  local ui = loaded.ui
  if not form or not ui.ActionsList then error("Invalid action_items_editor.vclform") end

  local actions = normalizeActions(node.props and node.props.Actions or {})
  local imageLists = collectImageLists(ctx)
  fillImageListCombo(ui.ImagesCombo, imageLists, node.props and node.props.Images)
  local selectedIndex = nil -- 1-based model index

  pcall(function() ui.OkButton.ModalResult = MR_OK end)
  pcall(function() ui.CancelButton.ModalResult = MR_CANCEL end)
  pcall(function() ui.OkButton.Default = true end)
  pcall(function() ui.CancelButton.Cancel = true end)

  local function saveModelOnly()
    node.props = node.props or {}
    node.props.Images = selectedImageListName(ui.ImagesCombo, imageLists)
    node.props.Actions = normalizeActions(actions)
    if ctx and ctx.runtime and type(ctx.runtime.applyNodeProperty) == "function" then
      pcall(function() ctx.runtime.applyNodeProperty(node, "Images", node.props.Images) end)
      pcall(function() ctx.runtime.applyNodeProperty(node, "Actions", node.props.Actions) end)
    end
    refreshInspector(ctx, node)
    status(ctx, "ActionList actions applied: " .. tostring(#actions) .. " action(s)")
  end

  local function refreshList()
    listClear(ui.ActionsList)
    for i, action in ipairs(actions) do
      local text = tostring(action.Name or "")
      if tostring(action.Caption or "") ~= "" and tostring(action.Caption) ~= text then
        text = text .. "  " .. tostring(action.Caption)
      end
      listAdd(ui.ActionsList, text)
    end
    if selectedIndex and actions[selectedIndex] then
      pcall(function() ui.ActionsList.ItemIndex = selectedIndex - 1 end)
    else
      selectedIndex = nil
      pcall(function() ui.ActionsList.ItemIndex = -1 end)
    end
  end

  local function loadSelectedToFields()
    local action = selectedIndex and actions[selectedIndex] or nil
    if not action then
      writeText(ui.NameEdit, "")
      writeText(ui.CaptionEdit, "")
      writeText(ui.HintEdit, "")
      writeNumber(ui.ImageIndexEdit, -1)
      writeChecked(ui.EnabledCheck, true)
      writeChecked(ui.CheckedCheck, false)
      return
    end
    writeText(ui.NameEdit, action.Name)
    writeText(ui.CaptionEdit, action.Caption)
    writeText(ui.HintEdit, action.Hint)
    writeNumber(ui.ImageIndexEdit, action.ImageIndex)
    writeChecked(ui.EnabledCheck, action.Enabled ~= false)
    writeChecked(ui.CheckedCheck, action.Checked)
  end

  local function commitFieldsToSelected()
    if not selectedIndex or not actions[selectedIndex] then return false end
    local action = actions[selectedIndex]
    action.Name = readText(ui.NameEdit)
    action.Caption = readText(ui.CaptionEdit)
    action.Hint = readText(ui.HintEdit)
    action.ImageIndex = readNumber(ui.ImageIndexEdit, -1)
    action.Enabled = readChecked(ui.EnabledCheck)
    action.Checked = readChecked(ui.CheckedCheck)
    return true
  end

  local function selectIndex(idx)
    commitFieldsToSelected()
    selectedIndex = idx
    refreshList()
    loadSelectedToFields()
  end

  ui.ActionsList.OnClick = function()
    local idx = -1
    pcall(function() idx = tonumber(ui.ActionsList.ItemIndex) or -1 end)
    if idx >= 0 then selectIndex(idx + 1) end
  end

  if ui.ImagesCombo then
    ui.ImagesCombo.OnChange = function()
      commitFieldsToSelected()
      saveModelOnly()
    end
  end

  ui.AddButton.OnClick = function()
    commitFieldsToSelected()
    local name = nextActionName(actions)
    table.insert(actions, {
      Name = name,
      Caption = name,
      Hint = "",
      ImageIndex = -1,
      Enabled = true,
      Checked = false,
    })
    selectedIndex = #actions
    refreshList()
    loadSelectedToFields()
    saveModelOnly()
  end

  ui.DeleteButton.OnClick = function()
    if not selectedIndex or not actions[selectedIndex] then return end
    table.remove(actions, selectedIndex)
    if selectedIndex > #actions then selectedIndex = #actions end
    if selectedIndex < 1 then selectedIndex = nil end
    refreshList()
    loadSelectedToFields()
    saveModelOnly()
  end

  ui.MoveUpButton.OnClick = function()
    commitFieldsToSelected()
    if not selectedIndex or selectedIndex <= 1 then return end
    actions[selectedIndex], actions[selectedIndex - 1] = actions[selectedIndex - 1], actions[selectedIndex]
    selectedIndex = selectedIndex - 1
    refreshList()
    loadSelectedToFields()
    saveModelOnly()
  end

  ui.MoveDownButton.OnClick = function()
    commitFieldsToSelected()
    if not selectedIndex or selectedIndex >= #actions then return end
    actions[selectedIndex], actions[selectedIndex + 1] = actions[selectedIndex + 1], actions[selectedIndex]
    selectedIndex = selectedIndex + 1
    refreshList()
    loadSelectedToFields()
    saveModelOnly()
  end

  ui.ApplyActionButton.OnClick = function()
    commitFieldsToSelected()
    refreshList()
    loadSelectedToFields()
    saveModelOnly()
  end

  refreshList()
  if #actions > 0 then selectedIndex = 1; refreshList() end
  loadSelectedToFields()

  -- OK and Cancel only close the modal dialog.
  form:ShowModal()
  return true
end

return M
