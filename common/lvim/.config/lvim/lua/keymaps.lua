-- toggle neotree
lvim.builtin.which_key.mappings["e"] = {
	"<cmd>Neotree toggle<CR>",
	"", -- this is required!
}

-- toggle git blame - need to figure out a good keymap
-- lvim.keys.normal_mode['<leader>?'] = ':Gitsigns toggle_current_line_blame<CR>'

-- <tab> and <shift-tab> navigation
lvim.keys.normal_mode["<tab>"] = ":bn<CR>"
lvim.keys.normal_mode["<s-tab>"] = ":bp<CR>"

-- move selected lines up/down
lvim.keys.visual_mode["J"] = ":m '>+1<CR>gv=gv"
lvim.keys.visual_mode["K"] = ":m '<-2<CR>gv=gv"

-- keep cursor at same place when joining
lvim.keys.normal_mode["J"] = "mzJ`z"
-- keep cursor in middle of screen when jumping
lvim.keys.normal_mode["<c-d>"] = "<c-d>zz"
lvim.keys.normal_mode["<c-u>"] = "<c-u>zz"
-- keep search terms in middle
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"

-- paste over selection without loosing buffer content
lvim.keys.visual_mode["<leader>p"] = '"_dP'

-- <leader>y yanks to system clipboard
lvim.keys.normal_mode["<leader>y"] = '"+y'
lvim.keys.normal_mode["<leader>Y"] = '"+Y'
lvim.keys.visual_mode["<leader>y"] = '"+y'

-- does anyone use this?
lvim.keys.normal_mode["Q"] = "<nop>"
