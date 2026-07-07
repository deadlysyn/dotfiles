vim.pack.add({
    {
        src = 'https://github.com/rebelot/kanagawa.nvim',
        -- name = 'kanagawa-dragon',
        version = 'master',
    },
})

-- vim.cmd.colorscheme('kanagawa-dragon')

-- hack: https://github.com/rebelot/kanagawa.nvim/issues/260
local dragon_theme =
    require('kanagawa.colors').setup({ theme = 'dragon' }).theme

dragon_theme.ui.bg_gutter = 'none'

require('kanagawa').setup({
    colors = {
        theme = {
            wave = {
                ui = dragon_theme.ui,
            },
            all = {
                ui = { bg_gutter = 'none' },
            },
        },
    },
    overrides = function(colors)
        local current_theme = colors.theme
        return {
            -- more uniform colors for popups
            Pmenu = {
                fg = current_theme.ui.shade0,
                bg = current_theme.ui.bg_p1,
            },
            PmenuSel = { fg = 'NONE', bg = current_theme.ui.bg_p2 },
            PmenuSbar = { bg = current_theme.ui.bg_m1 },
            PmenuThumb = { bg = current_theme.ui.bg_p2 },

            -- borderless telescope
            TelescopeTitle = { fg = current_theme.ui.special, bold = true },
            TelescopePromptNormal = { bg = current_theme.ui.bg_p1 },
            TelescopePromptBorder = {
                fg = current_theme.ui.bg_p1,
                bg = current_theme.ui.bg_p1,
            },
            TelescopeResultsNormal = {
                fg = current_theme.ui.fg_dim,
                bg = current_theme.ui.bg_m1,
            },
            TelescopeResultsBorder = {
                fg = current_theme.ui.bg_m1,
                bg = current_theme.ui.bg_m1,
            },
            TelescopePreviewNormal = { bg = current_theme.ui.bg_dim },
            TelescopePreviewBorder = {
                bg = current_theme.ui.bg_dim,
                fg = current_theme.ui.bg_dim,
            },
        }
    end,
})

vim.cmd.colorscheme('kanagawa')
