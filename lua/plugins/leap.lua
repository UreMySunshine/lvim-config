return {
  "ggandor/leap.nvim",
  lazy = true,
  event = { "CursorHold", "CursorHoldI" },
  name = "leap",
  config = function()
    require("leap").add_default_mappings()
  end,
}
