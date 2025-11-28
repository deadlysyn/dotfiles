return {
  'akinsho/bufferline.nvim',
  enabled = true,
  event = 'VimEnter',
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      themable = true, -- whether or not bufferline highlights can be overridden externally
      get_element_icon = nil,
      show_duplicate_prefix = true,
      duplicates_across_groups = true,
      auto_toggle_bufferline = true,
      move_wraps_at_ends = false,
      groups = { items = {}, options = { toggle_hidden_on_enter = true } },
      mode = 'buffers', -- set to "tabs" to only show tabpages instead
      numbers = 'none', -- can be "none" | "ordinal" | "buffer_id" | "both" | function
      right_mouse_command = 'vert sbuffer %d', -- can be a string | function, see "Mouse actions"
      left_mouse_command = 'buffer %d', -- can be a string | function, see "Mouse actions"
      middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
      indicator = {
        style = 'icon', -- can also be 'underline'|'none',
      },
      max_name_length = 18,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      truncate_names = true, -- whether or not tab names should be truncated
      tab_size = 18,
      diagnostics = 'nvim_lsp',
      diagnostics_update_in_insert = false,
      offsets = {
        {
          filetype = 'undotree',
          text = 'Undotree',
          highlight = 'PanelHeading',
          padding = 1,
        },
        {
          filetype = 'NvimTree',
          text = 'Explorer',
          highlight = 'PanelHeading',
          padding = 1,
        },
        {
          filetype = 'DiffviewFiles',
          text = 'Diff View',
          highlight = 'PanelHeading',
          padding = 1,
        },
        {
          filetype = 'flutterToolsOutline',
          text = 'Flutter Outline',
          highlight = 'PanelHeading',
        },
        {
          filetype = 'lazy',
          text = 'Lazy',
          highlight = 'PanelHeading',
          padding = 1,
        },
      },
      color_icons = true, -- whether or not to add the filetype icon highlights
      show_close_icon = false,
      show_tab_indicators = true,
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      -- can also be a table containing 2 custom separators
      -- [focused and unfocused]. eg: { '|', '|' }
      separator_style = 'thin',
      enforce_regular_tabs = false,
      always_show_bufferline = false,
      hover = {
        enabled = false, -- requires nvim 0.8+
        delay = 200,
        reveal = { 'close' },
      },
      sort_by = 'id',
    },
  },
}
