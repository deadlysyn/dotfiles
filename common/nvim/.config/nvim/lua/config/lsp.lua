local function augroup(name)
    return vim.api.nvim_create_augroup('user_' .. name, { clear = true })
end

local default_keymaps = {
    {
        keys = '<leader>ca',
        func = vim.lsp.buf.code_action,
        desc = 'Code Actions',
    },
    { keys = '<leader>cr', func = vim.lsp.buf.rename, desc = 'Code Rename' },
    {
        keys = '<leader>k',
        func = vim.lsp.buf.hover,
        desc = 'Hover Documentation',
        has = 'hoverProvider',
    },
    {
        keys = 'K',
        func = vim.lsp.buf.hover,
        desc = 'Hover (alt)',
        has = 'hoverProvider',
    },
    {
        keys = 'gd',
        func = vim.lsp.buf.definition,
        desc = 'Goto Definition',
        has = 'definitionProvider',
    },
}

local completion = vim.g.completion_mode or 'blink' -- or 'native' for built-in completion
vim.api.nvim_create_autocmd('LspAttach', {
    -- group = vim.api.nvim_create_augroup('_lsp-attach', { clear = true }),
    -- callback = function(args)
    --     local client = vim.lsp.get_client_by_id(args.data.client_id)
    --     if client and client.server_capabilities then
    --         client.server_capabilities.semanticTokensProvider = nil
    --     end
    -- end

    group = augroup('lsp_attach'),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local buf = args.buf
        if client then
            -- Built-in completion
            if
                completion == 'native'
                and client:supports_method('textDocument/completion')
            then
                vim.lsp.completion.enable(
                    true,
                    client.id,
                    args.buf,
                    { autotrigger = true }
                )
            end

            -- Inlay hints
            if client:supports_method('textDocument/inlayHint') then
                vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
            end

            if client:supports_method('textDocument/documentColor') then
                vim.lsp.document_color.enable(true, { bufnr = buf }, {
                    style = 'virtual',
                })
            end

            for _, km in ipairs(default_keymaps) do
                -- Only bind if there's no `has` requirement, or the server supports it
                if not km.has or client.server_capabilities[km.has] then
                    vim.keymap.set(km.mode or 'n', km.keys, km.func, {
                        buffer = buf,
                        desc = 'LSP: ' .. km.desc,
                        nowait = km.nowait,
                    })
                end
            end
        end
    end,
})

-- lsp configs: https://github.com/neovim/nvim-lspconfig/tree/master/lsp
vim.lsp.enable({
    'bashls',
    'cssls',
    'gopls',
    'helm_ls',
    'html',
    'jsonls', -- error on load
    'lua_ls',
    'ruff',
    'terraformls',
    'ts_ls',
    -- 'yamlls', -- error on load
})

-- Format on save implementation
vim.api.nvim_create_user_command('FormatDisable', function(opts)
    if opts.bang then
        vim.b.disable_autoformat = true
    else
        vim.g.disable_autoformat = true
    end
    vim.notify(
        'Autoformat disabled' .. (opts.bang and ' (buffer)' or ' (global)'),
        vim.log.levels.WARN
    )
end, { desc = 'Disable autoformat-on-save', bang = true })

vim.api.nvim_create_user_command('FormatEnable', function()
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
    vim.notify('Autoformat enabled', vim.log.levels.INFO)
end, { desc = 'Re-enable autoformat-on-save' })

local auto_format = true

vim.keymap.set('n', '<leader>uf', function()
    auto_format = not auto_format
    if auto_format then
        vim.cmd('FormatEnable')
    else
        vim.cmd('FormatDisable')
    end
end, { desc = 'Toggle Autoformat' })

vim.api.nvim_create_autocmd('BufWritePre', {
    group = augroup('autoformat'),
    callback = function(args)
        local bufnr = args.buf
        local ignore_filetypes = { 'sql' }
        if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
            return
        end
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
        end
        if vim.api.nvim_buf_get_name(bufnr):match('/node_modules/') then
            return
        end
        vim.lsp.buf.format({
            bufnr = bufnr,
            timeout_ms = 2000,
        })
    end,
})
