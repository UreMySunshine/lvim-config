-- lazygit
local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  count = "0",
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

lvim.builtin.which_key.mappings["GG"] = { "<cmd>lua _lazygit_toggle()<CR>", "Float LazyGit" }
