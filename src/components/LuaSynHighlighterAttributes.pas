(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaSynHighlighterAttributes;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, SynEditHighlighter;

function CreateSynHighlighterAttributes(L: Plua_State): Integer; cdecl;
procedure SynHighlighterAttributesToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaSynHighlighterAttributes = class(TSynHighlighterAttributes)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaHelper, LCLClasses; 

function VCLua_SynHighlighterAttributes_IsEnabled(L: Plua_State): Integer; cdecl;
var 
	lSynHighlighterAttributes:TLuaSynHighlighterAttributes;
	ret:boolean;
begin
	CheckArg(L, 1);
	lSynHighlighterAttributes := TLuaSynHighlighterAttributes(GetLuaObject(L, 1));
	ret := lSynHighlighterAttributes.IsEnabled();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_SynHighlighterAttributes_InternalSaveDefaultValues(L: Plua_State): Integer; cdecl;
var 
	lSynHighlighterAttributes:TLuaSynHighlighterAttributes;
begin
	CheckArg(L, 1);
	lSynHighlighterAttributes := TLuaSynHighlighterAttributes(GetLuaObject(L, 1));
	lSynHighlighterAttributes.InternalSaveDefaultValues();
	
	Result := 0;
end;

procedure SynHighlighterAttributesToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'IsEnabled', @VCLua_SynHighlighterAttributes_IsEnabled);
	LuaSetTableFunction(L, Index, 'InternalSaveDefaultValues', @VCLua_SynHighlighterAttributes_InternalSaveDefaultValues);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateSynHighlighterAttributes(L: Plua_State): Integer; cdecl;
var
	lSynHighlighterAttributes:TLuaSynHighlighterAttributes;
	Name:String;
begin
	lSynHighlighterAttributes := TLuaSynHighlighterAttributes.Create;
	lSynHighlighterAttributes.LuaCtl := TVCLuaControl.Create(TComponent(lSynHighlighterAttributes),L,@SynHighlighterAttributesToTable);
	SynHighlighterAttributesToTable(L, -1, lSynHighlighterAttributes);
	Result := 1;
end;

end.
