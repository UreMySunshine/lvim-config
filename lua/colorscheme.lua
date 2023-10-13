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
  [[####################################################]],
  [[| | | | | | | | | | | | | | | | | | | | | | | | | |]],
  [[| | | | | | | | | | | | | | | | | | | | | | | | | |]],
}
lvim.builtin.alpha.dashboard.section.footer.val = ""
-- theme
vim.o.background = 'light'
lvim.colorscheme = "edge"
-- statusline
lvim.builtin.lualine.extensions = { "toggleterm" }
-- lsp icon
local signs = {
  { name = "DiagnosticSignError", text = "🔥" },
  { name = "DiagnosticSignWarn", text = "🐹" },
  { name = "DiagnosticSignHint", text = "🌈" },
  { name = "DiagnosticSignInfo", text = "🌟" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end
vim.diagnostic.config({
  virtual_text = {
    prefix = "🐼",
  },
  signs = signs,
})
