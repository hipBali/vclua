outer_iterations = 15
inner_iterations = 1000000
one_per_type = false
digits=3
show_progress=false

local Set = {}

function Set.Intersect(list1,list2)
    if not list1 or not list2 then return {} end
    local ret = {}
    for k,v in pairs(list1) do if list2[k] then ret[k] = v end end
    return ret
end
function Set.Diff(list1,list2)
    if not list1 or not list2 then return list1 end
    local ret = {}
    for k,v in pairs(list1) do if not list2[k] then ret[k] = v end end
    return ret
end

VCL = require "vcl.core"
VCL.Application():Initialize()

local frmMain = VCL.Form(nil, 'mainForm',
	{
		Caption='VCLua bench',
		Width=640,
		Height=480,
		Position="poScreenCenter",
		Font = {
			Height = -19,
            Name = "Courier New",
			Pitch = "fpFixed",
		}
	}
)

local tv = VCL.TreeView(frmMain)

local tvpp = VCL.ListProperties('TTreeView')
local cgp = VCL.ListProperties('TControl', true)
local ctvgp = VCL.ListProperties('TCustomTreeView', true)
local tocheck = Set.Diff(Set.Intersect(tvpp, ctvgp), cgp)
local bytype = {}
for p,t in pairs(tocheck) do
    bytype[t] = bytype[t] or {}
    table.insert(bytype[t],p)
end

local orig_print=print
if not show_progress then print = function() end end
print(table.tovstring(bytype))
for t,list in pairs(bytype) do
    table.sort(list)
    if one_per_type then list = {list[1]} end
    print("TYPE", t)
    for i,p in ipairs(list) do
        local prop={p=p}
        local gen_getter = VCL.GetCallable(tv,p)
        local pub_getter = VCL.GetCallable(tv,p,false,true)
        local FS = {
            {name='tv.'..p, f=function() return tv[p] end},
            {name='getter for generated property', f=function() return gen_getter(tv) end},
            {name='getter for published property', f=pub_getter},
        }
        local function assert_equal(i, res)
            print('getting '..p..':'..t..'='..tostring(res)..' via '..FS[i].name)
            if i ~= 1 then
                if type(res) == "table" then
                    if res.Handle then assert(res.Handle == FS[i].f().Handle)
                    else
                        assert(next(Set.Diff(res, FS[i].f()))==nil)
                        assert(next(Set.Diff(FS[i].f(), res))==nil)
                    end
                else assert(res == FS[i].f())
                end
            end
        end
        local avgs = {}
        local val = FS[1].f()
        for i,F in ipairs(FS) do
            assert_equal(i, val)
            local f = F.f
            local sum = 0.
            for j=1,outer_iterations do
                collectgarbage()
                collectgarbage("stop")
                local runtime = os.clock()
                for i = 1,inner_iterations do f() end
                runtime = os.clock() - runtime
                print(string.format("%."..digits.."f",runtime))
                sum = sum + runtime
            end
            avgs[i] = string.format("%."..(digits+1).."f",sum/outer_iterations)
            print('average', avgs[i])
        end
        local tbl, n = {}, #avgs
        for i,a in ipairs(avgs) do
            table.insert(tbl,a)
            if i < n then table.insert(tbl,string.format("%."..(digits+1).."f",a-avgs[i+1])) end
        end
        table.insert(tbl,p..':'..t..'='..tostring(val))
        orig_print(table.concat(tbl,' '))
    end
end

if not show_progress then print = orig_print end
collectgarbage("restart")

--frmMain:ShowModal()
