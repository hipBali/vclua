-- ***************************************
-- VCLua form example
-- Copyright (C) 2006-2024 Hi-Project Ltd.
-- ***************************************
VCL = require "vcl.core"
VCL.TheApplication():Initialize()

local mainFrm = VCL.Form(nil,'mainForm',{
	Caption='VCLua Splitter example',
	Width=640,
	Height=480,
	Position="poScreenCenter",
})
local mainPanel = VCL.Panel(mainFrm,'mainPanel',{
	Caption='Hello world!',
	Align='alClient'
})
local splitterMain = VCL.Splitter(mainFrm,'mainSplitter', {
	Align = 'alBottom'
})
local bottomPanel = VCL.Panel(mainFrm,'bottomPanel', {
	Align='alBottom',
	Height=100
})
local leftPanel = VCL.Panel(bottomPanel,'leftPanel', {
	Align='alLeft', Caption=''
})
local splitterBottom = VCL.Splitter(bottomPanel,'bottomSplitter', {
	Align = 'alLeft',
	Left = leftPanel.left + 1
})
local rightPanel = VCL.Panel(bottomPanel,'rightPanel', {
	Align='alClient', Caption=''
})


mainFrm:ShowModal()
