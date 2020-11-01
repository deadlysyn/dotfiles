if !exists('g:vscode')
  call plug#begin('~/.config/nvim/plugged')
    "Plug 'chriskempson/base16-vim'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'
    Plug 'mileszs/ack.vim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'sheerun/vim-polyglot'
    Plug 'elzr/vim-json'
    Plug 'stephpy/vim-yaml'
    Plug 'ervandew/supertab'
    Plug 'preservim/nerdtree'
    Plug 'wesQ3/vim-windowswap'
    Plug 'godlygeek/tabular'
    " Plug 'preservim/nerdcommenter'
    " Plug 'Xuyuanp/nerdtree-git-plugin'
    " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'ryanoasis/vim-devicons'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'leafgarland/typescript-vim'
    " Plug 'peitalin/vim-jsx-typescript'
    " Plug 'HerringtonDarkholme/yats.vim'
    "Plug 'morhetz/gruvbox'
  call plug#end()

  source ~/.config/nvim/include/00-simple.vim
  source ~/.config/nvim/include/05-full.vim
  source ~/.config/nvim/include/10-plugin.vim
  source ~/.config/nvim/include/99-custom.vim
endif

