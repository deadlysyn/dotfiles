local function on_attach()
    -- TODO: TJ told me to do this and I should do it because he is Telescopic
    -- "Big Tech" "Cash Money" Johnson
end

-- require'lspconfig'.tsserver.setup{ on_attach=on_attach }
-- require'lspconfig'.clangd.setup {
--     on_attach = on_attach,
--     root_dir = function() return vim.loop.cwd() end
-- }

require'lspconfig'.gopls.setup{
    on_attach=on_attach,
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}

-- require'lspconfig'.ansiblels.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.dockerls.setup{}

-- require'lspconfig'.diagnosticls.setup{
--     filetypes = { 'sh' },
-- }

-- require'lspconfig'.groovyls.setup{}

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require'lspconfig'.html.setup{
    capabilities = capabilities,
    filetypes = { "css", "html", "javascript" }
}

require'lspconfig'.jsonls.setup{
    commands = {
        Format = {
            function()
                vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
            end
        }
    }
}

require'lspconfig'.rust_analyzer.setup{ on_attach=on_attach }
require'lspconfig'.terraformls.setup{}
require'lspconfig'.yamlls.setup{}

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
