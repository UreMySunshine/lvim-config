local plugins = {}
local fn = vim.fn

for _, file in ipairs(fn.readdir(get_config_dir() .. "/lua/plugins", [[v:val =~ '\.lua$']])) do
  table.insert(plugins, require('plugins.' .. file:gsub('%.lua$', ''))
  )
end

lvim.plugins = plugins
-- lvim.plugins = {
--   require "plugin.copilot",
--   require "plugin.git-blame",
--   require "plugin.nvim-colorizer",
--   require "plugin.onedark",
--   require "plugin.diffview",
--   require "plugin.rainbow-delimiters",
--   require "plugin.lazygit",
--   require "plugin.nvim-lastplace",
--   require "plugin.nvim-treesitter-context",
--   require "plugin.leap",
--   require "plugin.trouble",
--   require "plugin.todo-comment",
--   require "plugin.nvim-surround",
--   require "plugin.better-escape",
--   require "plugin.notice",
--   require "plugin.notify",
--   require "plugin.nvim-spectre",
--   require "plugin.neoscroll",
--   require "plugin.persistence",
--   require "plugin.autotag",
--   require "plugin.minimap",
--   require("plugin.auto-save")
-- }
