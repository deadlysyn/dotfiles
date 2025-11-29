return {
  'nvimtools/none-ls.nvim',
  enabled = true,
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local null_ls = require 'null-ls'
    null_ls.setup {
      sources = {
        -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
        null_ls.builtins.code_actions.refactoring,
        -- null_ls.builtins.code_actions.textlint,
        null_ls.builtins.completion.spell,
        null_ls.builtins.completion.luasnip,
        -- null_ls.builtins.diagnostics.editorconfig_checker,
        null_ls.builtins.diagnostics.hadolint,
        null_ls.builtins.diagnostics.kube_linter,
        -- null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.revive,
        -- null_ls.builtins.diagnostics.semgrep,
        -- null_ls.builtins.diagnostics.stylelint,
        null_ls.builtins.diagnostics.terraform_validate,
        null_ls.builtins.diagnostics.terragrunt_validate,
        -- null_ls.builtins.diagnostics.textlint,
        null_ls.builtins.diagnostics.trivy,
        null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.hclfmt,
        null_ls.builtins.formatting.markdownlint,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.terraform_fmt,
        null_ls.builtins.formatting.terragrunt_fmt,
      },
    }
  end,
  opts = {},
}
