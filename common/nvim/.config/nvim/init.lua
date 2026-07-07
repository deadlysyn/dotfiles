--[[

    this is my vim config. there are many like it,
    but this one is mine.

    vim is my best friend. it is my life. i must
    master it as i must master my life.

--]]

-- comment when debugging; avoids noise for known deprectaions
vim.deprecate = function() end

-- https://neovim.io/doc/user/lua/#_ui2
require('vim._core.ui2').enable({
    enable = true, -- Whether to enable or disable the UI.
    msg = { -- Options related to the message module.
        ---@type 'cmd'|'msg' Default message target, either in the
        ---cmdline or in a separate ephemeral message window.
        ---@type string|table<string, 'cmd'|'msg'|'pager'> Default message target
        ---or table mapping |ui-messages| kinds and triggers to a target.
        targets = 'cmd',
        cmd = { -- Options related to messages in the cmdline window.
            height = 0.5, -- Maximum height while expanded for messages beyond 'cmdheight'.
        },
        dialog = { -- Options related to dialog window.
            height = 0.5, -- Maximum height.
        },
        msg = { -- Options related to msg window.
            height = 0.5, -- Maximum height.
            timeout = 4000, -- Time a message is visible in the message window.
        },
        pager = { -- Options related to message window.
            height = 1, -- Maximum height.
        },
    },
})

-- set before loading plugins
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- https://github.com/neovim/neovim/commit/ab9a2c49253413dbbb31756a3eeddb354a663035
vim.g.editorconfig_enable = true

local try_require = require('util.try').try_require

try_require('config')
try_require('plugins')
try_require('util.closer')
