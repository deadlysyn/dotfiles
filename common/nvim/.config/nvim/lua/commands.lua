vim.cmd([[

" let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"

colorscheme gruvbox-material
filetype plugin indent on
syntax on

set grepprg=rg
set grepformat=%f:%l:%c:%m

" disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" delete comment character when joining lines
autocmd FileType * setlocal formatoptions+=j

" turn on spell check for select file types
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.rst setlocal spell
autocmd BufRead,BufNewFile *.html setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell
autocmd FileType gitcommit setlocal spell
autocmd Filetype gitcommit setlocal spell textwidth=70

" use four space tabs for python
autocmd FileType yaml setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4

" auto format
autocmd BufWritePre *.html lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.css lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.json lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.sh lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.yml lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.coffee lua vim.lsp.buf.formatting_sync(nil, 100)

]])
