-- ***************************************
-- VCLua Form tool
-- Copyright (C) 2013-2026 Hi-Project Ltd.
-- ***************************************
-- Builds the live VCL object tree from the model.

local util = require "util"
local registry = require "registry"
local model = require "model"
local VCL = rawget(_G, "VCL") or require "vcl"

local M = {}

local drag = nil

M.options = {
  snapToGrid = false,
  showGrid = true,
  gridSize = 8,
  gridShape = "dot",
  gridColor = 0x00A0A0A0,
  gridMajorEvery = 5,
  gridMajorColor = 0x00606060,
  backgroundColor = "clBtnFace",
  moveColor = "clHighlight",
  resizeColor = "clRed",
  frameThickness = 2,
}

local function designRootColor(rt)
  local formNode = rt and rt.project and rt.project.forms and rt.project.forms[1]
  if formNode and formNode.props and formNode.props.Color ~= nil then
    return formNode.props.Color
  end
  return M.options.backgroundColor or "clBtnFace"
end

local drawDottedGrid

local function invalidateGrid(rt)
  if not rt then return end
  if rt.designRoot then
    pcall(function() rt.designRoot.Color = designRootColor(rt) end)
  end

  local seen = {}
  local function invalidateOne(obj)
    if not obj then return end
    local key = nil
    pcall(function() key = obj.Handle end)
    key = key or tostring(obj)
    if seen[key] then return end
    seen[key] = true
    pcall(function() obj:Invalidate() end)
    pcall(function() obj:Repaint() end)
    -- Some widgetset controls (notably GroupBox / RadioGroup) do not reliably
    -- repaint through OnPaint when used as normal LCL controls.  Draw once
    -- after repaint as a fallback; child windowed controls remain above it.
    pcall(function() drawDottedGrid(obj) end)
  end

  invalidateOne(rt.designRoot)

  for _, obj in ipairs(rt.gridPaintObjects or {}) do
    invalidateOne(obj)
  end
end

local function setGridRuntimeVisible(rt, visible, repaint)
  if repaint then invalidateGrid(rt) end
end

function M.setOptions(opts)
  opts = opts or {}
  for k, v in pairs(opts) do M.options[k] = v end
  invalidateGrid(M.current)
end

local function snapValue(v)
  v = tonumber(v) or 0
  if not M.options.snapToGrid then return math.floor(v + 0.5) end
  local g = tonumber(M.options.gridSize) or 8
  if g < 1 then g = 1 end
  return math.floor((v + g / 2) / g) * g
end

local function snapSize(v)
  return math.max(12, snapValue(v))
end

local function clearRuntime(rt)
  if rt and rt.designRoot and rt.designRoot.Free then
    pcall(function() rt.designRoot:Free() end)
  end
end


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

local function applyStringCollection(obj, propName, values)
  if not obj or not propName then return false end
  values = values or {}
  local owned = {}
  for i, v in ipairs(values) do owned[i] = tostring(v or "") end
  values = owned

  local stringsObj = nil
  pcall(function() stringsObj = obj[propName] end)
  if stringsObj then
    clearStrings(stringsObj)
    for _, line in ipairs(values) do addString(stringsObj, line) end
    if propName == "Lines" then
      pcall(function() obj.Text = table.concat(values, "\n") end)
    end
    return true
  end

  local okAssign = pcall(function() obj[propName] = values end)
  if okAssign then
    if propName == "Lines" then pcall(function() obj.Text = table.concat(values, "\n") end) end
    return true
  end
  return false
end


local function splitTextLines(text)
  local out = {}
  text = tostring(text or ""):gsub("\r\n", "\n"):gsub("\r", "\n")
  text = text:gsub("\n$", "")
  if text == "" then return out end
  for line in (text .. "\n"):gmatch("(.-)\n") do
    table.insert(out, line)
  end
  return out
end

local function readStringCollection(obj, propName)
  if not obj or not propName then return nil end
  local stringsObj = nil
  local ok = pcall(function() stringsObj = obj[propName] end)
  if not ok or stringsObj == nil then return nil end

  if type(stringsObj) == "table" and not stringsObj.Handle then
    local out = {}
    for i, v in ipairs(stringsObj) do out[i] = tostring(v or "") end
    return out
  end

  local text = nil
  ok = pcall(function() text = stringsObj.Text end)
  if ok and text ~= nil then return splitTextLines(text) end

  local count = nil
  pcall(function() count = tonumber(stringsObj.Count) end)
  if count and count >= 0 then
    local out = {}
    for i = 0, count - 1 do
      local v = nil
      if v == nil then pcall(function() v = stringsObj.Strings[i] end) end
      if v == nil then pcall(function() v = stringsObj[i] end) end
      if v == nil then pcall(function() v = stringsObj:Get(i) end) end
      if v == nil then pcall(function() v = stringsObj:GetString(i) end) end
      table.insert(out, tostring(v or ""))
    end
    return out
  end

  text = nil
  ok = pcall(function() text = obj.Text end)
  if ok and text ~= nil and propName == "Lines" then return splitTextLines(text) end
  return nil
end

function M.syncStringCollections(node)
  local rt = M.current
  if not rt or not node then return end
  local function walk(n)
    local obj = rt.byNode and rt.byNode[n]
    local meta = registry.collectionsFor(n.class) or {}
    for propName, typ in pairs(meta) do
      if typ == "strings" and obj then
        local values = readStringCollection(obj, propName)
        if values then
          n.collections = n.collections or {}
          local copy = {}
          for i, v in ipairs(values) do copy[i] = tostring(v or "") end
          n.collections[propName] = copy
        end
      end
    end
    for _, child in ipairs(n.items or {}) do walk(child) end
  end
  walk(node)
end

local function applyCollections(obj, node)
  if not obj or not node then return end
  local cols = node.collections or {}
  local meta = registry.collectionsFor(node.class) or {}
  for propName, values in pairs(cols) do
    local typ = meta[propName] or "strings"
    if typ == "strings" and type(values) == "table" then
      applyStringCollection(obj, propName, values)
      if propName == "Lines" then
        pcall(function() obj.Text = table.concat(values, "\n") end)
      end
    end
  end
end

function M.applyNodeCollections(node)
  local rt = M.current
  if not rt or not node then return false end
  local obj = rt.byNode[node]
  if not obj then return false end
  applyCollections(obj, node)
  return true
end


-- Runtime-only props that cannot be assigned directly from serialized values.
-- ImageList.Images is stored as a file list in the model, but the live ImageList
-- must be filled through the VCL helper. Component reference props such as
-- SpeedButton.Images are stored as component names, but the live property expects
-- the actual TObject.
local function componentRefPropsForNode(node)
  if not node then return nil end
  if registry.componentRefProps then return registry.componentRefProps(node.class) end
  return nil
end

local function imageListFilesPropertyForNode(node)
  if not node then return nil end
  if registry.imageListFilesProperty then return registry.imageListFilesProperty(node.class) end
  return nil
end

local function isImageListFilesProp(node, prop, value)
  local fileProp = imageListFilesPropertyForNode(node)
  return fileProp ~= nil and prop == fileProp and type(value) == "table"
end

local function isImagePictureFileProp(node, prop, value)
  if not node or node.class ~= "Image" then return false end
  return prop == "PictureFile" or prop == "ImageFile"
end

local function isGlyphFileProp(node, prop)
  if not node then return false end
  if node.class ~= "SpeedButton" and node.class ~= "BitBtn"
      and node.class ~= "EditButton" then
    return false
  end
  return prop == "GlyphFile"
end

local function isFormIconFileProp(node, prop)
  return node and node.class == "Form" and prop == "IconFile"
end

local function designPropValue(node, prop, value)
  -- Designer surface only: a csDropDownList ComboBox opens a native popup and
  -- can eat designer mouse/drag events. Do not let the live design instance be
  -- created with csDropDownList at all; keep node.props.Style unchanged so save
  -- and runtime/dialog loading still use the real value.
  if node and node.class == "ComboBox" and prop == "Style" then
    if tostring(value or "") == "csDropDownList" then
      return "csDropDown"
    end
  end
  return value
end

local function propsForDirectApply(node)
  local props = node and node.props or {}
  local refs = componentRefPropsForNode(node) or {}
  local out = {}
  for k, v in pairs(props or {}) do
    if k ~= "MenuItems"
        and not (refs[k] and type(v) == "string")
        and not ((node.class == "Button" or node.class == "SpeedButton" or node.class == "BitBtn" or node.class == "ToolButton" or node.class == "EditButton") and k == "Action" and type(v) == "string")
        and not isImageListFilesProp(node, k, v)
        and not isImagePictureFileProp(node, k, v)
        and not isGlyphFileProp(node, k)
        and not isFormIconFileProp(node, k) then
      out[k] = designPropValue(node, k, v)
    end
  end
  return out
end

local function loadImageListFilesToObject(obj, node, owner)
  if not obj or not node then return false end
  local propName = imageListFilesPropertyForNode(node)
  if not propName then return false end
  local files = node.props and node.props[propName] or nil

  if type(files) ~= "table" then
    pcall(function() obj:Clear() end)
    pcall(function() obj.Clear(obj) end)
    if VCL and VCL.ImageListClearKeepAlive then
      pcall(function() VCL.ImageListClearKeepAlive(obj) end)
    end
    return true
  end

  if not (VCL and VCL.ImageListLoadFiles) then
    print("[ImageList] helper missing: VCL.ImageListLoadFiles")
    return false
  end

  local ok, added = pcall(function()
    return VCL.ImageListLoadFiles(obj, files, owner or obj)
  end)
  if ok then
    return true
  end
  print("[ImageList] load failed:", tostring(node.name or node.class), tostring(added))
  return false
end

local function clearImagePicture(obj)
  if not obj then return false end
  local ok = false
  local pic = nil
  pcall(function() pic = obj.Picture end)
  if not pic then pcall(function() pic = obj.picture end) end
  if pic then
    ok = pcall(function() pic:Clear() end) or ok
    ok = pcall(function() pic.Clear(pic) end) or ok
  end
  pcall(function() obj:Invalidate() end)
  pcall(function() obj:Repaint() end)
  return ok
end

local function loadImageFileToObject(obj, node)
  if not obj or not node or node.class ~= "Image" then return false end
  local props = node.props or {}
  local fileName = props.PictureFile
  if fileName == nil or tostring(fileName) == "" then fileName = props.ImageFile end

  if fileName == nil or tostring(fileName) == "" then
    clearImagePicture(obj)
    return true
  end

  local okLoad = false
  local err = nil
  if VCL and VCL.LoadImageFromFile then
    okLoad, err = VCL.LoadImageFromFile(obj, tostring(fileName))
  end

  if not okLoad then
    -- Fallback for older helper layer: use TImage.Picture.LoadFromFile directly.
    local pic = nil
    pcall(function() pic = obj.Picture end)
    if not pic then pcall(function() pic = obj.picture end) end
    if pic then
      okLoad, err = pcall(function() return pic:LoadFromFile(tostring(fileName)) end)
      if not okLoad then okLoad, err = pcall(function() return pic.LoadFromFile(pic, tostring(fileName)) end) end
    else
      err = "Image control has no Picture property"
    end
  end

  if okLoad then
    pcall(function() obj:Invalidate() end)
    pcall(function() obj:Repaint() end)
    return true
  end

  print("[Image] load failed:", tostring(node.name or node.class), tostring(fileName), tostring(err))
  return false
end

local function loadGlyphFileToObject(obj, node)
  if not obj or not node or not isGlyphFileProp(node, "GlyphFile") then
    return false
  end

  local fileName = node.props and node.props.GlyphFile or nil
  if fileName == nil or tostring(fileName) == "" then
    if VCL and VCL.ClearGlyph then
      pcall(function() VCL.ClearGlyph(obj) end)
    end
    return true
  end

  if not VCL or not VCL.LoadGlyphFromFile then return false end

  local ok, err = VCL.LoadGlyphFromFile(obj, tostring(fileName))
  if not ok then
    print("[Glyph] load failed:", tostring(node.name or node.class), tostring(fileName), tostring(err))
    return false
  end

  pcall(function() obj:Invalidate() end)
  pcall(function() obj:Repaint() end)
  return true
end

local function loadIconFileToForm(obj, node)
  if not obj or not isFormIconFileProp(node, "IconFile") then return false end

  local fileName = node.props and node.props.IconFile or nil
  if fileName == nil or tostring(fileName) == "" then return false end

  local ok, err = pcall(function()
    if obj.Icon and obj.Icon.LoadFromFile then
      obj.Icon:LoadFromFile(tostring(fileName))
    else
      error("Form has no Icon.LoadFromFile")
    end
  end)

  if not ok then
    print("[Icon] load failed:", tostring(node.name or node.class), tostring(fileName), tostring(err))
    return false
  end

  pcall(function() obj:Invalidate() end)
  pcall(function() obj:Repaint() end)
  return true
end

local function findLiveObjectByName(rt, name, expectedClass)
  if not rt or name == nil then return nil end
  name = tostring(name or "")
  if name == "" then return nil end
  for n, obj in pairs(rt.byNode or {}) do
    if n and obj and tostring(n.name or "") == name then
      if not expectedClass or expectedClass == "" or n.class == expectedClass then
        return obj, n
      end
    end
  end
  for n, obj in pairs(rt.byNode or {}) do
    if n and obj and tostring(n.name or "") == name then return obj, n end
  end
  return nil
end

local applyComponentRefsForNode

local function reapplyImageIndexes(obj, node)
  if not obj or not node or not node.props then return end
  local indexProps = {
    "ImageIndex", "DisabledImageIndex", "HotImageIndex", "PressedImageIndex",
    "SelectedImageIndex", "StateIndex", "OverlayIndex",
  }
  for _, prop in ipairs(indexProps) do
    local v = node.props[prop]
    if v ~= nil then pcall(function() obj[prop] = v end) end
  end
  pcall(function() obj:Invalidate() end)
  pcall(function() obj:Repaint() end)
  pcall(function() obj.Parent:Invalidate() end)
  pcall(function() obj.Parent:Repaint() end)
end

local function imageListFileAtIndex(imageListNode, index)
  if not imageListNode or not imageListNode.props then return nil end
  local files = imageListNode.props.Images
  if type(files) ~= "table" then return nil end
  local n = tonumber(index)
  if n == nil or n < 0 then return nil end
  return files[math.floor(n) + 1]
end

local function applyGlyphFromImageListFile(rt, node)
  if not rt or not node or not node.props then return false end
  local imageWidth = tonumber(node.props.ImageWidth)
  if imageWidth and imageWidth > 0 then return false end

  local obj = rt.byNode and rt.byNode[node]
  if not obj then return false end

  local supportsGlyph = node.class == "SpeedButton" or node.class == "BitBtn"
  if not supportsGlyph then
    supportsGlyph = pcall(function() local _ = obj.Glyph end)
  end
  if not supportsGlyph then return false end

  local imageListName = node.props.Images
  if type(imageListName) ~= "string" or imageListName == "" then
    if node.props.GlyphFile == nil or tostring(node.props.GlyphFile or "") == "" then
      if VCL and VCL.ClearGlyph then pcall(function() VCL.ClearGlyph(obj) end) end
    end
    return false
  end

  local _, imageListNode = findLiveObjectByName(rt, imageListName, "ImageList")
  local fileName = imageListFileAtIndex(imageListNode, node.props.ImageIndex)
  if not fileName or tostring(fileName) == "" then return false end

  if VCL and VCL.LoadGlyphFromFile then
    local ok = false
    pcall(function() ok = VCL.LoadGlyphFromFile(obj, tostring(fileName)) end)
    if ok then
      pcall(function() obj:Invalidate() end)
      pcall(function() obj:Repaint() end)
      pcall(function() obj.Parent:Invalidate() end)
      pcall(function() obj.Parent:Repaint() end)
      return true
    end
  end
  return false
end

local function refreshImageListConsumers(rt, imageListNode)
  if not rt or not imageListNode then return end
  local imageListName = tostring(imageListNode.name or "")
  if imageListName == "" then return end

  for node, _ in pairs(rt.byNode or {}) do
    if node and node.props then
      local refs = componentRefPropsForNode(node)
      local usesChangedList = false
      if refs then
        for prop, expectedClass in pairs(refs) do
          if expectedClass == "ImageList" and node.props[prop] == imageListName then
            usesChangedList = true
            break
          end
        end
      end

      if usesChangedList then
        applyComponentRefsForNode(rt, node)
        applyGlyphFromImageListFile(rt, node)
      end
    end
  end
end

applyComponentRefsForNode = function(rt, node)
  if not rt or not node then return end
  local refs = componentRefPropsForNode(node)
  if not refs then return end
  local obj = rt.byNode and rt.byNode[node]
  if not obj then return end
  local props = node.props or {}

  for prop, expectedClass in pairs(refs) do
    local value = props[prop]
    if value == nil or value == "" then
      pcall(function() obj[prop] = nil end)
    elseif type(value) == "string" then
      local target = findLiveObjectByName(rt, value, expectedClass)
      if target then
        local ok, err = pcall(function() obj[prop] = target end)
        if not ok then print("component ref failed:", prop, tostring(value), tostring(err)) end
      else
        print("component ref unresolved:", prop, tostring(value))
      end
    else
      local ok, err = pcall(function() obj[prop] = value end)
      if not ok then print("component ref failed:", prop, tostring(err)) end
    end
  end

  -- LCL controls may already have ImageIndex set before Images is assigned.
  -- Reassigning the indexes after the ImageList object is connected refreshes
  -- SpeedButton/BitBtn/ToolButton/ListView/TreeView images reliably.
  reapplyImageIndexes(obj, node)
end

local function applyAllComponentRefs(rt)
  if not rt or not rt.project then return end
  local function walk(node)
    applyComponentRefsForNode(rt, node)
    for _, child in ipairs(node.items or {}) do walk(child) end
  end
  for _, formNode in ipairs(rt.project.forms or {}) do walk(formNode) end
end



local function listLiveProperties(obj)
  if not obj or not VCL or not VCL.ListProperties then return nil end
  local ok, props = pcall(function() return VCL.ListProperties(obj) end)
  if ok and type(props) == "table" then return props end
  return nil
end

local function hasLiveProperty(obj, propName)
  if not obj or not propName then return false end
  local props = listLiveProperties(obj)
  if type(props) == "table" then
    if props[propName] ~= nil then return true end
    local want = tostring(propName):lower()
    for k, _ in pairs(props) do
      if tostring(k):lower() == want then return true end
    end
    return false
  end
  local ok = pcall(function() local _ = obj[propName] end)
  return ok and true or false
end

local function setLivePropertyIfExists(obj, propName, value)
  if not hasLiveProperty(obj, propName) then return false end
  local ok = pcall(function() obj[propName] = value end)
  return ok and true or false
end

local function isActionBindableButtonNode(node)
  return node and (node.class == "Button" or node.class == "SpeedButton" or node.class == "BitBtn" or node.class == "ToolButton" or node.class == "EditButton")
end

local function actionListActionsOf(node)
  if not node or not node.props then return {} end
  local actions = node.props.Actions or node.props.actions
  if type(actions) ~= "table" then return {} end
  return actions
end

local function actionValueOf(item, primary, fallback, default)
  if type(item) ~= "table" then return default end
  local v = item[primary]
  if v == nil and fallback then v = item[fallback] end
  if v == nil then return default end
  return v
end

local function actionPropsForItem(item)
  local out = {}
  if type(item) ~= "table" then return out end

  local name = actionValueOf(item, "Name", "name", "")
  local caption = actionValueOf(item, "Caption", "caption", name)
  local hint = actionValueOf(item, "Hint", "hint", "")
  local imageIndex = actionValueOf(item, "ImageIndex", "imageIndex", -1)
  local enabled = actionValueOf(item, "Enabled", "enabled", true)
  local checked = actionValueOf(item, "Checked", "checked", false)
  local shortcut = actionValueOf(item, "ShortCut", "shortcut", nil)
  if shortcut == nil then shortcut = actionValueOf(item, "Shortcut", nil, nil) end

  out.Name = tostring(name or "")
  out.Caption = tostring(caption or "")
  out.Hint = tostring(hint or "")
  out.ImageIndex = tonumber(imageIndex) or -1
  out.Enabled = enabled and true or false
  out.Checked = checked and true or false
  if shortcut ~= nil and tostring(shortcut or "") ~= "" then
    out.ShortCut = shortcut
  end
  return out
end

local function applyActionProps(actionObj, props)
  if not actionObj or type(props) ~= "table" then return end
  local aliases = {
    Name = "name",
    Caption = "caption",
    Hint = "hint",
    ImageIndex = "imageindex",
    Enabled = "enabled",
    Checked = "checked",
    ShortCut = "shortcut",
  }
  for k, v in pairs(props) do
    local ok = pcall(function() actionObj[k] = v end)
    if (not ok) and aliases[k] then
      pcall(function() actionObj[aliases[k]] = v end)
    end
  end
end

local function clearActionListObject(actionListObj, keepAlive)
  if not actionListObj then return end

  local actionsObj = nil
  pcall(function() actionsObj = actionListObj.Actions end)
  if actionsObj then
    pcall(function() actionsObj:Clear() end)
    pcall(function() actionsObj.Clear(actionsObj) end)
  end

  if type(keepAlive) == "table" then
    for _, oldAction in ipairs(keepAlive) do
      local a = oldAction
      if type(oldAction) == "table" then a = oldAction.action end
      if a then pcall(function() a:Free() end) end
    end
  end
end

local function createActionForList(actionListObj, props)
  local a = nil
  local ok, err = pcall(function() a = VCL.Action(actionListObj) end)
  if not ok or not a then
    ok, err = pcall(function() a = VCL.Action() end)
  end
  if not ok or not a then return nil, err end

  applyActionProps(a, props)

  local lower = {
    name = props.Name,
    caption = props.Caption,
    hint = props.Hint,
    imageindex = props.ImageIndex,
    enabled = props.Enabled,
    checked = props.Checked,
  }
  if props.ShortCut ~= nil then lower.shortcut = props.ShortCut end
  pcall(function() a._ = lower end)

  local name = tostring(props.Name or "")
  if name ~= "" then
    pcall(function() actionListObj[name] = a end)
  end

  local added = false
  local actionsObj = nil
  pcall(function() actionsObj = actionListObj.Actions end)
  if actionsObj then
    added = pcall(function() actionsObj:Add(a) end) or added
    added = pcall(function() actionsObj.Add(actionsObj, a) end) or added
  end
  if not added then
    pcall(function() actionListObj:Add(a) end)
    pcall(function() actionListObj.Add(actionListObj, a) end)
  end

  return a
end

local function applyActionsForNode(rt, node)
  if not rt or not node or node.class ~= "ActionList" then return false end
  local listObj = rt.byNode and rt.byNode[node]
  if not listObj then return false end

  rt.actionKeepAlive = rt.actionKeepAlive or {}
  rt.actionsByName = rt.actionsByName or {}
  rt.actionMetaByName = rt.actionMetaByName or {}

  -- Remove previously registered action names owned by this ActionList node.
  if rt.actionKeepAlive[node] then
    for _, rec in ipairs(rt.actionKeepAlive[node]) do
      if type(rec) == "table" and rec.name then
        rt.actionsByName[rec.name] = nil
        rt.actionMetaByName[rec.name] = nil
      end
    end
  end

  clearActionListObject(listObj, rt.actionKeepAlive[node])
  rt.actionKeepAlive[node] = {}

  for _, item in ipairs(actionListActionsOf(node)) do
    if type(item) == "table" then
      local props = actionPropsForItem(item)
      if props.Name ~= "" or props.Caption ~= "" then
        local a, err = createActionForList(listObj, props)
        if a then
          local actionName = tostring(props.Name or "")
          table.insert(rt.actionKeepAlive[node], { action = a, name = actionName })
          if actionName ~= "" then
            rt.actionsByName[actionName] = a
            rt.actionMetaByName[actionName] = { props = props, actionListNode = node, actionListObj = listObj }
          end
        else
          print("action create failed:", tostring(props.Name or props.Caption or ""), tostring(err))
        end
      end
    end
  end
  return true
end

local function applyAllActions(rt)
  if not rt or not rt.project then return end
  rt.actionsByName = {}
  rt.actionMetaByName = {}
  local function walk(node)
    applyActionsForNode(rt, node)
    for _, child in ipairs(node.items or {}) do walk(child) end
  end
  for _, formNode in ipairs(rt.project.forms or {}) do walk(formNode) end
end

local function imageListNameForActionMeta(meta)
  if not meta or not meta.actionListNode or not meta.actionListNode.props then return nil end
  local name = meta.actionListNode.props.Images
  if type(name) == "string" and name ~= "" then return name end
  return nil
end

local function loadButtonGlyphFromImageList(rt, node, imageListName, imageIndex)
  if not rt or not node then return false end
  local imageWidth = tonumber(node.props and node.props.ImageWidth)
  if imageWidth and imageWidth > 0 then return false end
  if node.class ~= "SpeedButton" and node.class ~= "BitBtn" and node.class ~= "EditButton" then return false end
  local obj = rt.byNode and rt.byNode[node]
  if not obj then return false end
  local _, imageListNode = findLiveObjectByName(rt, imageListName, "ImageList")
  local fileName = imageListFileAtIndex(imageListNode, imageIndex)
  if not fileName or tostring(fileName) == "" then return false end
  if VCL and VCL.LoadGlyphFromFile then
    local ok = false
    pcall(function() ok = VCL.LoadGlyphFromFile(obj, tostring(fileName)) end)
    if ok then
      pcall(function() obj:Invalidate() end)
      pcall(function() obj:Repaint() end)
      pcall(function() obj.Parent:Invalidate() end)
      pcall(function() obj.Parent:Repaint() end)
      return true
    end
  end
  return false
end

local function applyActionBindingForNode(rt, node)
  if not rt or not node or not node.props then return false end
  if not isActionBindableButtonNode(node) then return false end
  local obj = rt.byNode and rt.byNode[node]
  if not obj then return false end

  local actionName = node.props.Action
  if type(actionName) ~= "string" or actionName == "" then
    if hasLiveProperty(obj, "Action") then pcall(function() obj.Action = nil end) end
    applyComponentRefsForNode(rt, node)
    if node.class == "SpeedButton" or node.class == "BitBtn" or node.class == "EditButton" then
      applyGlyphFromImageListFile(rt, node)
    end
    return true
  end

  local actionObj = rt.actionsByName and rt.actionsByName[actionName] or nil
  local meta = rt.actionMetaByName and rt.actionMetaByName[actionName] or nil

  if hasLiveProperty(obj, "Action") then
    pcall(function() obj.Action = nil end)
  end
  local props = meta and meta.props or nil
  if props then
    setLivePropertyIfExists(obj, "Caption", props.Caption)
    setLivePropertyIfExists(obj, "Hint", props.Hint)
    setLivePropertyIfExists(obj, "Enabled", props.Enabled)
    setLivePropertyIfExists(obj, "Checked", props.Checked)

    local imageListName = imageListNameForActionMeta(meta)
    local imageIndex = tonumber(props.ImageIndex) or -1
    if imageListName and imageIndex >= 0 then
      local imageListObj = findLiveObjectByName(rt, imageListName, "ImageList")
      if imageListObj then
        if node.class == "ToolButton" then
          local parentObj = nil
          pcall(function() parentObj = obj.Parent end)
          if parentObj then setLivePropertyIfExists(parentObj, "Images", imageListObj) end
        else
          setLivePropertyIfExists(obj, "Images", imageListObj)
        end
      end
      setLivePropertyIfExists(obj, "ImageIndex", imageIndex)
      if node.class == "SpeedButton" or node.class == "BitBtn" or hasLiveProperty(obj, "Glyph") then
        loadButtonGlyphFromImageList(rt, node, imageListName, imageIndex)
      end
    end
  end

  pcall(function() obj:Invalidate() end)
  pcall(function() obj:Repaint() end)
  return true
end

local function applyAllActionBindings(rt)
  if not rt or not rt.project then return end
  local function walk(node)
    applyActionBindingForNode(rt, node)
    for _, child in ipairs(node.items or {}) do walk(child) end
  end
  for _, formNode in ipairs(rt.project.forms or {}) do walk(formNode) end
end


-- Builds real runtime MenuItem trees from node.props.MenuItems.
-- Kept deliberately independent from dialog close: callers can refresh while
-- the editor dialog is still open (Apply/Add/Add child), but should not call it
-- from OK/Cancel close handling.
local function menuChildrenOf(item)
  if type(item) ~= "table" then return {} end
  local children = item.Items or item.items or item.Children or item.children or item.submenu or item.SubMenu
  if type(children) ~= "table" then return {} end
  return children
end

local function menuCaptionOf(item)
  if type(item) ~= "table" then return "" end
  local v = item.Caption
  if v == nil then v = item.caption end
  if v == nil then v = item.Text end
  if v == nil then v = item.text end
  return tostring(v or "")
end

local function menuActionNameOf(item)
  if type(item) ~= "table" then return nil end
  local v = item.Action
  if v == nil then v = item.action end
  if type(v) == "string" and v ~= "" then return v end
  return nil
end

local function menuPropsForItem(item)
  local out = {}
  if type(item) ~= "table" then return out end
  for k, v in pairs(item) do
    if k ~= "Items" and k ~= "items"
        and k ~= "Children" and k ~= "children"
        and k ~= "submenu" and k ~= "SubMenu"
        and k ~= "caption" and k ~= "text" and k ~= "Text"
        and k ~= "Action" and k ~= "action" then
      out[k] = v
    end
  end
  out.Caption = menuCaptionOf(item)
  if item.Name ~= nil then out.Name = tostring(item.Name or "") end
  -- Action is a designer-model field for now. Do not pass it to live MenuItem.
  return out
end

local function applyActionToMenuProps(rt, item, props)
  -- MenuItem.Action reintro safe step: keep Action in the model/editor only.
  -- Do not mirror action properties into live MenuItem yet; the live menu is
  -- rebuilt while the editor dialog is open and this path caused close-time
  -- crashes on Linux/LCL.
  return props
end

local function clearMenuObject(menuObj)
  if not menuObj then return end
  local items = nil
  pcall(function() items = menuObj.Items end)
  if items then
    pcall(function() items:Clear() end)
    pcall(function() items.Clear(items) end)
  end
end

local function addMenuItemToParent(menuObj, parentItem, itemObj)
  if not itemObj then return false end
  if parentItem then
    local ok = pcall(function() parentItem:Add(itemObj) end)
    if ok then return true end
    ok = pcall(function() parentItem.Add(parentItem, itemObj) end)
    if ok then return true end
    local sub = nil
    pcall(function() sub = parentItem.Items end)
    if sub then
      ok = pcall(function() sub:Add(itemObj) end)
      if ok then return true end
      ok = pcall(function() sub.Add(sub, itemObj) end)
      if ok then return true end
    end
    return false
  end

  local items = nil
  pcall(function() items = menuObj.Items end)
  if items then
    local ok = pcall(function() items:Add(itemObj) end)
    if ok then return true end
    ok = pcall(function() items.Add(items, itemObj) end)
    if ok then return true end
  end
  return false
end

local function applyMenuItemProps(mi, props)
  if not mi or type(props) ~= "table" then return end

  -- Some generated constructors apply only a subset of properties.  Menu item
  -- images in particular are easy to miss, so assign the runtime properties
  -- explicitly after creation as well.  Do not pass Action or internal __ fields
  -- to util.applyProps here: Action would be a string in the designer model,
  -- while the live LCL property expects a TObject.
  local applyProps = {}
  for k, v in pairs(props) do
    if k ~= "Action" and tostring(k):sub(1, 2) ~= "__" then
      applyProps[k] = v
    end
  end
  pcall(function() util.applyProps(mi, applyProps) end)
  if props.Name ~= nil then pcall(function() mi.Name = tostring(props.Name or "") end) end
  if props.Caption ~= nil then pcall(function() mi.Caption = tostring(props.Caption or "") end) end
  if props.Hint ~= nil then pcall(function() mi.Hint = tostring(props.Hint or "") end) end
  if props.Enabled ~= nil then pcall(function() mi.Enabled = props.Enabled ~= false end) end
  if props.Checked ~= nil then pcall(function() mi.Checked = props.Checked == true end) end
  if props.ImageIndex ~= nil then pcall(function() mi.ImageIndex = tonumber(props.ImageIndex) or -1 end) end
end

local function applyMenuItemBitmapFallback(rt, menuNode, mi, props)
  if not rt or not menuNode or not mi or type(props) ~= "table" then return false end
  local idx = tonumber(props.__ActionImageIndex)
  if idx == nil then idx = tonumber(props.ImageIndex) end
  if idx == nil or idx < 0 then
    if VCL and VCL.ClearMenuItemBitmap then
      pcall(function() VCL.ClearMenuItemBitmap(mi) end)
    end
    return false
  end

  local imageListName = props.__ActionImageListName
  if type(imageListName) ~= "string" or imageListName == "" then
    imageListName = menuNode.props and menuNode.props.Images or nil
  end
  if type(imageListName) ~= "string" or imageListName == "" then return false end

  local _, imageListNode = findLiveObjectByName(rt, imageListName, "ImageList")
  local fileName = imageListFileAtIndex(imageListNode, idx)
  if not fileName or tostring(fileName) == "" then return false end

  if VCL and VCL.LoadMenuItemBitmapFromFile then
    local ok = false
    pcall(function() ok = VCL.LoadMenuItemBitmapFromFile(mi, tostring(fileName)) end)
    return ok and true or false
  end
  return false
end

local function reapplyBuiltMenuItemImages(rt, menuNode, keepAlive)
  if type(keepAlive) ~= "table" then return end
  for _, entry in ipairs(keepAlive) do
    local mi = entry and entry.mi or entry
    local props = entry and entry.props or nil
    if mi and props then
      applyMenuItemProps(mi, props)
      applyMenuItemBitmapFallback(rt, menuNode, mi, props)
    end
  end
end

local function buildMenuItems(rt, menuNode, menuObj, parentItem, items, keepAlive)
  if not menuObj or type(items) ~= "table" then return 0 end
  local made = 0
  for _, item in ipairs(items) do
    if type(item) == "table" then
      local props = applyActionToMenuProps(rt, item, menuPropsForItem(item))
      local mi = nil
      local ok, err = pcall(function() mi = VCL.MenuItem(menuObj, props) end)
      if not ok or not mi then
        ok, err = pcall(function() mi = VCL.MenuItem(menuObj) end)
      end
      if mi then
        applyMenuItemProps(mi, props)
        keepAlive[#keepAlive + 1] = { mi = mi, props = props }
        addMenuItemToParent(menuObj, parentItem, mi)
        applyMenuItemProps(mi, props)
        applyMenuItemBitmapFallback(rt, menuNode, mi, props)
        made = made + 1
        made = made + buildMenuItems(rt, menuNode, menuObj, mi, menuChildrenOf(item), keepAlive)
      else
        print("menu item create failed:", tostring(props.Caption or ""), tostring(err))
      end
    end
  end
  return made
end

local function applyMenuImagesForNode(rt, node, menuObj)
  if not rt or not node or not menuObj then return end
  local imageListName = node.props and node.props.Images or nil
  if type(imageListName) == "string" and imageListName ~= "" then
    local imageListObj = findLiveObjectByName(rt, imageListName, "ImageList")
    if imageListObj then
      local ok, err = pcall(function() menuObj.Images = imageListObj end)
      if not ok then print("menu Images ref failed:", tostring(imageListName), tostring(err)) end
      return
    end
    print("menu Images ref unresolved:", tostring(imageListName))
  end
  pcall(function() menuObj.Images = nil end)
end

local function applyMenuItemsForNode(rt, node)
  if not rt or not node or not (node.class == "MainMenu" or node.class == "PopupMenu") then return false end
  local menuObj = rt.byNode and rt.byNode[node]
  if not menuObj then return false end

  applyMenuImagesForNode(rt, node, menuObj)

  clearMenuObject(menuObj)
  rt.menuItemKeepAlive = rt.menuItemKeepAlive or {}
  rt.menuItemKeepAlive[node] = {}
  buildMenuItems(rt, node, menuObj, nil, node.props and node.props.MenuItems or {}, rt.menuItemKeepAlive[node])

  -- Re-apply once after building too, because some widgetsets update the menu
  -- handle lazily while items are inserted.  Then re-apply item ImageIndex and
  -- bitmap fallback once more, after the final Images assignment.
  applyMenuImagesForNode(rt, node, menuObj)
  reapplyBuiltMenuItemImages(rt, node, rt.menuItemKeepAlive[node])

  if node.class == "MainMenu" and rt.designRoot then
    pcall(function() rt.designRoot.Menu = menuObj end)
  end
  pcall(function() menuObj:Invalidate() end)
  pcall(function() menuObj:Repaint() end)
  pcall(function() rt.designRoot:Invalidate() end)
  pcall(function() rt.designRoot:Repaint() end)
  return true
end

local function applyAllMenuItems(rt)
  if not rt or not rt.project then return end
  local function walk(node)
    applyMenuItemsForNode(rt, node)
    for _, child in ipairs(node.items or {}) do walk(child) end
  end
  for _, formNode in ipairs(rt.project.forms or {}) do walk(formNode) end
end


local function applyDesignModeControlTweaks(obj, node)
  if not obj or not node then return end

  -- Designer surface only: csDropDownList ComboBox can eat mouse/drag
  -- events before the designer receives them. Keep node.props.Style unchanged
  -- for saving/runtime, but make only the live design-time instance editable
  -- so it remains selectable/movable.
  if node.class == "ComboBox" then
    local style = node.props and node.props.Style
    if tostring(style or "") == "csDropDownList" then
      pcall(function() obj.Style = "csDropDown" end)
    end
  end
end

local function makeControl(parent, node)
  if node.class == "Form" then
    error("Form node is represented by the designRoot panel in embedded mode")
  end
  if not VCL[node.class] then error("Unknown VCL class: " .. tostring(node.class)) end
  local obj = VCL[node.class](parent, node.name)
  obj.Name = node.name
  util.applyProps(obj, propsForDirectApply(node))
  applyDesignModeControlTweaks(obj, node)
  applyCollections(obj, node)
  loadImageListFilesToObject(obj, node, parent)
  loadImageFileToObject(obj, node)
  loadGlyphFileToObject(obj, node)
  return obj
end

local function shiftHasCtrl(shift)
  if type(shift) == "table" then
    if shift.ssCtrl or shift.Ctrl or shift.ctrl then return true end
    for k, v in pairs(shift) do
      if v == "ssCtrl" or v == "Ctrl" or k == "ssCtrl" then return true end
    end
  elseif type(shift) == "string" then
    return shift:lower():find("ctrl", 1, true) ~= nil
  end
  return false
end

local function shiftHasShift(shift)
  if type(shift) == "table" then
    if shift.ssShift or shift.Shift or shift.shift then return true end
    for k, v in pairs(shift) do
      if v == "ssShift" or v == "Shift" or k == "ssShift" then return true end
    end
  elseif type(shift) == "string" then
    return shift:lower():find("shift", 1, true) ~= nil
  end
  return false
end

local function isLeftButton(button)
  return button == "mbLeft" or button == "left" or button == 0 or button == 1
end

local function setBounds(obj, left, top, width, height)
  if not obj then return end
  pcall(function() obj.Left = left end)
  pcall(function() obj.Top = top end)
  if width then pcall(function() obj.Width = width end) end
  if height then pcall(function() obj.Height = height end) end
end

local function makeBorderPiece(parent, name)
  local p = VCL.Panel(parent, name)
  p._ = {
    Left = 0,
    Top = 0,
    Width = 1,
    Height = 1,
    Caption = "",
    BevelOuter = "bvNone",
    Color = "clHighlight",
    Visible = false,
  }
  return p
end

drawDottedGrid = function(sender)
  local canvas = nil
  pcall(function() canvas = sender.Canvas end)
  if not canvas then return end

  local w = 0
  local h = 0
  pcall(function() w = tonumber(sender.Width) or 0 end)
  pcall(function() h = tonumber(sender.Height) or 0 end)
  if w <= 0 or h <= 0 then return end

  local g = tonumber(M.options.gridSize) or 8
  if g < 2 then g = 2 end

  local dot = M.options.gridColor or 0x00A0A0A0
  local major = M.options.gridMajorColor or 0x00606060
  local majorEvery = tonumber(M.options.gridMajorEvery) or 5
  if majorEvery < 1 then majorEvery = 1 end
  local shape = tostring(M.options.gridShape or "dot"):lower()

  local function put(x, y, color)
    pcall(function() canvas:SetPixel(x, y, color) end)
  end

  if M.options.showGrid then
    local ix = 0
    for x = g, w - 2, g do
      ix = ix + 1
      local iy = 0
      for y = g, h - 2, g do
        iy = iy + 1
        local isMajor = ((ix % majorEvery == 0) and (iy % majorEvery == 0))
        local color = isMajor and major or dot

        if shape == "line" then
          put(x - 1, y, color); put(x, y, color); put(x + 1, y, color)
          put(x, y - 1, color); put(x, y + 1, color)
        elseif shape == "cross" then
          put(x - 1, y, color); put(x, y, color); put(x + 1, y, color)
          put(x, y - 1, color); put(x, y + 1, color)
        else
          put(x, y, color)
          if isMajor then
            put(x + 1, y, color); put(x, y + 1, color); put(x + 1, y + 1, color)
          end
        end
      end
    end
  end
end

local function shouldPaintGridForNode(node)
  if not node then return false end
  if node.class == "Form" then return true end

  local def = registry.get and registry.get(node.class) or nil
  if def and def.container and def.special ~= "splitter" then return true end

  return node.class == "Panel"
      or node.class == "GroupBox"
      or node.class == "ScrollBox"
      or node.class == "RadioGroup"
      or node.class == "CheckGroup"
      or node.class == "TabSheet"
end

local function installGridPainter(rt, obj, node)
  if not rt then return end
  obj = obj or rt.designRoot
  if not obj then return end

  local oldPaint = nil
  pcall(function() oldPaint = obj.OnPaint end)
  pcall(function()
    obj.OnPaint = function(sender, ...)
      if oldPaint then pcall(oldPaint, sender, ...) end
      drawDottedGrid(sender)
    end
  end)
  pcall(function()
    obj.OnResize = function(sender)
      pcall(function() sender:Invalidate() end)
      pcall(function() sender:Repaint() end)
      drawDottedGrid(sender)
    end
  end)

  rt.gridPaintObjects = rt.gridPaintObjects or {}
  table.insert(rt.gridPaintObjects, obj)

  -- Linux/LCL alatt a GroupBox/RadioGroup/CheckGroup/TabSheet saját festése sokszor
  -- felülrajzolja az OnPaint-ben közvetlenül kirakott grid pontokat.
  -- Ilyenkor teszünk a konténer kliens-területére egy háttér PaintBoxot,
  -- amin biztosan van Canvas, és amit hátraküldünk, hogy a benne lévő
  -- controlok a grid fölött maradjanak. Ez csak designer-runtime segéd,
  -- nem kerül a modellbe/tree-be.
  local className = node and node.class or nil
  if (className == "GroupBox" or className == "RadioGroup" or className == "CheckGroup" or className == "TabSheet") and VCL.PaintBox then
    local pb = nil
    local ok = pcall(function()
      pb = VCL.PaintBox(obj, "__grid_" .. tostring(node.name or className))
      pb._ = {
        Left = 0,
        Top = 0,
        Width = tonumber(obj.ClientWidth) or tonumber(obj.Width) or 1,
        Height = tonumber(obj.ClientHeight) or tonumber(obj.Height) or 1,
        Align = "alClient",
        Visible = true,
      }
      pcall(function() pb.Enabled = false end)
      pb.OnPaint = function(sender)
        drawDottedGrid(sender)
      end
      pcall(function() pb:SendToBack() end)
    end)
    if ok and pb then
      table.insert(rt.gridPaintObjects, pb)
      rt.gridBackdrops = rt.gridBackdrops or {}
      rt.gridBackdrops[obj] = pb
    end
  end
end

local function makeSelectionFrame(rt)
  rt.selTop = makeBorderPiece(rt.designRoot, "__sel_top")
  rt.selBottom = makeBorderPiece(rt.designRoot, "__sel_bottom")
  rt.selLeft = makeBorderPiece(rt.designRoot, "__sel_left")
  rt.selRight = makeBorderPiece(rt.designRoot, "__sel_right")
end

local function makeTargetFrame(rt)
  rt.targetObj = nil
  rt.targetRect = nil
end

local function pointXY(pt)
  if not pt then return 0, 0 end
  local x = pt.X
  if x == nil then x = pt.x end
  local y = pt.Y
  if y == nil then y = pt.y end
  return tonumber(x) or 0, tonumber(y) or 0
end

local function originXY(obj, preferClient)
  if not obj then return 0, 0 end
  local origin = nil
  if preferClient then
    pcall(function() origin = obj.ClientOrigin end)
  end
  if not origin then
    pcall(function() origin = obj.ControlOrigin end)
  end
  if not origin and not preferClient then
    pcall(function() origin = obj.ClientOrigin end)
  end
  return pointXY(origin)
end

local function objectRootXY(rt, obj)
  if not rt or not obj then return 0, 0 end
  if obj == rt.designRoot then return 0, 0 end

  local ok, ox, oy, rx, ry = pcall(function()
    local ox, oy = originXY(obj, false)
    local rx, ry = originXY(rt.designRoot, true)
    return ox, oy, rx, ry
  end)
  if ok and (ox ~= 0 or oy ~= 0 or rx ~= 0 or ry ~= 0) then return ox - rx, oy - ry end

  local x, y = 0, 0
  local cur = obj
  while cur and cur ~= rt.designRoot do
    pcall(function()
      x = x + (tonumber(cur.Left) or 0)
      y = y + (tonumber(cur.Top) or 0)
      cur = cur.Parent
    end)
    if cur == obj then break end
  end
  return x, y
end


local function clientRootXY(rt, obj)
  if not rt or not obj then return 0, 0 end
  if obj == rt.designRoot then return 0, 0 end

  local ok, ox, oy, rx, ry = pcall(function()
    local ox, oy = originXY(obj, true)
    local rx, ry = originXY(rt.designRoot, true)
    return ox, oy, rx, ry
  end)
  if ok and (ox ~= 0 or oy ~= 0 or rx ~= 0 or ry ~= 0) then return ox - rx, oy - ry end

  return objectRootXY(rt, obj)
end

local function outerRootXY(rt, obj)
  if not rt or not obj then return 0, 0 end
  if obj == rt.designRoot then return 0, 0 end

  local parent = nil
  pcall(function() parent = obj.Parent end)
  if parent then
    local ok, px, py, rx, ry, l, t = pcall(function()
      local px, py = originXY(parent, true)
      local rx, ry = originXY(rt.designRoot, true)
      return px, py, rx, ry,
             tonumber(obj.Left) or 0, tonumber(obj.Top) or 0
    end)
    if ok and (px ~= 0 or py ~= 0 or rx ~= 0 or ry ~= 0) then return (px - rx) + l, (py - ry) + t end
  end

  return objectRootXY(rt, obj)
end

local function clientSize(obj)
  local w, h
  pcall(function() w = obj.ClientWidth end)
  pcall(function() h = obj.ClientHeight end)
  if not w then pcall(function() w = obj.Width end) end
  if not h then pcall(function() h = obj.Height end) end
  return tonumber(w) or 0, tonumber(h) or 0
end

local function clamp(v, lo, hi)
  v = tonumber(v) or 0
  lo = tonumber(lo) or 0
  hi = tonumber(hi) or lo
  if hi < lo then hi = lo end
  if v < lo then return lo end
  if v > hi then return hi end
  return v
end

local function nodeHasDesignerFrame(node)
  if not node then return false end
  if registry.isNonVisual and registry.isNonVisual(node.class) then return false end
  return true
end

local function showFrame(rt, obj)
  if not rt then return end
  local pieces = { rt.selTop, rt.selBottom, rt.selLeft, rt.selRight }
  if not obj then
    for _, p in ipairs(pieces) do p.Visible = false end
    return
  end

  local x, y = outerRootXY(rt, obj)
  local w = obj.Width or 1
  local h = obj.Height or 1
  local t = tonumber(M.options.frameThickness) or 2

  if obj == rt.designRoot then
    for _, p in ipairs(pieces) do p.Visible = false end
    return
  else
    setBounds(rt.selTop,    x - t,     y - t,     w + 2*t, t)
    setBounds(rt.selBottom, x - t,     y + h,     w + 2*t, t)
    setBounds(rt.selLeft,   x - t,     y - t,     t,       h + 2*t)
    setBounds(rt.selRight,  x + w,     y - t,     t,       h + 2*t)
  end

  for _, p in ipairs(pieces) do
    p.Visible = true
    if p.BringToFront then pcall(function() p:BringToFront() end) end
  end
end

local function setFrameColor(rt, color)
  if not rt then return end
  for _, p in ipairs({ rt.selTop, rt.selBottom, rt.selLeft, rt.selRight }) do
    pcall(function() p.Color = color end)
  end
end

local function hideTargetFrame(rt)
  if not rt then return end
  rt.targetObj = nil
  rt.targetRect = nil
end

local function showTargetFrame(rt, obj)
  if not rt then return end
  rt.targetObj = obj
  rt.targetRect = nil
end

function M.selectNode(node)
  local rt = M.current
  if not rt then return end
  rt.selectedNode = node
  setFrameColor(rt, M.options.moveColor or "clHighlight")
  if not nodeHasDesignerFrame(node) then
    showFrame(rt, nil)
  else
    showFrame(rt, rt.byNode[node])
  end
end

local function showFrameAt(rt, obj, x, y, width, height)
  if not rt or not obj then return end
  local w = tonumber(width or obj.Width) or 1
  local h = tonumber(height or obj.Height) or 1
  local t = tonumber(M.options.frameThickness) or 2

  setBounds(rt.selTop,    x - t,     y - t,     w + 2*t, t)
  setBounds(rt.selBottom, x - t,     y + h,     w + 2*t, t)
  setBounds(rt.selLeft,   x - t,     y - t,     t,       h + 2*t)
  setBounds(rt.selRight,  x + w,     y - t,     t,       h + 2*t)

  for _, p in ipairs({ rt.selTop, rt.selBottom, rt.selLeft, rt.selRight }) do
    p.Visible = true
    if p.BringToFront then pcall(function() p:BringToFront() end) end
  end
end

local aligns = { alNone = true, alCustom = true }

local function clearAnchorsForMove(obj, node)
  pcall(function()
    if obj.DisableAutoSizing then obj:DisableAutoSizing() end
  end)

  local okAlign, align = pcall(function() return obj.Align end)
  if okAlign and align and not aligns[align] then
    pcall(function() obj.Align = "alNone" end)
    node.props = node.props or {}
    node.props.Align = nil
  end

  pcall(function() obj.Anchors = "[akLeft,akTop]" end)
  node.props = node.props or {}
  node.props.Anchors = nil

  for _, dir in ipairs({ "AnchorSideLeft", "AnchorSideRight", "AnchorSideTop", "AnchorSideBottom" }) do
    pcall(function()
      if obj[dir] then
        obj[dir].Control = nil
        obj[dir].Side = "asrTop"
      end
    end)
    node.props[dir] = nil
  end
end

local function controlOrigin(obj)
  -- Mouse coordinates are client-relative, so prefer ClientOrigin.
  -- VCLua/LCL points may expose X/Y or x/y depending on wrapper.
  local x, y = originXY(obj, true)
  if x ~= 0 or y ~= 0 then return x, y end

  local parent = nil
  pcall(function() parent = obj.Parent end)
  local px, py = originXY(parent, true)
  return px + (tonumber(obj.Left) or 0),
         py + (tonumber(obj.Top) or 0)
end

local function parentOrigin(obj)
  local parent = nil
  pcall(function() parent = obj.Parent end)
  return originXY(parent, true)
end

local function rootCoordsFromSender(rt, sender, x, y)
  local lx = tonumber(x) or 0
  local ly = tonumber(y) or 0

  if sender == rt.designRoot then
    return lx, ly
  end

  local ok, sx, sy, rx, ry = pcall(function()
    local ax, ay = controlOrigin(sender)
    local bx, by = controlOrigin(rt.designRoot)
    return ax, ay, bx, by
  end)
  if ok then
    return (sx - rx) + lx, (sy - ry) + ly
  end

  local fx, fy = lx, ly
  pcall(function()
    fx = fx + (tonumber(sender.Left) or 0)
    fy = fy + (tonumber(sender.Top) or 0)
  end)
  return fx, fy
end

local function containerAtRootPoint(rt, draggedNode, rootX, rootY)
  if not rt or not rt.project then return nil end
  local best, bestArea = nil, nil
  local formNode = model.getRoot(rt.project)

  local function consider(node)
    if not node or node == draggedNode then return end
    if draggedNode and model.isAncestor(draggedNode, node) then return end
    if node ~= formNode and not registry.isContainer(node.class) then return end
    local obj = rt.byNode[node]
    if not obj then return end
    local x, y = outerRootXY(rt, obj)
    local w = tonumber(obj.Width) or tonumber(node.props and node.props.Width) or 0
    local h = tonumber(obj.Height) or tonumber(node.props and node.props.Height) or 0
    if rootX >= x and rootY >= y and rootX <= x + w and rootY <= y + h then
      local area = math.max(1, w * h)
      if not bestArea or area <= bestArea then
        best = node
        bestArea = area
      end
    end
  end

  local function walk(node)
    consider(node)
    for _, child in ipairs(node.items or {}) do walk(child) end
  end
  walk(formNode)
  return best or formNode
end


local function firstChildMatching(parentNode, predicate)
  if not parentNode or type(predicate) ~= "function" then return nil end
  for _, child in ipairs(parentNode.items or {}) do
    if predicate(child) then return child end
  end
  return nil
end

local function isToolButtonClass(className)
  return registry.isToolButton and registry.isToolButton(className)
end

local function isToolBarClass(className)
  return registry.isToolBar and registry.isToolBar(className)
end

local function isPageControlClass(className)
  return registry.isPageControl and registry.isPageControl(className)
end

local function isTabSheetClass(className)
  return registry.isTabSheet and registry.isTabSheet(className)
end

local function firstTabSheetNode(pageControlNode)
  return firstChildMatching(pageControlNode, function(child)
    return child and isTabSheetClass(child.class)
  end)
end

local function resolveDesignerDropParent(rt, draggedNode, rawTarget)
  if not rt or not draggedNode then return nil end
  local formNode = model.getRoot(rt.project)
  local target = rawTarget or formNode

  if target == draggedNode or model.isAncestor(draggedNode, target) then
    return model.findParent(rt.project, draggedNode) or formNode
  end

  local draggedClass = tostring(draggedNode.class or "")
  local targetClass = tostring(target.class or "")

  -- ToolButton is a structural child of ToolBar.  Nothing else should be
  -- reparented into ToolBar from the designer surface.
  if isToolButtonClass(draggedClass) then
    if isToolBarClass(targetClass) then return target end
    return model.findParent(rt.project, draggedNode) or formNode
  end
  if isToolBarClass(targetClass) then
    return model.findParent(rt.project, draggedNode) or formNode
  end

  -- TabSheet belongs directly to PageControl.
  if isTabSheetClass(draggedClass) then
    if isPageControlClass(targetClass) then return target end
    return model.findParent(rt.project, draggedNode) or formNode
  end

  -- PageControl is only the tab host; normal controls go to the active/first
  -- TabSheet.  If there is no sheet yet, keep the current parent rather than
  -- creating model nodes from runtime drag code.
  if isPageControlClass(targetClass) then
    local sheet = firstTabSheetNode(target)
    if sheet then return sheet end
    return model.findParent(rt.project, draggedNode) or formNode
  end

  if target == formNode or registry.isContainer(targetClass) then
    return target
  end

  return model.findParent(rt.project, draggedNode) or formNode
end

local function startDrag(rt, node, obj, button, shift, x, y, callbacks)
  if not node or not obj or node.class == "Form" then return end
  if not isLeftButton(button) then return end
  if not shiftHasCtrl(shift) then return end
  if drag then return end

  local width = tonumber(obj.Width) or 1
  local height = tonumber(obj.Height) or 1
  local origLeft = tonumber(obj.Left) or 0
  local origTop = tonumber(obj.Top) or 0
  local origRootLeft, origRootTop = outerRootXY(rt, obj)
  local formNode = model.getRoot(rt.project)
  local currentParentAtStart = model.findParent(rt.project, node) or formNode
  local currentParentObjAtStart = rt.byNode[currentParentAtStart] or rt.designRoot
  local parentClientRootXAtStart, parentClientRootYAtStart = clientRootXY(rt, currentParentObjAtStart)
  local parentClientWAtStart, parentClientHAtStart = clientSize(currentParentObjAtStart)
  local lockToCurrentParent = currentParentAtStart ~= formNode

  local grabX = tonumber(x) or 0
  local grabY = tonumber(y) or 0
  local resizeMode = shiftHasShift(shift)

  local state = {
    rt = rt,
    node = node,
    obj = obj,
    width = width,
    height = height,
    origLeft = origLeft,
    origTop = origTop,
    origRootLeft = origRootLeft,
    origRootTop = origRootTop,
    currentParentAtStart = currentParentAtStart,
    currentParentObjAtStart = currentParentObjAtStart,
    parentClientRootXAtStart = parentClientRootXAtStart,
    parentClientRootYAtStart = parentClientRootYAtStart,
    parentClientWAtStart = parentClientWAtStart,
    parentClientHAtStart = parentClientHAtStart,
    lockToCurrentParent = lockToCurrentParent,
    grabX = grabX,
    grabY = grabY,
    resizeMode = resizeMode,
    newLeft = origRootLeft,
    newTop = origRootTop,
    newWidth = width,
    newHeight = height,
    finished = false,
    oldRootMove = rt.designRoot.OnMouseMove,
    oldRootUp = rt.designRoot.OnMouseUp,
    oldRootClick = rt.designRoot.OnClick,
    oldObjMove = obj.OnMouseMove,
    oldObjUp = obj.OnMouseUp,
    oldParentMove = nil,
    oldParentUp = nil,
    oldParentClick = nil,
    parentDragObj = nil,
    oldDragSurfaceHandlers = {},
    oldPieceHandlers = {},
    mouseCaptureTransferred = false,
    gridWasVisible = M.options.showGrid and true or false,
  }

  state.parentDragObj = (currentParentObjAtStart ~= rt.designRoot) and currentParentObjAtStart or nil
  if state.parentDragObj then
    state.oldParentMove = state.parentDragObj.OnMouseMove
    state.oldParentUp = state.parentDragObj.OnMouseUp
    state.oldParentClick = state.parentDragObj.OnClick
  end

  drag = state

  local function moveFromRoot(rootX, rootY)
    if not drag or drag.finished then return end
    local rx = tonumber(rootX) or 0
    local ry = tonumber(rootY) or 0

    if state.resizeMode then
      local maxW = state.parentClientRootXAtStart + state.parentClientWAtStart - state.origRootLeft
      local maxH = state.parentClientRootYAtStart + state.parentClientHAtStart - state.origRootTop
      local nw = snapSize(rx - state.origRootLeft)
      local nh = snapSize(ry - state.origRootTop)
      nw = clamp(nw, 12, math.max(12, maxW))
      nh = clamp(nh, 12, math.max(12, maxH))
      state.newWidth = nw
      state.newHeight = nh
      showFrameAt(rt, obj, state.origRootLeft, state.origRootTop, nw, nh)
    else
      local nx = snapValue(rx - grabX)
      local ny = snapValue(ry - grabY)

      local minX = state.parentClientRootXAtStart
      local minY = state.parentClientRootYAtStart
      local maxX = state.parentClientRootXAtStart + state.parentClientWAtStart - state.newWidth
      local maxY = state.parentClientRootYAtStart + state.parentClientHAtStart - state.newHeight
      nx = clamp(nx, minX, maxX)
      ny = clamp(ny, minY, maxY)

      state.newLeft = nx
      state.newTop = ny
      showFrameAt(rt, obj, nx, ny, state.newWidth, state.newHeight)

      local rawTarget = containerAtRootPoint(rt, node, nx + math.floor(state.newWidth / 2), ny + math.floor(state.newHeight / 2))
      state.targetParent = resolveDesignerDropParent(rt, node, rawTarget)
      if state.targetParent and state.targetParent ~= state.currentParentAtStart then
        showTargetFrame(rt, rt.byNode[state.targetParent])
      else
        hideTargetFrame(rt)
      end
    end
  end

  local function eventMove(sender, sh, mx, my)
    local rx, ry = rootCoordsFromSender(rt, sender, mx, my)
    moveFromRoot(rx, ry)
  end

  local function finish(sender, btn, sh, mx, my)
    if not drag or state.finished then return end
    if sender then
      local rx, ry = rootCoordsFromSender(rt, sender, mx, my)
      moveFromRoot(rx, ry)
    end

    state.finished = true
    drag = nil
    hideTargetFrame(rt)

    pcall(function() rt.designRoot.MouseCapture = false end)
    pcall(function() obj.MouseCapture = false end)

    rt.designRoot.OnMouseMove = state.oldRootMove
    rt.designRoot.OnMouseUp = state.oldRootUp
    rt.designRoot.OnClick = state.oldRootClick
    obj.OnMouseMove = state.oldObjMove
    obj.OnMouseUp = state.oldObjUp
    if state.parentDragObj then
      state.parentDragObj.OnMouseMove = state.oldParentMove
      state.parentDragObj.OnMouseUp = state.oldParentUp
      state.parentDragObj.OnClick = state.oldParentClick
    end
    for _, rec in ipairs(state.oldDragSurfaceHandlers or {}) do
      rec.o.OnMouseMove = rec.move
      rec.o.OnMouseUp = rec.up
      rec.o.OnClick = rec.click
    end
    for _, rec in ipairs(state.oldPieceHandlers) do
      rec.p.OnMouseMove = rec.move
      rec.p.OnMouseUp = rec.up
      rec.p.OnClick = rec.click
    end

    clearAnchorsForMove(obj, node)

    local finalRootLeft = state.newLeft
    local finalRootTop = state.newTop
    local currentParent = model.findParent(rt.project, node) or model.getRoot(rt.project)
    local targetParent = state.targetParent or currentParent

    local parentObj = rt.byNode[targetParent or currentParent] or rt.designRoot
    local parentRootX, parentRootY = clientRootXY(rt, parentObj)
    local parentW, parentH = clientSize(parentObj)
    local localLeft = snapValue(finalRootLeft - parentRootX)
    local localTop = snapValue(finalRootTop - parentRootY)
    localLeft = clamp(localLeft, 0, parentW - state.newWidth)
    localTop = clamp(localTop, 0, parentH - state.newHeight)

    if targetParent and targetParent ~= currentParent then
      local ok = model.moveNodeToParent(rt.project, node, targetParent, localLeft, localTop)
      pcall(function() obj.Visible = true end)
      if ok and callbacks and callbacks.onReparented then
        callbacks.onReparented(node, targetParent)
        return
      end
    end

    if obj.SetBounds then
      pcall(function() obj:SetBounds(localLeft, localTop, state.newWidth, state.newHeight) end)
    else
      setBounds(obj, localLeft, localTop, state.newWidth, state.newHeight)
    end

    pcall(function() if obj.EnableAutoSizing then obj:EnableAutoSizing() end end)

    node.props = node.props or {}
    node.props.Left = tonumber(obj.Left) or localLeft
    node.props.Top = tonumber(obj.Top) or localTop
    node.props.Width = tonumber(obj.Width) or state.newWidth
    node.props.Height = tonumber(obj.Height) or state.newHeight

    pcall(function() obj.Visible = true end)
    setFrameColor(rt, M.options.moveColor or "clHighlight")
    showFrame(rt, obj)
    setGridRuntimeVisible(rt, true, true)
    if callbacks and callbacks.onMoved then callbacks.onMoved(node) end
  end

  rt.designRoot.OnMouseMove = eventMove
  rt.designRoot.OnMouseUp = finish
  rt.designRoot.OnClick = function(sender) end

  if state.parentDragObj then
    state.parentDragObj.OnMouseMove = eventMove
    state.parentDragObj.OnMouseUp = finish
    state.parentDragObj.OnClick = function(sender) end
  end

  for _, other in ipairs(rt.objects or {}) do
    if other and other ~= obj and other ~= rt.designRoot and other ~= state.parentDragObj then
      table.insert(state.oldDragSurfaceHandlers, {
        o = other,
        move = other.OnMouseMove,
        up = other.OnMouseUp,
        click = other.OnClick,
      })
      other.OnMouseMove = eventMove
      other.OnMouseUp = finish
      other.OnClick = function(sender) end
    end
  end

  local needsOriginalObjectDrag = registry.needsOriginalDragFallback(node.class)
  if needsOriginalObjectDrag then
    obj.OnMouseMove = eventMove
    obj.OnMouseUp = finish
  end

  for _, p in ipairs({ rt.selTop, rt.selBottom, rt.selLeft, rt.selRight }) do
    if p then
      table.insert(state.oldPieceHandlers, {
        p = p,
        move = p.OnMouseMove,
        up = p.OnMouseUp,
        click = p.OnClick,
      })
      p.OnMouseMove = eventMove
      p.OnMouseUp = finish
      p.OnClick = function(sender) end
    end
  end

  setFrameColor(rt, resizeMode and (M.options.resizeColor or "clRed") or (M.options.moveColor or "clHighlight"))
  showFrameAt(rt, obj, origRootLeft, origRootTop)

  pcall(function() obj.MouseCapture = false end)
  pcall(function()
    rt.designRoot.MouseCapture = true
    state.mouseCaptureTransferred = true
  end)

  pcall(function() obj.Visible = false end)
end


local function startRootResize(rt, node, sender, button, shift, x, y, callbacks)
  if not node or node.class ~= "Form" then return end
  if not isLeftButton(button) then return end
  if not (shiftHasCtrl(shift) and shiftHasShift(shift)) then return end
  if drag then return end

  local obj = rt.designRoot
  local origWidth = tonumber(obj.Width) or tonumber(node.props and node.props.Width) or 520
  local origHeight = tonumber(obj.Height) or tonumber(node.props and node.props.Height) or 360

  local state = {
    rt = rt,
    node = node,
    obj = obj,
    origWidth = origWidth,
    origHeight = origHeight,
    newWidth = origWidth,
    newHeight = origHeight,
    finished = false,
    oldRootMove = obj.OnMouseMove,
    oldRootUp = obj.OnMouseUp,
    oldRootClick = obj.OnClick,
    oldPieceHandlers = {},
  }
  drag = state

  local function applySize(rootX, rootY)
    if not drag or state.finished then return end
    local nw = math.max(120, snapSize(rootX))
    local nh = math.max(80, snapSize(rootY))
    state.newWidth = nw
    state.newHeight = nh
    pcall(function() obj.Width = nw end)
    pcall(function() obj.Height = nh end)
    invalidateGrid(rt)
  end

  local function eventMove(snd, sh, mx, my)
    local rx, ry = rootCoordsFromSender(rt, snd, mx, my)
    applySize(rx, ry)
  end

  local function finish(snd, btn, sh, mx, my)
    if not drag or state.finished then return end
    if snd then
      local rx, ry = rootCoordsFromSender(rt, snd, mx, my)
      applySize(rx, ry)
    end
    state.finished = true
    drag = nil

    pcall(function() obj.MouseCapture = false end)
    obj.OnMouseMove = state.oldRootMove
    obj.OnMouseUp = state.oldRootUp
    obj.OnClick = state.oldRootClick
    for _, rec in ipairs(state.oldPieceHandlers) do
      rec.p.OnMouseMove = rec.move
      rec.p.OnMouseUp = rec.up
      rec.p.OnClick = rec.click
    end

    node.props = node.props or {}
    node.props.Width = tonumber(obj.Width) or state.newWidth
    node.props.Height = tonumber(obj.Height) or state.newHeight
    setFrameColor(rt, M.options.moveColor or "clHighlight")
    showFrame(rt, nil)
    invalidateGrid(rt)
    if callbacks and callbacks.onMoved then callbacks.onMoved(node) end
  end

  obj.OnMouseMove = eventMove
  obj.OnMouseUp = finish
  obj.OnClick = function(sender) end

  for _, p in ipairs({ rt.selTop, rt.selBottom, rt.selLeft, rt.selRight }) do
    table.insert(state.oldPieceHandlers, {
      p = p,
      move = p.OnMouseMove,
      up = p.OnMouseUp,
      click = p.OnClick,
    })
    p.OnMouseMove = eventMove
    p.OnMouseUp = finish
    p.OnClick = function(sender) end
  end

  pcall(function() obj.MouseCapture = true end)
  applySize(tonumber(x) or origWidth, tonumber(y) or origHeight)
end

local function tryPaletteClickInsert(rt, sender, targetNode, button, shift, x, y, callbacks)
  return false
end

local function canDropPaletteClassOnNode(className, targetNode)
  if not className or className == "" or not targetNode then return false end
  local targetClass = tostring(targetNode.class or "")

  -- ToolBar is special: it should only accept ToolButton children.
  if isToolBarClass(targetClass) then
    return isToolButtonClass(className)
  end

  -- ToolButton itself is not a container/drop target.
  if isToolButtonClass(targetClass) then return false end

  -- TabSheet can host normal controls, but not another TabSheet directly.
  -- A TabSheet belongs to a PageControl.
  if isTabSheetClass(targetClass) then
    return not isTabSheetClass(className) and not isToolButtonClass(className)
  end

  -- PageControl accepts TabSheet directly; normal controls are redirected by
  -- main.addComponentAt() to the first sheet, creating one if needed.
  if isPageControlClass(targetClass) then
    return not isToolButtonClass(className)
  end

  -- Generic containers accept normal controls.  ToolButton still only goes to
  -- ToolBar, handled above.
  if registry.isContainer(targetClass) then
    return not isToolButtonClass(className)
  end

  return false
end

local function attachPaletteDropHandlers(rt, obj, node, callbacks)
  if not obj or not node or not callbacks then return end
  if not registry.isContainer(node.class) then return end

  obj.OnDragOver = function(sender, source, x, y, state)
    if not (callbacks.isPaletteSource and callbacks.isPaletteSource(source)) then
      return false
    end
    local className = nil
    if callbacks.getPaletteClass then
      className = callbacks.getPaletteClass()
    end
    -- Older main.lua versions only expose isPaletteSource(); in that case
    -- accept the drag on containers and let addComponentAt() validate parentage.
    if className == nil then return true end
    return canDropPaletteClassOnNode(className, node)
  end

  obj.OnDragDrop = function(sender, source, x, y)
    if not (callbacks.isPaletteSource and callbacks.isPaletteSource(source)) then
      return false
    end
    if callbacks.onPaletteDrop then callbacks.onPaletteDrop(node, x, y) end
    return true
  end
end

local function attachMouseHandlers(rt, obj, node, callbacks)
  obj.OnClick = function(sender)
    if callbacks.onSelect then callbacks.onSelect(node) end
  end

  obj.OnMouseDown = function(sender, button, shift, x, y)
    if tryPaletteClickInsert(rt, sender, node, button, shift, x, y, callbacks) then return end
    if callbacks.onSelect then callbacks.onSelect(node) end
    startDrag(rt, node, sender, button, shift, x, y, callbacks)
  end
end

function M.rebuild(surface, project, callbacks)
  callbacks = callbacks or {}
  clearRuntime(M.current)

  local rt = { objects = {}, byNode = {}, byObject = {}, selectedNode = nil, project = project, callbacks = callbacks, surface = surface, gridPaintObjects = {}, actionKeepAlive = {} }
  local formNode = project.forms[1]

  local designRoot = VCL.Panel(surface, formNode.name .. "_host")
  designRoot._ = {
    Left = 16,
    Top = 16,
    Width = formNode.props.Width or 520,
    Height = formNode.props.Height or 360,
    Caption = "",
    BevelOuter = "bvRaised",
    Color = formNode.props.Color or M.options.backgroundColor or "clBtnFace",
  }

  rt.designRoot = designRoot
  rt.byNode[formNode] = designRoot
  rt.byObject[designRoot.Handle] = formNode
  table.insert(rt.objects, designRoot)

  pcall(function() designRoot.KeyPreview = true end)
  designRoot.OnKeyDown = function(sender, key, shift)
    if callbacks.onKeyDown and callbacks.onKeyDown(key, shift) then return 0 end
    return key
  end

  designRoot.OnClick = function(sender)
    if callbacks.onSelect then callbacks.onSelect(formNode) end
  end
  designRoot.OnMouseDown = function(sender, button, shift, x, y)
    if tryPaletteClickInsert(rt, sender, formNode, button, shift, x, y, callbacks) then return end
    if callbacks.onSelect then callbacks.onSelect(formNode) end
    startRootResize(rt, formNode, sender, button, shift, x, y, callbacks)
  end

  designRoot.OnDragOver = function(sender, source, x, y, state)
    if callbacks.onDragDebug then callbacks.onDragDebug('Form1 DragOver x='..tostring(x)..' y='..tostring(y)..' source='..tostring(source)) end
    if callbacks.isPaletteSource and callbacks.isPaletteSource(source) then
      return true
    end
    return false
  end
  designRoot.OnDragDrop = function(sender, source, x, y)
    if callbacks.onDragDebug then callbacks.onDragDebug('Form1 DragDrop x='..tostring(x)..' y='..tostring(y)..' source='..tostring(source)) end
    if callbacks.isPaletteSource and callbacks.isPaletteSource(source) then
      if callbacks.onPaletteDrop then callbacks.onPaletteDrop(formNode, x, y) end
    end
  end

  installGridPainter(rt, nil, formNode)

  local function addChildren(parentObj, parentNode)
    for _, child in ipairs(parentNode.items or {}) do
      local obj = makeControl(parentObj, child)
      rt.byNode[child] = obj
      rt.byObject[obj.Handle] = child
      table.insert(rt.objects, obj)

      attachMouseHandlers(rt, obj, child, callbacks)
      attachPaletteDropHandlers(rt, obj, child, callbacks)
      if shouldPaintGridForNode(child) then installGridPainter(rt, obj, child) end

      addChildren(obj, child)
    end
  end

  addChildren(designRoot, formNode)
  applyAllComponentRefs(rt)
  applyAllActions(rt)
  applyAllActionBindings(rt)
  applyAllMenuItems(rt)
  makeSelectionFrame(rt)
  makeTargetFrame(rt)
  invalidateGrid(rt)

  M.current = rt
  return rt
end


function M.rebuildFloating(project, callbacks)
  callbacks = callbacks or {}
  clearRuntime(M.current)

  local rt = { objects = {}, byNode = {}, byObject = {}, selectedNode = nil, project = project, callbacks = callbacks, surface = nil, floating = true, gridPaintObjects = {}, actionKeepAlive = {} }
  local formNode = project.forms[1]
  formNode.props = formNode.props or {}

  local designRoot = VCL.Form()
  pcall(function() designRoot.Name = formNode.name or "Form1" end)
  util.applyProps(designRoot, propsForDirectApply(formNode))
  if formNode.props.Position == nil then
    pcall(function() designRoot.Position = "poScreenCenter" end)
  end
  pcall(function() designRoot.FormStyle = "fsNormal" end)
  pcall(function() if not designRoot.Caption or designRoot.Caption == "" then designRoot.Caption = formNode.props.Caption or formNode.name or "Form1" end end)
  pcall(function() if not designRoot.Width or designRoot.Width <= 0 then designRoot.Width = formNode.props.Width or 520 end end)
  pcall(function() if not designRoot.Height or designRoot.Height <= 0 then designRoot.Height = formNode.props.Height or 360 end end)
  pcall(function() if formNode.props.Color == nil then designRoot.Color = M.options.backgroundColor or "clBtnFace" end end)
  loadIconFileToForm(designRoot, formNode)

  rt.designRoot = designRoot
  rt.byNode[formNode] = designRoot
  pcall(function() rt.byObject[designRoot.Handle] = formNode end)
  table.insert(rt.objects, designRoot)

  pcall(function() designRoot.KeyPreview = true end)
  designRoot.OnKeyDown = function(sender, key, shift)
    if callbacks.onKeyDown and callbacks.onKeyDown(key, shift) then return 0 end
    return key
  end

  pcall(function()
    designRoot.OnClose = function(sender, action)
      pcall(function() sender:Hide() end)
      return "caHide"
    end
  end)

  designRoot.OnClick = function(sender)
    if callbacks.onSelect then callbacks.onSelect(formNode) end
  end
  designRoot.OnMouseDown = function(sender, button, shift, x, y)
    if tryPaletteClickInsert(rt, sender, formNode, button, shift, x, y, callbacks) then return end
    if callbacks.onSelect then callbacks.onSelect(formNode) end
    startRootResize(rt, formNode, sender, button, shift, x, y, callbacks)
  end

  designRoot.OnDragOver = function(sender, source, x, y, state)
    if callbacks.onDragDebug then callbacks.onDragDebug('Form1 DragOver x='..tostring(x)..' y='..tostring(y)..' source='..tostring(source)) end
    if callbacks.isPaletteSource and callbacks.isPaletteSource(source) then
      return true
    end
    return false
  end
  designRoot.OnDragDrop = function(sender, source, x, y)
    if callbacks.onDragDebug then callbacks.onDragDebug('Form1 DragDrop x='..tostring(x)..' y='..tostring(y)..' source='..tostring(source)) end
    if callbacks.isPaletteSource and callbacks.isPaletteSource(source) then
      if callbacks.onPaletteDrop then callbacks.onPaletteDrop(formNode, x, y) end
    end
  end

  installGridPainter(rt, nil, formNode)

  local function addChildren(parentObj, parentNode)
    for _, child in ipairs(parentNode.items or {}) do
      local obj = makeControl(parentObj, child)
      rt.byNode[child] = obj
      pcall(function() rt.byObject[obj.Handle] = child end)
      table.insert(rt.objects, obj)
      attachMouseHandlers(rt, obj, child, callbacks)
      attachPaletteDropHandlers(rt, obj, child, callbacks)
      if shouldPaintGridForNode(child) then installGridPainter(rt, obj, child) end
      addChildren(obj, child)
    end
  end

  addChildren(designRoot, formNode)
  applyAllComponentRefs(rt)
  applyAllActions(rt)
  applyAllActionBindings(rt)
  applyAllMenuItems(rt)
  makeSelectionFrame(rt)
  makeTargetFrame(rt)
  invalidateGrid(rt)

  M.current = rt
  pcall(function() designRoot:Show() end)
  pcall(function() designRoot.Show(designRoot) end)
  return rt
end



local function liveAddChildren(rt, parentObj, parentNode, callbacks)
  for _, child in ipairs(parentNode.items or {}) do
    local obj = makeControl(parentObj, child)
    rt.byNode[child] = obj
    pcall(function() rt.byObject[obj.Handle] = child end)
    table.insert(rt.objects, obj)
    attachMouseHandlers(rt, obj, child, callbacks or rt.callbacks or {})
    attachPaletteDropHandlers(rt, obj, child, callbacks or rt.callbacks or {})
    if shouldPaintGridForNode(child) then installGridPainter(rt, obj, child) end
    liveAddChildren(rt, obj, child, callbacks or rt.callbacks or {})
  end
end

function M.addLiveNode(parentNode, node)
  local rt = M.current
  if not rt or not parentNode or not node then return false end
  local parentObj = rt.byNode[parentNode] or rt.designRoot
  if not parentObj then return false end
  local ok, err = pcall(function()
    local obj = makeControl(parentObj, node)
    rt.byNode[node] = obj
    pcall(function() rt.byObject[obj.Handle] = node end)
    table.insert(rt.objects, obj)
    attachMouseHandlers(rt, obj, node, rt.callbacks or {})
    attachPaletteDropHandlers(rt, obj, node, rt.callbacks or {})
    if shouldPaintGridForNode(node) then installGridPainter(rt, obj, node) end
    liveAddChildren(rt, obj, node, rt.callbacks or {})
    applyAllComponentRefs(rt)
    applyAllActions(rt)
    applyAllActionBindings(rt)
    applyAllMenuItems(rt)
    pcall(function() obj.Visible = true end)
  end)
  if not ok then print("addLiveNode failed:", tostring(err)); return false end
  invalidateGrid(rt)
  return true
end


function M.hideLiveSubtree(node)
  local rt = M.current
  if not rt or not node then return false end
  local function walk(n)
    local obj = rt.byNode[n]
    if obj then pcall(function() obj.Visible = false end) end
    for _, child in ipairs(n.items or {}) do walk(child) end
  end
  walk(node)
  showFrame(rt, nil)
  invalidateGrid(rt)
  return true
end

function M.setNodeVisible(node, visible)
  local rt = M.current
  if not rt or not node then return false end
  local obj = rt.byNode[node]
  if not obj then return false end
  pcall(function() obj.Visible = visible and true or false end)
  showFrame(rt, visible and obj or nil)
  return true
end

function M.moveLiveNodeToParent(node, parentNode)
  local rt = M.current
  if not rt or not node then return false end
  local obj = rt.byNode[node]
  local parentObj = parentNode and rt.byNode[parentNode] or rt.designRoot
  if not obj or not parentObj then return false end
  local ok, err = pcall(function()
    obj.Parent = parentObj
    local l = tonumber(node.props and node.props.Left) or tonumber(obj.Left) or 0
    local t = tonumber(node.props and node.props.Top) or tonumber(obj.Top) or 0
    local w = tonumber(node.props and node.props.Width) or tonumber(obj.Width) or nil
    local h = tonumber(node.props and node.props.Height) or tonumber(obj.Height) or nil
    if obj.SetBounds and w and h then obj:SetBounds(l, t, w, h)
    else
      obj.Left = l; obj.Top = t
      if w then obj.Width = w end
      if h then obj.Height = h end
    end
    obj.Visible = true
  end)
  if not ok then print("moveLiveNodeToParent failed:", tostring(err)); return false end
  invalidateGrid(rt)
  return true
end


local function safeReadProp(obj, prop)
  local ok, v = pcall(function() return obj[prop] end)
  if ok then return v end
  return nil
end

local function sameColor(a, b)
  if a == nil or b == nil then return a == b end
  return tostring(a) == tostring(b)
end

local function syncNodeVisualProps(rt, node, inheritedColor)
  if not rt or not node then return inheritedColor end
  local obj = rt.byNode[node]
  node.props = node.props or {}

  if obj then
    if node.class == "Form" or obj == rt.designRoot then
      local c = safeReadProp(obj, "Color")
      if c ~= nil then node.props.Color = c end
      local w = tonumber(safeReadProp(obj, "Width"))
      local h = tonumber(safeReadProp(obj, "Height"))
      if w then node.props.Width = w end
      if h then node.props.Height = h end
    else
      local l = tonumber(safeReadProp(obj, "Left"))
      local t = tonumber(safeReadProp(obj, "Top"))
      local w = tonumber(safeReadProp(obj, "Width"))
      local h = tonumber(safeReadProp(obj, "Height"))
      if l then node.props.Left = l end
      if t then node.props.Top = t end
      if w then node.props.Width = w end
      if h then node.props.Height = h end

      for _, prop in ipairs({ "Caption", "Text" }) do
        local v = safeReadProp(obj, prop)
        if v ~= nil and (node.props[prop] ~= nil or tostring(v) ~= "") then
          node.props[prop] = v
        end
      end

      for _, prop in ipairs({ "Enabled", "Checked", "TabOrder" }) do
        local v = safeReadProp(obj, prop)
        if v ~= nil and (node.props[prop] ~= nil or prop == "TabOrder") then
          node.props[prop] = v
        end
      end

      local c = safeReadProp(obj, "Color")
      if c ~= nil and registry.inheritsThemeColor(node.class) then
        if node.props.Color ~= nil then
          node.props.Color = c
        elseif not sameColor(c, inheritedColor) then
          node.props.Color = c
        end
      end
    end
  end

  local nextInherited = inheritedColor
  if node.props and node.props.Color ~= nil then nextInherited = node.props.Color end
  for _, child in ipairs(node.items or {}) do
    syncNodeVisualProps(rt, child, nextInherited)
  end
  return nextInherited
end

function M.syncRootVisualProps(formNode)
  local rt = M.current
  if not rt or not formNode then return end
  syncNodeVisualProps(rt, formNode, nil)
end

function M.syncLiveTreeToModel(project)
  local rt = M.current
  if not rt or not project then return end
  for _, formNode in ipairs(project.forms or {}) do
    syncNodeVisualProps(rt, formNode, nil)
  end
end

function M.getObject(node)
  local rt = M.current
  if not rt or not node then return nil end
  return rt.byNode[node]
end

function M.findNodeByObject(obj)
  local rt = M.current
  if not rt or not obj then return nil end
  for node, live in pairs(rt.byNode or {}) do
    if live == obj then return node end
    local ok = false
    pcall(function() ok = live and obj and live.Handle == obj.Handle end)
    if ok then return node end
  end
  return nil
end

function M.applyNodeProperty(node, prop, value)
  local rt = M.current
  if not rt or not node or not prop then return end
  local obj = rt.byNode[node]
  if not obj then return end

  node.props = node.props or {}

  if prop == "Name" then
    node.name = tostring(value or "")
    pcall(function() obj.Name = node.name end)
    showFrame(rt, obj)
    return
  end

  if node.class == "Form" or obj == rt.designRoot then
    if prop == "Width" then
      node.props.Width = tonumber(value) or node.props.Width or 520
      pcall(function() obj.Width = node.props.Width end)
      invalidateGrid(rt)
    elseif prop == "Height" then
      node.props.Height = tonumber(value) or node.props.Height or 360
      pcall(function() obj.Height = node.props.Height end)
      invalidateGrid(rt)
    elseif prop == "Caption" then
      node.props.Caption = tostring(value or "")
    elseif prop == "Color" then
      node.props.Color = value
      pcall(function() obj.Color = value end)
      invalidateGrid(rt)
    else
      node.props[prop] = value
      pcall(function() obj[prop] = value end)
    end
    showFrame(rt, obj)
    return
  end

  node.props[prop] = value

  if node.class == "ComboBox" and prop == "Style" then
    local liveValue = value
    if tostring(value or "") == "csDropDownList" then
      liveValue = "csDropDown"
    end
    local ok, err = pcall(function() obj[prop] = liveValue end)
    if not ok then print("property failed:", prop, tostring(err)) end
    showFrame(rt, obj)
    return
  end

  if node.class == "ActionList" and prop == "Actions" then
    applyActionsForNode(rt, node)
    applyAllActionBindings(rt)
    if nodeHasDesignerFrame(node) then showFrame(rt, obj) else showFrame(rt, nil) end
    return
  end

  if (node.class == "Button" or node.class == "SpeedButton" or node.class == "BitBtn" or node.class == "ToolButton" or node.class == "EditButton") and prop == "Action" then
    applyActionBindingForNode(rt, node)
    showFrame(rt, obj)
    return
  end

  if isImageListFilesProp(node, prop, value) then
    loadImageListFilesToObject(obj, node, rt.designRoot or obj)
    applyAllComponentRefs(rt)
    refreshImageListConsumers(rt, node)
    applyAllActionBindings(rt)
    showFrame(rt, obj)
    return
  end

  if isImagePictureFileProp(node, prop, value) then
    loadImageFileToObject(obj, node)
    showFrame(rt, obj)
    return
  end

  if isGlyphFileProp(node, prop) then
    loadGlyphFileToObject(obj, node)
    showFrame(rt, obj)
    return
  end

  if isFormIconFileProp(node, prop) then
    loadIconFileToForm(obj, node)
    showFrame(rt, obj)
    return
  end

  if (node.class == "MainMenu" or node.class == "PopupMenu") and prop == "MenuItems" then
    applyMenuItemsForNode(rt, node)
    if nodeHasDesignerFrame(node) then showFrame(rt, obj) else showFrame(rt, nil) end
    return
  end

  local refs = componentRefPropsForNode(node)
  if refs and refs[prop] then
    applyComponentRefsForNode(rt, node)
    if node.class == "ActionList" then
      applyActionsForNode(rt, node)
      applyAllActionBindings(rt)
    end
    applyGlyphFromImageListFile(rt, node)
    if node.class == "Button" or node.class == "SpeedButton" or node.class == "BitBtn" or node.class == "ToolButton" or node.class == "EditButton" then applyActionBindingForNode(rt, node) end
    if node.class == "MainMenu" or node.class == "PopupMenu" then
      applyMenuItemsForNode(rt, node)
      if nodeHasDesignerFrame(node) then showFrame(rt, obj) else showFrame(rt, nil) end
    else
      showFrame(rt, obj)
    end
    return
  end

  if prop == "Left" or prop == "Top" or prop == "Width" or prop == "Height" then
    M.applyNodeBounds(node)
    return
  end

  local ok, err = pcall(function() obj[prop] = value end)
  if not ok then print("property failed:", prop, tostring(err)) end

  if prop == "ImageIndex" or prop == "DisabledImageIndex" or prop == "HotImageIndex"
      or prop == "PressedImageIndex" or prop == "SelectedImageIndex" then
    reapplyImageIndexes(obj, node)
    applyGlyphFromImageListFile(rt, node)
  end

  showFrame(rt, obj)
end

function M.applyNodeBounds(node)
  local rt = M.current
  if not rt or not node then return end
  local obj = rt.byNode[node]
  if not obj then return end
  local props = node.props or {}
  if obj == rt.designRoot or node.class == "Form" then
    local w = tonumber(props.Width) or tonumber(obj.Width) or 520
    local h = tonumber(props.Height) or tonumber(obj.Height) or 360
    pcall(function() obj.Width = w end)
    pcall(function() obj.Height = h end)
    invalidateGrid(rt)
    showFrame(rt, obj)
    return
  end
  local l = tonumber(props.Left) or tonumber(obj.Left) or 0
  local t = tonumber(props.Top) or tonumber(obj.Top) or 0
  local w = tonumber(props.Width) or tonumber(obj.Width) or 1
  local h = tonumber(props.Height) or tonumber(obj.Height) or 1
  if obj.SetBounds then
    pcall(function() obj:SetBounds(l, t, w, h) end)
  else
    setBounds(obj, l, t, w, h)
  end
  showFrame(rt, obj)
end

function M.refreshNode(node)
  local rt = M.current
  if not rt or not node then return end
  local obj = rt.byNode[node]
  if node.class == "MainMenu" or node.class == "PopupMenu" then
    applyMenuItemsForNode(rt, node)
  elseif node.class == "ActionList" then
    applyActionsForNode(rt, node)
  end
  if obj and nodeHasDesignerFrame(node) then showFrame(rt, obj) else showFrame(rt, nil) end
  invalidateGrid(rt)
end


function M.installPaletteDrop(opts)
  return false
end

return M
