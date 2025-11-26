return {
    'RRethy/vim-illuminate',
    -- event = 'User FileOpened',
    event = 'VimEnter',
    config = function()
        require('illuminate').configure({
            delay = 300,
            under_cursor = false,
        })
    end,
    opts = {},
}
