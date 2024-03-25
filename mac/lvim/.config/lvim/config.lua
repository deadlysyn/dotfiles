-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.builtin.alpha.active = false
lvim.builtin.project.active = false
lvim.builtin.terminal.active = false
lvim.builtin.theme.active = false

-- needs to come before setting colorscheme
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_better_performance = 1
lvim.colorscheme = "gruvbox-material"
lvim.format_on_save = true

lvim.plugins = {
  { "sainnhe/gruvbox-material" },
  { "editorconfig/editorconfig-vim" },
  { "farmergreg/vim-lastplace" },
  { "crispgm/nvim-go" },
}

-- defaults: https://github.com/LunarVim/LunarVim/blob/master/lua/lvim/config/settings.lua
vim.opt.mouse = ""                          -- disable mouse
vim.opt.background = 'dark'
vim.opt.ttimeout = true                     -- adjust key sequence timeout
vim.opt.joinspaces = false                  -- no double spaces on join
vim.opt.incsearch = true                    -- no incremental search
vim.opt.inccommand = 'nosplit'              -- live substitute preview
vim.opt.whichwrap = 'b,h,l,s,<,>,[,]'       -- cursor scrolls past/over line end
vim.opt.backspace = 'indent,eol,start'      -- what backspace can traverse
vim.opt.showmatch = true                    -- show bracket match
vim.opt.errorbells = false                  -- no annoying sounds on errors
vim.opt.visualbell = false                  -- no annoying flash on errors
vim.opt.warn = true                         -- warn on unsved changes
vim.opt.switchbuf = 'useopen,usetab,newtab' -- what to consider when switching bufs
vim.opt.showtabline = 2                     -- always show tabline
vim.opt.wildmenu = true                     -- wildmenu, auto complete for commands
vim.opt.autoindent = true                   -- auto indent for new line
vim.opt.smartindent = true                  -- "smart" autoindenting
vim.opt.modeline = false                    -- check for modelines; security risk!
vim.opt.wrap = false                        -- disable line wrap
vim.opt.colorcolumn = '80'                  -- demarc long lines
vim.opt.foldenable = false
vim.opt.cursorcolumn = true                 -- highlight current column
vim.opt.list = true                         -- show tabs with listchars
vim.opt.wildmode = 'longest,full'
vim.opt.wildignore = '**/cache/*,**/tmp/*,**/.git/*,**/node_modules/*'
vim.opt.wildignorecase = true
-- vim.opt.shortmess = 'atI'
-- vim.opt.shiftround = true  -- round indent spacing to shiftwidth
-- vim.opt.softtabstop = 2    -- soft tab stop
-- vim.opt.listchars = 'tab:>-,trail:.,extends:#,nbsp:.'

-- experiment to see if we get better vim-go behavior
-- see :help hidden
vim.opt.hidden = false
-- https://github.com/akinsho/bufferline.nvim/issues/610
-- lvim.builtin.bufferline.options.custom_filter = function(buf, buf_nums)
--   return vim.fn.bufname(buf) == "[No Name]"
-- end

lvim.builtin.gitsigns.opts.signs["untracked"] = {
  hl = "GitSignsAdd",
  text = lvim.icons.ui.BoldLineLeft,
  numhl = "GitSignsAddNr",
  linehl = "GitSignsAddLn",
}
lvim.builtin.gitsigns.opts.current_line_blame = true

-- <tab> and <shift-tab> navigation
-- lvim.keys.normal_mode["<tab>"] = "gt"
-- lvim.keys.normal_mode["<s-tab>"] = "gT"
lvim.keys.normal_mode["<tab>"] = ":bn<CR>"
lvim.keys.normal_mode["<s-tab>"] = ":bp<CR>"
