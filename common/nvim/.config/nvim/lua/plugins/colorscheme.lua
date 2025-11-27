return {
    'catppuccin/nvim',
    enabed = true,
    lazy = false,
    name = 'catppuccin',
    priority = 1000, -- load before other lazy=false plugins
    config = function()
        vim.cmd.colorscheme('catppuccin-mocha')
    end,
    opts = {
        flavor = 'mocha',
        auto_integrations = true,
    },
}
