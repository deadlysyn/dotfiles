-- disable unused plugins
lvim.builtin.alpha.active = false
lvim.builtin.project.active = false
lvim.builtin.terminal.active = false
lvim.builtin.theme.active = false
lvim.builtin.nvimtree.active = false
lvim.builtin.nvimtree.active = false

-- overrides
lvim.format_on_save.enabled = true

lvim.builtin.gitsigns.opts.signs['untracked'] = {
  hl = 'GitSignsAdd',
  text = lvim.icons.ui.BoldLineLeft,
  numhl = 'GitSignsAddNr',
  linehl = 'GitSignsAddLn',
}
lvim.builtin.gitsigns.opts.current_line_blame = true

-- fix HCL comments
-- https://github.com/numToStr/Comment.nvim/issues/382
local ft = require('Comment.ft')
ft.hcl = { '#%s', '/*%s*/' }
require('Comment').setup()

-- require('lspconfig').eslint.setup({})
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#graphql
-- require 'lspconfig'.graphql.setup {}
-- local linters = require('lvim.lsp.null-ls.linters')
-- linters.setup({
--   {
--     command = 'eslint',
--     -- args = { "--no-warn-ignored" },
--     filetypes = {
--       'javascript',
--       'javascriptreact',
--       'typescript',
--       'typescriptreact',
--     },
--   },
-- })
-- local formatters = require('lvim.lsp.null-ls.formatters')
-- formatters.setup({
--   {
--     command = 'prettier',
--     filetypes = {
--       'javascript',
--       'javascriptreact',
--       'typescript',
--       'typescriptreact',
--     },
--   },
-- })

-- import extra configs
local try_require = require('util').try_require
try_require('plugins')
try_require('binds')
try_require('options')
