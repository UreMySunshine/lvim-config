return {
  "kevinhwang91/nvim-hlslens",
  lazy = true,
  event = "BufRead",
  config = function()
    require("hlslens").setup()
  end
}
