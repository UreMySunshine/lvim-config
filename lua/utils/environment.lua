local function is_windows()
  return vim.loop.os_uname().sysname:find "Windows"
end

return {
  is_windows = is_windows,
}
