local linters = require "lvim.lsp.null-ls.linters"
linters.setup({
  {
    command = "shellcheck",
    args = { "--severity", "warning" },
  },
  {
    command = "eslint",
  },
  {
    command = "cspell",
    args = { "--severity", "warning" },
  },
  {
    command = "stylelint",
  },
})

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup({
  {
    command = "prettier",
  },
  {
    command = "stylelint",
  },
})

local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
  {
    command = "proselint",
    args = { "--json" },
    filetypes = { "markdown", "tex" },
  }
})
