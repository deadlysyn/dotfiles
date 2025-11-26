return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
        vim.cmd.colorscheme('catppuccin-mocha')
    end,
    opts = {
        -- enable specifics not on by default
        integrations = {
            bufferline = true,
            mason = true,
        },
    },
}
