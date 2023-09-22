lvim.autocommands = {
  {
    "BufWinEnter", -- see `:h autocmd-events`
    {              -- this table is passed verbatim as `opts` to `nvim_create_autocmd`
      command = ":lua MiniMap.open()"
    },
  },
  {
    "User",
    {
      pattern = { "AutoSaveWritePre" },
      group = "autosave",
      callback = function(opts)
        if opts.data.saved_buffer ~= nil then
          vim.cmd("lua require('lvim.lsp.utils').format()")
        end
      end,
    },
  },
}
