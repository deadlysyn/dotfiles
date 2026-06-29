--[[

    this is my vim config. there are many like it,
    but this one is mine.

    vim is my best friend. it is my life. i must
    master it as i must master my life.

--]]

-- comment when debugging; avoids noise for known deprectaions
vim.deprecate = function() end

local try_require = require('util').try_require

-- load early before plugins
try_require('settings')

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        '--branch=stable',
        lazyrepo,
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
            { out, 'WarningMsg' },
            { '\nPress any key to exit...' },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- setup lazy.nvim
require('lazy').setup({
    defaults = {
        -- try installing latest stable version if plugin supports semver
        version = '*',
    },
    spec = {
        -- import plugins directory
        { import = 'plugins' },
    },
    ui = {
        border = 'rounded',
    },
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { 'kanagawa-dragon' } },
    -- automatically check for plugin updates
    checker = { enabled = false },
})

try_require('keymaps')
try_require('autocommands')
try_require('closer')
try_require('lsp')

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
