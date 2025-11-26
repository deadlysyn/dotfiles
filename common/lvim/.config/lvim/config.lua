-- disable unused plugins
lvim.builtin.alpha.active = false
lvim.builtin.project.active = false
lvim.builtin.terminal.active = false
lvim.builtin.theme.active = false
lvim.builtin.nvimtree.active = false
-- lvim.builtin.illuminate.active = false

-- overrides
lvim.format_on_save = true

lvim.builtin.gitsigns.opts.signs['untracked'] = {
  hl = 'GitSignsAdd',
  text = lvim.icons.ui.BoldLineLeft,
  numhl = 'GitSignsAddNr',
  linehl = 'GitSignsAddLn',
}

-- always show gitblame
-- lvim.builtin.gitsigns.opts.current_line_blame = true

-- fix HCL comments
-- https://github.com/numToStr/Comment.nvim/issues/382
-- local ft = require('Comment.ft')
-- ft.hcl = { '#%s', '/*%s*/' }
-- require('Comment').setup()

require('lspconfig').graphql.setup({})
require('lspconfig').eslint.setup({})
require('lspconfig').terraformls.setup({})
require('lspconfig').tflint.setup({})

local formatters = require('lvim.lsp.null-ls.formatters')
formatters.setup({
  {
    command = 'prettier',
    filetypes = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
    },
  },
})

-- local linters = require('lvim.lsp.null-ls.linters')
-- linters.setup({
--   {
--     command = 'eslint',
--     filetypes = {
--       'javascript',
--       'javascriptreact',
--       'typescript',
--       'typescriptreact',
--     },
--   },
-- })

-- local helpers = require("lvim.lsp.null-ls.helpers")
-- local FORMATTING = require("lvim.lsp.null-ls.methods").internal.FORMATTING
-- require("null-ls").register({
--   helpers.make_builtin({
--       name = "hclfmt",
--       method = FORMATTING,
--       filetypes = { "hcl" },
--       generator_opts = {
--         command = "terragrunt",
--         args = { "hclfmt", "--terragrunt-hclfmt-file", ".", },
--         to_stdin = true,
--       },
--       factory = helpers.formatter_factory,
--     },
--     {
--       name = "tffmt",
--       method = FORMATTING,
--       filetypes = { "terraform" },
--       generator_opts = {
--         command = "terraform",
--         args = { "fmt" },
--         to_stdin = true,
--       },
--       factory = helpers.formatter_factory,
--     }
--   )
-- })

-- import extra configs
local try_require = require('util').try_require
try_require('plugins')
try_require('keymaps')
try_require('options')
