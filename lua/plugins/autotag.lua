return {
  "windwp/nvim-ts-autotag",
  lazy = true,
  event = "InsertEnter",
  config = function()
    require("nvim-ts-autotag").setup()
    lvim.builtin.treesitter.autotag.enable = true
  end,
}
