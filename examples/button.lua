-- ***************************************
-- VCLua button example
-- Copyright (C) 2006-2023 Hi-Project Ltd.
-- ***************************************
VCL = require "vcl.core"
VCL.Application():Initialize()

local mainFrm = VCL.Form(nil,'mainForm')
local mainPanel = VCL.Panel(mainFrm,'mainPanel')
local button = VCL.Button(mainPanel,'button')
local bottomPanel = VCL.Panel(mainFrm,'bottomPanel')

mainFrm._ = {
	caption='VCLua Button example',
	width=640,
	height=480,
	position="poScreenCenter",
}

mainPanel._ = {
	caption='',
	align='alClient',
}

button._ = {
	caption='Click Me...',
	top=200,
	left=300,
	onClick = function(b)
		VCL.ShowMessage('Hello world!')
		b.caption = 'Clicked!'
	end
}

bottomPanel._ = {
	caption=string.format('%s  Version: %s', VCL._DESCRIPTION, VCL._VERSION),
	align='alBottom',
	height=40,
}

mainFrm:ShowModal()
