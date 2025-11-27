return {
    'nvim-lualine/lualine.nvim',
    enabled = true,
    event = 'VimEnter',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    opts = {
        options = {
            theme = 'catppuccin-mocha',
            section_separators = '',
            component_separators = '',
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch' },
            lualine_c = { 'diff' },
            lualine_x = {
                'diagnostics',
                'lsp',
                'filetype',
            },
            lualine_y = { 'location' },
            lualine_z = { 'progress' },
        },
    },
}
