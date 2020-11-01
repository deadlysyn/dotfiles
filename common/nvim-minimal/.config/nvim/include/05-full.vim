"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ISO 8601
iab xdate <c-r>=strftime("%Y-%m-%dT%H:%M:%S")<cr>

""""""""""""""""""""""""""""""
" bash
""""""""""""""""""""""""""""""

" Correct highlighting for bash files
au BufRead,BufNewFile *bash* let g:is_bash=1
au BufRead,BufNewFile *bash* setf sh

""""""""""""""""""""""""""""""
" python
""""""""""""""""""""""""""""""

let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f # --- <esc>a
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def
au FileType python set cindent
au FileType python set cinkeys-=0#
au FileType python set indentkeys-=0#

""""""""""""""""""""""""""""""
" yaml
"""""""""""""""""""""""""""""""

" use two space tabs for yaml
au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

