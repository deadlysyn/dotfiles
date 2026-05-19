return {
    'stevearc/conform.nvim',
    enabled = true,
    lazy = true,
    cmd = 'ConformInfo',
    keys = {
        {
            -- Customize or remove this keymap to your liking
            '<leader>f',
            function()
                require('conform').format({
                    async = true,
                    lsp_format = 'fallback',
                    timeout_ms = 3000,
                })
            end,
            mode = { 'n', 'x' },
            desc = 'Format buffer',
        },
    },
    opts = {
        -- Define your formatters
        formatters_by_ft = {
            bash = { 'shfmt' },
            sh = { 'shfmt' },
            go = { 'gofmt' },
            hcl = { 'terragrunt_fmt' },
            javascript = { 'prettierd', 'prettier', stop_after_first = true },
            javascriptreact = {
                'prettierd',
                'prettier',
                stop_after_first = true,
            },
            typescript = { 'prettierd', 'prettier', stop_after_first = true },
            typescriptreact = {
                'prettierd',
                'prettier',
                stop_after_first = true,
            },
            css = { 'prettierd', 'prettier', stop_after_first = true },
            html = { 'prettierd', 'prettier', stop_after_first = true },
            json = { 'prettierd', 'prettier', stop_after_first = true },
            yaml = { 'prettierd', 'prettier', stop_after_first = true },
            lua = { 'stylua' },
            python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' },
            terraform = { 'terraform_fmt' },
        },
        default_format_opts = {
            async = false,
            quiet = false,
            lsp_format = 'fallback',
            timeout_ms = 3000,
        },
        format_on_save = {
            lsp_format = 'fallback',
            timeout_ms = 500,
        },
        formatters = {
            shfmt = {
                append_args = { '-i', '2' },
            },
        },
    },
}
