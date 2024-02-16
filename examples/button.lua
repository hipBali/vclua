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
	BorderWidth=5,
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
	end,
	OnMouseUp = function(b, _, _, x, y)
		local p = {x=x,y=y}
		-- test a method with optional parameter, these 3 are equal per LCL docs
		print(b:ClientToParent(p).x, 'no param')
		print(b:ClientToParent(p, nil).x, 'nil')
		print(b:ClientToParent(p, b.Parent).x, 'b.parent')
		-- any method can receive objects without cast to parameter type
		-- mainPanel is the same b.Parent but of more concrete type, so the result is the same
		print(b:ClientToParent(p, mainPanel).x, 'mainPanel')
		-- this should produce an integer larger than previous integers by 5 (BorderWidth)
		print(b:ClientToParent(p, mainFrm).x, 'mainFrm')
		-- uncomment to see exception handling
		-- print(b:ClientToParent(p, bottomPanel).x, 'bottomPanel')
	end
}

bottomPanel._ = {
	caption=string.format('%s  Version: %s', VCL._DESCRIPTION, VCL._VERSION),
	align='alBottom',
	height=40,
}

mainFrm:ShowModal()
