local vim = vim
local g   = vim.g
-- local cmd = vim.cmd

-- g['prettier#autoformat'] = 1
-- g['prettier#autoformat_require_pragma'] = 0
g['prettier#autoformat_config_files'] = { '.prettierrc', '.prettierrc.yml', '.prettierrc.yaml', '.prettierrc.json' }
g['prettier#exec_cmd_async'] = 0
g['prettier#quickfix_enabled'] = 0 -- doesn't play well with async
g['prettier#exec_cmd_path'] = vim.fn.exepath('prettier')

-- w/o this must trigger with <leader>p
-- cmd(
--     'autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.yml,*.html PrettierAsync'
-- )
