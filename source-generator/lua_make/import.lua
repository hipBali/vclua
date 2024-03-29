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
			stage="fill"
		end,
	["private"] = function()
			stage="parse"
		end,
	["published"] = function()
			stage="fillprop"
		end,
	["protected"] = function()
			stage="fillprop"
		end,
	["end"] = function()
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

local function HashedToSorted(t,comp)
  local k,v = next(t)
  if not k then return {} end
  local res = {n=0}
  local tables = type(v) == "table"
  if tables then
    for k,v in pairs(t) do
      res.n=res.n+1
      res[res.n]={k=k,v=v}
    end
  else
    for k,v in pairs(t) do
      res.n=res.n+1
      res[res.n]=k
    end
  end
  res.n=nil
  comp = comp or tables and function(l,r) return l.k<r.k end or nil
  table.sort(res,comp)
  return res
end

local function propertyToProc(decl)
  -- parsing 'property ident([indexing])?: type (read ident)? (write ident)? .* (default;)?
  local propName, indexing, m, typeName
  local canRead, canWrite = false, false
  local _, n = decl:find('%a+%s+') -- skip 'property'
  _, n, propName = decl:find('([_%w]+)', n + 1)
  local isEvent = propName:find('^On%S')
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
  local d=n and true
  local method = ("procedure %s(%s:%s)"):format(propName, indexing and (indexing..'; var ret') or 'val', typeName)
  if indexing then
    return {{method=method, propInfo={r=canRead,w=canWrite,d=d,i=true}}}
  else
    local ret = {}
    if canWrite then ret[1] = {method=method, propInfo={w=true,d=d,pref='VCLuaSet',isEvent=isEvent,tp=typeName}} end
    if canRead and not isEvent then table.insert(ret, {method=("function %s:%s;"):format(propName, typeName), propInfo={r=true,d=d,pref='VCLuaGet'}}) end
    return ret
  end
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

local function updRef(refs, tp, tl, className, pushed)
	local r
	if pushed then r = vcluaTypeRef[tl] else r = typeRef[tl] end
	if r and not refs[r] then
		refs[r] = true
		cLog('Adding '..r..' to refs because of '..tp..' in '..className, 'INFO')
	end
end
local eventSrcs = {}
local eventAlias = {}
local excludeType = loadMap("exclude/VarTypes")
local function inferTypeKindFromLine(n, line, cfile, ref)
  local _, pos, typename = line:find("^%s*(T[_%w]+)%s*=%s*")
  if not pos then return end
  local c = typename:lower()
  if excludeType[c] then return end
  --cLog('Set typeRef '..ref..' to '..typename, 'INFO')
  typeRef[c] = ref
  local merged = n
  if pos == #line then
    -- declaration starts on another string as in GraphType
    merged = n + 1
    while cfile[merged] == '' do merged = merged + 1 end
    line = line..cfile[merged]
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
    elseif line:find('^%s*class%s+of[^_%w]',pos) then
      excludeType[c] = 1
    elseif line:find("^%s*%(",pos) then
      cLog(string.format("ENUM FOUND %s LINE:%d %s", typename, n, line),"INFO")
      if VCLUA_ES_CHECK then
        VCLUA_ES_CHECK[c] = true
        VCLUA_FROMLUA[c] = VCLUA_FROMLUA_FULL
        VCLUA_TOLUA[c] = VCLUA_TOLUA_FULL
      end
    elseif line:find("^%s*[pP]rocedure%s*%(",pos) then
      if line:find("%);")==nil and line:find("%)%s*of%s+[oO]bject;")==nil then
        local bl
        repeat
          merged = merged + 1
          bl = cfile[merged]:gsub("^%s*", " ")
          line = line..bl
        until bl:find("%);") or bl:find("%)%s*of%s+[oO]bject;")
      end
      if line:find("%);") then return end
      local md = {method=line,propInfo=true,name=typename,refs={}} -- propInfo for ensuring #md.vars==1
      processParams(md)
      for t,_ in pairs(md.mtypes) do
        local tl = t:lower()
        if excludeType[tl] then
          cLog(" ** EXCLUDED:"..line.." "..t, "DEBUG")
          excludeType[c] = 1
          return
        end
        updRef(md.refs,t,tl,typename)
      end
      eventSrcs[ref] = eventSrcs[ref] or {}
      eventSrcs[ref][c] = md
      vcluaTypeRef[c] = 'Lua'..ref..'Events'
    else
      local _,_,alias = line:find('^%s*([_%w]+);$',pos)
      if alias then
        local lalias = alias:lower()
        if excludeType[lalias] then
          excludeType[c] = 1
          cLog(" ** EXCLUDED:"..line.." "..alias, "DEBUG")
        elseif VCLUA_FROMLUA[lalias] or VCLUA_TOLUA[lalias] or (VCLUA_ES_CHECK and VCLUA_ES_CHECK[lalias]) then
          VCLUA_FROMLUA[c] = VCLUA_FROMLUA[lalias]
          VCLUA_TOLUA[c] = VCLUA_TOLUA[lalias]
          if VCLUA_ES_CHECK then VCLUA_ES_CHECK[c] = VCLUA_ES_CHECK[lalias] end
          cLog('Aliasing '..typename..' to '..alias, 'INFO')
        else
          local aref = typeRef[lalias]
          if aref then
            local asrc = eventSrcs[aref]
            if asrc and asrc[lalias] then
              eventAlias[c] = alias
              cLog('Aliasing event '..typename..' to '..alias, 'INFO')
            end
          end
        end
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

	local function processLine(n, line)
		-- find classdef
		local ln = {}
		local index = 1
		for value in string.gmatch(line, "%w+") do 
			ln[index] = value
			index = index + 1
		end
		if not ln[1] then return false end
		if reparse then inferTypeKindFromLine(n, line, def, ref) end
		-- parse class
		local _,_,c = line:find("([_%w]+)%s*=%s*class%s*%([_%w]+%s*")
		if not c then _,_,c = line:find("([_%w]+)%s*=%s*class%s*$") end
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
		local isOnlyProp = stage=="fillprop"
		if (stage=="fill" or isOnlyProp) and classTable[cname] then
			local isProp = lword=="property"
			if (not isOnlyProp and (lword=="procedure" or lword=="function")) or isProp then
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
						local function appendUntil(pattern)
							local m = n + 1
							local bl
							repeat
								bl = def[m]:gsub("^%s*", "")
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
						local mds={{method=l}}
						if isProp then
							if isOnlyProp and not ln[2]:find('^On%S') then ok = false
							else
								mds = propertyToProc(l)
								if not mds then ok = false end
							end
						end
						if ok then
							for _,md in ipairs(mds) do
								md.mName=ln[2]
								local reason
								if lword=="function" or (isProp and md.propInfo.r and not md.propInfo.i) then
									local ret = md.method:split(":")
									md.reto = ret[#ret]:match("%w+")
									ok = not excludeType[md.reto:lower()]
									reason = md.reto
								end
								processParams(md)
								for t,_ in pairs(md.mtypes) do
									if excludeType[t:lower()] then
										reason = t
										ok = false
										break
									end
								end
								if ok then table.insert(classTable[cname], md)
								else cLog(" ** EXCLUDED:"..l.." "..reason, "DEBUG") end
							end
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
	md.vars={{}}
	md.mtypes,md.pushTypes={},{}
	local s = md.method
	if s:find("%(") then
		md.vars[2] = {}
		md.varlist={}
		md.funcparams = {}
		md.out={}
		-- parse params, remove const flag
		md.ptypelist = s:match("%(([^%)]+)%)")
		s = md.ptypelist:gsub("[cC]onst%s+","")
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
			

			local def = nil
			local pp = varType:split("=") 	-- remove default value
			if pp[2] then
				def=pp[2]
			end
			varType = pp[1]
			md.mtypes[varType] = true

			-- should passed back?
			local isVar = p[1]:find("[vV]ar%s+")
			local isOut = p[1]:find("[oO]ut%s+")
			if isVar or isOut then
				table.insert(md.out, {name=varName, type=varType})
				md.pushTypes[varType] = true
			end
			-- var parameters can actually be required, e.g. in TCustomDrawGrid.DefaultDrawCell, TCustomListBox.MeasureItem
			-- so provide an overload
			if not isOut then
				if not isVar then
					table.insert(md.vars[1], {name=varName, type=varType, value=def})
				end
				table.insert(md.vars[2], {name=varName, type=varType, value=def})
			end
			table.insert(md.funcparams, varName)
			table.insert(md.varlist, varName..":"..varType)
		end
	end
	if md.vars[2] then
		if #md.vars[2] == #md.vars[1] then
			md.vars[2] = nil
		elseif md.propInfo then
			md.vars[1] = md.vars[2]
			md.vars[2] = nil
		end
	end
end

local function getPropTempl(pi)
  return pi.r and (pi.w and VCLua_PROP or VCLua_PROP_READ) or VCLua_PROP_WRITE
end
local function applyFromLuaTempl(templ, varName, varType, vtLower)
  local arrayType = varType:match('array%s+of%s+([_%w]+)')
  templ = templ or (arrayType and VCLUA_TOARRAY) or VCLUA_FROMLUA[vtLower] or VCLUA_FROMLUA_DEFAULT
  return templ:gsub('#VAR',varName):gsub('#TYP',arrayType or varType)
end
function createUnitBody(cdef, ref, refs)
	local className = cdef.name
	local classBody = {} 
	local cMethods, cPropSets = {n=0,suf="Funcs"}, {n=0,suf="Sets"}
	local overLoads = {}
	local src = cdef.src:sub(2)
	local initSrc = not initedSrcs[src]
	if not initSrc then cLog("###  skipping init of src "..src, "DEBUG") end
	local initFmt = "TLuaMethodInfo.Create("..src.."%s, '%s', @%s%s%s);"
	local function doInsert(methods,finalMethodName,vcluaMethodName,flag,ti)
		methods[methods.n + 1] = initFmt:format(methods.suf,finalMethodName,vcluaMethodName,flag,ti)
		methods.n = methods.n + 1
	end
	local function addMethod(pi,finalMethodName,vcluaMethodName)
		if initSrc then
			local pp = pi and not pi.i
			doInsert(pp and pi.w and cPropSets or cMethods,finalMethodName,vcluaMethodName, pp and ", mfCall" or "", pp and pi.tp and ", TypeInfo("..pi.tp..")" or "")
		end
	end
	-- parenting needs TWinControl and TComponent
	if not cdef.nocreate then
		refs['Controls'] = true
		refs['Classes'] = true
	end
	classDoc[className] = classDoc[className] or {}
	classDoc[className]["reference"] = cdef.ref
	for _,md in pairs(classTable[className]) do
		-- parse params
		local method = md.method
		local pi = md.propInfo
		local setProp, retProp = '', ''
		local mName = md.mName
		local ret, reto = nil, md.reto
		local retCount = 0
		local vars, varlist, funcparams, out, mtypes, pushTypes = md.vars, md.varlist, md.funcparams, md.out, md.mtypes, md.pushTypes
		for typ,_ in pairs(mtypes) do updRef(refs,typ,typ:lower(),className) end
		for typ,_ in pairs(pushTypes) do updRef(refs,typ,typ:lower(),className,true) end
		if pi and pi.isEvent and pi.w then
			local t = md.vars[1][1].type
			local tl = t:lower()
			local at = eventAlias[tl]
			if at then
				t = at
				tl = t:lower()
			end
			updRef(refs,t,tl,className,true)
			refs['LuaEvent'] = true
		end
		if reto then
			ret = reto:lower()
			updRef(refs,reto,ret,className)
			updRef(refs,reto,ret,className,true)
			retCount = 1
		end
		-- additional outputs
		local outStr = {}
		if out and #out>0 then
			for i=1,#out do
				local rtype = (VCLUA_TOLUA[out[i].type:lower()] or VCLUA_TOLUA_DEFAULT):gsub("#VAR",out[i].name)
				table.insert(outStr, rtype)
				retCount = retCount + 1
			end
		end
		if pi and pi.i then
			assert(#vars==1)
			-- last param has special treatment
			table.remove(funcparams)
			retProp = table.remove(outStr)
		end
		local fParams = table.concat(funcparams or {},",")
		local maybeTempVars = {}
		if cdef.allowtemps and cdef.allowtemps[mName] and (not pi or pi.w) then
			maybeTempVars = cdef.allowtemps[mName]:split(',')
			varlist = varlist or {}
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
      if pi then
        vcluaMethodName = (pi.pref or '')..vcluaMethodName
      elseif overLoads[mnLower] then
        finalMethodName = mName..overLoads[mnLower]
        vcluaMethodName = finalMethodName
        overLoads[mnLower] = overLoads[mnLower] + 1
      else
        overLoads[mnLower] = 2
      end

      vcluaMethodName = "VCLua_"..className.."_"..vcluaMethodName

      s = s:gsub("#FNAME",vcluaMethodName):gsub("#CNAME",className)

      local idx = 1
      if varlist then
        s = s:gsub("#VARS",pi and pi.isEvent and '' or "\n\t"..table.concat(varlist,";\n\t")..';',1)
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
          if pi and pi.isEvent then
          elseif varValue then
            local inline = VCLUA_OPT_INLINE_FROMLUA_LIST[vtLower] and VCLUA_OPT_INLINE_FROMLUA:gsub('#FROMLUA',VCLUA_FROMLUA[vtLower] or VCLUA_FROMLUA_DEFAULT,1)
            templ = templ or (not VCLUA_ES_CHECK or VCLUA_ES_CHECK[vtLower]) and VCLUA_OPT_DEFAULT or inline or VCLUA_OPT
            table.insert(varsFromLua,(templ:gsub('#TYP',varType):gsub("#DEF",varValue,1):gsub('#VAR',varName):gsub("#",idx)))
            if not defVars then defVars = idx - 1 end
          else
            table.insert(varsFromLua, (applyFromLuaTempl(templ,varName,varType,vtLower):gsub("#",idx)))
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
        setProp = pi and pi.i and table.remove(varsFromLua,idx-1)
        s = s:gsub("#TOVCLUA",varsFromLua[1] and "\n\t"..table.concat(varsFromLua,"\n\t") or '',1)
      else
        s = s:gsub("#VARS","",1)
        s = s:gsub("#VARCOUNT",1,1)
        s = s:gsub("#TOVCLUA","",1)
      end
      local stmts
      if pi and pi.i then
        stmts = getPropTempl(pi):gsub('#PAR', '['..fParams..']')
        stmts = stmts:gsub('#TOVCLUA',setProp,1)
        stmts = stmts:gsub('#PUSHOUT',retProp,1):gsub('#IDX',idx,1)
      elseif pi and pi.w and pi.isEvent then
        local typ = md.vars[1][1].type
        local ltyp = (eventAlias[typ:lower()] or typ):gsub('^T','TLua')
        stmts = VCLua_EVENT_SET:gsub('#LTYP',ltyp):gsub('#ETYP',typ)
      else
        stmts = VCLua_CALL:gsub('#SET',pi and pi.w and ' := val' or '',1)
        stmts = stmts:gsub('#PAR',pi and '' or '('..fParams..')',1)
        stmts = stmts:gsub('#RET',ret and "ret := " or "",1)
      end
      local call = (pi and pi.isEvent and stmts or VCLua_TRY:gsub('#STMTS',stmts,1)):gsub('#CNAME',className):gsub('#MNAME',mName)
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
      addMethod(md.propInfo, finalMethodName, vcluaMethodName)
      table.insert(classBody,s)
      classDoc[className][finalMethodName] = classDoc[className][finalMethodName] or {} 
      classDoc[className][finalMethodName]["params"] = fParams:len()>0 and fParams or nil
      classDoc[className][finalMethodName]["out"] = out
      classDoc[className][finalMethodName]["return"] = reto
      classDoc[className][finalMethodName]["reference"] = cdef.ref
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
					addMethod(nil, t.finalMethodName, vcluaMethodName)
					local src = t.src:gsub("#FNAME", vcluaMethodName,1)
					table.insert(classBody,src)
				elseif t then
					cLog("#############  "..t.vcluaMethodName,"DEBUG")
					addMethod(nil, t.finalMethodName, t.vcluaMethodName)
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
		init = {}
		for _,methods in ipairs({cMethods,cPropSets}) do
			table.insert(init, (VCLUA_INIT:gsub("#MIDX",methods.n):gsub("#CSRC#SUF",src..methods.suf):gsub("#CMETHODS", table.concat(methods,"\n\t"))))
		end
		init = table.concat(init,'\n')
	end
	initedSrcs[src] = true
	
	return table.concat(classBody,"\n"), ccreate, intface:gsub("#CSRC",src):gsub("#CNAME",className), init
end

-- pascal source generator --------------------------
local cfile
for _,kv in pairs(toInfer) do
  local ref,filename = kv.ref,kv.src
  cfile = loadTable(filename)
  cLog(ref.." "..filename,"INFO")
  for n, line in ipairs(cfile) do
    if line == 'implementation' then break end
    inferTypeKindFromLine(n, line, cfile, ref)
  end
  parsedRefs[ref] = true
end
local fpcSrcPrev
local createMap = {}
for n,cdef in pairs(classes) do
	local refsplit = cdef.ref:split(",")
	local ref = refsplit[1]
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

	classSource = classSource:gsub("#REF",cdef.ref)
	-- clear duplicates from implementation uses
	unitRefs['System'] = nil
	for _,r in ipairs(refsplit) do unitRefs[r] = nil end
	-- prepare table for concat
	unitRefs[''] = true
	local unitRefT = HashedToSorted(unitRefs)
	if cdef.implref then table.insert(unitRefT,cdef.implref) end
	classSource = classSource:gsub("#IMPLREF",table.concat(unitRefT, ', '))

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
local meta_srcs, api_srcs = {}, {}
local libcount = 0
initedSrcs = {}
local init = {}
local function processCdef(cdef)
  local pName = cdef.name
  table.insert(api_srcs, "apiPtis.Add('T"..pName.."', T"..pName..".ClassInfo);")
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
	local p = cdef.ref:split(",")
	for i,_ in pairs(p) do
		pasRefs[p[1]] = 1
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
pasRefs['Classes'] = nil
local luaobject_uses = HashedToSorted(pasRefs)

function table.reverse(t)
  local res, len = {}, #t
  for i = 0, len-1 do
    table.insert(res, t[len-i])
  end
  return res
end

for _,kv in ipairs(HashedToSorted(eventSrcs)) do
  local ref = kv.k
  cLog(ref..' events:', "INFO")
  local uname = 'Lua'..ref..'Events'
  table.insert(pasSrc, uname)
  local refs,implrefs,decls,defs={},{},{},{}
  for _,kv in ipairs(HashedToSorted(kv.v)) do
    local md = kv.v
    --assert(ref == typeRef[kv.k]) -- allow for several defs for e.g. TGetChildProc
    cLog(md.name, "INFO")
    local def = VCLUA_EVENT_HANDLER:gsub('#IDX',#md.vars[1],1)
    local fromlua = {'\n  luaNewTop := lua_gettop(L);'}
    for idx,v in ipairs(md.out) do
      local vtLower = v.type:lower()
      local templ = applyFromLuaTempl(nil,v.name,v.type,vtLower)
      templ = VCLUA_EVENT_RET:gsub('#FROMLUA',templ,1):gsub("#",'luaTop + '..idx)
      table.insert(fromlua, templ)
    end
    def = def:gsub('#FROMLUA',fromlua[2] and table.concat(fromlua,'\n  ') or '',1)
    local tolua = {fromlua[2] and 'luaTop := lua_gettop(L) - 1;' or nil}
    for _,v in ipairs(md.vars[1]) do
      local vtLower = v.type:lower()
      local arrayType = v.type:match('array%s+of%s+([_%w]+)')
      local templ = arrayType and VCLUA_PUSHARRAY:gsub('#TYP',arrayType,1) or VCLUA_TOLUA[vtLower] or VCLUA_TOLUA_DEFAULT 
      table.insert(tolua,(templ:gsub("#VAR",v.name)))
    end
    def = def:gsub('#TOLUA',table.concat(tolua,'\n  '),1)
    local typ = md.name:gsub('^T','',1)
    def = def:gsub('#PAR',md.ptypelist,1):gsub('#TYP',typ,1)
    table.insert(defs, def)
    -- have to do it here, only after all processClass calls
    for typ,_ in pairs(md.mtypes) do updRef(implrefs,typ,typ:lower(),md.name,true) end
    implrefs[uname] = nil
    local decl = VCLUA_EVENT_HANDLER_DECL:gsub('#PAR',md.ptypelist,1):gsub('#TYP',typ,1)
    table.insert(decls, decl)
    for ref,_ in pairs(md.refs) do refs[ref] = true end
  end
  local s = VCLUA_EVENTDEF
  s = s:gsub('#DEFS',table.concat(defs,'\n'),1)
  implrefs[''] = true
  implrefs['System'] = nil
  if eventImplRefs[ref] then implrefs[eventImplRefs[ref]] = true end
  s = s:gsub('#IMPLREF',table.concat(HashedToSorted(implrefs),', '),1)
  s = s:gsub('#DECLS',table.concat(decls,'\n'),1)
  refs[''] = true
  refs['System'] = nil
  if eventRefs[ref] then refs[eventRefs[ref]] = true end
  s = s:gsub('#REF',table.concat(HashedToSorted(refs),', '),1)
  s = s:gsub('#UNITNAME',uname,1)
	saveTextToFile(s,out_path.."src/events/"..uname..".pas")
end

local pasSrcStr = table.concat(pasSrc,",\n\t")
vclinc = vclinc:gsub("#PASCALSOURCE",pasSrcStr,1)
vclinc = vclinc:gsub("#LUALIBS",table.concat(luaLibs,"\n\t\t"),1)
vclinc = vclinc:gsub("#LIBCOUNT",libcount,1)
saveTextToFile(HDR_INFO .. vclinc,out_path.."src/vcl.inc")
saveTextToFile(HDR_INFO .. table.concat(luaobject_uses,",\n"),out_path.."src/luaobject_uses.inc")
saveTextToFile(HDR_INFO .. "\n\t" .. pasSrcStr,out_path.."src/luacontroller_uses.inc")
saveTextToFile(HDR_INFO .. "\n" .. table.concat(table.reverse(init)),out_path.."src/init_map.inc")
saveTextToFile(HDR_INFO .. "\n" .. table.concat(table.reverse(meta_srcs),",\n"),out_path.."src/meta_srcs.inc")
saveTextToFile(HDR_INFO .. "\n" .. table.concat(table.reverse(api_srcs),"\n"),out_path.."src/api_srcs.inc")


