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
" javascript
"""""""""""""""""""""""""""""""

" run prettier-eslint on javascript files
"autocmd FileType javascript set formatprg=prettier-eslint\ --stdin

" format on save
"autocmd BufWritePre *.js :normal gggqG

" au FileType javascript setl fen
" au FileType javascript setl nocindent
" au FileType javascript imap <c-t> $log();<esc>hi
" au FileType javascript imap <c-a> alert();<esc>hi
" au FileType javascript inoremap <buffer> $r return
" au FileType javascript inoremap <buffer> $f // --- PH<esc>FP2xi

""""""""""""""""""""""""""""""
" yaml
"""""""""""""""""""""""""""""""

" use two space tabs for yaml
au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
