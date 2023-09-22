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
-- terminal
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

lvim.builtin.which_key.mappings["gg"] = { "<cmd>lua _lazygit_toggle()<CR>", "Float LazyGit" }
