vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.cmd([[highlight AdCustomFold guifg=#bf8040]])

return {
  'kevinhwang91/nvim-ufo',
  dependencies = {
    "kevinhwang91/promise-async",
    {
      "luukvbaal/statuscol.nvim",
      lazy = true,
      config = function()
        local builtin = require("statuscol.builtin")
        require("statuscol").setup({
          segments = {
            { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
            { text = { "%s" },             click = "v:lua.ScSa" },
            {
              text = { builtin.lnumfunc, " " },
              condition = { true, builtin.not_empty },
              click = "v:lua.ScLa",
            }
          },
        })
      end,
    },
  },
  lazy = true,
  event = "BufReadPost",
  config = function()
    local handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = (" 🐳 -- %d "):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0

      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end

      -- Second line
      local lines = vim.api.nvim_buf_get_lines(0, lnum, lnum + 1, false)
      local secondLine = nil
      if #lines == 1 then
        secondLine = lines[1]
      elseif #lines > 1 then
        secondLine = lines[2]
      end
      if secondLine ~= nil then
        table.insert(newVirtText, { secondLine, "AdCustomFold" })
      end

      table.insert(newVirtText, { suffix, "MoreMsg" })

      return newVirtText
    end

    -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    require('ufo').setup({
      provider_selector = function()
        return { 'treesitter', 'indent' }
      end,
      fold_virt_text_handler = handler,
    })
  end
}
