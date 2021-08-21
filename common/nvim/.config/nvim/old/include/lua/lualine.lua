require'lualine'.setup{
    options = {
        theme = 'gruvbox_material',
        section_separators = '',
        component_separators = '',
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch'},
            lualine_c = {'diagnostics', 'filename'},
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
        },
        extensions = {'fugitive', 'quickfix'}
    }
}
