return {
    'RRethy/vim-illuminate',
    enabled = true,
    event = 'User FileOpened',

    config = function()
        require('illuminate').configure({
            delay = 300,
            under_cursor = false,
        })
    end,

    opts = {},
}
