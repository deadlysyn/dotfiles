set nocompatible

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if !exists('g:vscode')
  call plug#begin('~/.config/nvim/plugged')
    Plug 'hoob3rt/lualine.nvim'

    " telescope + dependencies
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'

    Plug 'neovim/nvim-lspconfig'
    Plug 'glepnir/lspsaga.nvim'

    " completion and snippets
    Plug 'hrsh7th/nvim-compe'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    Plug 'rafamadriz/friendly-snippets'

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    Plug 'editorconfig/editorconfig-vim'
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " pick one
    " Plug 'ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons'

    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'sheerun/vim-polyglot'
    Plug 'elzr/vim-json'
    Plug 'stephpy/vim-yaml'
    " Plug 'rust-lang/rust.vim'
    " Plug 'racer-rust/vim-racer'
    " Plug 'leafgarland/typescript-vim'
    " Plug 'peitalin/vim-jsx-typescript'

    " replaced with lualine
    " Plug 'vim-airline/vim-airline'
    " replaced with telescope
    " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
    " Plug 'junegunn/fzf.vim'
    " Plug 'mileszs/ack.vim'
    " replaced with compe
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Using gruvbox-material copied from git...
    " Plug 'morhetz/gruvbox'
  call plug#end()

  source ~/.config/nvim/include/00-simple.vim
  source ~/.config/nvim/include/05-full.vim
  source ~/.config/nvim/include/10-plugin.vim
  source ~/.config/nvim/include/99-custom.vim

  luafile ~/.config/nvim/include/lua/lualine.lua
  " luafile ~/.config/nvim/include/lua/evil-lualine.lua
  luafile ~/.config/nvim/include/lua/compe.lua
  luafile ~/.config/nvim/include/lua/treesitter.lua
  luafile ~/.config/nvim/include/lua/lsp.lua
  luafile ~/.config/nvim/include/lua/telescope.lua
endif

