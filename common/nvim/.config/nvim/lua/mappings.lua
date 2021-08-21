local set_keymap = require('common').set_keymap
local nvim_set_keymap = require('common').nvim_set_keymap

-- move lines/selections
set_keymap('n', '<c-j>', ':m .+1<CR>==')
set_keymap('n', '<c-k>', ':m .-2<CR>==')
set_keymap('i', '<c-j>', '<ESC>:m .+1<CR>==gi')
set_keymap('i', '<c-k>', '<ESC>:m .-2<CR>==gi')
set_keymap('v', '<c-j>', ':m \'>+1<CR>gv=gv')
set_keymap('v', '<c-k>', ':m \'<-2<CR>gv=gv')

-- disable search highlight
set_keymap('n', '<leader><cr>', ':noh<cr>')

-- remove ^M's when encodings get messed up
set_keymap('n', '<leader><m>', 'mmHmt:%s/<C-V><cr>//ge<cr>\'tzt\'m')

-- toggle paste mode
-- set_keymap('n', '<leader>pp', ':setlocal paste!<cr>')

-- splits
set_keymap('n', '<up>', ':resize +2<cr>')
set_keymap('n', '<down>', ':resize -2<cr>')
set_keymap('n', '<left>', ':vertical resize +2<cr>')
set_keymap('n', '<right>', ':vertical resize -2<cr>')
set_keymap('n', '<leader>s', '<c-w>w')
set_keymap('n', '<leader>j', '<c-w>j')
set_keymap('n', '<leader>k', '<c-w>k')
set_keymap('n', '<leader>h', '<c-w>h')
set_keymap('n', '<leader>l', '<c-w>l')

-- tabs
set_keymap('n', '<s-Tab>', 'gT')
set_keymap('n', '<Tab>', 'gt')
set_keymap('n', '<leader>t[', '<cmd>tabmove -1<cr>')
set_keymap('n', '<leader>t]', '<cmd>tabmove +1<cr>')
set_keymap('n', '<leader>1', '1gt')
set_keymap('n', '<leader>2', '2gt')
set_keymap('n', '<leader>3', '3gt')
set_keymap('n', '<leader>4', '4gt')
set_keymap('n', '<leader>5', '5gt')
set_keymap('n', '<leader>6', '6gt')
set_keymap('n', '<leader>7', '7gt')
set_keymap('n', '<leader>8', '8gt')
set_keymap('n', '<leader>9', '9gt')
set_keymap('n', '<leader>0', '<cmd>tablast<cr>')

-- buffers
set_keymap('n', '<leader>[', 'bprev')
set_keymap('n', '<leader>]', 'bnext')
-- set_keymap('n', '<leader>bn', ':enew<cr>')
-- set_keymap('n', '<leader>bq', ':bd!<cr>')
-- set_keymap('n', '<leader>ba', ':bufdo bd<cr>')
-- set_keymap('n', '<leader>h', ':bufprevious<cr>')
-- set_keymap('n', '<leader>l', ':bufnext<cr>')
-- set_keymap('n', '<leader>cd', ':cd %:p:h<cr>:pwd<cr>')

-- easy move between windows
set_keymap('n', '<leader><h>', '<c-w>h')
set_keymap('n', '<leader><j>', '<c-w>j')
set_keymap('n', '<leader><k>', '<c-w>k')
set_keymap('n', '<leader><l>', '<c-w>l')

-- LSP
-- set_keymap('n', 'gd' '<cmd>lua vim.lsp.buf.definition()<cr>')
-- set_keymap('n', 'gD' '<cmd>lua vim.lsp.buf.declaration()<cr>')
-- set_keymap('n', 'gr' '<cmd>lua vim.lsp.buf.references()<cr>')
-- set_keymap('n', 'gi' '<cmd>lua vim.lsp.buf.implementation()<cr>')
-- set_keymap('n', 'K' '<cmd>lua vim.lsp.buf.hover()<cr>')
-- set_keymap('n', '<c-k>' '<cmd>lua vim.lsp.buf.signature_help()<cr>')
-- set_keymap('n', '<c-n>' '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>')
-- set_keymap('n', '<c-p>' '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>')
set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<cr>')
set_keymap('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
set_keymap('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
set_keymap('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<cr>')
set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
set_keymap('n', 'U', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
set_keymap('n', '<leader>lr', '<cmd>Telescope lsp_references<cr>')
set_keymap('n', '<leader>ls', '<cmd>Telescope lsp_document_symbols<cr>')
set_keymap('n', '<leader>lS', '<cmd>Telescope lsp_workspace_symbols<cr>')
set_keymap('n', '<leader>lR', '<cmd>lua vim.lsp.buf.rename()<cr>')
set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<cr>')

-- telescope
-- set_keymap('n' '<leader>ps' '<cmd>lua require(\'telescope.builtin\').grep_string({ search = vim.fn.input("Grep For > ")})<CR>')
-- set_keymap('n' '<C-p>' '<cmd>lua require(\'telescope.builtin\').git_files()<CR>')
-- set_keymap('n' '<Leader>pf' '<cmd>lua require(\'telescope.builtin\').find_files()<CR>')
-- set_keymap('n' '<leader>pw' '<cmd>lua require(\'telescope.builtin\').grep_string { search = vim.fn.expand("<cword>") }<CR>')
-- set_keymap('n' '<leader>pb' '<cmd>lua require(\'telescope.builtin\').buffers()<CR>')
-- set_keymap('n' '<leader>vh' '<cmd>lua require(\'telescope.builtin\').help_tags()<CR>')
-- set_keymap('n' '<leader>gw' '<cmd>lua require(\'telescope\').extensions.git_worktree.git_worktrees()<CR>')
-- set_keymap('n' '<leader>gm' '<cmd>lua require(\'telescope\').extensions.git_worktree.create_git_worktree()<CR>')

-- common
set_keymap('n', '<leader>#', '<cmd>let @/ = ""<cr><Esc>')
set_keymap('n', 'n', 'nzzzv')
set_keymap('n', 'N', 'Nzzzv')
set_keymap('n', '<leader>q', '<cmd>q!<cr>')
set_keymap('n', '<leader>e', '<cmd>e!<cr>')
set_keymap('n', '<leader>Q', '<cmd>qa!<cr>')
set_keymap('n', '<leader>w', '<cmd>wq!<cr>')
set_keymap('n', '<leader>n', '<cmd>set nonumber norelativenumber<cr>')
set_keymap('n', '<leader>N', '<cmd>set number<cr>')
set_keymap('n', '<leader>R', '<cmd>set relativenumber<cr>')
-- moving
set_keymap('i', '<c-a>', '<Esc>I')
set_keymap('i', '<c-e>', '<End>')
set_keymap('n', 'k', 'gk')
set_keymap('n', 'j', 'gj')
-- editing
set_keymap('n', 'Y', 'y$')
set_keymap('n', '<a-Up>', '<cmd>m .-2<cr>==')
set_keymap('n', '<a-Down>', '<cmd>m .+1<cr>==')
set_keymap('i', '<c-d>', '<Esc>ddi')
set_keymap('n', '<leader>pp', '"0p')
-- quickfix
set_keymap('n', '<leader>cc', '<cmd>cclose<cr>')
set_keymap('n', '<leader>;', '<cmd>cprev<cr>')
set_keymap('n', "<leader>'", '<cmd>cnext<cr>')
-- command
set_keymap('c', '<c-a>', '<Home>')
set_keymap('c', '<c-e>', '<End>')

-- plug manager
set_keymap('n', '<leader>ps', '<cmd>PackerSync<cr>')
set_keymap('n', '<leader>pi', '<cmd>PackerSync<cr>')
set_keymap('n', '<leader>pu', '<cmd>PackerSync<cr>')

-- nerdtree -- needs new binding
--set_keymap('n', '<c-n>', '<cmd>NERDTreeToggle<cr>')

-- comment
-- nvim_set_keymap('i', '<c-_>', '<Esc><Plug>CommentaryLine', {})
-- nvim_set_keymap('n', '<c-_>', '<Plug>CommentaryLine', {})
-- nvim_set_keymap('v', '<c-_>', '<Plug>Commentary', {})

-- git-blame
-- set_keymap('n', '<leader>gb', '<cmd>GitBlameToggle<cr>')

-- dial.nvim
-- nvim_set_keymap('n', '<c-a>', '<Plug>(dial-increment)', {})
-- nvim_set_keymap('n', '<c-x>', '<Plug>(dial-decrement)', {})
-- nvim_set_keymap('v', '<c-a>', '<Plug>(dial-increment)', {})
-- nvim_set_keymap('v', '<c-x>', '<Plug>(dial-decrement)', {})
-- nvim_set_keymap('v', 'g<c-a>', '<Plug>(dial-increment-additional)', {})
-- nvim_set_keymap('v', 'g<c-x>', '<Plug>(dial-decrement-additional)', {})

-- hop.nvim
-- set_keymap('n', 's', '<cmd>HopChar2<cr>')
-- set_keymap('n', 'S', '<cmd>HopWord<cr>')
-- set_keymap('n', '<c-h>', '<cmd>HopLine<cr>')
