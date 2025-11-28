-- https://github.com/nvim-lua/kickstart.nvim
-- https://neovim.io/doc/user/lua-guide.html

vim.g.loaded_perl_provider = 0 -- disable perl provider
vim.g.loaded_ruby_provider = 0 -- disable ruby provider

-- set before loading plugins
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- options
vim.o.autoindent = true -- auto indent for new line
vim.o.background = 'dark'
vim.o.backspace = 'indent,eol,start' -- what backspace can traverse
vim.o.backup = false -- no .bak
vim.o.breakindent = true -- enable break indent
vim.o.clipboard = 'unnamedplus' -- use system clipboard
vim.o.cmdheight = 1
vim.o.colorcolumn = '80' -- demarc long lines
vim.o.confirm = true -- ask to save on quit
vim.o.cursorcolumn = true -- highlight current column
vim.o.cursorline = true -- highlight current line
vim.o.encoding = 'utf-8' -- set internal encoding
vim.o.errorbells = false -- no annoying sounds on errors
vim.o.expandtab = true -- expand tabs to spaces
vim.o.fileencodings = 'utf-8' -- available encodings
vim.o.fileencoding = 'utf-8' -- buffer encoding
vim.o.foldenable = false
vim.o.hidden = true -- hide abandoned buffers
vim.o.hlsearch = true -- highlight search
vim.o.ignorecase = true -- case insensitive search
vim.o.inccommand = 'split' -- live substitute preview
vim.o.incsearch = true -- ncseincremental search
vim.o.joinspaces = false -- no double spaces on join
vim.o.modeline = false -- check for modelines; security risk!
vim.o.mouse = 'a' -- useful to resize splits
vim.o.number = true
vim.o.pumheight = 10 -- popup menu height
vim.o.relativenumber = true
vim.o.ruler = true -- show line/column numbers
vim.o.scrolloff = 7 -- vertical scroll viewport
vim.o.shiftround = true -- round indent spacing to shiftwidth
vim.o.shiftwidth = 2 -- auto indent shift width
vim.o.shortmess = 'atI'
vim.o.showmatch = true -- show bracket match
vim.o.showmode = false -- already in status line
vim.o.showtabline = 2 -- always show tabline
vim.o.sidescrolloff = 7 -- horizontal scroll viewport
vim.o.signcolumn = 'yes' -- show sign column
vim.o.smartcase = true -- try to be smart about case
vim.o.smartindent = true -- "smart" autoindenting
vim.o.softtabstop = 2 -- soft tab stop
vim.o.splitbelow = true -- split to below
vim.o.splitright = true -- split to right
vim.o.swapfile = false -- no .swap
vim.o.switchbuf = 'useopen,usetab,newtab' -- what to consider when switching bufs
vim.o.tabstop = 2 -- tab stop
vim.o.termguicolors = true
vim.o.timeoutlen = 500 -- sequence wait time
vim.o.ttimeoutlen = 500
vim.o.ttimeout = true
vim.o.undofile = true -- use undo file
vim.o.updatetime = 100 -- faster completion
vim.o.visualbell = false -- no annoying flash on errors
vim.o.warn = true -- warn on unsved changes
vim.o.wildignore = '**/cache/*,**/tmp/*,**/.git/*,**/node_modules/*'
vim.o.wildignorecase = true
vim.o.wildmenu = true -- wildmenu, auto complete for commands
vim.o.wildmode = 'longest,full'
vim.o.wrap = false -- disable line wrap

vim.o.list = true -- show tabs with listchars
vim.opt.listchars = { tab = '» ', nbsp = '_', trail = '·' }

vim.opt.completeopt = { 'menuone', 'noselect' }
vim.opt.shortmess:append('c') -- avoid redundant messages from completion menu
vim.opt.whichwrap:append('b,h,l,s,<,>,[,]') -- cursor scrolls past/over line end
-- keep this last; if spalsh screen appears there are parse issues
vim.opt.shortmess:append('I') -- disable splash screen
