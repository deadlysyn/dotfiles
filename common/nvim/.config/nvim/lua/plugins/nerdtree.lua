local cmd = vim.cmd
local g = vim.g

cmd('autocmd BufNewFile,BufReadPost *.md set filetype=markdown')

g.NERDTreeShowHidden = 1
g.NERDTreeMinimalUI = 1
g.NERDTreeIgnore = { '^node_modules$' }
g.NERDTreeStatusline = ''
g.NERDTreeGitStatusWithFlags = 1

-- Automaticaly close nvim if NERDTree is only thing left open
cmd('autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif')
