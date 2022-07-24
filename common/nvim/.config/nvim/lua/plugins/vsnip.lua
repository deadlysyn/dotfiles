-- Expand
vim.api.nvim_command(
    [[imap <expr> <C-j> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>']]
)
vim.api.nvim_command(
    [[smap <expr> <C-j> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>']]
)
