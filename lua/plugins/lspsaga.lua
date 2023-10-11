lvim.builtin.which_key.mappings["lA"] = { "<cmd>Lspsaga code_action<cr>", "Lspsaga Code Action", noremap = true }
lvim.builtin.which_key.mappings["lR"] = { "<cmd>Lspsaga rename<cr>", "Lspsaga rename project", noremap = true }
lvim.builtin.which_key.mappings["lJ"] = {
  "<cmd>Lspsaga diagnostic_jump_next<cr>",
  "Lspsaga Next Diagnostic",
  noremap = true
}
lvim.builtin.which_key.mappings["lK"] = {
  "<cmd>Lspsaga diagnostic_jump_prev<cr>",
  "Lspsaga Prev Diagnostic",
  noremap = true
}
vim.keymap.set("n", "gf", "<cmd>Lspsaga finder<cr>", { silent = true, desc = "Lspsaga finder" })

return {
  'nvimdev/lspsaga.nvim',
  config = function()
    require('lspsaga').setup({
      symbol_in_winbar = {
        enable = false,
      },
      lightbulb = {
        enable = false,
      },
      finder = {
        default = "ref+imp"
      },
      ui = {
        border = "single",
        devicon = true,
        title = true,
        expand = '🎋',
        collapse = '🎍',
        lines = { '┗', '┣', '┃', '━', '┏' },
        kind = {}
      }
    })
  end,
}
