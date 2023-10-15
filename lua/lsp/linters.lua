local linters = require "lvim.lsp.null-ls.linters"
linters.setup({
  {
    command = "shellcheck",
    args = { "--severity", "warning" },
  },
  {
    command = "eslint_d",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    args = { "-f", "json", "--stdin", "--stdin-filename", "$FILENAME" },
  },
  {
    command = "stylelint",
  },
})
