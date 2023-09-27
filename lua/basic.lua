-- line numbers
vim.opt.relativenumber = true
-- auto update buffer
vim.opt.autoread = true
-- nvim-tree filter
lvim.builtin.nvimtree.setup.filters.custom = { "\\.git", ".DS_Store" }
-- autoformat
lvim.format_on_save = {
  enabled = true,
  timeout = 2000,
}
