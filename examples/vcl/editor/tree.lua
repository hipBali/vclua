-- ***************************************
-- VCLua Form tool
-- Copyright (C) 2013-2026 Hi-Project Ltd.
-- ***************************************
-- Form components as TreeView.

local M = {}

local tree = nil
local nodeByIndex = {}
local treeNodeByModel = {}
local onSelect = nil
local onDrop = nil
local onDblClick = nil
local iconIndexFor = nil
local dragSourceTreeNode = nil

local function setIcon(tn, modelNode)
  if not tn or not iconIndexFor or not modelNode then return end
  local idx = iconIndexFor(modelNode.class)
  if idx then pcall(function() tn.StateIndex = idx end) end
end

local function addNode(parentTreeNode, modelNode)
  local text = modelNode.name .. " : " .. modelNode.class
  local tn
  if parentTreeNode then
    tn = tree.Items:AddChild(parentTreeNode, text)
  else
    tn = tree.Items:Add(nil, text)
  end

  setIcon(tn, modelNode)
  nodeByIndex[tn.AbsoluteIndex] = modelNode
  treeNodeByModel[modelNode] = tn

  for _, child in ipairs(modelNode.items or {}) do
    addNode(tn, child)
  end
end

function M.init(aTree, selectCallback, dropCallback, opts)
  tree = aTree
  onSelect = selectCallback
  onDrop = dropCallback
  opts = opts or {}
  onDblClick = opts.onDblClick
  iconIndexFor = opts.iconIndexFor

  pcall(function() tree.DragMode = "dmAutomatic" end)

  local function isOwnTreeSource(sender, source)
    if not source then return false end
    if source == tree or source == sender then return true end
    local ok, same = pcall(function() return source.Handle == tree.Handle end)
    return ok and same or false
  end

  local function modelNodeFromTreeNode(tn)
    if not tn then return nil end
    return nodeByIndex[tn.AbsoluteIndex]
  end

  local function sourceTreeNode(sender, source)
    -- Returns the tree node currently being dragged.
    if dragSourceTreeNode then return dragSourceTreeNode end
    if source then
      local ok, selected = pcall(function() return source.Selected end)
      if ok and selected then return selected end
    end
    local ok, selected = pcall(function() return sender.Selected end)
    if ok then return selected end
    return nil
  end

  tree.OnMouseDown = function(sender, button, shift, x, y)
    dragSourceTreeNode = sender:GetNodeAt(x, y)
  end

  tree.OnClick = function(sender)
    local tn = sender.Selected
    if tn and onSelect then
      onSelect(modelNodeFromTreeNode(tn))
    end
  end

  tree.OnDblClick = function(sender)
    local tn = sender.Selected
    if tn and onDblClick then
      onDblClick(modelNodeFromTreeNode(tn))
    end
  end

  tree.OnDragOver = function(sender, source, x, y, state)
    if not onDrop or not isOwnTreeSource(sender, source) then return false end
    local srcTreeNode = sourceTreeNode(sender, source)
    local dstTreeNode = sender:GetNodeAt(x, y)
    if not srcTreeNode or not dstTreeNode then return false end
    local srcNode = modelNodeFromTreeNode(srcTreeNode)
    local dstNode = modelNodeFromTreeNode(dstTreeNode)
    if not srcNode or not dstNode then return false end
    return onDrop("can", srcNode, dstNode) and true or false
  end

  tree.OnDragDrop = function(sender, source, x, y)
    if not onDrop or not isOwnTreeSource(sender, source) then return end
    local srcTreeNode = sourceTreeNode(sender, source)
    local dstTreeNode = sender:GetNodeAt(x, y)
    dragSourceTreeNode = nil
    if not srcTreeNode or not dstTreeNode then return end
    local srcNode = modelNodeFromTreeNode(srcTreeNode)
    local dstNode = modelNodeFromTreeNode(dstTreeNode)
    if srcNode and dstNode then
      onDrop("drop", srcNode, dstNode)
    end
  end
end

function M.rebuild(project)
  nodeByIndex = {}
  treeNodeByModel = {}
  tree.Items:Clear()
  for _, form in ipairs(project.forms or {}) do
    addNode(nil, form)
  end
  pcall(function() tree:FullExpand() end)
  pcall(function() tree.FullExpand(tree) end)
end

function M.selectNode(modelNode)
  if not tree or not modelNode then return false end
  local tn = treeNodeByModel[modelNode]
  if not tn then return false end
  pcall(function() tree.Selected = tn end)
  pcall(function() tn.Selected = true end)
  pcall(function() tn:MakeVisible() end)
  pcall(function() tn.MakeVisible(tn) end)
  return true
end

return M
