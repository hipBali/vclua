-- ***************************************
-- VCLua Form tool
-- Copyright (C) 2013-2026 Hi-Project Ltd.
-- ***************************************
-- TIPropertyGrid based inspector.

local M = {}

local propGrid = nil
local selectedNode = nil
local callbacks = nil
local filling = false
local currentObject = nil
local snapshot = nil

local watchedProps = {
  "Caption", "Text", "Left", "Top", "Width", "Height",
  "Color", "Enabled", "Visible", "Checked", "TabOrder"
}

local function readProp(obj, prop)
  if not obj then return nil, false end
  local ok, v = pcall(function() return obj[prop] end)
  if ok then return v, true end
  return nil, false
end

local function makeSnapshot(obj)
  local t = {}
  for _, prop in ipairs(watchedProps) do
    local v, ok = readProp(obj, prop)
    if ok then t[prop] = v end
  end
  return t
end

local function commitSelectedDiffs(reason)
  if filling or not selectedNode or not currentObject or not snapshot then return end
  if not callbacks or not callbacks.onModified then return end
  for _, prop in ipairs(watchedProps) do
    local v, ok = readProp(currentObject, prop)
    if ok and snapshot[prop] ~= v then
      callbacks.onModified(selectedNode, {}, prop, v, "@diff:" .. tostring(reason or "commit"))
      snapshot[prop] = v
    end
  end
end

local function splitPath(path)
  local t = {}
  for s in tostring(path or ""):gmatch("([^%.]+)") do
    if s ~= "" then table.insert(t, s) end
  end
  return t
end

local function isComponent(obj)
  if type(obj) ~= "table" then return false end
  local ok, r = pcall(function() return obj.Handle ~= nil and obj:is("TComponent") end)
  return ok and r and true or false
end

local function getProperty(p, pPath)
  local propPath, lastComponent = {}, nil
  for s in tostring(pPath or ""):gmatch("([^%.]+)") do
    if type(p) == "table" and p.Handle then
      local ok, isComp = pcall(function() return p:is('TComponent') end)
      if ok and isComp then
        lastComponent = p
        propPath = { s }
      else
        table.insert(propPath, s)
      end
    else
      table.insert(propPath, s)
    end

    local ok, v = pcall(function() return p[s] end)
    if not ok then return nil, lastComponent, propPath end
    p = v
  end
  return p, lastComponent, propPath
end

local function setFilter(pg)
  local filter = '[tkInteger, tkChar, tkEnumeration, tkFloat, tkSet, tkSString, tkLString, tkAString, tkWString, tkClass, tkWChar, tkBool, tkInt64, tkQWord, tkUString, tkUChar]'
  pcall(function() pg.Filter = filter end)
end

local function getPropFromRow(sender)
  sender = sender or propGrid
  if not sender then return nil end

  local row = nil
  local okRow = pcall(function() row = sender:GetActiveRow() end)
  if not okRow or not row then return nil end

  local path = nil
  local okPath = pcall(function() path = sender:PropertyPath2(row) end)
  if not okPath or not path or tostring(path) == "" then return nil end

  local pp = splitPath(path)
  if #pp == 0 then return nil end

  local editor = nil
  pcall(function() editor = row.Editor end)
  if editor then
    local okSet, isSet = pcall(function() return editor:is('TSetElementPropertyEditor') end)
    if okSet and isSet then table.remove(pp) end
  end
  if #pp == 0 then return nil end

  local tiObj = nil
  pcall(function() tiObj = sender.TIObject end)
  if not tiObj then
    if callbacks and callbacks.getObject then tiObj = callbacks.getObject(selectedNode) end
  end
  if not tiObj then return nil end

  local propValue, lastComponent, propPath = getProperty(tiObj, table.concat(pp, '.'))
  local elem = selectedNode
  local vclo = nil

  if lastComponent then
    local same = false
    pcall(function() same = lastComponent.Handle == tiObj.Handle end)
    if not same and callbacks and callbacks.findNodeByObject then
      local other = callbacks.findNodeByObject(lastComponent)
      if other then
        elem = other
        vclo = lastComponent
        pp = propPath or pp
      end
    end
  end

  local collectionField = nil
  pcall(function()
    local np = tiObj:GetNamePath()
    collectionField = tostring(np or ""):match('.+%.([_%w]+)%[[^[%]]+%]$')
  end)
  if collectionField then
    local owner = nil
    pcall(function() owner = tiObj.Collection:Owner() end)
    if owner and callbacks and callbacks.findNodeByObject then
      local ownerNode = callbacks.findNodeByObject(owner)
      if ownerNode then
        elem = ownerNode
        local id = nil
        pcall(function() id = tiObj.ID + 1 end)
        if id then
          table.insert(pp, 1, collectionField)
          table.insert(pp, 2, id)
        end
      end
    end
  end

  local propName = table.remove(pp)
  if not elem or not propName then return nil end

  return elem, pp, propName, propValue, path, vclo
end

local function editorPropertyPath(editor)
  if not editor then return "" end

  local path = nil
  pcall(function() path = editor:GetPropertyPath() end)
  if path and tostring(path) ~= "" then return tostring(path) end

  pcall(function() path = editor.PropertyPath end)
  if path and tostring(path) ~= "" then return tostring(path) end

  pcall(function() path = editor.PropertyName end)
  if path and tostring(path) ~= "" then return tostring(path) end

  return ""
end

local function shouldHideEditor(editor)
  -- Hides properties owned by special editors.
  local path = editorPropertyPath(editor)

  if selectedNode and selectedNode.class == "Form" then
    if path == "Icon" or path:match("%.Icon$") or path:match("^Icon%.") or path:match("%.Icon%.")
      or path == "IconFile" or path:match("%.IconFile$") then
      return true
    end
  end

  if selectedNode and selectedNode.class == "Image" then
    if path == "Picture" or path:match("%.Picture$") or path:match("^Picture%.") or path:match("%.Picture%.")
      or path == "PictureFile" or path:match("%.PictureFile$")
      or path == "ImageFile" or path:match("%.ImageFile$") then
      return true
    end
  end

  if selectedNode and selectedNode.class == "ToolBar" then
    if path == "Images" or path == "DisabledImages" or path == "HotImages"
      or path:match("%.Images$") or path:match("%.DisabledImages$") or path:match("%.HotImages$") then
      return true
    end
  end

  if selectedNode and selectedNode.class == "PageControl" then
    if path == "Images" or path:match("%.Images$") then
      return true
    end
  end


  if selectedNode and selectedNode.class == "TreeView" then
    if path == "Images" or path == "StateImages"
      or path:match("%.Images$") or path:match("%.StateImages$") then
      return true
    end
  end


  if selectedNode and selectedNode.class == "ListView" then
    if path == "SmallImages" or path == "LargeImages" or path == "StateImages"
      or path:match("%.SmallImages$") or path:match("%.LargeImages$") or path:match("%.StateImages$") then
      return true
    end
  end

  if selectedNode and (selectedNode.class == "MainMenu" or selectedNode.class == "PopupMenu") then
    if path == "Images" or path:match("%.Images$")
      or path == "MenuItems" or path:match("%.MenuItems$") or path:match("^MenuItems%.") or path:match("%.MenuItems%.") then
      return true
    end
  end


  if selectedNode and selectedNode.class == "ActionList" then
    if path == "Actions" or path:match("%.Actions$") or path:match("^Actions%.") or path:match("%.Actions%.") then
      return true
    end
  end

  if selectedNode and (selectedNode.class == "SpeedButton" or selectedNode.class == "BitBtn"
      or selectedNode.class == "EditButton") then
    if path == "Glyph" or path:match("%.Glyph$") or path:match("^Glyph%.") or path:match("%.Glyph%.")
      or path == "GlyphFile" or path:match("%.GlyphFile$") then
      return true
    end
    if path == "Images" or path:match("%.Images$") then
      return true
    end
  end

  return false
end

function M.init(aPropGrid, cb)
  propGrid = aPropGrid
  callbacks = cb or {}
  setFilter(propGrid)

  propGrid.OnEditorFilter = function(sender, editor, show)
    if shouldHideEditor(editor) then return false end
    return show
  end

  propGrid.OnModified = function(sender)
    if filling or not selectedNode then return end

    local elem, parentPath, propName, propValue, rawPath = getPropFromRow(sender)
    if not elem or not propName then return end

    if callbacks.onModified then
      callbacks.onModified(elem, parentPath or {}, propName, propValue, rawPath)
      if elem == selectedNode and snapshot and #(parentPath or {}) == 0 then
        snapshot[propName] = propValue
      end
    end
  end
end


function M.commitLiveDiffs(reason)
  commitSelectedDiffs(reason or "commitLiveDiffs")
end

function M.commitPendingEdit()
  if not propGrid then return end
  commitSelectedDiffs("commitPendingEdit")
  filling = true
  pcall(function() propGrid.TIObject = nil end)
  filling = false
end

function M.showNode(node)
  commitSelectedDiffs("selection-change")
  selectedNode = node
  if not propGrid then return end
  filling = true
  local obj = nil
  if callbacks and callbacks.getObject then obj = callbacks.getObject(node) end
  currentObject = obj
  snapshot = obj and makeSnapshot(obj) or nil
  pcall(function() propGrid.TIObject = obj end)
  filling = false
end

function M.refresh()
  if selectedNode then M.showNode(selectedNode) end
end

return M
