-- ***************************************
-- VCLua image resource loader
-- ***************************************

local M = {}

local function createImage(VCL)
  local ok, image = pcall(function() return VCL.Image() end)
  if ok then return image end
end

local function createStream(VCL)
  local ok, stream = pcall(function() return VCL.MemoryStream() end)
  if ok then return stream end
end

function M.loadPictureFromHex(VCL, picture, data, from)
  if not VCL or not picture or not data then return false end

  local stream = createStream(VCL)
  if not stream then return false end

  local ok, err = pcall(function()
    stream:Clear()
    stream:LoadFromHex(data, tonumber(from) or 1)
    picture:LoadFromStream(stream)
  end)

  pcall(function() stream:Free() end)
  return ok, err
end

function M.addHexToImageList(VCL, imageList, data, from)
  if not VCL or not imageList or not data then return nil end

  local image = createImage(VCL)
  if not image then return nil end

  local ok = M.loadPictureFromHex(VCL, image.Picture, data, from)
  local index

  if ok then
    pcall(function()
      index = imageList:Add(image.Picture.Bitmap, nil)
    end)
  end

  pcall(function() image:Free() end)
  return index
end

function M.createImageList(VCL, owner, resources, order, width, height)
  if not VCL or not VCL.ImageList then return nil, {} end

  local ok, imageList = pcall(function() return VCL.ImageList(owner) end)
  if not ok or not imageList then return nil, {} end

  pcall(function() imageList.Width = tonumber(width) or 16 end)
  pcall(function() imageList.Height = tonumber(height) or 16 end)

  local indexes = {}

  for _, name in ipairs(order or {}) do
    local resource = resources and resources[name]
    if resource and resource.data then
      local index = M.addHexToImageList(
        VCL,
        imageList,
        resource.data,
        resource.from or 1
      )
      if index ~= nil then indexes[name] = index end
    end
  end

  return imageList, indexes
end

return M
