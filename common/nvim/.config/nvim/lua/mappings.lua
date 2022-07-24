local set_keymap = require('common').set_keymap
-- local nvim_set_keymap = require('common').nvim_set_keymap

-- plug manager
set_keymap('n', '<leader>ps', '<cmd>PackerSync<cr>')

-- common
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
set_keymap('n', 'k', 'gk') -- behave the same for wrapped lines...
set_keymap('n', 'j', 'gj') -- ...

-- editing
set_keymap('n', 'Y', 'y$')
set_keymap('n', '<c-j>', ':m .+1<CR>==') -- move lines/selections
set_keymap('n', '<c-k>', ':m .-2<CR>==') -- ...
set_keymap('i', '<c-j>', '<ESC>:m .+1<CR>==gi') -- ...
set_keymap('i', '<c-k>', '<ESC>:m .-2<CR>==gi') -- ...
set_keymap('v', '<c-j>', ":m '>+1<CR>gv=gv") -- ...
set_keymap('v', '<c-k>', ":m '<-2<CR>gv=gv") -- ...
set_keymap('i', '<c-d>', '<Esc>ddi')
set_keymap('n', '<leader>pp', '"0p')

-- quickfix
set_keymap('n', '<leader>cc', '<cmd>cclose<cr>')
set_keymap('n', '<leader>;', '<cmd>cprev<cr>')
set_keymap('n', "<leader>'", '<cmd>cnext<cr>')

-- command
set_keymap('c', '<c-a>', '<Home>')
set_keymap('c', '<c-e>', '<End>')

-- splits
set_keymap('n', '<up>', ':resize +2<cr>')
set_keymap('n', '<down>', ':resize -2<cr>')
set_keymap('n', '<left>', ':vertical resize +2<cr>')
set_keymap('n', '<right>', ':vertical resize -2<cr>')
set_keymap('n', '<leader>s', '<c-w>w')
set_keymap('n', '<leader>h', '<c-w>h')
set_keymap('n', '<leader>j', '<c-w>j')
set_keymap('n', '<leader>k', '<c-w>k')
set_keymap('n', '<leader>l', '<c-w>l')

-- tabs
set_keymap('n', '<s-tab>', 'gT')
set_keymap('n', '<tab>', 'gt')
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
set_keymap('n', '<leader>[', ':bprev<cr>')
set_keymap('n', '<leader>]', ':bnext<cr>')
-- set_keymap('n', '<leader>bn', ':enew<cr>')
-- set_keymap('n', '<leader>bq', ':bd!<cr>')
-- set_keymap('n', '<leader>ba', ':bufdo bd<cr>')
-- set_keymap('n', '<leader>cd', ':cd %:p:h<cr>:pwd<cr>')

-- lsp
set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
set_keymap('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
set_keymap('n', 'gr', '<cmd>Telescope lsp_references<cr>')
set_keymap('n', 'gs', '<cmd>Telescope lsp_document_symbols<cr>')
-- set_keymap("n", "<leader>lS", "<cmd>Telescope lsp_workspace_symbols<cr>")
set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>')
set_keymap('n', '<leader>F', '<cmd>lua vim.lsp.buf.formatting()<cr>')
set_keymap('n', '<c-n>', '<cmd>lua vim.diagnostic.goto_next()<cr>')
set_keymap('n', '<c-p>', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

-- telescope
set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
set_keymap('n', '<leader>fk', '<cmd>Telescope keymaps<cr>')
set_keymap('n', '<leader>fl', '<cmd>Telescope lsp_document_symbols<cr>')
set_keymap('n', '<leader>gf', '<cmd>Telescope git_files<cr>')
set_keymap('n', '<leader>gs', '<cmd>Telescope git_status<cr>')

-- disable search highlight
set_keymap('n', '<leader><cr>', ':noh<cr>')
