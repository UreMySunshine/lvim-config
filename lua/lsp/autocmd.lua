lvim.autocommands = {
  {
    "BufWinEnter", -- see `:h autocmd-events`
    {              -- this table is passed verbatim as `opts` to `nvim_create_autocmd`
      command = ":lua MiniMap.open()"
    },
  },
}
-- format before auto-save
local group = vim.api.nvim_create_augroup('autosave', {})
vim.api.nvim_create_autocmd('User', {
  pattern = 'AutoSaveWritePre',
  group = group,
  callback = function(opts)
    if opts.data.saved_buffer ~= nil then
      vim.lsp.buf.format({
        timeout_ms = 2000,
      })
    end
  end,
})
