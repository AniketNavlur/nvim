return {
    'ms-jpq/coq_nvim',
    branch = 'coq',
    requires = {
        { 'ms-jpq/coq.artifacts',  branch = 'artifacts' },
        { 'ms-jpq/coq.thirdparty', branch = '3p' },
        { 'neovim/nvim-lspconfig' },
    },

    -- setup runs before plugin is loaded
    setup = function()
        vim.g.coq_settings = {
            ["auto_start"] = "shut-up",
            ["display.icons.mappings"] = require("user.symbols").get_symbols()
        }
    end
}
