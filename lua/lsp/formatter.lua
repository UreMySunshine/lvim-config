local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup({
  {
    command = "prettier",
    filetypes = { "html", "json", "jsonc", "yaml", "markdown", "markdown.mdx", "graphql", "handlebars" },
  },
  {
    command = "stylelint",
    filetypes = { "scss", "less", "css", "sass" },

  },
  {
    command = "eslint",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
})
