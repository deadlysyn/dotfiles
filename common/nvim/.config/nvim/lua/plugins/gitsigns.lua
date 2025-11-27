return {
    'lewis6991/gitsigns.nvim',
    enabled = true,
    event = 'User FileOpened',
    cmd = 'Gitsigns',
    opts = {
        current_line_blame = true,
        current_line_blame_opts = {
            delay = 1000,
            ignore_whitespace = false,
        },
        linehl = false,
        numhl = false,
        signcolumn = true,
        word_diff = false,
        watch_gitdir = {
            interval = 1000,
            follow_files = true,
        },
        signs = {
            add = {
                hl = 'GitSignsAdd',
                text = '▎',
                numhl = 'GitSignsAddNr',
                linehl = 'GitSignsAddLn',
            },
            change = {
                hl = 'GitSignsChange',
                text = '▎',
                numhl = 'GitSignsChangeNr',
                linehl = 'GitSignsChangeLn',
            },
            delete = {
                hl = 'GitSignsDelete',
                text = '󰐊',
                numhl = 'GitSignsDeleteNr',
                linehl = 'GitSignsDeleteLn',
            },
            topdelete = {
                hl = 'GitSignsDelete',
                text = '󰐊',
                numhl = 'GitSignsDeleteNr',
                linehl = 'GitSignsDeleteLn',
            },
            changedelete = {
                hl = 'GitSignsChange',
                text = '▎',
                numhl = 'GitSignsChangeNr',
                linehl = 'GitSignsChangeLn',
            },
        },
    },
}
