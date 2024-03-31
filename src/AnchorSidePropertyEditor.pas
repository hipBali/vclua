unit AnchorSidePropertyEditor;

{$mode Delphi}{$T+}

interface

uses Classes, PropEdits;

type
  TAnchorSideControlPropertyEditor = class(TPersistentPropertyEditor)
    function GetValue: AnsiString; override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure SetValue(const NewValue: ansistring); override;
  protected
    function CheckNewValue(APersistent: TPersistent): boolean; override;
  end;

implementation

uses Controls, ObjInspStrConsts, SysUtils;

function TAnchorSideControlPropertyEditor.GetValue: AnsiString;
var
  control: TControl;
begin
  control := TControl(GetObjectValue);
  if control = nil then
     result := ''
  else
    result := control.Name;
end;

procedure TAnchorSideControlPropertyEditor.GetValues(Proc: TGetStrProc);
var
  root: TControl;
  i: Integer;
begin
  Proc(oisNone);
  root := TControl(PropertyHook.LookupRoot);
  if root.Parent <> nil then begin
    Proc(root.Parent.Name);
    for i := 0 to root.Parent.ControlCount - 1 do
      if root.Parent.Controls[i] <> root then
         Proc(root.Parent.Controls[i].Name);
  end;
end;

function TAnchorSideControlPropertyEditor.CheckNewValue(APersistent: TPersistent): boolean;
begin
  result := APersistent <> PropertyHook.LookupRoot;
end;

procedure TAnchorSideControlPropertyEditor.SetValue(const NewValue: ansistring);
var
  Persistent: TPersistent;
  parent: TWinControl;
begin
  if NewValue=GetValue then exit;
  Persistent := nil;
  parent := TControl(PropertyHook.LookupRoot).Parent;
  if (NewValue <> '') and (NewValue <> oisNone) and (parent <> nil) then
    if CompareText(NewValue, parent.Name)=0 then
       Persistent := parent
    else
      Persistent := parent.FindComponent(NewValue);
  if GetPersistentReference=Persistent then exit;
  if not CheckNewValue(Persistent) then exit;
  SetPtrValue(Persistent);
  if Assigned(PropertyHook) then begin
    PropertyHook.ObjectReferenceChanged(Self,Persistent);
  end;
end;

begin
  RegisterPropertyEditor(TypeInfo(TAnchorSide), TControl, 'AnchorSideLeft', TClassPropertyEditor);
  RegisterPropertyEditor(TypeInfo(TAnchorSide), TControl, 'AnchorSideTop', TClassPropertyEditor);
  RegisterPropertyEditor(TypeInfo(TAnchorSide), TControl, 'AnchorSideRight', TClassPropertyEditor);
  RegisterPropertyEditor(TypeInfo(TAnchorSide), TControl, 'AnchorSideBottom', TClassPropertyEditor);
  RegisterPropertyEditor(TypeInfo(TControl), TAnchorSide, 'Control', TAnchorSideControlPropertyEditor);

end.
