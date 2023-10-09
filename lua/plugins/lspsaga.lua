lvim.builtin.which_key.mappings["la"] = { "<cmd>Lspsaga code_action<cr>", "Lspsaga Code Action" }
lvim.builtin.which_key.mappings["lr"] = { "<cmd>Lspsaga rename<cr>", "Lspsaga Rename" }
lvim.builtin.which_key.mappings["lj"] = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Lspsaga Next Diagnostic" }
lvim.builtin.which_key.mappings["lk"] = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Lspsaga Prev Diagnostic" }
vim.keymap.set("n", "gf", "<cmd>Lspsaga finder<cr>", { silent = true })

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
        default = "ref+def+imp"
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
