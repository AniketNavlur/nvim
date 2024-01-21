return {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
        "neovim/nvim-lspconfig",
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
    },

    config = function()
        local function on_attach(client, bufnr)
            local status_ok, navbuddy = pcall(require, "nvim-navbuddy")

            if not status_ok then
                vim.notify("nvim-navic attach failed")
                return
            end

            navbuddy.attach(client, bufnr)
        end

        local lsp = require("user.lsp")
        lsp.attach(on_attach)

        require("nvim-navic").setup {
            lsp = {
                auto_attach = false,
            },
            highlight = true,
        }

        require("nvim-navbuddy").setup {
            window = {
                size = "97%", -- Or table format example: { height = "40%", width = "100%"}
                --position = "50%", -- Or table format example: { row = "100%", col = "0%"}
                sections = {
                    left  = {
                        size = "15%",
                    },
                    mid   = {
                        size = "20%",
                    },
                    right = {
                        preview = "always", -- Options: "leaf", "always" or "never"
                    }
                },
            },
        }

        local core = require("user.core")
        core.cmd.register_cmd("workbench.view.symbol-navigator", "Navbuddy")
    end
}
