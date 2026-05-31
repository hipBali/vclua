-- ***************************************
-- VCLua Form tool
-- Copyright (C) 2013-2026 Hi-Project Ltd.
-- ***************************************
-- Builds the live VCL object tree from the model.

local util = require "vcl.editor.util"
local registry = require "vcl.editor.registry"
local model = require "vcl.editor.model"

local M = {}

local drag = nil

M.options = {
  snapToGrid = false,
  showGrid = true,
  gridSize = 8,
  gridShape = "dot",
  gridColor = 0x00A0A0A0,
  gridMajorEvery = 5,
  gridMajorColor = 0x00606060,
  backgroundColor = "clBtnFace",
  moveColor = "clHighlight",
  resizeColor = "clRed",
  frameThickness = 2,
}

local function designRootColor(rt)
  local formNode = rt and rt.project and rt.project.forms and rt.project.forms[1]
  if formNode and formNode.props and formNode.props.Color ~= nil then
    return formNode.props.Color
  end
  return M.options.backgroundColor or "clBtnFace"
end

local function invalidateGrid(rt)
  if not rt then return end
  if rt.designRoot then
    pcall(function() rt.designRoot.Color = designRootColor(rt) end)
    pcall(function() rt.designRoot:Invalidate() end)
    pcall(function() rt.designRoot:Repaint() end)
  end
end

local function setGridRuntimeVisible(rt, visible, repaint)
  if repaint then invalidateGrid(rt) end
end

function M.setOptions(opts)
  opts = opts or {}
  for k, v in pairs(opts) do M.options[k] = v end
  invalidateGrid(M.current)
end

local function snapValue(v)
  v = tonumber(v) or 0
  if not M.options.snapToGrid then return math.floor(v + 0.5) end
  local g = tonumber(M.options.gridSize) or 8
  if g < 1 then g = 1 end
  return math.floor((v + g / 2) / g) * g
end

local function snapSize(v)
  return math.max(12, snapValue(v))
end

local function clearRuntime(rt)
  if rt and rt.designRoot and rt.designRoot.Free then
    pcall(function() rt.designRoot:Free() end)
  end
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

local function applyStringCollection(obj, propName, values)
  if not obj or not propName then return false end
  values = values or {}
  local owned = {}
  for i, v in ipairs(values) do owned[i] = tostring(v or "") end
  values = owned

  local stringsObj = nil
  pcall(function() stringsObj = obj[propName] end)
  if stringsObj then
    clearStrings(stringsObj)
    for _, line in ipairs(values) do addString(stringsObj, line) end
    if propName == "Lines" then
      pcall(function() obj.Text = table.concat(values, "\n") end)
    end
    return true
  end

  local okAssign = pcall(function() obj[propName] = values end)
  if okAssign then
    if propName == "Lines" then pcall(function() obj.Text = table.concat(values, "\n") end) end
    return true
  end
  return false
end


local function splitTextLines(text)
  local out = {}
  text = tostring(text or ""):gsub("\r\n", "\n"):gsub("\r", "\n")
  text = text:gsub("\n$", "")
  if text == "" then return out end
  for line in (text .. "\n"):gmatch("(.-)\n") do
    table.insert(out, line)
  end
  return out
end

local function readStringCollection(obj, propName)
  if not obj or not propName then return nil end
  local stringsObj = nil
  local ok = pcall(function() stringsObj = obj[propName] end)
  if not ok or stringsObj == nil then return nil end

  if type(stringsObj) == "table" and not stringsObj.Handle then
    local out = {}
    for i, v in ipairs(stringsObj) do out[i] = tostring(v or "") end
    return out
  end

  local text = nil
  ok = pcall(function() text = stringsObj.Text end)
  if ok and text ~= nil then return splitTextLines(text) end

  local count = nil
  pcall(function() count = tonumber(stringsObj.Count) end)
  if count and count >= 0 then
    local out = {}
    for i = 0, count - 1 do
      local v = nil
      if v == nil then pcall(function() v = stringsObj.Strings[i] end) end
      if v == nil then pcall(function() v = stringsObj[i] end) end
      if v == nil then pcall(function() v = stringsObj:Get(i) end) end
      if v == nil then pcall(function() v = stringsObj:GetString(i) end) end
      table.insert(out, tostring(v or ""))
    end
    return out
  end

  text = nil
  ok = pcall(function() text = obj.Text end)
  if ok and text ~= nil and propName == "Lines" then return splitTextLines(text) end
  return nil
end

function M.syncStringCollections(node)
  local rt = M.current
  if not rt or not node then return end
  local function walk(n)
    local obj = rt.byNode and rt.byNode[n]
    local meta = registry.collectionsFor(n.class) or {}
    for propName, typ in pairs(meta) do
      if typ == "strings" and obj then
        local values = readStringCollection(obj, propName)
        if values then
          n.collections = n.collections or {}
          local copy = {}
          for i, v in ipairs(values) do copy[i] = tostring(v or "") end
          n.collections[propName] = copy
        end
      end
    end
    for _, child in ipairs(n.items or {}) do walk(child) end
  end
  walk(node)
end

local function applyCollections(obj, node)
  if not obj or not node then return end
  local cols = node.collections or {}
  local meta = registry.collectionsFor(node.class) or {}
  for propName, values in pairs(cols) do
    local typ = meta[propName] or "strings"
    if typ == "strings" and type(values) == "table" then
      applyStringCollection(obj, propName, values)
      if propName == "Lines" then
        pcall(function() obj.Text = table.concat(values, "\n") end)
      end
    end
  end
end

function M.applyNodeCollections(node)
  local rt = M.current
  if not rt or not node then return false end
  local obj = rt.byNode[node]
  if not obj then return false end
  applyCollections(obj, node)
  return true
end

local function makeControl(parent, node)
  if node.class == "Form" then
    error("Form node is represented by the designRoot panel in embedded mode")
  end
  if not VCL[node.class] then error("Unknown VCL class: " .. tostring(node.class)) end
  local obj = VCL[node.class](parent, node.name)
  obj.Name = node.name
  util.applyProps(obj, node.props)
  applyCollections(obj, node)
  return obj
end

local function shiftHasCtrl(shift)
  if type(shift) == "table" then
    if shift.ssCtrl or shift.Ctrl or shift.ctrl then return true end
    for k, v in pairs(shift) do
      if v == "ssCtrl" or v == "Ctrl" or k == "ssCtrl" then return true end
    end
  elseif type(shift) == "string" then
    return shift:lower():find("ctrl", 1, true) ~= nil
  end
  return false
end

local function shiftHasShift(shift)
  if type(shift) == "table" then
    if shift.ssShift or shift.Shift or shift.shift then return true end
    for k, v in pairs(shift) do
      if v == "ssShift" or v == "Shift" or k == "ssShift" then return true end
    end
  elseif type(shift) == "string" then
    return shift:lower():find("shift", 1, true) ~= nil
  end
  return false
end

local function isLeftButton(button)
  return button == "mbLeft" or button == "left" or button == 0 or button == 1
end

local function setBounds(obj, left, top, width, height)
  if not obj then return end
  pcall(function() obj.Left = left end)
  pcall(function() obj.Top = top end)
  if width then pcall(function() obj.Width = width end) end
  if height then pcall(function() obj.Height = height end) end
end

local function makeBorderPiece(parent, name)
  local p = VCL.Panel(parent, name)
  p._ = {
    Left = 0,
    Top = 0,
    Width = 1,
    Height = 1,
    Caption = "",
    BevelOuter = "bvNone",
    Color = "clHighlight",
    Visible = false,
  }
  return p
end

local function drawDottedGrid(sender)
  local canvas = nil
  pcall(function() canvas = sender.Canvas end)
  if not canvas then return end

  local w = 0
  local h = 0
  pcall(function() w = tonumber(sender.Width) or 0 end)
  pcall(function() h = tonumber(sender.Height) or 0 end)
  if w <= 0 or h <= 0 then return end

  local g = tonumber(M.options.gridSize) or 8
  if g < 2 then g = 2 end

  local dot = M.options.gridColor or 0x00A0A0A0
  local major = M.options.gridMajorColor or 0x00606060
  local majorEvery = tonumber(M.options.gridMajorEvery) or 5
  if majorEvery < 1 then majorEvery = 1 end
  local shape = tostring(M.options.gridShape or "dot"):lower()

  local function put(x, y, color)
    pcall(function() canvas:SetPixel(x, y, color) end)
  end

  if M.options.showGrid then
    local ix = 0
    for x = g, w - 2, g do
      ix = ix + 1
      local iy = 0
      for y = g, h - 2, g do
        iy = iy + 1
        local isMajor = ((ix % majorEvery == 0) and (iy % majorEvery == 0))
        local color = isMajor and major or dot

        if shape == "line" then
          put(x - 1, y, color); put(x, y, color); put(x + 1, y, color)
          put(x, y - 1, color); put(x, y + 1, color)
        elseif shape == "cross" then
          put(x - 1, y, color); put(x, y, color); put(x + 1, y, color)
          put(x, y - 1, color); put(x, y + 1, color)
        else
          put(x, y, color)
          if isMajor then
            put(x + 1, y, color); put(x, y + 1, color); put(x + 1, y + 1, color)
          end
        end
      end
    end
  end
end

local function installGridPainter(rt)
  rt.designRoot.OnPaint = function(sender)
    drawDottedGrid(sender)
  end
end

local function makeSelectionFrame(rt)
  rt.selTop = makeBorderPiece(rt.designRoot, "__sel_top")
  rt.selBottom = makeBorderPiece(rt.designRoot, "__sel_bottom")
  rt.selLeft = makeBorderPiece(rt.designRoot, "__sel_left")
  rt.selRight = makeBorderPiece(rt.designRoot, "__sel_right")
end

local function makeTargetFrame(rt)
  rt.targetObj = nil
  rt.targetRect = nil
end

local function objectRootXY(rt, obj)
  if not rt or not obj then return 0, 0 end
  if obj == rt.designRoot then return 0, 0 end

  local ok, ox, oy, rx, ry = pcall(function()
    local o = obj.ControlOrigin
    local r = rt.designRoot.ControlOrigin
    return tonumber(o and o.x) or 0, tonumber(o and o.y) or 0,
           tonumber(r and r.x) or 0, tonumber(r and r.y) or 0
  end)
  if ok then return ox - rx, oy - ry end

  local x, y = 0, 0
  local cur = obj
  while cur and cur ~= rt.designRoot do
    pcall(function()
      x = x + (tonumber(cur.Left) or 0)
      y = y + (tonumber(cur.Top) or 0)
      cur = cur.Parent
    end)
    if cur == obj then break end
  end
  return x, y
end


local function clientRootXY(rt, obj)
  if not rt or not obj then return 0, 0 end
  if obj == rt.designRoot then return 0, 0 end

  local ok, ox, oy, rx, ry = pcall(function()
    local o = obj.ClientOrigin or obj.ControlOrigin
    local r = rt.designRoot.ClientOrigin or rt.designRoot.ControlOrigin
    return tonumber(o and o.x) or 0, tonumber(o and o.y) or 0,
           tonumber(r and r.x) or 0, tonumber(r and r.y) or 0
  end)
  if ok then return ox - rx, oy - ry end

  return objectRootXY(rt, obj)
end

local function outerRootXY(rt, obj)
  if not rt or not obj then return 0, 0 end
  if obj == rt.designRoot then return 0, 0 end

  local parent = nil
  pcall(function() parent = obj.Parent end)
  if parent then
    local ok, px, py, rx, ry, l, t = pcall(function()
      local po = parent.ClientOrigin or parent.ControlOrigin
      local ro = rt.designRoot.ClientOrigin or rt.designRoot.ControlOrigin
      return tonumber(po and po.x) or 0, tonumber(po and po.y) or 0,
             tonumber(ro and ro.x) or 0, tonumber(ro and ro.y) or 0,
             tonumber(obj.Left) or 0, tonumber(obj.Top) or 0
    end)
    if ok then return (px - rx) + l, (py - ry) + t end
  end

  return objectRootXY(rt, obj)
end

local function clientSize(obj)
  local w, h
  pcall(function() w = obj.ClientWidth end)
  pcall(function() h = obj.ClientHeight end)
  if not w then pcall(function() w = obj.Width end) end
  if not h then pcall(function() h = obj.Height end) end
  return tonumber(w) or 0, tonumber(h) or 0
end

local function clamp(v, lo, hi)
  v = tonumber(v) or 0
  lo = tonumber(lo) or 0
  hi = tonumber(hi) or lo
  if hi < lo then hi = lo end
  if v < lo then return lo end
  if v > hi then return hi end
  return v
end

local function showFrame(rt, obj)
  if not rt then return end
  local pieces = { rt.selTop, rt.selBottom, rt.selLeft, rt.selRight }
  if not obj then
    for _, p in ipairs(pieces) do p.Visible = false end
    return
  end

  local x, y = outerRootXY(rt, obj)
  local w = obj.Width or 1
  local h = obj.Height or 1
  local t = tonumber(M.options.frameThickness) or 2

  if obj == rt.designRoot then
    for _, p in ipairs(pieces) do p.Visible = false end
    return
  else
    setBounds(rt.selTop,    x - t,     y - t,     w + 2*t, t)
    setBounds(rt.selBottom, x - t,     y + h,     w + 2*t, t)
    setBounds(rt.selLeft,   x - t,     y - t,     t,       h + 2*t)
    setBounds(rt.selRight,  x + w,     y - t,     t,       h + 2*t)
  end

  for _, p in ipairs(pieces) do
    p.Visible = true
    if p.BringToFront then pcall(function() p:BringToFront() end) end
  end
end

local function setFrameColor(rt, color)
  if not rt then return end
  for _, p in ipairs({ rt.selTop, rt.selBottom, rt.selLeft, rt.selRight }) do
    pcall(function() p.Color = color end)
  end
end

local function hideTargetFrame(rt)
  if not rt then return end
  rt.targetObj = nil
  rt.targetRect = nil
end

local function showTargetFrame(rt, obj)
  if not rt then return end
  rt.targetObj = obj
  rt.targetRect = nil
end

function M.selectNode(node)
  local rt = M.current
  if not rt then return end
  rt.selectedNode = node
  setFrameColor(rt, M.options.moveColor or "clHighlight")
  showFrame(rt, node and rt.byNode[node] or nil)
end

local function showFrameAt(rt, obj, x, y, width, height)
  if not rt or not obj then return end
  local w = tonumber(width or obj.Width) or 1
  local h = tonumber(height or obj.Height) or 1
  local t = tonumber(M.options.frameThickness) or 2

  setBounds(rt.selTop,    x - t,     y - t,     w + 2*t, t)
  setBounds(rt.selBottom, x - t,     y + h,     w + 2*t, t)
  setBounds(rt.selLeft,   x - t,     y - t,     t,       h + 2*t)
  setBounds(rt.selRight,  x + w,     y - t,     t,       h + 2*t)

  for _, p in ipairs({ rt.selTop, rt.selBottom, rt.selLeft, rt.selRight }) do
    p.Visible = true
    if p.BringToFront then pcall(function() p:BringToFront() end) end
  end
end

local aligns = { alNone = true, alCustom = true }

local function clearAnchorsForMove(obj, node)
  pcall(function()
    if obj.DisableAutoSizing then obj:DisableAutoSizing() end
  end)

  local okAlign, align = pcall(function() return obj.Align end)
  if okAlign and align and not aligns[align] then
    pcall(function() obj.Align = "alNone" end)
    node.props = node.props or {}
    node.props.Align = nil
  end

  pcall(function() obj.Anchors = "[akLeft,akTop]" end)
  node.props = node.props or {}
  node.props.Anchors = nil

  for _, dir in ipairs({ "AnchorSideLeft", "AnchorSideRight", "AnchorSideTop", "AnchorSideBottom" }) do
    pcall(function()
      if obj[dir] then
        obj[dir].Control = nil
        obj[dir].Side = "asrTop"
      end
    end)
    node.props[dir] = nil
  end
end

local function controlOrigin(obj)
  local origin = nil
  pcall(function() origin = obj.ControlOrigin end)
  if origin then
    return tonumber(origin.x) or 0, tonumber(origin.y) or 0
  end

  local po = nil
  pcall(function() po = obj.Parent.ControlOrigin end)
  return (tonumber(po and po.x) or 0) + (tonumber(obj.Left) or 0),
         (tonumber(po and po.y) or 0) + (tonumber(obj.Top) or 0)
end

local function parentOrigin(obj)
  local po = nil
  pcall(function() po = obj.Parent.ControlOrigin end)
  return tonumber(po and po.x) or 0, tonumber(po and po.y) or 0
end

local function rootCoordsFromSender(rt, sender, x, y)
  local lx = tonumber(x) or 0
  local ly = tonumber(y) or 0

  if sender == rt.designRoot then
    return lx, ly
  end

  local ok, sx, sy, rx, ry = pcall(function()
    local ax, ay = controlOrigin(sender)
    local bx, by = controlOrigin(rt.designRoot)
    return ax, ay, bx, by
  end)
  if ok then
    return (sx - rx) + lx, (sy - ry) + ly
  end

  local fx, fy = lx, ly
  pcall(function()
    fx = fx + (tonumber(sender.Left) or 0)
    fy = fy + (tonumber(sender.Top) or 0)
  end)
  return fx, fy
end

local function containerAtRootPoint(rt, draggedNode, rootX, rootY)
  if not rt or not rt.project then return nil end
  local best, bestArea = nil, nil
  local formNode = model.getRoot(rt.project)

  local function consider(node)
    if not node or node == draggedNode then return end
    if draggedNode and model.isAncestor(draggedNode, node) then return end
    if node ~= formNode and not registry.isContainer(node.class) then return end
    local obj = rt.byNode[node]
    if not obj then return end
    local x, y = outerRootXY(rt, obj)
    local w = tonumber(obj.Width) or tonumber(node.props and node.props.Width) or 0
    local h = tonumber(obj.Height) or tonumber(node.props and node.props.Height) or 0
    if rootX >= x and rootY >= y and rootX <= x + w and rootY <= y + h then
      local area = math.max(1, w * h)
      if not bestArea or area <= bestArea then
        best = node
        bestArea = area
      end
    end
  end

  local function walk(node)
    consider(node)
    for _, child in ipairs(node.items or {}) do walk(child) end
  end
  walk(formNode)
  return best or formNode
end

local function startDrag(rt, node, obj, button, shift, x, y, callbacks)
  if not node or not obj or node.class == "Form" then return end
  if not isLeftButton(button) then return end
  if not shiftHasCtrl(shift) then return end
  if drag then return end

  local width = tonumber(obj.Width) or 1
  local height = tonumber(obj.Height) or 1
  local origLeft = tonumber(obj.Left) or 0
  local origTop = tonumber(obj.Top) or 0
  local origRootLeft, origRootTop = outerRootXY(rt, obj)
  local formNode = model.getRoot(rt.project)
  local currentParentAtStart = model.findParent(rt.project, node) or formNode
  local currentParentObjAtStart = rt.byNode[currentParentAtStart] or rt.designRoot
  local parentClientRootXAtStart, parentClientRootYAtStart = clientRootXY(rt, currentParentObjAtStart)
  local parentClientWAtStart, parentClientHAtStart = clientSize(currentParentObjAtStart)
  local lockToCurrentParent = currentParentAtStart ~= formNode

  local grabX = tonumber(x) or 0
  local grabY = tonumber(y) or 0
  local resizeMode = shiftHasShift(shift)

  local state = {
    rt = rt,
    node = node,
    obj = obj,
    width = width,
    height = height,
    origLeft = origLeft,
    origTop = origTop,
    origRootLeft = origRootLeft,
    origRootTop = origRootTop,
    currentParentAtStart = currentParentAtStart,
    currentParentObjAtStart = currentParentObjAtStart,
    parentClientRootXAtStart = parentClientRootXAtStart,
    parentClientRootYAtStart = parentClientRootYAtStart,
    parentClientWAtStart = parentClientWAtStart,
    parentClientHAtStart = parentClientHAtStart,
    lockToCurrentParent = lockToCurrentParent,
    grabX = grabX,
    grabY = grabY,
    resizeMode = resizeMode,
    newLeft = origRootLeft,
    newTop = origRootTop,
    newWidth = width,
    newHeight = height,
    finished = false,
    oldRootMove = rt.designRoot.OnMouseMove,
    oldRootUp = rt.designRoot.OnMouseUp,
    oldRootClick = rt.designRoot.OnClick,
    oldObjMove = obj.OnMouseMove,
    oldObjUp = obj.OnMouseUp,
    oldParentMove = nil,
    oldParentUp = nil,
    oldParentClick = nil,
    parentDragObj = nil,
    oldDragSurfaceHandlers = {},
    oldPieceHandlers = {},
    mouseCaptureTransferred = false,
    gridWasVisible = M.options.showGrid and true or false,
  }

  state.parentDragObj = (currentParentObjAtStart ~= rt.designRoot) and currentParentObjAtStart or nil
  if state.parentDragObj then
    state.oldParentMove = state.parentDragObj.OnMouseMove
    state.oldParentUp = state.parentDragObj.OnMouseUp
    state.oldParentClick = state.parentDragObj.OnClick
  end

  drag = state

  local function moveFromRoot(rootX, rootY)
    if not drag or drag.finished then return end
    local rx = tonumber(rootX) or 0
    local ry = tonumber(rootY) or 0

    if state.resizeMode then
      local maxW = state.parentClientRootXAtStart + state.parentClientWAtStart - state.origRootLeft
      local maxH = state.parentClientRootYAtStart + state.parentClientHAtStart - state.origRootTop
      local nw = snapSize(rx - state.origRootLeft)
      local nh = snapSize(ry - state.origRootTop)
      nw = clamp(nw, 12, math.max(12, maxW))
      nh = clamp(nh, 12, math.max(12, maxH))
      state.newWidth = nw
      state.newHeight = nh
      showFrameAt(rt, obj, state.origRootLeft, state.origRootTop, nw, nh)
    else
      local nx = snapValue(rx - grabX)
      local ny = snapValue(ry - grabY)

      local minX = state.parentClientRootXAtStart
      local minY = state.parentClientRootYAtStart
      local maxX = state.parentClientRootXAtStart + state.parentClientWAtStart - state.newWidth
      local maxY = state.parentClientRootYAtStart + state.parentClientHAtStart - state.newHeight
      nx = clamp(nx, minX, maxX)
      ny = clamp(ny, minY, maxY)

      state.newLeft = nx
      state.newTop = ny
      showFrameAt(rt, obj, nx, ny, state.newWidth, state.newHeight)

      state.targetParent = nil
    end
  end

  local function eventMove(sender, sh, mx, my)
    local rx, ry = rootCoordsFromSender(rt, sender, mx, my)
    moveFromRoot(rx, ry)
  end

  local function finish(sender, btn, sh, mx, my)
    if not drag or state.finished then return end
    if sender then
      local rx, ry = rootCoordsFromSender(rt, sender, mx, my)
      moveFromRoot(rx, ry)
    end

    state.finished = true
    drag = nil
    hideTargetFrame(rt)

    pcall(function() rt.designRoot.MouseCapture = false end)
    pcall(function() obj.MouseCapture = false end)

    rt.designRoot.OnMouseMove = state.oldRootMove
    rt.designRoot.OnMouseUp = state.oldRootUp
    rt.designRoot.OnClick = state.oldRootClick
    obj.OnMouseMove = state.oldObjMove
    obj.OnMouseUp = state.oldObjUp
    if state.parentDragObj then
      state.parentDragObj.OnMouseMove = state.oldParentMove
      state.parentDragObj.OnMouseUp = state.oldParentUp
      state.parentDragObj.OnClick = state.oldParentClick
    end
    for _, rec in ipairs(state.oldDragSurfaceHandlers or {}) do
      rec.o.OnMouseMove = rec.move
      rec.o.OnMouseUp = rec.up
      rec.o.OnClick = rec.click
    end
    for _, rec in ipairs(state.oldPieceHandlers) do
      rec.p.OnMouseMove = rec.move
      rec.p.OnMouseUp = rec.up
      rec.p.OnClick = rec.click
    end

    clearAnchorsForMove(obj, node)

    local finalRootLeft = state.newLeft
    local finalRootTop = state.newTop
    local targetParent = nil
    local currentParent = model.findParent(rt.project, node) or model.getRoot(rt.project)

    targetParent = currentParent

    local parentObj = rt.byNode[targetParent or currentParent] or rt.designRoot
    local parentRootX, parentRootY = clientRootXY(rt, parentObj)
    local parentW, parentH = clientSize(parentObj)
    local localLeft = snapValue(finalRootLeft - parentRootX)
    local localTop = snapValue(finalRootTop - parentRootY)
    localLeft = clamp(localLeft, 0, parentW - state.newWidth)
    localTop = clamp(localTop, 0, parentH - state.newHeight)

    if targetParent and targetParent ~= currentParent then
      local ok = model.moveNodeToParent(rt.project, node, targetParent, localLeft, localTop)
      pcall(function() obj.Visible = true end)
      if ok and callbacks and callbacks.onReparented then
        callbacks.onReparented(node, targetParent)
        return
      end
    end

    if obj.SetBounds then
      pcall(function() obj:SetBounds(localLeft, localTop, state.newWidth, state.newHeight) end)
    else
      setBounds(obj, localLeft, localTop, state.newWidth, state.newHeight)
    end

    pcall(function() if obj.EnableAutoSizing then obj:EnableAutoSizing() end end)

    node.props = node.props or {}
    node.props.Left = tonumber(obj.Left) or localLeft
    node.props.Top = tonumber(obj.Top) or localTop
    node.props.Width = tonumber(obj.Width) or state.newWidth
    node.props.Height = tonumber(obj.Height) or state.newHeight

    pcall(function() obj.Visible = true end)
    setFrameColor(rt, M.options.moveColor or "clHighlight")
    showFrame(rt, obj)
    setGridRuntimeVisible(rt, true, true)
    if callbacks and callbacks.onMoved then callbacks.onMoved(node) end
  end

  rt.designRoot.OnMouseMove = eventMove
  rt.designRoot.OnMouseUp = finish
  rt.designRoot.OnClick = function(sender) end

  if state.parentDragObj then
    state.parentDragObj.OnMouseMove = eventMove
    state.parentDragObj.OnMouseUp = finish
    state.parentDragObj.OnClick = function(sender) end
  end

  for _, other in ipairs(rt.objects or {}) do
    if other and other ~= obj and other ~= rt.designRoot and other ~= state.parentDragObj then
      table.insert(state.oldDragSurfaceHandlers, {
        o = other,
        move = other.OnMouseMove,
        up = other.OnMouseUp,
        click = other.OnClick,
      })
      other.OnMouseMove = eventMove
      other.OnMouseUp = finish
      other.OnClick = function(sender) end
    end
  end

  local needsOriginalObjectDrag = registry.needsOriginalDragFallback(node.class)
  if needsOriginalObjectDrag then
    obj.OnMouseMove = eventMove
    obj.OnMouseUp = finish
  end

  for _, p in ipairs({ rt.selTop, rt.selBottom, rt.selLeft, rt.selRight }) do
    if p then
      table.insert(state.oldPieceHandlers, {
        p = p,
        move = p.OnMouseMove,
        up = p.OnMouseUp,
        click = p.OnClick,
      })
      p.OnMouseMove = eventMove
      p.OnMouseUp = finish
      p.OnClick = function(sender) end
    end
  end

  setFrameColor(rt, resizeMode and (M.options.resizeColor or "clRed") or (M.options.moveColor or "clHighlight"))
  showFrameAt(rt, obj, origRootLeft, origRootTop)

  pcall(function() obj.MouseCapture = false end)
  pcall(function()
    rt.designRoot.MouseCapture = true
    state.mouseCaptureTransferred = true
  end)

  pcall(function() obj.Visible = false end)
end


local function startRootResize(rt, node, sender, button, shift, x, y, callbacks)
  if not node or node.class ~= "Form" then return end
  if not isLeftButton(button) then return end
  if not (shiftHasCtrl(shift) and shiftHasShift(shift)) then return end
  if drag then return end

  local obj = rt.designRoot
  local origWidth = tonumber(obj.Width) or tonumber(node.props and node.props.Width) or 520
  local origHeight = tonumber(obj.Height) or tonumber(node.props and node.props.Height) or 360

  local state = {
    rt = rt,
    node = node,
    obj = obj,
    origWidth = origWidth,
    origHeight = origHeight,
    newWidth = origWidth,
    newHeight = origHeight,
    finished = false,
    oldRootMove = obj.OnMouseMove,
    oldRootUp = obj.OnMouseUp,
    oldRootClick = obj.OnClick,
    oldPieceHandlers = {},
  }
  drag = state

  local function applySize(rootX, rootY)
    if not drag or state.finished then return end
    local nw = math.max(120, snapSize(rootX))
    local nh = math.max(80, snapSize(rootY))
    state.newWidth = nw
    state.newHeight = nh
    pcall(function() obj.Width = nw end)
    pcall(function() obj.Height = nh end)
    invalidateGrid(rt)
  end

  local function eventMove(snd, sh, mx, my)
    local rx, ry = rootCoordsFromSender(rt, snd, mx, my)
    applySize(rx, ry)
  end

  local function finish(snd, btn, sh, mx, my)
    if not drag or state.finished then return end
    if snd then
      local rx, ry = rootCoordsFromSender(rt, snd, mx, my)
      applySize(rx, ry)
    end
    state.finished = true
    drag = nil

    pcall(function() obj.MouseCapture = false end)
    obj.OnMouseMove = state.oldRootMove
    obj.OnMouseUp = state.oldRootUp
    obj.OnClick = state.oldRootClick
    for _, rec in ipairs(state.oldPieceHandlers) do
      rec.p.OnMouseMove = rec.move
      rec.p.OnMouseUp = rec.up
      rec.p.OnClick = rec.click
    end

    node.props = node.props or {}
    node.props.Width = tonumber(obj.Width) or state.newWidth
    node.props.Height = tonumber(obj.Height) or state.newHeight
    setFrameColor(rt, M.options.moveColor or "clHighlight")
    showFrame(rt, nil)
    invalidateGrid(rt)
    if callbacks and callbacks.onMoved then callbacks.onMoved(node) end
  end

  obj.OnMouseMove = eventMove
  obj.OnMouseUp = finish
  obj.OnClick = function(sender) end

  for _, p in ipairs({ rt.selTop, rt.selBottom, rt.selLeft, rt.selRight }) do
    table.insert(state.oldPieceHandlers, {
      p = p,
      move = p.OnMouseMove,
      up = p.OnMouseUp,
      click = p.OnClick,
    })
    p.OnMouseMove = eventMove
    p.OnMouseUp = finish
    p.OnClick = function(sender) end
  end

  pcall(function() obj.MouseCapture = true end)
  applySize(tonumber(x) or origWidth, tonumber(y) or origHeight)
end

local function tryPaletteClickInsert(rt, sender, targetNode, button, shift, x, y, callbacks)
  return false
end

local function attachMouseHandlers(rt, obj, node, callbacks)
  obj.OnClick = function(sender)
    if callbacks.onSelect then callbacks.onSelect(node) end
  end

  obj.OnMouseDown = function(sender, button, shift, x, y)
    if tryPaletteClickInsert(rt, sender, node, button, shift, x, y, callbacks) then return end
    if callbacks.onSelect then callbacks.onSelect(node) end
    startDrag(rt, node, sender, button, shift, x, y, callbacks)
  end
end

function M.rebuild(surface, project, callbacks)
  callbacks = callbacks or {}
  clearRuntime(M.current)

  local rt = { objects = {}, byNode = {}, byObject = {}, selectedNode = nil, project = project, callbacks = callbacks, surface = surface }
  local formNode = project.forms[1]

  local designRoot = VCL.Panel(surface, formNode.name .. "_host")
  designRoot._ = {
    Left = 16,
    Top = 16,
    Width = formNode.props.Width or 520,
    Height = formNode.props.Height or 360,
    Caption = "",
    BevelOuter = "bvRaised",
    Color = formNode.props.Color or M.options.backgroundColor or "clBtnFace",
  }

  rt.designRoot = designRoot
  rt.byNode[formNode] = designRoot
  rt.byObject[designRoot.Handle] = formNode
  table.insert(rt.objects, designRoot)

  pcall(function() designRoot.KeyPreview = true end)
  designRoot.OnKeyDown = function(sender, key, shift)
    if callbacks.onKeyDown and callbacks.onKeyDown(key, shift) then return 0 end
    return key
  end

  designRoot.OnClick = function(sender)
    if callbacks.onSelect then callbacks.onSelect(formNode) end
  end
  designRoot.OnMouseDown = function(sender, button, shift, x, y)
    if tryPaletteClickInsert(rt, sender, formNode, button, shift, x, y, callbacks) then return end
    if callbacks.onSelect then callbacks.onSelect(formNode) end
    startRootResize(rt, formNode, sender, button, shift, x, y, callbacks)
  end

  designRoot.OnDragOver = function(sender, source, x, y, state)
    if callbacks.onDragDebug then callbacks.onDragDebug('Form1 DragOver x='..tostring(x)..' y='..tostring(y)..' source='..tostring(source)) end
    if callbacks.isPaletteSource and callbacks.isPaletteSource(source) then
      return true
    end
    return false
  end
  designRoot.OnDragDrop = function(sender, source, x, y)
    if callbacks.onDragDebug then callbacks.onDragDebug('Form1 DragDrop x='..tostring(x)..' y='..tostring(y)..' source='..tostring(source)) end
    if callbacks.isPaletteSource and callbacks.isPaletteSource(source) then
      if callbacks.onPaletteDrop then callbacks.onPaletteDrop(formNode, x, y) end
    end
  end

  installGridPainter(rt)

  local function addChildren(parentObj, parentNode)
    for _, child in ipairs(parentNode.items or {}) do
      local obj = makeControl(parentObj, child)
      rt.byNode[child] = obj
      rt.byObject[obj.Handle] = child
      table.insert(rt.objects, obj)

      attachMouseHandlers(rt, obj, child, callbacks)

      addChildren(obj, child)
    end
  end

  addChildren(designRoot, formNode)
  makeSelectionFrame(rt)
  makeTargetFrame(rt)
  invalidateGrid(rt)

  M.current = rt
  return rt
end


function M.rebuildFloating(project, callbacks)
  callbacks = callbacks or {}
  clearRuntime(M.current)

  local rt = { objects = {}, byNode = {}, byObject = {}, selectedNode = nil, project = project, callbacks = callbacks, surface = nil, floating = true }
  local formNode = project.forms[1]
  formNode.props = formNode.props or {}

  local designRoot = VCL.Form()
  pcall(function() designRoot.Name = formNode.name or "Form1" end)
  util.applyProps(designRoot, formNode.props)
  if formNode.props.Position == nil then
    pcall(function() designRoot.Position = "poScreenCenter" end)
  end
  pcall(function() designRoot.FormStyle = "fsNormal" end)
  pcall(function() if not designRoot.Caption or designRoot.Caption == "" then designRoot.Caption = formNode.props.Caption or formNode.name or "Form1" end end)
  pcall(function() if not designRoot.Width or designRoot.Width <= 0 then designRoot.Width = formNode.props.Width or 520 end end)
  pcall(function() if not designRoot.Height or designRoot.Height <= 0 then designRoot.Height = formNode.props.Height or 360 end end)
  pcall(function() if formNode.props.Color == nil then designRoot.Color = M.options.backgroundColor or "clBtnFace" end end)

  rt.designRoot = designRoot
  rt.byNode[formNode] = designRoot
  pcall(function() rt.byObject[designRoot.Handle] = formNode end)
  table.insert(rt.objects, designRoot)

  pcall(function() designRoot.KeyPreview = true end)
  designRoot.OnKeyDown = function(sender, key, shift)
    if callbacks.onKeyDown and callbacks.onKeyDown(key, shift) then return 0 end
    return key
  end

  pcall(function()
    designRoot.OnClose = function(sender, action)
      pcall(function() sender:Hide() end)
      return "caHide"
    end
  end)

  designRoot.OnClick = function(sender)
    if callbacks.onSelect then callbacks.onSelect(formNode) end
  end
  designRoot.OnMouseDown = function(sender, button, shift, x, y)
    if tryPaletteClickInsert(rt, sender, formNode, button, shift, x, y, callbacks) then return end
    if callbacks.onSelect then callbacks.onSelect(formNode) end
    startRootResize(rt, formNode, sender, button, shift, x, y, callbacks)
  end

  designRoot.OnDragOver = function(sender, source, x, y, state)
    if callbacks.onDragDebug then callbacks.onDragDebug('Form1 DragOver x='..tostring(x)..' y='..tostring(y)..' source='..tostring(source)) end
    if callbacks.isPaletteSource and callbacks.isPaletteSource(source) then
      return true
    end
    return false
  end
  designRoot.OnDragDrop = function(sender, source, x, y)
    if callbacks.onDragDebug then callbacks.onDragDebug('Form1 DragDrop x='..tostring(x)..' y='..tostring(y)..' source='..tostring(source)) end
    if callbacks.isPaletteSource and callbacks.isPaletteSource(source) then
      if callbacks.onPaletteDrop then callbacks.onPaletteDrop(formNode, x, y) end
    end
  end

  installGridPainter(rt)

  local function addChildren(parentObj, parentNode)
    for _, child in ipairs(parentNode.items or {}) do
      local obj = makeControl(parentObj, child)
      rt.byNode[child] = obj
      pcall(function() rt.byObject[obj.Handle] = child end)
      table.insert(rt.objects, obj)
      attachMouseHandlers(rt, obj, child, callbacks)
      addChildren(obj, child)
    end
  end

  addChildren(designRoot, formNode)
  makeSelectionFrame(rt)
  makeTargetFrame(rt)
  invalidateGrid(rt)

  M.current = rt
  pcall(function() designRoot:Show() end)
  pcall(function() designRoot.Show(designRoot) end)
  return rt
end



local function liveAddChildren(rt, parentObj, parentNode, callbacks)
  for _, child in ipairs(parentNode.items or {}) do
    local obj = makeControl(parentObj, child)
    rt.byNode[child] = obj
    pcall(function() rt.byObject[obj.Handle] = child end)
    table.insert(rt.objects, obj)
    attachMouseHandlers(rt, obj, child, callbacks or rt.callbacks or {})
    liveAddChildren(rt, obj, child, callbacks or rt.callbacks or {})
  end
end

function M.addLiveNode(parentNode, node)
  local rt = M.current
  if not rt or not parentNode or not node then return false end
  local parentObj = rt.byNode[parentNode] or rt.designRoot
  if not parentObj then return false end
  local ok, err = pcall(function()
    local obj = makeControl(parentObj, node)
    rt.byNode[node] = obj
    pcall(function() rt.byObject[obj.Handle] = node end)
    table.insert(rt.objects, obj)
    attachMouseHandlers(rt, obj, node, rt.callbacks or {})
    liveAddChildren(rt, obj, node, rt.callbacks or {})
    pcall(function() obj.Visible = true end)
  end)
  if not ok then print("addLiveNode failed:", tostring(err)); return false end
  invalidateGrid(rt)
  return true
end


function M.hideLiveSubtree(node)
  local rt = M.current
  if not rt or not node then return false end
  local function walk(n)
    local obj = rt.byNode[n]
    if obj then pcall(function() obj.Visible = false end) end
    for _, child in ipairs(n.items or {}) do walk(child) end
  end
  walk(node)
  showFrame(rt, nil)
  invalidateGrid(rt)
  return true
end

function M.setNodeVisible(node, visible)
  local rt = M.current
  if not rt or not node then return false end
  local obj = rt.byNode[node]
  if not obj then return false end
  pcall(function() obj.Visible = visible and true or false end)
  showFrame(rt, visible and obj or nil)
  return true
end

function M.moveLiveNodeToParent(node, parentNode)
  local rt = M.current
  if not rt or not node then return false end
  local obj = rt.byNode[node]
  local parentObj = parentNode and rt.byNode[parentNode] or rt.designRoot
  if not obj or not parentObj then return false end
  local ok, err = pcall(function()
    obj.Parent = parentObj
    local l = tonumber(node.props and node.props.Left) or tonumber(obj.Left) or 0
    local t = tonumber(node.props and node.props.Top) or tonumber(obj.Top) or 0
    local w = tonumber(node.props and node.props.Width) or tonumber(obj.Width) or nil
    local h = tonumber(node.props and node.props.Height) or tonumber(obj.Height) or nil
    if obj.SetBounds and w and h then obj:SetBounds(l, t, w, h)
    else
      obj.Left = l; obj.Top = t
      if w then obj.Width = w end
      if h then obj.Height = h end
    end
    obj.Visible = true
  end)
  if not ok then print("moveLiveNodeToParent failed:", tostring(err)); return false end
  invalidateGrid(rt)
  return true
end


local function safeReadProp(obj, prop)
  local ok, v = pcall(function() return obj[prop] end)
  if ok then return v end
  return nil
end

local function sameColor(a, b)
  if a == nil or b == nil then return a == b end
  return tostring(a) == tostring(b)
end

local function syncNodeVisualProps(rt, node, inheritedColor)
  if not rt or not node then return inheritedColor end
  local obj = rt.byNode[node]
  node.props = node.props or {}

  if obj then
    if node.class == "Form" or obj == rt.designRoot then
      local c = safeReadProp(obj, "Color")
      if c ~= nil then node.props.Color = c end
      local w = tonumber(safeReadProp(obj, "Width"))
      local h = tonumber(safeReadProp(obj, "Height"))
      if w then node.props.Width = w end
      if h then node.props.Height = h end
    else
      local l = tonumber(safeReadProp(obj, "Left"))
      local t = tonumber(safeReadProp(obj, "Top"))
      local w = tonumber(safeReadProp(obj, "Width"))
      local h = tonumber(safeReadProp(obj, "Height"))
      if l then node.props.Left = l end
      if t then node.props.Top = t end
      if w then node.props.Width = w end
      if h then node.props.Height = h end

      for _, prop in ipairs({ "Caption", "Text" }) do
        local v = safeReadProp(obj, prop)
        if v ~= nil and (node.props[prop] ~= nil or tostring(v) ~= "") then
          node.props[prop] = v
        end
      end

      for _, prop in ipairs({ "Enabled", "Checked", "TabOrder" }) do
        local v = safeReadProp(obj, prop)
        if v ~= nil and (node.props[prop] ~= nil or prop == "TabOrder") then
          node.props[prop] = v
        end
      end

      local c = safeReadProp(obj, "Color")
      if c ~= nil and registry.inheritsThemeColor(node.class) then
        if node.props.Color ~= nil then
          node.props.Color = c
        elseif not sameColor(c, inheritedColor) then
          node.props.Color = c
        end
      end
    end
  end

  local nextInherited = inheritedColor
  if node.props and node.props.Color ~= nil then nextInherited = node.props.Color end
  for _, child in ipairs(node.items or {}) do
    syncNodeVisualProps(rt, child, nextInherited)
  end
  return nextInherited
end

function M.syncRootVisualProps(formNode)
  local rt = M.current
  if not rt or not formNode then return end
  syncNodeVisualProps(rt, formNode, nil)
end

function M.syncLiveTreeToModel(project)
  local rt = M.current
  if not rt or not project then return end
  for _, formNode in ipairs(project.forms or {}) do
    syncNodeVisualProps(rt, formNode, nil)
  end
end

function M.getObject(node)
  local rt = M.current
  if not rt or not node then return nil end
  return rt.byNode[node]
end

function M.findNodeByObject(obj)
  local rt = M.current
  if not rt or not obj then return nil end
  for node, live in pairs(rt.byNode or {}) do
    if live == obj then return node end
    local ok = false
    pcall(function() ok = live and obj and live.Handle == obj.Handle end)
    if ok then return node end
  end
  return nil
end

function M.applyNodeProperty(node, prop, value)
  local rt = M.current
  if not rt or not node or not prop then return end
  local obj = rt.byNode[node]
  if not obj then return end

  node.props = node.props or {}

  if prop == "Name" then
    node.name = tostring(value or "")
    pcall(function() obj.Name = node.name end)
    showFrame(rt, obj)
    return
  end

  if node.class == "Form" or obj == rt.designRoot then
    if prop == "Width" then
      node.props.Width = tonumber(value) or node.props.Width or 520
      pcall(function() obj.Width = node.props.Width end)
      invalidateGrid(rt)
    elseif prop == "Height" then
      node.props.Height = tonumber(value) or node.props.Height or 360
      pcall(function() obj.Height = node.props.Height end)
      invalidateGrid(rt)
    elseif prop == "Caption" then
      node.props.Caption = tostring(value or "")
    elseif prop == "Color" then
      node.props.Color = value
      pcall(function() obj.Color = value end)
      invalidateGrid(rt)
    else
      node.props[prop] = value
      pcall(function() obj[prop] = value end)
    end
    showFrame(rt, obj)
    return
  end

  node.props[prop] = value

  if prop == "Left" or prop == "Top" or prop == "Width" or prop == "Height" then
    M.applyNodeBounds(node)
    return
  end

  local ok, err = pcall(function() obj[prop] = value end)
  if not ok then print("property failed:", prop, tostring(err)) end
  showFrame(rt, obj)
end

function M.applyNodeBounds(node)
  local rt = M.current
  if not rt or not node then return end
  local obj = rt.byNode[node]
  if not obj then return end
  local props = node.props or {}
  if obj == rt.designRoot or node.class == "Form" then
    local w = tonumber(props.Width) or tonumber(obj.Width) or 520
    local h = tonumber(props.Height) or tonumber(obj.Height) or 360
    pcall(function() obj.Width = w end)
    pcall(function() obj.Height = h end)
    invalidateGrid(rt)
    showFrame(rt, obj)
    return
  end
  local l = tonumber(props.Left) or tonumber(obj.Left) or 0
  local t = tonumber(props.Top) or tonumber(obj.Top) or 0
  local w = tonumber(props.Width) or tonumber(obj.Width) or 1
  local h = tonumber(props.Height) or tonumber(obj.Height) or 1
  if obj.SetBounds then
    pcall(function() obj:SetBounds(l, t, w, h) end)
  else
    setBounds(obj, l, t, w, h)
  end
  showFrame(rt, obj)
end

function M.refreshNode(node)
  local rt = M.current
  if not rt or not node then return end
  local obj = rt.byNode[node]
  if obj then showFrame(rt, obj) end
  invalidateGrid(rt)
end


function M.installPaletteDrop(opts)
  return false
end

return M
