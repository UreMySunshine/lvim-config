lvim.builtin.which_key.mappings["S"] = {
  name = "+Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" }
}

return {
  "folke/persistence.nvim",
  -- Restore last session of current dir
  lazy = true,
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  config = function()
    require("persistence").setup({
      dir = vim.fn.expand(vim.fn.stdpath("config") .. "/session/"),
      options = { "buffers", "curdir", "tabpages", "winsize" },
      pre_save = nil,
    })
  end,
}
