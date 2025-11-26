return {
    'nvim-neo-tree/neo-tree.nvim',
    -- cmd = { 'Neotree toggle', 'Neotree focus' },
    -- event = 'User DirOpened',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
        'folke/snacks.nvim',
        'antosha417/nvim-lsp-file-operations',
        's1n7ax/nvim-window-picker',
    },
    keys = {
        { '<leader>e', '<cmd>Neotree toggle<cr>' },
    },
    opts = {
        close_if_last_window = true,
        popup_border_style = '',
        filesystem = {
            use_libuv_file_watcher = true,
            follow_current_file = {
                enabled = true,
            },
            filtered_items = {
                visible = true,
                -- hide_dotfiles = false,
                -- hide_gitignored = false,
                -- hide_ignored = false,
            },
        },
    },
}
