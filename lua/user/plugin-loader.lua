local M = {}

local plugin_manager = require("user.plugin-manager.lazy-nvim")

local plugins = {

    'dstein64/vim-startuptime',

    'nvim-lua/plenary.nvim',

    'neovim/nvim-lspconfig',

    require("user.plugins.cmp"),

    require("user.plugins.nvim-treesitter"),

    require("user.plugins.neo-tree"),

    require("user.plugins.trouble"),

    require("user.plugins.telescope"),

    require("user.plugins.which-key"),

    require("user.plugins.lualine"),

    require("user.plugins.bufferline"),

    require("user.plugins.nvim-navbuddy"),
    require("user.plugins.barbecue"),

    require("user.plugins.gitsigns"),
    require("user.plugins.lazygit"),

    require("user.plugins.auto-session"),

    require("user.plugins.toggleterm"),

    require("user.plugins.catppuccin"),

    require("user.plugins.neodev"),
}

function M.load_all_plugins()
    plugin_manager.load_plugins(plugins, nil)
end

return M
