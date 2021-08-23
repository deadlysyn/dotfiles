local cmd = vim.cmd

cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')
cmd('colorscheme gruvbox-material')
-- cmd('colorscheme everforest')
cmd('filetype plugin indent on')
-- transparent background
-- cmd('highlight Normal ctermbg=NONE guibg=NONE')
-- cmd('highlight NonText ctermbg=NONE guibg=NONE')
cmd('syntax on')
-- disable automatic comment insertion
cmd(
    'autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o'
)
-- delete comment character when joining lines
cmd('autocmd FileType * setlocal formatoptions+=j')
-- return to last edit position
-- turn on spell check for select file types
cmd('autocmd BufRead,BufNewFile *.md setlocal spell')
cmd('autocmd BufRead,BufNewFile *.rst setlocal spell')
cmd('autocmd BufRead,BufNewFile *.html setlocal spell')
cmd('autocmd BufRead,BufNewFile *.txt setlocal spell')
cmd('autocmd FileType gitcommit setlocal spell')
cmd('autocmd Filetype gitcommit setlocal spell textwidth=70')
-- use two space tabs for yaml
cmd(
    'autocmd FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2'
)
-- auto format
cmd('autocmd BufWritePre *.html lua vim.lsp.buf.formatting_sync(nil, 100)')
cmd('autocmd BufWritePre *.css lua vim.lsp.buf.formatting_sync(nil, 100)')
cmd('autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)')
cmd('autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)')
cmd('autocmd BufWritePre *.json lua vim.lsp.buf.formatting_sync(nil, 100)')
cmd('autocmd BufWritePre *.sh lua vim.lsp.buf.formatting_sync(nil, 100)')
cmd('autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 100)')
cmd('autocmd BufWritePre *.yml lua vim.lsp.buf.formatting_sync(nil, 100)')
