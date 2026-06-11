-- ***************************************
-- Export wizard dialog
-- ***************************************

local formLoader = require "form_loader"

local M = {}

local MR_CANCEL = 2

local function scriptDirectory()
  local source = debug.getinfo(1, "S").source or ""
  source = source:gsub("^@", "")
  return source:match("^(.*[/\\])") or ""
end

local function trim(value)
  value = tostring(value or "")
  return value:match("^%s*(.-)%s*$") or value
end

local function setEnabled(control, enabled)
  if control then pcall(function() control.Enabled = enabled and true or false end) end
end

local function setVisible(control, visible)
  if control then pcall(function() control.Visible = visible and true or false end) end
end

local function setText(control, value)
  if control then pcall(function() control.Text = tostring(value or "") end) end
end

local function getText(control)
  local value = ""
  if control then pcall(function() value = tostring(control.Text or "") end) end
  return trim(value)
end

local function setChecked(control, checked)
  if control then pcall(function() control.Checked = checked and true or false end) end
end

local function getChecked(control)
  local value = false
  if control then pcall(function() value = control.Checked and true or false end) end
  return value
end

local function setItemIndex(control, index)
  if control then pcall(function() control.ItemIndex = index end) end
end

local function getItemIndex(control)
  local value = 0
  if control then pcall(function() value = tonumber(control.ItemIndex) or 0 end) end
  return value
end

local function setMemoLines(memo, lines)
  local stringsObj
  pcall(function() stringsObj = memo.Lines end)
  if not stringsObj then return end
  pcall(function() stringsObj:Clear() end)
  for _, line in ipairs(lines or {}) do
    pcall(function() stringsObj:Add(tostring(line or "")) end)
  end
end

local function modeFlags(index)
  return index ~= 1, index ~= 0
end

local function replaceExtension(fileName, extension)
  local base = tostring(fileName or ""):gsub("%.[^./\\]+$", "")
  if base == "" then base = "form1" end
  return base .. extension
end

local function readConfig(ui)
  local modeIndex = getItemIndex(ui.ExportModeCombo)
  local exportLua, exportJson = modeFlags(modeIndex)
  return {
    modeIndex = modeIndex,
    exportLua = exportLua,
    exportJson = exportJson,
    moduleName = getText(ui.ModuleNameEdit),
    outputFile = getText(ui.OutputFileEdit),
    jsonFile = getText(ui.JsonFileEdit),
    generateEvents = exportLua and getChecked(ui.GenerateEventsCheck),
    eventsFile = getText(ui.EventsFileEdit),
    generateRunner = exportLua and getChecked(ui.GenerateRunnerCheck),
    runnerFile = getText(ui.RunnerFileEdit),
    embedResources = exportLua and getChecked(ui.EmbedResourcesCheck),
    resourcesFile = replaceExtension(getText(ui.OutputFileEdit), "_resources.lua"),
  }
end

local function validate(config)
  if config.exportLua then
    if config.moduleName == "" then return false, "Module name is required." end
    if not config.moduleName:match("^[A-Za-z_][A-Za-z0-9_]*$") then
      return false, "Module name must be a valid Lua identifier."
    end
    if config.outputFile == "" then return false, "Lua module file is required." end
    if config.generateEvents and config.eventsFile == "" then
      return false, "Event skeleton file is required."
    end
    if config.generateRunner and config.runnerFile == "" then
      return false, "Runner file is required."
    end
  end
  if config.exportJson and config.jsonFile == "" then
    return false, "JSON file is required."
  end
  return true
end

local function summaryLines(config)
  local lines = {}
  table.insert(lines, "Lua module")
  if config.exportLua then
    table.insert(lines, "  " .. config.outputFile)
    table.insert(lines, "  overwrite: yes")
  else
    table.insert(lines, "  not generated")
  end
  table.insert(lines, "")
  table.insert(lines, "JSON")
  if config.exportJson then
    table.insert(lines, "  " .. config.jsonFile)
    table.insert(lines, "  overwrite: yes")
  else
    table.insert(lines, "  not generated")
  end
  table.insert(lines, "")
  table.insert(lines, "Image resources")
  if config.embedResources then
    table.insert(lines, "  " .. config.resourcesFile)
    table.insert(lines, "  overwrite: yes")
  else
    table.insert(lines, "  external files")
  end
  table.insert(lines, "")
  table.insert(lines, "Event skeleton")
  if config.generateEvents then
    table.insert(lines, "  " .. config.eventsFile)
    table.insert(lines, "  overwrite: no")
  else
    table.insert(lines, "  not generated")
  end
  table.insert(lines, "")
  table.insert(lines, "Runner")
  if config.generateRunner then
    table.insert(lines, "  " .. config.runnerFile)
    table.insert(lines, "  overwrite: no")
  else
    table.insert(lines, "  not generated")
  end
  return lines
end

function M.open(ctx, defaults)
  ctx = ctx or {}
  defaults = defaults or {}

  local loaded = formLoader.load(scriptDirectory() .. "../forms/export_wizard.vclform")
  local form = loaded.ui.ExportWizardDialog or loaded.form
  local ui = loaded.ui
  if not form then error("Export wizard form not found") end

  setText(ui.ModuleNameEdit, defaults.moduleName or "form1")
  setText(ui.OutputFileEdit, defaults.outputFile or "form1.lua")
  setText(ui.JsonFileEdit, defaults.jsonFile or "form1.json")
  setText(ui.EventsFileEdit, defaults.eventsFile or "form1_events.lua")
  setText(ui.RunnerFileEdit, defaults.runnerFile or "run.lua")
  setItemIndex(ui.ExportModeCombo, tonumber(defaults.modeIndex) or 0)
  setChecked(ui.GenerateEventsCheck, defaults.generateEvents ~= false)
  setChecked(ui.GenerateRunnerCheck, defaults.generateRunner ~= false)
  setChecked(ui.EmbedResourcesCheck, defaults.embedResources ~= false)

  local pageIndex = 0
  local result

  local function updateModeState()
    local exportLua, exportJson = modeFlags(getItemIndex(ui.ExportModeCombo))
    setEnabled(ui.ModuleNameEdit, exportLua)
    setEnabled(ui.OutputFileEdit, exportLua)
    setEnabled(ui.BrowseOutputButton, exportLua)
    setEnabled(ui.JsonFileEdit, exportJson)
    setEnabled(ui.BrowseJsonButton, exportJson)
    setEnabled(ui.GenerateEventsCheck, exportLua)
    setEnabled(ui.GenerateRunnerCheck, exportLua)
    setEnabled(ui.EmbedResourcesCheck, exportLua)

    local eventsEnabled = exportLua and getChecked(ui.GenerateEventsCheck)
    local runnerEnabled = exportLua and getChecked(ui.GenerateRunnerCheck)
    setEnabled(ui.EventsFileEdit, eventsEnabled)
    setEnabled(ui.BrowseEventsButton, eventsEnabled)
    setEnabled(ui.RunnerFileEdit, runnerEnabled)
    setEnabled(ui.BrowseRunnerButton, runnerEnabled)
  end

  local function updatePage()
    pcall(function() ui.WizardPages.PageIndex = pageIndex end)
    setEnabled(ui.BackButton, pageIndex > 0)
    setVisible(ui.NextButton, pageIndex < 2)
    setVisible(ui.ExportButton, pageIndex == 2)
    if pageIndex == 2 then
      setMemoLines(ui.SummaryMemo, summaryLines(readConfig(ui)))
    end
  end

  if ui.ExportModeCombo then ui.ExportModeCombo.OnChange = updateModeState end
  if ui.GenerateEventsCheck then ui.GenerateEventsCheck.OnClick = updateModeState end
  if ui.GenerateRunnerCheck then ui.GenerateRunnerCheck.OnClick = updateModeState end

  if ui.BackButton then
    ui.BackButton.OnClick = function()
      if pageIndex > 0 then pageIndex = pageIndex - 1 end
      updatePage()
    end
  end

  if ui.NextButton then
    ui.NextButton.OnClick = function()
      local config = readConfig(ui)
      local ok, err = validate(config)
      if pageIndex == 0 and not ok then
        if ctx.showMessage then ctx.showMessage(err) end
        return
      end
      if pageIndex < 2 then pageIndex = pageIndex + 1 end
      updatePage()
    end
  end

  if ui.ExportButton then
    ui.ExportButton.OnClick = function()
      local config = readConfig(ui)
      local ok, err = validate(config)
      if not ok then
        if ctx.showMessage then ctx.showMessage(err) end
        return
      end
      result = config
      pcall(function() form.ModalResult = 1 end)
    end
  end

  if ui.CancelButton then
    pcall(function() ui.CancelButton.ModalResult = MR_CANCEL end)
    pcall(function() ui.CancelButton.Cancel = true end)
  end

  updateModeState()
  updatePage()

  local ok, err = pcall(function() form:ShowModal() end)
  if not ok then error(err) end
  return result
end

return M
