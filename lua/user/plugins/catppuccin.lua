return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 100,

    config = function()
        require("catppuccin").setup({
            --[[
            dim_inactive = {
                enabled = true,
                mode = "dark",
                percentage = 0.15
            },
            --]]
            integrations = {
                aerial = true,
                telescope = true,
                cmp = true,
                neotree = true,
                neogit = true,
                which_key = true,
                gitsigns = true,
                symbols_outline = true,
                markdown = true,
                lsp_saga = true,
                ufo = true,
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                    },
                },
                navic = {
                    enabled = true,
                    custom_bg = "NONE",
                },
            },
        })

        vim.cmd.colorscheme "catppuccin"
    end
}
