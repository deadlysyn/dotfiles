local vim = vim

vim.cmd('packadd packer.nvim')

return require('packer').startup({
    function(use)
        use('wbthomason/packer.nvim')
        use('sainnhe/gruvbox-material')
        -- telescope + dependencies
        use('nvim-lua/plenary.nvim')
        use('nvim-lua/popup.nvim')
        use('nvim-telescope/telescope.nvim')
        use('nvim-telescope/telescope-fzy-native.nvim')
        -- use('ThePrimeagen/git-worktree.nvim')
        -- status line
        use('hoob3rt/lualine.nvim')
        use('kyazdani42/nvim-web-devicons')
        -- bling
        use('editorconfig/editorconfig-vim') -- editorconfig support
        use('farmergreg/vim-lastplace') -- reopen files at your last edit position
        use('preservim/nerdtree') -- simple file tree
        use('tpope/vim-commentary') -- toggle comment
        use('tpope/vim-repeat') -- allow commands from plugin do repeat
        use('tpope/vim-surround') -- toggle surround
        use('lewis6991/gitsigns.nvim') -- git signs
        use({
            'prettier/vim-prettier', -- auto formatter
            run = 'yarn install',
        })
        use({
            'crispgm/nvim-tabline', -- tab line
            config = function()
                require('tabline').setup({})
            end,
        })
        use('RRethy/vim-illuminate') -- highlight hover word
        -- language support
        use({
            'nvim-treesitter/nvim-treesitter', -- treesitter
            run = ':TSUpdate',
        })
        -- use('nvim-treesitter/playground') -- treesitter playground
        -- use('nvim-treesitter/nvim-treesitter-textobjects') -- treesitter textobj e.g., class, function
        use('neovim/nvim-lspconfig') -- lsp client config
        use('glepnir/lspsaga.nvim')
        use('hrsh7th/nvim-compe') -- completion
        use('hrsh7th/vim-vsnip') -- snippets; required for some completions
        use('hrsh7th/vim-vsnip-integ') -- vsnip integration for nvim-compe
        use('mattn/emmet-vim') -- html/css snippets
        -- use('elzr/vim-json')
        -- use('stephpy/vim-yaml')
        -- use('rust-lang/rust.vim') -- rust lang support
        -- use('racer-rust/vim-racer')
        -- use('nathangrigg/vim-beancount') -- beancount ftplugin
        -- use('leafgarland/typescript-vim')
        -- use('peitalin/vim-jsx-typescript')
        -- awesome, but reducing bloat...
        -- use('tpope/vim-fugitive')
        -- use('phaazon/hop.nvim') -- jump to anywhere within 2 strokes
        -- use('crispgm/telescope-heading.nvim') -- markdown heading
        -- use('akinsho/nvim-toggleterm.lua') -- terminal
        -- use('rmagatti/auto-session') -- auto session
        -- use('rmagatti/session-lens') -- session lens for telescope
        -- use('AndrewRadev/undoquit.vim') -- restore closed tabs
        -- use('monaqa/dial.nvim') -- <c-a> <c-x> enhancement
    end,
    config = {
        display = {
            open_fn = require('packer.util').float,
        },
    },
})
