-- ***************************************
-- VCLua Form tool
-- Copyright (C) 2013-2026 Hi-Project Ltd.
-- ***************************************
-- Categorized component palette.

local M = {}

local tree = nil
local classByIndex = {}
local onAdd = nil
local iconIndexFor = nil
local debugCallback = nil
local paletteHandle = nil
local lastClickIndex = nil
local lastClickTime = 0
local paletteDragging = false

local function safeAdd(parentTreeNode, text)
  if parentTreeNode then
    return tree.Items:AddChild(parentTreeNode, text)
  end
  return tree.Items:Add(nil, text)
end

local function setIcon(tn, iconName)
  if not tn or not iconIndexFor then return end
  local idx = iconIndexFor(iconName)
  if idx then pcall(function() tn.StateIndex = idx end) end
end

function M.init(aTree, addCallback, opts)
  tree = aTree
  onAdd = addCallback
  pcall(function() paletteHandle = tree.Handle end)
  pcall(function() tree.DragMode = 'dmAutomatic' end)
  tree.OnStartDrag = function(sender, dragObject)
    paletteDragging = true
    if debugCallback then debugCallback('palette start drag') end
  end
  tree.OnEndDrag = function(sender, target, x, y)
    if debugCallback then debugCallback('palette end drag') end
    paletteDragging = false
  end
  tree.OnMouseDown = function(sender, button, shift, x, y)
    local tn = sender.Selected
    if tn and classByIndex[tn.AbsoluteIndex] then
      paletteDragging = true
      if debugCallback then debugCallback('palette mouse down: '..tostring(classByIndex[tn.AbsoluteIndex])) end
    end
  end
  tree.OnMouseUp = function(sender, button, shift, x, y)
    paletteDragging = false
  end
  opts = opts or {}
  iconIndexFor = opts.iconIndexFor
  debugCallback = opts.onDebug

  tree.OnClick = function(sender)
    -- selection is handled by the TreeView itself; do not add here
  end

  tree.OnDblClick = function(sender)
    local tn = sender.Selected
    if not tn then return end
    local className = classByIndex[tn.AbsoluteIndex]
    if className and onAdd then onAdd(className) end
  end

  tree.OnKeyDown = function(sender, key, shift)
    local s = tostring(key or '')
    local code = type(key) == 'number' and key or tonumber(s)
    if code == 13 or s == 'VK_RETURN' or s == 'Return' or s == 'Enter' then
      local tn = sender.Selected
      if tn then
        local className = classByIndex[tn.AbsoluteIndex]
        if className and onAdd then onAdd(className) end
      end
    end
    return key
  end
end

function M.rebuild(registry, vcl, filterText)
  classByIndex = {}
  tree.Items:Clear()
  local categories = registry.categories or {}
  local filter = tostring(filterText or ""):lower()

  for _, cat in ipairs(categories) do
    local catNode = nil
    local any = false

    for _, className in ipairs(cat.items or {}) do
      local def = registry.get(className)
      if def and def.creatable ~= false and (not vcl or vcl[className]) then
        local label = def.paletteName or className
        local hay = (label .. " " .. className .. " " .. tostring(cat.title or cat.name or "")):lower()
        if filter == "" or hay:find(filter, 1, true) then
          if not catNode then
            catNode = safeAdd(nil, cat.title or cat.name)
            setIcon(catNode, cat.icon or 'category')
          end
          local tn = safeAdd(catNode, label)
          classByIndex[tn.AbsoluteIndex] = className
          setIcon(tn, def.icon or className)
          any = true
        end
      end
    end
  end

  pcall(function() tree:FullExpand() end)
  pcall(function() tree.FullExpand(tree) end)
end


function M.selectedClass()
  if not tree then return nil end
  local tn = tree.Selected
  if not tn then return nil end
  return classByIndex[tn.AbsoluteIndex]
end

function M.isSource(source)
  if paletteDragging then return true end
  if not source or not paletteHandle then return false end
  local ok, h = pcall(function() return source.Handle end)
  if ok and h == paletteHandle then return true end
  return false
end

return M
