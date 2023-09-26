-- Telescope find_files
lvim.builtin.which_key.mappings["tf"] = {
  "<cmd>Telescope find_files<cr>",
  "Telescope find_files",
}
-- Telescope projects
lvim.builtin.which_key.mappings["tp"] = {
  "<cmd>Telescope projects<cr>",
  "Telescope projects",
}
-- Telescope live_grep
lvim.builtin.which_key.mappings["tg"] = {
  "<cmd>Telescope live_grep<cr>",
  "Telescope lvie_grep",
}
-- lazygit
local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

lvim.builtin.which_key.mappings["gG"] = { "<cmd>lua _lazygit_toggle()<CR>", "Float LazyGit" }
-- rust
lvim.builtin.which_key.mappings["C"] = {
  name = "Rust",
  r = { "<cmd>RustRunnables<Cr>", "Runnables" },
  m = { "<cmd>RustExpandMacro<Cr>", "Expand Macro" },
  c = { "<cmd>RustOpenCargo<Cr>", "Open Cargo" },
  p = { "<cmd>RustParentModule<Cr>", "Parent Module" },
  d = { "<cmd>RustDebuggables<Cr>", "Debuggables" },
  R = {
    "<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<Cr>",
    "Reload Workspace",
  },
  y = { "<cmd>lua require'crates'.open_repository()<cr>", "[crates] open repository" },
  P = { "<cmd>lua require'crates'.show_popup()<cr>", "[crates] show popup" },
  i = { "<cmd>lua require'crates'.show_crate_popup()<cr>", "[crates] show info" },
  f = { "<cmd>lua require'crates'.show_features_popup()<cr>", "[crates] show features" },
  D = { "<cmd>lua require'crates'.show_dependencies_popup()<cr>", "[crates] show dependencies" },
}
-- terminal
lvim.builtin.which_key.mappings["t1"] = {
  "<cmd>1ToggleTerm size=15 direction=horizontal<cr>", "Split horizontal"
}
lvim.builtin.which_key.mappings["t2"] = {
  "<cmd>2ToggleTerm size=15 direction=horizontal<cr>", "Split horizontal"
}
lvim.builtin.which_key.mappings["t3"] = {
  "<cmd>3ToggleTerm size=15 direction=horizontal<cr>", "Split horizontal"
}
lvim.builtin.which_key.mappings["t4"] = {
  "<cmd>4ToggleTerm size=15 direction=horizontal<cr>", "Split horizontal"
}
