require("lualine").setup({
	options = {
		theme = "gruvbox-material",
		section_separators = "",
		component_separators = "",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			{
				"diff",
				colored = true, -- displays diff status in color if set to true
				-- all colors are in format #rrggbb
				color_added = "#a9b665", -- changes diff's added foreground color
				color_modified = "#7daea3", -- changes diff's modified foreground color
				color_removed = "#ea6962", -- changes diff's removed foreground color
				symbols = { added = "+", modified = "~", removed = "-" },
			},
			"filename",
		},
		lualine_c = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				sections = { "error", "warn", "info", "hint" },
				-- all colors are in format #rrggbb
				-- diagnostics_color = {
				-- 	error = "#EA6962",
				-- 	warn = "#D8A657",
				-- 	info = "#7DAEA3",
				-- 	hint = "#7DAEA3",
				-- },
				diagnostics_color = {
					error = {
						fg = "#EA6962",
					},
					warn = {
						fg = "#D8A657",
					},
					info = {
						fg = "#7DAEA3",
					},
					hint = {
						fg = "#7DAEA3",
					},
				},
				-- symbols = { error = "E", warn = "W", info = "I", hint = "H" },
				symbols = {
					error = "",
					warn = "",
					info = "",
					hint = "ﴞ",
				},
				colored = true,
			},
		},
		lualine_x = {},
		lualine_y = { "encoding", "fileformat", "filetype" },
		lualine_z = { "progress", "location" },
	},
	-- extensions = { "quickfix" },
})
