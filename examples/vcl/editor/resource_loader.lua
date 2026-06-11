local M = {}

local moduleNameSelf = ...
local modulePrefix = tostring(moduleNameSelf or ""):match("^(.*)%.resource_loader$")
local moduleRootPath = modulePrefix and modulePrefix:gsub("%.", "/") or nil

local function trace(...)
  if rawget(_G, "VCLUA_RESOURCE_TRACE") ~= true then return end
  io.stderr:write("[ResourceLoader]")
  for i = 1, select("#", ...) do
    io.stderr:write(" ", tostring(select(i, ...)))
  end
  io.stderr:write("\n")
end

local function fileExists(fileName)
  local f = io.open(fileName, "rb")
  if f then f:close(); return true end
  return false
end

local function normalizePath(path)
  path = tostring(path or ""):gsub("\\", "/")
  local prefix = ""
  if path:sub(1, 1) == "/" then
    prefix = "/"
    path = path:sub(2)
  end

  local out = {}
  for part in path:gmatch("[^/]+") do
    if part == ".." then
      if #out > 0 then table.remove(out) end
    elseif part ~= "." and part ~= "" then
      out[#out + 1] = part
    end
  end

  return prefix .. table.concat(out, "/")
end

local function addValue(list, seen, value)
  value = normalizePath(value)
  if value == "" or seen[value] then return end
  seen[value] = true
  list[#list + 1] = value
end

local function loadLar()
  local ok, lar = pcall(require, "lar")
  if ok and lar then return lar end
  return nil
end

local function packageRoots()
  local result, seen = {}, {}

  local function add(root)
    root = normalizePath(root):gsub("/+$", "")
    if root == "." then root = "" end
    if root ~= "" then addValue(result, seen, root) end
  end

  if moduleRootPath then add(moduleRootPath) end

  for template in tostring(package.path or ""):gmatch("[^;]+") do
    local before = template:match("^(.-)%?")
    if before then add(before) end
  end

  return result
end

local function basename(path)
  return tostring(path):match("([^/]+)$") or tostring(path)
end

local function relativeNames(path)
  path = normalizePath(path)
  local result, seen = {}, {}

  local function add(name)
    addValue(result, seen, name)
  end

  add(path)

  for _, root in ipairs(packageRoots()) do
    if path:sub(1, #root + 1) == root .. "/" then
      add(path:sub(#root + 2))
    end
  end

  local forms = path:match("(^forms/.+)$") or path:match("/(forms/.+)$")
  if forms then add(forms) end

  local dialogs = path:match("(^dialogs/.+)$") or path:match("/(dialogs/.+)$")
  if dialogs then add(dialogs) end

  if basename(path) == "vclua_editor.ico" then
    add("vclua_editor.ico")
  end

  return result
end

local function physicalCandidates(path)
  path = normalizePath(path)
  local result, seen = {}, {}

  local function add(name)
    addValue(result, seen, name)
  end

  add(path)

  for _, root in ipairs(packageRoots()) do
    for _, name in ipairs(relativeNames(path)) do
      add(root .. "/" .. name)
    end
  end

  return result
end

local function readArchiveEntry(lar, archive, name)
  if lar.read then
    local ok, data = pcall(lar.read, archive, name)
    if ok and data then return data end
  end

  if lar.unzip then
    local ok, data = pcall(lar.unzip, archive, name)
    if ok and data then return data end
  end

  if lar.ungztar then
    local ok, data = pcall(lar.ungztar, archive, name)
    if ok and data then return data end
  end

  return nil
end

local function archiveCandidates(path)
  local result, seen = {}, {}

  local function add(archive, name)
    archive = normalizePath(archive)
    name = normalizePath(name)
    local key = archive .. "\n" .. name
    if archive == "" or name == "" or seen[key] then return end
    seen[key] = true
    result[#result + 1] = { archive = archive, name = name }
  end

  for _, root in ipairs(packageRoots()) do
    for _, name in ipairs(relativeNames(path)) do
      add(root .. ".zip", name)
      add(root .. ".lar", name)
      add("./" .. root .. ".zip", name)
      add("./" .. root .. ".lar", name)
      add(root .. ".zip", root .. "/" .. name)
      add(root .. ".lar", root .. "/" .. name)
      add("./" .. root .. ".zip", root .. "/" .. name)
      add("./" .. root .. ".lar", root .. "/" .. name)
    end
  end

  trace("archive candidates for", path)
  for _, item in ipairs(result) do
    trace("  archive", item.archive, item.name, fileExists(item.archive) and "exists" or "missing")
  end

  return result
end

local function readPhysical(path)
  for _, candidate in ipairs(physicalCandidates(path)) do
    local f = io.open(candidate, "rb")
    if f then
      local data = f:read("*a")
      f:close()
      return data, candidate
    end
  end

  return nil
end

local function readArchive(path)
  local lar = loadLar()
  if not lar then return nil end

  for _, item in ipairs(archiveCandidates(path)) do
    if fileExists(item.archive) then
      local data = readArchiveEntry(lar, item.archive, item.name)
      if data then return data, item.archive, item.name end
    end
  end

  return nil
end

local function tempDirectory()
  return os.getenv("TEMP") or os.getenv("TMP") or os.getenv("TMPDIR") or "."
end

local function extractArchive(path)
  local data, archive, name = readArchive(path)
  if not data then return nil end

  local safeName = tostring(name):gsub("[/\\:]+", "_")
  local target = normalizePath(tempDirectory() .. "/vclua_" .. safeName)
  local f = io.open(target, "wb")
  if not f then return nil end

  f:write(data)
  f:close()
  return target
end

function M.resolveFile(fileName)
  for _, candidate in ipairs(physicalCandidates(fileName)) do
    if fileExists(candidate) then return candidate end
  end

  return extractArchive(fileName) or fileName
end

function M.readFile(fileName)
  local data = readPhysical(fileName)
  if data then return data end

  return readArchive(fileName)
end

function M.loadChunk(fileName)
  for _, candidate in ipairs(physicalCandidates(fileName)) do
    if fileExists(candidate) then
      return loadfile(candidate)
    end
  end

  local data, archive, name = readArchive(fileName)
  if not data then
    return nil, "file not found: " .. tostring(fileName)
  end

  return load(data, "@" .. archive .. "/" .. name)
end

function M.resolveEditorFile(name)
  return M.resolveFile(name)
end

function M.resourceName(fileName)
  return relativeNames(fileName)[1]
end

return M
