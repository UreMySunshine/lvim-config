local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup({
  {
    command = "prettier",
  },
  {
    command = "stylelint",
  },
})
