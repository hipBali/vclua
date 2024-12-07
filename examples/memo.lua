local VCL = require "vcl.core"

VCL.Application():Initialize()

local form = VCL.Form(nil,'myForm')
local memo = VCL.Memo(form,'myMemo')

memo.Lines:Clear()  
memo.Lines:Add('Hello world')  
memo.Lines:Add('Second line...') 
memo.Lines:Add('Third line...')

VCL.ShowMessage(memo.lines:GetText())

memo.lines:Insert(2,"Oops")

VCL.ShowMessage(memo.lines:GetText())
