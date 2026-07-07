vim.pack.add({
    {
        src = 'https://github.com/mfussenegger/nvim-lint',
        name = 'lint',
        version = 'master',
    },
})

require('lint').linters_by_ft = {
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
}

vim.api.nvim_create_autocmd(
    { 'BufWritePost', 'BufReadPost', 'InsertLeave', 'TextChanged' },
    {
        callback = function()
            require('lint').try_lint()
        end,
    }
)
