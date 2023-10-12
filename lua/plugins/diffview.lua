lvim.builtin.which_key.mappings["G"] = {
  name = "Diffview",
  o = { "<cmd>DiffviewOpen<cr>", "Open DiffView" },
  c = { "<cmd>set hidden<cr><cmd>DiffviewClose<cr><cmd>set nohidden<cr>", "Close DiffView" },
  f = { "<cmd>DiffviewFileHistory %<cr>", "File History" },
}
lvim.lsp.buffer_mappings.normal_mode["<leader>Gl"] = {
  "<cmd>.DiffviewFileHistory<cr>",
  "File history for the current line"
}
lvim.lsp.buffer_mappings.visual_mode["<leader>Gl"] = {
  "<esc><cmd>'<,'>DiffviewFileHistory<cr>",
  "File history for the visual selection"
}

return {
  "sindrets/diffview.nvim",
  lazy = true,
  event = "BufRead",
}
