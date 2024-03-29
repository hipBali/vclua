-- **************************************************** --
--                                                      --
-- VCLua 1.1 Class document generator                   --
--                                                      --
-- (C) 2018-2024 Hi-Project Ltd.                        --
--                                                      --
-- **************************************************** --
package.path=package.path..";?.lua;lua_make/?.lua;lua_make/lib/?.lua"

require "classdef"
require "template"
require "funcdef"
require "config"
require "log"

local file = require "file"

_logLevel = "ERROR"

local classTable = {}
local stage = "scan"
local doDoc = true

local classDoc = {}
local proc = {
	["public"] = function() 
			if stage=="parse" then 
				stage="fill" 
			end 
		end,
	["private"] =  function() 
			stage="parse" 
		end,
	["published"] =  function() 
			stage="parse" 
		end,
	["end"] =  function() 
			stage="scan"
			return 1
		end,
}

-- utilities ----------------------
local function loadTable( filename)
	local t = {}
    local file, errorString = io.open( filename, "r" )
    if file then
		while 1 do
			local l = file:read('*l')
			if l == nil then break end
			table.insert(t,l)
		end
        io.close( file )
        return t
    end
end

local function loadMap( filename)
	local t = {}
    local file, errorString = io.open( filename, "r" )
    if file then
		while 1 do
			local l = file:read('*l')
			if l == nil then break end
			t[l] = 1
		end
        io.close( file )
        return t
    end
end

function saveTextToFile(txt, fileName)
	local file, errorString = io.open(fileName, "w+b")
	if not file then
		cLog( "File error: " .. errorString, "ERROR" )
	else
		file:write(txt)
		file:flush()
		io.close(file)
		return true
	end
end

function string:trim()
 local s = self
 local from = s:match"^%s*()"
 return from > #s and "" or s:match(".*%S", from)
end

function string:split(sep)
   local sep, fields = sep or ":", {}
   local pattern = string.format("([^%s]+)", sep)
   self:gsub(pattern, function(c) fields[#fields+1] = c:trim() end)
   return fields
end

function table:sortByKey()
	local t = self
	local tkeys = {}
	for k in pairs(t) do table.insert(tkeys, k) end
	table.sort(tkeys)
	return tkeys
end

function removeInnerComment(l)
	local cstart = l:find("{")
	local cend = l:find("}")
	if cstart and cend then
		local ll =  l:sub(1,cstart-1)..l:sub(cend+1)
		if ll:len()>0 then
			return ll
		end
	end
	return l
end

function removeIfdef(str)
	local s1,_ = str:find("%{$IFDEF%s*%w+%}%w+")
	local _,l2 = str:find("%{$ENDIF%}")
	local s2 = str:find("%{$IFDEF")
	if s2 and str:upper():find("DEBUG") then
		return str:sub(1,s2-1)..str:sub(l2+1)
	end
	if s1 and l2 then
		return str:sub(1,s1-1)..str:sub(l2+1)
	else
		return str
	end
end

-- test against comments
function testCStart(l)
	local cstart = l:trim():find("{")
	if cstart then
		if l:sub(-1)=="}" then
			cLog(" ** SKIP LINE ".. l, "DEBUG")
			return 1
		elseif cstart==1 then
			cLog(" ** START SKIP 1 "..l..":"..cstart, "DEBUG")
			return 2
		end
	else
		cstart = l:gsub("^%s*", ""):find("//")
		if cstart then 
			return 1
		end
	end
	return 0
end

function testCEnd(l)
	local cend = l:trim():find("}")
	if cend then
		cLog(" ** STOP SKIP 1 ".. l, "DEBUG")
		return 1
	end
	return 0
end

-- parser ------------------------------------------
local function processClass(def,cdef)
	local processed
	local cname = cdef.name
	local skip
	local headers = {}
	local exclude = loadMap("exclude/"..cname)
	local excludeType = loadMap("exclude/VarTypes")
	for n, line in pairs(def) do
		-- find classdef
		local ln = {}
		local index = 1
		for value in string.gmatch(line, "%w+") do 
			ln[index] = value
			index = index + 1
		end
		-- test against 'set of', generate source from VCLUA_TOSET_TEMP
		local _,_,c,cc = line:find("(%a+)%s*=%s*set of%s*")
		if c then
			VCLUA_FROMLUA[c:lower()] = string.format(VCLUA_TOSET_TEMP,c,c)
			cLog(string.format("SET FOUND %s LINE:%d",c, n),"INFO")
		end
		-- parse class
		local _,_,c,cc = line:find("(%a+)%s*=%s*class%s*%((%a+)%)")
		if c==cdef.src then
			classTable[cname] = {} 
			cLog(string.format("PARSING %s %s LINE:%d",cname, c,n),"INFO")
			stage="parse"
			processed = true
		end
		if proc[ln[1]] then 
			if stage~="scan" and proc[ln[1]]()  then 
				break
			end
		end
		if stage=="fill" and classTable[cname] then
			if ln[1]=="procedure" or ln[1]=="function" then
				local mId = ln[1].." "..ln[2]
				if exclude and exclude[mId] then
					cLog(" ** EXCLUDE:"..mId, "DEBUG")
				else
					table.insert(headers,mId)
					-- test comment
					line = removeIfdef(line)
					line = removeInnerComment(line)
					local lt = testCStart(line)
					if skip then
						-- wait for end 
						if testCEnd(line)==1 then
							skip = nil
						end
					elseif lt == 0 then 
						local l = line:gsub("^%s*", ""):trim()
						-- join broken lines
						if line:find("%(") and line:find("%)")==nil then
							local m = n + 1
							local bl
							repeat 
								bl = def[m]:gsub("^%s*", "") -- :trim()
								l = l .. bl
								m = m + 1
							until bl:find("%)")
						end
						-- test exclusions
						local ok=true
						for k,_ in pairs(excludeType) do
							if l:find(k) then
								cLog(" ** EXCLUDED:"..l.." "..k, "DEBUG")
								ok = false
								break
							end
						end
						if ok then
							table.insert(classTable[cname],l)
						end
					elseif lt == 2 then
						skip = true
					end
				end
			end
		end
	end
	if processed then
		-- saveTextToFile(table.concat(classTable[cname],"\n"),"doc/"..cname..".txt")
	end
	return processed
end

function processParams(s)
	local vars,varlist,funcparams,out,def
	if s:find("%(") then
		vars={}
		varlist={}
		funcparams = {}
		out={}
		-- parse params, remove const flag
		local s = s:match("%(([^%)]+)%)"):gsub("const%s*",""):gsub("Const%s*","")
		-- test comma separated varlisting
		local tmp = s:split(";")
		local vart = {}
		for n,t in pairs(tmp) do
			local p = t:trim():split(":") -- varname:typedef
			-- untyped to pointer?
			if p[2] == nil then
				p[2] = "Pointer"
			end
			
			-- process list of variables
			local pp = p[1]:split(",")	-- var1, var2, ...
			-- copy prefix (out, var) to list elements
			local prefix = ""
			if #pp>1 then
				if pp[1]:find("out%s*") or pp[1]:find("Out%s*") then
					prefix ="out "
				elseif pp[1]:find("var%s*") or pp[1]:find("Var%s*") then
					prefix ="var "
				end
			end
			for i=1,#pp do
				if i>1 then pp[i] = prefix..pp[i] end
				table.insert(vart, pp[i]..":"..p[2])
			end
			
		end
		-- process params
		for n,t in pairs(vart) do
			local p = t:split(":")
			local varName = p[1]:gsub("var ",""):gsub("out ",""):gsub("Var ",""):gsub("Out ","")
			local varType = p[2]
			

			def = nil
			local pp = varType:split("=") 	-- remove default value
			if pp[2] then
				def=pp[2]:gsub("'","")
				if VCLUA_FROMLUA["def_"..pp[1]:trim():lower()]==nil then
					cLog(string.format(" ** TODO: DEFAULT VALUE ** %s %s %s",varName,varType,def),"INFO")
					
				end
			end
			varType = pp[1]:trim()

			-- should passed back?
			if p[1]:find("var%s+") or p[1]:find("out%s+") or p[1]:find("Var%s+") or p[1]:find("Out%s+") then
				table.insert(out, {name=varName, type=varType})
			else
				table.insert(vars, {name=varName, type=varType, value=def})
			end
			table.insert(funcparams, varName)
			table.insert(varlist, varName..":"..varType)
		end
	end
	return vars, varlist, funcparams, out
end

function createUnitBody(cdef, ref)
	local className = cdef.name
	local classBody = {} 
	local cMethods = {}
	local overLoads = {}
	classDoc[className] = classDoc[className] or {}
	classDoc[className]["reference"] = cdef.ref or cdef.name
	for _,method in pairs(classTable[className]) do
		-- parse params
		local tmp = method:match("%w+%s*%w+"):split(" ") -- type, methodname
		local mType = tmp[1]
		local mName = tmp[2]
		local ret, reto
		local retCount = 0
		local vars, varlist, funcparams, out = processParams(method)
		if mType=="function" then
			ret = method:split(":")
			reto = ret[#ret]:match("%w+")
			ret = reto:lower()
			retCount = 1
		end
		local s = VCLua_CDEF_LUAFUNC
		
		-- check overloaded methods
		local finalMethodName = mName
		local vcluaMethodName = finalMethodName
		if overLoads[mName] then
			finalMethodName = mName..overLoads[mName]
			vcluaMethodName = finalMethodName
		else
			local csens
			for n,_ in pairs(overLoads) do
				if n:lower()==mName:lower() then
					csens = true
					break
				end
			end
			if csens then
				vcluaMethodName = finalMethodName.."_"
			end
		end
		if overLoads[mName] then 
			overLoads[mName] = overLoads[mName] + 1
		else
			overLoads[mName] = 2
		end
		
		vcluaMethodName = "VCLua_"..className.."_"..vcluaMethodName
		
		s = s:gsub("#FNAME",vcluaMethodName):gsub("#CNAME",className)
		
		if vars then
			s = s:gsub("#VARS","\n\t"..table.concat(varlist,";\n\t"),1)
			-- processing parameters
			local varsFromLua = {}
			local idx = 1
			local defVars
			for n,p in pairs(vars) do
				local varName,varType,varValue = p.name,p.type,p.value
				ppp = varName:split(",")	-- var1, var2, ...
				for i=1,#ppp do
					idx = idx + 1
					varName = ppp[i]
					if varValue and VCLUA_FROMLUA["def_"..varType:lower()] then
						table.insert(varsFromLua,varName .. " := " .. VCLUA_FROMLUA["def_"..varType:lower()]:gsub("#IDX",idx):gsub("#DEF",varValue))
						defVars = true
					elseif VCLUA_FROMLUA[varType:lower()] then
						table.insert(varsFromLua,varName .. " := " .. VCLUA_FROMLUA[varType:lower()]:gsub("#",idx))
					else
						table.insert(varsFromLua,varName .. " := "..varType.."(GetLuaObject(L," .. idx .. "));" )
					end
				end
			end
			-- input params checking
			if defVars then
				s = s:gsub("#VARCOUNT",-1,1)
			else
				s = s:gsub("#VARCOUNT",idx,1)
			end
			s = s:gsub("#TOVCLUA","\n\t"..table.concat(varsFromLua,"\n\t"),1)
		else
			s = s:gsub("#VARS;","",1)
			s = s:gsub("#VARCOUNT",1,1)
			s = s:gsub("#TOVCLUA","",1)
		end
		-- additional outputs
		local outStr = {}
		if out and #out>0 then
			for i=1,#out do
				local rtype
				if VCLUA_TOLUA[out[i].type:lower():trim()] then
					rtype = VCLUA_TOLUA[out[i].type:lower():trim()]:gsub("ret",out[i].name) 
				else
					rtype = out[i].type:gsub("T","",1).."ToTable(L,-1,"..out[i].name..");"
				end
				table.insert(outStr, rtype)
				retCount = retCount + 1
			end
		end
		local fParams = ""
		if funcparams and #funcparams>0 then
			fParams = table.concat(funcparams,",")
		end
		if ret then
			local rtype = VCLUA_TOLUA[ret] or className.."ToTable(L,-1,ret);"
			s = s:gsub("#FUNC","\n\tret := l"..className.."."..mName.."("..fParams..");",1)
			s = s:gsub("#PUSHTOLUA","\n\t"..rtype,1)
			s = s:gsub("#PUSHOUTS","\n\t"..table.concat(outStr,"\t\n"))
			s = s:gsub("#RETVAR","\n\tret:"..reto,1)
			s = s:gsub("#RETCOUNT",retCount)
		else
			s = s:gsub("#FUNC","\n\tl"..className.."."..mName.."("..fParams..");",1)
			s = s:gsub("#PUSHTOLUA","",1)
			s = s:gsub("#PUSHOUTS","\n\t"..table.concat(outStr,"\n\t"))
			s = s:gsub("#RETVAR;","",1)
			s = s:gsub("#RETCOUNT",retCount,1)
		end
		table.insert(cMethods,"LuaSetTableFunction(L, Index, '"..finalMethodName.."', @"..vcluaMethodName..");")
		table.insert(classBody,s)
		classDoc[className][finalMethodName] = classDoc[className][finalMethodName] or {} 
		classDoc[className][finalMethodName]["params"] = fParams:len()>0 and fParams or nil
		classDoc[className][finalMethodName]["out"] = out
		classDoc[className][finalMethodName]["return"] = reto
		classDoc[className][finalMethodName]["reference"] = cdef.ref or ref
		classDoc[className][finalMethodName]["method"] = method	
	end
	
	-- check implemented methods
		if cdef.impl then
			fncs = cdef.impl:split(",")
			for f=1,#fncs do
				local t = function_defnitions[fncs[f]]
				if t and t.src then 
					local vcluaMethodName = "VCLua_"..className.."_"..t.vcluaMethodName
					cLog("#############  "..vcluaMethodName, "DEBUG")
					table.insert(cMethods,"LuaSetTableFunction(L, Index, '"..t.finalMethodName.."', @"..vcluaMethodName..");")
					local src = t.src:gsub("#FNAME", vcluaMethodName,1)
					table.insert(classBody,src)
				elseif t then
					cLog("#############  "..t.vcluaMethodName,"DEBUG")
					table.insert(cMethods,"LuaSetTableFunction(L, Index, '"..t.finalMethodName.."', @"..t.vcluaMethodName..");")
				else
					assert(nil,"Cannot implement "..tostring(fncs[f]))
				end
			end
		end
	-- concat body parts
	local ccreate
	local intface = VCLua_CDEF_INTFCE
	if cdef.nocreate then
		intface = VCLua_CDEF_INTFCE_NOCREATE
		ccreate = VCLua_CDEF_TOTABLE
	elseif cdef.nv then
		intface = VCLua_CDEF_INTFCE_NV
		ccreate = VCLua_CDEF_TOTABLE..VCLua_CDEF_FOOTER_NV
	elseif cdef.base then
		ccreate = VCLua_CDEF_TOTABLE..VCLua_CDEF_FOOTER_BASE
	elseif cdef.wclass then
		ccreate = VCLua_CDEF_TOTABLE..VCLua_CDEF_FOOTER_WCLASS
	else
		ccreate = VCLua_CDEF_TOTABLE..VCLua_CDEF_FOOTER
	end
	local pc = cdef.parentclass or "TWinControl"
	if cdef.noparent then
		ccreate = ccreate:gsub("l#CNAME.#PARENT","//")
	end
	ccreate = ccreate:gsub("#PARENTCLASS", pc):gsub("#PARENT","Parent")
	ccreate = ccreate:gsub("#CNAME",className)
	ccreate = ccreate:gsub("#CMETHODS",table.concat(cMethods,"\n\t"))
	ccreate = ccreate:gsub("#WCLASS",cdef.wclass or "nil")
	
	return table.concat(classBody,"\n"), ccreate, intface:gsub("#CNAME",className)
end

-- pascal source generator --------------------------
local cfile
for n,cdef in pairs(classes) do
	local ref
	if cdef.ref then
		ref = cdef.ref:split(",")
		ref = ref[1]
	else
		ref = "Default"
	end
	if fpcSrc[ref] ~= cfile then 
		cLog(ref.." "..fpcSrc[ref],"INFO")
		cfile = loadTable(fpcSrc[ref])
	end
	classTable = {}
	classData = {}
	local className
	if cdef.name then
		className = cdef.name
	-- single unit classes
		if processClass(cfile,cdef)==nil then 
			cLog("*CLASS NOT FOUND:"..cdef.name,"ERROR")
			break
		else
			local body,create,intf = createUnitBody(cdef, ref)
			table.insert(classData,{intf,body,create})
		end
	elseif cdef.classes and type(cdef.classes)=="table" then
		className = cdef.unit
	-- common unit classes
		for _,ccdef in pairs(cdef.classes) do
			local pc = processClass(cfile,ccdef)
			if pc==nil then 
				cLog("*CLASS NOT FOUND:"..ccdef.name,"ERROR")
				break
			end
			local body,create,intf = createUnitBody(ccdef, ref)
			table.insert(classData,{intf,body,create})
		end
	else
		cLog("*ERROR READING CONFIG AT LINE :"..n,"ERROR")
		break
	end
	-- export ------------------------------------
	local classSource = HDR_INFO .. VCLua_CLASSDEF
	if cdef.nv then
		classSource = HDR_INFO .. VCLua_CLASSDEF_NV
	end
	classSource = classSource:gsub("#CNAME",className)
	if cdef.ref then
		cdef.ref = cdef.ref:gsub("Default?,%s+","")
		classSource = classSource:gsub("#REF",", "..cdef.ref)
	else
		classSource = classSource:gsub("#REF","")
	end
	local intf, body, create = {},{},{}
	-- manual code to include
	if cdef.include then
		table.insert(body,cdef.include)
	end
	for _,cdata in pairs(classData) do
		table.insert(intf,cdata[1])
		table.insert(body,cdata[2])
		table.insert(create,cdata[3])
	end
	classSource = classSource:gsub("#INTFCE",table.concat(intf,"\n"))
	classSource = classSource:gsub("#BODY",table.concat(body,"\n"))
	classSource = classSource:gsub("#CREATE",table.concat(create,"\n"))
	-- saveTextToFile(classSource,"src/components/Lua"..className..".pas")
end


ctrls = {}
-- finalize --------------------------
-- generate vcl.inc
local vclinc = VCLUA_INC
local pasSrc={}
local luaLibs={}
local pasRefs = {}
local luaobject_push = {}
local libcount = 0
local function processCdef(cdef)
  local pName = cdef.name
  local s = VCLUA_OBJECT_PUSH:gsub("#CNAME",pName)
  table.insert(luaobject_push, s)
  if cdef.nocreate==nil then
    table.insert(luaLibs, "(name:'"..pName.."'; func:@Create"..pName.."),")
    libcount = libcount + 1
  end
end
for n,cdef in pairs(classes) do
	-- collect refs
	if cdef.ref then
		local p = cdef.ref:split(",")
		for i,_ in pairs(p) do
			pasRefs[p[1]:trim()] = 1
		end
	end
	local lName = "Lua"..(cdef.name or cdef.unit)
	if cdef.classes then
		for _,cn in pairs(cdef.classes) do
			processCdef(cn)
		end
	else
		processCdef(cdef)
	end
	pasRefs[lName]=1
	table.insert(pasSrc, lName .." in '"..lName..".pas'") 
end
local luaobject_uses = {}
for u,_ in pairs(pasRefs) do
	table.insert(luaobject_uses, u)
end
table.sort(luaobject_uses)

htmltemp = [[
<!DOCTYPE html>
<html>
<head>
<style>
	.class {
	  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	  border-collapse: collapse;
	  width: 100%;
	}
	.method {
	  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	  border-collapse: collapse;
	  padding-left: 20px;
	  width: 100%;
	}
	.props {
	  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	  border-collapse: collapse;
	  padding-left: 20px;
	  width: 100%;
	}
	.propsdata {
	  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	  border-collapse: collapse;
	  padding-left: 40px;
	  width: 100%;
	}
</style>
<H2>VCLua Class Reference</H2>
<H3>version 0.9.2</H3>
</head>
<body>
<hr>

]]

htmltempend = [[  

</body>
</html>
]]


local vcl = require "vcl.core"

-- test classes
local str = vcl.Stream()
local t_image = vcl.Image()
local LUA_image = [[36040000424D36040000000000003600000028000000100000001000000001002000000000000004000064000000640000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF800000FF800000FF800000FF800000FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FFFFFFFFFFFFFFFFFFFFFFFFFF808080FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF808080FFFFFFFFFFFFFFFFFF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FFFFFFFFFFFFFFFFFF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FFFFFFFFFFFFFFFFFF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FFFFFFFFFFFFFFFFFF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF808080FFF7F7F7FFF7F7F7FF808080FF800000FF800000FFFFFFFFFFFFFFFFFF808080FF800000FF800000FF800000FF800000FF800000FF800000FF800000FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FF800000FF808080FFFFFFFFFFFFFFFFFFFFFFFFFF800000FF800000FF800000FF800000FF800000FF800000FF800000FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FF800000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF800000FF800000FF800000FF800000FF800000FF800000FF808080FFF7F7F7FFF7F7F7FF808080FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF808080FFC0C0C0FF800000FF800000FFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF800000FF800000FF800000FF800000FF808080FFFFFFFFFFFFFFFFFF800000FF800000FF800000FF800000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000FF800000FF800000FF800000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FF800000FF800000FFC0C0C0FF]]
local ss = str.LoadFromHex(LUA_image:sub(9))
t_image.picture:LoadFromStream(ss) 
local t_label = vcl.Label()
local t_canvas = t_label.canvas
local t_combo = vcl.ComboBox()
local t_listview = vcl.ListView()
local li = t_listview.items:Add()
local t_statuspanels = vcl.StatusBar().panels

print(t_label.classname)
print(t_label.canvas)

local exl = {
	TextStrings = vcl.Memo().lines,
	GridColumns = vcl.DrawGrid().columns,
	GridColumn = vcl.DrawGrid().columns:Add(),
	TreeNode = vcl.TreeView().items:Add(nil,"Hello"),
	TreeNodes = vcl.TreeView().items,
	Image = t_image,
	Picture = t_image.picture,
	Graphic = t_image.picture.graphic,
	Bitmap = t_image.picture.bitmap,
	Canvas = t_canvas,
	Brush = t_canvas.brush,
	Pen = t_canvas.pen,
	Font = t_label.font,
	Strings = t_combo.items,
	ListItems = t_listview.items,
	ListItem = li,
	StatusPanels = t_statuspanels,
	StatusPanel = t_statuspanels:Add(),
}

local refs = {}
local docs = {}
local sortedDocs = table.sortByKey(classDoc)

for _,c in pairs(sortedDocs) do
	-- CLASS
	-- print("Class:",c)
	if vcl[c] or exl[c] then
		local obj
		if not exl[c] then
			obj = vcl[c]()
		else -- if c~= "TreeNode" then
			obj = exl[c]
		end
		if obj then
			table.insert(refs, string.format('<a href="#%s"><div class="class"><b><u>%s</u></b></div></a>',c,c))
			table.insert(docs, string.format('<a id="%s"><div class="class"><b><u>%s</u></b></div></a>',c,c))

			local t = vcl.ListProperties(obj)
			if t then
				local tt = table.sortByKey(t)
				table.insert(docs, '<div class="props"><b><i>Properties</i></b></div>')	
				for q,p in pairs(tt) do
					-- PROPERTIES
					table.insert(docs, string.format('<div class="propsdata"><i>%s</i> : %s</div>',p,t[p]))
				end
			else
				print("NOPROP",c)
			end
			
			-- METHOD
			local t = table.sortByKey(classDoc[c])
			local funcs = {}
			if #t>0 then
				for k,v in pairs(t) do
					if type(classDoc[c][v].method) == "string" then
						table.insert(funcs,classDoc[c][v].method)
					end
				end
			end
			if #funcs>0 then
				table.insert(docs, '<div class="props"><b><i>Functions</i></b></div>')	
				for k,v in pairs(funcs) do
					table.insert(docs, string.format('<div class="propsdata"><i>%s</i></div>',v))
				end
			end

		end					
	else
		print(c)
	end
end

table.insert(refs, '<hr>')
local html = htmltemp..table.concat(refs,"\n")..table.concat(docs,"\n")..htmltempend 
file.save("vclua_ref.html",html)

