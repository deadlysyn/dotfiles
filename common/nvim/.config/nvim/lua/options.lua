-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua

-- example capability check
-- local has = vim.fn.has
-- if not has('gui_running') then
--     opt.t_Co = 256
-- end

-- call a function
-- vim.call('fzf#vim#files', '~/projects', false)

-- vim.env gets or sets env vars
-- vim.env.FZF_DEFAULT_OPTS = '--layout=reverse'

-- some vimscript var names are not valid in lua.
-- set this:
--  let g:zoom#statustext = 'Z'
-- like this:
--  g['zoom#statustext'] = 'Z'
local g = vim.g -- global variables
g.t_Co = 256 -- color term support
g.mapleader = ' ' -- must be set early
g.elite_mode = 1 -- unbind arrows (reused to size splits)
g.gruvbox_material_background = 'medium'

-- use these to read values of specific type...
-- local o = vim.opt -- global options
-- local wo = vim.wo -- window options
-- local bo = vim.bo -- buffer options
-- use this to set values of any type...
local set = vim.opt
-- global options
set.background = 'dark'
set.termguicolors = true
set.encoding = 'utf-8' -- set internal encoding
set.fileencodings = 'utf-8' -- available encodings
set.hidden = true -- hide abandoned buffers
set.backup = false -- no .bak
set.updatetime = 300 -- time (in ms) to write to swap file
set.ttimeout = true -- adjust key sequence timeout
set.ttimeoutlen = 100 -- ...
set.clipboard = 'unnamed,unnamedplus' -- one clipboard to rule them all
set.scrolloff = 5 -- vertical scroll viewport
set.sidescrolloff = 5 -- horizontal scroll viewport
set.ignorecase = true -- case insensitive search
set.joinspaces = false -- no double spaces on join
set.smartcase = true -- try to be smart about case
set.hlsearch = true -- highlight search
set.incsearch = true -- no incremental search
set.inccommand = 'nosplit' -- live substitute preview
set.whichwrap = 'b,h,l,s,<,>,[,]' -- cursor scrolls past/over line end
set.backspace = 'indent,eol,start' -- what backspace can traverse
set.showmatch = true -- show bracket match
set.errorbells = false -- no annoying sounds on errors
set.visualbell = false -- no annoying flash on errors
set.warn = true -- warn on unsved changes
set.cmdheight = 2 -- height of :command line
set.ruler = true -- show line/column numbers
set.switchbuf = 'useopen,usetab,newtab' -- what to consider when switching bufs
set.showtabline = 2 -- always show tabline
set.completeopt = 'menuone,noselect'
set.wildmenu = true -- wildmenu, auto complete for commands
set.wildmode = 'longest,full'
set.wildignore = '**/cache/*,**/tmp/*,**/.git/*,**/node_modules/*'
set.wildignorecase = true
set.splitright = true -- split to right
set.splitbelow = true -- split to below
set.shiftround = true -- round indent spacing to shiftwidth
set.shortmess = 'atI'
-- o.shortmess:append('c') -- status line e.g. CTRL+G
-- o.shortmess:prepend('c') -- status line e.g. CTRL+G

-- buffer options
set.fileencoding = 'utf-8' -- buffer encoding
set.swapfile = false -- no .swap
set.undofile = true -- use undo file
set.expandtab = true -- expand tabs to spaces
set.tabstop = 2 -- tab stop
set.softtabstop = 2 -- soft tab stop
set.shiftwidth = 2 -- auto indent shift width
set.autoindent = true -- auto indent for new line
set.smartindent = true -- "smart" autoindenting
set.modeline = false -- check for modelines; security risk!

-- window options
set.wrap = false -- disable line wrap
set.colorcolumn = '80' -- demarc long lines
set.foldenable = false
set.number = true
set.relativenumber = true
set.cursorline = true -- highlight current line
set.cursorcolumn = true -- highlight current column
set.list = true -- show tabs with listchars
set.listchars = 'tab:>-,trail:.,extends:#,nbsp:.'
set.signcolumn = 'yes' -- show sign column
