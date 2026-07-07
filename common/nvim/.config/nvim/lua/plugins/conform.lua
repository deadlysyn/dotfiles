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
