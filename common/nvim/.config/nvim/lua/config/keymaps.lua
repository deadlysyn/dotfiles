local map = vim.keymap.set

map(
    'n',
    '<leader>pu',
    '<cmd>lua vim.pack.update()<cr>',
    { desc = 'Plugin Update' }
)

map('n', '<esc>', '<cmd>nohlsearch<cr>', { desc = 'Disable search highlight' })

map('n', '<leader>gb', '<cmd>Gitsigns blame<cr>', { desc = 'Git Blame' })
map('n', '<leader>gd', '<cmd>Gitsigns diffthis<cr>', { desc = 'Git Diff' })
map(
    'n',
    'gl',
    '<cmd>Gitsigns toggle_current_line_blame<cr>',
    { desc = 'Git toggle blame current line' }
)

map('n', '<leader>rn', function()
    if vim.o.number == false then
        vim.o.number = true
        vim.o.relativenumber = true
    elseif vim.o.relativenumber == true then
        vim.o.number = true
        vim.o.relativenumber = false
    else
        vim.o.number = false
        vim.o.relativenumber = false
    end
end, { desc = 'Toggle line numbers' })

-- navigation
map('i', '<c-a>', '<esc>I', { desc = 'Jump to beginning of word' })
map('i', '<c-e>', '<end>', { desc = 'Jump to end of word' })
map('n', 'k', 'gk', { desc = 'Wrapped lines behave the same' })
map('n', 'j', 'gj', { desc = 'Wrapped lines behave the same' })
map('n', '<c-d>', '<c-d>zz', { desc = 'Center cursor when jumping' })
map('n', '<c-u>', '<c-u>zz', { desc = 'Center cursor when jumping' })
map('n', 'n', 'nzzzv', { desc = 'Center search terms' })
map('n', 'N', 'Nzzzv', { desc = 'Center search terms' })
map('n', '<up>', ':resize +2<cr>', { desc = 'Resize splits' })
map('n', '<down>', ':resize -2<cr>', { desc = 'Resize splits' })
map('n', '<left>', ':vertical resize +2<cr>', { desc = 'Resize splits' })
map('n', '<right>', ':vertical resize -2<cr>', { desc = 'Resize splits' })

-- editing
map('n', 'Y', 'y$', { desc = 'Yank to end of line' })
map('v', 'J', ":m '>+1<cr>gv=gv", { desc = 'Move selection - down' })
map('v', 'K', ":m '<-2<cr>gv=gv", { desc = 'Move selection - up' })
map('n', 'J', 'mzJ`z', { desc = 'Keep cursor position when joining' })

-- buffers
map('n', '<Tab>', ':bnext<CR>', { desc = 'Next buffer' })
map('n', '<S-Tab>', ':bprevious<CR>', { desc = 'Previous buffer' })
map('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
map('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
map('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
map('n', ']b', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
map('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })

-- windows
map('n', '<C-h>', '<C-w>h', { desc = 'Go to Left Window', remap = true })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to Lower Window', remap = true })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to Upper Window', remap = true })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to Right Window', remap = true })
map('n', '<leader>ww', '<C-W>p', { desc = 'Other Window', remap = true })
map('n', '<leader>wd', '<C-W>c', { desc = 'Delete Window', remap = true })
map('n', '<leader>w-', '<C-W>s', { desc = 'Split Window Below', remap = true })
map('n', '<leader>w|', '<C-W>v', { desc = 'Split Window Right', remap = true })

-- tabs
map('n', '<leader><tab>l', '<cmd>tablast<cr>', { desc = 'Last Tab' })
map('n', '<leader><tab>o', '<cmd>tabonly<cr>', { desc = 'Close Other Tabs' })
map('n', '<leader><tab>f', '<cmd>tabfirst<cr>', { desc = 'First Tab' })
map('n', '<leader><tab><tab>', '<cmd>tabnew<cr>', { desc = 'New Tab' })
map('n', '<leader><tab>]', '<cmd>tabnext<cr>', { desc = 'Next Tab' })
map('n', '<leader><tab>d', '<cmd>tabclose<cr>', { desc = 'Close Tab' })
map('n', '<leader><tab>[', '<cmd>tabprevious<cr>', { desc = 'Previous Tab' })

-- formatting
map('n', '<leader>f', function()
    require('conform').format({
        async = true,
        lsp_format = 'fallback',
        timeout_ms = 3000,
    })
end, { desc = 'Format buffer' })
map('x', '<leader>f', function()
    require('conform').format({
        async = true,
        lsp_format = 'fallback',
        timeout_ms = 3000,
    })
end, { desc = 'Format buffer' })

-- neotree
map('n', '<leader>e', '<cmd>Neotree toggle<cr>', { desc = 'Toggle Neotree' })

-- telescope
-- See `:help telescope.builtin`
-- local builtin = require('telescope.builtin')
-- map('n', '<leader>sh', builtin.help_tags, { desc = 'Search Help' })
-- map('n', '<leader>sk', builtin.keymaps, { desc = 'Search Keymaps' })
-- map('n', '<leader>sf', builtin.find_files, { desc = 'Search Files' })
-- map('n', '<leader>sw', builtin.grep_string, { desc = 'Search current Word' })
-- map('n', '<leader>sg', builtin.live_grep, { desc = 'Search by Grep' })
-- map('n', '<leader>sd', builtin.diagnostics, { desc = 'Search Diagnostics' })
-- map('n', '<leader>sr', builtin.resume, { desc = 'Search Resume' })
-- map('n', '<leader>s.', builtin.oldfiles, { desc = 'Search Recent Files' })
-- map('n', '<leader><leader>', builtin.buffers, { desc = 'Search buffers' })

-- Slightly advanced example of overriding default behavior and theme
-- map('n', '<leader>/', function()
--     -- You can pass additional configuration to Telescope to change the theme, layout, etc.
--     builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
--         winblend = 10,
--         previewer = false,
--     }))
-- end, { desc = 'Fuzzy search in current buffer' })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
-- map('n', '<leader>s/', function()
--     builtin.live_grep({
--         grep_open_files = true,
--         prompt_title = 'Live Grep in Open Files',
--     })
-- end, { desc = 'Search open files' })

-- Shortcut for searching your Neovim configuration files
-- map('n', '<leader>sn', function()
--     builtin.find_files({ cwd = vim.fn.stdpath('config') })
-- end, { desc = 'Search Neovim files' })
