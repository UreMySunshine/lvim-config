return {
  "f-person/git-blame.nvim",
  lazy = true,
  event = "BufRead",
  config = function()
    vim.cmd "highlight default link gitblame SpecialComment"
    require("gitblame").setup { enabled = false }
  end,
}
