--[[

    this is my vim config. there are many like it,
    but this one is mine.

    vim is my best friend. it is my life. i must
    master it as i must mater my life.

--]]

-- comment when debugging; avoids noise for known deprectaions
vim.deprecate = function() end

local try_require = require('util').try_require

-- load early before plugins
try_require 'settings'

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    lazyrepo,
    lazypath,
  }
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
require('lazy').setup {
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
  install = { colorscheme = { 'catppuccin-mocha' } },
  -- automatically check for plugin updates
  checker = { enabled = false },
}

try_require 'keymaps'
try_require 'autocommands'
try_require 'closer'

-- do we need this?
vim.cmd 'filetype plugin on'
vim.cmd 'filetype indent on'
vim.cmd 'syntax on'
