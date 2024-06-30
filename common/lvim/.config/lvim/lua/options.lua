-- defaults: https://github.com/LunarVim/LunarVim/blob/master/lua/lvim/config/settings.lua
-- vim.opt.mouse = ''                          -- disable mouse
vim.opt.background = 'dark'
vim.opt.clipboard = '' -- keep vim and system clipboards separate
vim.opt.ttimeout = true -- adjust key sequence timeout
vim.opt.joinspaces = false -- no double spaces on join
vim.opt.incsearch = true -- no incremental search
vim.opt.hlsearch = false -- don't keep search terms highlighted
vim.opt.inccommand = 'nosplit' -- live substitute preview
vim.opt.backspace = 'indent,eol,start' -- what backspace can traverse
vim.opt.showmatch = true -- show bracket match
vim.opt.errorbells = false -- no annoying sounds on errors
vim.opt.visualbell = false -- no annoying flash on errors
vim.opt.warn = true -- warn on unsved changes
vim.opt.switchbuf = 'useopen,usetab,newtab' -- what to consider when switching bufs
vim.opt.wildmenu = true -- wildmenu, auto complete for commands
vim.opt.autoindent = true -- auto indent for new line
vim.opt.smartindent = true -- "smart" autoindenting
vim.opt.modeline = false -- check for modelines; security risk!
vim.opt.wrap = false -- disable line wrap
vim.opt.whichwrap = 'b,h,l,s,<,>,[,]' -- cursor scrolls past/over line end
vim.opt.colorcolumn = '80' -- demarc long lines
vim.opt.foldenable = false -- folds just confuse me
vim.opt.cursorcolumn = true -- highlight current column
vim.opt.list = true -- show tabs with listchars
vim.opt.relativenumber = true
vim.opt.wildmode = 'longest,full'
vim.opt.wildignore = '**/cache/*,**/tmp/*,**/.git/*,**/node_modules/*'
vim.opt.wildignorecase = true

-- vim.opt.shortmess = 'atI'
-- vim.opt.shiftround = true  -- round indent spacing to shiftwidth
-- vim.opt.softtabstop = 2    -- soft tab stop
vim.opt.listchars = 'tab:->,trail:.,extends:#,nbsp:.'

---- experiment to see if we get better vim-go behavior
-- see :help hidden
vim.opt.hidden = false
