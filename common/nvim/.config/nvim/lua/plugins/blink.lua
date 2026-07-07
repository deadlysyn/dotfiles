vim.pack.add({
    {
        src = 'https://github.com/saghen/blink.cmp',
        version = vim.version.range('^1'),
    },
})

-- Lazy load on first insert mode entry (may not necessary)
local group = vim.api.nvim_create_augroup('BlinkCmpLazyLoad', { clear = true })

vim.api.nvim_create_autocmd('InsertEnter', {
    pattern = '*',
    group = group,
    once = true,
    callback = function()
        require('blink.cmp').setup({
            -- 'default' (recommended) for mappings similar to built-in completions
            --   <c-y> to accept ([y]es) the completion.
            --    This will auto-import if your LSP supports it.
            --    This will expand snippets if the LSP sent a snippet.
            -- 'super-tab' for tab to accept
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- <tab>/<s-tab>: move to right/left of your snippet expansion
            -- <c-space>: Open menu or open docs if already open
            -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
            -- <c-e>: Hide menu
            -- <c-k>: Toggle signature help
            keymap = { preset = 'default' },
            appearance = {
                nerd_font_variant = 'mono',
                use_nvim_cmp_as_default = true,
            },
            completion = {
                documentation = { auto_show = false },
            },
            sources = {
                -- default = { 'lsp', 'path', 'snippets', 'buffer' },
                default = { 'lsp', 'path', 'buffer' },
            },
            fuzzy = { implementation = 'prefer_rust_with_warning' },
            -- snippets = { preset = 'luasnip' },
            signature = { enabled = true },
        })
    end,
})
