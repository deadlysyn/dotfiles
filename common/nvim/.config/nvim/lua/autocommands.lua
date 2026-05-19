local autocmd = vim.api.nvim_create_autocmd

-- temp hack https://github.com/neovim/neovim/issues/36257
autocmd({ 'LspAttach' }, {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})

-- highlight on yank
autocmd({ 'TextYankPost' }, {
    callback = function()
        vim.highlight.on_yank({
            higroup = 'Search',
            timeout = 100,
        })
    end,
})

autocmd({ 'FileType' }, {
    callback = function()
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

-- auto format -- handled by conform
-- autocmd({ 'BufWritePre' }, {
--     pattern = {
--         '*.lua',
--         '*.sh',
--         '*.go',
--         '*.hcl',
--         '*.html',
--         '*.css',
--         '*.js',
--         '*.jsx',
--         '*.md',
--         '*.ts',
--         '*.tsx',
--         '*.tf',
--         '*.json',
--         '*.yml',
--         '*.yaml',
--     },
--     callback = function()
--         vim.lsp.buf.format()
--     end,
-- })

autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = { '*.hcl', '.terraformrc', 'terraform.rc' },
    callback = function()
        vim.opt_local.filetype = 'hcl'
    end,
})

autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = { '*.tf', '.tfvars' },
    callback = function()
        vim.opt_local.filetype = 'terraform'
    end,
})

autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = { '*.tfstate', '.tfstate.backup' },
    callback = function()
        vim.opt_local.filetype = 'json'
    end,
})
