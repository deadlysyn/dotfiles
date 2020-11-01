"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Local customiations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" This is what sets vim to use 24-bit colors. It will also
" work for any version of neovim newer than 0.1.4.
" The "^[" is a single character. You enter it by pressing
" Ctrl+v and then ESC.
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum

colorscheme gruvbox-material
set background=dark

" Makes the background transparent.
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE

" open new split panes to right and below
set splitright
set splitbelow

