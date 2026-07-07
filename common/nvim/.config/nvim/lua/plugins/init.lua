local try_require = require('util.try').try_require

-- shared dependencies
vim.pack.add({
    {
        src = 'https://github.com/nvim-tree/nvim-web-devicons',
        version = 'nerd-v2-compat',
    },
})

try_require('plugins.snacks') -- setup early
try_require('plugins.colorscheme')
try_require('plugins.autopairs')
try_require('plugins.blink')
try_require('plugins.bufferline')
try_require('plugins.conform')
try_require('plugins.gitsigns')
try_require('plugins.illuminate')
try_require('plugins.lualine')
try_require('plugins.nvim-lint')
try_require('plugins.schemastore')
