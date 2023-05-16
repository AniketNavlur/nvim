return {
    "folke/which-key.nvim",

    config = function()
        require("which-key").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            show_help = false, -- show help message on the command line when the popup is visible
            show_keys = false, -- show the currently pressed key and its label as a message in the command line         -- refer to the configuration section below
        }
    end
}
