local autocmd = vim.api.nvim_create_autocmd

local function augroup(name)
    return vim.api.nvim_create_augroup('user_' .. name, { clear = true })
end

-- highlight on yank
autocmd({ 'TextYankPost' }, {
    callback = function()
        vim.highlight.on_yank({
            higroup = 'Search',
            timeout = 100,
        })
    end,
})

autocmd({ 'FileType' }, {
    callback = function()
        -- disable automatic comment insertion
        vim.opt_local.formatoptions:remove({ 'c' })
        vim.opt_local.formatoptions:remove({ 'r' })
        vim.opt_local.formatoptions:remove({ 'o' })
        -- delete comment character when joining lines
        vim.opt_local.formatoptions:append({ 'j' })
    end,
})

-- turn on spell check for select file types
autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = { '*.md', '*.rst', '*.html', '*.txt' },
    callback = function()
        vim.opt_local.spell = true
    end,
})
autocmd({ 'FileType' }, {
    pattern = { 'gitcommit' },
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.textwidth = 70
    end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd('BufReadPost', {
    group = augroup('last_loc'),
    callback = function(event)
        local exclude = { 'gitcommit' }
        local buf = event.buf
        if
            vim.tbl_contains(exclude, vim.bo[buf].filetype)
            or vim.b[buf].lazyvim_last_loc
        then
            return
        end
        vim.b[buf].lazyvim_last_loc = true
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- use four space tabs for python
autocmd({ 'FileType' }, {
    pattern = 'py',
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.tabstop = 4
    end,
})

autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = { '*.hcl', '.terraformrc', 'terraform.rc' },
    callback = function()
        vim.opt_local.filetype = 'hcl'
    end,
})

autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = { '*.tf', '.tfvars' },
    callback = function()
        vim.opt_local.filetype = 'terraform'
    end,
})

autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = { '*.tfstate', '.tfstate.backup' },
    callback = function()
        vim.opt_local.filetype = 'json'
    end,
})
