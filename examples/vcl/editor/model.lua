-- ***************************************
-- VCLua Form tool
-- Copyright (C) 2013-2026 Hi-Project Ltd.
-- ***************************************
-- Minimal form-editor model.

local registry = require "registry"

local M = {}

local counters = {}

local function nextName(className)
  counters[className] = (counters[className] or 0) + 1
  return className .. tostring(counters[className])
end

local defaultDesigner = {
  grid = {
    visible = true,
    snap = false,
    size = 8,
    shape = "dot",      -- dot / cross / line
    color = 0x00A0A0A0,  -- TColor value, neutral gray
    majorEvery = 5,
    majorColor = 0x00606060,
    backgroundColor = "clBtnFace",
  },
  selection = {
    moveColor = "clHighlight",
    resizeColor = "clRed",
    thickness = 2,
  },
}

local function copyMissing(dst, src)
  if type(dst) ~= "table" then dst = {} end
  for k, v in pairs(src) do
    if type(v) == "table" then
      dst[k] = copyMissing(dst[k], v)
    elseif dst[k] == nil then
      dst[k] = v
    end
  end
  return dst
end


local function cloneValue(v, seen)
  if type(v) ~= "table" then return v end
  seen = seen or {}
  if seen[v] then return seen[v] end
  local out = {}
  seen[v] = out
  for k, val in pairs(v) do
    out[cloneValue(k, seen)] = cloneValue(val, seen)
  end
  return out
end

function M.cloneValue(v)
  return cloneValue(v)
end

function M.ensureDesigner(project)
  project.designer = copyMissing(project.designer, defaultDesigner)
  return project.designer
end

function M.resetCounters(project)
  counters = { Form = 1 }

  local function scanNode(node)
    if not node then return end
    local className = node.class
    local num = tostring(node.name or ""):match("^" .. tostring(className) .. "(%d+)$")
    if className and num then
      num = tonumber(num)
      if num and num >= (counters[className] or 0) then
        counters[className] = num + 1
      end
    end
    for _, child in ipairs(node.items or {}) do
      scanNode(child)
    end
  end

  if project and project.forms then
    for _, form in ipairs(project.forms) do scanNode(form) end
  end
end

function M.newProject()
  counters = { Form = 1 }
  local project = {
    version = 1,
    designer = {},
    forms = {
      {
        class = "Form",
        name = "Form1",
        props = {
          Caption = "Form1",
          Width = 520,
          Height = 360,
          Position = "poScreenCenter",
        },
        events = {},
        collections = {},
        items = {},
      }
    }
  }
  M.ensureDesigner(project)
  return project
end

function M.getRoot(project)
  return project.forms[1]
end


function M.findInheritedColor(project, parentNode)
  if not project or not parentNode then return nil end

  local path = {}
  local function walk(node)
    if node == parentNode then
      table.insert(path, node)
      return true
    end
    for _, child in ipairs(node.items or {}) do
      if walk(child) then
        table.insert(path, 1, node)
        return true
      end
    end
    return false
  end

  for _, form in ipairs(project.forms or {}) do
    if walk(form) then break end
  end

  for i = #path, 1, -1 do
    local n = path[i]
    if n and n.props and n.props.Color ~= nil then return n.props.Color end
  end

  local root = M.getRoot(project)
  if root and root.props then return root.props.Color end
  return nil
end

function M.applyThemeToNewNode(project, parentNode, node)
  if not node or not registry.inheritsThemeColor(node.class) then return end
  node.props = node.props or {}
  if node.props.Color ~= nil then return end
  local color = M.findInheritedColor(project, parentNode)
  if color ~= nil then node.props.Color = color end
end

function M.addChild(parentNode, className)
  local node = {
    class = className,
    name = nextName(className),
    props = {},
    events = {},
    collections = {},
    items = {},
  }

  node.props = registry.defaultsFor(className, node.name)

  table.insert(parentNode.items, node)
  return node
end

local function refreshDefaultTextProps(src, dst, renamed)
  if not renamed or not src or not dst then return end
  dst.props = dst.props or {}
  local oldName = tostring(src.name or "")
  local newName = tostring(dst.name or "")
  if oldName == "" or newName == "" or oldName == newName then return end

  if dst.props.Caption ~= nil and tostring(dst.props.Caption) == oldName then
    dst.props.Caption = newName
  end
  if dst.props.Text ~= nil and tostring(dst.props.Text) == oldName then
    dst.props.Text = newName
  end
end

local function deepCopyNode(node, rename)
  local copy = {
    class = node.class,
    name = rename and nextName(node.class) or node.name,
    props = {},
    events = {},
    collections = {},
    items = {},
  }
  copy.props = cloneValue(node.props or {})
  copy.events = cloneValue(node.events or {})
  copy.collections = cloneValue(node.collections or {})
  refreshDefaultTextProps(node, copy, rename)
  for _, child in ipairs(node.items or {}) do
    table.insert(copy.items, deepCopyNode(child, true))
  end
  return copy
end

function M.duplicateNode(project, target)
  if not project or not target then return nil, "missing project or target" end
  if target == M.getRoot(project) then return nil, "the root form cannot be duplicated yet" end

  local parent = M.findParent(project, target)
  if not parent then return nil, "parent not found" end

  local copy = deepCopyNode(target, true)
  copy.props = copy.props or {}
  if copy.props.Left ~= nil then copy.props.Left = (tonumber(copy.props.Left) or 0) + 16 end
  if copy.props.Top ~= nil then copy.props.Top = (tonumber(copy.props.Top) or 0) + 16 end

  local insertAt = #(parent.items or {}) + 1
  for i, child in ipairs(parent.items or {}) do
    if child == target then insertAt = i + 1; break end
  end
  table.insert(parent.items, insertAt, copy)
  return copy
end


function M.copyNode(source)
  if not source then return nil end
  return deepCopyNode(source, false)
end

function M.pasteCopy(project, parent, source, offset)
  if not project or not parent or not source then return nil, "missing project, parent, or source" end
  parent.items = parent.items or {}
  local copy = deepCopyNode(source, true)
  copy.props = copy.props or {}
  offset = tonumber(offset) or 16
  if copy.props.Left ~= nil then copy.props.Left = (tonumber(copy.props.Left) or 0) + offset end
  if copy.props.Top ~= nil then copy.props.Top = (tonumber(copy.props.Top) or 0) + offset end
  table.insert(parent.items, copy)
  return copy
end

function M.insertExistingNode(project, parent, node)
  if not project or not parent or not node then return nil, "missing project, parent, or node" end
  if node == M.getRoot(project) then return nil, "the root form cannot be pasted" end
  if node == parent or M.isAncestor(node, parent) then return nil, "cannot paste a control into itself or its child" end
  parent.items = parent.items or {}
  table.insert(parent.items, node)
  return node
end

function M.moveNodeWithinParent(project, target, delta)
  if not project or not target then return false, "missing project or target" end
  if target == M.getRoot(project) then return false, "the root form cannot be reordered" end
  delta = tonumber(delta) or 0
  if delta == 0 then return false, "zero delta" end
  local parent = M.findParent(project, target)
  if not parent then return false, "parent not found" end
  local items = parent.items or {}
  for i, child in ipairs(items) do
    if child == target then
      local ni = i + delta
      if ni < 1 then ni = 1 end
      if ni > #items then ni = #items end
      if ni == i then return false, "already at boundary", parent end
      table.remove(items, i)
      table.insert(items, ni, target)
      return true, nil, parent
    end
  end
  return false, "target not found"
end

function M.moveNodeAfter(project, target, afterNode)
  if not project or not target or not afterNode then return false, "missing project, target, or sibling" end
  if target == M.getRoot(project) then return false, "the root form cannot be reordered" end
  if target == afterNode then return false, "same node" end
  local parent = M.findParent(project, target)
  local dstParent = M.findParent(project, afterNode)
  if not parent or parent ~= dstParent then return false, "nodes are not siblings" end
  local items = parent.items or {}
  local srcIndex, dstIndex
  for i, child in ipairs(items) do
    if child == target then srcIndex = i end
    if child == afterNode then dstIndex = i end
  end
  if not srcIndex or not dstIndex then return false, "sibling not found" end
  table.remove(items, srcIndex)
  if srcIndex < dstIndex then dstIndex = dstIndex - 1 end
  table.insert(items, dstIndex + 1, target)
  return true, nil, parent
end

function M.updateTabOrders(project)
  local changed = {}
  local function walk(parent)
    local tab = 0
    for _, child in ipairs(parent.items or {}) do
      if registry.isTabOrderable(child.class) then
        child.props = child.props or {}
        if tonumber(child.props.TabOrder) ~= tab then
          child.props.TabOrder = tab
          table.insert(changed, child)
        end
        tab = tab + 1
      end
    end
    for _, child in ipairs(parent.items or {}) do walk(child) end
  end
  for _, form in ipairs(project.forms or {}) do walk(form) end
  return changed
end

function M.findParent(project, target)
  if not project or not target then return nil end

  local function walk(parent)
    for _, child in ipairs(parent.items or {}) do
      if child == target then return parent end
      local p = walk(child)
      if p then return p end
    end
  end

  for _, form in ipairs(project.forms or {}) do
    local p = walk(form)
    if p then return p end
  end
end

function M.deleteNode(project, target)
  if not project or not target then return false, "missing project or target" end
  if target == M.getRoot(project) then return false, "the root form cannot be deleted" end

  local parent = M.findParent(project, target)
  if not parent then return false, "parent not found" end

  for i, child in ipairs(parent.items or {}) do
    if child == target then
      table.remove(parent.items, i)
      return true, nil, parent
    end
  end

  return false, "target not found"
end


function M.isAncestor(parentNode, maybeChild)
  if not parentNode or not maybeChild then return false end
  local function walk(node)
    for _, child in ipairs(node.items or {}) do
      if child == maybeChild then return true end
      if walk(child) then return true end
    end
    return false
  end
  return walk(parentNode)
end

function M.moveNodeToParent(project, target, newParent, left, top)
  if not project or not target or not newParent then return false, "missing project, target, or new parent" end
  if target == M.getRoot(project) then return false, "the root form cannot be reparented" end
  if target == newParent or M.isAncestor(target, newParent) then return false, "cannot move a control into itself or its child" end

  local oldParent = M.findParent(project, target)
  if not oldParent then return false, "old parent not found" end
  if oldParent == newParent then
    target.props = target.props or {}
    if left ~= nil then target.props.Left = math.max(0, math.floor(tonumber(left) or 0)) end
    if top ~= nil then target.props.Top = math.max(0, math.floor(tonumber(top) or 0)) end
    return true, nil, oldParent, newParent
  end

  for i, child in ipairs(oldParent.items or {}) do
    if child == target then
      table.remove(oldParent.items, i)
      break
    end
  end

  newParent.items = newParent.items or {}
  table.insert(newParent.items, target)
  target.props = target.props or {}
  target.props.Left = math.max(0, math.floor(tonumber(left) or 0))
  target.props.Top = math.max(0, math.floor(tonumber(top) or 0))
  return true, nil, oldParent, newParent
end

return M
