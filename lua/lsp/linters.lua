local linters = require "lvim.lsp.null-ls.linters"
linters.setup({
  {
    command = "shellcheck",
    args = { "--severity", "warning" },
  },
  {
    command = "eslint_d",
  },
  {
    command = "stylelint",
  },
})
