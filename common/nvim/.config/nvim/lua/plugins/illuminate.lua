return {
    'RRethy/vim-illuminate',
    enabled = true,
    event = 'VimEnter',
    config = function()
        require('illuminate').configure({
            delay = 300,
            under_cursor = false,
        })
    end,
}
