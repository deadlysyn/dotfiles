local keymap = vim.keymap.set

-- plug manager
keymap('n', '<leader>ps', '<cmd>Lazy sync<cr>')

-- disable search highlight
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- diagnostics
keymap('n', '[d', vim.diagnostic.goto_prev)
keymap('n', ']d', vim.diagnostic.goto_next)
-- keymap('n', '<leader>f', vim.diagnostic.open_float)
keymap('n', '<leader>q', vim.diagnostic.setloclist)

-- keymap('n', '<leader>n', '<cmd>set nonumber norelativenumber<cr>')
-- keymap('n', '<leader>N', '<cmd>set number<cr>')
-- keymap('n', '<leader>R', '<cmd>set relativenumber<cr>')

-- moving
keymap('i', '<c-a>', '<esc>I')
keymap('i', '<c-e>', '<end>')
keymap('n', 'k', 'gk') -- behave the same for wrapped lines...
keymap('n', 'j', 'gj') -- ...
-- keep cursor in middle of screen when jumping
keymap('n', '<c-d>', '<c-d>zz')
keymap('n', '<c-u>', '<c-u>zz')
-- keep search terms in middle of screen
keymap('n', 'n', 'nzzzv')
keymap('n', 'N', 'Nzzzv')
-- navigate splits easier
keymap('n', '<C-h>', '<C-w><C-h>')
keymap('n', '<C-l>', '<C-w><C-l>')
keymap('n', '<C-j>', '<C-w><C-j>')
keymap('n', '<C-k>', '<C-w><C-k>')

-- editing
keymap('n', 'Y', 'y$')
-- move selection
keymap('v', 'J', ":m '>+1<cr>gv=gv")
keymap('v', 'K', ":m '<-2<cr>gv=gv")
keymap('i', '<c-d>', '<esc>ddi')
keymap('n', '<leader>pp', '"0p')
-- keep cursor at same place when joining
keymap('n', 'J', 'mzJ`z')
-- paste over selection without loosing buffer content
keymap('n', '<leader>p', '"_dP')
-- yank to system clipboard
keymap('n', '<leader>y', '"+y')
keymap('n', '<leader>Y', '"+Y')
keymap('v', '<leader>y', '"+y')

-- splits
keymap('n', '<up>', ':resize +2<cr>')
keymap('n', '<down>', ':resize -2<cr>')
keymap('n', '<left>', ':vertical resize +2<cr>')
keymap('n', '<right>', ':vertical resize -2<cr>')

-- tabs
keymap('n', '<s-tab>', 'gT')
keymap('n', '<tab>', 'gt')
keymap('n', '<leader>t[', '<cmd>tabmove -1<cr>')
keymap('n', '<leader>t]', '<cmd>tabmove +1<cr>')
keymap('n', '<leader>1', '1gt')
keymap('n', '<leader>2', '2gt')
keymap('n', '<leader>3', '3gt')
keymap('n', '<leader>4', '4gt')
keymap('n', '<leader>5', '5gt')
keymap('n', '<leader>6', '6gt')
keymap('n', '<leader>7', '7gt')
keymap('n', '<leader>8', '8gt')
keymap('n', '<leader>9', '9gt')
keymap('n', '<leader>0', '<cmd>tablast<cr>')

-- buffers
keymap('n', '<tab>', ':bn<cr>')
keymap('n', '<s-tab>', ':bp<cr>')
