"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ack.vim / ag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" used to ignore gitignore files
"let $FZF_DEFAULT_COMMAND = 'ag -g ""'
"let Grep_Skip_Dirs = '.git node_modules'

" Use rg (ripgrep) to grep
set grepprg=rg\ --vimgrep\ --no-heading
set grepformat=%f:%l:%c:%m,%f:%l:%m
let g:ackprg = 'rg --vimgrep --no-heading'

" remap '<leader>g' to grep directory for word under cursor
nnoremap <leader>g :Ack! "\b<cword>\b" <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-eslint',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-yaml',
  \ 'coc-pairs',
  \ 'coc-prettier',
  \ 'coc-go',
  \ 'coc-sh',
  \ 'coc-markdownlint',
  \ 'coc-fzf-preview'
  \ ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"nmap <Leader>b :Buffers<CR>
"nmap <Leader>f :Files<CR>

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

"nnoremap <C-p>a :Rg 
nnoremap <C-p> :Rg 

"nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gitgutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Where symbols are displayed
set signcolumn=yes

" Display symbols for git diffs
let g:gitgutter_enabled=1

" Turn symbols off at some point for better performance
let g:gitgutter_max_signs = 500

" Easily turn gitgutter on/off
nnoremap <silent> <leader>gg :GitGutterToggle<cr>

" Use ag vs grep
let g:gitgutter_grep = 'rg'

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_modified_removed = '-'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:airline_theme = 'base16'
"let g:airline_theme = 'gruvbox'
let g:airline_theme = 'gruvbox_material'

" Show open buffers in tabline when only one tab open
let g:airline#extensions#tabline#enabled = 1

" Use straight vs powerline style tabs
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ''

" Adjust tabline format
let g:airline#extensions#tabline#formatter = 'unique_tail'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use goimports instead of gofmt
let g:go_fmt_command = "goimports"

" Enable auto import
let g:go_auto_sameids = 1

" Set up go syntax highlighting
au BufRead,BufNewFile *.go set filetype=go
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" show type info in status line
let g:go_auto_type_info = 1

" don't check for go-vim binaries on each run to speed things up
let g:go_disable_autoinstall = 0

" make all lists quickfix (vs quickfix+location which use different keys)
let g:go_list_type = "quickfix"

" make jumping between errors in go-vim easier
" map <C-n> :cnext<CR>
" map <C-m> :cprevious<CR>
" nnoremap <leader>a :cclose<CR>

" make common go tasks easier in go-vim
au FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>t <Plug>(go-test)
let g:go_test_timeout = '300s'
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap gd <Plug>(go-def-tab)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-json
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vim_json_syntax_conceal = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" force *.md as markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" enable fenced code block syntax highlighting
let g:markdown_fenced_languages = ['html', 'css', 'bash=sh', 'javascript', 'go', 'python']

" disable markdown syntax concealing
let g:markdown_syntax_conceal = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeStatusline = ''
let g:NERDTreeGitStatusWithFlags = 1

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nmap <silent> <C-n> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerd-commenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
vmap cc <plug>NERDCommenterToggle
nmap cc <plug>NERDCommenterToggle

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-supertab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

