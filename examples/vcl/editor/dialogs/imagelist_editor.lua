-- ***************************************
-- VCLua Form Editor - ImageList editor
-- ***************************************

local formLoader = require "form_loader"

local M = {}

local MR_CLOSE = 1

local function trim(s)
  s = tostring(s or "")
  return s:match("^%s*(.-)%s*$") or s
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

local function listBoxClear(lb)
  local items = nil
  pcall(function() items = lb.Items end)
  if items then clearStrings(items) end
end

local function listBoxAdd(lb, text)
  local items = nil
  pcall(function() items = lb.Items end)
  if items then addString(items, text) end
end

local function askImageFile(ctx, seed)
  local VCL = ctx.VCL
  if not VCL or not VCL.OpenDialog then return nil end

  local dlg = VCL.OpenDialog()
  seed = seed or (ctx.getCurrentFileName and ctx.getCurrentFileName()) or ctx.defaultFormFile or "test_form.vclform"
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

  -- Defers native OpenDialog cleanup on Linux/LCL event paths.
  return fileName
end

local function selectedNode(ctx)
  if ctx and type(ctx.getSelectedNode) == "function" then
    local ok, n = pcall(ctx.getSelectedNode)
    if ok then return n end
  end
  return nil
end

local function refreshInspector(ctx, node)
  if ctx.inspector and selectedNode(ctx) == node then
    ctx.inspector.showNode(node)
  end
end

local function status(ctx, text)
  if ctx.setStatus then ctx.setStatus(text) end
end

local function copyImageFilesFromNode(node)
  local files = {}
  if type(node.props) == "table" and type(node.props.Images) == "table" then
    for i, v in ipairs(node.props.Images) do
      files[i] = v
    end
  end
  return files
end

local function storeImageFilesToNode(node, files)
  if not node then return end
  node.props = node.props or {}
  node.props.Images = {}
  for i, v in ipairs(files or {}) do
    node.props.Images[i] = v
  end
end

local function refreshLiveImageList(ctx, node)
  if ctx.runtime then
    ctx.runtime.applyNodeProperty(node, "Images", node.props and node.props.Images or {})
  end
end

local function configureForm(loaded, node)
  local ui = loaded.ui
  local form = loaded.form
  if ui.ImageListEditorDialog then
    form = ui.ImageListEditorDialog
  end
  if form then
    form.Caption = "ImageList editor - " .. tostring(node.name or "ImageList")
  end
  return form, ui
end

function M.open(ctx, node)
  if not ctx or not node then return false end
  local registry = ctx.registry
  if not (registry and registry.isImageList and registry.isImageList(node.class)) then
    return false
  end

  local loaded = formLoader.load("forms/imagelist_editor.vclform")
  local form, ui = configureForm(loaded, node)
  if not form then error("ImageList editor form not found") end

  local files = copyImageFilesFromNode(node)
  local lb = ui.FilesList
  local btnAdd = ui.AddButton
  local btnRemove = ui.RemoveButton
  local btnUp = ui.MoveUpButton
  local btnDown = ui.MoveDownButton
  local btnClear = ui.ClearButton
  local btnClose = ui.CloseButton

  local function refreshList(selectIndex)
    listBoxClear(lb)
    if #files == 0 then
      listBoxAdd(lb, "(empty)")
      pcall(function() lb.ItemIndex = -1 end)
    else
      for i, v in ipairs(files) do
        listBoxAdd(lb, tostring(i - 1) .. "  " .. tostring(v))
      end
      local idx = tonumber(selectIndex) or 0
      if idx < 0 then idx = 0 end
      if idx >= #files then idx = #files - 1 end
      pcall(function() lb.ItemIndex = idx end)
    end
  end

  local function selectedIndex()
    local idx = -1
    pcall(function() idx = tonumber(lb.ItemIndex) or -1 end)
    return idx
  end

  local function save(reason)
    storeImageFilesToNode(node, files)
    refreshLiveImageList(ctx, node)
    refreshInspector(ctx, node)
    return reason
  end

  if btnAdd then
    btnAdd.OnClick = function()
      local seed = files[#files] or (ctx.getCurrentFileName and ctx.getCurrentFileName()) or ctx.defaultFormFile
      local fileName = askImageFile(ctx, seed)
      fileName = trim(fileName)
      if fileName ~= "" then
        table.insert(files, fileName)
        save("Add")
        status(ctx, "Image added to " .. tostring(node.name or "ImageList"))
        refreshList(#files - 1)
      else
        status(ctx, "Image add cancelled")
      end
    end
  end

  if btnRemove then
    btnRemove.OnClick = function()
      local idx = selectedIndex()
      if idx >= 0 and idx < #files then
        table.remove(files, idx + 1)
        save("Remove")
        status(ctx, "Image removed from " .. tostring(node.name or "ImageList"))
        refreshList(math.min(idx, #files - 1))
      else
        status(ctx, "Select an image to remove")
      end
    end
  end

  if btnUp then
    btnUp.OnClick = function()
      local idx = selectedIndex()
      if idx > 0 and idx < #files then
        local i = idx + 1
        files[i - 1], files[i] = files[i], files[i - 1]
        save("Move up")
        status(ctx, "Image moved up in " .. tostring(node.name or "ImageList"))
        refreshList(idx - 1)
      else
        status(ctx, "Select an image that can move up")
      end
    end
  end

  if btnDown then
    btnDown.OnClick = function()
      local idx = selectedIndex()
      if idx >= 0 and idx < (#files - 1) then
        local i = idx + 1
        files[i], files[i + 1] = files[i + 1], files[i]
        save("Move down")
        status(ctx, "Image moved down in " .. tostring(node.name or "ImageList"))
        refreshList(idx + 1)
      else
        status(ctx, "Select an image that can move down")
      end
    end
  end

  if btnClear then
    btnClear.OnClick = function()
      files = {}
      save("Clear")
      status(ctx, "ImageList cleared: " .. tostring(node.name or "ImageList"))
      refreshList(-1)
    end
  end

  if btnClose then
    pcall(function() btnClose.ModalResult = MR_CLOSE end)
    pcall(function() btnClose.Cancel = true end)
  end

  refreshList(0)

  local ok, err = pcall(function() form:ShowModal() end)
  if not ok then error(err) end

  -- Avoids explicit modal form destruction on Linux/LCL.
  return true
end

return M
