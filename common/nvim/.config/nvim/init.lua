--[[

    this is my vim config. there are many like it,
    but this one is mine.

    vim is my best friend. it is my life. i must
    master it as i must mater my life.

--]]

--- try requiring a submodule and do not crash all the configs
local function try_require(name)
    local ok, _ = pcall(require, name)
    if not ok then
        local msg = string.format(
            'The configuration is not fully loaded. Requiring `%s` failed. Check the path and syntax.',
            name
        )
        vim.api.nvim_echo(
            { { 'init.lua', 'ErrorMsg' }, { ' ' .. msg } },
            true,
            {}
        )
    end
end

try_require('options') -- load early before plugins

-- Bootstrap lazy.nvim
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
-- Setup lazy.nvim
require('lazy').setup({
    defaults = {
        -- try installing latest stable version if plugin supports semver
        version = '*',
    },
    spec = {
        -- import plugins directory
        { import = 'plugins' },
    },
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { 'catppuccin-mocha' } },
    -- automatically check for plugin updates
    checker = { enabled = false },
})

try_require('mappings')
try_require('commands')
