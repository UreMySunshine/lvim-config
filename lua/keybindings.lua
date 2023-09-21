-- setup mapping to call :LazyGit
lvim.builtin.which_key.mappings['gg'] = { "<cmd>:LazyGit<cr>", "Float LazyGit" }
-- diffview
lvim.builtin.which_key.mappings["gD"] = {
  name = "Diffview",
  o = { "<cmd>DiffviewOpen<cr>", "Open DiffView" },
  c = { "<cmd>set hidden<cr><cmd>DiffviewClose<cr>", "Close DiffView" },
  f = { "<cmd>DiffviewFileHistory<cr>", "File History" },
}
-- Trouble
lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}
-- spectre
lvim.lsp.buffer_mappings.normal_mode["<leader>sw"] = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>",
  "Search current word" }
lvim.lsp.buffer_mappings.normal_mode["<leader>sp"] = {
  "<cmd>lua require('spectre').open_file_search({select_word=true})<cr>", "Search on current file" }
lvim.lsp.buffer_mappings.visual_mode["<leader>sw"] = { "<esc><cmd>lua require('spectre').open_visual()<cr>",
  "Search on current word" }
-- session
lvim.builtin.which_key.mappings["S"] = {
  name = "+Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" }
}
