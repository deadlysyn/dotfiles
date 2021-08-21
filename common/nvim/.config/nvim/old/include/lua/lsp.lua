require('lspconfig').bashls.setup({})
require('lspconfig').cssls.setup({})
require('lspconfig').gopls.setup({})
require('lspconfig').html.setup({})
require('lspconfig').jsonls.setup({})
require('lspconfig').rust_analyzer.setup({})
require('lspconfig').terraformls.setup{}
require('lspconfig').yamlls.setup{}

-- require'lspconfig'.ansiblels.setup{}
-- require'lspconfig'.dockerls.setup{}
-- require'lspconfig'.diagnosticls.setup{
--     filetypes = { 'sh' },
-- }

--Enable (broadcasting) snippet capability for completion
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- require'lspconfig'.html.setup{
--     capabilities = capabilities,
--     filetypes = { "css", "html", "javascript" }
-- }

-- require'lspconfig'.jsonls.setup{
--     commands = {
--         Format = {
--             function()
--                 vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
--             end
--         }
--     }
-- }

-- local opts = {
--     -- whether to highlight the currently hovered symbol
--     -- disable if your cpu usage is higher than you want it
--     -- or you just hate the highlight
--     -- default: true
--     highlight_hovered_item = true,

--     -- whether to show outline guides
--     -- default: true
--     show_guides = true,
-- }

-- require('symbols-outline').setup(opts)

