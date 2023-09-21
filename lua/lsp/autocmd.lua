lvim.autocommands = {
  {
    "BufWinEnter", -- see `:h autocmd-events`
    {              -- this table is passed verbatim as `opts` to `nvim_create_autocmd`
      callback = function(buf)
        local fn = vim.fn
        if
            fn.getbufvar(buf, "&modifiable") == 1 and
            fn.getbufvar(buf, "&filetype") ~= "TelescopePrompt" then
          vim.cmd("lua MiniMap.open()")
        end
      end,
    }
  },
}
