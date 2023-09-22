return {
  "navarasu/onedark.nvim",
  config = function()
    vim.o.background = 'light'
    require('onedark').setup {
      style = 'light'
    }
    require("onedark").load()
  end
}
