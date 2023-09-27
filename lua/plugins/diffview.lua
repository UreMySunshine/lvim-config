lvim.builtin.which_key.mappings["D"] = {
  name = "Diffview",
  o = { "<cmd>DiffviewOpen<cr>", "Open DiffView" },
  c = { "<cmd>set hidden<cr><cmd>DiffviewClose<cr><cmd>set nohidden<cr>", "Close DiffView" },
  f = { "<cmd>DiffviewFileHistory %<cr>", "File History" },
}

return {
  "sindrets/diffview.nvim",
  event = "BufRead",
}
