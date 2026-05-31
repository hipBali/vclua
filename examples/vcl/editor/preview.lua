-- ***************************************
-- VCLua Form tool
-- Copyright (C) 2013-2026 Hi-Project Ltd.
-- ***************************************
-- Runtime preview for the VCLua form editor.

local util = require "vcl.editor.util"
local registry = require "vcl.editor.registry"

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

local function applyStringCollection(obj, propName, values)
  if not obj or not propName or type(values) ~= "table" then return false end
  local owned = {}
  for i, v in ipairs(values) do owned[i] = tostring(v or "") end

  local stringsObj = nil
  pcall(function() stringsObj = obj[propName] end)
  if stringsObj then
    clearStrings(stringsObj)
    for _, line in ipairs(owned) do addString(stringsObj, line) end
    return true
  end

  return pcall(function() obj[propName] = owned end)
end

local function applyCollections(obj, node)
  local meta = registry.collectionsFor(node.class) or {}
  local cols = node.collections or {}
  for propName, values in pairs(cols) do
    if (meta[propName] or "strings") == "strings" then
      applyStringCollection(obj, propName, values)
    end
  end
end

local runtimeOnlyHint = {
  Position = true,
  WindowState = true,
  BorderStyle = true,
  FormStyle = true,
  ShowInTaskBar = true,
}

local function applyFormProps(form, props)
  util.applyProps(form, props or {})
end

local function createControl(parent, node)
  if not node or not node.class then return nil end
  if not VCL[node.class] then return nil, "Not exposed by VCLua: " .. tostring(node.class) end

  local ok, objOrErr = pcall(function()
    return VCL[node.class](parent, node.name)
  end)
  if not ok then return nil, objOrErr end
  local obj = objOrErr

  pcall(function() obj.Name = node.name end)
  util.applyProps(obj, node.props or {})
  applyCollections(obj, node)

  for _, child in ipairs(node.items or {}) do
    local childObj, err = createControl(obj, child)
    if not childObj and err then print("[PREVIEW]", tostring(err)) end
  end
  return obj
end

function M.show(project)
  local root = project and project.forms and project.forms[1]
  if not root then
    VCL.ShowMessage("No form to preview")
    return false
  end

  local form = VCL.Form()
  pcall(function() form.Name = root.name or "Form1" end)
  applyFormProps(form, root.props or {})
  applyCollections(form, root)

  pcall(function() form.KeyPreview = true end)
  form.OnKeyDown = function(sender, key, shift)
    local s = tostring(key or "")
    if key == 27 or s == "Escape" or s == "Esc" or s == "VK_ESCAPE" then
      pcall(function() form:Close() end)
      return 0
    end
    return key
  end

  for _, child in ipairs(root.items or {}) do
    local childObj, err = createControl(form, child)
    if not childObj and err then print("[PREVIEW]", tostring(err)) end
  end

  local ok, err = pcall(function() form:ShowModal() end)
  pcall(function() form:Free() end)
  if not ok then
    VCL.ShowMessage("Preview failed: " .. tostring(err))
    return false
  end
  return true
end

return M
