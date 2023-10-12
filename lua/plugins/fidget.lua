return {
  "j-hui/fidget.nvim",
  branch = "legacy",
  lazy = true,
	event = "LspAttach",
  config = function()
    require("fidget").setup()
  end,
}
