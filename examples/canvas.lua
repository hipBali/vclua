-- ***************************************
-- VCLua canvas example
-- Copyright (C) 2006-2023 Hi-Project Ltd.
-- ***************************************
VCL = require "vcl.core"
VCL.Application():Initialize()

local mainFrm = VCL.Form(nil,'mainForm',{
	Caption='VCLua Canvas example',
	Width=640,
	Height=480,
	Position="poScreenCenter",
})

local function onPaint(sender)
	local Canvas = sender.Canvas
	Canvas.Brush.Color = 0x22DD44
	Canvas.Brush.Style = 'bsSolid'
	Canvas:Rectangle(100,50,160,110)
end

mainFrm.OnPaint = onPaint

mainFrm:ShowModal()
