return {
  "okuuva/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      trigger_events = {                              -- See :h events
        immediate_save = { "BufLeave", "FocusLost" }, -- vim events that trigger an immediate save
        defer_save = {},                              -- vim events that trigger a deferred save (saves after `debounce_delay`)
        cancel_defered_save = {},                     -- vim events that cancel a pending deferred save
      },
      condition = function(buf)
        local fn = vim.fn
        local utils = require("auto-save.utils.data")

        if
            fn.getbufvar(buf, "&modifiable") == 1 and
            utils.not_in(fn.getbufvar(buf, "&filetype"), { "TelescopePrompt" }) and
            utils.not_in(fn.getbufvar(buf, "&buftype"), { "prompt" }) then
          return true -- met condition(s), can save
        end
        return false  -- can't save
      end,
    })
  end,
}
