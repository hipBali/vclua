{$IF defined(LUA51)}
   {$i lua/lua51.pas}
{$ELSEIF defined(LUA52)}
   {$i lua/lua52.pas}
{$ELSEIF defined(LUA53)}
   {$i lua/lua53.pas}
{$ELSE}
   {$i lua/lua54.pas}
{$ENDIF}
