return {
    'akinsho/bufferline.nvim',
    tag = "*",
    after = 'catppuccin',
    requires = {
        'nvim-tree/nvim-web-devicons',
    },

    config = function()
        require("bufferline").setup({
            highlights = require("catppuccin.groups.integrations.bufferline").get()
        })
    end
}
