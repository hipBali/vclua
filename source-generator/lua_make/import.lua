-- **************************************************** --
--                                                      --
-- VCLua 1.1 Class source generator                     --
--                                                      --
-- (C) 2018-2024 Hi-Project Ltd.                        --
--                                                      --
-- **************************************************** --
package.path=package.path..";?.lua;lua_make/?.lua;lua_make/lib/?.lua"
-- package.cpath=package.cpath..";clibs/?.dll;clibs/?.so"

-- when true generates code which would not compile if some pushed type isn't supported
-- when false the error detection is deferred to runtime, but no change is needed to add more sources
checkTypeSupport = arg[1] or false

require "classdef"
require "template"
require "funcdef"
require "config"
require "log"
local file = require "file"

_logLevel = "INFO"

local out_path = "../"

local classTable = {}
local stage = "scan"

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

local function propertyToProc(decl)
  -- parsing 'property ident([indexing])?: type (read ident)? (write ident)? .* (default;)?
  local propName, indexing, m, typeName
  local canRead, canWrite = false, false
  local _, n = decl:find('%a+%s+') -- skip 'property'
  _, n, propName = decl:find('([_%w]+)', n + 1)
  _, m, indexing = decl:find('%[([^]]+)%]', n + 1)
  if not indexing then m = n end
  _, n = decl:find(':%s*', m + 1)
  if not n then return nil end -- no support for property override
  _, n, typeName = decl:find('([_%w]+)', n + 1)
  _, m = decl:find('[^_%w][rR]ead%s+[_%w]+', n + 1)
  if m then canRead = true else m = n end
  _, n = decl:find('[^_%w][wW]rite%s+[_%w]+', m + 1)
  if n then canWrite = true else n = m end
  _, n = decl:find('[^_%w][dD]efault%s*;', n + 1)
  return {method=("procedure %s(%svar ret:%s)"):format(propName, indexing and (indexing..'; ') or '', typeName),
    propInfo = {r=canRead,w=canWrite,d=n~=nil,i=indexing~=nil}}
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

local excludeType = loadMap("exclude/VarTypes")
local function inferTypeKindFromLine(n, line, cfile, ref)
  local _, pos, typename = line:find("^%s*(T[_%w]+)%s*=%s*")
  if not pos or excludeType[typename] then return end
  local c = typename:lower()
  typeRef[c] = ref
  if pos == #line then
    -- declaration starts on another string as in GraphType
    local m = n + 1
    while cfile[m] == '' do m = m + 1 end
    line = line..cfile[m]
  end
  pos = pos + 1
  if line:find("^%s*set%s+of%s*",pos) then
    cLog(string.format("SET FOUND %s LINE:%d", typename, n),"INFO")
    VCLUA_FROMLUA[c] = VCLUA_TOSET
    if VCLUA_ES_CHECK then
      VCLUA_ES_CHECK[c] = true
      VCLUA_TOLUA[c] = VCLUA_TOLUA_FULL
    end
  else
    local _,_,cc = line:find("^%s*array%s+of%s+([_%w]+)",pos)
    if cc then
      VCLUA_FROMLUA[c] = VCLUA_TOARRAY:gsub("#TYP",cc,1)
      VCLUA_TOLUA[c] = VCLUA_PUSHARRAY:gsub("#TYP",cc,1)
      cLog(string.format("ARRAY FOUND %s LINE:%d", typename, n),"INFO")
    elseif line:find("^%s*%(",pos) then
      cLog(string.format("ENUM FOUND %s LINE:%d %s", typename, n, line),"INFO")
      if VCLUA_ES_CHECK then
        VCLUA_ES_CHECK[c] = true
        VCLUA_FROMLUA[c] = VCLUA_FROMLUA_FULL
        VCLUA_TOLUA[c] = VCLUA_TOLUA_FULL
      end
    end
  end
end

local excludeFuncs = loadMap("exclude/AnyClass")
local initedSrcs = {}
local parsedRefs = {}
-- parser ------------------------------------------
local function processClass(def,cdef,ref)
	local processed
	local cname = cdef.name
	local skip
	local exclude = loadMap("exclude/"..cname) or {}
	for k, v in pairs(excludeFuncs) do exclude[k] = v end
	local reparse = cdef.reparse or not parsedRefs[ref]
	if reparse then cLog('Reparsing '..ref, 'DEBUG') end
	parsedRefs[ref] = true
	local refd = ref ~= 'Default' and ref or nil

	local function processLine(n, line)
		-- find classdef
		local ln = {}
		local index = 1
		for value in string.gmatch(line, "%w+") do 
			ln[index] = value
			index = index + 1
		end
		if not ln[1] then return false end
		if reparse then inferTypeKindFromLine(n, line, def, refd) end
		-- parse class
		local _,_,c = line:find("([_%w]+)%s*=%s*class%s*%([_%w]+%s*")
		if c==cdef.src then
			classTable[cname] = {}
			cLog(string.format("PARSING %s %s LINE:%d",cname, c,n),"INFO")
			stage="parse"
			processed = true
		end
		local lword = ln[1]:lower()
		if proc[lword] and stage~="scan" and proc[lword]() then
			return true
		end
		if stage=="fill" and classTable[cname] then
			local isProp = lword=="property"
			if lword=="procedure" or lword=="function" or isProp then
				local mId = lword.." "..ln[2]
				if exclude[mId] then
					cLog(" ** EXCLUDE:"..mId, "DEBUG")
				else
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
						local function appendUntil(pattern, sep)
							local m = n + 1
							local bl
							repeat 
								bl = def[m]:gsub("^%s*", "") -- :trim()
								l = l .. ' ' .. bl
								m = m + 1
							until bl:find(pattern)
						end
						if isProp and line:find(";") == nil then
							appendUntil(';')
						elseif line:find("%(") and line:find("%)")==nil then
							appendUntil("%)")
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
						local propDesc
						if isProp then
							if ln[2]:find('^On%S') then ok = false
							else
								propDesc = propertyToProc(l)
								if not propDesc or not propDesc.propInfo.i then ok = false end
							end
						end
						if ok then
							table.insert(classTable[cname],not isProp and {method=l} or propDesc)
						end
					elseif lt == 2 then
						skip = true
					end
				end
			end
		end
		return false
	end
	for n, line in pairs(def) do
		if (processLine(n, line) and not reparse) or line == 'implementation' then break end
	end
	return processed
end

function processParams(md)
	local vars,varlist,funcparams,out,def,types,pushTypes
	vars={{}}
	types,pushTypes={},{}
	local s = md.method
	if s:find("%(") then
		vars[2] = {}
		varlist={}
		funcparams = {}
		out={}
		-- parse params, remove const flag
		local s = s:match("%(([^%)]+)%)"):gsub("[cC]onst%s+","")
		-- test comma separated varlisting
		local tmp = s:split(";")
		local vart = {}
		for n,t in pairs(tmp) do
			local p = t:split(":") -- varname:typedef
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
				def=pp[2]
			end
			varType = pp[1]
			types[varType] = true

			-- should passed back?
			local isVar = p[1]:find("[vV]ar%s+")
			local isOut = p[1]:find("[oO]ut%s+")
			if isVar or isOut then
				table.insert(out, {name=varName, type=varType})
				pushTypes[varType] = true
			end
			-- var parameters can actually be required, e.g. in TCustomDrawGrid.DefaultDrawCell, TCustomListBox.MeasureItem
			-- so provide an overload
			if not isOut then
				if not isVar then
					table.insert(vars[1], {name=varName, type=varType, value=def})
				end
				table.insert(vars[2], {name=varName, type=varType, value=def})
			end
			table.insert(funcparams, varName)
			table.insert(varlist, varName..":"..varType)
		end
	end
	if vars[2] then
		if #vars[2] == #vars[1] then
			vars[2] = nil
		elseif md.propInfo then
			vars[1] = vars[2]
			vars[2] = nil
		end
	end
	return vars, varlist, funcparams, out, types, pushTypes
end

local function getPropTempl(pi)
  return pi.r and (pi.w and VCLua_PROP or VCLua_PROP_READ) or VCLua_PROP_WRITE
end

function createUnitBody(cdef, ref, refs)
	local className = cdef.name
	local classBody = {} 
	local cMethods = {}
	local mIdx = 0
	local overLoads = {}
	local src = cdef.src:sub(2)
	local initSrc = not initedSrcs[src]
	if not initSrc then cLog("###  skipping init of src "..src, "DEBUG") end
	local initFmt = src.."Funcs[%d].name:='%s';\n\t"..src.."Funcs[%d].func:=@%s;"
	local function addMethod(finalMethodName,vcluaMethodName)
			if initSrc then
				table.insert(cMethods,string.format(initFmt,mIdx,finalMethodName,mIdx,vcluaMethodName))
				mIdx=mIdx+1
			end
	end
	-- parenting needs TWinControl
	if not cdef.nocreate then refs['Controls'] = true end
	local function updRef(tp, pushed)
		typ = tp:lower()
		local r
		if pushed then r = vcluaTypeRef[typ] else r = typeRef[typ] end
		if r and not refs[r] then
			refs[r] = true
			cLog('Adding '..r..' to refs because of '..tp..' in '..className, 'INFO')
		end
	end
	classDoc[className] = classDoc[className] or {}
	classDoc[className]["reference"] = cdef.ref or cdef.name
	for _,md in pairs(classTable[className]) do
		-- parse params
		local method = md.method
		local pi = md.propInfo
		local setProp, retProp
		local tmp = method:match("%w+%s*%w+"):split(" ") -- type, methodname
		local mType = tmp[1]:lower()
		local mName = tmp[2]
		local ret, reto
		local retCount = 0
		local vars, varlist, funcparams, out, mtypes, pushTypes = processParams(md)
		for typ,_ in pairs(mtypes) do updRef(typ) end
		for typ,_ in pairs(pushTypes) do updRef(typ, true) end
		if mType=="function" then
			ret = method:split(":")
			reto = ret[#ret]:match("%w+")
			updRef(reto)
			updRef(reto, true)
			ret = reto:lower()
			retCount = 1
		end
		-- additional outputs
		local outStr = {}
		if out and #out>0 then
			for i=1,#out do
				local rtype = (VCLUA_TOLUA[out[i].type:lower():trim()] or VCLUA_TOLUA_DEFAULT):gsub("#VAR",out[i].name)
				table.insert(outStr, rtype)
				retCount = retCount + 1
			end
		end
		if pi then
			assert(#vars==1)
			-- last param has special treatment
			table.remove(funcparams)
			retProp = table.remove(outStr)
		end
		local fParams = table.concat(funcparams or {},",")
		local maybeTempVars = {}
		if cdef.allowtemps and cdef.allowtemps[mName] then
			maybeTempVars = cdef.allowtemps[mName]:split(',')
			for _,v in ipairs(maybeTempVars) do
				table.insert(varlist, v..'NeedsFree:Boolean = False')
				table.insert(outStr, 'if '..v..'NeedsFree then '..v..'.Free;')
			end
		end

    for _,vv in ipairs(vars) do
      local s = VCLua_CDEF_LUAFUNC

      -- check overloaded methods
      local finalMethodName = mName
      local vcluaMethodName = finalMethodName
      local mnLower = mName:lower()
      if overLoads[mnLower] then
        finalMethodName = mName..overLoads[mnLower]
        vcluaMethodName = finalMethodName
        overLoads[mnLower] = overLoads[mnLower] + 1
        if pi then cLog('WARNING: property '..className..'.'..mName..' is overloaded', 'INFO') end
      else
        overLoads[mnLower] = 2
      end

      vcluaMethodName = "VCLua_"..className.."_"..vcluaMethodName

      s = s:gsub("#FNAME",vcluaMethodName):gsub("#CNAME",className)

      local idx = 1
      if varlist then
        s = s:gsub("#VARS","\n\t"..table.concat(varlist,";\n\t"),1)
        -- processing parameters
        local varsFromLua = {}
        local defVars
        for n,p in ipairs(vv) do
          local varName,varType,varValue = p.name,p.type,p.value
          idx = idx + 1
          local vtLower = varType:lower()
          local templ
          for _,v in ipairs(maybeTempVars) do
            if varName == v then templ = VCLUA_FROMLUA_TEMP:gsub('#PROC',VCLUA_FROMLUA_TEMP_MAP[vtLower]) end
          end
          if varValue then
            templ = templ or (not VCLUA_ES_CHECK or VCLUA_ES_CHECK[vtLower]) and VCLUA_OPT_DEFAULT or VCLUA_OPT
            table.insert(varsFromLua,(templ:gsub('#TYP',varType):gsub("#DEF",varValue,1):gsub('#VAR',varName,1):gsub("#",idx,1)))
            if not defVars then defVars = idx - 1 end
          else
            local arrayType = varType:match('array%s+of%s+([_%w]+)')
            templ = templ or (arrayType and VCLUA_TOARRAY) or VCLUA_FROMLUA[vtLower] or VCLUA_FROMLUA_DEFAULT
            table.insert(varsFromLua, (templ:gsub('#VAR',varName):gsub('#TYP',arrayType or varType):gsub("#",idx)))
          end
        end
        -- input params checking
        defVars = pi and pi.r and (idx-1) or defVars
        if pi and pi.r and not pi.w then
          s = s:gsub("#VARCOUNT",defVars,1)
        elseif defVars then
          s = s:gsub("#VARCOUNT",defVars..", "..idx,1)
        else
          s = s:gsub("#VARCOUNT",idx,1)
        end
        setProp = pi and table.remove(varsFromLua,idx-1) or nil
        s = s:gsub("#TOVCLUA",varsFromLua[1] and "\n\t"..table.concat(varsFromLua,"\n\t") or '',1)
      else
        s = s:gsub("#VARS;","",1)
        s = s:gsub("#VARCOUNT",1,1)
        s = s:gsub("#TOVCLUA","",1)
      end
      local func = pi and getPropTempl(pi):gsub('#PINDEX', fParams == '' and fParams or '['..fParams..']'):
        gsub('#TOVCLUA',setProp,1):gsub('#PUSHOUT',retProp,1):gsub('#IDX',idx,1) or
        VCLua_CALL:gsub('#PAR',fParams,1):gsub('#RET',ret and "ret := " or "",1)
      local call = VCLua_TRY:gsub('#STMT',func,1):gsub('#CNAME',className):gsub('#MNAME',mName)
      if ret then
        local rtype = VCLUA_TOLUA[ret] or VCLUA_TOLUA_DEFAULT
        s = s:gsub("#FUNC",call,1)
        s = s:gsub("#PUSHTOLUA","\n\t"..rtype:gsub('#VAR','ret'),1)
        s = s:gsub("#PUSHOUTS",outStr[1] and "\n\t"..table.concat(outStr,"\n\t") or '')
        s = s:gsub("#RETVAR","\n\tret:"..reto,1)
        s = s:gsub("#RETCOUNT",retCount)
      else
        s = s:gsub("#FUNC",call,1)
        s = s:gsub("#PUSHTOLUA","",1)
        s = s:gsub("#PUSHOUTS",outStr[1] and "\n\t"..table.concat(outStr,"\n\t") or '')
        s = s:gsub("#RETVAR;","",1)
        s = s:gsub("#RETCOUNT",retCount,1)
      end
      addMethod(finalMethodName, vcluaMethodName)
      table.insert(classBody,s)
      classDoc[className][finalMethodName] = classDoc[className][finalMethodName] or {} 
      classDoc[className][finalMethodName]["params"] = fParams:len()>0 and fParams or nil
      classDoc[className][finalMethodName]["out"] = out
      classDoc[className][finalMethodName]["return"] = reto
      classDoc[className][finalMethodName]["reference"] = cdef.ref or ref
      classDoc[className][finalMethodName]["method"] = method	
    end
	end
	
	-- check implemented methods
		if cdef.impl then
			fncs = cdef.impl:split(",")
			for f=1,#fncs do
				cLog("#############  "..fncs[f], "DEBUG")
				local t = function_defnitions[fncs[f]]
				if t and t.src then 
					local vcluaMethodName = "VCLua_"..className.."_"..t.vcluaMethodName
					cLog("#############  "..vcluaMethodName, "DEBUG")
					addMethod(t.finalMethodName, vcluaMethodName)
					local src = t.src:gsub("#FNAME", vcluaMethodName,1)
					table.insert(classBody,src)
				elseif t then
					cLog("#############  "..t.vcluaMethodName,"DEBUG")
					addMethod(t.finalMethodName, t.vcluaMethodName)
				else
					assert(nil,"Cannot implement "..tostring(fncs[f]))
				end
			end
		end
	-- concat body parts
	local ccreate
	local intface = VCLua_CDEF_INTFCE
	if cdef.canvas then
		intface = VCLua_CDEF_INTFCE_CANVAS
	end
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
	elseif cdef.form then
		ccreate = VCLua_CDEF_TOTABLE..VCLua_CDEF_FOOTER_FORM
	else
		ccreate = VCLua_CDEF_TOTABLE..VCLua_CDEF_FOOTER
	end
	local pc = cdef.parentclass or "TWinControl"
	if cdef.noparent then
		ccreate = ccreate:gsub("l#CNAME.#PARENT","//")
	end
	ccreate = ccreate:gsub("#PARENTCLASS", pc):gsub("#PARENT","Parent")
	ccreate = ccreate:gsub("#CNAME",className):gsub("#CSRC",cdef.src)
	ccreate = ccreate:gsub("#WCLASS",cdef.wclass or "nil")
	local init
	if initSrc then
		intface = intface..VCLUA_INIT_INTFCE
		init = VCLUA_INIT:gsub("#MIDX",mIdx):gsub("#CSRC",src):gsub("#CMETHODS", table.concat(cMethods,"\n\t"))
	end
	initedSrcs[src] = true
	
	return table.concat(classBody,"\n"), ccreate, intface:gsub("#CSRC",src):gsub("#CNAME",className), init
end

-- pascal source generator --------------------------
local cfile
for ref,filename in pairs(toInfer) do
  cfile = loadTable(filename)
  cLog(ref.." "..filename,"INFO")
  local refd = ref ~= 'Default' and ref or nil
  for n, line in ipairs(cfile) do
    if line == 'implementation' then break end
    inferTypeKindFromLine(n, line, cfile, ref)
  end
end
local fpcSrcPrev
local createMap = {}
for n,cdef in pairs(classes) do
	local ref
	if cdef.ref then
		ref = cdef.ref:split(",")
		ref = ref[1]
	else
		ref = "Default"
	end
	if fpcSrc[ref] ~= fpcSrcPrev then
		cLog(ref.." "..fpcSrc[ref],"INFO")
		cfile = loadTable(fpcSrc[ref])
		fpcSrcPrev = fpcSrc[ref]
	else
		cLog(ref.." use previous","INFO")
	end
	classTable = {}
	classData = {}
	local className
	local unitRefs = {}
	
	if cdef.name then
		className = cdef.name
	-- single unit classes
		if processClass(cfile,cdef,ref)==nil then
			cLog("*CLASS NOT FOUND:"..cdef.name,"ERROR")
			break
		else
			local body,create,intf,init = createUnitBody(cdef, ref, unitRefs)
			table.insert(classData,{intf,body,create,init})
			vcluaTypeRef[cdef.src:lower()] = 'Lua'..className
		end
	elseif cdef.classes and type(cdef.classes)=="table" then
		className = cdef.unit
	-- common unit classes
		for _,ccdef in pairs(cdef.classes) do
			local pc = processClass(cfile,ccdef,ref)
			if pc==nil then 
				cLog("*CLASS NOT FOUND:"..ccdef.name,"ERROR")
				break
			end
			local body,create,intf,init = createUnitBody(ccdef, ref, unitRefs)
			table.insert(classData,{intf,body,create,init})
		end
		-- don't do this in the loop above to avoid self reference
		for _,ccdef in pairs(cdef.classes) do
			vcluaTypeRef[ccdef.src:lower()] = 'Lua'..className
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

	if cdef.ref then cdef.ref = cdef.ref:gsub("Default[,%s]*","") end
	local refStr = cdef.ref or ""
	classSource = classSource:gsub("#REF",(refStr ~= "" and ", "..refStr) or "")
	local intfRefT = cdef.ref and cdef.ref:split(',') or {}
	local intfRetChecker = {}
	for _,r in ipairs(intfRefT) do intfRetChecker[r] = true end
	local unitRefT = cdef.implref and cdef.implref:split(',') or {}
	for r,_ in pairs(unitRefs) do if not intfRetChecker[r] and r ~= 'System' then table.insert(unitRefT, r) end end
	table.sort(unitRefT)
	refStr = table.concat(unitRefT, ', ')
	classSource = classSource:gsub("#IMPLREF",(refStr ~= "" and ", "..refStr) or "")

	local intf, body, create, init = {},{},{},{"begin"}
	-- manual code to include
	if cdef.include then
		table.insert(body,cdef.include)
	end
	for _,cdata in pairs(classData) do
		table.insert(intf,cdata[1])
		table.insert(body,cdata[2])
		table.insert(create,cdata[3])
		table.insert(init,cdata[4])
	end
	classSource = classSource:gsub("#INIT",table.concat(init,"\n"),1)
	classSource = classSource:gsub("#CREATE",table.concat(create,"\n"),1)
	classSource = classSource:gsub("#BODY",table.concat(body,"\n"),1)
	classSource = classSource:gsub("#INTFCE",table.concat(intf,"\n"),1)
	saveTextToFile(classSource,out_path.."src/components/Lua"..className..".pas")
end


-- finalize --------------------------
-- generate vcl.inc
local vclinc = VCLUA_INC
local pasSrc={}
local luaLibs={}
local pasRefs = {}
local meta_srcs = {}
local luaobject_cast = {}
local libcount = 0
initedSrcs = {}
local init = {}
local function processCdef(cdef)
  local pName = cdef.name
  table.insert(luaobject_cast, "(name:'"..pName.."'; func:@As"..pName.."),")
  if cdef.nocreate==nil then
    table.insert(luaLibs, "(name:'"..pName.."'; func:@Create"..pName.."),")
    libcount = libcount + 1
  end
  local src = cdef.src:sub(2)
  if not initedSrcs[src] then
    initedSrcs[src] = true
    table.insert(meta_srcs, cdef.src..'.ClassInfo')
    table.insert(init, (VCLUA_ADD_MAP:gsub("#CSRC", src)))
  end
end
for n,cdef in pairs(classes) do
	-- collect refs
	if cdef.ref then
		local p = cdef.ref:split(",")
		for i,_ in pairs(p) do
			pasRefs[p[1]] = 1
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
	table.insert(pasSrc, lName)
end
local luaobject_uses = {}
for u,_ in pairs(pasRefs) do
	table.insert(luaobject_uses, u)
end
table.sort(luaobject_uses)

function table.reverse(t)
  local res, len = {}, #t
  for i = 0, len-1 do
    table.insert(res, t[len-i])
  end
  return res
end

local pasSrcStr = table.concat(pasSrc,",\n\t")
vclinc = vclinc:gsub("#PASCALSOURCE",pasSrcStr,1)
local funcs = table.concat(luaobject_cast,"\n\t")
vclinc = vclinc:gsub("#LUALIBS",table.concat(luaLibs,"\n\t\t"),1)
vclinc = vclinc:gsub("#LIBCOUNT",libcount,1)
saveTextToFile(HDR_INFO .. vclinc,out_path.."src/vcl.inc")
saveTextToFile(HDR_INFO .. table.concat(luaobject_uses,",\n"),out_path.."src/luaobject_uses.inc")
saveTextToFile(HDR_INFO .. "\n\t" .. pasSrcStr,out_path.."src/luacontroller_uses.inc")
saveTextToFile(HDR_INFO .. "\n\t" .. funcs:gsub('@As','@Is'),out_path.."src/is_funcs.inc")
saveTextToFile(HDR_INFO .. "\n\t" .. funcs,out_path.."src/as_funcs.inc")
saveTextToFile(HDR_INFO .. "\n" .. table.concat(table.reverse(init)),out_path.."src/init_map.inc")
saveTextToFile(HDR_INFO .. "\n" .. table.concat(table.reverse(meta_srcs),",\n"),out_path.."src/meta_srcs.inc")


