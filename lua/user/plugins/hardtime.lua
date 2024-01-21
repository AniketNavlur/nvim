return {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },

    config = function()
        require("hardtime").setup {
            enabled = false,
            max_count = 1000,
            disable_mouse = false,
            restricted_keys = {
                -- ignore <C-p> for quick open
                ["<C-P>"] = {}
            }
        }

        local core = require("user.core")
        core.cmd.register_cmd("editor.toggle_hardtime", "Hardtime toggle")
    end
}
