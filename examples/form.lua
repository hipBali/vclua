-- ***************************************
-- VCLua form example
-- Copyright (C) 2006-2023 Hi-Project Ltd.
-- ***************************************
VCL = require "vcl.core"
VCL.Application():Initialize()
local mainFrm = VCL.Form(nil,'mainForm',{
	Caption='VCLua Form example',
	Width=640,
	Height=480,
	Position="poScreenCenter",
})
local mainPanel = VCL.Panel(mainFrm,'mainPanel',{
	Caption='Hello world!',
	Align='alClient',
})
local bottomPanel = VCL.Panel(mainFrm,'bottomPanel')
bottomPanel._ = {
	Caption=string.format('%s v%s', VCL._NAME, VCL._VERSION),
	Align='alBottom',
	Height=40,
}
mainFrm:ShowModal()
