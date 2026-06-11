-- ***************************************
-- VCLua Form tool
-- Copyright (C) 2013-2026 Hi-Project Ltd.
-- ***************************************
-- Saves/loads the designer model and exports lua/json formats.

local registry = require "registry"

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
      -- Preserves component order.
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

local function componentRefProps(node)
  local refs = registry.componentRefProps and registry.componentRefProps(node.class) or nil
  local out = {}
  for prop, expectedClass in pairs(refs or {}) do out[prop] = expectedClass end
  if node.class == "Form" then out.Menu = "MainMenu" end
  if node.class == "Button" or node.class == "SpeedButton" or node.class == "BitBtn"
      or node.class == "ToolButton" or node.class == "EditButton" then
    out.Action = "Action"
  end
  return out
end

local function imageListFilesProperty(node)
  if not registry.imageListFilesProperty then return nil end
  return registry.imageListFilesProperty(node.class)
end

local function copyDirectProps(node, deferredRefs)
  local props = {}
  local refs = componentRefProps(node)
  local filesProp = imageListFilesProperty(node)

  for k, v in pairs(node.props or {}) do
    local invalidTabOrder = k == "TabOrder" and registry.isTabOrderable
      and not registry.isTabOrderable(node.class)
    local invalidNonVisualPosition = registry.isNonVisual
      and registry.isNonVisual(node.class)
      and (k == "Left" or k == "Top")
    if k ~= "Name" and k ~= "PictureFile" and k ~= "ImageFile" and k ~= "GlyphFile"
        and k ~= "IconFile" and k ~= filesProp and k ~= "MenuItems" and k ~= "Actions"
        and not invalidTabOrder and not invalidNonVisualPosition then
      if refs[k] and type(v) == "string" then
        if v ~= "" then
          table.insert(deferredRefs, { prop = k, target = v })
        end
      else
        props[k] = v
      end
    end
  end
  return props
end

local function mergeCollectionsIntoProps(props, collections)
  for propName, values in pairs(collections or {}) do
    if type(values) == "table" then props[propName] = values end
  end
  return props
end

local function hasAnyKey(t)
  return next(t or {}) ~= nil
end

local function emitPropertyTable(lines, objVar, node, indent, deferredRefs)
  local props = copyDirectProps(node, deferredRefs)
  mergeCollectionsIntoProps(props, node.collections or {})
  if hasAnyKey(props) then
    table.insert(lines, indent .. objVar .. "._ = " .. writeValue(props, indent))
  end
end

local function emitImageListFiles(lines, objVar, node, parentVar, indent, context)
  local propName = imageListFilesProperty(node)
  local files = propName and node.props and node.props[propName] or nil
  if type(files) ~= "table" then return end
  if context.embedResources then
    table.insert(lines, indent .. "loadResourceImageList(" .. objVar .. ", " .. writeValue(files, indent) .. ")")
  else
    table.insert(lines, indent .. "VCL.ImageListLoadFiles(" .. objVar .. ", " .. writeValue(files, indent) .. ", " .. parentVar .. ")")
  end
end

local function collectImageListFiles(root)
  local result = {}

  local function scan(node)
    if type(node) ~= "table" then return end
    if node.class == "ImageList" and node.name then
      local propName = imageListFilesProperty(node)
      local files = propName and node.props and node.props[propName] or nil
      if type(files) == "table" then
        result[tostring(node.name)] = files
      end
    end
    for _, child in ipairs(node.items or {}) do scan(child) end
  end

  scan(root)
  return result
end

local function imageListGlyphFile(node, context)
  local className = tostring(node.class or "")
  if className ~= "SpeedButton" and className ~= "BitBtn"
      and className ~= "EditButton" then
    return nil
  end

  local props = node.props or {}
  if props.GlyphFile and tostring(props.GlyphFile) ~= "" then return nil end

  local imageListName = props.Images
  local imageIndex = tonumber(props.ImageIndex)
  if type(imageListName) ~= "string" or imageListName == "" or not imageIndex
      or imageIndex < 0 then
    return nil
  end

  local files = context.imageListFiles and context.imageListFiles[imageListName]
  if type(files) ~= "table" then return nil end

  local fileName = files[imageIndex + 1]
  if fileName == nil or tostring(fileName) == "" then return nil end
  return tostring(fileName)
end

local function emitObject(lines, node, parentVar, uiPrefix, indent, context)
  local className = tostring(node.class or "")
  local objVar = varNameFor(node, context.used)
  local name = tostring(node.name or objVar)
  local deferredRefs = {}

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

  emitPropertyTable(lines, objVar, node, indent, deferredRefs)
  emitImageListFiles(lines, objVar, node, parentVar, indent, context)

  if className == "ActionList" then
    table.insert(context.actionLists, { objVar = objVar, node = node })
  elseif className == "MainMenu" or className == "PopupMenu" then
    table.insert(context.menus, { objVar = objVar, node = node })
  end

  for _, ref in ipairs(deferredRefs) do
    table.insert(context.deferredRefs, {
      objVar = objVar,
      prop = ref.prop,
      target = ref.target,
      source = name,
    })
  end

  if className == "Form" then
    local iconFile = node.props and node.props.IconFile
    if iconFile and tostring(iconFile) ~= "" then
      if context.embedResources then
        table.insert(lines, indent .. "loadResourceIcon(" .. objVar .. ".Icon, " .. quote(iconFile) .. ")")
      else
        table.insert(lines, indent .. "pcall(function() " .. objVar .. ".Icon:LoadFromFile(" .. quote(iconFile) .. ") end)")
      end
    end
  elseif className == "Image" then
    local pictureFile = node.props and (node.props.PictureFile or node.props.ImageFile)
    if pictureFile and tostring(pictureFile) ~= "" then
      if context.embedResources then
        table.insert(lines, indent .. "loadResourcePicture(" .. objVar .. ".Picture, " .. quote(pictureFile) .. ")")
      else
        table.insert(lines, indent .. "pcall(function() " .. objVar .. ".Picture:LoadFromFile(" .. quote(pictureFile) .. ") end)")
      end
    end
  elseif className == "SpeedButton" or className == "BitBtn" or className == "EditButton" then
    local glyphFile = node.props and node.props.GlyphFile
    if not glyphFile or tostring(glyphFile) == "" then
      glyphFile = imageListGlyphFile(node, context)
    end
    if glyphFile and tostring(glyphFile) ~= "" then
      if context.embedResources then
        table.insert(lines, indent .. "loadResourceGlyph(" .. objVar .. ", " .. quote(glyphFile) .. ")")
      else
        table.insert(lines, indent .. "pcall(function() VCL.LoadGlyphFromFile(" .. objVar .. ", " .. quote(glyphFile) .. ") end)")
      end
    end
  end
  table.insert(lines, "")

  for _, child in ipairs(node.items or {}) do
    emitObject(lines, child, objVar, uiPrefix, indent, context)
  end
end


local function actionProps(item)
  local props = {}
  local name = tostring(item.Name or item.name or "")
  props.Name = name
  props.Caption = tostring(item.Caption or item.caption or name)
  props.Hint = tostring(item.Hint or item.hint or "")
  props.ImageIndex = tonumber(item.ImageIndex or item.imageIndex) or -1
  props.Enabled = item.Enabled ~= false
  props.Checked = item.Checked == true
  local shortcut = item.ShortCut or item.shortcut or item.Shortcut
  if shortcut ~= nil and tostring(shortcut) ~= "" then props.ShortCut = shortcut end
  return props
end

local function emitActions(lines, actionLists, indent)
  if #actionLists == 0 then return end
  table.insert(lines, indent .. "local function createAction(actionList, props)")
  table.insert(lines, indent .. "  local action")
  table.insert(lines, indent .. "  local ok = pcall(function() action = VCL.Action(actionList) end)")
  table.insert(lines, indent .. "  if not ok or not action then action = VCL.Action() end")
  table.insert(lines, indent .. "  action._ = props")
  table.insert(lines, indent .. "  pcall(function() action.ActionList = actionList end)")
  table.insert(lines, indent .. "  local actions")
  table.insert(lines, indent .. "  pcall(function() actions = actionList.Actions end)")
  table.insert(lines, indent .. "  if actions then")
  table.insert(lines, indent .. "    pcall(function() actions:Add(action) end)")
  table.insert(lines, indent .. "  end")
  table.insert(lines, indent .. "  return action")
  table.insert(lines, indent .. "end")
  table.insert(lines, "")

  local used = {}
  for _, rec in ipairs(actionLists) do
    local actions = rec.node.props and (rec.node.props.Actions or rec.node.props.actions) or nil
    for _, item in ipairs(type(actions) == "table" and actions or {}) do
      if type(item) == "table" then
        local props = actionProps(item)
        local name = props.Name
        if name ~= "" then
          local varName = varNameFor({ name = name, class = "Action" }, used)
          table.insert(lines, indent .. "local " .. varName .. " = createAction(" .. rec.objVar .. ", " .. writeValue(props, indent) .. ")")
          if validIdent(name) then
            table.insert(lines, indent .. "ui." .. name .. " = " .. varName)
          else
            table.insert(lines, indent .. "ui[" .. quote(name) .. "] = " .. varName)
          end
          table.insert(lines, indent .. "ui.byName[" .. quote(name) .. "] = " .. varName)
          table.insert(lines, "")
        end
      end
    end
  end
end

local function emitMenus(lines, menus, indent)
  if #menus == 0 then return end
  table.insert(lines, indent .. "local function createMenuItems(menu, parentItem, records)")
  table.insert(lines, indent .. "  for _, rec in ipairs(records or {}) do")
  table.insert(lines, indent .. "    local props = {}")
  table.insert(lines, indent .. "    for key, value in pairs(rec) do")
  table.insert(lines, indent .. "      if key ~= \"Items\" and key ~= \"Action\" and tostring(key):sub(1, 2) ~= \"__\" then")
  table.insert(lines, indent .. "        props[key] = value")
  table.insert(lines, indent .. "      end")
  table.insert(lines, indent .. "    end")
  table.insert(lines, indent .. "    if rec.Action and rec.Action ~= \"\" then")
  table.insert(lines, indent .. "      props.Action = assert(ui.byName[rec.Action], \"missing menu action: \" .. tostring(rec.Action))")
  table.insert(lines, indent .. "    end")
  table.insert(lines, indent .. "    local item = VCL.MenuItem(menu, props)")
  table.insert(lines, indent .. "    local name = tostring(rec.Name or \"\")")
  table.insert(lines, indent .. "    if name ~= \"\" then")
  table.insert(lines, indent .. "      ui[name] = item")
  table.insert(lines, indent .. "      ui.byName[name] = item")
  table.insert(lines, indent .. "    end")
  table.insert(lines, indent .. "    if parentItem then parentItem:Add(item) else menu.Items:Add(item) end")
  table.insert(lines, indent .. "    createMenuItems(menu, item, rec.Items)")
  table.insert(lines, indent .. "  end")
  table.insert(lines, indent .. "end")
  table.insert(lines, "")

  for _, rec in ipairs(menus) do
    local items = rec.node.props and rec.node.props.MenuItems or nil
    table.insert(lines, indent .. "createMenuItems(" .. rec.objVar .. ", nil, " .. writeValue(type(items) == "table" and items or {}, indent) .. ")")
  end
  table.insert(lines, "")
end

local function emitDeferredRefs(lines, refs, indent)
  if #refs == 0 then return end
  table.insert(lines, indent .. "local function resolve(name)")
  table.insert(lines, indent .. "  return assert(ui.byName[name], \"missing component reference: \" .. tostring(name))")
  table.insert(lines, indent .. "end")
  table.insert(lines, "")
  for _, ref in ipairs(refs) do
    table.insert(lines, indent .. ref.objVar .. "." .. ref.prop .. " = resolve(" .. quote(ref.target) .. ")")
  end
  table.insert(lines, "")
end

function M.collectIconFiles(project)
  local result = {}
  local seen = {}

  local function add(fileName)
    fileName = tostring(fileName or "")
    if fileName == "" or seen[fileName] then return end
    seen[fileName] = true
    result[#result + 1] = fileName
  end

  local function scan(node)
    if type(node) ~= "table" then return end
    if tostring(node.class or "") == "Form" then
      local props = type(node.props) == "table" and node.props or {}
      add(props.IconFile)
    end
    for _, child in ipairs(node.items or {}) do scan(child) end
  end

  scan(project and project.forms and project.forms[1])
  table.sort(result)
  return result
end

function M.collectImageFiles(project)
  local result = {}
  local seen = {}

  local function add(fileName)
    fileName = tostring(fileName or "")
    if fileName == "" or seen[fileName] then return end
    seen[fileName] = true
    result[#result + 1] = fileName
  end

  local function scan(node)
    if type(node) ~= "table" then return end
    local props = type(node.props) == "table" and node.props or {}
    local className = tostring(node.class or "")

    if className == "Image" then
      add(props.PictureFile or props.ImageFile)
    elseif className == "SpeedButton" or className == "BitBtn" or className == "EditButton" then
      add(props.GlyphFile)
    end

    local filesProp = imageListFilesProperty(node)
    local files = filesProp and props[filesProp] or nil
    if type(files) == "table" then
      for _, fileName in ipairs(files) do add(fileName) end
    end

    for _, child in ipairs(node.items or {}) do scan(child) end
  end

  scan(project and project.forms and project.forms[1])
  table.sort(result)
  return result
end

function M.exportLuaModule(project, fileName, moduleName, options)
  local root = project and project.forms and project.forms[1]
  if not root then return false, "missing root form" end

  moduleName = moduleName or tostring(root.name or "form")
  options = options or {}
  local lines = {}
  table.insert(lines, "-- Generated by VCLua Form Editor. Do not edit this file manually.")
  table.insert(lines, "-- Re-exporting the design may overwrite it.")
  table.insert(lines, "-- Wire events in your application code, for example:")
  table.insert(lines, "--   local ui = require(" .. quote(moduleName) .. ").create(nil)")
  table.insert(lines, "--   ui.Button1.OnClick = function(sender) ... end")
  table.insert(lines, "")
  table.insert(lines, "local VCL = require \"vcl.core\"")
  if options.embedResources and options.resourcesModule then
    table.insert(lines, "local resources = require " .. quote(options.resourcesModule))
  end
  table.insert(lines, "")
  table.insert(lines, "local M = {}")
  table.insert(lines, "")
  if options.embedResources and options.resourcesModule then
    table.insert(lines, "local function loadResourcePicture(picture, key)")
    table.insert(lines, "  local hexData = assert(resources.images[key], \"missing image resource: \" .. tostring(key))")
    table.insert(lines, "  local stream = VCL.MemoryStream()")
    table.insert(lines, "  stream:LoadFromHex(hexData:gsub(\"%s+\", \"\"), 1)")
    table.insert(lines, "  picture:LoadFromStream(stream)")
    table.insert(lines, "  stream:Free()")
    table.insert(lines, "end")
    table.insert(lines, "")
    table.insert(lines, "local imageListResourceKeepAlive = {}")
    table.insert(lines, "")
    table.insert(lines, "local function loadResourceIcon(icon, key)")
    table.insert(lines, "  local hexData = assert(resources.icons and resources.icons[key], \"missing icon resource: \" .. tostring(key))")
    table.insert(lines, "  local stream = VCL.MemoryStream()")
    table.insert(lines, "  stream:LoadFromHex(hexData:gsub(\"%s+\", \"\"), 1)")
    table.insert(lines, "  icon:LoadFromStream(stream)")
    table.insert(lines, "  stream:Free()")
    table.insert(lines, "end")
    table.insert(lines, "")
    table.insert(lines, "local function loadResourceGlyph(control, key)")
    table.insert(lines, "  local hexData = assert(resources.images[key], \"missing image resource: \" .. tostring(key))")
    table.insert(lines, "  local stream = VCL.MemoryStream()")
    table.insert(lines, "  local image = VCL.Image()")
    table.insert(lines, "  stream:LoadFromHex(hexData:gsub(\"%s+\", \"\"), 1)")
    table.insert(lines, "  image.Picture:LoadFromStream(stream)")
    table.insert(lines, "  local glyph = control.Glyph")
    table.insert(lines, "  local bitmap = image.Picture.Bitmap")
    table.insert(lines, "  local ok, err = pcall(function() glyph:Assign(bitmap) end)")
    table.insert(lines, "  if not ok then")
    table.insert(lines, "    ok, err = pcall(function() glyph.Assign(glyph, bitmap) end)")
    table.insert(lines, "  end")
    table.insert(lines, "  stream:Free()")
    table.insert(lines, "  image:Free()")
    table.insert(lines, "  if not ok then error(\"Cannot assign glyph resource \" .. tostring(key) .. \": \" .. tostring(err)) end")
    table.insert(lines, "  pcall(function() control:Invalidate() end)")
    table.insert(lines, "  pcall(function() control:Repaint() end)")
    table.insert(lines, "end")
    table.insert(lines, "")
    table.insert(lines, "local function loadResourceImageList(imageList, files)")
    table.insert(lines, "  local keep = {}")
    table.insert(lines, "  imageListResourceKeepAlive[tostring(imageList)] = keep")
    table.insert(lines, "  for _, key in ipairs(files or {}) do")
    table.insert(lines, "    local image = VCL.Image()")
    table.insert(lines, "    loadResourcePicture(image.Picture, key)")
    table.insert(lines, "    local index = imageList:Add(image.Picture.Bitmap, nil)")
    table.insert(lines, "    if tonumber(index) == nil or tonumber(index) < 0 then")
    table.insert(lines, "      image:Free()")
    table.insert(lines, "      error(\"Cannot add image resource: \" .. tostring(key))")
    table.insert(lines, "    end")
    table.insert(lines, "    keep[#keep + 1] = image")
    table.insert(lines, "  end")
    table.insert(lines, "end")
    table.insert(lines, "")
  end

  table.insert(lines, "function M.create(owner)")
  table.insert(lines, "  local ui = { byName = {} }")
  table.insert(lines, "")

  local context = {
    used = {},
    deferredRefs = {},
    actionLists = {},
    menus = {},
    imageListFiles = collectImageListFiles(root),
    embedResources = options.embedResources == true and options.resourcesModule ~= nil,
  }
  emitObject(lines, root, "owner", "ui", "  ", context)
  emitActions(lines, context.actionLists, "  ")
  emitMenus(lines, context.menus, "  ")
  emitDeferredRefs(lines, context.deferredRefs, "  ")

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
