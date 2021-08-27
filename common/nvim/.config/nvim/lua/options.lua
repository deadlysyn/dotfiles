local o = vim.opt -- global options
local wo = vim.wo -- window options
local bo = vim.bo -- buffer options
local g = vim.g

-- example capability check
-- local has = vim.fn.has
-- if not has('gui_running') then
--     opt.t_Co = 256
-- end

g.t_Co = 256 -- color term support
g.mapleader = ' ' -- must be set early
g.elite_mode = 1 -- unbind arrows (reused to size splits)
g.gruvbox_material_background = 'medium'

o.background = 'dark'
o.termguicolors = true
o.encoding = 'utf-8' -- set internal encoding
o.fileencodings = { 'utf-8' } -- available encodings
o.hidden = true -- hide abandoned buffers
o.backup = false -- no .bak
o.updatetime = 300 -- time (in ms) to write to swap file
o.ttimeout = true -- adjust key sequence timeout
o.ttimeoutlen = 100 -- ...
o.clipboard = 'unnamed,unnamedplus' -- one clipboard to rule them all
o.scrolloff = 5 -- vertical scroll viewport
o.sidescrolloff = 5 -- horizontal scroll viewport
o.ignorecase = true -- case insensitive search
o.joinspaces = false -- no double spaces on join
o.smartcase = true -- try to be smart about case
o.hlsearch = true -- highlight search
o.incsearch = true -- no incremental search
o.inccommand = 'nosplit' -- live substitute preview
o.whichwrap = 'b,h,l,s,<,>,[,]' -- cursor scrolls past/over line end
o.backspace = { 'indent', 'eol', 'start' } -- what backspace can traverse
o.showmatch = true -- show bracket match
o.errorbells = false -- no annoying sounds on errors
o.visualbell = false -- no annoying flash on errors
o.warn = true -- warn on unsved changes
o.cmdheight = 2 -- height of :command line
o.ruler = true -- show line/column numbers
o.switchbuf = 'useopen,usetab,newtab' -- what to consider when switching bufs
o.showtabline = 2 -- always show tabline
o.completeopt = 'menuone,noselect'
o.wildmenu = true -- wildmenu, auto complete for commands
o.wildmode = { 'longest', 'full' }
o.wildignorecase = true
o.splitright = true -- split to right
o.splitbelow = true -- split to below
o.shiftround = true -- round indent spacing to shiftwidth
o.shortmess = "atI"
-- o.shortmess:append('c') -- status line e.g. CTRL+G

-- no toxic mouse-culinity
-- o.mouse = 'nv' -- enable mouse under normal and visual mode
-- cmd('set mousehide') -- hide mouse when characters are typed

bo.fileencoding = 'utf-8' -- buffer encoding
bo.swapfile = false -- no .swap
bo.undofile = true -- use undo file
bo.expandtab = true -- expand tabs to spaces
bo.tabstop = 2 -- tab stop
bo.softtabstop = 2 -- soft tab stop
bo.shiftwidth = 2 -- auto indent shift width
bo.autoindent = true -- auto indent for new line
bo.smartindent = true -- "smart" autoindenting
bo.modeline = false -- check for modelines; security risk!

wo.wrap = false -- disable line wrap
wo.colorcolumn = '80' -- demarc long lines
wo.foldenable = false
wo.number = true
wo.relativenumber = true
wo.cursorline = true -- highlight current line
wo.cursorcolumn = true -- highlight current column
wo.list = true -- show tabs with listchars
wo.listchars = "tab:>-,trail:.,extends:#,nbsp:."
wo.signcolumn = 'yes' -- show sign column
