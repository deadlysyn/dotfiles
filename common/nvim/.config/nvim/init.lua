-- inspiration:
-- https://github.com/crispgm/dotfiles/blob/main/nvim
-- https://oroques.dev/notes/neovim-init

-- TODO: hot reload
-- https://neovim.discourse.group/t/reload-init-lua-and-all-require-d-scripts/971
-- https://github.com/ThePrimeagen/.dotfiles/blob/master/nvim/.config/nvim/lua/theprimeagen/init.lua

local try_require = require('common').try_require

try_require('commands')
try_require('options')
try_require('packages')
try_require('mappings')
try_require('plugins.cmp')
try_require('plugins.emmet')
try_require('plugins.gitsigns')
try_require('plugins.lspconfig')
try_require('plugins.lualine')
try_require('plugins.markdown')
try_require('plugins.nvim-go')
try_require('plugins.prettier')
try_require('plugins.rust')
-- try_require('plugins.tabnine')
try_require('plugins.telescope')
try_require('plugins.treesitter')
try_require('plugins.vsnip')
