return {
  "zbirenbaum/copilot.lua",
  lazy = true,
  event = "InsertEnter",
  config = function()
    vim.defer_fn(function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
        },
      }) -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
    end, 100)
  end,
}
