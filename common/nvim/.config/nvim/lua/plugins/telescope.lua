-- require("telescope").load_extension("git_worktree")
require("telescope").load_extension("fzy_native")
local actions = require('telescope.actions')

require('telescope').setup({
    defaults = require('telescope.themes').get_ivy({
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        mappings = {
            i = {
                ['<esc>'] = actions.close,
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        },
    }),
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
    },
})

-- local M = {}
-- M.search_dotfiles = function()
--     require("telescope.builtin").find_files({
--         prompt_title = "< VimRC >",
--         cwd = vim.env.DOTFILES,
--         hidden = true,
--     })
-- end
-- return M
