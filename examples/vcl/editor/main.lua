-- ***************************************
-- VCLua Form tool
-- Copyright (C) 2013-2026 Hi-Project Ltd.
-- ***************************************
-- Standalone VCLua form editor.
-- Run from project with: lua5.4 vcl/editor/main.lua

package.path = package.path .. ";?.lua;?/init.lua;./?.lua;./?/init.lua;"

VCL = require "vcl.core"
local app = VCL.TheApplication()
app:Initialize()

local model = require "vcl.editor.model"
local runtime = require "vcl.editor.runtime"
local tree = require "vcl.editor.tree"
local inspector = require "vcl.editor.inspector"
local serializer = require "vcl.editor.serializer"
local optionsDialog = require "vcl.editor.options"
local registry = require "vcl.editor.registry"
local palette = require "vcl.editor.palette"
local help = require "vcl.editor.help"
local preview = require "vcl.editor.preview"

local DEFAULT_FORM_FILE = "test_form.vclform"
local currentFileName = nil

local project = model.newProject()
model.ensureDesigner(project)
local selectedNode = nil
local clipboard = nil
local addComponentAt
local clampNodeIntoParent
local doRenameSelected
local doReorderSelected
local handleShortcut

local cmpImg = nil
pcall(function() cmpImg = require "vcl.editor.compimages" end)
local compImages = nil
local iconMap = {}

local frm
local btnReopenForm
local btnToggleProps
local propsVisible = true

local editorOptions = {}
local gridSizes = { 4, 8, 10, 16, 20 }
local gridSizeIndex = 2

local function findGridSizeIndex(size)
  size = tonumber(size) or 8
  for i, v in ipairs(gridSizes) do
    if v == size then return i end
  end
  return 0
end

local function syncOptionsFromProject()
  local designer = model.ensureDesigner(project)
  local g = designer.grid or {}
  local sel = designer.selection or {}
  editorOptions.snapToGrid = g.snap and true or false
  editorOptions.showGrid = true
  editorOptions.gridSize = tonumber(g.size) or 8
  editorOptions.gridShape = g.shape or "dot"
  editorOptions.gridColor = g.color or 0x00A0A0A0
  editorOptions.gridMajorEvery = tonumber(g.majorEvery) or 5
  editorOptions.gridMajorColor = g.majorColor or 0x00606060
  editorOptions.backgroundColor = g.backgroundColor or "clBtnFace"
  editorOptions.moveColor = sel.moveColor or "clHighlight"
  editorOptions.resizeColor = sel.resizeColor or "clRed"
  editorOptions.frameThickness = tonumber(sel.thickness) or 2
  gridSizeIndex = findGridSizeIndex(editorOptions.gridSize)
end

local function syncProjectFromOptions()
  local designer = model.ensureDesigner(project)
  local g = designer.grid
  g.snap = editorOptions.snapToGrid and true or false
  g.visible = true
  g.size = tonumber(editorOptions.gridSize) or 8
  g.shape = editorOptions.gridShape or "dot"
  g.color = editorOptions.gridColor or 0x00A0A0A0
  g.majorEvery = tonumber(editorOptions.gridMajorEvery) or 5
  g.majorColor = editorOptions.gridMajorColor or 0x00606060
  g.backgroundColor = editorOptions.backgroundColor or "clBtnFace"
end

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

local function withDefaultExt(fileName)
  fileName = tostring(fileName or "")
  if fileName == "" then return fileName end
  if not fileName:match("%.vclform$") then
    fileName = fileName .. ".vclform"
  end
  return fileName
end

local function askSaveFile()
  local dlg = VCL.SaveDialog(frm)
  local seed = currentFileName or DEFAULT_FORM_FILE
  dlg._ = {
    title = "Save form model as...",
    filename = pathBase(seed),
    initialdir = pathDir(seed),
    filter = "VCLua form models (*.vclform)|*.vclform|All files|*.*",
    options = "[ofViewDetail,ofOverwritePrompt,ofEnableSizing]",
  }
  local fileName = nil
  if dlg:Execute() then fileName = withDefaultExt(dlg.fileName) end
  dlg:Free()
  return fileName
end

local function askOpenFile()
  local dlg = VCL.OpenDialog(frm)
  local seed = currentFileName or DEFAULT_FORM_FILE
  dlg._ = {
    title = "Open form model...",
    filename = pathBase(seed),
    initialdir = pathDir(seed),
    filter = "VCLua form models (*.vclform)|*.vclform|All files|*.*",
    options = "[ofViewDetail,ofFileMustExist,ofPathMustExist,ofEnableSizing]",
  }
  local fileName = nil
  if dlg:Execute() then fileName = dlg.fileName end
  dlg:Free()
  return fileName
end


local function replaceExtension(fileName, ext)
  fileName = tostring(fileName or "")
  if fileName == "" then return "dev/form" .. ext end
  local path = fileName:gsub("%.[^/\\%.]+$", "")
  if path == fileName and not fileName:match("%.") then path = fileName end
  return path .. ext
end

local function askExportFile(ext, title, filter)
  local dlg = VCL.SaveDialog(frm)
  local seed = currentFileName or DEFAULT_FORM_FILE
  local defaultName = replaceExtension(seed, ext)
  dlg._ = {
    title = title,
    filename = pathBase(defaultName),
    initialdir = pathDir(defaultName),
    filter = filter,
    options = "[ofViewDetail,ofOverwritePrompt,ofEnableSizing]",
  }
  local fileName = nil
  if dlg:Execute() then
    fileName = tostring(dlg.fileName or "")
    if fileName ~= "" and not fileName:match("%." .. ext:gsub("^%.", "") .. "$") then
      fileName = fileName .. ext
    end
  end
  dlg:Free()
  return fileName
end

local function updateMainCaption()
  local suffix = currentFileName and (" - " .. pathBase(currentFileName)) or ""
  pcall(function() frm.Caption = "VCLua Form Editor Tools" .. suffix end)
end

syncOptionsFromProject()

frm = VCL.Form()
frm._ = {
  Caption = "VCLua Form Editor Tools",
  Width = 400,
  Height = 720,
  Position = "poDesigned",
  Left = 0,
  Top = 40,
  FormStyle = "fsNormal", 
}



local closingConfirmed = false
local exitConfirmOpen = false
local exitConfirmForm = nil

local function showExitConfirm()
  if exitConfirmOpen and exitConfirmForm then
    pcall(function() exitConfirmForm:Show() end)
    pcall(function() exitConfirmForm:BringToFront() end)
    return
  end

  exitConfirmOpen = true
  local dlg = VCL.Form()
  exitConfirmForm = dlg
  dlg._ = { Caption = "Exit VCLua Form Editor?", Width = 360, Height = 150, Position = "poScreenCenter", BorderStyle = "bsDialog" }

  local lab = VCL.Label(dlg, "lblExitConfirm")
  lab._ = { Left = 12, Top = 14, Width = 330, Height = 46, Caption = "Close the form editor and exit the program?\nUnsaved changes will be lost unless you saved them." }

  local yes = VCL.Button(dlg, "btnExitYes")
  yes._ = { Left = 164, Top = 82, Width = 80, Height = 28, Caption = "Exit" }

  local no = VCL.Button(dlg, "btnExitNo")
  no._ = { Left = 254, Top = 82, Width = 80, Height = 28, Caption = "Cancel" }

  local function closeDialogOnly()
    exitConfirmOpen = false
    exitConfirmForm = nil
    pcall(function() dlg:Hide() end)
  end

  local function acceptExit()
    closingConfirmed = true
    closeDialogOnly()
    pcall(function()
      local rootObj = runtime.getObject(model.getRoot(project))
      if rootObj then rootObj:Hide() end
    end)
    pcall(function() app:Terminate() end)
  end

  yes.OnClick = acceptExit
  no.OnClick = closeDialogOnly
  pcall(function() yes.Default = true end)
  pcall(function() no.Cancel = true end)
  pcall(function() dlg.KeyPreview = true end)

  local function keyHandler(sender, key, shift)
    local code = type(key) == "number" and key or tonumber(tostring(key or ""))
    local ks = tostring(key or "")
    if code == 13 or ks == "VK_RETURN" or ks == "Return" or ks == "Enter" then acceptExit(); return 0 end
    if code == 27 or ks == "VK_ESCAPE" or ks == "Escape" then closeDialogOnly(); return 0 end
    return key
  end
  dlg.OnKeyDown = keyHandler
  pcall(function()
    dlg.OnClose = function(sender, action)
      closeDialogOnly()
      return "caHide"
    end
  end)
  dlg:Show()
  pcall(function() dlg:BringToFront() end)
end

pcall(function()
  frm.OnClose = function(sender, action)
    if closingConfirmed then return "caFree" end
    showExitConfirm()
    return "caNone"
  end
end)

local function setupComponentImages(owner)
  if not cmpImg or not VCL.ImageList or not VCL.Image or not VCL.MemoryStream then return nil end
  local ok, list = pcall(function() return VCL.ImageList(owner) end)
  if not ok or not list then return nil end
  pcall(function() list.Height = 24 end)
  pcall(function() list.Width = 24 end)

  local imgOk, img = pcall(function() return VCL.Image() end)
  local streamOk, stream = pcall(function() return VCL.MemoryStream() end)
  if not imgOk or not streamOk or not img or not stream then return nil end

  local function addIcon(name, data)
    if not data then return nil end
    local okAdd, idx = pcall(function()
      stream:Clear()
      stream:LoadFromHex(data, 5)
      img.picture:LoadFromStream(stream)
      return list:Add(img.picture.Bitmap, nil)
    end)
    if okAdd and idx ~= nil then
      iconMap[name] = idx
      return idx
    end
    return nil
  end

  if cmpImg.Form then addIcon("Form", cmpImg.Form.data) end
  for name, rec in pairs(cmpImg) do
    if name ~= "Form" and type(rec) == "table" then
      addIcon(name, rec.data)
    end
  end

  pcall(function() stream:Free() end)
  pcall(function() img:Free() end)
  return list
end

local function iconIndexFor(name)
  local def = registry.get(name)
  local iconName = (def and def.icon) or name
  return iconMap[iconName] or iconMap[name] or iconMap.Form
end

compImages = setupComponentImages(frm)

local function loadActions(list, actions)
  for _, prop in ipairs(actions or {}) do
    local a = VCL.Action()
    a._ = prop
    if prop.name then list[prop.name] = a end
  end
end

local function loadMenu(menu, items, parentCaption)
  for _, item in ipairs(items or {}) do
    local props = {}
    for k, v in pairs(item) do
      if k ~= "submenu" then props[k] = v end
    end
    local mi
    if parentCaption then
      mi = VCL.MenuItem(menu, props)
      menu.Items:Find(parentCaption):Add(mi)
    else
      mi = VCL.MenuItem(menu, props)
      menu.Items:Add(mi)
    end
    if item.submenu then
      loadMenu(menu, item.submenu, props.caption)
    end
  end
end

local left = VCL.Panel(frm, "left")
left._ = { Align = "alClient", Caption = "" }

local commandPanel = VCL.Panel(left, "commandPanel")
commandPanel._ = { Align = "alTop", Height = 30, Caption = "" }

local btnDuplicate = VCL.Button(commandPanel, "btnDuplicate")
btnDuplicate._ = { Left = 0, Top = 0, Width = 1, Height = 1, Caption = "Duplicate", Visible = false }

local btnDelete = VCL.Button(commandPanel, "btnDelete")
btnDelete._ = { Left = 0, Top = 0, Width = 1, Height = 1, Caption = "Delete", Visible = false }

local btnSave = VCL.Button(commandPanel, "btnSave")
btnSave._ = { Left = 0, Top = 0, Width = 1, Height = 1, Caption = "Save...", Visible = false }

local btnLoad = VCL.Button(commandPanel, "btnLoad")
btnLoad._ = { Left = 0, Top = 0, Width = 1, Height = 1, Caption = "Load...", Visible = false }

local btnCenter = VCL.Button(commandPanel, "btnCenter")
btnCenter._ = { Left = 0, Top = 0, Width = 1, Height = 1, Caption = "Center", Visible = false }

local btnOptions = VCL.Button(commandPanel, "btnOptions")
btnOptions._ = { Left = 0, Top = 0, Width = 1, Height = 1, Caption = "Options", Visible = false }

local btnPreview = VCL.Button(commandPanel, "btnPreview")
btnPreview._ = { Left = 0, Top = 0, Width = 1, Height = 1, Caption = "Show", Visible = false }

btnToggleProps = VCL.Button(commandPanel, "btnToggleProps")
btnToggleProps._ = { Left = 0, Top = 0, Width = 1, Height = 1, Caption = "Props", Visible = false }

local btnHelp = VCL.Button(commandPanel, "btnHelp")
btnHelp._ = { Left = 0, Top = 0, Width = 1, Height = 1, Caption = "Help", Visible = false }

btnReopenForm = VCL.Button(commandPanel, "btnReopenForm")
btnReopenForm._ = { Left = 0, Top = 0, Width = 1, Height = 1, Caption = "Reopen", Visible = false }

local btnGridSize = VCL.Button(commandPanel, "btnGridSize")
btnGridSize._ = { Left = 0, Top = 0, Width = 1, Height = 1, Caption = "Grid 8", Visible = false }

local btnSnap = VCL.Button(commandPanel, "btnSnap")
btnSnap._ = { Left = 0, Top = 0, Width = 1, Height = 1, Caption = "Snap OFF", Visible = false }

local btnShowGrid = VCL.Button(commandPanel, "btnShowGrid")
btnShowGrid._ = { Left = 0, Top = 0, Width = 1, Height = 1, Caption = "Show OFF", Visible = false }

local function makeFlatButton(btn)
  pcall(function() btn.Flat = true end)
  pcall(function() btn.ShowHint = true end)
end

for _, b in ipairs({ btnGridSize, btnSnap, btnShowGrid, btnToggleProps }) do
  makeFlatButton(b)
end
pcall(function() btnGridSize.Hint = "Alt+G: grid size" end)
pcall(function() btnSnap.Hint = "Ctrl+G: snap-to-grid" end)
pcall(function() btnShowGrid.Hint = "Ctrl+Shift+G: show grid" end)
pcall(function() btnOptions.Hint = "Designer/grid options" end)
pcall(function() btnPreview.Hint = "F5: show/focus edited Form window" end)
pcall(function() btnHelp.Hint = "F1: shortcuts and editor help" end)
pcall(function() btnToggleProps.Hint = "F4: show/hide property panel" end)

local lblStatus = VCL.Label(commandPanel, "lblStatus")
lblStatus._ = { Left = 8, Top = 4, Width = 354, Height = 22, Caption = "Ready" }
pcall(function() lblStatus.ShowHint = true end)

local function setStatus(text)
  text = tostring(text or "Ready")
  pcall(function() lblStatus.Caption = text end)
  pcall(function() lblStatus.Hint = text end)
end

local function makeSplitter(parent, name, align)
  local sp
  if VCL.Splitter then
    sp = VCL.Splitter(parent, name)
    sp._ = { Align = align, Height = 5, Width = 5 }
    pcall(function() sp.MinSize = 160 end)
    pcall(function() sp.ResizeStyle = "rsPattern" end)
    pcall(function() sp.Beveled = true end)
  else
    sp = VCL.Panel(parent, name)
    sp._ = { Align = align, Height = 5, Width = 5, Caption = "" }
    pcall(function() sp.Color = "clBtnShadow" end)
  end
  return sp
end

local splitTreePalette = makeSplitter(left, "splitTreePalette", "alTop")

local treePanel = VCL.Panel(left, "treePanel")
treePanel._ = { Align = "alTop", Height = 210, Caption = "" }
pcall(function() treePanel.Constraints.MinHeight = 160 end)

local lblTree = VCL.Label(treePanel, "lblTree")
lblTree._ = { Align = "alTop", Height = 22, Caption = "  Object Tree" }

local tv = VCL.TreeView(treePanel, "tvModel")
tv._ = {
  Align = "alClient",
  ReadOnly = true,
  AutoExpand = true,
  ScrollBars = "ssAutoBoth",
  DefaultItemHeight = 28,
}
if compImages then pcall(function() tv.StateImages = compImages end) end

local right = VCL.Panel(left, "right")
right._ = { Align = "alBottom", Height = 240, Caption = "" }
pcall(function() right.Constraints.MinHeight = 200 end)

local splitPaletteProps = makeSplitter(left, "splitPaletteProps", "alBottom")

local palettePanel = VCL.Panel(left, "palettePanel")
palettePanel._ = { Align = "alClient", Caption = "" }
pcall(function() palettePanel.Constraints.MinHeight = 160 end)

local lblPalette = VCL.Label(palettePanel, "lblPalette")
lblPalette._ = { Align = "alTop", Height = 22, Caption = "  Components" }

local paletteSearch = VCL.Edit(palettePanel, "paletteSearch")
paletteSearch._ = { Align = "alTop", Height = 26, Text = "" }
pcall(function() paletteSearch.TextHint = "Search component..." end)
pcall(function() paletteSearch.Hint = "Type to filter the component palette" end)

local paletteTree = VCL.TreeView(palettePanel, "paletteTree")
paletteTree._ = {
  Align = "alClient",
  ReadOnly = true,
  AutoExpand = true,
  ScrollBars = "ssAutoBoth",
  DefaultItemHeight = 28,
}
if compImages then pcall(function() paletteTree.StateImages = compImages end) end

local grid = VCL.TIPropertyGrid(right, "propGrid")
grid._ = {
  Align = "alClient",
  Filter = "[tkInteger, tkChar, tkEnumeration, tkFloat, tkSet, tkSString, tkLString, tkAString, tkWString, tkClass, tkWChar, tkBool, tkInt64, tkQWord, tkUString, tkUChar]",
}

local function updatePropsVisibility()
  pcall(function() right.Visible = propsVisible and true or false end)
  pcall(function() splitPaletteProps.Visible = propsVisible and true or false end)
  if btnToggleProps then
    btnToggleProps.Caption = propsVisible and "Props OFF" or "Props ON"
  end

  pcall(function() frm.Width = 400 end)
  if propsVisible then
    pcall(function() if right.Height < 200 then right.Height = 240 end end)
  end
end

local function toggleProps()
  propsVisible = not propsVisible
  updatePropsVisibility()
end


local function updateGridStatus()
  local snap = editorOptions.snapToGrid and "ON" or "OFF"
  local visible = "ON"
  local shape = tostring(editorOptions.gridShape or "dot")
  btnGridSize.Caption = "Grid " .. tostring(editorOptions.gridSize)
  btnSnap.Caption = "Snap " .. snap
  btnShowGrid.Caption = "Grid ON"
  pcall(function() btnGridSize.Hint = "Alt+G: grid size, shape=" .. shape end)
  syncProjectFromOptions()
  runtime.setOptions(editorOptions)
end

local function showOptions()

  optionsDialog.show(project, function()
    syncOptionsFromProject()
    updateGridStatus()
    runtime.setOptions(editorOptions)
    setStatus("Options applied")
  end)
  syncOptionsFromProject()
  updateGridStatus()
  runtime.setOptions(editorOptions)
end

local function selectNode(node)
  selectedNode = node
  inspector.showNode(node)
  runtime.selectNode(node)
end

local function syncTabOrders()
  local changed = model.updateTabOrders(project)
  for _, node in ipairs(changed or {}) do
    runtime.applyNodeProperty(node, "TabOrder", node.props and node.props.TabOrder or 0)
  end
  return changed
end

local function rebuildAll(keepSelection)
  if inspector and inspector.commitPendingEdit then inspector.commitPendingEdit() end

  syncTabOrders()
  runtime.setOptions(editorOptions)
  local callbacks = {
    onSelect = function(node)
      selectNode(node)
    end,
    onMoved = function(node)
      if selectedNode == node then inspector.showNode(node) end
    end,
    onReparented = function(node, parent)
      rebuildAll(node)
    end,
    onKeyDown = function(key, shift)
      if handleShortcut then return handleShortcut(key, shift) end
      return false
    end,
    isPaletteSource = function(source)
      local className = palette.selectedClass()
      local ok = className ~= nil
      if ok then setStatus('Form1 accepts palette drag: '..tostring(className)) end
      return ok
    end,
    onPaletteDrop = function(targetNode, x, y)
      local className = palette.selectedClass()
      setStatus('Form1 drop: '..tostring(className or '?')..' @ '..tostring(x)..','..tostring(y))
      if className then addComponentAt(className, model.getRoot(project), x, y) end
    end,
    onDragDebug = function(msg)
      setStatus('DD: '..tostring(msg))
    end,
  }
  pcall(function() frm.FormStyle = "fsNormal" end)
  runtime.rebuildFloating(project, callbacks)

  tree.rebuild(project)

  local nodeToSelect = keepSelection or model.getRoot(project)
  selectNode(nodeToSelect)

  pcall(function() app:ProcessMessages() end)
  pcall(function() app.ProcessMessages(app) end)
  runtime.refreshNode(nodeToSelect)
end

local function currentParentNode()
  local root = model.getRoot(project)
  if selectedNode and registry.isContainer(selectedNode.class) then
    return selectedNode
  end
  if selectedNode and selectedNode ~= root then
    local parent = model.findParent(project, selectedNode)
    if parent then return parent end
  end
  return root
end

local function isSplitterClass(className)
  return tostring(className or ""):lower() == "splitter"
end

local function splitterAlignFromReference(refNode)
  local align = refNode and refNode.props and refNode.props.Align
  if align == "alTop" or align == "alBottom" or align == "alLeft" or align == "alRight" then
    return align
  end
  return "alTop"
end

local function num(v, fallback)
  local n = tonumber(v)
  if n == nil then return fallback or 0 end
  return n
end

local function nodeRuntimeRect(node)
  local obj = node and runtime and runtime.getObject and runtime.getObject(node)
  if obj then
    return {
      left = num(obj.Left, 0),
      top = num(obj.Top, 0),
      width = num(obj.Width, 0),
      height = num(obj.Height, 0),
    }
  end

  local props = node and node.props or {}
  return {
    left = num(props.Left, 0),
    top = num(props.Top, 0),
    width = num(props.Width, 0),
    height = num(props.Height, 0),
  }
end

local function configureSplitterNode(node, refNode)
  node.props = node.props or {}

  local align = splitterAlignFromReference(refNode)
  local r = nodeRuntimeRect(refNode)

  node.props.Align = align

  -- Designer-side placement: a Splitter belongs on the boundary after the
  -- selected sibling. For vertical stacking this is the sibling bottom edge;
  -- for horizontal stacking this is the sibling right edge.
  if align == "alLeft" or align == "alRight" then
    node.props.Left = r.left + r.width
    node.props.Top = r.top
    node.props.Width = tonumber(node.props.Width) or 5
    node.props.Height = r.height > 0 and r.height or nil
  else
    node.props.Left = r.left
    node.props.Top = r.top + r.height
    node.props.Width = r.width > 0 and r.width or nil
    node.props.Height = tonumber(node.props.Height) or 5
  end
end

local function nodeIndexInParent(parent, node)
  if not parent or not parent.items then return nil end
  for i, child in ipairs(parent.items) do
    if child == node then return i end
  end
  return nil
end

local function moveNodeInParent(parent, node, newIndex)
  if not parent or not parent.items or not node then return end
  local oldIndex = nodeIndexInParent(parent, node)
  if not oldIndex then return end

  table.remove(parent.items, oldIndex)
  if newIndex > oldIndex then newIndex = newIndex - 1 end
  if newIndex < 1 then newIndex = 1 end
  if newIndex > #parent.items + 1 then newIndex = #parent.items + 1 end
  table.insert(parent.items, newIndex, node)
end

local function isBoundaryAlign(align)
  return align == "alTop" or align == "alBottom" or align == "alLeft" or align == "alRight"
end

local function prepareSplitterNode(node, boundaryNode)
  node.props = node.props or {}

  -- Splitter is layout-controlled. Its visual position is determined by
  -- sibling order + Align + neighbouring panel size, not by Left/Top.
  node.props.Left = nil
  node.props.Top = nil

  local align = boundaryNode and boundaryNode.props and boundaryNode.props.Align
  if not isBoundaryAlign(align) then
    align = node.props.Align
  end
  if not isBoundaryAlign(align) then
    align = "alTop"
  end

  node.props.Align = align
  if align == "alTop" or align == "alBottom" then
    node.props.Height = tonumber(node.props.Height) or 5
    node.props.Width = nil
  else
    node.props.Width = tonumber(node.props.Width) or 5
    node.props.Height = nil
  end
end

local function splitterInsertParentAndIndex(defaultParent)
  local root = model.getRoot(project)

  -- Splitter insertion is sibling-based. If a normal/control/container node
  -- is selected, insert the splitter immediately after that node, into the
  -- same parent. This places it on the boundary controlled by the previous
  -- sibling, which is how LCL Align splitters are meant to be used.
  if selectedNode and selectedNode ~= root then
    local parent = model.findParent(project, selectedNode)
    local idx = nodeIndexInParent(parent, selectedNode)
    if parent and idx then
      return parent, idx + 1, selectedNode
    end
  end

  return defaultParent or currentParentNode(), nil, nil
end

function addComponentAt(className, parent, left, top)
  className = tostring(className or "")
  if className == "" then return nil end
  if not VCL[className] then
    VCL.ShowMessage("This VCLua build does not expose: " .. className)
    return nil
  end

  local root = model.getRoot(project)
  local insertAfter = nil
  local splitter = isSplitterClass(className)

  if splitter and selectedNode and selectedNode ~= root then
    -- Splitters should be inserted between sibling controls.
    -- If a control is selected, add the Splitter to the selected control's
    -- parent and move it directly after the selected control in the tree.
    insertAfter = selectedNode
    parent = model.findParent(project, selectedNode) or root
    left, top = nil, nil
  else
    parent = parent or currentParentNode()
  end

  local node = model.addChild(parent, className)

  if splitter then
    configureSplitterNode(node, insertAfter)
    if insertAfter then
      local moved, err = model.moveNodeAfter(project, node, insertAfter)
      if not moved and err ~= "same node" then
        setStatus("Splitter reorder failed: " .. tostring(err))
      end
    end
  else
    model.applyThemeToNewNode(project, parent, node)
    node.props = node.props or {}
    if left ~= nil then node.props.Left = math.max(0, math.floor(tonumber(left) or 0)) end
    if top ~= nil then node.props.Top = math.max(0, math.floor(tonumber(top) or 0)) end
    if clampNodeIntoParent then clampNodeIntoParent(node) end
  end

  if inspector and inspector.commitPendingEdit then inspector.commitPendingEdit() end

  if splitter and insertAfter then
    -- Splitter align order is sensitive to LCL child order, so rebuild this
    -- small structural change instead of only adding a live subtree.
    rebuildAll(node)
  else
    runtime.addLiveNode(parent, node)
    syncTabOrders()
    tree.rebuild(project)
    selectNode(node)
    pcall(function() app:ProcessMessages() end)
    pcall(function() runtime.refreshNode(node) end)
  end

  setStatus("Added: " .. tostring(node.name or node.class))
  return node
end

local function addComponent(className)
  addComponentAt(className, currentParentNode())
end

local function reopenEditedForm()
  local obj = runtime.getObject(model.getRoot(project))
  if obj then
    local ok = pcall(function() obj:Show() end)
    pcall(function() obj.Show(obj) end)
    pcall(function() obj:BringToFront() end)
    pcall(function() obj.BringToFront(obj) end)
    setStatus("Edited form shown")
    return ok
  end
  rebuildAll(selectedNode or model.getRoot(project))
  setStatus("Edited form rebuilt")
end

local function doDuplicate()
  if not selectedNode then return end
  local parent = model.findParent(project, selectedNode)
  runtime.syncStringCollections(selectedNode)
  local copy, err = model.duplicateNode(project, selectedNode)
  if not copy then
    VCL.ShowMessage(tostring(err))
    return
  end

  if clampNodeIntoParent then clampNodeIntoParent(copy) end
  runtime.addLiveNode(parent, copy)
  syncTabOrders()
  tree.rebuild(project)
  selectNode(copy)
  pcall(function() app:ProcessMessages() end)
  pcall(function() runtime.refreshNode(copy) end)
  setStatus("Duplicated: " .. tostring(copy.name or copy.class))
end

local function doDelete()
  if not selectedNode then return end
  local node = selectedNode
  local root = model.getRoot(project)
  if node == root then
    setStatus("Root form cannot be deleted")
    return
  end

  local parent = model.findParent(project, node) or root

  selectNode(nil)
  pcall(function() runtime.hideLiveSubtree(node) end)

  local ok, err = model.deleteNode(project, node)
  if not ok then
    setStatus("Delete failed: " .. tostring(err))
    pcall(function() runtime.setNodeVisible(node, true) end)
    selectNode(parent)
    return
  end

  syncTabOrders()
  tree.rebuild(project)
  selectNode(parent)
  setStatus("Deleted: " .. tostring(node.name or node.class))
end

local function cancelPendingCut()
  if clipboard and clipboard.mode == "cut" and clipboard.node then
    runtime.setNodeVisible(clipboard.node, true)
    setStatus("Cut cancelled")
  end
  clipboard = nil
  updateMainCaption()
end

local function doCopy()
  if not selectedNode or selectedNode == model.getRoot(project) then return end
  if clipboard and clipboard.mode == "cut" then cancelPendingCut() end
  runtime.syncStringCollections(selectedNode)
  local copy = model.copyNode(selectedNode)
  if not copy then return end
  clipboard = { mode = "copy", node = copy }
  setStatus("Copied: " .. tostring(selectedNode.name or selectedNode.class))
end

local function doCut()
  if not selectedNode or selectedNode == model.getRoot(project) then return end
  if clipboard and clipboard.mode == "cut" then cancelPendingCut() end

  clipboard = { mode = "cut", node = selectedNode }
  runtime.setNodeVisible(selectedNode, false)
  setStatus("Cut pending: " .. tostring(selectedNode.name or selectedNode.class) .. "  |  Ctrl+V paste, Esc cancel")
  pcall(function() frm.Caption = "VCLua FormEditor - cut: " .. tostring(selectedNode.name or selectedNode.class) end)
end

local function doPaste()
  if not clipboard or not clipboard.node then return end
  local parent = currentParentNode()
  local pasted, err

  if clipboard.mode == "cut" then
    local node = clipboard.node
    if not node then return end
    if node == parent or model.isAncestor(node, parent) then
      runtime.setNodeVisible(node, true)
      VCL.ShowMessage("Cannot paste a control into itself or its child")
      return
    end

    local left = node.props and node.props.Left or 0
    local top = node.props and node.props.Top or 0
    local ok, moveErr = model.moveNodeToParent(project, node, parent, left, top)
    if not ok then
      runtime.setNodeVisible(node, true)
      VCL.ShowMessage(tostring(moveErr))
      return
    end
    if clampNodeIntoParent then clampNodeIntoParent(node) end
    runtime.moveLiveNodeToParent(node, parent)
    runtime.applyNodeBounds(node)
    runtime.setNodeVisible(node, true)
    syncTabOrders()
    clipboard = nil
    pasted = node
    setStatus("Moved: " .. tostring(node.name or node.class))
  else
    pasted, err = model.pasteCopy(project, parent, clipboard.node, 16)
    if not pasted then
      VCL.ShowMessage(tostring(err))
      return
    end
    if clampNodeIntoParent then clampNodeIntoParent(pasted) end
    runtime.addLiveNode(parent, pasted)
    syncTabOrders()
    setStatus("Pasted copy: " .. tostring(pasted.name or pasted.class))
  end

  tree.rebuild(project)
  selectNode(pasted)
  pcall(function() app:ProcessMessages() end)
  pcall(function() runtime.refreshNode(pasted) end)
  updateMainCaption()
end

local function doSave(showMessage)
  local fileName = askSaveFile()
  if not fileName then return false, "cancelled" end

  if inspector and inspector.commitPendingEdit then inspector.commitPendingEdit() end
  runtime.syncStringCollections(model.getRoot(project))
  syncTabOrders()

  local ok, err = serializer.saveLua(project, fileName)
  if ok then currentFileName = fileName; updateMainCaption() end
  if showMessage ~= false then
    if ok then
      VCL.ShowMessage("Saved: " .. fileName)
    else
      VCL.ShowMessage("Save failed: " .. tostring(err))
    end
  end
  return ok, err
end

local function doLoad()
  local fileName = askOpenFile()
  if not fileName then return end

  selectNode(nil)
  local data, err = serializer.loadLua(fileName)
  if not data then
    VCL.ShowMessage("Load failed: " .. tostring(err))
    return
  end
  project = data
  currentFileName = fileName
  model.ensureDesigner(project)
  syncOptionsFromProject()
  model.resetCounters(project)
  updateGridStatus()
  rebuildAll(model.getRoot(project))
  updateMainCaption()
  VCL.ShowMessage("Loaded: " .. fileName)
end


local function prepareProjectForOutput()
  if inspector and inspector.commitPendingEdit then inspector.commitPendingEdit() end
  runtime.syncStringCollections(model.getRoot(project))
  syncTabOrders()
end

local function doExportLua()
  local fileName = askExportFile(".lua", "Export runtime Lua module...", "Lua module (*.lua)|*.lua|All files|*.*")
  if not fileName then return end
  prepareProjectForOutput()
  local base = pathBase(fileName):gsub("%.lua$", "")
  local ok, err = serializer.exportLuaModule(project, fileName, base)
  if ok then
    setStatus("Exported Lua: " .. fileName)
    VCL.ShowMessage("Exported Lua module: " .. fileName)
  else
    VCL.ShowMessage("Lua export failed: " .. tostring(err))
  end
end

local function doExportJson()
  local fileName = askExportFile(".json", "Export JSON...", "JSON files (*.json)|*.json|All files|*.*")
  if not fileName then return end
  prepareProjectForOutput()
  local ok, err = serializer.saveJson(project, fileName)
  if ok then
    setStatus("Exported JSON: " .. fileName)
    VCL.ShowMessage("Exported JSON: " .. fileName)
  else
    VCL.ShowMessage("JSON export failed: " .. tostring(err))
  end
end

local function snapNumber(v)
  v = tonumber(v) or 0
  if not editorOptions.snapToGrid then return math.floor(v + 0.5) end
  local g = tonumber(editorOptions.gridSize) or 8
  if g < 1 then g = 1 end
  return math.floor((v + g / 2) / g) * g
end

local function parentSizeFor(node)
  local parent = model.findParent(project, node)
  if not parent then parent = model.getRoot(project) end
  local props = parent and parent.props or {}
  return tonumber(props.Width) or 520, tonumber(props.Height) or 360
end

function clampNodeIntoParent(node)
  if not node or node == model.getRoot(project) then return false end
  node.props = node.props or {}
  local pw, ph = parentSizeFor(node)
  local w = math.max(12, tonumber(node.props.Width) or 12)
  local h = math.max(12, tonumber(node.props.Height) or 12)
  if w > pw then w = math.max(12, pw) end
  if h > ph then h = math.max(12, ph) end
  local l = tonumber(node.props.Left) or 0
  local t = tonumber(node.props.Top) or 0
  if l < 0 then l = 0 end
  if t < 0 then t = 0 end
  if l + w > pw then l = math.max(0, pw - w) end
  if t + h > ph then t = math.max(0, ph - h) end
  node.props.Left = l
  node.props.Top = t
  node.props.Width = w
  node.props.Height = h
  return true
end

local function doFixLayout()
  local changed = false
  local function walk(node)
    for _, child in ipairs(node.items or {}) do
      if clampNodeIntoParent(child) then changed = true end
      walk(child)
    end
  end
  walk(model.getRoot(project))
  if changed then
    rebuildAll(selectedNode or model.getRoot(project))
  end
end

local function doCenterSelected()
  local node = selectedNode
  if not node or node == model.getRoot(project) then return end
  node.props = node.props or {}
  local pw, ph = parentSizeFor(node)
  local w = tonumber(node.props.Width) or 12
  local h = tonumber(node.props.Height) or 12
  node.props.Left = math.max(0, snapNumber((pw - w) / 2))
  node.props.Top = math.max(0, snapNumber((ph - h) / 2))
  clampNodeIntoParent(node)
  runtime.applyNodeBounds(node)
  inspector.showNode(node)
end

local function moveSelected(dx, dy, dw, dh)
  local node = selectedNode
  if not node or node == model.getRoot(project) then return end
  node.props = node.props or {}
  node.props.Left = math.max(0, (tonumber(node.props.Left) or 0) + (dx or 0))
  node.props.Top = math.max(0, (tonumber(node.props.Top) or 0) + (dy or 0))
  if dw and dw ~= 0 then node.props.Width = math.max(12, (tonumber(node.props.Width) or 1) + dw) end
  if dh and dh ~= 0 then node.props.Height = math.max(12, (tonumber(node.props.Height) or 1) + dh) end
  runtime.applyNodeBounds(node)
  inspector.showNode(node)
end

local function toggleSnap()
  editorOptions.snapToGrid = not editorOptions.snapToGrid
  updateGridStatus()
end

local function toggleGridVisible()
  editorOptions.showGrid = true
  updateGridStatus()
  setStatus("Grid is always ON")
end

local function cycleGridSize()
  gridSizeIndex = findGridSizeIndex(editorOptions.gridSize)
  gridSizeIndex = gridSizeIndex + 1
  if gridSizeIndex > #gridSizes or gridSizeIndex < 1 then gridSizeIndex = 1 end
  editorOptions.gridSize = gridSizes[gridSizeIndex]
  updateGridStatus()
end

local function showHelp()
  help.show()
end

local function showAbout()
  if help.about then help.about() end
end

local function showEditedForm()
  local obj = runtime.getObject(model.getRoot(project))
  if not obj then
    reopenEditedForm()
    return true
  end
  pcall(function() obj:Show() end)
  pcall(function() obj.Show(obj) end)
  pcall(function() obj:BringToFront() end)
  pcall(function() obj.BringToFront(obj) end)
  setStatus("Edited form shown/focused")
  return true
end

btnDuplicate.OnClick = function() doDuplicate() end

btnDelete.OnClick = function() doDelete() end

btnSave.OnClick = function() doSave(true) end

btnLoad.OnClick = function() doLoad() end

btnCenter.OnClick = function() doCenterSelected() end
btnGridSize.OnClick = function() cycleGridSize() end
btnSnap.OnClick = function() toggleSnap() end
btnShowGrid.OnClick = function() toggleGridVisible() end
btnOptions.OnClick = function() showOptions() end
btnPreview.OnClick = function() showEditedForm() end
btnToggleProps.OnClick = function() toggleProps() end
btnHelp.OnClick = function() showHelp() end

local function keyToCode(key)
  if type(key) == "number" then return key end
  local s = tostring(key or "")
  local map = {
    VK_DELETE = 46, Delete = 46, Del = 46, VK_ESCAPE = 27, Escape = 27, Esc = 27,
    VK_RETURN = 13, Return = 13, Enter = 13,
    VK_F1 = 112, F1 = 112,
    VK_F2 = 113, F2 = 113,
    VK_F4 = 115, F4 = 115,
    VK_F5 = 116, F5 = 116,
    VK_F6 = 117, F6 = 117,
    VK_LEFT = 37, Left = 37,
    VK_UP = 38, Up = 38,
    VK_RIGHT = 39, Right = 39,
    VK_DOWN = 40, Down = 40,
  }
  if map[s] then return map[s] end
  if #s == 1 then return string.byte(s:upper()) end
  local letter = s:match("VK_([A-Z])") or s:match("^([A-Z])$")
  if letter then return string.byte(letter) end
  return tonumber(s)
end

local function hasMod(shift, name)
  name = name:lower()
  if type(shift) == "table" then
    for k, v in pairs(shift) do
      local ks = tostring(k):lower()
      local vs = tostring(v):lower()
      if ks:find(name, 1, true) or vs:find(name, 1, true) then return true end
    end
  else
    return tostring(shift or ""):lower():find(name, 1, true) ~= nil
  end
  return false
end

function handleShortcut(key, shift)
  local code = keyToCode(key)
  local ctrl = hasMod(shift, "ctrl")
  local sh = hasMod(shift, "shift")
  local alt = hasMod(shift, "alt")
  local step = sh and editorOptions.gridSize or 1

  if code == 27 then if clipboard and clipboard.mode == "cut" then cancelPendingCut(); return true end end
  if code == 46 then doDelete(); return true end
  if code == 112 then showHelp(); return true end
  if code == 113 and doRenameSelected then doRenameSelected(); return true end
  if code == 115 then toggleProps(); return true end
  if code == 116 then showEditedForm(); return true end

  if ctrl and code == string.byte("C") then doCopy(); return true end
  if ctrl and code == string.byte("X") then doCut(); return true end
  if ctrl and code == string.byte("V") then doPaste(); return true end
  if ctrl and code == string.byte("D") then doDuplicate(); return true end
  if ctrl and code == string.byte("E") then doCenterSelected(); return true end
  if ctrl and sh and code == string.byte("R") then doFixLayout(); return true end
  if ctrl and code == string.byte("S") then doSave(true); return true end
  if ctrl and code == string.byte("O") then doLoad(); return true end
  if ctrl and code == string.byte("G") and not sh then toggleSnap(); return true end
  if ctrl and sh and code == string.byte("G") then toggleGridVisible(); return true end
  if alt and code == string.byte("G") then cycleGridSize(); return true end

  if alt and not ctrl and code == 38 then -- Alt+Up: tree/order up
    if doReorderSelected then doReorderSelected(-1) end
    return true
  elseif alt and not ctrl and code == 40 then -- Alt+Down: tree/order down
    if doReorderSelected then doReorderSelected(1) end
    return true
  end

  if code == 37 then -- left
    if ctrl then moveSelected(0, 0, -step, 0) else moveSelected(-step, 0) end
    return true
  elseif code == 39 then -- right
    if ctrl then moveSelected(0, 0, step, 0) else moveSelected(step, 0) end
    return true
  elseif code == 38 then -- up
    if ctrl then moveSelected(0, 0, 0, -step) else moveSelected(0, -step) end
    return true
  elseif code == 40 then -- down
    if ctrl then moveSelected(0, 0, 0, step) else moveSelected(0, step) end
    return true
  end

  return false
end

frm.KeyPreview = true
frm.OnKeyDown = function(sender, key, shift)
  handleShortcut(key, shift)
  return key
end

local function canTreeDrop(srcNode, dstNode)
  local root = model.getRoot(project)
  if not srcNode or not dstNode then return false, "missing source or target" end
  if srcNode == root then return false, "the root form cannot be moved" end
  if srcNode == dstNode then return false, "cannot move a control into itself" end
  if model.isAncestor(srcNode, dstNode) then return false, "cannot move a control into its child" end

  local srcParent = model.findParent(project, srcNode)
  local dstParent = model.findParent(project, dstNode)
  if srcParent and srcParent == dstParent then
    return true, "reorder"
  end

  if dstNode ~= root and not registry.isContainer(dstNode.class) then
    return false, "target is not a container"
  end
  return true, "reparent"
end

local function handleTreeDrop(mode, srcNode, dstNode)
  local ok, kindOrErr = canTreeDrop(srcNode, dstNode)
  if mode == "can" then return ok end
  if not ok then
    VCL.ShowMessage(tostring(kindOrErr))
    return false
  end

  if kindOrErr == "reorder" then
    local moved, err = model.moveNodeAfter(project, srcNode, dstNode)
    if not moved then
      if err ~= "same node" then VCL.ShowMessage(tostring(err)) end
      return false
    end
    syncTabOrders()
    tree.rebuild(project)
    selectNode(srcNode)
    setStatus("Reordered: " .. tostring(srcNode.name or srcNode.class))
    return true
  end

  local left = srcNode.props and srcNode.props.Left or 0
  local top = srcNode.props and srcNode.props.Top or 0
  local moved, moveErr = model.moveNodeToParent(project, srcNode, dstNode, left, top)
  if not moved then
    VCL.ShowMessage(tostring(moveErr))
    return false
  end

  clampNodeIntoParent(srcNode)
  rebuildAll(srcNode)
  setStatus("Moved under: " .. tostring(dstNode.name or dstNode.class))
  return true
end

tree.init(tv, function(node)
  if selectingNode then return end
  selectNode(node, { fromTree = true })
end, handleTreeDrop, { iconIndexFor = iconIndexFor })

palette.init(paletteTree, function(className)
  addComponent(className)
end, { iconIndexFor = iconIndexFor, onDebug = function(msg) setStatus('DD: '..tostring(msg)) end })
local function rebuildPalette()
  palette.rebuild(registry, VCL, paletteSearch.Text)
end
paletteSearch.OnChange = function() rebuildPalette() end
rebuildPalette()

local function nameExists(name, exclude)
  local found = false
  local function walk(node)
    if not node or found then return end
    if node ~= exclude and tostring(node.name or "") == tostring(name or "") then
      found = true
      return
    end
    for _, child in ipairs(node.items or {}) do walk(child) end
  end
  for _, form in ipairs(project.forms or {}) do walk(form) end
  return found
end

local function validateName(node, newName)
  newName = tostring(newName or ""):gsub("[^_%w]", "")
  if newName == "" then return nil, "Name cannot be empty" end
  if nameExists(newName, node) then return nil, "Name already exists: " .. newName end
  return newName
end

local function applyRename(node, newName)
  if not node then return false end
  local valid, err = validateName(node, newName)
  if not valid then
    VCL.ShowMessage(tostring(err))
    runtime.applyNodeProperty(node, "Name", node.name)
    inspector.refresh()
    return false
  end

  local oldName = tostring(node.name or "")
  node.name = valid
  node.props = node.props or {}

  if node.props.Caption ~= nil and tostring(node.props.Caption) == oldName then
    node.props.Caption = valid
    runtime.applyNodeProperty(node, "Caption", valid)
  end
  if node.props.Text ~= nil and tostring(node.props.Text) == oldName then
    node.props.Text = valid
    runtime.applyNodeProperty(node, "Text", valid)
  end

  runtime.applyNodeProperty(node, "Name", valid)
  tree.rebuild(project)
  selectNode(node)
  setStatus("Renamed: " .. oldName .. " → " .. valid)
  return true
end

local function promptRename(currentName)
  local dlg = VCL.Form()
  dlg._ = { Caption = "Rename control", Width = 330, Height = 140, Position = "poScreenCenter", BorderStyle = "bsDialog" }
  local lab = VCL.Label(dlg, "lblRename")
  lab._ = { Left = 12, Top = 12, Width = 280, Height = 20, Caption = "New Name:" }
  local edit = VCL.Edit(dlg, "edtRename")
  edit._ = { Left = 12, Top = 36, Width = 292, Height = 26, Text = tostring(currentName or "") }
  local ok = VCL.Button(dlg, "btnRenameOk")
  ok._ = { Left = 134, Top = 76, Width = 80, Height = 28, Caption = "OK" }
  local cancel = VCL.Button(dlg, "btnRenameCancel")
  cancel._ = { Left = 224, Top = 76, Width = 80, Height = 28, Caption = "Cancel" }
  local result = nil

  local function acceptRename()
    result = edit.Text
    pcall(function() dlg.ModalResult = "mrOk" end)
    pcall(function() dlg:Close() end)
  end

  local function cancelRename()
    result = nil
    pcall(function() dlg.ModalResult = "mrCancel" end)
    pcall(function() dlg:Close() end)
  end

  ok.OnClick = acceptRename
  cancel.OnClick = cancelRename

  pcall(function() ok.Default = true end)
  pcall(function() cancel.Cancel = true end)
  pcall(function() dlg.KeyPreview = true end)

  local function renameKeyHandler(sender, key, shift)
    local code = keyToCode(key)
    if code == 13 then acceptRename(); return 0 end
    if code == 27 then cancelRename(); return 0 end
    return key
  end

  edit.OnKeyDown = renameKeyHandler
  dlg.OnKeyDown = renameKeyHandler

  pcall(function() edit:SelectAll() end)
  pcall(function() edit:SetFocus() end)
  dlg:ShowModal()
  pcall(function() dlg:Free() end)
  return result
end

doRenameSelected = function()
  local node = selectedNode
  if not node then return end
  local newName = promptRename(node.name)
  if newName ~= nil then applyRename(node, newName) end
end

doReorderSelected = function(delta)
  local node = selectedNode
  if not node or node == model.getRoot(project) then return end
  local ok, err = model.moveNodeWithinParent(project, node, delta)
  if not ok then
    if err ~= "already at boundary" then setStatus(tostring(err or "Cannot reorder")) end
    return
  end
  syncTabOrders()
  tree.rebuild(project)
  selectNode(node)
  setStatus("Reordered: " .. tostring(node.name or node.class))
end

local function setNestedProp(t, parts, value)
  if not t or not parts or #parts == 0 then return end
  local p = t
  for i = 1, #parts - 1 do
    local k = parts[i]
    if type(p[k]) ~= "table" then p[k] = {} end
    p = p[k]
  end
  p[parts[#parts]] = value
end

local function deleteNestedProp(t, parts)
  if not t or not parts or #parts == 0 then return end
  local p = t
  for i = 1, #parts - 1 do
    p = p[parts[i]]
    if type(p) ~= "table" then return end
  end
  p[parts[#parts]] = nil
end

local function topProp(parts)
  return parts and parts[1]
end

local function setNestedProp(t, parts, propName, value)
  if not t or not propName then return end
  local p = t
  for _, k in ipairs(parts or {}) do
    if type(p[k]) ~= "table" then p[k] = {} end
    p = p[k]
  end
  p[propName] = value
end

local function onPropertyGridModified(node, parentPath, propName, value, rawPath)
  if not node or not propName then return end

  if propName == "Name" and (not parentPath or #parentPath == 0) then
    applyRename(node, value)
    return
  end

  local tv = type(value)
  if tv == "userdata" or tv == "function" or tv == "thread" then
    return
  end

  node.props = node.props or {}
  setNestedProp(node.props, parentPath or {}, propName, value)

  local top = ((parentPath and #parentPath > 0) and parentPath[1]) or propName
  if node == model.getRoot(project) and (propName == "Width" or propName == "Height" or propName == "Color") and (not parentPath or #parentPath == 0) then
    runtime.applyNodeProperty(node, propName, value)
  elseif (propName == "Left" or propName == "Top" or propName == "Width" or propName == "Height") and (not parentPath or #parentPath == 0) then
    runtime.applyNodeBounds(node)
  else
    runtime.refreshNode(node)
  end
end

local function setupMainMenu()
  if not VCL.MainMenu or not VCL.MenuItem or not VCL.ActionList or not VCL.Action then
    setStatus("Menu unavailable in this VCLua build")
    return false
  end

  local ok, err = pcall(function()
    local actions = VCL.ActionList(frm)
    loadActions(actions, {
      { name = "fileOpen", caption = "Open...", shortcut = "Ctrl+O", onexecute = function() doLoad() end },
      { name = "fileSave", caption = "Save...", shortcut = "Ctrl+S", onexecute = function() doSave(true) end },
      { name = "fileExportLua", caption = "Export Lua module...", onexecute = function() doExportLua() end },
      { name = "fileExportJson", caption = "Export JSON...", onexecute = function() doExportJson() end },
      { name = "fileExit", caption = "Exit", shortcut = "Ctrl+Q", onexecute = function() showExitConfirm() end },

      { name = "viewShowForm", caption = "Show / focus edited form", shortcut = "F5", onexecute = function() showEditedForm() end },
      { name = "viewProps", caption = "Show / hide properties", shortcut = "F4", onexecute = function() toggleProps() end },

      { name = "editRename", caption = "Rename", shortcut = "F2", onexecute = function() if doRenameSelected then doRenameSelected() end end },
      { name = "editCopy", caption = "Copy", shortcut = "Ctrl+C", onexecute = function() doCopy() end },
      { name = "editCut", caption = "Cut", shortcut = "Ctrl+X", onexecute = function() doCut() end },
      { name = "editPaste", caption = "Paste", shortcut = "Ctrl+V", onexecute = function() doPaste() end },
      { name = "editDuplicate", caption = "Duplicate", shortcut = "Ctrl+D", onexecute = function() doDuplicate() end },
      { name = "editDelete", caption = "Delete", shortcut = "Del", onexecute = function() doDelete() end },
      { name = "editCenter", caption = "Center in parent", shortcut = "Ctrl+E", onexecute = function() doCenterSelected() end },
      { name = "editFix", caption = "Fix layout", shortcut = "Ctrl+Shift+R", onexecute = function() doFixLayout() end },

      { name = "gridSize", caption = "Next grid size", shortcut = "Alt+G", onexecute = function() cycleGridSize() end },
      { name = "gridSnap", caption = "Snap to grid", shortcut = "Ctrl+G", onexecute = function() toggleSnap() end },
      { name = "gridShow", caption = "Grid always ON", shortcut = "Ctrl+Shift+G", onexecute = function() toggleGridVisible() end },
      { name = "gridOptions", caption = "Options...", onexecute = function() showOptions() end },

      { name = "helpShortcuts", caption = "Shortcuts", shortcut = "F1", onexecute = function() showHelp() end },
      { name = "helpAbout", caption = "About", onexecute = function() showAbout() end },
    })

    local mainMenu = VCL.MainMenu(frm, "mainMenu")
    loadMenu(mainMenu, {
      { caption = "&File", submenu = {
        { action = actions.fileOpen },
        { action = actions.fileSave },
        { caption = "-" },
        { action = actions.fileExportLua },
        { action = actions.fileExportJson },
        { caption = "-" },
        { action = actions.fileExit },
      }},
      { caption = "&Edit", submenu = {
        { action = actions.editRename },
        { caption = "-" },
        { action = actions.editCopy },
        { action = actions.editCut },
        { action = actions.editPaste },
        { action = actions.editDuplicate },
        { caption = "-" },
        { action = actions.editDelete },
        { caption = "-" },
        { action = actions.editCenter },
        { action = actions.editFix },
      }},
      { caption = "&View", submenu = {
        { action = actions.viewShowForm },
        { action = actions.viewProps },
      }},
      { caption = "&Grid", submenu = {
        { action = actions.gridSize },
        { action = actions.gridSnap },
        { action = actions.gridShow },
        { caption = "-" },
        { action = actions.gridOptions },
      }},
      { caption = "&Help", RightJustify = true, submenu = {
        { action = actions.helpShortcuts },
        { caption = "-" },
        { action = actions.helpAbout },
      }},
    })
    frm.Menu = mainMenu
  end)
  if not ok then
    setStatus("Menu setup failed: " .. tostring(err))
    return false
  end
  return true
end

inspector.init(grid, {
  getObject = function(node) return runtime.getObject(node) end,
  findNodeByObject = function(obj) return runtime.findNodeByObject(obj) end,
  onModified = onPropertyGridModified,
})

setupMainMenu()
updateGridStatus()
updatePropsVisibility()
rebuildAll()
pcall(function() frm.FormStyle = "fsNormal" end)
frm:Show()
app:Run()
