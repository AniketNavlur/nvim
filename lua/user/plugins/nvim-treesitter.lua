return {
    'nvim-treesitter/nvim-treesitter',

    config = function()
        require('nvim-treesitter.install').update { with_sync = true }

        require("nvim-treesitter.configs").setup {
            ensure_installed = "all",
            sync_install = false,
            highlight = {
                enable = true,    -- false will disable the whole extension
                disable = { "" }, -- list of language that will be disabled
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true, disable = { "yaml" } },
        }
    end
}
