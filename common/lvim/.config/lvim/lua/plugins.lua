lvim.plugins = {
  { "s1n7ax/nvim-window-picker" },
  { "crispgm/nvim-go" },
  { "editorconfig/editorconfig-vim" },
  { "farmergreg/vim-lastplace" },
  -- { "hiphish/rainbow-delimiters.nvim" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        window = {
          position = "left",
          width = 40,
        },
        buffers = {
          follow_current_file = {
            enabled = true,
          },
        },
        filesystem = {
          follow_current_file = {
            enabled = true,
          },
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
              "node_modules",
            },
            never_show = {
              ".DS_Store",
              "thumbs.db",
            },
          },
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope-fzy-native.nvim",
    event = "BufRead",
  },
  -- { 'sainnhe/gruvbox-material' },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,

    config = function()
      require("catppuccin").setup({
        transparent_background = true,
      })
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
  { "tpope/vim-repeat" },
  -- { 'tpope/vim-surround', },
}

-- keep after plugins

-- must enable after installing nvim-ts-rainbow
lvim.builtin.treesitter.rainbow.enable = true

-- needs to come before setting colorscheme
-- vim.g.gruvbox_material_background = 'hard'
-- vim.g.gruvbox_better_performance = 1
-- lvim.colorscheme = 'gruvbox-material'

lvim.colorscheme = "catppuccin"
