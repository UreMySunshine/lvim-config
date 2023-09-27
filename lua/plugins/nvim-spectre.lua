lvim.lsp.buffer_mappings.normal_mode["<leader>sw"] = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>",
  "Search current word" }
lvim.lsp.buffer_mappings.normal_mode["<leader>se"] = {
  "<cmd>lua require('spectre').open_file_search({select_word=true})<cr>", "Search on current file" }
lvim.lsp.buffer_mappings.visual_mode["<leader>sw"] = { "<esc><cmd>lua require('spectre').open_visual()<cr>",
  "Search on current word" }

return {
  "windwp/nvim-spectre",
  event = "BufRead",
  config = function()
    require("spectre").setup()
  end,
}
