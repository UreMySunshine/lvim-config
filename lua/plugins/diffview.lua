lvim.builtin.which_key.mappings["G"] = {
  name = "Diffview",
  o = { "<cmd>DiffviewOpen<cr>", "Open DiffView" },
  c = { "<cmd>set hidden<cr><cmd>DiffviewClose<cr><cmd>set nohidden<cr>", "Close DiffView" },
  f = { "<cmd>DiffviewFileHistory %<cr>", "File History" },
  l = {
    function()
      local current_line = vim.fn.line(".")
      local file = vim.fn.expand("%")
      -- DiffviewFileHistory --follow -L{current_line},{current_line}:{file}
      local cmd =
          string.format("DiffviewFileHistory -L%s,%s:%s", current_line, current_line, file)
      vim.cmd(cmd)
    end,
    "Line DiffView",
    mode = "n",
  },
}

return {
  "sindrets/diffview.nvim",
  event = "BufRead",
}
