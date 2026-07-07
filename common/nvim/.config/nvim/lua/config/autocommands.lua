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

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd('FileType', {
    group = augroup('wrap_spell'),
    pattern = { 'text', 'plaintex', 'typst', 'gitcommit', 'markdown' },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
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

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ 'FileType' }, {
    group = augroup('json_conceal'),
    pattern = { 'json', 'jsonc', 'json5' },
    callback = function()
        vim.opt_local.conceallevel = 0
    end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    group = augroup('auto_create_dir'),
    callback = function(event)
        if event.match:match('^%w%w+:[\\/][\\/]') then
            return
        end
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
    end,
})

-- Set filetype for .env and .env.* files
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    group = augroup('env_filetype'),
    pattern = { '*.env', '.env.*' },
    callback = function()
        vim.opt_local.filetype = 'sh'
    end,
})

-- Set filetype for .toml files
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    group = augroup('toml_filetype'),
    pattern = { '*.tomg-config*' },
    callback = function()
        vim.opt_local.filetype = 'toml'
    end,
})

-- Set filetype for .ejs files
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    group = augroup('ejs_filetype'),
    pattern = { '*.ejs', '*.ejs.t' },
    callback = function()
        vim.opt_local.filetype = 'embedded_template'
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
