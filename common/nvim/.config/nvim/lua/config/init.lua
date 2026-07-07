local try_require = require('util.try').try_require

try_require('config.options')
try_require('config.keymaps')
try_require('config.diagnostics')
try_require('config.autocommands')
try_require('config.lsp')
