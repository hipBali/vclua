-- ***************************************
-- VCLua menu example
-- Copyright (C) 2006-2023 Hi-Project Ltd.
-- ***************************************
VCL = require "vcl.core"
VCL.Application():Initialize()

local mainForm = VCL.Form(nil, { 
	caption = 'Drop files example',
	height=400, width=600, allowdropfiles="true"})
local memo = VCL.Memo(mainForm,{align = "alClient", })			
memo.lines:Add("Drop file(s) here!")
	
mainForm.OnDropFiles = function(sender,f)
	memo.lines:Clear()
	if type(f)=="table" then
		for k,v in pairs(f) do
			memo:Append(v)
		end
	elseif type(f)=="string" then
		memo:Append(f)
	end
end

mainForm:ShowModal()