"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Local customiations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The "^[" is a single character. You enter it by pressing
" Ctrl+v and then ESC.
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum

"colorscheme gruvbox
colorscheme gruvbox-material

" Makes the background transparent.
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE

" This is what sets vim to use 24-bit colors. It will also
" work for any version of neovim newer than 0.1.4.
set background=dark

" open new split panes to right and below
set splitright
set splitbelow

" " turn terminal to normal mode with escape
" tnoremap <Esc> <C-\><C-n>

" " use alt+hjkl to move between split/vsplit panels
" tnoremap <A-h> <C-\><C-n><C-w>h
" tnoremap <A-j> <C-\><C-n><C-w>j
" tnoremap <A-k> <C-\><C-n><C-w>k
" tnoremap <A-l> <C-\><C-n><C-w>l
" nnoremap <A-h> <C-w>h
" nnoremap <A-j> <C-w>j
" nnoremap <A-k> <C-w>k
" nnoremap <A-l> <C-w>l

" " start terminal in insert mode
" au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" " open terminal on ctrl+;
" " uses zsh instead of bash
" function! OpenTerminal()
"   split term://bash
"   resize 10
" endfunction
" nnoremap <c-n> :call OpenTerminal()<CR>

