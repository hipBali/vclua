-- VCLua helper layer over generated vcl.core.

local VCL = require "vcl.core"

VCL.__imageListKeepAlive = VCL.__imageListKeepAlive or {}


function VCL.ScriptDir(level)
  local info = debug.getinfo((level or 1) + 1, "S")
  local source = info and info.source or ""
  source = tostring(source):gsub("^@", "")
  return source:match("^(.*[/\\])") or ""
end

function VCL.AddPackagePath(baseDir)
  baseDir = tostring(baseDir or "")
  local paths = {
    baseDir .. "?.lua",
    baseDir .. "vcl/?.lua",
  }
  for _, path in ipairs(paths) do
    if package.path:find(path, 1, true) == nil then
      package.path = package.path .. ";" .. path
    end
  end
end

function VCL.InitRuntime()
  local app = VCL.TheApplication()
  pcall(function() app:Initialize() end)
  return app
end

function VCL.TryRequire(moduleName)
  local ok, mod = pcall(require, moduleName)
  if ok then return mod end
  return nil, mod
end

function VCL.BindEvents(ui, moduleName)
  if not moduleName or tostring(moduleName) == "" then return false end
  local mod, err = VCL.TryRequire(moduleName)
  if not mod then return false, err end
  if type(mod.bind) ~= "function" then return false, "event module has no bind function" end
  mod.bind(ui)
  return true
end

function VCL.LoadFormApp(baseForm, options)
  options = options or {}
  local moduleName = tostring(baseForm or "")
  local formModule = assert(require(moduleName), "cannot load form module: " .. moduleName)
  local ui = formModule.create(options.owner)
  if options.bindEvents ~= false then
    local eventsModule = options.eventsModule or (moduleName .. "_events")
    VCL.BindEvents(ui, eventsModule)
  end
  return ui
end

function VCL.SetApplicationIcon(app, form, iconFile)
  if not iconFile or tostring(iconFile) == "" then return false end
  local ok = false
  if form then
    local formOk = pcall(function() form.Icon:LoadFromFile(iconFile) end)
    ok = ok or formOk
  end
  if app then
    local appOk = pcall(function() app.Icon:LoadFromFile(iconFile) end)
    ok = ok or appOk
  end
  return ok
end

local function imageListKey(imageList)
  return tostring(imageList)
end

local function imageListCount(imageList)
  local n = 0
  pcall(function() n = tonumber(imageList.Count) or 0 end)
  return n or 0
end

local function makeHiddenImage()
  local img = VCL.Image()
  pcall(function() img.Visible = false end)
  pcall(function() img.Left = -10000 end)
  pcall(function() img.Top = -10000 end)
  return img
end

local function pictureOf(img)
  local pic = nil
  pcall(function() pic = img.Picture end)
  if not pic then pcall(function() pic = img.picture end) end
  return pic
end

local function bitmapOfPicture(pic)
  local bmp = nil
  pcall(function() bmp = pic.Bitmap end)
  if not bmp then pcall(function() bmp = pic.bitmap end) end
  return bmp
end

local function loadPictureFromFile(pic, fileName)
  local ok, err = pcall(function() return pic:LoadFromFile(fileName) end)
  if ok then return true end
  ok, err = pcall(function() return pic.LoadFromFile(pic, fileName) end)
  if ok then return true end
  return false, err
end

local function keepImageForImageList(imageList, img)
  local key = imageListKey(imageList)
  local keep = VCL.__imageListKeepAlive[key]
  if not keep then
    keep = { imageList = imageList, images = {} }
    VCL.__imageListKeepAlive[key] = keep
  end
  keep.images[#keep.images + 1] = img
end

function VCL.ImageListClearKeepAlive(imageList)
  if not imageList then return end
  VCL.__imageListKeepAlive[imageListKey(imageList)] = nil
end

local function addBitmapToImageList(imageList, bmp)
  local before = imageListCount(imageList)

  local ok, ret = pcall(function() return imageList:Add(bmp, nil) end)
  if not ok then ok, ret = pcall(function() return imageList.Add(imageList, bmp, nil) end) end

  if (not ok) or imageListCount(imageList) <= before then
    ok, ret = pcall(function() return imageList:Add(bmp, bmp) end)
    if not ok then ok, ret = pcall(function() return imageList.Add(imageList, bmp, bmp) end) end
  end

  if (not ok) or imageListCount(imageList) <= before then
    ok, ret = pcall(function() return imageList:AddMasked(bmp, "clNone") end)
    if not ok then ok, ret = pcall(function() return imageList.AddMasked(imageList, bmp, "clNone") end) end
  end

  local after = imageListCount(imageList)
  if ok and after > before then
    return tonumber(ret) or before
  end
  return -1, ret
end

-- Loads one file into an ImageList.
function VCL.ImageListAddFromFile(imageList, fileName, owner)
  if not imageList or not fileName or tostring(fileName) == "" then
    return -1
  end

  local img = makeHiddenImage()
  local pic = pictureOf(img)
  if not pic then
    pcall(function() img:Free() end)
    return -1, "helper Image has no Picture"
  end

  local okLoad, loadErr = loadPictureFromFile(pic, tostring(fileName))
  if not okLoad then
    pcall(function() img:Free() end)
    return -1, loadErr
  end

  local bmp = bitmapOfPicture(pic)
  if not bmp then
    pcall(function() img:Free() end)
    return -1, "Picture.Bitmap is nil"
  end

  local index, err = addBitmapToImageList(imageList, bmp)
  if tonumber(index) == nil or tonumber(index) < 0 then
    pcall(function() img:Free() end)
    return -1, err
  end

  keepImageForImageList(imageList, img)
  return tonumber(index)
end

function VCL.ImageListLoadFiles(imageList, files, owner)
  if not imageList then return 0 end

  pcall(function() imageList:Clear() end)
  pcall(function() imageList.Clear(imageList) end)

  VCL.__imageListKeepAlive[imageListKey(imageList)] = {
    imageList = imageList,
    images = {},
  }

  local added = 0
  if type(files) ~= "table" then return added end

  for _, fileName in ipairs(files) do
    local ok, idxOrErr = pcall(function()
      return VCL.ImageListAddFromFile(imageList, fileName, owner)
    end)
    if ok and tonumber(idxOrErr) and tonumber(idxOrErr) >= 0 then
      added = added + 1
    else
      io.stderr:write("[VCL] ImageListAddFromFile failed: ", tostring(fileName), " ", tostring(idxOrErr), "\n")
    end
  end

  return added
end

local function callGlyphMethod(glyph, methodName, arg)
  if not glyph then return false end
  local m = glyph[methodName]
  if type(m) ~= "function" then return false end

  local ok
  if arg ~= nil then
    ok = pcall(function() return m(glyph, arg) end)
    if not ok then ok = pcall(function() return m(arg) end) end
  else
    ok = pcall(function() return m(glyph) end)
    if not ok then ok = pcall(function() return m() end) end
  end
  return ok and true or false
end

-- Loads a picture file into a TImage-like control.
function VCL.LoadImageFromFile(control, fileName)
  if not control or not fileName or tostring(fileName) == "" then return false end

  local pic = pictureOf(control)
  if not pic then return false, "control has no Picture" end

  -- Clear the previous image before replacing it on a visible control.
  pcall(function() pic:Clear() end)
  pcall(function() pic.Clear(pic) end)

  local okLoad, loadErr = loadPictureFromFile(pic, tostring(fileName))
  if not okLoad then return false, loadErr end

  pcall(function() control:Invalidate() end)
  pcall(function() control:Repaint() end)
  return true
end

function VCL.ClearImage(control)
  if not control then return false end
  local pic = pictureOf(control)
  if not pic then return false end
  local ok = pcall(function() return pic:Clear() end)
  if not ok then ok = pcall(function() return pic.Clear(pic) end) end
  pcall(function() control:Invalidate() end)
  pcall(function() control:Repaint() end)
  return ok and true or false
end

-- Loads a glyph image into a button control.
function VCL.LoadGlyphFromFile(control, fileName)
  if not control or not fileName or tostring(fileName) == "" then return false end

  local glyph = nil
  pcall(function() glyph = control.Glyph end)
  if not glyph then pcall(function() glyph = control.glyph end) end
  if not glyph then return false end

  local img = makeHiddenImage()
  local pic = pictureOf(img)
  if not pic then
    pcall(function() img:Free() end)
    return false
  end

  local okLoad = loadPictureFromFile(pic, tostring(fileName))
  if not okLoad then
    pcall(function() img:Free() end)
    return false
  end

  local bmp = bitmapOfPicture(pic)
  if not bmp then
    pcall(function() img:Free() end)
    return false
  end

  local okAssign = callGlyphMethod(glyph, "Assign", bmp)
  pcall(function() control:Invalidate() end)
  pcall(function() control:Repaint() end)
  pcall(function() control.Parent:Invalidate() end)
  pcall(function() control.Parent:Repaint() end)
  pcall(function() img:Free() end)
  return okAssign
end

function VCL.ClearGlyph(control)
  if not control then return false end
  local glyph = nil
  pcall(function() glyph = control.Glyph end)
  if not glyph then pcall(function() glyph = control.glyph end) end
  if not glyph then return false end
  return callGlyphMethod(glyph, "Clear")
end


local function bitmapOfMenuItem(menuItem)
  local bmp = nil
  pcall(function() bmp = menuItem.Bitmap end)
  if not bmp then pcall(function() bmp = menuItem.bitmap end) end
  return bmp
end

-- Loads a fallback bitmap for menu items whose ImageIndex is not repainted.
function VCL.LoadMenuItemBitmapFromFile(menuItem, fileName)
  if not menuItem or not fileName or tostring(fileName) == "" then return false end

  local target = bitmapOfMenuItem(menuItem)
  if not target then return false end

  local img = makeHiddenImage()
  local pic = pictureOf(img)
  if not pic then
    pcall(function() img:Free() end)
    return false
  end

  local okLoad = loadPictureFromFile(pic, tostring(fileName))
  if not okLoad then
    pcall(function() img:Free() end)
    return false
  end

  local bmp = bitmapOfPicture(pic)
  if not bmp then
    pcall(function() img:Free() end)
    return false
  end

  local okAssign = callGlyphMethod(target, "Assign", bmp)
  pcall(function() img:Free() end)
  return okAssign
end

function VCL.ClearMenuItemBitmap(menuItem)
  if not menuItem then return false end
  local bmp = bitmapOfMenuItem(menuItem)
  if not bmp then return false end
  return callGlyphMethod(bmp, "Clear")
end

return VCL
