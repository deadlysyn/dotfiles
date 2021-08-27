local vim = vim
local cmd = vim.cmd
local g   = vim.g

g['prettier#autoformat'] = 1
g['prettier#autoformat_require_pragma'] = 0
g['prettier#exec_cmd_async'] = 0
g['prettier#quickfix_enabled'] = 1 -- doesn't play well with async
g['prettier#exec_cmd_path'] = vim.fn.exepath('prettier')

cmd(
    'autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.yml,*.html PrettierAsync'
)
