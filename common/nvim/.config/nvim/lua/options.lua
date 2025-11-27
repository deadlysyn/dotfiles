-- https://github.com/nvim-lua/kickstart.nvim
-- https://neovim.io/doc/user/lua-guide.html

vim.g.loaded_perl_provider = 0 -- disable perl provider
vim.g.loaded_ruby_provider = 0 -- disable ruby provider

-- set before loading plugins
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- options
vim.o.background = 'dark'
vim.o.breakindent = true -- enable break indent
vim.o.termguicolors = true
vim.o.encoding = 'utf-8' -- set internal encoding
vim.o.fileencodings = 'utf-8' -- available encodings
vim.o.hidden = true -- hide abandoned buffers
vim.o.backup = false -- no .bak
vim.o.updatetime = 250 -- time (in ms) to write to swap file
vim.o.timeoutlen = 300 -- sequence wait time
vim.o.ttimeout = true
vim.o.ttimeoutlen = 300
vim.o.clipboard = 'unnamedplus' -- use system clipboard
vim.o.scrolloff = 10 -- vertical scroll viewport
-- vim.o.sidescrolloff = 10 -- horizontal scroll viewport
vim.o.ignorecase = true -- case insensitive search
vim.o.smartcase = true -- try to be smart about case
vim.o.joinspaces = false -- no double spaces on join
vim.o.hlsearch = true -- highlight search
vim.o.incsearch = true -- ncseincremental search
vim.o.inccommand = 'split' -- live substitute preview
vim.o.mouse = 'a' -- useful to resize splits
vim.o.backspace = 'indent,eol,start' -- what backspace can traverse
vim.o.showmatch = true -- show bracket match
vim.o.showmode = false -- already in status line
vim.o.errorbells = false -- no annoying sounds on errors
vim.o.visualbell = false -- no annoying flash on errors
vim.o.warn = true -- warn on unsved changes
vim.o.ruler = true -- show line/column numbers
vim.o.switchbuf = 'useopen,usetab,newtab' -- what to consider when switching bufs
vim.o.showtabline = 2 -- always show tabline
vim.o.completeopt = 'menuone,noselect'
vim.o.whichwrap = 'b,h,l,s,<,>,[,]' -- cursor scrolls past/over line end
vim.o.wildmenu = true -- wildmenu, auto complete for commands
vim.o.wildmode = 'longest,full'
vim.o.wildignore = '**/cache/*,**/tmp/*,**/.git/*,**/node_modules/*'
vim.o.wildignorecase = true
vim.o.splitright = true -- split to right
vim.o.splitbelow = true -- split to below
vim.o.shiftround = true -- round indent spacing to shiftwidth
vim.o.shortmess = 'atI'
vim.o.fileencoding = 'utf-8' -- buffer encoding
vim.o.swapfile = false -- no .swap
vim.o.undofile = true -- use undo file
vim.o.expandtab = true -- expand tabs to spaces
vim.o.tabstop = 2 -- tab stop
vim.o.softtabstop = 2 -- soft tab stop
vim.o.shiftwidth = 2 -- auto indent shift width
vim.o.autoindent = true -- auto indent for new line
vim.o.smartindent = true -- "smart" autoindenting
vim.o.modeline = false -- check for modelines; security risk!
vim.o.wrap = false -- disable line wrap
vim.o.colorcolumn = '80' -- demarc long lines
vim.o.foldenable = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true -- highlight current line
vim.o.cursorcolumn = true -- highlight current column
vim.o.list = true -- show tabs with listchars
vim.opt.listchars = { tab = '» ', nbsp = '_', trail = '·' }
vim.o.signcolumn = 'yes' -- show sign column
vim.o.confirm = true -- ask to save on quit

-- keep this last; if spalsh screen appears there are parse issues
vim.opt.shortmess:append('sI') -- disable splash screen
