-- VCLua form editor

local function editorBaseDirectory()
  local src = debug and debug.getinfo and debug.getinfo(1, "S")
  src = src and src.source or ""
  if src:sub(1, 1) == "@" then
    local fileName = src:sub(2)
    return fileName:match("^(.*[/\\])") or ""
  end
  local arg0 = arg and arg[0] or ""
  return tostring(arg0):match("^(.*[/\\])") or ""
end

local function setEditorIcon(form)
  local resourceLoader = require "resource_loader"
  local iconFile = resourceLoader.resolveEditorFile("vclua_editor.ico")

  local function loadIcon(target)
    if not target then return false end
    return pcall(function()
      target.Icon:LoadFromFile(iconFile)
    end)
  end

  loadIcon(form)
  loadIcon(app)
end

package.path = package.path .. ";?.lua;?/init.lua;./?.lua;./?/init.lua;vcl/?.lua;vcl/?/init.lua;"

VCL = require "vcl"
local app = VCL.TheApplication()
app:Initialize()

local model = require "model"
local runtime = require "runtime"
local tree = require "tree"
local inspector = require "inspector"
local serializer = require "serializer"
local optionsDialog = require "options"
local registry = require "registry"
local palette = require "palette"
local help = require "help"
local specialEditors = require "special_editors"
local exportUnit = require "export"
local mainFormLoader = require "mainform_loader"

local DEFAULT_FORM_FILE = "test_form.vclform"
local currentFileName = nil

local project = model.newProject()
model.ensureDesigner(project)
local selectedNode = nil
local selectingNode = false
local clipboard = nil
local addComponentAt
local clampNodeIntoParent
local doRenameSelected
local applyRename
local doReorderSelected
local handleShortcut

local componentImages = require "compimages"
local compImages = nil
local iconMap = {}

local frm
local mainUi
local editorTabs
local componentsTab
local propertiesTab

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
  editorOptions.showGrid = g.visible ~= false
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
  g.visible = editorOptions.showGrid and true or false
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
  if dlg:Execute() then fileName = tostring(dlg.fileName or "") end
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

mainUi = mainFormLoader.load()
frm = mainUi.EditorMainForm
local left = mainUi.BodyPanel
local treePanel = mainUi.TreePanel
local tv = mainUi.ObjectTree
pcall(function() tv.ReadOnly = true end)
local paletteSearch = mainUi.PaletteSearch
local paletteTree = mainUi.PaletteTree
local grid = mainUi.PropertyGrid
local lblStatus = mainUi.StatusLabel
editorTabs = mainUi.EditorTabs
componentsTab = mainUi.ComponentsTab
propertiesTab = mainUi.PropertiesTab

local deferredDialogTimer = nil
local deferredDialogAction = nil
local deferredDialogBusy = false

local function armDeferredDialogTimer()
  if not VCL.Timer then return false end
  if not deferredDialogTimer then
    deferredDialogTimer = VCL.Timer(frm, "deferredDialogTimer")
    pcall(function() deferredDialogTimer.Interval = 1 end)
    deferredDialogTimer.OnTimer = function()
      if deferredDialogTimer then
        pcall(function() deferredDialogTimer.Enabled = false end)
      end

      if deferredDialogBusy then
        return
      end

      local action = deferredDialogAction
      deferredDialogAction = nil
      if not action then
        return
      end

      deferredDialogBusy = true
      local ok, err = pcall(action)
      deferredDialogBusy = false

      if not ok then error(err) end

      if deferredDialogAction then
        pcall(function() deferredDialogTimer.Enabled = false end)
        pcall(function() deferredDialogTimer.Interval = 1 end)
        pcall(function() deferredDialogTimer.Enabled = true end)
      end
    end
  end

  pcall(function() deferredDialogTimer.Enabled = false end)
  pcall(function() deferredDialogTimer.Interval = 1 end)
  pcall(function() deferredDialogTimer.Enabled = true end)
  return true
end

local function runDeferredDialogAction()
  if deferredDialogBusy then
    return
  end
  local action = deferredDialogAction
  deferredDialogAction = nil
  if not action then
    return
  end
  deferredDialogBusy = true
  local ok, err = pcall(action)
  deferredDialogBusy = false
  if not ok then error(err) end
end

local function deferDialogAction(action)
  if type(action) ~= "function" then return end
  deferredDialogAction = action

  if deferredDialogBusy then
    return
  end

  if VCL.Timer then
    armDeferredDialogTimer()
  else
    runDeferredDialogAction()
  end
end

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
    if closingConfirmed then
      return "caFree"
    end
    showExitConfirm()
    return "caNone"
  end
end)

local function setupComponentImages(owner)
  return componentImages.create(VCL, owner)
end

local function iconIndexFor(name)
  local def = registry.get(name)
  local iconName = (def and def.icon) or name
  return iconMap[iconName] or iconMap[name] or iconMap.Form
end

compImages, iconMap = setupComponentImages(frm)

if compImages then
  pcall(function() tv.StateImages = compImages end)
  pcall(function() paletteTree.StateImages = compImages end)
end

pcall(function() paletteSearch.TextHint = "Search component..." end)
pcall(function() paletteSearch.Hint = "Type to filter the component palette" end)
pcall(function() lblStatus.ShowHint = true end)

local function setStatus(text)
  text = tostring(text or "Ready")
  pcall(function() lblStatus.Caption = text end)
  pcall(function() lblStatus.Hint = text end)
end

specialEditors.init({
  VCL = VCL,
  model = model,
  runtime = runtime,
  inspector = inspector,
  registry = registry,
  project = project,
  defaultFormFile = DEFAULT_FORM_FILE,
  setStatus = setStatus,
  deferDialogAction = deferDialogAction,
  getCurrentFileName = function() return currentFileName end,
  getSelectedNode = function() return selectedNode end,
  getProject = function() return project end,
})

local function showPropertiesTab()
  if editorTabs and propertiesTab then
    pcall(function() editorTabs.ActivePage = propertiesTab end)
  end
end

local function updateGridStatus()
  syncProjectFromOptions()
  runtime.setOptions(editorOptions)

  if mainUi then
    if mainUi.gridShow then
      pcall(function() mainUi.gridShow.Checked = editorOptions.showGrid and true or false end)
    end
    if mainUi.gridSnap then
      pcall(function() mainUi.gridSnap.Checked = editorOptions.snapToGrid and true or false end)
    end
  end
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

local function selectTreeNodeIfPossible(node)
  if not node then return end

  if tree.selectNode then
    local ok = pcall(function() tree.selectNode(node) end)
    if ok then return end
    ok = pcall(function() tree.selectNode(tv, node) end)
    if ok then return end
  end
  if tree.select then
    local ok = pcall(function() tree.select(node) end)
    if ok then return end
    ok = pcall(function() tree.select(tv, node) end)
    if ok then return end
  end

  local items = nil
  pcall(function() items = tv.Items end)
  if not items then return end

  local count = nil
  pcall(function() count = tonumber(items.Count) end)
  if not count then
    pcall(function() count = tonumber(items:Count()) end)
  end
  if not count then return end

  for i = 0, count - 1 do
    local item = nil
    pcall(function() item = items.Item[i] end)
    if not item then pcall(function() item = items[i] end) end
    if not item then pcall(function() item = items:GetItem(i) end) end
    if item then
      local data = nil
      pcall(function() data = item.Data end)
      if data == node then
        pcall(function() tv.Selected = item end)
        pcall(function() item.Selected = true end)
        return
      end
    end
  end
end

local function selectNode(node, opts)
  opts = opts or {}
  selectedNode = node
  inspector.showNode(node)
  runtime.selectNode(node)

  if not opts.fromTree then
    selectingNode = true
    selectTreeNodeIfPossible(node)
    selectingNode = false
  end
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
    onDblClick = function(node)
      return false
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
      local target = targetNode or model.getRoot(project)
      setStatus(tostring(target.name or target.class or 'Form1')..' drop: '..tostring(className or '?')..' @ '..tostring(x)..','..tostring(y))
      if className then addComponentAt(className, target, x, y) end
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

local function isBoundaryAlign(align)
  return align == "alTop" or align == "alBottom" or align == "alLeft" or align == "alRight"
end

local function isSplitterClass(className)
  return tostring(className or "") == "Splitter"
end

local function readLiveNumber(obj, propName, fallback)
  if obj then
    local ok, value = pcall(function() return obj[propName] end)
    if ok and value ~= nil then return tonumber(value) or fallback end
  end
  return fallback
end

local function nodeNumber(node, propName, fallback)
  local props = node and node.props or nil
  return tonumber(props and props[propName]) or fallback or 0
end

local function nodeAlign(node, fallback)
  local props = node and node.props or nil
  local align = props and props.Align
  local obj = node and runtime.getObject and runtime.getObject(node) or nil
  if not align and obj then
    local ok, value = pcall(function() return obj.Align end)
    if ok and value ~= nil then align = value end
  end
  align = tostring(align or fallback or "alTop")
  if align == "alLeft" or align == "alRight" or align == "alTop" or align == "alBottom" then
    return align
  end
  return "alTop"
end

local function nodeRuntimeRect(node)
  local obj = node and runtime.getObject and runtime.getObject(node) or nil
  local left = readLiveNumber(obj, "Left", nodeNumber(node, "Left", 0))
  local top = readLiveNumber(obj, "Top", nodeNumber(node, "Top", 0))
  local width = readLiveNumber(obj, "Width", nodeNumber(node, "Width", 0))
  local height = readLiveNumber(obj, "Height", nodeNumber(node, "Height", 0))
  return left, top, width, height
end

local function isPageControlNode(node)
  return node and registry.isPageControl and registry.isPageControl(node.class)
end

local function isTabSheetNode(node)
  return node and registry.isTabSheet and registry.isTabSheet(node.class)
end

local function isToolBarNode(node)
  return node and registry.isToolBar and registry.isToolBar(node.class)
end

local function isToolButtonNode(node)
  return node and registry.isToolButton and registry.isToolButton(node.class)
end

local function isImageListNode(node)
  return node and registry.isImageList and registry.isImageList(node.class)
end

local function parentToolBarOfToolButton(toolButtonNode)
  if not isToolButtonNode(toolButtonNode) then return nil end
  local parent = model.findParent(project, toolButtonNode)
  if isToolBarNode(parent) then return parent end
  return nil
end

local function firstNodeAfterToolButtons(toolBarNode)
  if not isToolBarNode(toolBarNode) then return nil end
  local lastToolButton = nil
  for _, child in ipairs(toolBarNode.items or {}) do
    if isToolButtonNode(child) then lastToolButton = child end
  end
  return lastToolButton
end

local function firstTabSheetOf(pageControlNode)
  if not isPageControlNode(pageControlNode) then return nil end
  for _, child in ipairs(pageControlNode.items or {}) do
    if isTabSheetNode(child) then return child end
  end
  return nil
end

local function parentPageControlOfTabSheet(tabSheetNode)
  if not isTabSheetNode(tabSheetNode) then return nil end
  local parent = model.findParent(project, tabSheetNode)
  if isPageControlNode(parent) then return parent end
  return nil
end

local function ensurePageControlHasSheet(pageControlNode)
  if not isPageControlNode(pageControlNode) then return nil end
  local sheet = firstTabSheetOf(pageControlNode)
  if sheet then return sheet, false end

  sheet = model.addChild(pageControlNode, "TabSheet")
  model.applyThemeToNewNode(project, pageControlNode, sheet)
  return sheet, true
end

local function normalizeParentForNewClass(className, parent)
  local root = model.getRoot(project)
  parent = parent or currentParentNode() or root

  if className == "ImageList" then
    return root
  end

  if className == "TabSheet" then
    if isPageControlNode(parent) then return parent end
    if isTabSheetNode(parent) then
      local pageControl = parentPageControlOfTabSheet(parent)
      if pageControl then return pageControl end
    end
    return nil, "TabSheet can only be added to a PageControl"
  end

  if className == "ToolButton" then
    if isToolBarNode(parent) then return parent end
    if isToolButtonNode(parent) then
      local toolBar = parentToolBarOfToolButton(parent)
      if toolBar then return toolBar end
    end
    return nil, "ToolButton can only be added to a ToolBar"
  end

  if isToolBarNode(parent) then
    return nil, "Only ToolButton can be added to a ToolBar"
  end

  if isToolButtonNode(parent) then
    return nil, "ToolButton is not a container; select its ToolBar instead"
  end

  if isPageControlNode(parent) then
    local sheet, created = ensurePageControlHasSheet(parent)
    if not sheet then return nil, "PageControl has no TabSheet" end
    return sheet, nil, created and sheet or nil
  end

  return parent
end

local function addDefaultTabSheetToPageControl(pageControlNode)
  if not isPageControlNode(pageControlNode) then return nil end
  local sheet = firstTabSheetOf(pageControlNode)
  if sheet then return sheet end
  sheet = model.addChild(pageControlNode, "TabSheet")
  model.applyThemeToNewNode(project, pageControlNode, sheet)
  return sheet
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
  local createdParentNode = nil

  if splitter and selectedNode and selectedNode ~= root then
    insertAfter = selectedNode
    parent = model.findParent(project, selectedNode) or root
    left, top = nil, nil
  elseif className == "ToolButton" and isToolButtonNode(selectedNode) then
    insertAfter = selectedNode
    parent = model.findParent(project, selectedNode) or parent
    left, top = nil, nil
  else
    local err
    parent, err, createdParentNode = normalizeParentForNewClass(className, parent)
    if not parent then
      VCL.ShowMessage(tostring(err or "Invalid parent"))
      return nil
    end
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
    if className == "ToolButton" then
      insertAfter = insertAfter or firstNodeAfterToolButtons(parent)
      if insertAfter and insertAfter ~= node then
        local moved, err = model.moveNodeAfter(project, node, insertAfter)
        if not moved and err ~= "same node" then
          setStatus("ToolButton reorder failed: " .. tostring(err))
        end
      end
    end
    model.applyThemeToNewNode(project, parent, node)
    node.props = node.props or {}
    if left ~= nil then node.props.Left = math.max(0, math.floor(tonumber(left) or 0)) end
    if top ~= nil then node.props.Top = math.max(0, math.floor(tonumber(top) or 0)) end
    if clampNodeIntoParent then clampNodeIntoParent(node) end
  end

  local selectAfterAdd = node
  if className == "PageControl" then
    selectAfterAdd = addDefaultTabSheetToPageControl(node) or node
  end

  if inspector and inspector.commitPendingEdit then inspector.commitPendingEdit() end

  if splitter and insertAfter then
    rebuildAll(node)
  else
    if createdParentNode then
      local pageControl = model.findParent(project, createdParentNode)
      runtime.addLiveNode(pageControl, createdParentNode)
    else
      runtime.addLiveNode(parent, node)
    end
    syncTabOrders()
    tree.rebuild(project)
    selectNode(selectAfterAdd or node)
    pcall(function() app:ProcessMessages() end)
    pcall(function() runtime.refreshNode(selectAfterAdd or node) end)
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


local newConfirmOpen = false
local newConfirmForm = nil

local function resetToNewProject()
  if inspector and inspector.commitPendingEdit then inspector.commitPendingEdit() end

  local oldRoot = model.getRoot(project)
  selectNode(nil)
  pcall(function()
    local oldObj = runtime.getObject(oldRoot)
    if oldObj then oldObj:Hide() end
  end)

  clipboard = nil
  project = model.newProject()
  model.ensureDesigner(project)
  currentFileName = nil
  model.resetCounters(project)
  syncOptionsFromProject()
  updateGridStatus()
  rebuildAll(model.getRoot(project))
  updateMainCaption()
  setStatus("New empty form")
end

local function showNewConfirm()
  if newConfirmOpen and newConfirmForm then
    pcall(function() newConfirmForm:Show() end)
    pcall(function() newConfirmForm:BringToFront() end)
    return
  end

  newConfirmOpen = true
  local dlg = VCL.Form()
  newConfirmForm = dlg
  dlg._ = {
    Caption = "New form?",
    Width = 380,
    Height = 150,
    Position = "poScreenCenter",
    BorderStyle = "bsDialog",
  }

  local lab = VCL.Label(dlg, "lblNewConfirm")
  lab._ = {
    Left = 12,
    Top = 14,
    Width = 350,
    Height = 48,
    Caption = "Create a new empty form?\nUnsaved changes in the current form will be lost.",
  }

  local yes = VCL.Button(dlg, "btnNewYes")
  yes._ = { Left = 164, Top = 82, Width = 92, Height = 28, Caption = "New" }

  local no = VCL.Button(dlg, "btnNewNo")
  no._ = { Left = 266, Top = 82, Width = 92, Height = 28, Caption = "Cancel" }

  local function closeDialogOnly()
    newConfirmOpen = false
    newConfirmForm = nil
    pcall(function() dlg:Hide() end)
  end

  yes.OnClick = function()
    closeDialogOnly()
    resetToNewProject()
  end

  no.OnClick = function()
    closeDialogOnly()
  end

  pcall(function()
    dlg.OnClose = function(sender, action)
      newConfirmOpen = false
      newConfirmForm = nil
      pcall(function() sender:Hide() end)
      return "caHide"
    end
  end)

  dlg:Show()
  pcall(function() dlg:BringToFront() end)
end


local function prepareProjectForOutput()
  if inspector and inspector.commitPendingEdit then inspector.commitPendingEdit() end
  runtime.syncStringCollections(model.getRoot(project))
  syncTabOrders()
end

local function doExport()
  exportUnit.run({
    project = project,
    currentFileName = currentFileName,
    defaultFormFile = DEFAULT_FORM_FILE,
    prepare = prepareProjectForOutput,
    setStatus = setStatus,
    showMessage = function(message)
      VCL.ShowMessage(tostring(message or ""))
    end,
  })
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
  editorOptions.showGrid = not editorOptions.showGrid
  updateGridStatus()
  setStatus(editorOptions.showGrid and "Grid ON" or "Grid OFF")
end

local function cycleGridSize()
  gridSizeIndex = findGridSizeIndex(editorOptions.gridSize)
  gridSizeIndex = gridSizeIndex + 1
  if gridSizeIndex > #gridSizes or gridSizeIndex < 1 then gridSizeIndex = 1 end
  editorOptions.gridSize = gridSizes[gridSizeIndex]
  updateGridStatus()
  setStatus("Grid size: " .. tostring(editorOptions.gridSize))
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
  if code == 115 then showPropertiesTab(); return true end
  if code == 116 then showEditedForm(); return true end

  if ctrl and code == string.byte("C") then doCopy(); return true end
  if ctrl and code == string.byte("X") then doCut(); return true end
  if ctrl and code == string.byte("V") then doPaste(); return true end
  if ctrl and code == string.byte("D") then doDuplicate(); return true end
  if ctrl and code == string.byte("E") then doCenterSelected(); return true end
  if ctrl and sh and code == string.byte("R") then doFixLayout(); return true end
  if ctrl and code == string.byte("N") then showNewConfirm(); return true end
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
  if handleShortcut(key, shift) then
    return 0
  end
  return key
end

local function canTreeDrop(srcNode, dstNode)
  local root = model.getRoot(project)
  if not srcNode or not dstNode then return false, "missing source or target" end
  if srcNode == root then return false, "the root form cannot be moved" end
  if srcNode == dstNode then return false, "cannot move a control into itself" end
  if model.isAncestor(srcNode, dstNode) then return false, "cannot move a control into its child" end

  if isImageListNode(srcNode) then
    if dstNode == root then return true, "reparent" end
    return false, "ImageList is a form-level non-visual component"
  end
  if isImageListNode(dstNode) then
    return false, "ImageList cannot contain controls"
  end

  local srcParent = model.findParent(project, srcNode)
  local dstParent = model.findParent(project, dstNode)

  if isTabSheetNode(srcNode) then
    if isTabSheetNode(dstNode) and srcParent and srcParent == dstParent then
      return true, "reorder"
    end
    if isPageControlNode(dstNode) then
      return true, "reparent"
    end
    return false, "TabSheet can only be moved under a PageControl"
  end

  if isToolButtonNode(srcNode) then
    if isToolButtonNode(dstNode) and srcParent and srcParent == dstParent then
      return true, "reorder"
    end
    if isToolBarNode(dstNode) then
      return true, "reparent"
    end
    return false, "ToolButton can only be moved under a ToolBar"
  end

  if isToolBarNode(dstNode) then
    return false, "Only ToolButton can be moved under a ToolBar"
  end

  if isToolButtonNode(dstNode) then
    if srcParent and srcParent == dstParent then
      return true, "reorder"
    end
    return false, "Drop ToolButtons onto ToolButtons only inside the same ToolBar"
  end

  if dstNode == root or registry.isContainer(dstNode.class) then
    return true, "reparent"
  end

  if srcParent and srcParent == dstParent then
    return true, "reorder"
  end

  return false, "target is not a container"
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

  local actualParent = dstNode
  local createdParentNode = nil
  if not isTabSheetNode(srcNode) and isPageControlNode(dstNode) then
    actualParent, createdParentNode = ensurePageControlHasSheet(dstNode)
    if not actualParent then
      VCL.ShowMessage("PageControl has no TabSheet")
      return false
    end
    if createdParentNode then
      runtime.addLiveNode(dstNode, createdParentNode)
    end
  end

  local left = srcNode.props and srcNode.props.Left or 0
  local top = srcNode.props and srcNode.props.Top or 0
  local moved, moveErr = model.moveNodeToParent(project, srcNode, actualParent, left, top)
  if not moved then
    VCL.ShowMessage(tostring(moveErr))
    return false
  end

  clampNodeIntoParent(srcNode)
  runtime.moveLiveNodeToParent(srcNode, actualParent)
  runtime.applyNodeProperty(srcNode, "Left", srcNode.props and srcNode.props.Left or 0)
  runtime.applyNodeProperty(srcNode, "Top", srcNode.props and srcNode.props.Top or 0)
  runtime.applyNodeProperty(srcNode, "Width", srcNode.props and srcNode.props.Width or 0)
  runtime.applyNodeProperty(srcNode, "Height", srcNode.props and srcNode.props.Height or 0)
  syncTabOrders()
  tree.rebuild(project)
  selectNode(srcNode)
  setStatus("Moved under: " .. tostring(actualParent.name or actualParent.class))
  return true
end

tree.init(tv, function(node)
  if selectingNode then return end
  selectNode(node, { fromTree = true })
end, handleTreeDrop, {
  iconIndexFor = iconIndexFor,
  onDblClick = function(node)
    specialEditors.handleTreeDblClick(node)
  end
})

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

function applyRename(node, newName, opts)
  if not node then return false end
  opts = opts or {}
  local valid, err = validateName(node, newName)
  if not valid then
    if not opts.quiet then VCL.ShowMessage(tostring(err)) end
    runtime.applyNodeProperty(node, "Name", node.name)
    inspector.refresh()
    return false, err
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
  inspector.refresh()

  if not opts.noTreeRebuild then
    tree.rebuild(project)
    selectNode(node)
  end

  setStatus("Renamed: " .. oldName .. " → " .. valid)
  return true
end

local function promptRename(currentName)
  local dlg = VCL.Form()
  dlg._ = {
    Caption = "Rename control",
    Width = 330,
    Height = 140,
    Position = "poScreenCenter",
    BorderStyle = "bsDialog"
  }

  local lab = VCL.Label(dlg, "lblRename")
  lab._ = { Left = 12, Top = 12, Width = 280, Height = 20, Caption = "New Name:" }

  local edit = VCL.Edit(dlg, "edtRename")
  edit._ = { Left = 12, Top = 36, Width = 292, Height = 26, Text = tostring(currentName or "") }

  local ok = VCL.Button(dlg, "btnRenameOk")
  ok._ = { Left = 134, Top = 76, Width = 80, Height = 28, Caption = "OK" }

  local cancel = VCL.Button(dlg, "btnRenameCancel")
  cancel._ = { Left = 224, Top = 76, Width = 80, Height = 28, Caption = "Cancel" }

  pcall(function() ok.ModalResult = 1 end)
  pcall(function() cancel.ModalResult = 2 end)
  pcall(function() ok.Default = true end)
  pcall(function() cancel.Cancel = true end)

  local modalOk, modalErr = pcall(function() dlg:ShowModal() end)
  if not modalOk then
    pcall(function() dlg:Free() end)
    error(modalErr)
  end

  local mr = nil
  pcall(function() mr = dlg.ModalResult end)

  local result = nil
  if tonumber(mr) == 1 then
    result = edit.Text
  end

  pcall(function() dlg:Free() end)
  return result
end

doRenameSelected = function()
  local node = selectedNode
  if not node then return end
  local newName = promptRename(node.name)
  if newName ~= nil then
    applyRename(node, newName)
  end
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

local function bindMainActions()
  local handlers = {
    fileNew = function() showNewConfirm() end,
    fileOpen = function() doLoad() end,
    fileSave = function() doSave(true) end,
    fileExport = function() doExport() end,
    fileExit = function() showExitConfirm() end,

    editRename = function() if doRenameSelected then doRenameSelected() end end,
    editCopy = function() doCopy() end,
    editCut = function() doCut() end,
    editPaste = function() doPaste() end,
    editDuplicate = function() doDuplicate() end,
    editDelete = function() doDelete() end,
    editCenter = function() doCenterSelected() end,
    editFix = function() doFixLayout() end,

    viewShowForm = function() showEditedForm() end,
    viewProps = function() showPropertiesTab() end,

    gridSize = function() cycleGridSize() end,
    gridSnap = function() toggleSnap() end,
    gridShow = function() toggleGridVisible() end,
    gridOptions = function() showOptions() end,

    helpShortcuts = function() showHelp() end,
    helpAbout = function() showAbout() end,
  }

  for name, handler in pairs(handlers) do
    local action = mainUi[name]
    if action then
      action.OnExecute = handler
    else
      setStatus("Missing main form action: " .. tostring(name))
    end
  end

  if mainUi.MainMenu then
    frm.Menu = mainUi.MainMenu
  end
end

inspector.init(grid, {
  getObject = function(node) return runtime.getObject(node) end,
  findNodeByObject = function(obj) return runtime.findNodeByObject(obj) end,
  onModified = onPropertyGridModified,
})

bindMainActions()
updateGridStatus()
showPropertiesTab()
rebuildAll()
pcall(function() frm.FormStyle = "fsNormal" end)
setEditorIcon(frm)
frm:Show()
app:Run()
