return {
  "navarasu/onedark.nvim",
  config = function()
    require('onedark').setup {
      style = 'light'
    }
    require("onedark").load()
  end
}
