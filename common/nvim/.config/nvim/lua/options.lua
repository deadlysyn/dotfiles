local o   = vim.opt     -- global options
local wo  = vim.wo      -- window options
local bo  = vim.bo      -- buffer options
local g   = vim.g
local has = vim.fn.has

g.mapleader = ' ' -- must be set early
g.elite_mode = 1 -- unbind arrows (reused to size splits)

o.background = 'dark'
o.termguicolors = true
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'
o.fileencodings = { 'utf-8' }
o.hidden = true
o.backup = false -- no .bak
o.swapfile = false -- no .swap
o.undofile = true -- use undo file
o.updatetime = 300 -- time (in ms) to write to swap file
o.ttimeout = true -- adjust key sequence timeout
o.ttimeoutlen = 100 -- ...
o.clipboard = 'unnamed,unnamedplus' -- one clipboard to rule them all
o.scrolloff = 10 -- 10 line scroll viewport
o.ignorecase = true -- case insensitive search
o.smartcase = true -- try to be smart about case
o.hlsearch = true -- highlight search
o.incsearch = false -- no incremental search
o.inccommand = 'nosplit' -- live substitute preview
o.whichwrap = 'b,h,l,s,<,>,[,]' -- cursor scrolls past line end
o.wrap = false -- disable line wrap
o.backspace = { 'indent', 'eol', 'start' } -- backspace behaviors
o.showmatch = true -- show bracket match
o.errorbells = false -- no annoying sounds on errors
o.visualbell = false -- no annoying flash on errors
o.warn = true -- warn on unsved changes
o.cmdheight = 2 -- height of :command line
o.ruler = true -- show ruler line
o.colorcolumn = { 80 } -- display a color column when line is longer than 120 chars
o.switchbuf = 'useopen,usetab,newtab'
o.stal = 2

bo.expandtab = true -- expand tab
bo.tabstop = 4 -- tab stop
bo.softtabstop = 4 -- soft tab stop
bo.autoindent = true -- auto indent for new line
-- bo.smartindent = true -- ...
-- bo.cinwords = 'case,select,switch,if,elif,else,for,while,try,except,finally,def,func,class'
bo.shiftwidth = 4 -- auto indent shift width
-- bo.modeline = true -- give number of lines checked to set commands
-- bo.modelines = 5

wo.foldenable = false
wo.number = true
wo.relativenumber = true
wo.cursorline = true
wo.cursorcolumn = true
wo.list = true -- show tabs with listchars
wo.signcolumn = 'yes' -- show sign column

o.completeopt = { 'menuone', 'noselect' }
-- o.mouse = 'nv' -- enable mouse under normal and visual mode
-- cmd('set mousehide') -- hide mouse when characters are typed

o.wildmenu = true -- wildmenu, auto complete for commands
o.wildmode = { 'longest', 'full' }
o.wildignorecase = true
o.splitright = true -- split to right
o.splitbelow = true -- split to below
o.shortmess:append('c') -- status line e.g. CTRL+G
