-- ***************************************
-- VCLua Form Editor - ListView image editor
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

local function comboIndex(cb)
  local idx = 0
  pcall(function() idx = tonumber(cb.ItemIndex) or 0 end)
  return idx
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

local function fillImageListCombo(cb, lists, currentName)
  comboClear(cb)
  comboAdd(cb, "(none)")
  local selectedIndex = 0

  for i, imgListNode in ipairs(lists or {}) do
    local itemName = tostring(imgListNode.name or imgListNode.class or ("ImageList" .. i))
    local count = 0
    if imgListNode.props and type(imgListNode.props.Images) == "table" then
      count = #imgListNode.props.Images
    end
    comboAdd(cb, itemName .. "  (" .. tostring(count) .. ")")
    if itemName == tostring(currentName or "") then
      selectedIndex = i
    end
  end

  pcall(function() cb.ItemIndex = selectedIndex end)
end

local function selectedImageListName(cb, lists)
  local idx = comboIndex(cb)
  if idx <= 0 then return nil end
  return lists[idx] and lists[idx].name or nil
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

local function configureForm(loaded, node)
  local ui = loaded.ui
  local form = loaded.form
  if ui.ListViewImagesEditorDialog then
    form = ui.ListViewImagesEditorDialog
  end
  if form then
    form.Caption = "ListView ImageLists - " .. tostring(node.name or "ListView")
  end
  return form, ui
end

function M.open(ctx, node)
  if not ctx or not node then return false end
  if not (node.class == "ListView") then return false end

  local loaded = formLoader.load("forms/listview_images_editor.vclform")
  local form, ui = configureForm(loaded, node)
  if not form then error("ListView Images editor form not found") end

  local cbSmallImages = ui.SmallImagesCombo
  local cbLargeImages = ui.LargeImagesCombo
  local cbStateImages = ui.StateImagesCombo
  local btnOK = ui.OkButton
  local btnCancel = ui.CancelButton

  node.props = node.props or {}

  local lists = collectImageLists(ctx)
  fillImageListCombo(cbSmallImages, lists, node.props.SmallImages)
  fillImageListCombo(cbLargeImages, lists, node.props.LargeImages)
  fillImageListCombo(cbStateImages, lists, node.props.StateImages)

  if btnOK then
    pcall(function() btnOK.ModalResult = MR_OK end)
    pcall(function() btnOK.Default = true end)
  end
  if btnCancel then
    pcall(function() btnCancel.ModalResult = MR_CANCEL end)
    pcall(function() btnCancel.Cancel = true end)
  end

  local ok, err = pcall(function() form:ShowModal() end)
  if not ok then error(err) end

  local mr = nil
  pcall(function() mr = form.ModalResult end)
  if tonumber(mr) ~= MR_OK then return true end

  local updates = {
    SmallImages = selectedImageListName(cbSmallImages, lists),
    LargeImages = selectedImageListName(cbLargeImages, lists),
    StateImages = selectedImageListName(cbStateImages, lists),
  }

  for propName, refName in pairs(updates) do
    if refName and tostring(refName) ~= "" then
      node.props[propName] = refName
    else
      node.props[propName] = nil
    end
    if ctx.runtime then
      ctx.runtime.applyNodeProperty(node, propName, node.props[propName])
    end
  end

  refreshInspector(ctx, node)
  status(ctx, "ListView ImageLists: Small=" .. tostring(node.props.SmallImages or "(none)") ..
    ", Large=" .. tostring(node.props.LargeImages or "(none)") ..
    ", State=" .. tostring(node.props.StateImages or "(none)"))

  return true
end

return M
