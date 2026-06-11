local moduleNameSelf = ...
local modulePrefix = tostring(moduleNameSelf or ""):match("^(.*)%.special_editors$")
if modulePrefix == "" then modulePrefix = nil end

local function editorModule(name)
  if modulePrefix then
    return modulePrefix .. "." .. name
  end
  return name
end

-- ***************************************
-- VCLua Form tool
-- Copyright (C) 2013-2026 Hi-Project Ltd.
-- ***************************************

local M = {}

local VCL
local model
local runtime
local inspector
local registry
local project
local defaultFormFile = "test_form.vclform"
local setStatus = function() end
local deferDialogAction = function(action) if type(action) == "function" then action() end end
local getCurrentFileName = function() return nil end
local getSelectedNode = function() return nil end
local getProject = function() return project end

local function pathDir(fileName)
  fileName = tostring(fileName or "")
  local d = fileName:match("^(.*[/\\])[^/\\]*$")
  if d and d ~= "" then return d end
  return "dev/"
end

local function pathBase(fileName)
  fileName = tostring(fileName or "")
  return fileName:match("([^/\\]+)$") or fileName
end

function M.init(ctx)
  ctx = ctx or {}
  VCL = ctx.VCL or VCL or require "vcl"
  model = ctx.model or model
  runtime = ctx.runtime or runtime
  inspector = ctx.inspector or inspector
  registry = ctx.registry or registry
  project = ctx.project or project
  if ctx.getProject then
    getProject = ctx.getProject
  else
    getProject = function() return project end
  end
  defaultFormFile = ctx.defaultFormFile or defaultFormFile
  setStatus = ctx.setStatus or setStatus
  deferDialogAction = ctx.deferDialogAction or deferDialogAction
  getCurrentFileName = ctx.getCurrentFileName or getCurrentFileName
  getSelectedNode = ctx.getSelectedNode or getSelectedNode
  return M
end

local function askImageFile(seed)
  if not VCL.OpenDialog then return nil end
  local dlg = VCL.OpenDialog()

  seed = seed or getCurrentFileName() or defaultFormFile
  dlg._ = {
    title = "Select image...",
    filename = pathBase(seed),
    initialdir = pathDir(seed),
    filter = "Images (*.png;*.jpg;*.jpeg;*.bmp;*.ico)|*.png;*.jpg;*.jpeg;*.bmp;*.ico|All files|*.*",
    options = "[ofViewDetail,ofFileMustExist,ofPathMustExist,ofEnableSizing]",
  }

  local fileName = nil
  local ok, res = pcall(function()
    return dlg:Execute()
  end)

  if ok and res then
    pcall(function() fileName = dlg.fileName end)
  end
  return fileName
end

local function askIconFile(seed)
  if not VCL.OpenDialog then return nil end
  local dlg = VCL.OpenDialog()

  seed = seed or getCurrentFileName() or defaultFormFile
  dlg._ = {
    title = "Select form icon...",
    filename = pathBase(seed),
    initialdir = pathDir(seed),
    filter = "Icons (*.ico)|*.ico|Images (*.png;*.bmp)|*.png;*.bmp|All files|*.*",
    options = "[ofViewDetail,ofFileMustExist,ofPathMustExist,ofEnableSizing]",
  }

  local fileName = nil
  local ok, res = pcall(function()
    return dlg:Execute()
  end)

  if ok and res then
    pcall(function() fileName = dlg.fileName end)
  end
  return fileName
end

local function editFormIconFile(node)
  if not node or node.class ~= "Form" then return false end
  local seed = node.props and node.props.IconFile or nil
  local fileName = askIconFile(seed)
  if not fileName or fileName == "" then return false end
  node.props = node.props or {}
  node.props.IconFile = fileName
  runtime.applyNodeProperty(node, "IconFile", fileName)
  if getSelectedNode() == node then inspector.showNode(node) end
  setStatus("Form icon loaded: " .. tostring(fileName))
  return true
end

local function editImageFile(node)
  if not node or node.class ~= "Image" then return false end
  local seed = node.props and node.props.PictureFile or nil
  local fileName = askImageFile(seed)
  if not fileName or fileName == "" then return false end
  node.props = node.props or {}
  node.props.PictureFile = fileName
  runtime.applyNodeProperty(node, "PictureFile", fileName)
  if getSelectedNode() == node then inspector.showNode(node) end
  setStatus("Image loaded: " .. tostring(fileName))
  return true
end

local function isGlyphButtonNode(node)
  return node and (node.class == "SpeedButton" or node.class == "BitBtn" or node.class == "EditButton")
end

local function isPlainButtonNode(node)
  return node and node.class == "Button"
end

local function isMenuNode(node)
  return node and (node.class == "MainMenu" or node.class == "PopupMenu")
end

local function makeEditorContext()
  return {
    VCL = VCL,
    model = model,
    runtime = runtime,
    inspector = inspector,
    registry = registry,
    project = project,
    getProject = getProject,
    getSelectedNode = getSelectedNode,
    setStatus = setStatus,
  }
end

local function reportDialogError(label, err)
  local message = tostring(label or "Dialog") .. " failed: " .. tostring(err)
  io.stderr:write("[SpecialEditor] " .. message .. "\n")
  if setStatus then setStatus(message) end
end

local function openDialogModule(moduleName, node, label)
  local n = node
  deferDialogAction(function()
    local ok, err = xpcall(function()
      local editor = require(moduleName)
      editor.open(makeEditorContext(), n)
    end, debug.traceback)
    if not ok then
      reportDialogError(label or moduleName, err)
    end
  end)
  return true
end

function M.handleTreeDblClick(node)
  if node and node.class == "Form" then
    local n = node
    deferDialogAction(function() editFormIconFile(n) end)
    return true
  elseif node and node.class == "Image" then
    local n = node
    deferDialogAction(function() editImageFile(n) end)
    return true
  elseif isPlainButtonNode(node) then
    return openDialogModule(editorModule("dialogs.button_image_editor"), node, "Button action editor")
  elseif isGlyphButtonNode(node) then
    return openDialogModule(editorModule("dialogs.button_image_editor"), node, "Button image editor")
  elseif node and registry and registry.isImageList and registry.isImageList(node.class) then
    return openDialogModule(editorModule("dialogs.imagelist_editor"), node, "ImageList editor")
  elseif node and registry and registry.isToolBar and registry.isToolBar(node.class) then
    return openDialogModule(editorModule("dialogs.toolbar_images_editor"), node, "ToolBar ImageLists editor")
  elseif node and node.class == "TreeView" then
    return openDialogModule(editorModule("dialogs.treeview_images_editor"), node, "TreeView ImageLists editor")
  elseif node and node.class == "ListView" then
    return openDialogModule(editorModule("dialogs.listview_images_editor"), node, "ListView ImageLists editor")
  elseif node and registry and registry.isPageControl and registry.isPageControl(node.class) then
    return openDialogModule(editorModule("dialogs.pagecontrol_images_editor"), node, "PageControl Images editor")
  elseif node and registry and registry.isActionList and registry.isActionList(node.class) then
    return openDialogModule(editorModule("dialogs.action_items_editor"), node, "ActionList editor")
  elseif isMenuNode(node) then
    return openDialogModule(editorModule("dialogs.menu_items_editor"), node, "Menu editor")
  end
  return false
end

return M
