return {
    'folke/neodev.nvim',

     requires = {
        'neovim/nvim-lspconfig',
    },

    config = function()
        require("neodev").setup()
    end
}
