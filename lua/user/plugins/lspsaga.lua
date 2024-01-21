return {
    'nvimdev/lspsaga.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons'
    },

    config = function()
        require('lspsaga').setup {
            symbol_in_winbar = {
                enable = false,
            },

            ui = {
                kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
            },

            finder = {
                keys = {
                    vsplit = 'v',
                    toggle_or_open = "<CR>"
                }
            },

            outline = {
                win_position = "left",
                win_with = "",
                win_width = 30,
                auto_enter = true,
                auto_preview = false,
                virt_text = "┃",
                jump_key = "<enter>",
                -- auto refresh when change buffer
                auto_refresh = true,
            }
        }

        local core = require("user.core")
        core.cmd.register_cmd("editor.action.goto_references", "Lspsaga finder")
    end,
}
