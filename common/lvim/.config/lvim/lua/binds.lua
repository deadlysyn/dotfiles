-- toggle neotree
lvim.builtin.which_key.mappings['e'] = {
  '<cmd>Neotree toggle<CR>',
  '',
}

-- <tab> and <shift-tab> navigation
lvim.keys.normal_mode['<tab>'] = ':bn<CR>'
lvim.keys.normal_mode['<s-tab>'] = ':bp<CR>'
