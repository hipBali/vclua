_logLevel = "ERROR"
function cLog(msg, level)
  level = level or "DEBUG"
  if _logLevel == "ERROR" and level ~= "ERROR" then
    return
  elseif _logLevel == "WARN" and (level == "DEBUG" or level == "INFO") then
    return
  end
  if _logLevel == "INFO" and level == "DEBUG" then
    return
  end
  io.stderr:write(string.format("%s %s %s\n", os.date("%Y-%m-%dT%H:%M:%S"), level, msg))
end
