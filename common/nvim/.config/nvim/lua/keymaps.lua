local keymap = vim.keymap.set

-- plugin manager
keymap('n', '<leader>ps', '<cmd>Lazy sync<cr>', { desc = 'Plugin Sync' })

-- disable search highlight
keymap(
  'n',
  '<esc>',
  '<cmd>nohlsearch<cr>',
  { desc = 'Disable search highlight' }
)

-- diagnostics
keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
-- keymap(
--     'n',
--     '<leader>d',
--     vim.diagnostic.open_float,
--     { desc = 'Display current diagnostic' }
-- )
local toggle_loclist = function()
  for _, info in ipairs(vim.fn.getwininfo()) do
    if info.loclist == 1 then
      vim.cmd 'lclose'
      return
    end
  end
  vim.diagnostic.setloclist()
end
keymap('n', '<leader>d', toggle_loclist, { desc = 'Toggle diagnostic list' })

-- git
keymap('n', '<leader>gb', '<cmd>Gitsigns blame<cr>', { desc = 'Git Blame' })
keymap('n', '<leader>gd', '<cmd>Gitsigns diffthis<cr>', { desc = 'Git Diff' })
keymap(
  'n',
  'gl',
  '<cmd>Gitsigns toggle_current_line_blame<cr>',
  { desc = 'Git toggle blame current line' }
)

-- toggle relative line numbers
keymap('n', '<leader>n', function()
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
keymap('i', '<c-a>', '<esc>I', { desc = 'Jump to beginning of word' })
keymap('i', '<c-e>', '<end>', { desc = 'Jump to end of word' })
keymap('n', 'k', 'gk', { desc = 'Wrapped lines behave the same' })
keymap('n', 'j', 'gj', { desc = 'Wrapped lines behave the same' })
keymap('n', '<c-d>', '<c-d>zz', { desc = 'Center cursor when jumping' })
keymap('n', '<c-u>', '<c-u>zz', { desc = 'Center cursor when jumping' })
keymap('n', 'n', 'nzzzv', { desc = 'Center search terms' })
keymap('n', 'N', 'Nzzzv', { desc = 'Center search terms' })
keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Easier split navigation' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Easier split navigation' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Easier split navigation' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Easier split navigation' })
keymap('n', '<up>', ':resize +2<cr>', { desc = 'Resize splits' })
keymap('n', '<down>', ':resize -2<cr>', { desc = 'Resize splits' })
keymap('n', '<left>', ':vertical resize +2<cr>', { desc = 'Resize splits' })
keymap('n', '<right>', ':vertical resize -2<cr>', { desc = 'Resize splits' })

-- editing
keymap('n', 'Y', 'y$', { desc = 'Yank to end of line' })
keymap('v', 'J', ":m '>+1<cr>gv=gv", { desc = 'Move selection - down' })
keymap('v', 'K', ":m '<-2<cr>gv=gv", { desc = 'Move selection - up' })
keymap('n', 'J', 'mzJ`z', { desc = 'Keep cursor position when joining' })

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
keymap('n', '<tab>', '<cmd>bn<cr>', { desc = 'Navigate buffers - next' })
keymap('n', '<s-tab>', '<cmd>bp<cr>', { desc = 'Navigate buffers - previous' })
