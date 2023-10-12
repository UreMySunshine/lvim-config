return {
  "saecki/crates.nvim",
  lazy = true,
  event = "BufReadPost Cargo.toml",
  version = "v0.3.0",
  dependencies = { "nvim-lua/plenary.nvim", lazy = true },
  config = function()
    require("crates").setup {
      null_ls = {
        enabled = true,
        name = "crates.nvim",
      },
      popup = {
        border = "rounded",
      },
    }
  end,
}
