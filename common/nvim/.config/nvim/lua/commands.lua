local autocmd = vim.api.nvim_create_autocmd

-- highlight on yank
autocmd({ 'TextYankPost' }, {
    callback = function()
        vim.highlight.on_yank()
    end,
})

autocmd({ 'FileType' }, {
    callback = function()
        -- vim.opt.filetype.plugin.indent = 'on'
        -- vim.opt.syntax = 'on'
        -- disable automatic comment insertion
        vim.opt_local.formatoptions:remove({ 'c' })
        vim.opt_local.formatoptions:remove({ 'r' })
        vim.opt_local.formatoptions:remove({ 'o' })
        -- delete comment character when joining lines
        vim.opt_local.formatoptions:append({ 'j' })
    end,
})

-- turn on spell check for select file types
autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = { '*.md', '*.rst', '*.html', '*.txt' },
    callback = function()
        vim.opt_local.spell = true
    end,
})
autocmd({ 'FileType' }, {
    pattern = { 'gitcommit' },
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.textwidth = 70
    end,
})

-- use four space tabs for python
autocmd({ 'FileType' }, {
    pattern = 'py',
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.tabstop = 4
    end,
})

-- auto format
-- autocmd BufWritePost *.tf silent! execute "!terraform fmt >/dev/null 2>&1" | redraw!
autocmd({ 'BufWritePre' }, {
    pattern = {
        '*.lua',
        '*.html',
        '*.css',
        '*.js',
        '*.jsx',
        '*.json',
        '*.sh',
        '*.go',
        '*.yml',
        '*.yaml',
    },
    callback = function()
        vim.lsp.buf.format()
    end,
})
-- autocmd({ 'BufWritePre' }, {
--   pattern = { '*.hcl', '*.tf' },
--   callback = function()
--     vim.lsp.buf.format()
--   end
-- })

-- vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = { '*.hcl', '.terraformrc', 'terraform.rc' },
    callback = function()
        vim.opt.filetype = 'hcl'
    end,
})

-- vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
-- autocmd({ 'BufRead', 'BufNewFile' }, {
--   pattern = { '*.tf', '.tfvars'},
--   callback = function()
--     vim.opt.filetype = 'terraform'
--   end
-- })

-- vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])
autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = { '*.tfstate', '.tfstate.backup' },
    callback = function()
        vim.opt.filetype = 'json'
    end,
})

-- vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
-- vim.cmd([[let g:terraform_fmt_on_save=1]])
-- vim.cmd([[let g:terraform_align=1]])
