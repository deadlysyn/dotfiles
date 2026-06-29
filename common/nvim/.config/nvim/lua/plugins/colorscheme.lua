return {
    'rebelot/kanagawa.nvim',
    enabed = true,
    lazy = false,
    name = 'kanagawa-dragon',
    priority = 1000, -- load before other lazy=false plugins
    config = function()
        vim.cmd.colorscheme('kanagawa-dragon')
    end,
    opts = {},
}
