require("lualine").setup({
  options = {
    theme = "gruvbox_material",
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "filename" },
    lualine_c = {
      {
        "diagnostics",
        sources = { "nvim_lsp" },
        sections = {"error", "warn", "info", "hint"},
        -- all colors are in format #rrggbb
        color_error = "#aa0000",
        color_warn = "#aaaa00",
        color_info = "#aaaaaa",
        color_hint = "#aaaaaa",
        symbols = {error = "E", warn = "W", info = "I", hint = "H"}
      }
    },
    lualine_x = {},
    lualine_y = { "encoding", "fileformat", "filetype" },
    lualine_z = { "progress", "location" },
  },
  extensions = { "quickfix" },
})
