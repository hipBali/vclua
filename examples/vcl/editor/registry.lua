-- ***************************************
-- VCLua Form tool
-- Copyright (C) 2013-2026 Hi-Project Ltd.
-- ***************************************
-- Component registry 

local M = {}

M.classes = {
  Form = {
    creatable = false,
    category = "Root", icon = "Form",
    defaults = { Caption = "Form1", Width = 520, Height = 360 },
  },

  Button = {
    category = "Common", icon = "Button",
    defaults = { Left = 24, Top = 24, Width = 90, Height = 28, Caption = "$name" },
  },

  Label = {
    category = "Common", icon = "Label",
    defaults = { Left = 24, Top = 64, Width = 90, Height = 24, Caption = "$name" },
    originalDragFallback = true,
  },

  Edit = {
    category = "Common", icon = "Edit",
    defaults = { Left = 24, Top = 96, Width = 140, Height = 28, Text = "" },
  },

  CheckBox = {
    category = "Common", icon = "CheckBox",
    defaults = { Left = 24, Top = 128, Width = 120, Height = 24, Caption = "$name" },
  },

  Memo = {
    category = "Common", icon = "Memo",
    defaults = { Left = 24, Top = 160, Width = 180, Height = 80, Text = "" },
    originalDragFallback = true,
    collections = { Lines = "strings" },
  },

  Panel = {
    category = "Containers", icon = "Panel",
    defaults = { Left = 24, Top = 24, Width = 180, Height = 100, Caption = "$name", BevelOuter = "bvLowered" },
    container = true,
  },

  GroupBox = {
    category = "Containers", icon = "GroupBox",
    defaults = { Left = 24, Top = 24, Width = 180, Height = 100, Caption = "$name" },
    container = true,
    originalDragFallback = true,
  },

  RadioButton = {
    category = "Common", icon = "Button",
    defaults = { Left = 24, Top = 24, Width = 120, Height = 24, Caption = "$name" },
  },

  ComboBox = {
    category = "Common", icon = "ComboBox",
    defaults = { Left = 24, Top = 24, Width = 150, Height = 28, Text = "" },
    collections = { Items = "strings" },
  },

  ListBox = {
    category = "Lists / Data", icon = "ListBox",
    defaults = { Left = 24, Top = 24, Width = 150, Height = 90 },
    collections = { Items = "strings" },
  },

  StaticText = {
    category = "Common", icon = "StaticText",
    defaults = { Left = 24, Top = 24, Width = 120, Height = 24, Caption = "$name" },
    originalDragFallback = true,
  },

  SpeedButton = {
    category = "Common", icon = "Button",
    defaults = { Left = 24, Top = 24, Width = 90, Height = 28, Caption = "$name" },
  },

  BitBtn = {
    category = "Common", icon = "BitBtn",
    defaults = { Left = 24, Top = 24, Width = 90, Height = 32, Caption = "$name" },
  },

  ToggleBox = {
    category = "Common", icon = "ToggleBox",
    defaults = { Left = 24, Top = 24, Width = 100, Height = 28, Caption = "$name" },
  },

  RadioGroup = {
    category = "Containers", icon = "RadioGroup",
    defaults = { Left = 24, Top = 24, Width = 160, Height = 90, Caption = "$name" },
    container = true,
    originalDragFallback = true,
    collections = { Items = "strings" },
  },

  ScrollBox = {
    category = "Containers", icon = "ScrollBox",
    defaults = { Left = 24, Top = 24, Width = 180, Height = 120 },
    container = true,
  },

  Splitter = {
    category = "Containers", icon = "Splitter",
    defaults = { Left = 24, Top = 24, Width = 5, Height = 5, Align = "alTop" },
    special = "splitter",
    noDesignerMove = true,
    noDesignerResize = true,
    noSelectionFrame = true,
    inheritColor = false,
  },

  StringGrid = {
    category = "Lists / Data", icon = "StringGrid",
    defaults = { Left = 24, Top = 24, Width = 220, Height = 120, ColCount = 3, RowCount = 4 },
  },

  TreeView = {
    category = "Lists / Data", icon = "TreeView",
    defaults = { Left = 24, Top = 24, Width = 180, Height = 120 },
  },

  ListView = {
    category = "Lists / Data", icon = "ListView",
    defaults = { Left = 24, Top = 24, Width = 200, Height = 120 },
  },

  ProgressBar = {
    category = "Visual", icon = "ProgressBar",
    defaults = { Left = 24, Top = 24, Width = 160, Height = 24, Min = 0, Max = 100, Position = 35 },
  },

  TrackBar = {
    category = "Visual", icon = "TrackBar",
    defaults = { Left = 24, Top = 24, Width = 160, Height = 40, Min = 0, Max = 100, Position = 50 },
  },

  Shape = {
    category = "Visual", icon = "Shape",
    defaults = { Left = 24, Top = 24, Width = 90, Height = 60 },
  },

  Image = {
    category = "Visual", icon = "Image",
    defaults = { Left = 24, Top = 24, Width = 96, Height = 72, Stretch = true },
  },

  PaintBox = {
    category = "Visual", icon = "PaintBox",
    defaults = { Left = 24, Top = 24, Width = 120, Height = 80 },
  },

  SpinEdit = {
    category = "Common", icon = "Edit",
    defaults = { Left = 24, Top = 24, Width = 90, Height = 28, Value = 0 },
  },

  FloatSpinEdit = {
    category = "Common", icon = "Edit",
    defaults = { Left = 24, Top = 24, Width = 100, Height = 28, Value = 0 },
  },

  DateEdit = {
    category = "Common", icon = "Edit",
    defaults = { Left = 24, Top = 24, Width = 120, Height = 28 },
  },

  TimeEdit = {
    category = "Common", icon = "Edit",
    defaults = { Left = 24, Top = 24, Width = 100, Height = 28 },
  },
}


M.categories = {
  {
    name = "Common", title = "Common", icon = "Button",
    items = {
      "Button", "SpeedButton", "BitBtn", "ToggleBox",
      "Label", "StaticText", "Edit", "SpinEdit", "FloatSpinEdit",
      "DateEdit", "TimeEdit", "CheckBox", "RadioButton", "ComboBox", "Memo",
    },
  },
  {
    name = "Containers", title = "Containers", icon = "Panel",
    items = { "Panel", "GroupBox", "ScrollBox", "RadioGroup", "Splitter" },
  },
  {
    name = "Lists / Data", title = "Lists / Data", icon = "ListView",
    items = { "ListBox", "TreeView", "ListView", "StringGrid" },
  },
  {
    name = "Visual", title = "Visual", icon = "Image",
    items = { "ProgressBar", "TrackBar", "Shape", "Image", "PaintBox" },
  },
}

M.order = {
  "Button", "SpeedButton", "BitBtn", "ToggleBox",
  "Label", "StaticText", "Edit", "SpinEdit", "FloatSpinEdit", "DateEdit", "TimeEdit",
  "CheckBox", "RadioButton", "RadioGroup",
  "Memo", "ComboBox", "ListBox", "StringGrid", "TreeView", "ListView",
  "Panel", "GroupBox", "ScrollBox", "Splitter",
  "ProgressBar", "TrackBar", "Shape", "Image", "PaintBox",
}

function M.get(className)
  return M.classes[className]
end

function M.creatableClasses(vcl)
  local result = {}
  for _, className in ipairs(M.order) do
    local def = M.classes[className]
    if def and def.creatable ~= false and (not vcl or vcl[className]) then
      table.insert(result, className)
    end
  end
  return result
end


local inheritColorClasses = {
  Label = true, StaticText = true, Edit = true, Memo = true,
  CheckBox = true, RadioButton = true, RadioGroup = true,
  ComboBox = true, ListBox = true, TreeView = true, ListView = true, StringGrid = true,
  Panel = true, GroupBox = true, ScrollBox = true,
}

function M.inheritsThemeColor(className)
  local def = M.classes[className]
  if def and def.inheritColor ~= nil then return def.inheritColor and true or false end
  return inheritColorClasses[className] and true or false
end

function M.defaultsFor(className, name)
  local def = M.classes[className] or {}
  local src = def.defaults or {}
  local out = {}
  for k, v in pairs(src) do
    if v == "$name" then out[k] = name else out[k] = v end
  end
  return out
end

function M.needsOriginalDragFallback(className)
  local def = M.classes[className]
  return def and def.originalDragFallback and true or false
end

function M.isContainer(className)
  local def = M.classes[className]
  return def and def.container and true or false
end

function M.isTabOrderable(className)
  local def = M.classes[className]
  if def and def.tabOrderable ~= nil then return def.tabOrderable and true or false end
  local no = {
    Label = true, StaticText = true, Shape = true, Image = true, PaintBox = true,
    ProgressBar = true, TrackBar = true, Form = true,
  }
  return not no[className]
end

function M.collectionsFor(className)
  local def = M.classes[className]
  return def and def.collections or nil
end

function M.firstCollectionName(className)
  local cols = M.collectionsFor(className)
  if not cols then return nil end
  local preferred = { "Items", "Lines" }
  for _, name in ipairs(preferred) do
    if cols[name] then return name, cols[name] end
  end
  for name, typ in pairs(cols) do return name, typ end
  return nil
end

function M.hasCollections(className)
  return M.firstCollectionName(className) ~= nil
end

return M
