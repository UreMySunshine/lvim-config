return {
  'nvim-telescope/telescope-ui-select.nvim',
  lazy = true,
  enabled = lvim.builtin.telescope.active,
  config = function()
    require("telescope").load_extension("ui-select")
  end
}
