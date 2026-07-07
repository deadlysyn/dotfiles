--[[

    this is my vim config. there are many like it,
    but this one is mine.

    vim is my best friend. it is my life. i must
    master it as i must master my life.

--]]

-- comment when debugging; avoids noise for known deprectaions
vim.deprecate = function() end

-- https://neovim.io/doc/user/lua/#_ui2
require('vim._core.ui2').enable()

-- set before loading plugins
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- https://github.com/neovim/neovim/commit/ab9a2c49253413dbbb31756a3eeddb354a663035
vim.g.editorconfig_enable = true

local try_require = require('util.try').try_require

try_require('config')
try_require('plugins')
try_require('util.closer')
