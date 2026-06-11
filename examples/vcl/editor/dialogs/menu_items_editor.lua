-- ***************************************
-- VCLua Form Editor - Menu editor
-- ***************************************

local formLoader = require "form_loader"

local M = {}

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

local function getListIndex(lb)
  local idx = -1
  pcall(function() idx = tonumber(lb.ItemIndex) or -1 end)
  return idx
end

local function setListIndex(lb, idx)
  pcall(function() lb.ItemIndex = idx end)
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
  local idx = 0
  if cb then pcall(function() idx = tonumber(cb.ItemIndex) or 0 end) end
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
  local model = ctx and ctx.model
  local registry = ctx and ctx.registry
  if not model or not registry then return out end

  local root = nil
  local ok = pcall(function() root = model.getRoot(currentProject(ctx)) end)
  if not ok then root = nil end

  local function walk(n)
    if not n then return end
    if registry.isImageList and registry.isImageList(n.class) then
      out[#out + 1] = n
    end
    for _, child in ipairs(n.items or {}) do walk(child) end
  end

  walk(root)
  return out
end

local function collectActions(ctx)
  local out = {}
  local model = ctx and ctx.model
  if not model then return out end

  local root = nil
  local ok = pcall(function() root = model.getRoot(currentProject(ctx)) end)
  if not ok then root = nil end

  local function walk(n)
    if not n then return end
    if n.class == "ActionList" and n.props and type(n.props.Actions) == "table" then
      for _, action in ipairs(n.props.Actions) do
        local name = tostring(action.Name or action.name or "")
        if name ~= "" then
          out[#out + 1] = { name = name, action = action, actionList = n }
        end
      end
    end
    for _, child in ipairs(n.items or {}) do walk(child) end
  end

  walk(root)
  return out
end

local function fillActionCombo(cb, actions, currentName)
  comboClear(cb)
  comboAdd(cb, "(none)")
  local selectedIndex = 0
  for i, rec in ipairs(actions or {}) do
    local name = tostring(rec.name or "")
    local caption = rec.action and tostring(rec.action.Caption or rec.action.caption or "") or ""
    if caption ~= "" and caption ~= name then
      comboAdd(cb, name .. "  (" .. caption .. ")")
    else
      comboAdd(cb, name)
    end
    if name == tostring(currentName or "") then selectedIndex = i end
  end
  pcall(function() cb.ItemIndex = selectedIndex end)
end

local function selectedActionName(cb, actions)
  local idx = comboIndex(cb)
  if idx <= 0 then return nil end
  return actions and actions[idx] and actions[idx].name or nil
end

local function findActionRecord(actions, name)
  name = tostring(name or "")
  if name == "" then return nil end
  for _, rec in ipairs(actions or {}) do
    if tostring(rec.name or "") == name then return rec end
  end
  return nil
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

local function setImageComboByName(cb, lists, name)
  if not cb then return false end
  name = tostring(name or "")
  if name == "" then
    pcall(function() cb.ItemIndex = 0 end)
    return true
  end
  for i, imgListNode in ipairs(lists or {}) do
    if tostring(imgListNode.name or "") == name then
      pcall(function() cb.ItemIndex = i end)
      return true
    end
  end
  return false
end

local function setText(ctrl, value)
  if not ctrl then return end
  pcall(function() ctrl.Text = tostring(value or "") end)
end

local function getText(ctrl, default)
  local v = default or ""
  if ctrl then pcall(function() v = ctrl.Text end) end
  if v == nil then v = default or "" end
  return tostring(v)
end


local function setChecked(ctrl, value)
  if not ctrl then return end
  pcall(function() ctrl.Checked = value and true or false end)
end

local function getChecked(ctrl, default)
  local v = default and true or false
  if ctrl then pcall(function() v = ctrl.Checked and true or false end) end
  return v and true or false
end

local function setNumber(ctrl, value)
  value = tonumber(value)
  if value == nil then value = -1 end
  if ctrl then
    local ok = pcall(function() ctrl.Value = value end)
    if not ok then pcall(function() ctrl.Text = tostring(value) end) end
  end
end

local function getNumber(ctrl, default)
  local v = tonumber(default)
  if v == nil then v = -1 end
  if ctrl then
    local ok = pcall(function() v = tonumber(ctrl.Value) or v end)
    if not ok then pcall(function() v = tonumber(ctrl.Text) or v end) end
  end
  return tonumber(v) or -1
end

local function cloneMenuItems(src)
  local dst = {}
  if type(src) ~= "table" then return dst end
  for i, item in ipairs(src) do
    local children = item.Items or item.items or item.Children or item.children or item.submenu or item.SubMenu
    dst[#dst + 1] = {
      Name = tostring(item.Name or item.name or ("miItem" .. tostring(i))),
      Caption = tostring(item.Caption or item.caption or item.Text or item.text or ("Item " .. tostring(i))),
      Enabled = item.Enabled ~= false,
      Checked = item.Checked == true,
      ImageIndex = tonumber(item.ImageIndex) or -1,
      Action = item.Action or item.action,
      Items = cloneMenuItems(children),
    }
  end
  return dst
end

local function normalizeMenuItems(src)
  local dst = {}
  if type(src) ~= "table" then return dst end
  for i, item in ipairs(src) do
    dst[#dst + 1] = {
      Name = tostring(item.Name or ("miItem" .. tostring(i))),
      Caption = tostring(item.Caption or ("Item " .. tostring(i))),
      Enabled = item.Enabled ~= false,
      Checked = item.Checked == true,
      ImageIndex = tonumber(item.ImageIndex) or -1,
      Action = item.Action or nil,
      Items = normalizeMenuItems(item.Items),
    }
  end
  return dst
end

local function writeModel(node, items)
  node.props = node.props or {}
  node.props.MenuItems = normalizeMenuItems(items)
  return true
end

local function displayText(entry, index)
  local item = entry and entry.item or {}
  local caption = tostring(item.Caption or "")
  if caption == "" then caption = tostring(item.Name or "") end
  if caption == "" then caption = "Item " .. tostring(index or "") end
  local name = tostring(item.Name or "")
  local indent = string.rep("  ", math.max(0, tonumber(entry and entry.level) or 0))
  if name ~= "" then
    return indent .. caption .. "  [" .. name .. "]"
  end
  return indent .. caption
end

local function buildFlat(items, out, level, parentItems)
  out = out or {}
  level = tonumber(level) or 0
  if type(items) ~= "table" then return out end
  for i, item in ipairs(items) do
    out[#out + 1] = {
      item = item,
      index = i,
      level = level,
      parentItems = parentItems or items,
    }
    buildFlat(item.Items, out, level + 1, item.Items or {})
  end
  return out
end

local function refreshList(ui, items, flat, selectedFlatIndex)
  if not ui or not ui.ItemsList then return flat or {} end
  flat = buildFlat(items, {}, 0, items)
  listClear(ui.ItemsList)
  for i, entry in ipairs(flat) do
    listAdd(ui.ItemsList, displayText(entry, i))
  end
  if selectedFlatIndex and selectedFlatIndex >= 1 and selectedFlatIndex <= #flat then
    setListIndex(ui.ItemsList, selectedFlatIndex - 1)
  else
    setListIndex(ui.ItemsList, -1)
  end
  return flat
end

local function loadSelectedToFields(ui, flat, selectedFlatIndex)
  local entry = flat and flat[selectedFlatIndex]
  local item = entry and entry.item
  if not item then
    setText(ui.NameEdit, "")
    setText(ui.CaptionEdit, "")
    setChecked(ui.EnabledCheck, true)
    setChecked(ui.CheckedCheck, false)
    setNumber(ui.ImageIndexEdit, -1)
    if ui.ActionCombo then pcall(function() ui.ActionCombo.ItemIndex = 0 end) end
    return
  end
  setText(ui.NameEdit, item.Name or "")
  setText(ui.CaptionEdit, item.Caption or "")
  setChecked(ui.EnabledCheck, item.Enabled ~= false)
  setChecked(ui.CheckedCheck, item.Checked == true)
  setNumber(ui.ImageIndexEdit, tonumber(item.ImageIndex) or -1)
  if ui.ActionCombo then
    fillActionCombo(ui.ActionCombo, M._currentActions or {}, item.Action)
  end
end


local function inheritActionImageToMenuItem(ui, item, actions, imageLists)
  if not item or not item.Action then return false end
  local rec = findActionRecord(actions, item.Action)
  if not rec or not rec.action then return false end

  local changed = false

  -- Inherits ImageIndex from the selected action when unset.
  local itemIndex = tonumber(item.ImageIndex)
  if itemIndex == nil then itemIndex = -1 end
  local actionIndex = tonumber(rec.action.ImageIndex or rec.action.imageIndex)
  if itemIndex < 0 and actionIndex ~= nil and actionIndex >= 0 then
    item.ImageIndex = actionIndex
    setNumber(ui.ImageIndexEdit, actionIndex)
    changed = true
  end

  -- Inherits the ActionList Images reference when the menu has none.
  local currentImages = selectedImageListName(ui.ImagesCombo, imageLists)
  local actionImages = rec.actionList and rec.actionList.props and rec.actionList.props.Images
  if (currentImages == nil or currentImages == "") and actionImages ~= nil and tostring(actionImages) ~= "" then
    if setImageComboByName(ui.ImagesCombo, imageLists, actionImages) then
      changed = true
    end
  end

  return changed
end

local function applyFieldsToSelected(ui, flat, selectedFlatIndex)
  local entry = flat and flat[selectedFlatIndex]
  local item = entry and entry.item
  if not item then return false end
  item.Name = getText(ui.NameEdit, item.Name or "")
  item.Caption = getText(ui.CaptionEdit, item.Caption or "")
  item.Enabled = getChecked(ui.EnabledCheck, item.Enabled ~= false)
  item.Checked = getChecked(ui.CheckedCheck, item.Checked == true)
  item.ImageIndex = getNumber(ui.ImageIndexEdit, tonumber(item.ImageIndex) or -1)
  item.Action = selectedActionName(ui.ActionCombo, M._currentActions or {})
  inheritActionImageToMenuItem(ui, item, M._currentActions or {}, M._currentImageLists or {})
  item.Items = item.Items or {}
  return true
end

function M.open(ctx, node)
  ctx = ctx or {}
  node = node or {}
  node.props = node.props or {}

  local loaded = formLoader.load("forms/menu_items_editor.vclform")
  local form = loaded and loaded.form
  local ui = loaded and loaded.ui or {}
  if not form then return false end

  local items = cloneMenuItems(node.props.MenuItems)
  local imageLists = collectImageLists(ctx)
  local actions = collectActions(ctx)
  M._currentImageLists = imageLists
  M._currentActions = actions

  pcall(function()
    form.Caption = "Menu editor - " .. tostring(node.name or node.class or "Menu")
  end)

  if ui.InfoLabel then
    pcall(function()
      ui.InfoLabel.Caption = "Menu editor: Images + Action combo. OK/Cancel only close."
    end)
  end

  fillImageListCombo(ui.ImagesCombo, imageLists, node.props.Images)
  fillActionCombo(ui.ActionCombo, actions, nil)

  local flat = {}
  local selectedFlatIndex = nil

  local function commitCurrentFieldsOnly()
    applyFieldsToSelected(ui, flat, selectedFlatIndex)
  end

  local function saveModelOnly()
    writeModel(node, items)
    node.props.Images = selectedImageListName(ui.ImagesCombo, imageLists)
    if ctx and ctx.runtime and type(ctx.runtime.applyNodeProperty) == "function" then
      pcall(function() ctx.runtime.applyNodeProperty(node, "Images", node.props.Images) end)
      pcall(function() ctx.runtime.applyNodeProperty(node, "MenuItems", node.props.MenuItems) end)
    end
  end

  local function selectFlatIndex(idx)
    -- Saves the previous row before changing selection.
    commitCurrentFieldsOnly()
    saveModelOnly()

    idx = tonumber(idx)
    if idx and idx >= 1 and idx <= #flat then
      selectedFlatIndex = idx
      setListIndex(ui.ItemsList, idx - 1)
    else
      selectedFlatIndex = nil
      setListIndex(ui.ItemsList, -1)
    end
    loadSelectedToFields(ui, flat, selectedFlatIndex)
  end

  local function rebuildList(keepIndex)
    flat = refreshList(ui, items, flat, keepIndex)
    if keepIndex and keepIndex >= 1 and keepIndex <= #flat then
      selectedFlatIndex = keepIndex
    elseif #flat > 0 then
      selectedFlatIndex = math.min(selectedFlatIndex or 1, #flat)
      setListIndex(ui.ItemsList, selectedFlatIndex - 1)
    else
      selectedFlatIndex = nil
      setListIndex(ui.ItemsList, -1)
    end
    loadSelectedToFields(ui, flat, selectedFlatIndex)
  end

  local function commitAndWrite()
    if applyFieldsToSelected(ui, flat, selectedFlatIndex) then
      -- Apply persists the model and refreshes the live menu.
      saveModelOnly()
      local idx = selectedFlatIndex
      rebuildList(idx)
      if ctx and type(ctx.setStatus) == "function" then
        pcall(function() ctx.setStatus("MenuItems applied: " .. tostring(#(node.props.MenuItems or {})) .. " root item(s)") end)
      end
      return true
    end
    if ctx and type(ctx.setStatus) == "function" then
      pcall(function() ctx.setStatus("MenuItems apply skipped: no selected item") end)
    end
    return false
  end

  rebuildList(#items > 0 and 1 or nil)

  if ui.ItemsList then
    ui.ItemsList.OnClick = function()
      local idx = getListIndex(ui.ItemsList) + 1
      selectFlatIndex(idx)
    end
  end

  if ui.ImagesCombo then
    ui.ImagesCombo.OnChange = function()
      commitCurrentFieldsOnly()
      saveModelOnly()
    end
  end

  if ui.AddButton then
    ui.AddButton.OnClick = function()
      local n = #items + 1
      items[n] = {
        Name = "miItem" .. tostring(n),
        Caption = "Item " .. tostring(n),
        Enabled = true,
        Checked = false,
        ImageIndex = -1,
        Action = nil,
        Items = {},
      }
      saveModelOnly()
      rebuildList(nil)
      selectFlatIndex(#flat)
    end
  end

  if ui.AddChildButton then
    ui.AddChildButton.OnClick = function()
      local entry = flat and flat[selectedFlatIndex]
      if not entry or not entry.item then
        if ctx and type(ctx.setStatus) == "function" then
          pcall(function() ctx.setStatus("Add child skipped: no selected item") end)
        end
        return
      end
      local parent = entry.item
      parent.Items = parent.Items or {}
      local n = #parent.Items + 1
      parent.Items[n] = {
        Name = tostring(parent.Name or "miItem") .. "Child" .. tostring(n),
        Caption = "Child " .. tostring(n),
        Enabled = true,
        Checked = false,
        ImageIndex = -1,
        Action = nil,
        Items = {},
      }
      saveModelOnly()
      rebuildList(nil)
      local child = parent.Items[n]
      for i, e in ipairs(flat) do
        if e.item == child then
          selectFlatIndex(i)
          break
        end
      end
    end
  end

  if ui.DeleteButton then
    ui.DeleteButton.OnClick = function()
      local entry = flat and flat[selectedFlatIndex]
      if not entry or not entry.parentItems or not entry.index then
        if ctx and type(ctx.setStatus) == "function" then
          pcall(function() ctx.setStatus("Delete skipped: no selected item") end)
        end
        return
      end
      local parentItems = entry.parentItems
      local removeIndex = tonumber(entry.index)
      if removeIndex and removeIndex >= 1 and removeIndex <= #parentItems then
        table.remove(parentItems, removeIndex)
        saveModelOnly()
        rebuildList(nil)
        local nextIndex = math.min(selectedFlatIndex or 1, #flat)
        if nextIndex >= 1 then selectFlatIndex(nextIndex) else loadSelectedToFields(ui, flat, nil) end
      end
    end
  end

  if ui.MoveUpButton then
    ui.MoveUpButton.OnClick = function()
      commitCurrentFieldsOnly()
      local entry = flat and flat[selectedFlatIndex]
      if not entry or not entry.parentItems or not entry.index then return end
      local parentItems = entry.parentItems
      local i = tonumber(entry.index)
      if not i or i <= 1 or i > #parentItems then return end
      parentItems[i - 1], parentItems[i] = parentItems[i], parentItems[i - 1]
      local moved = parentItems[i - 1]
      saveModelOnly()
      rebuildList(nil)
      for flatIndex, e in ipairs(flat) do
        if e.item == moved then selectFlatIndex(flatIndex); break end
      end
    end
  end

  if ui.MoveDownButton then
    ui.MoveDownButton.OnClick = function()
      commitCurrentFieldsOnly()
      local entry = flat and flat[selectedFlatIndex]
      if not entry or not entry.parentItems or not entry.index then return end
      local parentItems = entry.parentItems
      local i = tonumber(entry.index)
      if not i or i < 1 or i >= #parentItems then return end
      parentItems[i], parentItems[i + 1] = parentItems[i + 1], parentItems[i]
      local moved = parentItems[i + 1]
      saveModelOnly()
      rebuildList(nil)
      for flatIndex, e in ipairs(flat) do
        if e.item == moved then selectFlatIndex(flatIndex); break end
      end
    end
  end

  if ui.ApplyButton then
    ui.ApplyButton.OnClick = function()
      commitAndWrite()
    end
  end

  -- OK and Cancel only close the modal dialog.
  form:ShowModal()

  return true
end

return M
