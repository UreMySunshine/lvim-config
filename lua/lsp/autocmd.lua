lvim.autocommands = {
  {
    "VimEnter", -- see `:h autocmd-events`
    {           -- this table is passed verbatim as `opts` to `nvim_create_autocmd`
      command = ":lua MiniMap.open()",
    }
  },
}
