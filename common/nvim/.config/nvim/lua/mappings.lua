local keymap = vim.keymap.set

-- plugin manager
keymap('n', '<leader>ps', '<cmd>Lazy sync<cr>')

-- disable search highlight
keymap('n', '<esc>', '<cmd>nohlsearch<cr>')

-- diagnostics
keymap('n', '[d', vim.diagnostic.goto_prev)
keymap('n', ']d', vim.diagnostic.goto_next)
-- keymap('n', '<leader>f', vim.diagnostic.open_float)
keymap('n', '<leader>q', vim.diagnostic.setloclist)

-- toggle relative line numbers
keymap('n', '<leader>n', function()
    vim.o.number = true
    vim.o.relativenumber = true
end)
keymap('n', '<leader>nn', function()
    vim.o.number = true
    vim.o.relativenumber = false
end)
keymap('n', '<leader>N', function()
    vim.o.number = false
    vim.o.relativenumber = false
end)

-- navigation
keymap('i', '<c-a>', '<esc>I') -- jump to beginning of word
keymap('i', '<c-e>', '<end>') -- jump to end of word
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
-- splits
keymap('n', '<up>', ':resize +2<cr>')
keymap('n', '<down>', ':resize -2<cr>')
keymap('n', '<left>', ':vertical resize +2<cr>')
keymap('n', '<right>', ':vertical resize -2<cr>')

-- editing
keymap('n', 'Y', 'y$')
-- move selection
keymap('v', 'J', ":m '>+1<cr>gv=gv")
keymap('v', 'K', ":m '<-2<cr>gv=gv")
-- keep cursor at same place when joining
keymap('n', 'J', 'mzJ`z')

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
keymap('n', '<tab>', '<cmd>bn<cr>')
keymap('n', '<s-tab>', '<cmd>bp<cr>')

-- keys = {
--     { 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>' },
--     { 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>' },
--     { 'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>' },
--     { 'K', '<cmd>lua vim.lsp.buf.hover()<cr>' },
--     { '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>' },
--     { 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>' },
--     { 'gr', '<cmd>Telescope lsp_references<cr>' },
--     { 'gs', '<cmd>Telescope lsp_document_symbols<cr>' },
--     { '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>' },
--     { '<leader>F', '<cmd>lua vim.lsp.buf.format()<cr>' },
--     { '<c-n>', '<cmd>lua vim.diagnostic.goto_next()<cr>' },
--     { '<c-p>', '<cmd>lua vim.diagnostic.goto_prev()<cr>' },
--     { '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>' },
-- },
