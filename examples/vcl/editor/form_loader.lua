-- VCLua .vclform loader

local VCL = require "vcl"
local resourceLoader = require "resource_loader"

local M = {}

local function safeCall(fn)
  local ok, a, b, c = pcall(fn)
  if ok then return true, a, b, c end
  return false, a
end

local function applyProps(obj, props)
  props = props or {}

  local ok = pcall(function() obj._ = props end)
  if ok then return true end

  for k, v in pairs(props) do
    pcall(function() obj[k] = v end)
  end
  return true
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
  if not obj or not propName or type(values) ~= "table" then return false end
  local stringsObj = nil
  pcall(function() stringsObj = obj[propName] end)
  if not stringsObj then return false end

  clearStrings(stringsObj)
  for _, v in ipairs(values) do
    addString(stringsObj, v)
  end
  return true
end

local function applyCollections(obj, node)
  local collections = node.collections or {}
  for propName, values in pairs(collections) do
    applyStringCollection(obj, propName, values)
  end
end

local function createObject(parent, node, ui, opts)
  if not node or not node.class then error("Invalid .vclform node") end
  local className = tostring(node.class)
  local ctor = VCL[className]
  if not ctor then error("Unknown VCL class in .vclform: " .. className) end

  local obj
  if className == "Form" then
    obj = ctor()
  else
    obj = ctor(parent, node.name)
  end

  if node.name and node.name ~= "" then
    pcall(function() obj.Name = node.name end)
    ui[node.name] = obj
  end

  applyProps(obj, node.props)
  applyCollections(obj, node)

  for _, child in ipairs(node.items or {}) do
    createObject(obj, child, ui, opts)
  end

  return obj
end

local function loadProject(path)
  local chunk, err = resourceLoader.loadChunk(path)
  if not chunk then error("Cannot load .vclform: " .. tostring(path) .. ": " .. tostring(err)) end
  local ok, project = pcall(chunk)
  if not ok then error("Cannot execute .vclform: " .. tostring(path) .. ": " .. tostring(project)) end
  if type(project) ~= "table" then error(".vclform did not return a table: " .. tostring(path)) end
  return project
end

function M.load(path, opts)
  opts = opts or {}
  local project = loadProject(path)
  local formNode = project.forms and project.forms[1]
  if not formNode then error(".vclform contains no form: " .. tostring(path)) end

  local ui = {}
  local form = createObject(nil, formNode, ui, opts)

  return {
    path = path,
    project = project,
    root = formNode,
    form = form,
    ui = ui,
  }
end

return M
