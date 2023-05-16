return {
    'folke/neodev.nvim',

     dependencies = {
        'neovim/nvim-lspconfig',
    },

    config = function()
        require("neodev").setup()
    end
}
