-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Enable powershell as your default shell
vim.opt.shell = "pwsh.exe -NoLogo"
vim.opt.shellcmdflag =
"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.cmd [[
		let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		set shellquote= shellxquote=
  ]]

-- Set a compatible clipboard manager
vim.g.clipboard = {
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf",
  },
}
vim.opt.relativenumber = true
lvim.builtin.alpha.dashboard.section.header.val = {
  [[██╗  ██╗██╗██████╗  █████╗ ███╗   ███╗██╗ ██████╗ ]],
  [[██║ ██╔╝██║██╔══██╗██╔══██╗████╗ ████║██║██╔═══██╗]],
  [[█████╔╝ ██║██████╔╝███████║██╔████╔██║██║██║   ██║]],
  [[██╔═██╗ ██║██╔══██╗██╔══██║██║╚██╔╝██║██║██║   ██║]],
  [[██║  ██╗██║██║  ██║██║  ██║██║ ╚═╝ ██║██║╚██████╔╝]],
  [[╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝ ╚═════╝ ]],
  [[          /^--^\     /^--^\     /^--^\            ]],
  [[          \____/     \____/     \____/            ]],
  [[         /      \   /      \   /      \           ]],
  [[        |        | |        | |        |          ]],
  [[         \__  __/   \__  __/   \__  __/           ]],
  [[|^|^|^|^|^|^\ \^|^|^|^/ /^|^|^|^|^\ \^|^|^|^|^|^|^|]],
  [[| | | | | | |\ \| | |/ /| | | | | |\ \| | | | | | |]],
  [[| | | | | | / / | | |\ \| | | | | |/ /| | | | | | |]],
  [[| | | | | | \/| | | | \/| | | | | |\/ | | | | | | |]],
  [[###################################################]],
  [[| | | | | | | | | | | | | | | | | | | | | | | | | |]],
  [[| | | | | | | | | | | | | | | | | | | | | | | | | |]],
}
lvim.builtin.alpha.dashboard.section.footer.val = ""
lvim.plugins = {
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()     -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
        require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
      end, 100)
    end,
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      require("gitblame").setup { enabled = false }
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "navarasu/onedark.nvim",
    config = function()
      vim.o.background = 'light'
      require('onedark').setup {
        style = 'light'
      }
      require("onedark").load()
    end
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "mrjones2014/nvim-ts-rainbow",
  },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },
  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup {
        enable = true,   -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0,   -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = {     -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            'class',
            'function',
            'method',
          },
        },
      }
    end
  },
  {
    "ggandor/leap.nvim",
    name = "leap",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle" },
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "kylechui/nvim-surround",
    lazy = true,
    keys = { "cs", "ds", "ys" },
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "max397574/better-escape.nvim",
    lazy = true,
    event = { "InsertEnter" },
    config = function()
      require("better_escape").setup({
        mapping = { "jk", "jl" },
        timeout = 200,
        clear_empty_lines = false,
        keys = "<Esc>",
      })
    end,
  },
  {
    "folke/noice.nvim",
    enabled = ENABLE_NOICE,
    lazy = true,
    event = { "BufRead", "BufNewFile" },
    dependencies = { "rcarriga/nvim-notify", "MunifTanjim/nui.nvim" },
    config = function()
      require("noice").setup({
        lsp = {
          progress = {
            enabled = false,
          },
        },
        presets = {
          bottom_search = false,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = true,
        },
        messages = {
          enabled = true,
          view = "notify",
          view_error = "notify",
          view_warn = "notify",
          view_history = "messages",
          view_search = "virtualtext",
        },
        health = {
          checker = false,
        },
      })
    end,
  },
  {
    "rcarriga/nvim-notify",
    lazy = true,
    event = "VeryLazy",
    config = function()
      local notify = require("notify")
      notify.setup({
        -- "fade", "slide", "fade_in_slide_out", "static"
        stages = "static",
        on_open = nil,
        on_close = nil,
        timeout = 3000,
        fps = 1,
        render = "default",
        background_colour = "Normal",
        max_width = math.floor(vim.api.nvim_win_get_width(0) / 2),
        max_height = math.floor(vim.api.nvim_win_get_height(0) / 4),
        -- minimum_width = 50,
        -- ERROR > WARN > INFO > DEBUG > TRACE
        level = "TRACE",
      })

      vim.notify = notify
    end,
  },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,       -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
      })
    end,
  },
  {
    "petertriho/nvim-scrollbar",
    dependencies = {
      "kevinhwang91/nvim-hlslens",
      "lewis6991/gitsigns.nvim",
    },
    config = function()
      require("scrollbar").setup()
      require("scrollbar.handlers.search").setup({})
      require("scrollbar.handlers.gitsigns").setup({})
    end,
  },
  {
    "folke/persistence.nvim",
    -- Restore last session of current dir
    lazy = true,
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath("config") .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
        pre_save = nil,
      })
    end,
  },
}

vim.api.nvim_create_autocmd("QuitPre", {
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
})
-- theme
lvim.colorscheme = "onedark"
-- rainbow surrounding
lvim.builtin.treesitter.rainbow.enable = true

local linters = require "lvim.lsp.null-ls.linters"
linters.setup({
  {
    command = "shellcheck",
    args = { "--severity", "warning" },
  },
  { command = "eslint", filetypes = { "typescript", "typescriptreact" } }
})
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup({
  {
    command = "prettier",
    filetypes = { "typescript", "typescriptreact" },
  },
})
local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
  {
    command = "proselint",
    args = { "--json" },
    filetypes = { "markdown", "tex" },
  }
})
lvim.format_on_save = true
-- spell check
vim.opt.spell = true
-- setup mapping to call :LazyGit
lvim.builtin.which_key.mappings['gg'] = { "<cmd>:LazyGit<cr>", "Float LazyGit" }
-- Trouble
lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}
-- spectre
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file"
})
-- session
lvim.builtin.which_key.mappings["S"] = {
  name = "+Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" }

}
