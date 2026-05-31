-- ***************************************
-- VCLua Form tool
-- Copyright (C) 2013-2026 Hi-Project Ltd.
-- ***************************************
-- Saves/loads the designer model and exports lua/json formats.

local M = {}

local function quote(s)
  return string.format("%q", tostring(s or ""))
end

local function sortedKeys(t)
  local keys = {}
  for k in pairs(t or {}) do table.insert(keys, k) end
  table.sort(keys, function(a, b) return tostring(a) < tostring(b) end)
  return keys
end

local luaReserved = {
  ["and"] = true, ["break"] = true, ["do"] = true, ["else"] = true,
  ["elseif"] = true, ["end"] = true, ["false"] = true, ["for"] = true,
  ["function"] = true, ["goto"] = true, ["if"] = true, ["in"] = true,
  ["local"] = true, ["nil"] = true, ["not"] = true, ["or"] = true,
  ["repeat"] = true, ["return"] = true, ["then"] = true, ["true"] = true,
  ["until"] = true, ["while"] = true,
}

local function validIdent(s)
  return type(s) == "string" and s:match("^[A-Za-z_][A-Za-z0-9_]*$") ~= nil and not luaReserved[s]
end

local function luaKey(k)
  if validIdent(k) then
    return k
  end
  return "[" .. quote(k) .. "]"
end

local function isArray(t)
  if type(t) ~= "table" then return false end
  local n = #t
  if n == 0 then return false end
  for k in pairs(t) do
    if type(k) ~= "number" or k < 1 or k > n or k ~= math.floor(k) then return false end
  end
  return true
end

local function writeValue(v, indent)
  indent = indent or ""
  if type(v) == "string" then
    return quote(v)
  elseif type(v) == "number" or type(v) == "boolean" then
    return tostring(v)
  elseif type(v) == "table" then
    local lines = { "{" }
    local nextIndent = indent .. "  "
    if isArray(v) then
      -- component order !!!
      for _, item in ipairs(v) do
        table.insert(lines, nextIndent .. writeValue(item, nextIndent) .. ",")
      end
    else
      for _, k in ipairs(sortedKeys(v)) do
        table.insert(lines, nextIndent .. luaKey(k) .. " = " .. writeValue(v[k], nextIndent) .. ",")
      end
    end
    table.insert(lines, indent .. "}")
    return table.concat(lines, "\n")
  else
    return "nil"
  end
end

function M.saveLua(project, fileName)
  local f, err = io.open(fileName, "w+b")
  if not f then return false, err end
  f:write("-- VCLua form designer file\n\n")
  f:write("return ")
  f:write(writeValue(project, ""))
  f:write("\n")
  f:close()
  return true
end

function M.loadLua(fileName)
  local chunk, err = loadfile(fileName)
  if not chunk then return nil, err end

  local ok, data = pcall(chunk)
  if not ok then return nil, data end

  if type(data) ~= "table" then
    return nil, "file did not return a Lua table"
  end
  if type(data.forms) ~= "table" or type(data.forms[1]) ~= "table" then
    return nil, "invalid form model: missing forms[1]"
  end

  data.version = data.version or 1
  local function normalizeNode(node)
    if type(node) ~= "table" then return end
    node.props = node.props or {}
    node.events = node.events or {}
    node.collections = node.collections or {}
    node.items = node.items or {}
    for _, child in ipairs(node.items) do normalizeNode(child) end
  end

  for _, form in ipairs(data.forms or {}) do normalizeNode(form) end

  return data
end

-- JSON export --------------------------------------------------------------

local function jsonQuote(s)
  s = tostring(s or "")
  s = s:gsub('\\', '\\\\')
       :gsub('"', '\\"')
       :gsub('\b', '\\b')
       :gsub('\f', '\\f')
       :gsub('\n', '\\n')
       :gsub('\r', '\\r')
       :gsub('\t', '\\t')
  return '"' .. s .. '"'
end

local function writeJsonValue(v, indent)
  indent = indent or ""
  local tv = type(v)
  if tv == "string" then
    return jsonQuote(v)
  elseif tv == "number" then
    return tostring(v)
  elseif tv == "boolean" then
    return v and "true" or "false"
  elseif tv == "table" then
    local nextIndent = indent .. "  "
    local lines = {}
    if isArray(v) then
      table.insert(lines, "[")
      for i, item in ipairs(v) do
        local comma = (i < #v) and "," or ""
        table.insert(lines, nextIndent .. writeJsonValue(item, nextIndent) .. comma)
      end
      table.insert(lines, indent .. "]")
    else
      table.insert(lines, "{")
      local keys = sortedKeys(v)
      for i, k in ipairs(keys) do
        local comma = (i < #keys) and "," or ""
        table.insert(lines, nextIndent .. jsonQuote(k) .. ": " .. writeJsonValue(v[k], nextIndent) .. comma)
      end
      table.insert(lines, indent .. "}")
    end
    return table.concat(lines, "\n")
  else
    return "null"
  end
end

function M.saveJson(project, fileName)
  local f, err = io.open(fileName, "w+b")
  if not f then return false, err end
  f:write(writeJsonValue(project, ""))
  f:write("\n")
  f:close()
  return true
end

-- Lua export ------------------------------------------------------------

local function varNameFor(node, used)
  local base = tostring(node.name or node.class or "obj"):gsub("%W", "_")
  if base == "" or not base:match("^[A-Za-z_]") then base = "obj_" .. base end
  local name = base
  local i = 2
  while used[name] do
    name = base .. tostring(i)
    i = i + 1
  end
  used[name] = true
  return name
end

local function copyWithoutName(t)
  local r = {}
  for k, v in pairs(t or {}) do
    if k ~= "Name" then r[k] = v end
  end
  return r
end

local function mergeCollectionsIntoProps(props, collections)
  for propName, values in pairs(collections or {}) do
    if type(values) == "table" then
      props[propName] = values
    end
  end
  return props
end

local function hasAnyKey(t)
  return next(t or {}) ~= nil
end

local function emitPropertyTable(lines, objVar, node, indent)
  local props = copyWithoutName(node.props or {})
  mergeCollectionsIntoProps(props, node.collections or {})

  if not hasAnyKey(props) then return end

  table.insert(lines, indent .. objVar .. "._ = " .. writeValue(props, indent))
end

local function emitObject(lines, node, parentVar, uiPrefix, indent, used)
  local className = tostring(node.class or "")
  local objVar = varNameFor(node, used)
  local name = tostring(node.name or objVar)

  if className == "Form" then
    table.insert(lines, indent .. "local " .. objVar .. " = VCL.Form(owner, " .. quote(name) .. ")")
  else
    table.insert(lines, indent .. "local " .. objVar .. " = VCL." .. className .. "(" .. parentVar .. ", " .. quote(name) .. ")")
  end

  if validIdent(name) then
    table.insert(lines, indent .. uiPrefix .. "." .. name .. " = " .. objVar)
  else
    table.insert(lines, indent .. uiPrefix .. "[" .. quote(name) .. "] = " .. objVar)
  end
  table.insert(lines, indent .. uiPrefix .. ".byName[" .. quote(name) .. "] = " .. objVar)

  emitPropertyTable(lines, objVar, node, indent)
  table.insert(lines, "")

  for _, child in ipairs(node.items or {}) do
    emitObject(lines, child, objVar, uiPrefix, indent, used)
  end
end

function M.exportLuaModule(project, fileName, moduleName)
  local root = project and project.forms and project.forms[1]
  if not root then return false, "missing root form" end

  moduleName = moduleName or tostring(root.name or "form")
  local lines = {}
  table.insert(lines, "-- Generated by VCLua Form Editor. Do not edit this file manually.")
  table.insert(lines, "-- Re-exporting the design may overwrite it.")
  table.insert(lines, "-- Wire events in your application code, for example:")
  table.insert(lines, "--   local ui = require(" .. quote(moduleName) .. ").create(nil)")
  table.insert(lines, "--   ui.Button1.OnClick = function(sender) ... end")
  table.insert(lines, "")
  table.insert(lines, "local VCL = require \"vcl.core\"")
  table.insert(lines, "")
  table.insert(lines, "local M = {}")
  table.insert(lines, "")
  table.insert(lines, "function M.create(owner)")
  table.insert(lines, "  local ui = { byName = {} }")
  table.insert(lines, "")

  local used = {}
  emitObject(lines, root, "owner", "ui", "  ", used)

  table.insert(lines, "  return ui")
  table.insert(lines, "end")
  table.insert(lines, "")
  table.insert(lines, "return M")
  table.insert(lines, "")

  local f, err = io.open(fileName, "w+b")
  if not f then return false, err end
  f:write(table.concat(lines, "\n"))
  f:close()
  return true
end

return M
