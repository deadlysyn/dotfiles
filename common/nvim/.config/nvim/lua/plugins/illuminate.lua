vim.pack.add({
    {
        src = 'https://github.com/RRethy/vim-illuminate',
        version = 'master',
    },
})

require('illuminate').configure({
    delay = 300,
    under_cursor = false,
    providers = {
        'lsp',
        'treesitter',
        'regex',
    },
    filetypes_denylist = {
        'dirbuf',
        'dirvish',
        'NvimTree',
        'lazy',
        'TelescopePrompt',
    },
})
