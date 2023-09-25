local is_windows = vim.loop.os_uname().sysname:find "Windows"

if is_windows then
  require("system.windows")
end
