-- ***************************************
-- VCLua Form Editor - Button image editor code-behind
-- Handles Button Action, plus SpeedButton / BitBtn GlyphFile and Images component reference. Index properties are edited in the PropertyGrid.
-- ***************************************

local formLoader = require "form_loader"

local M = {}

local function trim(s)
  s = tostring(s or "")
  return s:match("^%s*(.-)%s*$") or s
end

local function pathDir(fileName)
  fileName = tostring(fileName or "")
  local d = fileName:match("^(.*[/\\])[^/\\]*$")
  if d and d ~= "" then return d end
  return "dev/"
end

local function pathBase(fileName)
  fileName = tostring(fileName or "")
  return fileName:match("([^/\\]+)$") or fileName
end

local function clearStrings(stringsObj)
  if not stringsObj then return false end
  local ok = pcall(function() stringsObj:Clear() end)
  if ok then return true end
  ok = pcall(function() stringsObj.Clear(stringsObj) end)
  return ok and true or false
end

local function comboClear(cb)
  local items = nil
  pcall(function() items = cb.Items end)
  if items then clearStrings(items) end
end

local function comboAdd(cb, text)
  local items = nil
  pcall(function() items = cb.Items end)
  if not items then return end
  local value = tostring(text or "")
  local ok = pcall(function() items:Add(value) end)
  if not ok then pcall(function() items.Add(items, value) end) end
end

local function safeSet(obj, prop, value)
  if not obj then return false end
  local ok = pcall(function() obj[prop] = value end)
  return ok
end

local function safeGetText(obj)
  local value = ""
  pcall(function() value = tostring(obj.Text or "") end)
  return value
end

local function safeSetText(obj, value)
  safeSet(obj, "Text", tostring(value or ""))
end

local function readIndex(edit)
  local n = nil
  pcall(function() n = tonumber(edit.Value) end)
  if n == nil then
    local txt = trim(safeGetText(edit))
    if txt ~= "" then n = tonumber(txt) end
  end
  if not n then return -1 end
  return math.floor(n)
end

local function setIndexText(edit, value)
  local n = tonumber(value)
  if n == nil then n = -1 end
  safeSet(edit, "MinValue", -1)
  safeSet(edit, "Value", math.floor(n))
  safeSetText(edit, tostring(math.floor(n)))
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
  local model = ctx.model
  local registry = ctx.registry
  if not model or not registry then return out end

  local root = nil
  local ok = pcall(function() root = model.getRoot(currentProject(ctx)) end)
  if not ok then root = nil end

  local function walk(n)
    if not n then return end
    if registry.isImageList and registry.isImageList(n.class) then
      table.insert(out, n)
    end
    for _, child in ipairs(n.items or {}) do walk(child) end
  end

  walk(root)
  return out
end

local function collectActions(ctx)
  local out = {}
  local model = ctx.model
  local registry = ctx.registry
  if not model or not registry then return out end

  local root = nil
  local ok = pcall(function() root = model.getRoot(currentProject(ctx)) end)
  if not ok then root = nil end

  local function walk(n)
    if not n then return end
    if registry.isActionList and registry.isActionList(n.class) then
      local actions = n.props and n.props.Actions or nil
      if type(actions) == "table" then
        for _, action in ipairs(actions) do
          if type(action) == "table" then
            local name = tostring(action.Name or action.name or "")
            if name ~= "" then
              table.insert(out, { name = name, caption = tostring(action.Caption or action.caption or name), actionList = n })
            end
          end
        end
      end
    end
    for _, child in ipairs(n.items or {}) do walk(child) end
  end

  walk(root)
  return out
end

local function askGlyphImageFile(ctx, seed)
  local VCL = ctx.VCL
  if not VCL or not VCL.OpenDialog then return nil end

  local dlg = VCL.OpenDialog()
  seed = seed or (ctx.getCurrentFileName and ctx.getCurrentFileName()) or ctx.defaultFormFile or "test_form.vclform"

  dlg._ = {
    title = "Select glyph image...",
    filename = pathBase(seed),
    initialdir = pathDir(seed),
    filter = "Images (*.png;*.jpg;*.jpeg;*.bmp;*.ico)|*.png;*.jpg;*.jpeg;*.bmp;*.ico|All files|*.*",
    options = "[ofViewDetail,ofFileMustExist,ofPathMustExist,ofEnableSizing]",
  }

  local fileName = nil
  local ok, res = pcall(function()
    return dlg:Execute()
  end)

  if ok and res then
    pcall(function() fileName = dlg.fileName end)
  end

  -- Keep consistent with the existing editor dialogs: do not Free native
  -- OpenDialog immediately from Linux/LCL dialog event paths.
  return fileName
end

local function selectedNode(ctx)
  if ctx and type(ctx.getSelectedNode) == "function" then
    local ok, n = pcall(ctx.getSelectedNode)
    if ok then return n end
  end
  return nil
end

local function refreshInspector(ctx, node)
  if ctx.inspector and selectedNode(ctx) == node then
    ctx.inspector.showNode(node)
  end
end

local function status(ctx, text)
  if ctx.setStatus then ctx.setStatus(text) end
end

local function applyGlyphFile(ctx, node, fileName, glyphEdit)
  node.props = node.props or {}
  node.props.GlyphFile = tostring(fileName or "")
  safeSetText(glyphEdit, node.props.GlyphFile)

  if ctx.runtime then
    ctx.runtime.applyNodeProperty(node, "GlyphFile", node.props.GlyphFile)
  end

  refreshInspector(ctx, node)

  if node.props.GlyphFile ~= "" then
    status(ctx, "Glyph loaded: " .. node.props.GlyphFile)
  else
    status(ctx, "Glyph cleared: " .. tostring(node.name or node.class))
  end
end

local function fillImageListCombo(ctx, cb, lists, currentName)
  comboClear(cb)
  comboAdd(cb, "(none)")

  local selected = 0
  currentName = tostring(currentName or "")

  for i, imgListNode in ipairs(lists) do
    local itemName = tostring(imgListNode.name or imgListNode.class or ("ImageList" .. i))
    local count = 0
    if imgListNode.props and type(imgListNode.props.Images) == "table" then
      count = #imgListNode.props.Images
    end

    comboAdd(cb, itemName .. "  (" .. tostring(count) .. ")")

    if itemName == currentName then
      selected = i
    end
  end

  pcall(function() cb.ItemIndex = selected end)
end

local function selectedImageListName(cb, lists)
  local idx = 0
  pcall(function() idx = tonumber(cb.ItemIndex) or 0 end)
  if idx <= 0 then return nil end
  return lists[idx] and lists[idx].name or nil
end

local function fillActionCombo(cb, actions, currentName)
  if not cb then return end
  comboClear(cb)
  comboAdd(cb, "(none)")
  local selected = 0
  currentName = tostring(currentName or "")
  for i, action in ipairs(actions or {}) do
    local text = tostring(action.name or "")
    if action.caption and action.caption ~= "" and action.caption ~= text then
      text = text .. "  -  " .. tostring(action.caption)
    end
    comboAdd(cb, text)
    if action.name == currentName then selected = i end
  end
  pcall(function() cb.ItemIndex = selected end)
end

local function selectedActionName(cb, actions)
  if not cb then return nil end
  local idx = 0
  pcall(function() idx = tonumber(cb.ItemIndex) or 0 end)
  if idx <= 0 then return nil end
  return actions[idx] and actions[idx].name or nil
end

local function ensureActionControls(ctx, form, ui)
  if ui.ActionCombo then return end
  local VCL = ctx and ctx.VCL
  if not VCL or not form then return end

  local lab = VCL.Label(form, "ActionLabel")
  lab._ = { Left = 14, Top = 190, Width = 70, Height = 20, Caption = "Action:" }
  local cb = VCL.ComboBox(form, "ActionCombo")
  cb._ = { Left = 84, Top = 186, Width = 270, Height = 28, Style = "csDropDownList" }
  ui.ActionLabel = lab
  ui.ActionCombo = cb

  if ui.ApplyButton then safeSet(ui.ApplyButton, "Top", 226) end
  if ui.CloseButton then safeSet(ui.CloseButton, "Top", 226) end
  if ui.ButtonImageEditorDialog then safeSet(ui.ButtonImageEditorDialog, "Height", 260) end
end

local function configureForClass(ui, className)
  if ui.ButtonImageEditorDialog then
    local caption = "BitBtn image/action editor"
    if className == "SpeedButton" then caption = "SpeedButton image/action editor" end
    if className == "EditButton" then caption = "EditButton image/action editor" end
    if className == "Button" then caption = "Button action editor" end
    ui.ButtonImageEditorDialog.Caption = caption
  end

  -- Index properties belong to the PropertyGrid now. Keep this dialog focused
  -- on image source / ImageList association only. The controls are hidden here
  -- to stay compatible with older .vclform files that still contain them.
  local names = {
    "ImageIndexLabel", "ImageIndexEdit",
    "DisabledIndexLabel", "DisabledIndexEdit",
    "HotIndexLabel", "HotIndexEdit",
    "PressedIndexLabel", "PressedIndexEdit",
    "SelectedIndexLabel", "SelectedIndexEdit",
  }
  for _, name in ipairs(names) do
    if ui[name] then
      safeSet(ui[name], "Visible", false)
      safeSet(ui[name], "Enabled", false)
    end
  end

  if className == "Button" then
    -- Plain Button action test: keep only the Action combo.  Image/Glyph fields
    -- remain the responsibility of controls that actually expose those props.
    for _, name in ipairs({
      "GlyphGroup", "GlyphFileLabel", "GlyphFileEdit", "LoadGlyphButton", "ClearGlyphButton",
      "ImageListGroup", "ImagesLabel", "ImagesCombo"
    }) do
      if ui[name] then
        safeSet(ui[name], "Visible", false)
        safeSet(ui[name], "Enabled", false)
      end
    end
    if ui.ApplyButton then safeSet(ui.ApplyButton, "Top", 92) end
    if ui.CloseButton then safeSet(ui.CloseButton, "Top", 92) end
    if ui.ButtonImageEditorDialog then safeSet(ui.ButtonImageEditorDialog, "Height", 132) end
    return
  end

  if ui.ImageListGroup then
    safeSet(ui.ImageListGroup, "Caption", "ImageList")
    safeSet(ui.ImageListGroup, "Height", 72)
  end
  if ui.ApplyButton then safeSet(ui.ApplyButton, "Top", 190) end
  if ui.CloseButton then safeSet(ui.CloseButton, "Top", 190) end
  if ui.ButtonImageEditorDialog then safeSet(ui.ButtonImageEditorDialog, "Height", 222) end
end

function M.open(ctx, node)
  if not ctx or not node then return false end
  if node.class ~= "Button" and node.class ~= "SpeedButton" and node.class ~= "BitBtn"
      and node.class ~= "EditButton" then return false end

  local loaded = formLoader.load("forms/button_image_editor.vclform")
  local form = loaded.form
  local ui = loaded.ui

  node.props = node.props or {}

  configureForClass(ui, node.class)
  ensureActionControls(ctx, form, ui)

  if ui.GlyphFileEdit then safeSetText(ui.GlyphFileEdit, node.props.GlyphFile or "") end

  local lists = collectImageLists(ctx)
  if ui.ImagesCombo then fillImageListCombo(ctx, ui.ImagesCombo, lists, node.props.Images) end

  local actions = collectActions(ctx)
  fillActionCombo(ui.ActionCombo, actions, node.props.Action)

  if node.class ~= "Button" and ui.LoadGlyphButton then
    ui.LoadGlyphButton.OnClick = function()
      local seed = safeGetText(ui.GlyphFileEdit)
      local fileName = askGlyphImageFile(ctx, seed)
      if fileName and tostring(fileName) ~= "" then
        applyGlyphFile(ctx, node, fileName, ui.GlyphFileEdit)
      end
    end
  end

  if node.class ~= "Button" and ui.ClearGlyphButton then
    ui.ClearGlyphButton.OnClick = function()
      applyGlyphFile(ctx, node, "", ui.GlyphFileEdit)
    end
  end

  ui.ApplyButton.OnClick = function()
    if node.class ~= "Button" then
      local imgListName = selectedImageListName(ui.ImagesCombo, lists)
      if imgListName and tostring(imgListName) ~= "" then
        node.props.Images = imgListName
      else
        node.props.Images = nil
      end
    end

    local actionName = selectedActionName(ui.ActionCombo, actions)
    if actionName and tostring(actionName) ~= "" then
      node.props.Action = actionName
    else
      node.props.Action = nil
    end

    if ctx.runtime then
      if node.class ~= "Button" then ctx.runtime.applyNodeProperty(node, "Images", node.props.Images) end
      ctx.runtime.applyNodeProperty(node, "Action", node.props.Action)
    end

    refreshInspector(ctx, node)
    status(ctx, "Button image/action source updated: " .. tostring(node.name or node.class))
  end

  pcall(function() ui.ApplyButton.Default = true end)
  pcall(function() ui.CloseButton.ModalResult = 1 end)
  pcall(function() ui.CloseButton.Cancel = true end)

  local ok, err = pcall(function()
    form:ShowModal()
  end)

  -- Keep the same conservative dialog lifecycle used by the existing Linux/LCL
  -- modal editors. No explicit Free here.
  if not ok then error(err) end
  return true
end

return M
