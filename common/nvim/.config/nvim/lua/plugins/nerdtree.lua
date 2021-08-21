local cmd = vim.cmd
local g = vim.g

cmd('autocmd BufNewFile,BufReadPost *.md set filetype=markdown')

g.markdown_fenced_languages = { 'html', 'css', 'bash=sh', 'javascript', 'go' }
g.markdown_syntax_conceal = 0

