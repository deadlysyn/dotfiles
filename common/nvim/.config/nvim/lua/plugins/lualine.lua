vim.pack.add({
    {
        src = 'https://github.com/nvim-lualine/lualine.nvim',
        version = 'master',
    },
})

local progress = vim.ui.progress_status()

require('lualine').setup({
    options = {
        theme = 'kanagawa',
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
        -- lualine_z = { 'progress' },
        lualine_z = { progress },
    },
})
