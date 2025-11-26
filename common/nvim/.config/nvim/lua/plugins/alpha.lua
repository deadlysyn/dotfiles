return {
    'goolord/alpha-nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'nvim-lua/plenary.nvim',
    },
    config = function()
        local theta = require('alpha.themes.theta')
        -- available: devicons, mini, default is mini
        -- if provider not loaded and enabled is true, it will try to use another provider
        theta.file_icons.provider = 'devicons'
        require('alpha').setup(theta.config)
    end,
}
