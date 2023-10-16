return {
  "ggandor/leap.nvim",
  lazy = true,
  keys = { "s", "S" },
  name = "leap",
  config = function()
    require("leap").opts.highlight_unlabeled_phase_one_targets = true
    require("leap").add_default_mappings()
  end,
}
