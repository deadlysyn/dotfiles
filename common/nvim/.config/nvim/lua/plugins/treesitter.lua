return {
  'nvim-treesitter/nvim-treesitter',
  enabled = true,
  build = ':TSUpdate',
  lazy = false, -- can not be lazy loaded
  opts = {
    auto_install = true,
    ensure_installed = {
      'bash',
      'c',
      'cmake',
      'diff',
      'go',
      'hcl',
      'html',
      'javascript',
      'json',
      'lua',
      'markdown',
      'python',
      'query',
      'regex',
      'typescript',
      'terraform',
      'yaml',
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = 'gnn',
        node_incremental = 'grn',
        node_decremental = 'grc',
        scope_incremental = 'grm',
      },
    },
  },
}
