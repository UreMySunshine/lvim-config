return {
  "windwp/nvim-ts-autotag",
  config = function()
    require("nvim-ts-autotag").setup()
    lvim.builtin.treesitter.autotag.enable = true
  end,
}
