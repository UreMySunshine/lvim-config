return {
  "luukvbaal/statuscol.nvim",
  lazy = true,
  config = function()
    local builtin = require("statuscol.builtin");
    require("statuscol").setup({
      segments = {
        {
          sign = { name = { "Diagnostic" }, auto = true },
          click = "v:lua.ScSa"
        },
        {
          sign = { name = { "DapBreakpoint*" }, auto = true },
          click = "v:lua.ScSa"
        },
        {
          text = { builtin.lnumfunc, " " },
          condition = { true, builtin.not_empty },
          click = "v:lua.ScLa",
        },
        {
          sign = { name = { "GitSign*" }, },
          click = "v:lua.ScSa"
        },
        {
          text = { builtin.foldfunc, " " },
          click = "v:lua.ScFa"
        },
      },
    })
  end,
}
