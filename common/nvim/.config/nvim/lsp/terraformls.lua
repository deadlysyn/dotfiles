return {
    cmd = { 'terraform-ls', 'serve' },
    filetypes = { 'terraform', 'terraform-vars' },
    root_markers = { '.terraform', '.git' },
    -- doesn't work...
    -- settings = {
    --     initializationOptions = {
    --         ignoreSingleFileWarning = true,
    --     },
    -- },
    -- noisy
    -- capabilities = {
    --     experimental = {
    --         showReferencesCommandId = 'client.showReferences',
    --     },
    -- },
    on_attach = function(_, bufnr)
        vim.lsp.codelens.enable(true, { bufnr = bufnr })
    end,
}
