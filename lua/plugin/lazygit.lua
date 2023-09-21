return {
  "kdheepak/lazygit.nvim",
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    lvim.builtin.which_key.mappings['gg'] = { "<cmd>:LazyGit<cr>", "Float LazyGit" }
  end
}
