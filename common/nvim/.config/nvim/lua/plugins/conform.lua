vim.pack.add({
    {
        src = 'https://github.com/stevearc/conform.nvim',
        version = 'master',
    },
})

require('conform').setup({
    -- https://github.com/stevearc/conform.nvim/tree/master/lua/conform/formatters
    formatters_by_ft = {
        bash = { 'shfmt' },
        sh = { 'shfmt' },
        go = { 'goimports', 'gofmt', stop_after_first = true },
        hcl = { 'terragrunt_fmt' },
        javascript = { 'biome', 'prettier', stop_after_first = true },
        javascriptreact = {
            'biome',
            'prettier',
            stop_after_first = true,
        },
        lua = { 'stylua' },
        rust = { 'rustfmt' },
        typescript = { 'biome', 'prettier', stop_after_first = true },
        typescriptreact = {
            'biome',
            'prettier',
            stop_after_first = true,
        },
        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'biome', 'prettier', stop_after_first = true },
        -- yaml = { 'prettier', stop_after_first = true },
        python = {
            'ruff_fix',
            'ruff_format',
            'ruff_organize_imports',
        },
        terraform = { 'terraform_fmt' },
    },
    default_format_opts = {
        async = false,
        quiet = false,
        lsp_format = 'fallback',
        timeout_ms = 3000,
    },
    format_on_save = function(bufnr)
        local ignore_filetypes = { 'sql', 'yaml', 'yml' }
        if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
            return
        end
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
        end
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if bufname:match('/node_modules/') then
            return
        end
        return { timeout_ms = 500, lsp_format = 'fallback' }
    end,
    formatters = {
        biome = { require_cwd = true },
        shfmt = {
            append_args = { '-i', '2' },
        },
        terragrunt_fmt = {
            inherit = false,
            command = 'terragrunt',
            args = { 'hcl', 'fmt', '--file', '$FILENAME' },
            stdin = false,
            condition = function(_, ctx)
                return string.find(vim.fs.basename(ctx.filename), '.hcl')
            end,
        },
    },
})

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

vim.keymap.set(
    { 'n', 'v' },
    '<leader>cn',
    '<cmd>ConformInfo<cr>',
    { desc = 'Conform Info' }
)

vim.keymap.set({ 'n', 'v' }, '<leader>cf', function()
    require('conform').format({ async = true }, function(err, did_edit)
        if not err and did_edit then
            vim.notify(
                'Code formatted',
                vim.log.levels.INFO,
                { title = 'Conform' }
            )
        end
    end)
end, { desc = 'Format buffer' })

vim.keymap.set({ 'n', 'v' }, '<leader>cF', function()
    require('conform').format({ formatters = { 'injected' }, timeout_ms = 3000 })
end, { desc = 'Format Injected Langs' })
