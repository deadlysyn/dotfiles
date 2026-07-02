return {
    'mfussenegger/nvim-lint',
    enabled = true,
    lazy = true,
    config = function()
        vim.api.nvim_create_autocmd(
            { 'BufWritePost', 'BufReadPost', 'InsertLeave', 'TextChanged' },
            {
                callback = function()
                    require('lint').try_lint()
                end,
            }
        )
    end,
    opts = {
        linters_by_ft = {
            bash = { 'shellcheck' },
            go = { 'staticcheck' },
            javascript = { 'eslint' },
            javascriptreact = { 'eslint' },
            py = { 'ruff' },
            sh = { 'shellcheck' },
            terraform = { 'tflint' },
            typescript = { 'eslint' },
            typescriptreact = { 'eslint' },
            yaml = { 'yamllint' },
        },
    },
}
