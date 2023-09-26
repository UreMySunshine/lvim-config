lvim.autocommands = {
  -- auto open minimap
  {
    "BufWinEnter", -- see `:h autocmd-events`
    {              -- this table is passed verbatim as `opts` to `nvim_create_autocmd`
      command = ":lua MiniMap.open()"
    },
  },
  -- auto format when save
  {
    "User",
    {
      pattern = { "AutoSaveWritePre" },
      group = "autosave",
      callback = function(opts)
        if opts.data.saved_buffer ~= nil then
          vim.cmd("lua require('lvim.lsp.utils').format()")
        end
      end,
    },
  },
  -- auto close nvim-tree when last file
  {
    "QuitPre",
    {
      callback = function()
        local tree_wins = {}
        local floating_wins = {}
        local wins = vim.api.nvim_list_wins()
        for _, w in ipairs(wins) do
          local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
          if bufname:match("NvimTree_") ~= nil then
            table.insert(tree_wins, w)
          end
          if vim.api.nvim_win_get_config(w).relative ~= '' then
            table.insert(floating_wins, w)
          end
        end
        if 1 == #wins - #floating_wins - #tree_wins then
          -- Should quit, so we close all invalid windows.
          for _, w in ipairs(tree_wins) do
            vim.api.nvim_win_close(w, true)
          end
        end
      end
    }
  },
  {
    "ModeChanged",
    {
      callback = function()
        local current_mode = vim.fn.mode()
        if current_mode == 'n' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#8aa872' })
          vim.fn.sign_define('smoothcursor', { text = '' })
        elseif current_mode == 'v' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#bf616a' })
          vim.fn.sign_define('smoothcursor', { text = '' })
        elseif current_mode == 'V' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#bf616a' })
          vim.fn.sign_define('smoothcursor', { text = '' })
        elseif current_mode == '�' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#bf616a' })
          vim.fn.sign_define('smoothcursor', { text = '' })
        elseif current_mode == 'i' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#668aab' })
          vim.fn.sign_define('smoothcursor', { text = '' })
        end
      end
    }
  }
}
