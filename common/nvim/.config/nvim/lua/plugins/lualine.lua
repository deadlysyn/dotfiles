require("lualine").setup({
	options = {
		theme = "gruvbox_material",
		section_separators = '',
		component_separators = '',
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff" },
		-- lualine_c = { 'filename' },
		lualine_c = {
			{ "diagnostics", sources = { "nvim_lsp" } },
			"filename",
		},
		lualine_x = {},
		lualine_y = { "encoding", "fileformat", "filetype" },
		lualine_z = { "progress", "location" },
	},
	extensions = { "quickfix" },
})
