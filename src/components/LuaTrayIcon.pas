(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaTrayIcon;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, ExtCtrls;

function CreateTrayIcon(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTrayIcon; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTrayIcon = class(TTrayIcon)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
var
    CustomTrayIconFuncs: TLuaVmt;
    CustomTrayIconSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, Graphics, ImgList, LuaCanvas, LuaImageList, LuaMenu, Menus;

function VCLua_TrayIcon_Hide(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	try
		ret := lTrayIcon.Hide();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'Hide', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TrayIcon_Show(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	try
		ret := lTrayIcon.Show();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'Show', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TrayIcon_InternalUpdate(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	try
		lTrayIcon.InternalUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'InternalUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_TrayIcon_ShowBalloonHint(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	try
		lTrayIcon.ShowBalloonHint();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'ShowBalloonHint', E.ClassName, E.Message);
	end;
end;

function VCLua_TrayIcon_GetPosition(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	ret:TPoint;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	try
		ret := lTrayIcon.GetPosition();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'GetPosition', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TrayIcon_VCLuaSetAnimate(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	val:Boolean;
begin
	CheckArg(L, 2);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTrayIcon.Animate := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'Animate', E.ClassName, E.Message);
	end;
end;

function VCLua_TrayIcon_VCLuaGetAnimate(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	try
		ret := lTrayIcon.Animate;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'Animate', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TrayIcon_VCLuaSetAnimateInterval(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	val:Cardinal;
begin
	CheckArg(L, 2);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTrayIcon.AnimateInterval := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'AnimateInterval', E.ClassName, E.Message);
	end;
end;

function VCLua_TrayIcon_VCLuaGetAnimateInterval(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	ret:Cardinal;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	try
		ret := lTrayIcon.AnimateInterval;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'AnimateInterval', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TrayIcon_VCLuaSetBalloonFlags(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	val:TBalloonFlags;
begin
	CheckArg(L, 2);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TBalloonFlags));
	try
		lTrayIcon.BalloonFlags := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'BalloonFlags', E.ClassName, E.Message);
	end;
end;

function VCLua_TrayIcon_VCLuaGetBalloonFlags(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	ret:TBalloonFlags;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	try
		ret := lTrayIcon.BalloonFlags;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'BalloonFlags', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TrayIcon_VCLuaSetBalloonHint(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	val:string;
begin
	CheckArg(L, 2);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTrayIcon.BalloonHint := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'BalloonHint', E.ClassName, E.Message);
	end;
end;

function VCLua_TrayIcon_VCLuaGetBalloonHint(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	ret:string;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	try
		ret := lTrayIcon.BalloonHint;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'BalloonHint', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TrayIcon_VCLuaSetBalloonTimeout(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	val:Integer;
begin
	CheckArg(L, 2);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTrayIcon.BalloonTimeout := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'BalloonTimeout', E.ClassName, E.Message);
	end;
end;

function VCLua_TrayIcon_VCLuaGetBalloonTimeout(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	ret:Integer;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	try
		ret := lTrayIcon.BalloonTimeout;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'BalloonTimeout', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TrayIcon_VCLuaSetBalloonTitle(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	val:string;
begin
	CheckArg(L, 2);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTrayIcon.BalloonTitle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'BalloonTitle', E.ClassName, E.Message);
	end;
end;

function VCLua_TrayIcon_VCLuaGetBalloonTitle(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	ret:string;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	try
		ret := lTrayIcon.BalloonTitle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'BalloonTitle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TrayIcon_VCLuaGetCanvas(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	ret:TCanvas;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	try
		ret := lTrayIcon.Canvas;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'Canvas', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TrayIcon_VCLuaSetPopUpMenu(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	val:TPopupMenu;
begin
	CheckArg(L, 2);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTrayIcon.PopUpMenu := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'PopUpMenu', E.ClassName, E.Message);
	end;
end;

function VCLua_TrayIcon_VCLuaGetPopUpMenu(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	ret:TPopupMenu;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	try
		ret := lTrayIcon.PopUpMenu;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'PopUpMenu', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TrayIcon_VCLuaSetIcon(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	val:TIcon;
begin
	CheckArg(L, 2);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTrayIcon.Icon := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'Icon', E.ClassName, E.Message);
	end;
end;

function VCLua_TrayIcon_VCLuaGetIcon(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	ret:TIcon;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	try
		ret := lTrayIcon.Icon;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'Icon', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TrayIcon_VCLuaSetIcons(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	val:TCustomImageList;
begin
	CheckArg(L, 2);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTrayIcon.Icons := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'Icons', E.ClassName, E.Message);
	end;
end;

function VCLua_TrayIcon_VCLuaGetIcons(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	ret:TCustomImageList;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	try
		ret := lTrayIcon.Icons;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'Icons', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TrayIcon_VCLuaSetHint(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	val:string;
begin
	CheckArg(L, 2);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTrayIcon.Hint := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'Hint', E.ClassName, E.Message);
	end;
end;

function VCLua_TrayIcon_VCLuaGetHint(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	ret:string;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	try
		ret := lTrayIcon.Hint;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'Hint', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TrayIcon_VCLuaSetShowIcon(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	val:Boolean;
begin
	CheckArg(L, 2);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTrayIcon.ShowIcon := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'ShowIcon', E.ClassName, E.Message);
	end;
end;

function VCLua_TrayIcon_VCLuaGetShowIcon(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	try
		ret := lTrayIcon.ShowIcon;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'ShowIcon', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TrayIcon_VCLuaSetVisible(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	val:Boolean;
begin
	CheckArg(L, 2);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTrayIcon.Visible := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'Visible', E.ClassName, E.Message);
	end;
end;

function VCLua_TrayIcon_VCLuaGetVisible(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	try
		ret := lTrayIcon.Visible;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'Visible', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TTrayIcon; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomTrayIcon',v);
end;
function CreateTrayIcon(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lTrayIcon := TLuaTrayIcon.Create(Parent);
	// := TWinControl(Parent);
	lTrayIcon.LuaCtl := TVCLuaControl.Create(lTrayIcon as TComponent,L,nil,'TCustomTrayIcon');
	InitControl(L,lTrayIcon,Name);
	CreateTableForKnownType(L,'TCustomTrayIcon',lTrayIcon);
	Result := 1;
end;

begin
	CustomTrayIconFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomTrayIconFuncs, 'Hide', @VCLua_TrayIcon_Hide);
	TLuaMethodInfo.Create(CustomTrayIconFuncs, 'Show', @VCLua_TrayIcon_Show);
	TLuaMethodInfo.Create(CustomTrayIconFuncs, 'InternalUpdate', @VCLua_TrayIcon_InternalUpdate);
	TLuaMethodInfo.Create(CustomTrayIconFuncs, 'ShowBalloonHint', @VCLua_TrayIcon_ShowBalloonHint);
	TLuaMethodInfo.Create(CustomTrayIconFuncs, 'GetPosition', @VCLua_TrayIcon_GetPosition);
	TLuaMethodInfo.Create(CustomTrayIconFuncs, 'Animate', @VCLua_TrayIcon_VCLuaGetAnimate, mfCall);
	TLuaMethodInfo.Create(CustomTrayIconFuncs, 'AnimateInterval', @VCLua_TrayIcon_VCLuaGetAnimateInterval, mfCall);
	TLuaMethodInfo.Create(CustomTrayIconFuncs, 'BalloonFlags', @VCLua_TrayIcon_VCLuaGetBalloonFlags, mfCall);
	TLuaMethodInfo.Create(CustomTrayIconFuncs, 'BalloonHint', @VCLua_TrayIcon_VCLuaGetBalloonHint, mfCall);
	TLuaMethodInfo.Create(CustomTrayIconFuncs, 'BalloonTimeout', @VCLua_TrayIcon_VCLuaGetBalloonTimeout, mfCall);
	TLuaMethodInfo.Create(CustomTrayIconFuncs, 'BalloonTitle', @VCLua_TrayIcon_VCLuaGetBalloonTitle, mfCall);
	TLuaMethodInfo.Create(CustomTrayIconFuncs, 'Canvas', @VCLua_TrayIcon_VCLuaGetCanvas, mfCall);
	TLuaMethodInfo.Create(CustomTrayIconFuncs, 'PopUpMenu', @VCLua_TrayIcon_VCLuaGetPopUpMenu, mfCall);
	TLuaMethodInfo.Create(CustomTrayIconFuncs, 'Icon', @VCLua_TrayIcon_VCLuaGetIcon, mfCall);
	TLuaMethodInfo.Create(CustomTrayIconFuncs, 'Icons', @VCLua_TrayIcon_VCLuaGetIcons, mfCall);
	TLuaMethodInfo.Create(CustomTrayIconFuncs, 'Hint', @VCLua_TrayIcon_VCLuaGetHint, mfCall);
	TLuaMethodInfo.Create(CustomTrayIconFuncs, 'ShowIcon', @VCLua_TrayIcon_VCLuaGetShowIcon, mfCall);
	TLuaMethodInfo.Create(CustomTrayIconFuncs, 'Visible', @VCLua_TrayIcon_VCLuaGetVisible, mfCall);
	CustomTrayIconSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomTrayIconSets, 'Animate', @VCLua_TrayIcon_VCLuaSetAnimate, mfCall);
	TLuaMethodInfo.Create(CustomTrayIconSets, 'AnimateInterval', @VCLua_TrayIcon_VCLuaSetAnimateInterval, mfCall);
	TLuaMethodInfo.Create(CustomTrayIconSets, 'BalloonFlags', @VCLua_TrayIcon_VCLuaSetBalloonFlags, mfCall);
	TLuaMethodInfo.Create(CustomTrayIconSets, 'BalloonHint', @VCLua_TrayIcon_VCLuaSetBalloonHint, mfCall);
	TLuaMethodInfo.Create(CustomTrayIconSets, 'BalloonTimeout', @VCLua_TrayIcon_VCLuaSetBalloonTimeout, mfCall);
	TLuaMethodInfo.Create(CustomTrayIconSets, 'BalloonTitle', @VCLua_TrayIcon_VCLuaSetBalloonTitle, mfCall);
	TLuaMethodInfo.Create(CustomTrayIconSets, 'PopUpMenu', @VCLua_TrayIcon_VCLuaSetPopUpMenu, mfCall);
	TLuaMethodInfo.Create(CustomTrayIconSets, 'Icon', @VCLua_TrayIcon_VCLuaSetIcon, mfCall);
	TLuaMethodInfo.Create(CustomTrayIconSets, 'Icons', @VCLua_TrayIcon_VCLuaSetIcons, mfCall);
	TLuaMethodInfo.Create(CustomTrayIconSets, 'Hint', @VCLua_TrayIcon_VCLuaSetHint, mfCall);
	TLuaMethodInfo.Create(CustomTrayIconSets, 'ShowIcon', @VCLua_TrayIcon_VCLuaSetShowIcon, mfCall);
	TLuaMethodInfo.Create(CustomTrayIconSets, 'Visible', @VCLua_TrayIcon_VCLuaSetVisible, mfCall);
end.
