require("lualine").setup({
  options = {
    theme = "gruvbox_material",
    section_separators = '',
    component_separators = '',
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
        symbols = {added = '+', modified = '~', removed = '-'}
      },
      "filename"
    },
    lualine_c = {
      {
        "diagnostics",
        sources = { "nvim_lsp" },
        sections = {"error", "warn", "info", "hint"},
        -- all colors are in format #rrggbb
        color_error = "#ea6962",
        color_warn = "#d8a657",
        color_info = "#7daea3",
        color_hint = "#7daea3",
        symbols = {error = "E", warn = "W", info = "I", hint = "H"}
      }
    },
    lualine_x = {},
    lualine_y = { "encoding", "fileformat", "filetype" },
    lualine_z = { "progress", "location" },
  },
  extensions = { "quickfix" },
})
