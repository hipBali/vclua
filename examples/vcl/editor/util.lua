-- ***************************************
-- VCLua Form tool
-- Copyright (C) 2013-2026 Hi-Project Ltd.
-- ***************************************

local M = {}

function M.boolFromString(v)
  if type(v) == "boolean" then return v end
  v = tostring(v or ""):lower()
  return v == "true" or v == "1" or v == "yes" or v == "y" or v == "igen"
end


function M.parseNumber(value, default)
  if type(value) == "number" then return value end
  local s = tostring(value or ""):gsub("^%s+", ""):gsub("%s+$", "")
  if s == "" then return default end
  local hex = s:match("^0[xX]([0-9a-fA-F]+)$") or s:match("^#([0-9a-fA-F]+)$")
  if hex then
    local n = tonumber(hex, 16)
    if n ~= nil then return n end
  end
  local n = tonumber(s)
  if n ~= nil then return n end
  return default
end

function M.parseColor(value, default)
  if type(value) == "number" then return value end
  local s = tostring(value or ""):gsub("^%s+", ""):gsub("%s+$", "")
  if s == "" then return default end
  if s:match("^cl[%w_]+$") then return s end
  return M.parseNumber(s, default)
end

function M.colorToString(value)
  if type(value) == "number" then return string.format("0x%08X", value) end
  return tostring(value or "")
end

local intProps = {
  Left = true, Top = true, Width = true, Height = true,
}

local boolProps = {
  Enabled = true, Visible = true, Checked = true,
}

function M.convertProp(prop, value)
  if prop == "Name" then
    return tostring(value or ""):gsub("%W", "")
  elseif intProps[prop] then
    return tonumber(value) or 0
  elseif boolProps[prop] then
    return M.boolFromString(value)
  else
    return tostring(value or "")
  end
end

local function applyOne(obj, key, value)
  if type(value) == "table" then
    local child = nil
    local ok = pcall(function() child = obj[key] end)
    if ok and child ~= nil then
      M.applyProps(child, value)
    end
  else
    local ok, err = pcall(function() obj[key] = value end)
    if not ok then print("property failed:", key, tostring(err)) end
  end
end

function M.applyProps(vclObj, props)
  for k, v in pairs(props or {}) do
    applyOne(vclObj, k, v)
  end
end

return M
