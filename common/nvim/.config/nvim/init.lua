-- https://github.com/crispgm/dotfiles/blob/main/nvim
-- https://oroques.dev/notes/neovim-init
local try_require = require('common').try_require

try_require('commands')
try_require('options')
try_require('pack')
try_require('mappings')
-- plugins
try_require('plugins.compe')
try_require('plugins.emmet')
try_require('plugins.gitgutter')
try_require('plugins.lualine')
try_require('plugins.lspconfig')
try_require('plugins.prettier')
try_require('plugins.rust')
try_require('plugins.telescope')
try_require('plugins.treesitter')
try_require('plugins.vsnip')

