local M = {}

local plugin_manager = require("user.plugin-manager.lazy-nvim")

local plugins = {

    'nvim-lua/plenary.nvim',

    'neovim/nvim-lspconfig',

    require("user.plugins.auto-session"),

    require("user.plugins.cmp"),

    require("user.plugins.neodev"),

    require("user.plugins.neo-tree"),

    require("user.plugins.which-key"),

    require("user.plugins.nvim-treesitter"),

    require("user.plugins.telescope"),

    require("user.plugins.lspsaga"),

    require("user.plugins.bufferline"),

    require("user.plugins.nvim-navbuddy"),
    require("user.plugins.barbecue"),

    require("user.plugins.nvim-ufo"),

    require("user.plugins.lazygit"),
    require("user.plugins.gitsigns"),
    require("user.plugins.vgit"),

    require("user.plugins.lualine"),

    require("user.plugins.catppuccin"),

    require("user.plugins.hardtime"),
}

function M.load_all_plugins()
    plugin_manager.load_plugins(plugins, nil)
end

return M
