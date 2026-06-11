-- VCLua main form loader

local VCL = require "vcl"
local resourceLoader = require "resource_loader"

local M = {}

local function scriptDirectory()
  local source = debug.getinfo(1, "S").source or ""
  source = source:gsub("^@", "")
  return source:match("^(.*[/\\])") or ""
end

local function loadModel(fileName)
  local chunk, err = resourceLoader.loadChunk(fileName)
  if not chunk then
    error("Cannot load mainform.vclform: " .. tostring(err))
  end

  local ok, data = pcall(chunk)
  if not ok or type(data) ~= "table" then
    error("Cannot load mainform.vclform: " .. tostring(data))
  end
  return data
end

local function copyProps(props)
  local result = {}
  for key, value in pairs(props or {}) do result[key] = value end
  return result
end

local function instantiate(data)
  local ui = {}
  local rootNode = data and data.forms and data.forms[1]
  if not rootNode then error("mainform.vclform has no root form") end

  local form = VCL.Form()
  form._ = copyProps(rootNode.props)
  pcall(function() form.Name = rootNode.name end)
  ui[rootNode.name] = form

  local actions = {}

  local function createActionList(node)
    local list = VCL.ActionList(form)
    pcall(function() list.Name = node.name end)
    ui[node.name] = list

    for _, rec in ipairs((node.props and node.props.Actions) or {}) do
      local action = VCL.Action()
      action._ = {
        name = rec.Name,
        caption = rec.Caption,
        hint = rec.Hint,
        shortcut = rec.ShortCut,
        imageindex = rec.ImageIndex,
        enabled = rec.Enabled,
        checked = rec.Checked,
      }
      actions[rec.Name] = action
      ui[rec.Name] = action
      list[rec.Name] = action
    end
  end

  local function addMenuItems(menu, parentItem, records)
    for _, rec in ipairs(records or {}) do
      local props = {
        name = rec.Name,
        caption = rec.Caption,
        enabled = rec.Enabled,
        checked = rec.Checked,
        imageindex = rec.ImageIndex,
        rightjustify = rec.RightJustify,
      }
      if rec.Action then props.action = actions[rec.Action] end

      local item = VCL.MenuItem(menu, props)
      ui[rec.Name] = item
      if parentItem then parentItem:Add(item) else menu.Items:Add(item) end
      addMenuItems(menu, item, rec.Items)
    end
  end

  local function createMainMenu(node)
    local menu = VCL.MainMenu(form, node.name)
    ui[node.name] = menu
    addMenuItems(menu, nil, (node.props and node.props.MenuItems) or {})
  end

  local function createVisual(node, parent)
    local ctor = VCL[node.class]
    if type(ctor) ~= "function" then
      error("Unsupported main form component: " .. tostring(node.class))
    end

    local obj = ctor(parent, node.name)
    ui[node.name] = obj
    obj._ = copyProps(node.props)
    for _, child in ipairs(node.items or {}) do createVisual(child, obj) end
    return obj
  end

  for _, node in ipairs(rootNode.items or {}) do
    if node.class == "ActionList" then createActionList(node) end
  end
  for _, node in ipairs(rootNode.items or {}) do
    if node.class == "MainMenu" then createMainMenu(node) end
  end
  for _, node in ipairs(rootNode.items or {}) do
    if node.class ~= "ActionList" and node.class ~= "MainMenu" then
      createVisual(node, form)
    end
  end

  if ui.MainMenu then form.Menu = ui.MainMenu end
  return ui
end

function M.load(fileName)
  fileName = fileName or (scriptDirectory() .. "forms/mainform.vclform")
  return instantiate(loadModel(fileName))
end

return M
