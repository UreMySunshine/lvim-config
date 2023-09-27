local CSPELL_CONFIG_FILES = {
  "cspell.json",
  ".cspell.json",
  "cSpell.json",
  ".cspell.config.json",
}

-- find the first cspell.json file in the directory tree
local cspell_config = {
  find_json = function(cwd)
    local cspell_json_file = nil
    for _, file in ipairs(CSPELL_CONFIG_FILES) do
      local path = vim.fn.findfile(file, (cwd or vim.loop.cwd()) .. ";")
      if path ~= "" then
        cspell_json_file = path
        break
      end
    end
    return cspell_json_file
  end,
}

local filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less",
  "html", "json", "jsonc", "yaml", "markdown", "markdown.mdx", "graphql", "handlebars", "lua", "rust" }

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.cspell.with({
      config = cspell_config,
      -- Force the severity to be HINT
      diagnostics_postprocess = function(diagnostic)
        diagnostic.severity = vim.diagnostic.severity.WARN
      end,
      filetypes = filetypes
    }),
    null_ls.builtins.code_actions.cspell.with({
      config = cspell_config,
      on_success = function(cspell_config_file)
        -- format the cspell config file
        os.execute(
          string.format(
            "cat %s | jq -S '.words |= sort' | tee %s > /dev/null",
            cspell_config_file,
            cspell_config_file
          )
        )
      end,
      filetypes = filetypes
    })
  }
})
