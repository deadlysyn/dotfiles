return {
    'nvim-neo-tree/neo-tree.nvim',
    enabled = true,
    lazy = false,
    -- branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
        'nvim-tree/nvim-web-devicons',
        { 'folke/snacks.nvim', lazy = false, priority = 1000, opts = {} },
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
        },
    },
}
