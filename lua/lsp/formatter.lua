local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup({
  {
    command = "stylelint",
    filetypes = { "scss", "less", "css", "sass" },
  },
  {
    command = "eslint_d",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    args = { "-f", "json", "--stdin", "--stdin-filename", "$FILENAME" },

  },
  {
    command = "prettierd",
    filetypes = { "html", "json", "jsonc", "yaml", "markdown", "markdown.mdx", "graphql", "handlebars" }
  },
  {
    command = "rustfmt",
  },
})
