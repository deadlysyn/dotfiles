"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" elite mode, no arrows (so we can rebind them)
let g:elite_mode=1

" Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
    nnoremap <Up>    :resize +2<CR>
    nnoremap <Down>  :resize -2<CR>
    nnoremap <Left>  :vertical resize +2<CR>
    nnoremap <Right> :vertical resize -2<CR>
endif

" Enable filetype plugins
filetype plugin on
filetype indent on

" With a map leader it's possible to do extra key combinations
let mapleader = " "

" Fast saving
nmap <leader>w :w!<cr>

" Use Unix as the standard file type
set ffs=unix,dos,mac

" make navigating files and buffers easier
set wildmenu
set wildignorecase

" Ignore cruft
set wildignore=*~,*.swp,*.bak,*/.DS_Store
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.pdb,*.min.*,*.o
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=tags
set wildignore+=*.tar.*

" Write file contents when calling :make
set autowrite

" Plugin refresh time
set updatetime=300

" Adjust key sequence timeout
set ttimeout
set ttimeoutlen=100

" Use system clipboard
set clipboard+=unnamedplus

" I find folding confusing, and it causes glitches in
" some plugins.
set nofoldenable

" disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" See 10 lines around the cursor when moving vertically
set scrolloff=5

" Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
" set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Warn when there are unsaved changes
set warn

" Turn on line numbers
set nu

" Don't send special characters with backspace
set t_kb=

set laststatus=2
set cmdheight=2

" Enable modelines
set modeline
set modelines=5

" Crosshair-highlight cursor
set cursorline
set cursorcolumn

" Delete comment character when joining commented lines
set formatoptions+=j

" performance tuning
set noshowmode noshowcmd noruler

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colors and fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
"syntax enable
syntax on

" Truecolor support
set termguicolors

" Show colored column to help prevent long lines
"set colorcolumn=80

" Highlight unwanted spaces
set list
set listchars=tab:>\ ,trail:~,extends:>,precedes:<,nbsp:+

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git etc
set nobackup
set nowritebackup
set nowb
set noswapfile

" Turn persistent undo on
set undofile

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" text, tab and indenting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Keep Python happy
set expandtab
set shiftwidth=4
set tabstop=4

" Soft wrap lines
"set wrap
"set linebreak

" Disable line wrap
set nowrap

set autoindent
set smartindent

" Smart indenting after certain words
set cinwords=case,select,switch,if,elif,else,for,while,try,except,finally,def,func,class

" Delete trailing white space on save, only useful for some filetypes!
" E.g. This would break markdown.
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

autocmd BufWritePre *.txt,*.js,*.py,*.sh,*.go :call CleanExtraSpaces()

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" A buffer becomes hidden when it is abandoned
set hidden

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Open new buffer
map <leader>bn :enew<cr>

" Close the current buffer
map <leader>bq :bd!<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
set switchbuf=useopen,usetab,newtab
set stal=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap VIM 0 to first non-blank character
map 0 ^

" Easily move lines or visual blocks
" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
" Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Run macro on visual selection by pressing '@'
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set spelllang=en
set spellfile=~/.local/share/nvim/site/spell/en.utf-8.add

" Pressing <leader>ss will toggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Turn on spell-checking for select filetypes
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.rst setlocal spell
autocmd BufRead,BufNewFile *.html setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell

" git commits
autocmd FileType gitcommit setlocal spell
autocmd Filetype gitcommit setlocal spell textwidth=72

