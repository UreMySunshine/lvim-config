return {
  "s1n7ax/nvim-window-picker",
  branch = 'release/2.0',
  event = 'VeryLazy',
  config = function()
    -- example mappings you can place in some other place
    -- An awesome method to jump to windows
    local picker = require('window-picker')

    local config = {
      hint = 'floating-big-letter',

      filter_rules = {
        -- when there is only one window available to pick from, use that window
        -- without prompting the user to select
        autoselect_one = true,

        -- whether you want to include the window you are currently on to window
        -- selection or not
        include_current_win = false,

        -- filter using buffer options
        bo = {
          -- if the file type is one of following, the window will be ignored
          filetype = { "notify", "quickfix", "minimap", "noice", "fidget", "sagafinder", "unknown" },

          -- if the buffer type is one of following, the window will be ignored
          buftype = {},
        },
      },

      show_prompt = false,
    }

    picker.setup(config)

    vim.keymap.set("n", ",w", function()
      local window = picker.pick_window(config) or vim.api.nvim_get_current_win()
      vim.api.nvim_set_current_win(window)
    end, { desc = "Pick a window" })

    -- Swap two windows using the awesome window picker
    local function swap_windows()
      local window = picker.pick_window(config)
      local target_buffer = vim.fn.winbufnr(window)
      -- Set the target window to contain current buffer
      vim.api.nvim_win_set_buf(window, 0)
      -- Set current window to contain target buffer
      vim.api.nvim_win_set_buf(0, target_buffer)
    end

    vim.keymap.set('n', ',W', swap_windows, { desc = 'Swap windows' })
  end,
}
