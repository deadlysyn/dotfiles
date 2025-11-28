return {
  'RRethy/vim-illuminate',
  enabled = true,
  event = 'VimEnter',
  config = function()
    require('illuminate').configure {
      delay = 300,
      under_cursor = false,
      providers = {
        'lsp',
        'treesitter',
        'regex',
      },
      filetypes_denylist = {
        'dirvish',
        'fugitive',
        'alpha',
        'NvimTree',
        'lazy',
        'neogitstatus',
        'Trouble',
        'lir',
        'Outline',
        'spectre_panel',
        'toggleterm',
        'DressingSelect',
        'TelescopePrompt',
      },
    }
  end,
}
